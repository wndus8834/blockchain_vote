pragma solidity ^0.4.11;

contract voteContract {

    mapping (address => bool) voters; // �ϳ��� ���� �� �� ���� ��ǥ�� ����
    mapping (string => uint) candidates; // �ĺ����� ��ǥ���� �����մϴ�.
    mapping (uint8 => string) candidateList; // �ĺ����� ����Ʈ�Դϴ�.

    uint8 numberOfCandidates; // �� �ĺ����� ���Դϴ�.
    address contractOwner;

    function voteContract() {
        contractOwner = msg.sender;
    }

    // �ĺ��ڸ� �߰��ϴ� �Լ��Դϴ�.
    function addCandidate(string cand) {
        bool add = true;
        for (uint8 i = 0; i < numberOfCandidates; i++) {
        
            // ���ڿ� �񱳴� �ؽ��Լ�(sha3)�� ���ؼ� �� �� �ֽ��ϴ�.
            // �ָ���Ƽ���� ���ڿ� �񱳿� ���� Ư���� �Լ��� �����ϴ�.
            if(sha3(candidateList[i]) == sha3(cand)){
                add = false; break;
            }
        }

        if(add) {
            candidateList[numberOfCandidates] = cand;
            numberOfCandidates++;
        }
    }

    // ��ǥ�� �ϴ� �Լ��Դϴ�.
    function vote(string cand) {
        // �ϳ��� ������ �ѹ��� ��ǥ�� ����� �ݿ��˴ϴ�.
        if(voters[msg.sender]) { }
        else{
            voters[msg.sender] = true;
            candidates[cand]++;
        }
    }

    // �̹� ��ǥ�ߴ��� Ȯ���մϴ�.
    function alreadyVoted() constant returns(bool) {
        if(voters[msg.sender])
            return true;
        else
            return false;
    }

    //�ĺ����� ���� �����մϴ�.
    function getNumOfCandidates() constant returns(uint8) {
        return numberOfCandidates;
    }

    //��ȣ�� �ش��ϴ� �ĺ��� �̸��� �����մϴ�.
    function getCandidateString(uint8 number) constant returns(string) {
        return candidateList[number];
    }

    //�ĺ��� ��ǥ���� �����մϴ�.
    function getScore(string cand) constant returns(uint) {
        return candidates[cand];
    }

    //��Ʈ��Ʈ�� �����մϴ�.
    function killContract() {
        if(contractOwner == msg.sender)
            selfdestruct(contractOwner);
    }
}