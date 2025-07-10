Return-Path: <linux-media+bounces-37329-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF16B00637
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 17:16:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D4585C2A9A
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 15:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A02C32749E9;
	Thu, 10 Jul 2025 15:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="UhgQUTS1"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013053.outbound.protection.outlook.com [40.107.159.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4806D2749E8;
	Thu, 10 Jul 2025 15:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752160526; cv=fail; b=aHNi9bOedPexCCSde8oX88iXf3ac3hY82gbdZTZz4wwaZO+EB1Ozjq+PYgjVan7pg+FaWWrh4kEuIUp2SW8WL1tVy5LXg5GWK0DjqvwgbFJyY0sBfB/da1mMlDRDFg1ET3jkcu5toh3go4x7PuIjUFAv2RdE0vi7imKkyLNT/Kw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752160526; c=relaxed/simple;
	bh=xdjgSFAZw0jyy8wgRVYcjUBaU83EWOjH+uNk32xPQW0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EPiGR/uftBaWDDJkdmF/Xu7bOGOF999UcPQEZJxsma3W9fffc8T07rUUKl/TN3uyK8Ls6BnpHI9Ei5V8KpBgF3MXDizx49WlhmcNyiVKhQXuw4vwLx72hjxy4xCsi14h++DubIoKqwehIBdZNN6z+B4cdCWxUV09tlACywJGWtA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mt.com; spf=fail smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=UhgQUTS1; arc=fail smtp.client-ip=40.107.159.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jS/SYO0QHMgxXhjYVEn3TyoEXXug/lnYP/KI9QsuonTCEdsxNQiNX7FC9uyhpi5uik/o6SOnKcOHwO02Jw5KU2XWCEtW/fzUcVEhC7JKwfSd3cAKVtLo1O3ZXRRa2HD0MzfZcoUhqMVbJt770AflQqL3+fQIn/baLwSP4u4dkfEGEaTjqU/l8H4OUzS/rrndtmV+nZIb1Jvt3sGmyKDgBljc5aGCmDPaeTFDeXK+m+Hm7UzLHbJ9Vflq5zx8P7eCAoCxDWKR7BlzonArKnPI5EKCIPAGtxqVzJXPho4Bsl9fkComWSI1knyA+Z/8dM55gm+DmpBvKoERiajWDp6KSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h27sH7L1AG5D40ippuVZKsCp3Kb4/NRAC78B+xmXu3o=;
 b=RogsTUEIs4AYT2E/dvI5cB/u7hgn3WZcoVJI45lMtNmIRwWPhpoQiQ6N0Scm2lvtZh+pip9zkGaeqNNbyxzdnQ8hrY6ZmYTMEXaxtyiUkEkMC8c2wVfHUJrOrhGZGur26C0NoUnHH/jBGveLeH0HqK3SlMcLHgfo9NyQO2/xnjUYH90zSYuzXE3Msn4oBpT5+rQJrMnlTxrq6BzwO+Oppu8zALVGMdvDWboteasmNESwTaeYzqM8xlL+n1J9ybvfxtNwrZ13iOcQ1D+LI9+wqv4mTjlfW3yaJp8z7Qtm6NEHoBmA8L8K0H+6c30MeDldzPqfCK0mUPTc1etJ1G1/aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h27sH7L1AG5D40ippuVZKsCp3Kb4/NRAC78B+xmXu3o=;
 b=UhgQUTS1+MroLNgAOtG76cV03LzSCRksM44176qB3n2RyQCvS8IjSGosslgvnHEJ8v5M6New0liYmtAQ56bBJlRkPDFbtB/p9SILFRQnQxsTwfTtYQy/R4LuEdJj7syYCjnC3S+rshQJZLkSybPqMXnyEUUmcpXjXzvYOgmVOjJWgXU1ngRC12gRlvI7PMR15h2y8gjvGBfWqRJaiX+0aYy89OSx8VlxHJsISK4dnWO8h7pAJbNIsINuj6b59pXby+W3qN/bsNk0e8AE1BcHoDkgzICEecv73ePyonj8MD3TTiTFZSnndpCarJbpDPknOWC8lMqE0DygxiUpijHpcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DB9PR03MB7755.eurprd03.prod.outlook.com (2603:10a6:10:2cc::22)
 by GVXPR03MB11034.eurprd03.prod.outlook.com (2603:10a6:150:287::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Thu, 10 Jul
 2025 15:15:21 +0000
Received: from DB9PR03MB7755.eurprd03.prod.outlook.com
 ([fe80::2ef6:ec79:4089:ce54]) by DB9PR03MB7755.eurprd03.prod.outlook.com
 ([fe80::2ef6:ec79:4089:ce54%3]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 15:15:21 +0000
From: Mathis Foerst <mathis.foerst@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Mathis Foerst <mathis.foerst@mt.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	manuel.traut@mt.com,
	mathis.foerst@zuehlke.com
Subject: [PATCH v7 2/2] media: mt9m114: Set pad-slew-rate
Date: Thu, 10 Jul 2025 17:13:40 +0200
Message-Id: <20250710151340.496218-3-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250710151340.496218-1-mathis.foerst@mt.com>
References: <20250710151340.496218-1-mathis.foerst@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0092.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::7) To DB9PR03MB7755.eurprd03.prod.outlook.com
 (2603:10a6:10:2cc::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR03MB7755:EE_|GVXPR03MB11034:EE_
X-MS-Office365-Filtering-Correlation-Id: 0743a2e2-2ada-444b-2201-08ddbfc49660
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PleSpM29MOqyaNV1MLGpsdTk4aSm7a9DcotOKVxFzLhtVEItV8goY7Cv66ps?=
 =?us-ascii?Q?8Rgn+PyGeq1mbpST24s4YtKU/t+Qc7qJowt4FvUUMat+2mXB/lUxkJnmlt5+?=
 =?us-ascii?Q?QaXuwb4bKjxIWsaqU7WZiyixqBxQFyx/eMfJzbd8MtGLtuVKdvAfbvEwIDrg?=
 =?us-ascii?Q?CrAv0osXHGz+jv15/+Ghroffd5wG+H+Z/i8kguFMHm2Oj2oyK1lKIS78pv/R?=
 =?us-ascii?Q?/jYfksL1WcuudAn3yvnzR47vlHVnB4qhHE2XdpbDbU1Td+VR/emNDrc3y6rq?=
 =?us-ascii?Q?XBVcZsCjcj2ryF2MmsJNBDXCzl4QYr1dw1rNYZiaVlhxKF4uaPrD4YrM2dEk?=
 =?us-ascii?Q?mFZRMto6ADP9qsGErhELCB6cSjwXcKG7yvG/qubfdxM3ShnHbHyIWtNtXeP0?=
 =?us-ascii?Q?3t535cA+kN6uUOZXcC39kGEgVOhHoFTOMvwFox3dptedEVD9ay3zlZMkMxla?=
 =?us-ascii?Q?JvygeCEvOpS7beuuJ4ETg0Ohzr0w8MNHCN842J8lCSReArpgzW+pbogpWmRD?=
 =?us-ascii?Q?ZKF8jIG/+lG1BHw/F7U7ZZyie2PyKdFupEuhWa1rTr6/1dhA4b5/NdhXfiIH?=
 =?us-ascii?Q?hW+Ngu5GUMdxC70iolABByr7lz6Z065VJZAaEiLzYAHz/ZBj7eCa9HB13r3P?=
 =?us-ascii?Q?VINTA0EDly22TwGUnAVCLsIEgVVGB46jc2apgBpFHO7s9xUmwkEiRjELjoxg?=
 =?us-ascii?Q?h78MqFHCjivRbdOmddisnyk2/b8cim7ltVp5pSu4XND8DItsNf3433Ryo477?=
 =?us-ascii?Q?aBWZBFI9gI08qETUMSsLbEt8pbVEE6A9Q/VULsYKqj1YFtEaIiPd3TIG56FT?=
 =?us-ascii?Q?ksrJkBoi4CyuMGI4j+W//Cr7j1PuSV3rc7UF1ITFdj+c2kjRZFwwkeLVeZKQ?=
 =?us-ascii?Q?FT8+Zzmo97WQojLgcy7En2GMeOgXeXyF5GO9NKn90ELqP6hcmyGkhQoiW21L?=
 =?us-ascii?Q?g6/L0eQNv7jhjJ9EGx0bluzTRCye/UM24Wk1h4HQmRPb+HogTtEiTJmMYAkY?=
 =?us-ascii?Q?CxopN7LAWg+O1DB5/+MSg5B7e/aafuDJGSXZGfrBfmEK0hfJtYnvArGFValQ?=
 =?us-ascii?Q?7M3OC37Fu9Q7se1ZN+MF+RIvBcflFKYOll5GJk7A+J/S7E5SM0vbyyxgVCuG?=
 =?us-ascii?Q?MZEI7pZ4ehK4A4H7c6wG0UysR6aXTiWt1qQMMaFkz82g3h5mkUCL37Z3BVbf?=
 =?us-ascii?Q?kJT/jn2iiicqEEuR4Pa0yFIYcpwBIqVLSgftVKuu/M3HV3bK1jqNHn+wz5/l?=
 =?us-ascii?Q?x+GaV4qA/GLGt4ZMvPgEcBpe+H6bSNFWmeZoxsngCoSDfVlsPzr2FNfHa0rk?=
 =?us-ascii?Q?JzWQR4UX1uut3RXXAUVqX0DOAnHrs0cTYA0SxSNDW9wl7aWTgjXLxmG1rQJo?=
 =?us-ascii?Q?Qf52UC86ngZDwAL5O9FXwUC+XopOp6rIqqb23jYBTSVuRLZsjJ+LSjaDL2eq?=
 =?us-ascii?Q?25+bwx4sjvUM835HOucAGz6484ALnMMJBu1x8h0wuGIcf+FL0sX06w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB7755.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CvKz9/0S++BxlsBI5/zC5eO5aghavLzK4n3AeVBBj38on9xfzLVyRxOSfUBr?=
 =?us-ascii?Q?LmqqHIKq+czfAzyRLWSY6Y6yPqam2muctrNFJCPeVizT7lldXSVZ+TZPGq6e?=
 =?us-ascii?Q?8vLwbenn8BwhzCv0YUKzHNCng4CAUTGjlYIyWaK/u6Ju6hZ7Hf+JTSRsnxQ7?=
 =?us-ascii?Q?mpqYvSDArA6ns4qOablgF3dbE8PH9YE9OT+r6Zdl84ZaPrs06KTpfulM5FyR?=
 =?us-ascii?Q?fn+tweV+4AH9Lg691xSp9K2uUmCOmd767p7tF3rqab5/klLk40S0mYqtAiOU?=
 =?us-ascii?Q?ZSdUe4h9qgAeoUhp7pbMm4Z149I/E30cPwUOTMLgXwMlkbPuCfL47vImcyqf?=
 =?us-ascii?Q?yy5fJARSw69iT+wir8YV/o0GU9q7e+cYz4zzAQOFsmhcOWhpf4210iQxny2K?=
 =?us-ascii?Q?+sDeLcPV0s+mjTopsG+Tytl9mno57bClOTHkKmuAc6Hvcp31gzvBn/jn44SL?=
 =?us-ascii?Q?85D+F9ccXcTkcUDHTji4JAT9JTdwK+ZD+ZHRAwczq9j3FNXk/NAcDpXRe6S8?=
 =?us-ascii?Q?sX/0l9GkXjTr5b19dtkLvPF8lB7FJYby4RaK9MvD0wHtqxAqzvpLOG2B84Tl?=
 =?us-ascii?Q?CPSNdHHg/nCXolWxp87bd0dXMKjVMA/2fQvQFxgMdXVRaRr63OS5u6i+EAaa?=
 =?us-ascii?Q?QJQT3T0BFGabzEk9StFmoIH/5o7aSFnFg7BJiait0dy//VP5Wfqzn+Dhtjse?=
 =?us-ascii?Q?Wsu9CYUjslPXHrCek/6GFBrh9Qw4EZI0pnVAaNrNvp+a9/O4jmcG7UAunCfC?=
 =?us-ascii?Q?todt8eSCFVfiqQVT5luObiVdR53qCCBU815de0Zs3j2LOyg9CIbuiSNd2Qkl?=
 =?us-ascii?Q?3Lv4x64tkcJ4D2h99ei0fqkvkQF1f9USaqpW/sbaC58yW47+kW5BM1A6TEz+?=
 =?us-ascii?Q?0Y9vVDC+I4iE+u0IhaBGSppckqDGI17Rt0XRwuNcqzcpgatzs9IDehcRE9rR?=
 =?us-ascii?Q?L8eGA/YkcMqdlGuMaEQE4rfqnUF9oqtLgpa2eS91AKO0+/i+gvYbzi+sg4s7?=
 =?us-ascii?Q?Tv7nxai1n+9FG0xZR9vPmrZ9AFDHy+iYVpr6226POILXnpTJ1qk6YLOwV1cC?=
 =?us-ascii?Q?4s2qHxGxXiazkWOmpIBRo630tx9F046wxwnCSFSjLsWIABBTUwWxxCH8qJV7?=
 =?us-ascii?Q?z7sCTD2Dmz24E8u8mJuEtwQPSpa2xHrdkDIL1PBLsP8kBft8E80iSw3JXU+D?=
 =?us-ascii?Q?k/CS3d4cJfiCIoIa84/is3kKJdqsCO2f7K/XPR5oVlWl+VdNFL8tXeAlkOAq?=
 =?us-ascii?Q?zlB+LOJAqJ/1M10hpSPsl00iQowcn+LP/djCDB2vUMEsYAOBhL42G6TUj2U8?=
 =?us-ascii?Q?cIsHndzyZVNDka2b64xMv2W5dvl94tPEBgR4DpZIyWWTwa/PmGrbNJjjxQgF?=
 =?us-ascii?Q?obdXFSk2v9ma5tZZ0wZhacnxy1yy1lQqqsEh+QKymPYpd5ZLR06vZOL974xO?=
 =?us-ascii?Q?89bdRZdTzpduUwsAHA0M+L8l9CBoIp2n6c292nBTUonJuvLCtj/7j1iqwjam?=
 =?us-ascii?Q?U6UOGGQxKUcpYTH6/5N3yV65mALCmfLIZ6TGW32noAMVgMtqY5SPtnJ8pVbh?=
 =?us-ascii?Q?k3U56nMfvyis0Ja3/bBVosZJeLmmGu8YwXXglEnA?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0743a2e2-2ada-444b-2201-08ddbfc49660
X-MS-Exchange-CrossTenant-AuthSource: DB9PR03MB7755.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 15:15:21.4943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PmzTlPQcUsNNGDbdZuG0F1LY9dS/SQG5MbgT/v4u2GV+NLUJeL0MWYkE5hr+/klM9z24C7Gzc4DunDWrR/6xFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB11034

The MT9M114 supports the different slew rates (0 to 7) on the output pads.
At the moment, this is hardcoded to 7 (the fastest rate).
The user might want to change this values due to EMC requirements.

Read the 'slew-rate' from the DT and configure the pad slew rates of
the output pads accordingly in mt9m114_initialize().
Remove the hardcoded slew rate setting from the mt9m114_init table.

Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/mt9m114.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 5f4474d36653..5b84010a2118 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -18,6 +18,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/pm_runtime.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/types.h>
@@ -42,6 +43,9 @@
 #define MT9M114_RESET_AND_MISC_CONTROL			CCI_REG16(0x001a)
 #define MT9M114_RESET_SOC					BIT(0)
 #define MT9M114_PAD_SLEW				CCI_REG16(0x001e)
+#define MT9M114_PAD_SLEW_MIN					0
+#define MT9M114_PAD_SLEW_MAX					7
+#define MT9M114_PAD_SLEW_DEFAULT				7
 #define MT9M114_PAD_CONTROL				CCI_REG16(0x0032)
 
 /* XDMA registers */
@@ -388,6 +392,7 @@ struct mt9m114 {
 
 	unsigned int pixrate;
 	bool streaming;
+	u32 pad_slew_rate;
 
 	/* Pixel Array */
 	struct {
@@ -645,9 +650,6 @@ static const struct cci_reg_sequence mt9m114_init[] = {
 	{ MT9M114_CAM_SENSOR_CFG_FINE_INTEG_TIME_MAX,	1459 },
 	{ MT9M114_CAM_SENSOR_CFG_FINE_CORRECTION,	96 },
 	{ MT9M114_CAM_SENSOR_CFG_REG_0_DATA,		32 },
-
-	/* Miscellaneous settings */
-	{ MT9M114_PAD_SLEW,				0x0777 },
 };
 
 /* -----------------------------------------------------------------------------
@@ -779,6 +781,13 @@ static int mt9m114_initialize(struct mt9m114 *sensor)
 	if (ret < 0)
 		return ret;
 
+	value = sensor->pad_slew_rate
+	      | sensor->pad_slew_rate << 4
+	      |	sensor->pad_slew_rate << 8;
+	cci_write(sensor->regmap, MT9M114_PAD_SLEW, value, &ret);
+	if (ret < 0)
+		return ret;
+
 	ret = mt9m114_set_state(sensor, MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
 	if (ret < 0)
 		return ret;
@@ -2381,6 +2390,17 @@ static int mt9m114_parse_dt(struct mt9m114 *sensor)
 		goto error;
 	}
 
+	sensor->pad_slew_rate = MT9M114_PAD_SLEW_DEFAULT;
+	device_property_read_u32(&sensor->client->dev, "slew-rate",
+				 &sensor->pad_slew_rate);
+
+	if (sensor->pad_slew_rate < MT9M114_PAD_SLEW_MIN ||
+	    sensor->pad_slew_rate > MT9M114_PAD_SLEW_MAX) {
+		dev_err(&sensor->client->dev, "Invalid slew-rate %u\n",
+			sensor->pad_slew_rate);
+		return -EINVAL;
+	}
+
 	return 0;
 
 error:
-- 
2.34.1


