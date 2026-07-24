try {
    rs.status();
    print("Replica Set already initialized");
} catch (e) {
    rs.initiate({
        _id: "smart-home-rs",
        members: [
            { _id: 0, host: "mongo-1:27017" },
            { _id: 1, host: "mongo-2:27017" },
            { _id: 2, host: "mongo-3:27017" }
        ]
    });
}