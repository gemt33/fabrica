pragma solidity >=0.6.0 <=0.8.0;


contract Fabrica {
    struct User {
        string name;
        address uadd;
        uint256 tokens;
        uint256 postsCount;
        uint256 redeemTokens;
    }

    struct Post {
        string caption;
        string description;
        string imgIpfsHash;
        uint256 likes;
        address owner;
        string timestamp;
        mapping(address => bool) likedBy;
        // edit
        string comments;
        bool valid;
    }

    Post[] public posts;
    address public manager;
    mapping(address => bool) public users;
    uint256 public userCount;
    User[] public peeps;
    string public chatHash;

    constructor() public {
        manager = msg.sender;
        userCount = 0;
    }

    function createPost(
        string memory caption,
        string memory description,
        string memory imgIpfsHash,
        string memory timestamp
    ) public payable {
        Post memory newPost = Post({
            caption: caption,
            description: description,
            imgIpfsHash: imgIpfsHash,
            likes: 0,
            owner: msg.sender,
            timestamp: timestamp,
            comments: "",
            valid: true
        });

        posts.push(newPost);

        for (uint256 i = 0; i < peeps.length; i++) {
            if (peeps[i].uadd == msg.sender) {
                peeps[i].postsCount++;
                break;
            }
        }
    }

    function getPostsCount() public view returns (uint256) {
        return posts.length;
    }

    function likePost(uint256 index) public {
        Post storage currPost = posts[index];
        require(
            !currPost.likedBy[msg.sender],
            "You have already liked this post!"
        );
        require(msg.sender != currPost.owner, "You cannot like your own post!");

        currPost.likedBy[msg.sender] = true;
        currPost.likes++;

        address author = currPost.owner;
        for (uint256 i = 0; i < peeps.length; i++) {
            if (peeps[i].uadd == author) {
                peeps[i].tokens += 1;
                peeps[i].redeemTokens += 1;
                break;
            }
        }
    }

    function deletePost(uint256 index) public {
        Post storage currPost = posts[index];
        currPost.valid = false;
    }

    function signIn(string memory name) public payable {
        require(!users[msg.sender], "Already a user");
        users[msg.sender] = true;
        userCount++;
        User memory newUser = User({
            name: name,
            uadd: msg.sender,
            tokens: 0,
            redeemTokens: 0,
            postsCount: 0
        });
        peeps.push(newUser);
    }

    function isUser(address user) public view returns (bool) {
        return users[user];
    }

    function postComment(uint256 index, string memory comm) public {
        Post storage currPost = posts[index];
        string memory curr = string(
            abi.encodePacked(currPost.comments, comm, "/")
        );
        currPost.comments = curr;
    }

    function getUserDetails(address addr)
        public
        view
        returns (string memory, uint256, uint256, uint256)
    {
        for (uint256 i = 0; i < peeps.length; i++) {
            if (peeps[i].uadd == addr) {
                User storage user = peeps[i];
                return (
                    user.name,
                    user.tokens,
                    user.postsCount,
                    user.redeemTokens
                );
            }
        }
    }

    function redeemNTokens(uint256 ntokens, uint256 value) public {
        // uint256 value = ntokens / 1000;
        address(uint256(msg.sender)).transfer(value);

        for (uint256 i = 0; i < peeps.length; i++) {
            if (peeps[i].uadd == msg.sender) {
                peeps[i].redeemTokens -= ntokens;
                break;
            }
        }
    }

    function setChatHash(string memory chash) public {
        chatHash = chash;
    }

    function getContractBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
