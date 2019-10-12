VERSION = "0.7.0-alpha3"

check:
	clojure -A:check

test: cql-test
	clojure -A:test -m kaocha.runner --profile :ci

uberjar:
	clojure -A:depstar -m hf.depstar.uberjar target/blaze-${VERSION}-standalone.jar

cql-test:
	wget -P cql-test -q https://raw.githubusercontent.com/HL7/cql/v1.4-ballot/tests/cql/CqlAggregateFunctionsTest.xml
	wget -P cql-test -q https://raw.githubusercontent.com/HL7/cql/v1.4-ballot/tests/cql/CqlArithmeticFunctionsTest.xml
	wget -P cql-test -q https://raw.githubusercontent.com/HL7/cql/v1.4-ballot/tests/cql/CqlComparisonOperatorsTest.xml
	wget -P cql-test -q https://raw.githubusercontent.com/HL7/cql/v1.4-ballot/tests/cql/CqlConditionalOperatorsTest.xml
	wget -P cql-test -q https://raw.githubusercontent.com/HL7/cql/v1.4-ballot/tests/cql/CqlDateTimeOperatorsTest.xml
	wget -P cql-test -q https://raw.githubusercontent.com/HL7/cql/v1.4-ballot/tests/cql/CqlErrorsAndMessagingOperatorsTest.xml
	wget -P cql-test -q https://raw.githubusercontent.com/HL7/cql/v1.4-ballot/tests/cql/CqlIntervalOperatorsTest.xml
	wget -P cql-test -q https://raw.githubusercontent.com/HL7/cql/v1.4-ballot/tests/cql/CqlListOperatorsTest.xml
	wget -P cql-test -q https://raw.githubusercontent.com/HL7/cql/v1.4-ballot/tests/cql/CqlLogicalOperatorsTest.xml
	wget -P cql-test -q https://raw.githubusercontent.com/HL7/cql/v1.4-ballot/tests/cql/CqlNullologicalOperatorsTest.xml
	wget -P cql-test -q https://raw.githubusercontent.com/HL7/cql/v1.4-ballot/tests/cql/CqlStringOperatorsTest.xml
	wget -P cql-test -q https://raw.githubusercontent.com/HL7/cql/v1.4-ballot/tests/cql/CqlTypeOperatorsTest.xml
	wget -P cql-test -q https://raw.githubusercontent.com/HL7/cql/v1.4-ballot/tests/cql/CqlTypesTest.xml
	wget -P cql-test -q https://raw.githubusercontent.com/HL7/cql/v1.4-ballot/tests/cql/ValueLiteralsAndSelectors.xml

.PHONY: check test uberjar
