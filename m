Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3798D57632C
	for <lists+linux-media@lfdr.de>; Fri, 15 Jul 2022 15:54:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233221AbiGONx6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jul 2022 09:53:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233202AbiGONxz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jul 2022 09:53:55 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80048.outbound.protection.outlook.com [40.107.8.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBD401055B;
        Fri, 15 Jul 2022 06:53:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fUzBegl6NNk5/CsGrpnHWwFhPvhhk8jHxPb+EuvTmZ3ouvHvtEVLH0k5tD4BU/TvnHpUqduLvFai/GkEUXeKlAjLebxW3fgTgTIhSre0ODyNPBbrJqWK+k+OKKTSnJnp+mab1GK5NHPoXBGqGGykzctUmgiP9ykRYO7hMimYNkmbTLIuNq5ryQmsNk7QEY0lhk0iNXQpCW5530GgoB09A1TveZzPKphadVeNrUvD39hsXzZuWXMJbwPhFf6ltFWku2jH/JlAjVtKzSlFCcoJ/Tl6LeNX98GjNOwHp21eElo7eI74otD1LAgkCmrEmt7HOCvjpiU0jUbvQDewR0JSag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aXAAGNfrNiSMxe/ey4OTDpi0XLzQaqJVF9QrNOOgtV8=;
 b=fuLcxFQkwm1Ms02FCFv8NBO/C0b7BadYL3IMbX2+dxeAGUqPiyFTNnYRUHDxItEpLO96qkoCqUBX5EspXGjdfLfuN2nNxiarh2vyzDZ2Tvy9f36YefIsqos46kAVhhNRQU4mrUNsiMulx/zf4waGkC+Pi/buUQkzLA45QoAr6nNrk42M5hBtfZlwu1rB/Gj4586+uQ/13Bs1KIQSoZpWrfhBFMGq6KgvYcXccS0aCKStnC8o9C3Ylzw+agHyxO1zbTXFZTxG6VpCw8g/ZWnlt+BJql+inX3oTUjdb/L3We5ArlikVitiyphGFSwNQQ8dfc9YUZ1YCpS15SZDc0dBHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aXAAGNfrNiSMxe/ey4OTDpi0XLzQaqJVF9QrNOOgtV8=;
 b=a1JOJBYRQj5vT6Joaft25KO5DMMUGYFxk5z5pdt/+UKvGsZ6+Cs6pjKZ6RRMHiQFjnGu83kCj7TwdWo57jh6lE+WDwcujyE6FsdhRH+Fl5eN2iaf0u3T7OXz/mck3ehUFOETronNp+It4EZwdWy+JP6AR9ESortftxLc989QNyw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by VE1PR04MB6640.eurprd04.prod.outlook.com (2603:10a6:803:122::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Fri, 15 Jul
 2022 13:53:49 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::d51c:319c:bf4:199f]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::d51c:319c:bf4:199f%5]) with mapi id 15.20.5438.012; Fri, 15 Jul 2022
 13:53:49 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com,
        ezequiel@vanguardiasur.com.ar
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v8 2/6] media: v4l: uapi: Add user control base for DW100 controls
Date:   Fri, 15 Jul 2022 15:53:25 +0200
Message-Id: <20220715135329.975400-3-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220715135329.975400-1-xavier.roumegue@oss.nxp.com>
References: <20220715135329.975400-1-xavier.roumegue@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR1P264CA0061.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2ca::15) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4675c8f-1540-4c0c-75b5-08da66697118
X-MS-TrafficTypeDiagnostic: VE1PR04MB6640:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qMCS12ARGlj9OfjQC2U/Zo/9IUfXxY6P2SaqUTWXP6GzYEeQ9BDZcz6wgGy2/IHmGNJ0Ss3g7m4KL4SlcAFhUJDPhYuu4cYyMRlvKhMi33MbYTanCuZA/dKgHnNb2kL4ZgxIzC/8fzY4VFQx5NluxWtB2INx1y1xvHtGpLknhHFPDVlOhYVZDEajJ9iiwh0JH2hQL3mgJ72kJjnY+nc10+ImmMMXGZWpdTB8KwUm2bAvgijxSl3Mml0+KTMxh9QPUSMOV9obcRYpflwbhJ07KL/5zdRQ+vwlCfMmPOF7hCQ1gNRf48e/xSRajKRwQatsMH7CX1JyM4VLE6UpTtwYOa+vYB5hGaNL3YESXzkwisK6QKq35glyK6VfMvV/fJM4NfGMvfT8XabbHOpFtlq3udouX1lK4nYIvURDdKWwNuuy8KI+touK1zshC5iAEAfTxeep9kOf7kxfRtRpKIosc+QsU3qi7U+V9RnuOFoq3OTp8sfS87e/DBV/cUe7kicDXjBLFmkkPSYAZXAZgSDCiER0OUdVEzq9R0i0N31IMhhipg/TLtD+PJU7xAZ59AmTxQRvZIF4zGBxfpGBlOWWgIfeLvHepwT5khPwG2s1XaSXA7XtNJtmkHCn5UJUF6bdds7MRiBp88JqDcrH1PtQwHDSUIw5ZwGb2W8frHR9xSrm5vvxuLzVnimLEsgAwiVroJ5zRuiZakf7PNUWdgkt4b9rO+TJCz2pBGebErzW+wr2IuGX8HfHMsDxW4JHPEvo
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(346002)(376002)(396003)(136003)(39860400002)(6506007)(52116002)(6486002)(86362001)(478600001)(6512007)(66556008)(66476007)(6666004)(5660300002)(41300700001)(38100700002)(66946007)(316002)(2616005)(1076003)(8676002)(2906002)(8936002)(44832011)(7416002)(4326008)(186003)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Wp4g8v2qc66OrOmxncKR7ByQ9lprf2dTEQ7I97py6j67Wr2UT/fUGymaxFp+?=
 =?us-ascii?Q?qRSdP7MCAbkrP8no2oh+GPAhkZX0nAe7nzjjHshO0DubPWbPqiccrAHm8mh1?=
 =?us-ascii?Q?1ghX7AkNYNMPtT1Gtd5qndPTE8YBxIpyz+fo0OCnFtXyqJ5GO7mo509lPeTv?=
 =?us-ascii?Q?6HWiFQ4JrPoOun+d5hjtnKdKU+9mvLfOUYG0n57ej17KqkfEyI622id+eakN?=
 =?us-ascii?Q?NjyjIeaT13pqKY7CHjTZlfRiF8uCC9dh976z4Kxi0keAXUNJ39sJ17MCtQfC?=
 =?us-ascii?Q?1OmhRa93o6+xyqju4MbbEa5+odkaBoIshVPUIbSkGVnznFuvEfQDQviiQE7Z?=
 =?us-ascii?Q?amv49w/TIEi4RbO1Vs15aN3AKSenNzCYICFvyWE4ycGln5hF7EwjPJ7QD5/W?=
 =?us-ascii?Q?AhRRQfgzCIMCbEnu5a7+WSWjmRV3OyLn+zfIk0gGcZksU63z54zLZMA2QLn+?=
 =?us-ascii?Q?dSVNlKrSaPf4/pWMYbQQC3YhJF2ENSfaBMEyr8Bsf8NyV64QoG/uMvmxHXQ4?=
 =?us-ascii?Q?p/s8+JUD0b5XbGiv8J3vwBHi0EvD2biI7NfZrdwJYic1hUFnIYEnV+pTkcTk?=
 =?us-ascii?Q?CaLbBQvjBgwLbPZXcB+R2AJCKGq9U9lleO+GjIzeGa9qytrn1pBeQs9LBq4w?=
 =?us-ascii?Q?JK1z5g/IFkqT0BS7XiGEWVVqoG4z5H6FOeIdQVZLK4kQ1WqjOTjI6onehGwM?=
 =?us-ascii?Q?VlMhCU6BAEBdTIv3cyx1k/L7MDTNT9Yu4Mh0vBaiH0nNZj+Kfr2By9AAGfnM?=
 =?us-ascii?Q?teoO8YrcOhMJ2UVfWzRf3juZsm5Sm5y+EQldP+xgqfBwcFSKkOZ8XpGimjzX?=
 =?us-ascii?Q?334GB1QeSOHQW2dHY8FICivW0muQyxk3uao7Uo5Eld61NwWWTaD/uleMF6kY?=
 =?us-ascii?Q?oiO1f86TV1ccSPIRkD8pPIdW5Mq+gN0gdPShAvbVxtZ42MoISMpFoBdoTSws?=
 =?us-ascii?Q?KRL5hAqMM1Bq7Wk2jiPOqLZFIkuEGcR1aAJxmdqshn0zsMYgc4uKBVq6X8cZ?=
 =?us-ascii?Q?wHvaYkF2HHk44DNzsli5XNqAhy8CenmiJ9CPrF7A8bAcw0VAGTqFOWW66Gaw?=
 =?us-ascii?Q?ADlsiG3qtk6vYIDw5DAtPnsYOZCK4IN+hru5BAzJeHsCL7jIGTExP074QUIW?=
 =?us-ascii?Q?CfxH2zmAZtGTzLrh5HY0EjKV1ezDOi66lfyWO6zLA2Ke9SLDHJKFYKFgbrwC?=
 =?us-ascii?Q?FjGDB2N8Xi0hgG1Ii3WGQQLjfhBP/6k33AlV+H4Vm4mdOtC3x9mEpWJbRoTZ?=
 =?us-ascii?Q?2ExDFW530FlcGP1An2BB7NpJvMWEWqAOf6xs2X4HOHCb4uVfvB4O5D3eMt4b?=
 =?us-ascii?Q?jI8l/DO+hlSDl+CwUHKjhhgpwytvXwiQnPY5LL2U3s7nkIKK9TVt+x+pjeKD?=
 =?us-ascii?Q?wP+kNhG9QGATJCxWqcSRgHg7pCr8/h9CoWN9GNOkoc5gWBmq7ozxs0TQ15pt?=
 =?us-ascii?Q?9MM9/3EvN5T7Ig7oVJuj/UzMNDxWaqrFqMW4ootCid7/z7XVqzULbSrPNqnS?=
 =?us-ascii?Q?MUOlncbGy532MJuj4Fh8M5lmftkQIUeHCcZO0Pkq4uZqfStDb9+kT0SObRa+?=
 =?us-ascii?Q?0Oy9Jb8r00Aks9bVyEW5dcpLmKQISiVZSuMEnxfiSiKugRX95l7HVWJ2Jobh?=
 =?us-ascii?Q?lGuBsWrxDfebJc40AcIGrpxaDXe/eftqbjCsO6RtYrEswKBQl1CltH1/HL3q?=
 =?us-ascii?Q?93QhmQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4675c8f-1540-4c0c-75b5-08da66697118
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 13:53:48.3717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: owbPMarOCkktp4FfQgZGd1O7Fk6BpYwj1kJWu/Q0Ef1C0InTL7eoug+v2YNpUWaBZb9O0yS9w96E3Qyu2XURNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6640
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
index dfff69ed88f7..0b26ebd6ca78 100644
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
2.36.1

