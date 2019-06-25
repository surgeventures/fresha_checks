defmodule FreshaChecks.ContractTestsTest do
  use FreshaChecks.CheckCase

  @described_check FreshaChecks.ContractTests

  test "success" do
    source_file = """
      defmodule Invoicing do

      end

      defmodule InvoicingTest do

      end
    """

    [source_file]
    |> to_source_files
    |> refute_issues(@described_check)
  end

  test "failure" do
    source_file = """
      defmodule Invoicing do

      end
    """

    [source_file]
    |> to_source_files
    |> assert_issue(@described_check)
  end
end
