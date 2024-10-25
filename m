Return-Path: <linux-media+bounces-20352-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B33C39B1278
	for <lists+linux-media@lfdr.de>; Sat, 26 Oct 2024 00:17:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2A30CB2234A
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 22:17:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AB4520C333;
	Fri, 25 Oct 2024 22:17:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from IND01-MAX-obe.outbound.protection.outlook.com (mail-maxind01on2097.outbound.protection.outlook.com [40.107.222.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0624217F29;
	Fri, 25 Oct 2024 22:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.222.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729894639; cv=fail; b=pSDTRo1i0xwbr1jAbcYHJj5mlQp+FEShKyZEi0i2W61w+KNiZHu2pX6Lg0EPgWX+ALhiysnIIX0afslxmYPokuuniCKvjIz+h9LxVCWLUiVv97u6NeMzLOT6mYDy1DbPMsweBwMm4g4mkuKq3GI/ubIddri+q1ocuk+ov11dnhE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729894639; c=relaxed/simple;
	bh=bA2WUFMh7/5w1Qc5AwwCY5NyuzuLifh+12UWX4rlDv4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ESt2ldsEVJFah2VEcjyH0FkXm1ims+DkNbVhKom+OmvA6/NAmp1BWsbUXZaQZw8ZtTBtfEznquMbQeDb7DIzS/b5IhkSHlJ2/VZTjwa18U+vIqGcjQbX3+rjBHCBsRHVH5gdBGrogImTxRKrQCXaVYN6bXZpwOeXpaDMIoAW5OI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.222.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IR6Wze9B+EBxuRaGJnNTcLTF7njL8KCj0TvxQPr1ZVRrYcClrbuLn5avT4F0qyZkkNRe4A8IYhvgDkShZsgpT/xfuK/6+igVFDnKnRut8PT7BUK0w+i3BrK5ms/w8/PsY02FWroq6julRB+d5mFc8FjZfkOpVnFXmjrRpUuTrs6CPncXfEDK7HXRynLDLeFF2UJcBTAFe9RAl6YVNgKZQvQljojY5jlK8QPPRzy0GEda3rCWuJu1rNTSr/DDGRI0Bfwr1KPQpjjHNz5Bc2mN8sMrJAtWtwk27lIrcKcrt5YtHEFJC+2HWdh4mWAwRtb0uRG4OS08ZWHAXzjmYS5hiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QNnJooX/xaikjHjS4YnwkAOOQu7htjFxLdojf/6XiPU=;
 b=WlxJJnyr4n4rGCNfvcN2GHrQvXneP6hZ3FJLIrY7PoHfiLf8GeAsQExn/ADubR10+0pktmJk5GK1VoNsGHyplkma1fF47kSXPWLNvNqrG2V2uzKFKZ0ze2S1EGfUZvYorNjsvrHguqUKP/ut60at/j3a2F815TCNbAtMhKgXCvtO2UVUXF5BtbWy3IbP2U8ol8MUxLbc1UMWdqG14H1kyhcT3vkyF5R8uNME8QE7PiTWMKlx2Rbg2gS1uxHOkVKQN8B27gtDebhdVtW3anG3z0WW91kuTHftjnWiLtu+ECHbx030Mj9hKMmDOpCN7pKbtiBTuVyxjbwkPV+jbWyNLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2P287MB0304.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:dd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.21; Fri, 25 Oct
 2024 22:17:13 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%5]) with mapi id 15.20.8093.014; Fri, 25 Oct 2024
 22:17:13 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: laurent.pinchart@ideasonboard.com
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: mt9p031: Refactor format handling for different sensor models
Date: Sat, 26 Oct 2024 03:45:40 +0530
Message-ID: <20241025221638.127457-1-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BMXP287CA0023.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::36) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PN2P287MB0304:EE_
X-MS-Office365-Filtering-Correlation-Id: 4588dd8a-d369-41ba-1f37-08dcf542c6f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UXn805mKkj/G9Q2QtqkElssVflEeJQTcQNGt0so8ioNccVOaNDv9mx8djMiy?=
 =?us-ascii?Q?2WOyNMszgDLkW4m1Wqc65jtx6aEFH4fsfB3/+lTKa35wpz8RHeQD3zgh5wbu?=
 =?us-ascii?Q?3/jbmD0ttBQno+UhLewRVK9H+MeBlLekyK0AgX1aiwkYxNpJKRcwi6uAnKsK?=
 =?us-ascii?Q?7LA7UQWTajnz0mUVw7YD1fBNCMM6J6TkTI2j64gde8dF/696snF1R80PkAWU?=
 =?us-ascii?Q?aoXFFuVMan5IxeURQUCEi53aPQhB47KJ7sXv4R7JyybGru0XWmEQl5iBghQi?=
 =?us-ascii?Q?YhQQW+auZEpg84EHj/WX+Gf3qHIcwyysEQ40L6+uNwtORSnfcYBuEbaCoJ7e?=
 =?us-ascii?Q?x+DCiYm42pQVZ26sXVzAcu9HGoiJ+fgdePls/qysUFxSt5LVSIz25tYK83HV?=
 =?us-ascii?Q?gc/PvghbbVJEIlj4Uiz+1nT7L8Ue2/qsytyz8nyb3NBbyuzCbNCgffOcm36R?=
 =?us-ascii?Q?MeuFiPPTlwPA9w6E4T9MSztAicozv7LCi/3uMaJvI6oa9Hk/1aHYcvchH8rA?=
 =?us-ascii?Q?SumVmWojZ0Da2fRfuGCfr4DZqhsbbkWYHBU22DqDEJRdsJax7QrjEeM+lgr5?=
 =?us-ascii?Q?fUWbcBzFGAfKqKp+BCeqGahKwSWPVY+qrTPgvuOdEE9iVdGkAiNl/XZsU5QY?=
 =?us-ascii?Q?WTkfrEF4olbbc3on2TImWKFDuWso71zoEBg/rR35AlguXOQXFclI8PaUhKm8?=
 =?us-ascii?Q?TO6FA3wpBn425dMIa6VV4mJKzc/kKA7LMUubkqEhuCA49e86IBLufkFGz6KV?=
 =?us-ascii?Q?/YW27TKQ15o44mOlUbDx5/FC3dG36yCZMCrMgx5oXJ4VHzTRTQrVa/v421NO?=
 =?us-ascii?Q?EyMNEE+6p4TqyhzTFh8HHxtJsJ5qRRMhtDNvXiC4FiZ+tE67sqC+6W9O+/DP?=
 =?us-ascii?Q?J5hW0eLBQ8qjuLHqlGbc9W73ahQR2SJxEhwfx0vran2SjgGMG4h4OAE2Sl0l?=
 =?us-ascii?Q?8howM3y1V1scorIWT3mCA3djRmfuT4MhXkAMp/JgR7NCusqJE8jbhZuaGAOZ?=
 =?us-ascii?Q?EuZAEhU6iBNCJu0gNpH2vwqVeGW3B1bYlLvAn/qT4JCZJGdhGQs/WVk32GXK?=
 =?us-ascii?Q?fzNYETD5A9X5dKpTg6Wn3gE1HxZJktRwxqipBYkTcJwsSrf07R0lnYGgJpxh?=
 =?us-ascii?Q?HA0snpFQrJY5rkKQaLi6UP9lqC7rzpBhFFY82Mp5HQAeteubzF5V8wKn8rOD?=
 =?us-ascii?Q?l/iU7P8vl3+OPVhcIaY9/yzhoeO9t55mCQalSsd9CvptlXiFjWrBKHAKJ/oL?=
 =?us-ascii?Q?Be95G1FZonsOy9PCSOaUigcU7tPmfyJKbGLJYUruYUPxKbd/h7rBi4CxbpCl?=
 =?us-ascii?Q?rThVg1+H7qpYsh3scfpd2IN4?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(10070799003)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BYnWzOl+TCPo3BuzUBC1Yq2MxOWl8dRsovMrlufNvkn5ZAwfxw2t9FlgTZR4?=
 =?us-ascii?Q?4bFbas0QKBgQbsZq2pvWji2N3hxOS+3rvFinVdt4xWQo8bmcGTfjsfi6DFOs?=
 =?us-ascii?Q?z5QTp+Qp8Jr0czllrS0QH2ebDeOccfhjNYDYe3abrXB8DpB9Zsc6PxpN4A72?=
 =?us-ascii?Q?IQJPHL2nZ/qJP2w4ZYVi4jEQm6caVLNqE0ZoZQPiKt9GcAwJ9ImcDRwTdQT8?=
 =?us-ascii?Q?142vau/6MikmvPt4pou6Hl2cFidAmfMigWIEV/V/lUh0RZI9YXui2gsAxt8L?=
 =?us-ascii?Q?Q9wCnTElmF0soPo6KxYXd2pDqzfyP9x0Jgw2OHAojSXD1AS6V2IhgYfTb+Ih?=
 =?us-ascii?Q?OvTlMvBmqRyQgHkEKY4eRA4KFow2yz3s7A5G8oZXQOc6tkjpMs/6U6zNK4WD?=
 =?us-ascii?Q?NJ4W+DFZIrrkwZP9Rw1b7q20fLLtlIECf3hrzQoXeLjKd5dpHPgOjYnuVzXi?=
 =?us-ascii?Q?Dbxu+IZ9qOSV6PyQ4sUiyPNW0/K7FvCYeJYijf1Zc95MusKnwibBvzWi1sWl?=
 =?us-ascii?Q?uRmpgdb2BMsKjsY1WH1ezEP5zxUWuZK3oaCfSvJQFVq06LHq6X1v604SQIEW?=
 =?us-ascii?Q?hTmWULTFavD9IQs3fKGkUcMdbJlWD/M29ogZ1h0abmr2mr45sJhhqCZcfV7k?=
 =?us-ascii?Q?zEku48N/ixf14eLUzAl0vx7PUjnffWmE171kCmkL+p4GtXB4MC+nlSsPfr9e?=
 =?us-ascii?Q?veQm99RrUJfzjxyo6v4iBP3ImE90VbVQozKsgb1D3b3qnxMo3wcnp6gmeqIP?=
 =?us-ascii?Q?iOuPVsxbKaXG43oIa90/6EamOL5NEreWMJD43jhSbNbnqXtHpacaPKK5kxHS?=
 =?us-ascii?Q?tGFpTIR9g8cH0DCdEhWWjeJ7bdXkvkElY6hUqgmn/yW4zbbeyI5L40yRcZCf?=
 =?us-ascii?Q?7xxRqIzKgPrZIWmZ4IeEqAeistwHKYJKXRElcqDMBkIygGwP1l+LQxP15olO?=
 =?us-ascii?Q?O6p9hFyKdABJHxFkBALm/riQjFcM2hJtyGpzARC2p5ivHvJHINWjEtUF/axI?=
 =?us-ascii?Q?a4UQdLN8XIzjOyhvcOYnl3zUitY0vObRKrdFtUk4XVk9AMBSY0TRMRh13IG+?=
 =?us-ascii?Q?F7jnb+X7mxrgz6vKlT175Mg6OPryvctAC2gyf+GdSY/wLnlHNtRDa83XenJ2?=
 =?us-ascii?Q?jgLJLG4ZG04/G8A7JBhfeD7Ij+Ts2iF4KOQrGdl7efHXP3jHETEmgTji7pyK?=
 =?us-ascii?Q?qW+zRTA0BrnJLSIFgyqkcH1HcV/qIqKt76PDIG7uGOWEe3WzWCSKyfU7ZkC7?=
 =?us-ascii?Q?JqhpEfi866qEycmBDw6Fmu1LHuN4O8mjLZzFUyotub+5xednv10scLVeOs1a?=
 =?us-ascii?Q?fApJcCtM1gzRGSkeimqmf4clg1R5L7rbptGrdezVI1xjZenCYryWOX1fXpmA?=
 =?us-ascii?Q?kS8S8UFvCrDv1gPFN3QQzYAmy1NYN9zFE0m5DxNuT58HXmbNSpe/pEPtBvWd?=
 =?us-ascii?Q?h08EhafM70di8u0Ij0AI28yvqqHmNLKQ1rrIRVrlzimEdm5T33y27E2UwSXW?=
 =?us-ascii?Q?uerGuvB1Zgzd1Tueo02QpB7qz9eHQCseTi/urMgdHtd1poD8gd5Z586F9NB6?=
 =?us-ascii?Q?wm4BBK8+oluYtWIEfLMxu26h0LsNvUE6UD7X48NDw0POPOJQJlhQyWw8uzQE?=
 =?us-ascii?Q?3YxBdUp77MUQ+BMAGYuIlsdwAbHbWIZxHllrBLnAQq0yAnvzI+bjiEbcixFV?=
 =?us-ascii?Q?Jq/eUqJ/Q5u7dPjMqfPh2CnQiEo=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 4588dd8a-d369-41ba-1f37-08dcf542c6f6
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 22:17:13.5118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6VwXGCUjvKkjeqHK5jdmOwoK/T42PqcFwJWdOu/bM5gTkUIJ+zYTqVTSxmhIYe+ER/j7pTgXGzghgS3Pg2GT7HsmCpKG4RCJ+ikxiJ+tMog=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0304

Add new structure 'mt9p031_model_info' to encapsulate format codes for
the mt9p031 camera sensor family. This approach enhances code clarity
and maintainability.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/mt9p031.c | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
index f2f52f484044..3576d3066738 100644
--- a/drivers/media/i2c/mt9p031.c
+++ b/drivers/media/i2c/mt9p031.c
@@ -112,6 +112,24 @@
 #define MT9P031_TEST_PATTERN_RED			0xa2
 #define MT9P031_TEST_PATTERN_BLUE			0xa3
 
+struct mt9p031_model_info {
+	u32 code;
+};
+
+enum mt9p031_model {
+	MT9P031_MODEL_BAYER,
+	MT9P031_MODEL_MONO,
+};
+
+static const struct mt9p031_model_info mt9p031_models[] = {
+	[MT9P031_MODEL_BAYER] = {
+		.code = MEDIA_BUS_FMT_SGRBG12_1X12,
+	},
+	[MT9P031_MODEL_MONO] = {
+		.code = MEDIA_BUS_FMT_Y12_1X12,
+	},
+};
+
 struct mt9p031 {
 	struct v4l2_subdev subdev;
 	struct media_pad pad;
@@ -1209,9 +1227,16 @@ static void mt9p031_remove(struct i2c_client *client)
 }
 
 static const struct of_device_id mt9p031_of_match[] = {
-	{ .compatible = "aptina,mt9p006", .data = (void *)MEDIA_BUS_FMT_SGRBG12_1X12 },
-	{ .compatible = "aptina,mt9p031", .data = (void *)MEDIA_BUS_FMT_SGRBG12_1X12 },
-	{ .compatible = "aptina,mt9p031m", .data = (void *)MEDIA_BUS_FMT_Y12_1X12 },
+	{
+		.compatible = "aptina,mt9p006",
+		.data = &mt9p031_models[MT9P031_MODEL_BAYER]
+	}, {
+		.compatible = "aptina,mt9p031",
+		.data = &mt9p031_models[MT9P031_MODEL_BAYER]
+	}, {
+		.compatible = "aptina,mt9p031m",
+		.data = &mt9p031_models[MT9P031_MODEL_MONO]
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mt9p031_of_match);
-- 
2.43.0


