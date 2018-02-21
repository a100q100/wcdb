/*
 * Tencent is pleased to support the open source community by making
 * WCDB available.
 *
 * Copyright (C) 2017 THL A29 Limited, a Tencent company.
 * All rights reserved.
 *
 * Licensed under the BSD 3-Clause License (the "License"); you may not use
 * this file except in compliance with the License. You may obtain a copy of
 * the License at
 *
 *       https://opensource.org/licenses/BSD-3-Clause
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "WTCWINQTestCase.h"

@implementation WTCWINQTestCase

+ (std::string)schemaName
{
    return "testSchema";
}

+ (std::string)tableName
{
    return "testTable";
}

+ (std::string)indexName
{
    return "testIndex";
}

+ (std::string)triggerName
{
    return "testTrigger";
}

+ (std::string)viewName
{
    return "testView";
}

+ (std::string)columnName
{
    return "testColumn1";
}

+ (std::list<std::string>)columnNames
{
    return {"testColumn1", "testColumn2"};
}

+ (std::string)collationName
{
    return "testCollation";
}

+ (std::string)savepointName
{
    return "testSavepoint";
}

+ (WCDB::StatementSelect)statementSelect
{
    WCDB::Expression column = WCDB::Expression::ColumnNamed("testColumn1");
    WCDB::ResultColumn resultColumn(column);
    WCDB::TableOrSubquery tableOrSubquery("testTable");
    return WCDB::StatementSelect()
        .select(resultColumn)
        .from(tableOrSubquery);
}

+ (WCDB::WithClause)withClause
{
    WCDB::CTETableName cteTableName("testTable");
    return WCDB::WithClause()
        .with(cteTableName, self.class.statementSelect);
}

@end
