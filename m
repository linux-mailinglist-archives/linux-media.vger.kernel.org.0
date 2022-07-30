Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4369585B1C
	for <lists+linux-media@lfdr.de>; Sat, 30 Jul 2022 17:49:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235230AbiG3PtR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 Jul 2022 11:49:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235142AbiG3PtL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 Jul 2022 11:49:11 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2083.outbound.protection.outlook.com [40.107.21.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA69F15A15;
        Sat, 30 Jul 2022 08:49:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a4YhMXg9fVUnsmwiApklZTFut+WOG3A4+/sZ7n8vKR49xCkRSZa9a4EiHGkPCHfsjpcesWTpqA40mdM6o+9K96FJyF2vIQpvOKwwKjegTfQQlxI2gVg/ga0VPWelYo8e4Z3PF60aPAxEuHTxkj4/UebBOqYosqTMOuyliJolECW6ShQwJ3lM+aRWgZZPdsNgoI/utV6/WZaAWE1FAC9D0DnqZvLHG3YgXplbP/hW5bJF7WXEkExy3TNIFk11ThY5+FdESF1qK4xi4g+4JwFm+G8apGFCdedvYWGe9AGCJ3/T8xhE7XrGj2kT7/RTK/ZfzDMzgPtoYPJyhOr+zrOv9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F7f7zGHNQZv1eqEk4Rfa0A2wNlhS3QAzboYDRYMbrLo=;
 b=f8IlF6nzxGrP5Ajf1qaw7X5ZdBLJPqNgzZVI/PnTZ00MMsxqu7ZZPIT9zuPPFmU1Ul7aXHlAPgugP2LpVVL4hJGl+vnPyursaHwbp/cFcS4l5JfZZnLCAqLb9eD7bFjO0W4LOsZd5386riCP4z7poxgUV7GYBjIkhwsEMU5V+WkOv/oEwZkD0owpq7KefatQumVRdZBXOS5G9h/puebWCzvnISBPAGx7Hag2QrupnO8CWqtLcRTOinDqNqfbvqr/X4KdbnNzPjmWvkPZUmMdwf7uVGvlWDHEEJoYK8XtL8pdPFnXNnQeClLPvQ1rcTa31jCp/rOs8OMAVyvoXY/R/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F7f7zGHNQZv1eqEk4Rfa0A2wNlhS3QAzboYDRYMbrLo=;
 b=hi3BNVjsos9wky2HZbPk7cZgv5tT3zQ+N/TR1J61sk+ilPBIE7igPRSw/IBbm4qfgBpUouSZvvKiWyV5eZ+Q2CicR/JOxhv6nL1jB4nEMx6pmxcPhxgONaOkCfKsLO3GPSpliKk9C2tj2NXhY3b9wIK72Oi3BZ2GT1zndS7OhQI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by DB7PR04MB4875.eurprd04.prod.outlook.com (2603:10a6:10:1b::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Sat, 30 Jul
 2022 15:49:04 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9d8:f571:6ec7:521f]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9d8:f571:6ec7:521f%9]) with mapi id 15.20.5482.014; Sat, 30 Jul 2022
 15:49:04 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com,
        ezequiel@vanguardiasur.com.ar
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v10 4/8] media: v4l: uapi: Add user control base for DW100 controls
Date:   Sat, 30 Jul 2022 17:48:39 +0200
Message-Id: <20220730154843.791378-5-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220730154843.791378-1-xavier.roumegue@oss.nxp.com>
References: <20220730154843.791378-1-xavier.roumegue@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR3P189CA0082.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::27) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a15f5a7f-5c20-4b7b-7c78-08da724307b0
X-MS-TrafficTypeDiagnostic: DB7PR04MB4875:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9Hs9V5vfGfdhfRn50pSH6hqB3e+PU3++XrxeNkWqTIqIsPeJJVK2TaqGpZtyKq4LAWOsUbFfumWLKP6CQTp4UauOStB8E7CyOfmzcCMV5GYA77O29pqRoZTxiHlzQkm9PLASV2mLckUiG8+fEPmCE4kOHs1SkTbq1e4eVAsQRBZ6secfS0ytVRtFSS8pbmhQkgi7d7HyXIjLGXsVmfvzzVkKD3GvGMMvjE1/BUYtS12WFrR6f5f0Laz6+F/sYC4cY9wMJV2tHxFcST5ekvL6WqzcuiSBWhwHqOeCZB/+bUT8fBukV6ZCYJTVQ2Lv363eV/Z70QUjVxX47FDUcsknOX1zhRyawZQqVvlseoznEWUpuPihpGD/9vjnkilCFqWK4vSkocbGFg595WjQcoIbnvv48F/h+fM4sk2kLndIT7sAGH2sLkCXV6LU713UOIxn/4ucZKLe5FRUAG77nb3fTecc2RFoW4F22A+GPIsebi57eH9gmdSG1yqvjV4UJlGELVmWJ3H8YDdveLCRjeQkzBkpWK0OJYBYUV+jLgnCI2FYjRXwaGJqqjreeyqb8dwjxGSRYjMIz7P1blsXXFbjZlGk1LenpG5RdLKP/9ILWu2eLi6R7aJf+9GizykYVDr9RrEpxqTxWlYsfjMLQlz6/M7V/TQk8WhwjdhntaksYzKxKfpgZL+Usi86GXfcZZ0nuUCMC6AhFESlBjIHwOJgVKf0uwrxw7eRd8ElxKRa4J9B0r/TsPDpOndUjCxRUFNf
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(346002)(376002)(136003)(396003)(366004)(41300700001)(6666004)(478600001)(52116002)(66556008)(316002)(66476007)(66946007)(6486002)(6512007)(6506007)(38100700002)(186003)(2616005)(8936002)(1076003)(5660300002)(2906002)(8676002)(7416002)(4744005)(44832011)(4326008)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1sUBe+JFMdX1pYaLLF4Rp7sW4gPdJ/fSTA751vSOGhgz+lwE4CveIdtYlPeA?=
 =?us-ascii?Q?1Fe2ZTKNFd70AGJwx3COXNNF99M4F4je+2LlqxdWfYY1qFVCUOLPsl98YIKq?=
 =?us-ascii?Q?mKB5W1h0uSAnlpDJCFHtnJAJIrIgblm/cYftvB8vEyIjmwIHskFgHoJ1za9/?=
 =?us-ascii?Q?Nh3Rsy2k3i8irExuNKtXED7qI3s/L2e5YWKdDdygCR4ZdcAFhH5jcHZAoA4s?=
 =?us-ascii?Q?qA4ThvqWbF3HlaHIiUsSCPLGOLylpXYwSaxGrsIcnaHYZ+2kDGTmgkFWCx3H?=
 =?us-ascii?Q?scuGi8tKvwfIsA32fJoZV2QlkpiErqUcenYFU99IyxUhbn8my+QHoFa7NANu?=
 =?us-ascii?Q?oTN/jgThyC56EYS+J3TadnsTWY3g9SvBozxjFneWg1KMB+qRfy7Cd6DpzHUu?=
 =?us-ascii?Q?su0tAiJfpzGO+iYSvo5PxF0g9Y7QhqsAtxo57XqyXdS+REC0pkZx366ZDE9g?=
 =?us-ascii?Q?OUat2ERkY4TDaDKHk6p97P8Ef4JZ1bRfEX0RPj/9VSpVw/pwzU9yR9L3MXDL?=
 =?us-ascii?Q?ciGtZAY3jxQCz4vxjeHc9mGQCD2XCI84R60Bf7skW4JzHeNTPCIEFlgUv3hG?=
 =?us-ascii?Q?+LoWHTF3Nzaio5WftBLB5HH13exZ88F+GqZulGtw1xWCMdnnf6M6mrWub3Na?=
 =?us-ascii?Q?P0XJIuOv1ffPYEdbmkIq1RCubmf30E+1jHofcDBKuxnNI2Ih0N2MKZHMxYYq?=
 =?us-ascii?Q?831BOQYVWsDJdGICWsGcLDMeEAT+jz1NKHhMD0XfbNpTsE75Fl568fe32rDf?=
 =?us-ascii?Q?OS4a52fO4rTnMwZtPqA0eQ430+FOdDLVH40B9vIUq9/hSMqe70JjU3xAiCnc?=
 =?us-ascii?Q?UwE/KT5Rz9JKdJaeJgXUfRCMHAJRXYdJ2mUDTq0K40mwnfHBhrSXyJubf3Dt?=
 =?us-ascii?Q?Gcu7xjSbJUYu7cDRFeFouUshtzf5cI4ee4ECQ+t9lD9FxSjenchoTOsoMDZ5?=
 =?us-ascii?Q?/Dy0wD0HrqqdiZ0ZYQIf1OiUWUjzDlzfmvZ0jz9SDLlJ4vUKZTGHLWx1BSdX?=
 =?us-ascii?Q?rtVGjD7C9ZouuZ3E0Smh3Ae8l+YZBre1mPd7rqkB1q0wqctGRMpdUP936seq?=
 =?us-ascii?Q?0IKdm9gOn+MuVcQQoHvLs4lQtNZ4ShUT4eL6ZQytYxacqyJEpaD5jG5oiBD/?=
 =?us-ascii?Q?sp0y6Pf9mpYfLMXIJWRt9ePk0g1fVMQUsgXCCr0gB20VhHy1Y4DnlSD+R7A8?=
 =?us-ascii?Q?qaZOtmrxsKAdZ7KqPs/KcQGLH4JilSIsi/9X1djZY0EA4O3FuEsG7RCyp3ti?=
 =?us-ascii?Q?vRoLJO8eOvte5yyQFHSe+hOXGwdad4DJbxsXEgLMgwktDfM14egkfqDuNf8M?=
 =?us-ascii?Q?Y2g9SxAmdMRokPRxYFrfpxZbZMg3iwzoDRhbtGCnJ24CqKzsXTLJP/mtNK7/?=
 =?us-ascii?Q?+ciTYDrV0IoiAgZ2BGhB97vZfln7G+XwvEwx0mBWRMtnyvkV0muRKj8bIsFG?=
 =?us-ascii?Q?s1/nbOkaLPWVxvTIZoVLDxNsNaEdzCf8lw0qH0U8fPe7oh51IFGj2dTn3BlG?=
 =?us-ascii?Q?SYdWLkd7qxmdX9CL1qo3vNYPkxuHLwTDrnBoTqZzNvzlDReGDypbKJaWmudj?=
 =?us-ascii?Q?Gyd8SlbhtLJ/qhM7lGXufn5ZcxJG/rB6wH0y4hyl8FPhx5jGBLs19eBEZBai?=
 =?us-ascii?Q?zaJkP7brbvbzIgQ9DIn/vcJoqpXAwX/sgETDsBicEtJXuw8YaSpOqQ98iqes?=
 =?us-ascii?Q?QwvMDg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a15f5a7f-5c20-4b7b-7c78-08da724307b0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2022 15:49:04.4822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z3eCZN0veyMG0rhIXchthBjrMMCJCxkhCfTofZ074JZsStKSsj/d5gaUgB8Oi1rPs8Z7ubvNtRGiR6afOr4vFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4875
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a control base for DW100 driver controls, and reserve 16 controls.

Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 include/uapi/linux/v4l2-controls.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index dfff69ed88f71..0b26ebd6ca78f 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -225,6 +225,12 @@ enum v4l2_colorfx {
  */
 #define V4L2_CID_USER_ISL7998X_BASE		(V4L2_CID_USER_BASE + 0x1180)
 
+/*
+ * The base for DW100 driver controls.
+ * We reserve 16 controls for this driver.
+ */
+#define V4L2_CID_USER_DW100_BASE		(V4L2_CID_USER_BASE + 0x1190)
+
 /* MPEG-class control IDs */
 /* The MPEG controls are applicable to all codec controls
  * and the 'MPEG' part of the define is historical */
-- 
2.37.1

