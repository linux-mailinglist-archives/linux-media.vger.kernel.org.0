Return-Path: <linux-media+bounces-25485-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0BFA240C7
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 17:40:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5E3416A3AE
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 16:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E15191F543B;
	Fri, 31 Jan 2025 16:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Ko4AyG0A"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013016.outbound.protection.outlook.com [40.107.159.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A521F541C;
	Fri, 31 Jan 2025 16:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738341295; cv=fail; b=KHATpiDJ8lep8P+Y/N6MBopJ/pY4Y4HCbhekv+Ocmk1dM8SAGcio6fCavTT5Ito2Li+oWDcxNPe1nbH3cM5gmb26XkKrXBN4gQMcvABxa22frIZExIhrzUE31Atj61jJB1ng+wsWI2vINZWviE/UFgnPq1k/3kPkByOJXavYzXg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738341295; c=relaxed/simple;
	bh=BIxAODCRT4b/RqMBpSEuVPU+i4KH9OQ05l3UxK4xrZc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NsmPaUsRWk8YH1U+d/M8Sg+iC0EfSYvWZWtTyta89j/CqOPV+vWJI0NWBTchkBleuUMOx4Q4q1KDbVqtN/uu0+VcFZfULexir1PBjKvkMOEG7BcRUPhIf6Z9xvBOG6WUU7sH8sunutjFJnaqiARO0JkCvOlJ4xUHA47hVp9SzrA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Ko4AyG0A; arc=fail smtp.client-ip=40.107.159.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LhyvtbrqiUXiaCROC6H55QC8OYtFXlRTmExEySm9TDQFtAps1vbNl/WeD7yFFyLOt8x+XKP6Dk7S+h1x5aX+vMl/F5W4fTtFMw9EO8M7slp0wyo8yJOHh1dESw2UaS8cZsgmwbw8niwKxfvO7afHU0b+uV90AGoz1DliET4RHE48to1sbcFC6D9yiRk6o4Ek6h3z7DcwCjwqeO13uot5swZXYz+J5/XMuwCntYTzw9xuOp59fs+YGXii/f019i28OjJl65zXo/edTdAMYJ1up17fJR5BNF/OmT1K2uu0IR1Le3Dd9ec+q1ooIIIadakOv7vu/VFN+a4/SBTEIJPSKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RY2ml1UZkSQulwbOkIY2vnPRiKe6V6H0gDP0qog4774=;
 b=fzHctqWnxgikEbQ94Tmqv5oMEPNQudsiuD/9/L/8I+g+wqohCtC72Rh2m6z/uidnBWTxhKRE0RoMrkPo3Kw2thN7wCNC9aTqqjT2fkYtx5BgZqXbdXjqHPqWbM7B4aLvOawUOy1ElFo4kLQECu1/1W7q3h/vCW7ydw+/MboaXvE1JPmDmL9rhjt1yaHersR0RBoKSu9PKCxw/eLuvvmhePUwo9TLLOIKsWlvSOKoiAuDAJEhz7CzsmlIi4PXGWr2ttIS0Ln2H06yvGzYeMzRR8CJ2EkR7N0emZjDkMAudvki/Obx6/vGu/dDMRNt17Rm/7Rq2Jty9lG48f6t+8nw7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RY2ml1UZkSQulwbOkIY2vnPRiKe6V6H0gDP0qog4774=;
 b=Ko4AyG0AFevE6/TUk8kJ3mticp82psl8PN1xgi9Ly9mLLWkQT2faD+yNWyYVmE8/nZwkOsfPtelVRJ2gv+6To9tYrgqX7cdVl2wgoqE/z7zsEl3PV9CrbDD5UuTFRQ4K1owxUzUUyl2qMu6rEUngequo8fbrnIf3smBZvnhRW9FeV2DhDFevPMoO903WMKQvdpb+2uzGWtRFoXicPRKQhOJeyu6wrQPTpbHma/WFu4fecd4wjkZsPj40u4TEp+Jiph+1IYaBEvBecVoEaotFdnoyzNuac3hmPZoxs5tmpcPDuV/ojdQHhekHWy31fcSYDh6k2d8skh3vRG/QAGFL4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by AS8PR04MB8529.eurprd04.prod.outlook.com (2603:10a6:20b:420::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Fri, 31 Jan
 2025 16:34:45 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%6]) with mapi id 15.20.8398.017; Fri, 31 Jan 2025
 16:34:45 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [RFC 08/12] staging: media: max96712: allow enumerating MBUS codes
Date: Fri, 31 Jan 2025 18:34:02 +0200
Message-Id: <20250131163408.2019144-9-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250131163408.2019144-1-laurentiu.palcu@oss.nxp.com>
References: <20250131163408.2019144-1-laurentiu.palcu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR08CA0013.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::26) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|AS8PR04MB8529:EE_
X-MS-Office365-Filtering-Correlation-Id: d3afddb2-ff42-46a6-4cef-08dd42152bbb
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CG5YKZw3ACO0sU7U1qrzXq5ipM+NDg4kXLilJc4EL7cI8egBW6DY921+uZSl?=
 =?us-ascii?Q?ZcXa85PS1rvl4UCeCcnCwzv08mBGU509l8IgvEMokt1puDkg63qNkT1WzSS/?=
 =?us-ascii?Q?+eRPg2pzoVFk5JMgxg+uKCwWQRyhWsbQaJuxNkMUZNdVerE6dfOk2sBuMUQ3?=
 =?us-ascii?Q?THTiRzJwvuP4L+VS6k0vcLW4xjhNmVw/N73Hur4hYgey6586QTXWNWP5CcWf?=
 =?us-ascii?Q?XuHLTXFXtlJNSwtjqwTxXcxHFLxQncuTrfwHNFgRldgx8gYMilCpujqYxL7Y?=
 =?us-ascii?Q?4CnRh1vwfboWwF1+PSh7G5swP8no4YHrb4wkgfncoyClYLoDlgdJX5HPr//o?=
 =?us-ascii?Q?XShsYd2n+YF6XJGHZruoKZZ3RqUpOEhNOzEW4+UrOnZRwKuVKMrysnksHJbm?=
 =?us-ascii?Q?7bBGkkwj2RZ3KdrzK/ZT52Pf4TC55CmCDQGbYRK8+iHhiIPabUR+iNTQ6L5Y?=
 =?us-ascii?Q?CElvnQwiCEt19beJsUvCb1cZh5rf4RSBCMMFnt4yrI7Ncy3dmxmbKokzcMi8?=
 =?us-ascii?Q?ncvE6B2j5/Isv3XfLExFGxiZ859vOBYEh7vv/QAIPiyQt063p8pxDuGrXw14?=
 =?us-ascii?Q?FeXQwnFKOn6woLK72CyQR2lRYzsYoNt51C9dOkfngeqgj5yfkv7b16OpZ4Q0?=
 =?us-ascii?Q?sfBk03jHZwjZB/C6H1fXJNT9Bs4I5hB5c6bsc0avMk6YQ+fwvQuFoqR2Hk7p?=
 =?us-ascii?Q?0FbwhOw5mnJ389ld6JUWDNHSQ5v5g2JjwaZ1RM7gFvfNvZ9Ow52nZs3GFyEA?=
 =?us-ascii?Q?DO26DjPBdqJVos8hVKfrcjhZwZcnaqbQDI5MN5a9xarP6VqpZVoI6yv18aDO?=
 =?us-ascii?Q?0lAllq8mRcI8POD97VlU6XyJMsdI/q+pczFb58Ro3WLqOugtvyT9iQXfi4Y2?=
 =?us-ascii?Q?17tuN4GXOwm3L2rKqK1/ECeFZMrLmsCnat6qFDdpADRWaRrx987ZDaBxku3R?=
 =?us-ascii?Q?hEMDqW0Kixyp+YQFuQR5ty9yv4PvcdNWTEnB6lqrG31fokZ18f58NQpgmGMw?=
 =?us-ascii?Q?au/A+enZyObaSsAXHTI6C0UeWV/+nl7Pw4FZAdIa5LWsqOxRCCjVB1jCro/h?=
 =?us-ascii?Q?insJO8iFqbDtlyd38HzdSwGLaEyuvuAtxyijod35VMCRwnD0va5VdcLlTyLv?=
 =?us-ascii?Q?qRdl4kJby3GxANXBbN5pWTZiddF/SQoy5c8TmcNGf7GaV/zLuYCEyCNrVnH5?=
 =?us-ascii?Q?PfmQSHpzYUZK4g674RZpNhWv+6v3nFmoZYeHznNPt+YGxtVHfyxoMFDwVjq1?=
 =?us-ascii?Q?kfhhsRa7TQI5Td7g1XDw73GvstsvSdlPbW4tvfxMIDTg2WXjmkaFP4hTIeEq?=
 =?us-ascii?Q?9CS5vyNLoHmkvp7CJJlF8vpTuQqYAOV529jG9822DdgfdN4jA9A/672cVkFt?=
 =?us-ascii?Q?uAoTNLohSUWg/aJj0/hVLVG+Lbim?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9576.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7Ka1J5b1lEz8gYf/H6KOBoFY4egPFROxZOQcKd5Eq5HScqxoEVxIcMbJajnt?=
 =?us-ascii?Q?gjCJcOfI9ipaEmzFWiKoT6nBEbxB1jT677S+V+dh+eL4FwRYB5144wRGv6DN?=
 =?us-ascii?Q?jehCmtqosMCLL2AQWoDItv83/tZyUK0Qwo6Wm1Ycofe8y12/XcrFbLLfYzzp?=
 =?us-ascii?Q?4nP7YSX7oeAw67F2k2NiKGem9kPtxuX81cMpyxiLerfQQGX3t3uaqW5asLdB?=
 =?us-ascii?Q?Zj1i3PCbLpyIPwXIQiwpW8s2rX7RE1blrPmscui0nPWx5iv8q1N4NAOFXlnY?=
 =?us-ascii?Q?1NPdqMzOPIq023UVF7BlmTLFqlIKkqyH+9bfbAlr3CILDcEj7vfpvrkrRBWl?=
 =?us-ascii?Q?PYIy4b5vQwDDcjq8LRpAkkN/0sp9HMmcpk4mLmk87Gt8Q9XKz2v5e3LKe6BK?=
 =?us-ascii?Q?tOuZX2L86ymDIsVEsqPBBnl+VQVSHf4q3qZz/xpykTvLm8bLiSzyIACQ7vtQ?=
 =?us-ascii?Q?Lmy5adlItCGilfN75tMFS7yUtWp6o3RCzsRQW/qCHLxDDxeg/QqscwPkQmYE?=
 =?us-ascii?Q?DvhYT6Dm6cEhhvqgkkWA2fPKHVsTj+C306gUIAJYZokEHJZlVtKrU4Tz1dsQ?=
 =?us-ascii?Q?C0M0D/Wo9k26xT5RKyeRNVQkCKOjir91DSUEfNWJ/k5XGXTYbW9Zoc47dSyR?=
 =?us-ascii?Q?BrRt6YbAVYURdoJItMyFjfHHB8M6w3KkQgMZGTu8uSnnCelCsUY09sLzpNEC?=
 =?us-ascii?Q?Z5eC50r+rEAoyar+cfdFlB+G3Npjd9vXxGDEs2VmR/79KRz9Xc5Kw18G11ss?=
 =?us-ascii?Q?9z2kfBOO4UfdETefdiAr7UqQWntaQJH0xJqPofO3PthQF/wfmVXhPj1EMV4q?=
 =?us-ascii?Q?JDNcGvCOXb8K683Wo6S4n8lKVGlsVLQZf0WWRg5kcy0Xg4rd/k4yXIirJywd?=
 =?us-ascii?Q?r6aCOoWk1LcpwWFUisCf7ndDeCydvddAYktJXgsil5hKUdZPQuebBFGQzRM1?=
 =?us-ascii?Q?4dQqmFdz0HR76Xke8uAG1DzSDdFmdmrRihIF31dElyBww2G9R4sH/92Nn9+T?=
 =?us-ascii?Q?1pJwES2wbceRX+cyc4okwlzRqSuon1OSa97zdc/RYxC9Dyife8thIXCnfjPH?=
 =?us-ascii?Q?JCP+aMjjLRTfjEputWEgdGuwxOe9iJDssUmxaGb0CSgMX09KNZKSLPznS7JD?=
 =?us-ascii?Q?k17Bu8UsqZZ2Cyinl5uso1oYXt2jRXE9L6KkH6ZIf6xfI8PsDlQVKdOTk0Z3?=
 =?us-ascii?Q?xCXVWOOhCPN8jpKn0WX0ai4zHdEroXOeJyxXpvi1Durf53wWkzVyCBt5lc6e?=
 =?us-ascii?Q?yuQZgY1L5Sr6bdXR95/YCWeyOgZZpEM+11rjV0eLbydt/xyN6B0M/2EkzCGh?=
 =?us-ascii?Q?jtiIYhab9CsgbdIsWoNn7214qsqdf+8lZWgODyHaLzHNh0SLxL7L2nMW/DfI?=
 =?us-ascii?Q?79qZaj6DmPGpxpuckmKzrlpMSnrMDC/Y4DkBpmJAR9vR2fyxRK6wRcfC7hbt?=
 =?us-ascii?Q?rlO70RGNksNeICznULaG3793z43ZCrv1l1xwsPpVlX9dhpxyZT9iUEz243jm?=
 =?us-ascii?Q?UJ1ftWSyezCJ04Zn+9cywD2CEKI17d+mAkbAM+qWsYxpzBW/p16I427NXQzT?=
 =?us-ascii?Q?GOk/T8oH/l2zYA2IVBhg3xj3CdwACy4OblljTnSHC/a8muVfcbeA0aDWWDrU?=
 =?us-ascii?Q?bw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3afddb2-ff42-46a6-4cef-08dd42152bbb
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 16:34:45.3626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YawDTQGpv/UJYUcaejk/TEWrEJLLkBBa8oK1RBBw9wviYiqgEiqjDqI/Bs9BUWc7/Dsy2kKQUe2Bg5r0auXEzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8529

This would allow apps to enumerate the supported MBUS formats available
on a certain pad.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 drivers/staging/media/max96712/max96712.c | 142 ++++++++++++++++++++++
 1 file changed, 142 insertions(+)

diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
index a078e4c67c360..d735798effa5c 100644
--- a/drivers/staging/media/max96712/max96712.c
+++ b/drivers/staging/media/max96712/max96712.c
@@ -199,6 +199,107 @@ struct max96712_priv {
 	enum max96712_pattern pattern;
 };
 
+struct max96712_format_info {
+	u32 code;
+	u8 data_type;
+};
+
+static const struct max96712_format_info max96712_formats[] = {
+	/* YUV formats */
+	{
+		.code = MEDIA_BUS_FMT_UYVY8_1X16,
+		.data_type = MIPI_CSI2_DT_YUV422_8B,
+	}, {
+		.code = MEDIA_BUS_FMT_VYUY8_1X16,
+		.data_type = MIPI_CSI2_DT_YUV422_8B,
+	}, {
+		.code = MEDIA_BUS_FMT_YUYV8_1X16,
+		.data_type = MIPI_CSI2_DT_YUV422_8B,
+	}, {
+		.code = MEDIA_BUS_FMT_YVYU8_1X16,
+		.data_type = MIPI_CSI2_DT_YUV422_8B,
+	}, {
+		.code = MEDIA_BUS_FMT_UYVY10_1X20,
+		.data_type = MIPI_CSI2_DT_YUV422_10B,
+	}, {
+		.code = MEDIA_BUS_FMT_VYUY10_1X20,
+		.data_type = MIPI_CSI2_DT_YUV422_10B,
+	}, {
+		.code = MEDIA_BUS_FMT_YUYV10_1X20,
+		.data_type = MIPI_CSI2_DT_YUV422_10B,
+	}, {
+		.code = MEDIA_BUS_FMT_YVYU10_1X20,
+		.data_type = MIPI_CSI2_DT_YUV422_10B,
+	},
+	/* RGB formats */
+	{
+		.code = MEDIA_BUS_FMT_RGB565_1X16,
+		.data_type = MIPI_CSI2_DT_RGB565,
+	}, {
+		.code = MEDIA_BUS_FMT_BGR888_1X24,
+		.data_type = MIPI_CSI2_DT_RGB888,
+	}, {
+		.code = MEDIA_BUS_FMT_RGB888_1X24,
+		.data_type = MIPI_CSI2_DT_RGB888,
+	}, {
+		.code = MEDIA_BUS_FMT_RBG888_1X24,
+		.data_type = MIPI_CSI2_DT_RGB888,
+	}, {
+		.code = MEDIA_BUS_FMT_GBR888_1X24,
+		.data_type = MIPI_CSI2_DT_RGB888,
+	},
+	/* RAW formats */
+	{
+		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
+		.data_type = MIPI_CSI2_DT_RAW8,
+	}, {
+		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
+		.data_type = MIPI_CSI2_DT_RAW8,
+	}, {
+		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
+		.data_type = MIPI_CSI2_DT_RAW8,
+	}, {
+		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
+		.data_type = MIPI_CSI2_DT_RAW8,
+	}, {
+		.code = MEDIA_BUS_FMT_SBGGR12_1X12,
+		.data_type = MIPI_CSI2_DT_RAW12,
+	}, {
+		.code = MEDIA_BUS_FMT_SGBRG12_1X12,
+		.data_type = MIPI_CSI2_DT_RAW12,
+	}, {
+		.code = MEDIA_BUS_FMT_SGRBG12_1X12,
+		.data_type = MIPI_CSI2_DT_RAW12,
+	}, {
+		.code = MEDIA_BUS_FMT_SRGGB12_1X12,
+		.data_type = MIPI_CSI2_DT_RAW12,
+	}, {
+		.code = MEDIA_BUS_FMT_SBGGR14_1X14,
+		.data_type = MIPI_CSI2_DT_RAW14,
+	}, {
+		.code = MEDIA_BUS_FMT_SGBRG14_1X14,
+		.data_type = MIPI_CSI2_DT_RAW14,
+	}, {
+		.code = MEDIA_BUS_FMT_SGRBG14_1X14,
+		.data_type = MIPI_CSI2_DT_RAW14,
+	}, {
+		.code = MEDIA_BUS_FMT_SRGGB14_1X14,
+		.data_type = MIPI_CSI2_DT_RAW14,
+	}, {
+		.code = MEDIA_BUS_FMT_SBGGR16_1X16,
+		.data_type = MIPI_CSI2_DT_RAW16,
+	}, {
+		.code = MEDIA_BUS_FMT_SGBRG16_1X16,
+		.data_type = MIPI_CSI2_DT_RAW16,
+	}, {
+		.code = MEDIA_BUS_FMT_SGRBG16_1X16,
+		.data_type = MIPI_CSI2_DT_RAW16,
+	}, {
+		.code = MEDIA_BUS_FMT_SRGGB16_1X16,
+		.data_type = MIPI_CSI2_DT_RAW16,
+	},
+};
+
 static inline bool max96712_pad_is_sink(u32 pad)
 {
 	return pad < MAX96712_FIRST_SOURCE_PAD || pad == MAX96712_VPG_PAD;
@@ -379,6 +480,46 @@ static void max96712_pattern_enable(struct max96712_priv *priv, bool enable)
 	}
 }
 
+static int max96712_enum_mbus_code(struct v4l2_subdev *sd, struct v4l2_subdev_state *sd_state,
+				   struct v4l2_subdev_mbus_code_enum *code)
+{
+	if (code->pad > MAX96712_VPG_PAD)
+		return -EINVAL;
+
+	if (max96712_pad_is_source(code->pad)) {
+		struct v4l2_mbus_framefmt *fmt;
+
+		if (code->index > 0)
+			return -EINVAL;
+
+		fmt = v4l2_subdev_state_get_opposite_stream_format(sd_state, code->pad,
+								   code->stream);
+		if (!fmt)
+			return -EINVAL;
+
+		code->code = fmt->code;
+
+		return 0;
+	}
+
+	/* Internal VPG pad only supprts RGB888 */
+	if (code->pad == MAX96712_VPG_PAD) {
+		if (code->index > 0)
+			return -EINVAL;
+
+		code->code = MEDIA_BUS_FMT_RGB888_1X24;
+
+		return 0;
+	}
+
+	if (code->index >= ARRAY_SIZE(max96712_formats))
+		return -EINVAL;
+
+	code->code = max96712_formats[code->index].code;
+
+	return 0;
+}
+
 static int max96712_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 				   struct v4l2_mbus_frame_desc *fd)
 {
@@ -547,6 +688,7 @@ static const struct v4l2_subdev_internal_ops max96712_internal_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops max96712_pad_ops = {
+	.enum_mbus_code	= max96712_enum_mbus_code,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = v4l2_subdev_get_fmt,
 	.enable_streams = max96712_enable_streams,
-- 
2.44.1


