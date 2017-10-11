defmodule Ethereumex.HttpClientTest do
  use ExUnit.Case
  alias Ethereumex.HttpClient

  @moduletag :http

  setup_all do
    HttpClient.start_link

    :ok
  end

  describe "HttpClient.web3_client_version/0" do
    test "returns client version" do
      result = HttpClient.web3_client_version

      {:ok, <<_::binary>>} = result
    end
  end

  describe "HttpClient.web3_sha3/1" do
    test "returns sha3 of the given data" do
      result = HttpClient.web3_sha3("0x68656c6c6f20776f726c64")

      {
        :ok,
        "0x47173285a8d7341e5e972fc677286384f802f8ef42a5ec5f03bbfa254cb01fad"
      } = result
    end
  end

  describe "HttpClient.net_version/0" do
    test "returns network id" do
      result = HttpClient.net_version

      {:ok, <<_::binary>>} = result
    end
  end

  describe "HttpClient.net_peer_count/0" do
    test "returns number of peers currently connected to the client" do
      result = HttpClient.net_peer_count

      {:ok, <<_::binary>>} = result
    end
  end

  describe "HttpClient.net_listening/0" do
    test "returns true" do
      result = HttpClient.net_listening

      {:ok, true} = result
    end
  end


  describe "HttpClient.eth_protocol_version/0" do
    test "returns true" do
      result = HttpClient.eth_protocol_version

      {:ok, <<_::binary>>} = result
    end
  end

  describe "HttpClient.eth_syncing/1" do
    test "checks sync status" do
      result = HttpClient.eth_syncing

      {:ok, %{}} = result
    end
  end

  describe "HttpClient.eth_coinbase/1" do
    test "returns coinbase address" do
      result = HttpClient.eth_coinbase

      {:ok, <<_::binary>>} = result
    end
  end

  describe "HttpClient.eth_mining/1" do
    test "checks mining status" do
      result = HttpClient.eth_mining

      {:ok, false} = result
    end
  end

  describe "HttpClient.eth_hashrate/1" do
    test "returns hashrate" do
      result = HttpClient.eth_hashrate

      {:ok, <<_::binary>>} = result
    end
  end

  describe "HttpClient.eth_gas_price/1" do
    test "returns current price per gas" do
      result = HttpClient.eth_gas_price

      {:ok, <<_::binary>>} = result
    end
  end

  describe "HttpClient.eth_accounts/1" do
    test "returns addresses owned by client" do
      result = HttpClient.eth_accounts

      {:ok, [_]} = result
    end
  end

  describe "HttpClient.eth_block_number/1" do
    test "returns number of most recent block" do
      result = HttpClient.eth_block_number

      {:ok, <<_::binary>>} = result
    end
  end

  describe "HttpClient.eth_get_balance/3" do
    test "returns balance of given account" do
      result = HttpClient.eth_get_balance("0x001bdcde60cb916377a3a3bf4e8054051a4d02e7")

      {:ok, <<_::binary>>} = result
    end
  end

  describe "HttpClient.eth_get_storage_at/4" do
    test "returns value from a storage position at a given address." do
      result = HttpClient.eth_get_balance(
        "0x001bdcde60cb916377a3a3bf4e8054051a4d02e7",
        "0x0"
      )

      {:ok, <<_::binary>>} = result
    end
  end

  describe "HttpClient.eth_get_transaction_count/3" do
    test "returns number of transactions sent from an address." do
      result = HttpClient.eth_get_transaction_count("0x001bdcde60cb916377a3a3bf4e8054051a4d02e7")

      {:ok, <<_::binary>>} = result
    end
  end

  describe "HttpClient.eth_get_block_transaction_count_by_hash/2" do
    test "number of transactions in a block from a block matching the given block hash" do
      result = HttpClient.eth_get_block_transaction_count_by_hash("0xb903239f8543d04b5dc1ba6579132b143087c68db1b2168786408fcbce568238")

      {:ok, nil} = result
    end
  end

  describe "HttpClient.eth_get_block_transaction_count_by_number/2" do
    test "returns number of transactions in a block from a block matching the given block number" do
      result = HttpClient.eth_get_block_transaction_count_by_number()

      {:ok, <<_::binary>>} = result
    end
  end

  describe "HttpClient.eth_get_uncle_count_by_block_hash/2" do
    test "the number of uncles in a block from a block matching the given block hash" do
      result = HttpClient.eth_get_uncle_count_by_block_hash("0xb903239f8543d04b5dc1ba6579132b143087c68db1b2168786408fcbce568238")

      {:ok, nil} = result
    end
  end

  describe "HttpClient.eth_get_uncle_count_by_block_number/2" do
    test "the number of uncles in a block from a block matching the given block hash" do
      result = HttpClient.eth_get_uncle_count_by_block_number

      {:ok, <<_::binary>>} = result
    end
  end

  describe "HttpClient.eth_get_code/3" do
    test "returns code at a given address" do
      result = HttpClient.eth_get_code("0xa94f5374fce5edbc8e2a8697c15331677e6ebf0b")

      {:ok, <<_::binary>>} = result
    end
  end

  describe "HttpClient.eth_sign/3" do
    test "returns signature" do
      result = HttpClient.eth_sign("0x001bdcde60cb916377a3a3bf4e8054051a4d02e7", "0xdeadbeaf")

      {:ok, <<_::binary>>} = result
    end
  end

  # describe "HttpClient.eth_send_transaction/2" do
  #   test "sends transaction" do
  #     transaction =
  #       %{
  #         "from" => "0x001bdcde60cb916377a3a3bf4e8054051a4d02e7",
  #         "data" => ""
  #       }
  #     result = HttpClient.eth_send_transaction(transaction)

  #     {:ok, <<_::binary>>} = result
  #   end
  # end

  # describe "HttpClient.eth_send_raw_transaction/2" do
  #   test "sends transaction" do
  #     data = "0xd46e8dd67c5d32be8d46e8dd67c5d32be8058bb8eb970870f072445675058bb8eb970870f072445675"
  #     result = HttpClient.eth_send_raw_transaction(data)

  #     {
  #       :ok,
  #       %{
  #         "id" => _,
  #         "jsonrpc" => "2.0",
  #         "result" => _
  #       }
  #     } = result
  #   end
  # end

  describe "HttpClient.eth_estimate_gas/3" do
    test "estimates gas" do
      data = "0x6060604052341561" <>
         "000f57600080fd5b60b38061001d6000396000f3006060604052" <>
         "63ffffffff7c0100000000000000000000000000000000000000" <>
         "00000000000000000060003504166360fe47b181146045578063" <>
         "6d4ce63c14605a57600080fd5b3415604f57600080fd5b605860" <>
         "0435607c565b005b3415606457600080fd5b606a6081565b6040" <>
         "5190815260200160405180910390f35b600055565b6000549056" <>
         "00a165627a7a7230582033edcee10845eead909dccb4e95bb7e4" <>
         "062e92234bf3cfaf804edbd265e599800029"
      from = "0x001bdcde60cb916377a3a3bf4e8054051a4d02e7"
      transaction = %{data: data, from: from}

      result = HttpClient.eth_estimate_gas(transaction)

      {:ok, <<_::binary>>} = result
    end
  end

  describe "HttpClient.eth_get_block_by_hash/3" do
    test "returns information about a block by hash" do
      result = HttpClient.eth_get_block_by_hash("0xb903239f8543d04b5dc1ba6579132b143087c68db1b2168786408fcbce568238", true)

      {:ok, nil} = result
    end
  end

  describe "HttpClient.eth_get_block_by_number/3" do
    test "returns information about a block by number" do
      result = HttpClient.eth_get_block_by_number("0x1b4", true)

      {:ok, %{}} = result
    end
  end

  describe "HttpClient.eth_get_transaction_by_hash/2" do
    test "returns the information about a transaction by its hash" do
      result = HttpClient.eth_get_transaction_by_hash("0xb903239f8543d04b5dc1ba6579132b143087c68db1b2168786408fcbce568238")

      {:ok, nil} = result
    end
  end

  describe "HttpClient.eth_get_transaction_by_block_hash_and_index/3" do
    test "returns the information about a transaction by block hash and index" do
      result = HttpClient.eth_get_transaction_by_block_hash_and_index("0xb903239f8543d04b5dc1ba6579132b143087c68db1b2168786408fcbce568238", "0x0")

      {:ok, nil} = result
    end
  end

  describe "HttpClient.eth_get_transaction_by_block_number_and_index/3" do
    test "returns the information about a transaction by block number and index" do
      result = HttpClient.eth_get_transaction_by_block_number_and_index("earliest", "0x0")

      {:ok, nil} = result
    end
  end

  describe "HttpClient.eth_get_transaction_receipt/2" do
    test "returns the receipt of a transaction by transaction hash" do
      result = HttpClient.eth_get_transaction_receipt("0xb903239f8543d04b5dc1ba6579132b143087c68db1b2168786408fcbce568238")

      {:ok, nil} = result
    end
  end

  describe "HttpClient.eth_get_uncle_by_block_hash_and_index/3" do
    test "returns information about a uncle of a block by hash and uncle index position" do
      result = HttpClient.eth_get_uncle_by_block_hash_and_index("0xc6ef2fc5426d6ad6fd9e2a26abeab0aa2411b7ab17f30a99d3cb96aed1d1055b", "0x0")

      {:ok, nil} = result
    end
  end

  describe "HttpClient.eth_get_uncle_by_block_number_and_index/3" do
    test "returns information about a uncle of a block by number and uncle index position" do
      result = HttpClient.eth_get_uncle_by_block_number_and_index("0x29c", "0x0")

      {:ok, nil} = result
    end
  end

  # describe "HttpClient.eth_get_compilers/1" do
  #   test "returns a list of available compilers in the client" do
  #     result = HttpClient.eth_get_compilers

  #     {:ok, _} = result
  #   end
  # end

  describe "HttpClient.eth_get_compilers/1" do
    test "returns a list of available compilers in the client" do
      result = HttpClient.eth_get_compilers

      {:ok, _} = result
    end
  end

  describe "HttpClient.eth_new_filter/2" do
    test "creates a filter object" do
      filter = %{
        fromBlock: "0x1",
        toBlock: "0x2",
        address: "0x8888f1f195afa192cfee860698584c030f4c9db1",
        topics: [
          "0x000000000000000000000000a94f5374fce5edbc8e2a8697c15331677e6ebf0b",
          nil,
          [
            "0x000000000000000000000000a94f5374fce5edbc8e2a8697c15331677e6ebf0b",
            "0x0000000000000000000000000aff3454fce5edbc8cca8697c15331677e6ebccc"
          ]
        ]
      }

      result = HttpClient.eth_new_filter(filter)

      {:ok, <<_::binary>>} = result
    end
  end

  describe "HttpClient.eth_new_12" do
    test "creates a filter object" do
      filter = %{
        fromBlock: "0x1",
        toBlock: "0x2",
        address: "0x8888f1f195afa192cfee860698584c030f4c9db1",
        topics: [
          "0x000000000000000000000000a94f5374fce5edbc8e2a8697c15331677e6ebf0b",
          nil,
          [
            "0x000000000000000000000000a94f5374fce5edbc8e2a8697c15331677e6ebf0b",
            "0x0000000000000000000000000aff3454fce5edbc8cca8697c15331677e6ebccc"
          ]
        ]
      }

      result = HttpClient.eth_new_filter(filter)

      {:ok, <<_::binary>>} = result
    end
  end

  describe "HttpClient.eth_new_block_filter/1" do
    test "creates new block filter" do
      result = HttpClient.eth_new_block_filter

      {:ok, <<_::binary>>} = result
    end
  end

  describe "HttpClient.eth_new_pending_transaction_filter/1" do
    test "creates new pending transaction filter" do
      result = HttpClient.eth_new_pending_transaction_filter

      {:ok, <<_::binary>>} = result
    end
  end

  describe "HttpClient.eth_uninstall_filter/2" do
    test "uninstalls a filter with given id" do
      result = HttpClient.eth_uninstall_filter("0xb")

      {:ok, false} = result
    end
  end

  describe "HttpClient.eth_get_filter_changes/2" do
    test "returns an array of logs which occurred since last poll" do
      result = HttpClient.eth_get_filter_changes("0x16")

      {:ok, []} = result
    end
  end

  describe "HttpClient.eth_get_filter_logs/2" do
    test "returns an array of all logs matching filter with given id" do
      result = HttpClient.eth_get_filter_logs("0x16")

      {:ok, []} = result
    end
  end

  describe "HttpClient.eth_get_logs/2" do
    test "returns an array of all logs matching a given filter object" do
      filter =
        %{
          topics: ["0x000000000000000000000000a94f5374fce5edbc8e2a8697c15331677e6ebf0b"]
         }
      result = HttpClient.eth_get_logs(filter)

      {:ok, []} = result
    end
  end

  describe "HttpClient.eth_submit_work/4" do
    @tag :skip
    test "validates solution" do
      result = HttpClient.eth_submit_work(
        "0x0000000000000001",
        "0x1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef",
        "0xD1FE5700000000000000000000000000D1FE5700000000000000000000000000"
      )

      {:ok, false} = result
    end
  end

  describe "HttpClient.eth_get_work/1" do
    @tag :skip
    test "returns the hash of the current block, the seedHash, and the boundary condition to be met " do
      result = HttpClient.eth_get_work

      {:ok, [<<_::binary>>, <<_::binary>>, <<_::binary>>]} = result
    end
  end

  describe "HttpClient.eth_submit_hashrate/3" do
    test "submits mining hashrate" do
      result = HttpClient.eth_submit_hashrate(
          "0x0000000000000000000000000000000000000000000000000000000000500000",
          "0x59daa26581d0acd1fce254fb7e85952f4c09d0915afd33d3886cd914bc7d283c"
        )

      {:ok, true} = result
    end
  end

  describe "HttpClient.db_put_string/4" do
    @tag :skip
    test "stores a string in the local database" do
      result = HttpClient.db_put_string("testDB", "myKey", "myString")

      {:ok, true} = result
    end
  end

  describe "HttpClient.db_get_string/3" do
    @tag :skip
    test "returns string from the local database" do
      result = HttpClient.db_get_string("db", "key")

      {:ok, nil} = result
    end
  end

  describe "HttpClient.batch_request/1" do
    test "sends batch request" do
      requests = [
        {:web3_client_version, []},
        {:net_version, []},
        {:web3_sha3, ["0x68656c6c6f20776f726c64"]}
      ]
      result = HttpClient.batch_request(requests)

      {
        :ok,
        [
          <<_::binary>>,
          <<_::binary>>,
          "0x47173285a8d7341e5e972fc677286384f802f8ef42a5ec5f03bbfa254cb01fad"
        ]
      } = result
    end
  end
end
