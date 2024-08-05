-- Bank Loan Analysis MS SQL Project

-- Total Loan Application

    SELECT COUNT(id) AS Total_Applications 
    FROM bank_loan_data

-- Month to Date Loan Application (MTD)

    SELECT COUNT(id) AS Total_Applications 
    FROM bank_loan_data
    WHERE MONTH(issue_date) = 12

-- Previous Month to Date Loan Application (PMTD)

    SELECT COUNT(id) AS Total_Applications 
    FROM bank_loan_data
    WHERE MONTH(issue_date) = 11

-- Total Funded Amount

    SELECT SUM(loan_amount) AS Total_Funded_Amount 
    FROM bank_loan_data

-- MTD Total Funded Amount

    SELECT SUM(loan_amount) AS Total_Funded_Amount 
    FROM bank_loan_data
    WHERE MONTH(issue_date) = 12

-- PMTD Total Funded Amount

    SELECT SUM(loan_amount) AS Total_Funded_Amount 
    FROM bank_loan_data
    WHERE MONTH(issue_date) = 11

-- Total Amount Received 

    SELECT SUM(total_payment) AS Total_Amount_Collected 
    FROM bank_loan_data

-- MTD Total Amount Received 

    SELECT SUM(total_payment) AS Total_Amount_Collected 
    FROM bank_loan_data
    WHERE MONTH(issue_date) = 12

-- PMTD Total Amount Recieved 

    SELECT SUM(total_payment) AS Total_Amount_Collected 
    FROM bank_loan_data
    WHERE MONTH(issue_date) = 11

-- Average Interest Rate

    SELECT AVG(int_rate)*100 AS Avg_Int_Rate 
    FROM bank_loan_data

-- MTD Average Interest Rate

    SELECT AVG(int_rate)*100 AS MTD_Avg_Int_Rate 
    FROM bank_loan_data
    WHERE MONTH(issue_date) = 12

-- PMTD Average Interest Rate

    SELECT AVG(int_rate)*100 AS PMTD_Avg_Int_Rate 
    FROM bank_loan_data
    WHERE MONTH(issue_date) = 11

-- Average Debt to Income Ratio

    SELECT AVG(dti)*100 AS Avg_DTI 
    FROM bank_loan_data

-- MTD Average Debt to Income Ratio

    SELECT AVG(dti)*100 AS MTD_Avg_DTI 
    FROM bank_loan_data
    WHERE MONTH(issue_date) = 12

-- PMTD Average Debt to Income Ratio

    SELECT AVG(dti)*100 AS PMTD_Avg_DTI 
    FROM bank_loan_data
    WHERE MONTH(issue_date) = 11

-- Good Loan Percentage

    SELECT
    (COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100.0) 
    / 
	COUNT(id) 
    AS Good_Loan_Percentage
    FROM bank_loan_data

-- Good Loan Application

    SELECT COUNT(id) AS Good_Loan_Applications 
    FROM bank_loan_data
    WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

-- Good Loan Funded Amount

    SELECT SUM(loan_amount) AS Good_Loan_Funded_amount 
    FROM bank_loan_data
    WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

-- Good Loan Amount Received

    SELECT SUM(total_payment) AS Good_Loan_amount_received 
    FROM bank_loan_data
    WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

-- Bad Loan Percentage

    SELECT
    (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) / 
	COUNT(id) AS Bad_Loan_Percentage
    FROM bank_loan_data

-- Bad Loan Application

    SELECT COUNT(id) AS Bad_Loan_Applications 
    FROM bank_loan_data
    WHERE loan_status = 'Charged Off'

-- Bad Loan Funded Amount

    SELECT SUM(loan_amount) AS Bad_Loan_Funded_amount 
    FROM bank_loan_data
    WHERE loan_status = 'Charged Off'

-- Bad Loan Amount Recived

    SELECT SUM(total_payment) AS Bad_Loan_amount_received 
    FROM bank_loan_data
    WHERE loan_status = 'Charged Off'

-- Loan Status Analysis

    SELECT
        loan_status,
        COUNT(id) AS LoanCount,
        SUM(total_payment) AS Total_Amount_Received,
        SUM(loan_amount) AS Total_Funded_Amount,
        AVG(int_rate * 100) AS Interest_Rate,
        AVG(dti * 100) AS DTI
    FROM
        bank_loan_data
    GROUP BY
        loan_status

        
    SELECT 
	   loan_status, 
	   SUM(total_payment) AS MTD_Total_Amount_Received, 
	   SUM(loan_amount) AS MTD_Total_Funded_Amount 
    FROM bank_loan_data
    WHERE MONTH(issue_date) = 12 
    GROUP BY loan_status


-- Monthly Trend Analysis

    SELECT 
    	MONTH(issue_date) AS Month_Munber, 
    	DATENAME(MONTH, issue_date) AS Month_name, 
    	COUNT(id) AS Total_Loan_Applications,
    	SUM(loan_amount) AS Total_Funded_Amount,
    	SUM(total_payment) AS Total_Amount_Received
    FROM bank_loan_data
    GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
    ORDER BY MONTH(issue_date)

-- State-wise Analysis

    SELECT 
    	address_state AS State, 
    	COUNT(id) AS Total_Loan_Applications,
    	SUM(loan_amount) AS Total_Funded_Amount,
    	SUM(total_payment) AS Total_Amount_Received
    FROM bank_loan_data
    GROUP BY address_state
    ORDER BY address_state

-- Term

    SELECT 
    	term AS Term, 
    	COUNT(id) AS Total_Loan_Applications,
    	SUM(loan_amount) AS Total_Funded_Amount,
    	SUM(total_payment) AS Total_Amount_Received
    FROM bank_loan_data
    GROUP BY term
    ORDER BY term

-- Empolyee Length 

    SELECT 
    	emp_length AS Employee_Length, 
    	COUNT(id) AS Total_Loan_Applications,
    	SUM(loan_amount) AS Total_Funded_Amount,
    	SUM(total_payment) AS Total_Amount_Received
    FROM bank_loan_data
    GROUP BY emp_length
    ORDER BY emp_length

-- Purpose

    SELECT 
    	purpose AS PURPOSE, 
    	COUNT(id) AS Total_Loan_Applications,
    	SUM(loan_amount) AS Total_Funded_Amount,
    	SUM(total_payment) AS Total_Amount_Received
    FROM bank_loan_data
    GROUP BY purpose
    ORDER BY purpose

-- Home Ownership

    SELECT 
    	home_ownership AS Home_Ownership, 
    	COUNT(id) AS Total_Loan_Applications,
    	SUM(loan_amount) AS Total_Funded_Amount,
    	SUM(total_payment) AS Total_Amount_Received
    FROM bank_loan_data
    GROUP BY home_ownership
    ORDER BY home_ownership

-- End
