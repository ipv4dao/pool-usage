# pool_usage

## Overview

The purpose of this document is to outline the process for organizing the vote on IPv4DAO address pool usage.

## Background

This is the first attempt to organize the vote on IPv4DAO address pool usage. The idea is to enable each holder of Root Token to express their view on IP address pool assignment through voting.

Each token gives its owner a voting power of 100, which should be distributed between 4 types of pool assignments. For example, you may want to assign 80 to growth/monetization, 10 for grants, 5 for internal use by DAO members, and set 5 for liquidation.

There is no limit on vote frequency, so any holder can change their mind whenever they want. The "results" struct shows the sum of all members' settings. If the member has 5 tokens, their bet is multiplied by 5.

From this struct, we can extract the community's preferences on pool resource assignment, which serves as a guide for the teams responsible for pool allocation.
