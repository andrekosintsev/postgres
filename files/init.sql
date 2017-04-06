CREATE OR REPLACE FUNCTION inttobool(num int, val bool) RETURNS bool AS '
    BEGIN
        IF num=0 AND NOT val THEN
            RETURN true;
        ELSIF num<>0 AND val THEN
            RETURN true;
        ELSE
            RETURN false;
        END IF;
    END;
' LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION inttobool(val bool, num int) RETURNS bool AS '
    BEGIN
        RETURN inttobool(num,val);
    END;
' LANGUAGE 'plpgsql';


DROP OPERATOR IF EXISTS = (integer, boolean);
CREATE OPERATOR = (
     leftarg = integer,
     rightarg = boolean,
     procedure = inttobool,
     commutator = =,
     negator = !=
);
DROP OPERATOR IF EXISTS = (boolean, integer);
CREATE OPERATOR = (
     leftarg = boolean,
     rightarg = integer,
     procedure = inttobool,
     commutator = =,
     negator = !=
);