Return-Path: <linux-media+bounces-27084-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 037B9A46558
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 16:46:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08933189FD20
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 15:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3E302253FD;
	Wed, 26 Feb 2025 15:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="ElzQwZiO"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011001.outbound.protection.outlook.com [52.101.70.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E302248AF;
	Wed, 26 Feb 2025 15:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740584411; cv=fail; b=cxA1ZhLQbToYalqlfvYbO/oOaSEG9cUXsBaCmi6oYdETbUl3iE7JgoySGcU6PTrJT+4GiJuRKWZCjmLonC2uPKuTudD7J+cmXcaXlOHbgOm0MR5UXHpoDCSCCT0TegI/CXIdNqHwTUKRzgdVrrbsDZ6AzzQ6uQNRVf3FadYq+3s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740584411; c=relaxed/simple;
	bh=YXKKPKL6EdlPD2MRZ39l4+/l42t4TGmMjbUCmEYVxMU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hf6yskbZV+ycOO1+03/fJ2VaJ0yQKdRnQljoEsMeH4bplennx/1W+G+jVjgRseIXnmbj2yZWPFf84ykqJ44N3nUxkKkTPajK3QtV8qfgpnPKhQaJRlhe1DIGjPQIdwGRYHXrFocfR0fn7w5BltPANTFZDaiRXflGz4IUixJ5kZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=ElzQwZiO; arc=fail smtp.client-ip=52.101.70.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MRH6E7WicvpZ4019/wn8MD+I8AZGtXTq/SAHZzswEUilEqrlUIyYhekxfpkFbLwbfVZviRWXxoscD6Q7AoMOySz6LdFijPuPYl1FiomPLPm8z0j2ej266cNfHN6EtBdUEJ7Z4BUCjXxp+UzV26NzOiOxJU794ZjSp/49WyxFaURcqByD2zhAnlB+SwI+FXPNHNrWcdE45vM5mzEWfbfu0iD6poheG6V/KxEpzMiWFPw5DzpUDJ/ra28zl3PbJLKeWniXSipimjKl/Ie6V+RXDJeWTv3esw1zZRYp8wswxAig4FRy+jkj5jQM1nGLhuN0CxVv41FCA3P52xpO88xPBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZzjYH+UjgmSVlqAzmJMPXm0njuyzYupkSb0KzMWImcg=;
 b=WxU/dC6fNtXkeYh4u6/OUlgonFrku/zSSfAEUwolw040BHQ0XVhDMOX64z8VheJdVUHlD4OAUAGIk5jvZg+Ng+GZaX/we1BUPtY27qiiy8rTmJATBoGdCUFXDL9WvbxBDgSkU7qnKY8auvvgKH/H27GYAkdbtFa2PMnkLRQ6V7ihlbxC7BS1juh0MRW/6rPPfmNsLcN42qLE3JRXx3VxRrNc8d4mPtXXZ45KaiaGuHoF7DrI4R55fFx9ZuxvRgYBCNuvLxAevKQMbNfceRL2BIm3wgcUvSQinjVZSszF+WkmHVtCCfPQb1lXh6wzaD/1NYARkNKpkw7DpMTDU53KCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZzjYH+UjgmSVlqAzmJMPXm0njuyzYupkSb0KzMWImcg=;
 b=ElzQwZiOPaSMm/dzHAF40BTRPwjZAWzqMzzSRIwtAbC/mcvwKmen/X7ivb4KZBNhjzkjYFP5u81yNiVDEr+M5e3imGVoZihOaaqbZqw99q6ejHZTh+vCRB4Lk3ibUmz1Rcajah40lkI7NEwsXgwbaaQBlDIMyt3elssDGAmZEVbN/ESKxqXxyvBeECA+Jefg00kgcsQxbhAXyhW2S24EzIRcTLqSZQ6aEFGwTuOmy1rAgbR9BNcDEXicVbkpb5hf47HdEg6XlSFLHAn+lPsQNzFS/dABmdvPCN1czhC45DkOUoynlN+g1AaagN7dvpvV5eVwlzyc13qkhrpnMMQnsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com (2603:10a6:10:53a::11)
 by GVXPR03MB10289.eurprd03.prod.outlook.com (2603:10a6:150:151::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 15:40:05 +0000
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf]) by DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf%7]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 15:40:05 +0000
From: Mathis Foerst <mathis.foerst@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Mathis Foerst <mathis.foerst@mt.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	manuel.traut@mt.com
Subject: [PATCH v1 8/8] MT9M114: Set pad-slew-rate
Date: Wed, 26 Feb 2025 16:39:29 +0100
Message-Id: <20250226153929.274562-9-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250226153929.274562-1-mathis.foerst@mt.com>
References: <20250226153929.274562-1-mathis.foerst@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0104.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::19) To DBBPR03MB10396.eurprd03.prod.outlook.com
 (2603:10a6:10:53a::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB10396:EE_|GVXPR03MB10289:EE_
X-MS-Office365-Filtering-Correlation-Id: f5aa050a-c584-4b21-f662-08dd567bd755
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bLEfSsi1k9pHEes0n5fvltEJ6QV3lK3Y7CQEA2T0SLBwVLz1e/Cy+FHxSAg9?=
 =?us-ascii?Q?isTf2KNMq3CWNpiJEF9TNsZWKx2Nf1B/GYJGKYtzvRda8WMETuWbPhq7oUb1?=
 =?us-ascii?Q?kNt0RwJGWwRTEwPXrC31jqL6Upk2D1zx6DesN1j2z+U1shADzGbFLKE5ulXG?=
 =?us-ascii?Q?Imr3muvGMnAhIXvcN0GLPWKULPh4mW46J9p8p3qiKmCYaAIG8SWFxF5cHbgO?=
 =?us-ascii?Q?W7ESYMGGMiOHn78c1ZRiXHaPjRC7xJLO1yi8z3IsoJVHijexeU96LTwXfL7P?=
 =?us-ascii?Q?FGERpHu/la6ZCNZumnXkvbgYPMMCJXAGpdTPws5jp7lo3tQnANF6VMxhlITJ?=
 =?us-ascii?Q?9pKHFba4LF9ImPpXwS08G/PXP0uhhILrqY5ScAbybkD9UHUizZ0A+kSR4Lzr?=
 =?us-ascii?Q?QULUMalWTmaFCLj7KOIW59kJjaN0JVZtYoq3QqAgZj1dLiCrWzgPO/KR+bcj?=
 =?us-ascii?Q?mIXZjCR6b4MzV/x7XQkdwTKmhE9RXmuomrrTPRHjtJNHW/zSv50D6zHC8ca4?=
 =?us-ascii?Q?IfF0PcWJdftcPuWnlPi4FvDrVF0gM50QMeowKiYTfSrS0QttA6jC3FCh7oEH?=
 =?us-ascii?Q?mpACv4CEqOKUGAPKYWNXhlVQTS/P+PvYT+lUBW1L5jZX0R64oyKhnEnvtLES?=
 =?us-ascii?Q?Ot5pvI/pfeyIName8jYMjL/Qi5vxLdJhyH9y/zBsoVMSwTv+0zrA393Qw2IP?=
 =?us-ascii?Q?38Ju7Q9Qjim8QT/e5M45udXuF9xzNsUugqIrefw7QnipLoiovuIawC/Hes3x?=
 =?us-ascii?Q?kBTIJGtUNnRbkhVV+it3CWngvp2tb2TrRuNodIlQLJLha6DRomib5JdVbDDU?=
 =?us-ascii?Q?fTQ2A3oHzo7MSKpZM3/e2sbimDuQ+GvweuCmt1sECEAD2JwByz/SeXMOfZoR?=
 =?us-ascii?Q?lmVxRxc3wrigJX4X2c5crNskhInddqIHM8U6r5dg43Q7A8G6XyFvJ+sJnX/c?=
 =?us-ascii?Q?0KhJilz5YI92/3pl/4FfHWLLdhOfw7F95diXcyw9g1oXVHXdCgU5lLlEQRts?=
 =?us-ascii?Q?h1cr12cQLPECakEZPAmbU0f/bmHP46ShKCM/z0LYdpXsJnNwBnXgK5u4YAmA?=
 =?us-ascii?Q?GkrbIQ7gksgzh61aj9bazMA4PbHLTRO9h31iVECC5MX3ywKGcVZS0yR2YSdZ?=
 =?us-ascii?Q?L1XxdGxDYyyGLKOg/+l1tl7ehSCOJW+UldCdF0xzyZJzG6ylf1pfhr6sE9pS?=
 =?us-ascii?Q?FeXQwFgcb4+/U6oLuJzhmIa0I9NwDEh7/F5bf3TQ/IOlrC59AVRyabzkWLdm?=
 =?us-ascii?Q?apVXW5nZnYPdm0M2/T9S34J4z43O7zVFeV+JdS4BASfF1BP5Msa0lr+hNI8v?=
 =?us-ascii?Q?sjUxg1yqhhB3YWrh4QwFsr8Pb2W4bQaDJtyFobb5x5Eh+7bWFDD4CQilRsXg?=
 =?us-ascii?Q?yKOc1Y02faNOpi2lyK3oor6CT/klM+Nwd5GKYf+cCcGfvQytpTstBmdDtYvA?=
 =?us-ascii?Q?s/33VZAj04BkarIOWZWh6xrHzbpHvT1D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB10396.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mw7QliL2OLeSei/FY7FT6dUh6MCYoZ0gnJrEx6SEUXytM2n9JqQTDw3TRNHc?=
 =?us-ascii?Q?CY+Wo9kbCZ9d+V+NqF4stzUvjoWNRDjraTrHm/+AOSWLi3mnwgoiRUoD5x+j?=
 =?us-ascii?Q?NauFe5dZVcPX7RXLCdro8y1ebDMOL7i1WdX/CuWEAnftl5D8ffVmS8LKcu33?=
 =?us-ascii?Q?9ghKO+Md6S77Fge/fciNjfIUCPWApq/mf5tpfN31QMnpCfKIdTzg0/ud16iI?=
 =?us-ascii?Q?QC40HY0zXN3WG6X8icuTk0Y927J3GXMIgGdp4Juw/DYGa+dBWekVf3qrb3J7?=
 =?us-ascii?Q?hwm0HO07XuzuParFTPJw1pGomCG3OkhYPmj1sd2Iv7Pf2S3OeVGWfMjYr9Yt?=
 =?us-ascii?Q?kQMHNDJggaaLLYYNrAY3zDRGm4CWGVWAwV0o+o+hOf+d3It7cJthpyVPwpCT?=
 =?us-ascii?Q?OyBKs0zCmVPSdxl4h0vzJyYbxm7LKI3cTj7uL3dczfSV2fxUuEl/AQpnbOYm?=
 =?us-ascii?Q?bZXeeWydZXW068o5Xfler8ehexHPSVPgbe+dIIhNOMX+E96jE5SaTksCsGaR?=
 =?us-ascii?Q?+XwQfyje9AB3DievAI15zZoMGnRwb8/fVBNnlsnrqVdoJp6m07tUY3W3/KQw?=
 =?us-ascii?Q?ZprFySqQXHd6Hq4/hwTd3x8dCqXF9ispjIXay46y3VAWlWzlyKTBT++Jvoyi?=
 =?us-ascii?Q?Pw+jQV5bCoRPtdIWJPM+4tl1MHGXzJlE/lJcF9EOPOSsQjT1V3FXybW89Wwf?=
 =?us-ascii?Q?z/+e7+mv0y4dhQMCTdWqZHUFrlaV4OFYtK+m0axS1ynPR7v59G39ftsoMfSa?=
 =?us-ascii?Q?603U2qmaPxIcgq3AO7q2IX7wmvi6s59V3Sbbep4A2G6EbMF1lRAqw8PMHDmr?=
 =?us-ascii?Q?A3asXlXQunOO8cMbGlnY0C4DwZkoiTlLqrKIGkv0UY1/fjleKittlA+Rk9p9?=
 =?us-ascii?Q?n2hGj0G1bf43lUzwV09jOcX1ceOLIScoNp4QJUVOA8UB4z1Q8s0xwohEvMn4?=
 =?us-ascii?Q?yoE8R7oIO2mC+dwoj6tz5FcWvPMIGMUgOJTfpEkteRwH4ezhKTEtr+WyXlLs?=
 =?us-ascii?Q?CaJHWFWMCjn6iMfRKBkSDJO40fzaHWkEpx8jI8qo5+ldJ6ijehrwgEXzWYmb?=
 =?us-ascii?Q?WU0DNAx/7g+OxFu4wgB6gVIPLvsCuZ7v8nzefoJUclm3wM2vx2Yw/oSofSZv?=
 =?us-ascii?Q?oFkBqXBB0WVxRs0Dk4qNnjvds8NBEbhoQ1iVquYTcrCUBF2ydnM8qG06SSKT?=
 =?us-ascii?Q?Gx//U/XV1AQc5l1TgXHzkYl4HDpmX3HQpiB+yUwy3OfhTmQdeSZr0Dbrf9KU?=
 =?us-ascii?Q?9muD4n1DRZD91DuCqNl0xP9Zz+wGE44rYampm4jPOEWprGL7snB3hS6KP29f?=
 =?us-ascii?Q?U5u2gqecyqvli6Y581tNjgyY7YA9n0n6akyTXsQy82To+Xb6jBtTPOJj+LNH?=
 =?us-ascii?Q?ht6/IfjzzfTujIVlNd/K0KlA6oqXXuz4fP2I9K0h+fy4qQxTS+U/zOk1HKOh?=
 =?us-ascii?Q?cUCvJ4miksUp20kmpnvRKF9ZZJcLgutuvVgqhE8KODlYhUszgKuadG8RnmZx?=
 =?us-ascii?Q?+gjRintwHUw3aE3p8CpQBMeYVJbFzUP4v54HaG0qX0Lu9kNvTfXvxGkoF4Fi?=
 =?us-ascii?Q?THOW312Zbx6Q9fuNtHp7xMxE8J8zntw6UqoqjtCE83jIGvhEcKwYgDXYLtZM?=
 =?us-ascii?Q?RQ=3D=3D?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5aa050a-c584-4b21-f662-08dd567bd755
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB10396.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 15:40:05.1523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rb7LUSfaLdmv7n4GcWhlRzZ52q3mjMjL+ez2MJMvfPRXV5sCmONY0IWpY7KvBxg2+Ua5DGS+dL+HVy7OB/Pz6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB10289

The MT9M114 supports the different slew rates (0 to 7) on the output pads.
At the moment, this is hardcoded to 7 (the fastest rate).
The user might want to change this values due to EMC requirements.

Read the 'pad-slew-rate' from the DT and configure the pad slew rates of
the output pads accordingly in mt9m114_initialize().
Remove the hardcoded slew rate setting from the mt9m114_init table.

Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
---
 drivers/media/i2c/mt9m114.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index f96f6c010e1b..327384e8427d 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -42,6 +42,9 @@
 #define MT9M114_RESET_AND_MISC_CONTROL			CCI_REG16(0x001a)
 #define MT9M114_RESET_SOC					BIT(0)
 #define MT9M114_PAD_SLEW				CCI_REG16(0x001e)
+#define MT9M114_PAD_SLEW_MIN					0x00
+#define MT9M114_PAD_SLEW_MAX					0x07
+#define MT9M114_PAD_SLEW_DEFAULT				0x07
 #define MT9M114_PAD_CONTROL				CCI_REG16(0x0032)
 
 /* XDMA registers */
@@ -388,6 +391,7 @@ struct mt9m114 {
 
 	unsigned int pixrate;
 	bool streaming;
+	u8 pad_slew_rate;
 
 	/* Pixel Array */
 	struct {
@@ -645,9 +649,6 @@ static const struct cci_reg_sequence mt9m114_init[] = {
 	{ MT9M114_CAM_SENSOR_CFG_FINE_INTEG_TIME_MAX,	1459 },
 	{ MT9M114_CAM_SENSOR_CFG_FINE_CORRECTION,	96 },
 	{ MT9M114_CAM_SENSOR_CFG_REG_0_DATA,		32 },
-
-	/* Miscellaneous settings */
-	{ MT9M114_PAD_SLEW,				0x0777 },
 };
 
 /* -----------------------------------------------------------------------------
@@ -778,6 +779,13 @@ static int mt9m114_initialize(struct mt9m114 *sensor)
 	if (ret < 0)
 		return ret;
 
+	value = sensor->pad_slew_rate |
+		sensor->pad_slew_rate << 4 |
+		sensor->pad_slew_rate << 8;
+	cci_write(sensor->regmap, MT9M114_PAD_SLEW, value, &ret);
+	if (ret < 0)
+		return ret;
+
 	ret = mt9m114_set_state(sensor, MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
 	if (ret < 0)
 		return ret;
@@ -2363,6 +2371,7 @@ static int mt9m114_parse_dt(struct mt9m114 *sensor)
 	struct fwnode_handle *fwnode = dev_fwnode(&sensor->client->dev);
 	struct fwnode_handle *ep;
 	struct device_node *dev_node = sensor->client->dev.of_node;
+	u8 slew_rate;
 	int ret;
 
 	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
@@ -2393,6 +2402,11 @@ static int mt9m114_parse_dt(struct mt9m114 *sensor)
 
 	sensor->bypass_pll = of_property_read_bool(dev_node, "bypass-pll");
 
+	ret = of_property_read_u8(dev_node, "pad-slew-rate", &slew_rate);
+	if (ret || slew_rate < MT9M114_PAD_SLEW_MIN || slew_rate > MT9M114_PAD_SLEW_MAX)
+		slew_rate = MT9M114_PAD_SLEW_DEFAULT;
+	sensor->pad_slew_rate = slew_rate;
+
 	return 0;
 
 error:
-- 
2.34.1


