Return-Path: <linux-media+bounces-27543-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F86FA4F6F3
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 07:14:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D4F93A792F
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 06:14:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02C3C1DE8A5;
	Wed,  5 Mar 2025 06:14:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020075.outbound.protection.outlook.com [52.101.227.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23FE1D8A12;
	Wed,  5 Mar 2025 06:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741155250; cv=fail; b=X7aEn+ZDLPHKXbyfzfJpDSqmLl6V0bvg6OeWmRB0c7si+r7p3n3eBznVmF2FSeoiA0TpHxbAeMizszYhOYz7ErF66nsZetCnfI4W47pNNWj4SXXgJNWK+VdYaBsrkQ3CwdbXaSRENEhsOvCLq41bNTT12s5A+f6HcCNEN/g8O04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741155250; c=relaxed/simple;
	bh=8nA58qC5ur3EWUTDi0zUhs865IG/vfpQtraU1eTMkyg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bLGmOH7C7TJB3CodC/LS+CXhSn5pi2QTkLMHmU4joLW9wMydd/waV7/u0ppIvQy9gWSt4HqI/SKFUuO6lvvhEcxrUIhcHbVlNZtvpB+LsBQajJGdweeMxFeF81m4EeE8m8TFN0tlAKhpuMztP6F5bdJWz23WDpOTJnI7ttG5CHM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.227.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s6i8uSHCPUnvXCQOX0yO0RyCbMVLFu9R2G1eCWocjVKXFlAzq5rUB8qBmhSi/aw9dElmTjdrTf43YorTNHxlJcT1uCABqhybkQHOiI/b/yBUg2TwlmLDsQ1LPdRZ6JpI31SCAqHS1T5MA5l/GW37sTe9EamawlDSlYXfsUzIarKpa34IU3uV9Tq3ptgBGGVcfENHm3+iwMfegNN8yqZNwllyFxUUVJHgmesnYvqI1ARTXi27GSCe20P76ktAme8umQ0EU7AbbgF7S8+fkB53F0WqN4VAtlrlgwclNPiNxWe3TomcSGwj2nL9ObQz8iF/1Qq8b216Oj5bhJDXEjFKZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LZR4B8ioJCy4DFYvb9ilLwp2+lLHIfuaIKIvB4sNBSw=;
 b=otEFUb9bQflUAhkRird/MKjKx4IrI8DSQV1zpM1cXJN5Xp4080UX/YeuJLy7417+pkHa7yGTAWWRmkM/vjUtBwIQfEk4710y2jYwnGE2FBW4FmVlkMqHJheVp7TbOF190yvYJrP5lbkSn9YyIUXzTlb5ZTU4s0N6b6K3wrwTz8/KKjP7FQgquqKfME1EQ/raJseEBqo2C/d5RMdYm1sCH0pCvCSp05isdgIGHt3kpuhzOQyxKavPtPruJek22vXBTtIRuKSwrrhIVhXzDH3Ku6zZE2kCNYTvAESxLH7eOzE8NdOaJbK3srxfL7dTiwQ8V149/0PY9YoTdE9Bv7/FXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2P287MB1027.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:154::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 06:14:04 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%3]) with mapi id 15.20.8511.017; Wed, 5 Mar 2025
 06:14:04 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] media: i2c: imx219: switch to {enable,disable}_streams
Date: Wed,  5 Mar 2025 11:43:08 +0530
Message-Id: <20250305061309.17911-2-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250305061309.17911-1-tarang.raval@siliconsignals.io>
References: <20250305061309.17911-1-tarang.raval@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN3PEPF00000189.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04::54) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PN2P287MB1027:EE_
X-MS-Office365-Filtering-Correlation-Id: 75339868-43df-472c-915b-08dd5bacee2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?52IMh8CBSvf95e/DtNmjRQqYGDw0++F205aF9fl82PXeMHgj0tFzcnfwlavj?=
 =?us-ascii?Q?YLEQghxUXoDFP52O+rzQaob2HOm3Ze0Yrire+YUhsmLYTGFU2+Z70Y7jpoB4?=
 =?us-ascii?Q?CkTg0rr8Ho76Cha6WtA0UmsPZ/D2Dh2yTZpe6Dk2+6yKY5nR4YgEVP0M0ruh?=
 =?us-ascii?Q?UNzFlXsjoRjW9k6ZxCyeL34FRyg+7iAwR2iBXCd4cRaA/YX28L55N695GgUB?=
 =?us-ascii?Q?WYKGMHiwQfucsUHXIvKWNqgY+fZJVVXhCZXQctxekD3sFd1Z4kIwTJZfwuLL?=
 =?us-ascii?Q?rQVHag0PFgW+ZglaPuyC6jl/QEbqPF9SK7f8JsSp0wMhKDqrYbIrVv1pKcC5?=
 =?us-ascii?Q?7mcD+3uZFoOxOURaKn3TiPSw6nOXTNK9tLDfuWc0V4EJfd0MjgK5Zf11jsXV?=
 =?us-ascii?Q?nilXjfRYHNw7NeNWfu0n341Kleazl/8nr2eddU9MKSHiPIhZRmDAAxlG1rUg?=
 =?us-ascii?Q?Ukt6s0MnAaJFhyBSxKqCv2Lp6h52FoXITpibvIrVWPSmnbaLw+Em8hyldCwO?=
 =?us-ascii?Q?qAiLSr5TTRY8eU12QZzQ5hRgxbVCr2hec+lICao9F2MaI/zBwVRkit88zaaT?=
 =?us-ascii?Q?gTRJgzdOIDOGv+JZjEI9a5W+wLV12aT8IdWVnNLqjn7j1gpBo1cXo6zZl8V0?=
 =?us-ascii?Q?avwKp4UX6gRHuaOQQ18C2ylZO0i0LeeWe1ptS5IakhoG/wi0PjcwtpONvpiW?=
 =?us-ascii?Q?K4KmTkTKZ2X+X19vyEih4rc27RAOJp3/8QA4boLNtP4MeToOa8hZf1DpSuBv?=
 =?us-ascii?Q?sy3buC/OMvFHEqDzS/hnZA/GUnYr66r1f0uVf8qq07pjf54m0oIegQbG1d8z?=
 =?us-ascii?Q?skSmFgSJY+oEvPIStvLgPhvXhM4YqZL3RHhjz/S7826z3ZmwYRDlc62o9zbU?=
 =?us-ascii?Q?nTZgRqCCFop7yAg6PVdKGbX2U7vGW4cSzThqJtJEcLb4eHNFrLSKluEqZr0B?=
 =?us-ascii?Q?X0CLCP9rfioUWsE9H/tlBXnyXEZ15VXo5sZLaaNJIArjAMl6Vn1zEGtfmMlM?=
 =?us-ascii?Q?Ee65C+g5iKWZJSY63GMuW3ShTM7zUFnnJjMVCLi+V55h8MeRyx/jUqaWfox9?=
 =?us-ascii?Q?/CUpMuxRmZR0AzzRvnoekX9Hk1OcKVrSB7tYODgotSNwlMTXXxfFExUM0b0a?=
 =?us-ascii?Q?9XJK01JrWlKqWQ10IcidxiHhDoTPR3czoduaUUd1RorYcOF5a6Z2Tb9k+qCj?=
 =?us-ascii?Q?kV2WSElDkP4bHKD1+76RPMj/2t9c0gdBp70Rz4MmRTk8layC5xem9OxwEKxy?=
 =?us-ascii?Q?aMaPX22OTpVTeCrpn0c0uY4eDkm403iLlZF1tAkx22wMGudl6e29oL2IrarO?=
 =?us-ascii?Q?wDAZpK1JHKwcJTPvvJyh5I5cEC2Yreo5vD3Mr2oNn7Yac8eSFcQ3abApoTC/?=
 =?us-ascii?Q?He78wnaREMAiCLrg3xrQSGbfr+pnxR/sjpyluEM/4RWJUD2wqzEtWg0mfMMW?=
 =?us-ascii?Q?8Q6+KHfn/8y4BnEB8m2q4aWoqQEkhXb/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QHvuHy9+FbIVkSN0dEDrMhf8Srvg9HgCWE1lV8aePHWCeUdOdoDmCt3yBuyI?=
 =?us-ascii?Q?eKk8uwPlvJUeJtN9jL5JdF07h4t9hnlBA3e/vSj2kvpzewgEh1FaKadNCnen?=
 =?us-ascii?Q?T47CA+eqDuI61myVwrSEmDvXcH3x/sB6O0AUO3jJkmzrfRPHUQ3WswEihd4i?=
 =?us-ascii?Q?+1OIU3hYtrAJBNFifGDtA+2vTsSgGERmUv8fR3LnX2cywMoHeubCqiaCf5KY?=
 =?us-ascii?Q?z1Kta0Q2qQMksjKyCjrUHLC0fu4N1JeaDqyIGhqAamemjLZSQpNTC3yf99Lw?=
 =?us-ascii?Q?2SecMjkPgoklQhLFMNendn1WqVb/oqJ58uiHmJyjorVvRYkDWoetFmWjW3Dh?=
 =?us-ascii?Q?4sj4tjocWuPBDfYeOXT2R4Vzn4Wi1WFXMnfZ0kh7hEPwnc8/QdeLDBYqqVUX?=
 =?us-ascii?Q?R01cQijH4mztwp4YEDhcXZvtNYlTZf2sA5QRuoOPbUS0+7xNTW1Us5odLlbK?=
 =?us-ascii?Q?dO4xYqsea02Ek4VLuUgtRxG9J11I2zmxSFuAksBuf3fk2bOk+KOlUZp7FTlL?=
 =?us-ascii?Q?kzjD4u84mKwaiAGqqJaa4w8xnEg+FGDrEKxiVNy4+nQZBW/x0eMzjguE4WMf?=
 =?us-ascii?Q?v+MXv6sjMZE7wc/T7WieEoMBfOdGuvbtnwbHD5gFOSmxpVf1usUicFPzoCeA?=
 =?us-ascii?Q?RpWWp6pDFNCSp7/51lgCaEP+FvIDgrsuZbviXgnjnw9LR5FjwKo14OCx9pGJ?=
 =?us-ascii?Q?f+3ldbmptUYUOR0FSRpwvvIv4JxRpo3hDbJ4x7sSMdB5pdkzDCfpLut4a3tJ?=
 =?us-ascii?Q?Gvpu08VfuMBM1tclWY0lFTi/fxJeeyXZ4KVzhxq3UHwMOvkzRXUoKaxK+eJU?=
 =?us-ascii?Q?IChgv960zDBOtv+FW55fhbUIfQmJQKPeAgpdUY+PnH/1r6pSxcvY7goBrTwg?=
 =?us-ascii?Q?SWYmd/netN+28C6sD+aOE9jDji56x7kFViQIhg7Q2Mvr9uSp9V62yL511XR4?=
 =?us-ascii?Q?2HtjLpClb0R0SJ8hIhEfjP5GiAe1CbZ6WafO2Uz0OiY3g13scei8mLpy1dXX?=
 =?us-ascii?Q?6AShYPm8e2zpuWdTWk6sAFpPmet9mW2Gmv928K10u5R4HRbdzBbAK+w/s08W?=
 =?us-ascii?Q?bDUNt4pQwNC1mGBBYyh058hXBnfrWfXYijvlObQEUSUBnk64PPfixI99NDPX?=
 =?us-ascii?Q?SO1/k6w7K6SGeKosC2vKuzigcZB0r3Q/+qOXi55Q+h6nMzOJGsAgBRvpojxL?=
 =?us-ascii?Q?dLb7pSuIERW8xGM6Jkz0vPGNvk4DvOWDs3go2MWKNVxH/vBFjCyDFqNMfo19?=
 =?us-ascii?Q?2+ZKYTX+BJPCaH668CkfeIeq/RhYhM+WT3AYmiv5OQ6fhBB4wM1d3JsbO7uZ?=
 =?us-ascii?Q?mJ/ZJcLS9MPuimsZu7A2aruCfzEIX7mqZfaqnSLRTJuOeoje2anuctwsf2Bu?=
 =?us-ascii?Q?TU/WMLPe+V+yvviRdcF37ZlnmBIw0WVwOvDCcjAkwX5wO33iAded5jT78oL2?=
 =?us-ascii?Q?xyvvtTWW1HH/B3Z5NOgLASiRWQXDydvUzx0tO01J9gW6b6ramjIz/6KDI3CC?=
 =?us-ascii?Q?CGQZxqNRzcMrXTydVnFLLzsPyya/SLIxLJrm7N0aMXyiKYKKnxEqhMPTvwjK?=
 =?us-ascii?Q?9d8H32LHKiM566q+0kGFV/L/naKWQknr0Ur5N5MHTlBqkQcggokuykKtda0N?=
 =?us-ascii?Q?TA=3D=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 75339868-43df-472c-915b-08dd5bacee2c
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 06:14:04.5721
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v+wDRwGY+jLgJNly4/oo9Rhbo0e73gXIiv/s6spMD3zo0ENvkivJVsfKeg2BKdawdcLRPFsUldFneYxhvWEXa4c2xDZ0AJsKfu4NgqLVqj0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1027

Switch from s_stream to enable_streams and disable_streams callbacks.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/imx219.c | 43 +++++++++++++++-----------------------
 1 file changed, 17 insertions(+), 26 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index f662c9d75511..75d3123d47b4 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -723,12 +723,17 @@ static int imx219_configure_lanes(struct imx219 *imx219)
 				  ARRAY_SIZE(imx219_4lane_regs), NULL);
 };
 
-static int imx219_start_streaming(struct imx219 *imx219,
-				  struct v4l2_subdev_state *state)
+static int imx219_enable_streams(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state, u32 pad,
+				 u64 streams_mask)
 {
+	struct imx219 *imx219 = to_imx219(sd);
 	struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
 	int ret;
 
+	if (pad != 0)
+		return -EINVAL;
+
 	ret = pm_runtime_resume_and_get(&client->dev);
 	if (ret < 0)
 		return ret;
@@ -767,10 +772,6 @@ static int imx219_start_streaming(struct imx219 *imx219,
 	if (ret)
 		goto err_rpm_put;
 
-	/* vflip and hflip cannot change during streaming */
-	__v4l2_ctrl_grab(imx219->vflip, true);
-	__v4l2_ctrl_grab(imx219->hflip, true);
-
 	return 0;
 
 err_rpm_put:
@@ -778,37 +779,25 @@ static int imx219_start_streaming(struct imx219 *imx219,
 	return ret;
 }
 
-static void imx219_stop_streaming(struct imx219 *imx219)
+static int imx219_disable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state, u32 pad,
+				  u64 streams_mask)
 {
+	struct imx219 *imx219 = to_imx219(sd);
 	struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
 	int ret;
 
+	if (pad != 0)
+		return -EINVAL;
+
 	/* set stream off register */
 	ret = cci_write(imx219->regmap, IMX219_REG_MODE_SELECT,
 			IMX219_MODE_STANDBY, NULL);
 	if (ret)
 		dev_err(&client->dev, "%s failed to set stream\n", __func__);
 
-	__v4l2_ctrl_grab(imx219->vflip, false);
-	__v4l2_ctrl_grab(imx219->hflip, false);
-
 	pm_runtime_put(&client->dev);
-}
-
-static int imx219_set_stream(struct v4l2_subdev *sd, int enable)
-{
-	struct imx219 *imx219 = to_imx219(sd);
-	struct v4l2_subdev_state *state;
-	int ret = 0;
-
-	state = v4l2_subdev_lock_and_get_active_state(sd);
-
-	if (enable)
-		ret = imx219_start_streaming(imx219, state);
-	else
-		imx219_stop_streaming(imx219);
 
-	v4l2_subdev_unlock_state(state);
 	return ret;
 }
 
@@ -992,7 +981,7 @@ static int imx219_init_state(struct v4l2_subdev *sd,
 }
 
 static const struct v4l2_subdev_video_ops imx219_video_ops = {
-	.s_stream = imx219_set_stream,
+	.s_stream = v4l2_subdev_s_stream_helper,
 };
 
 static const struct v4l2_subdev_pad_ops imx219_pad_ops = {
@@ -1001,6 +990,8 @@ static const struct v4l2_subdev_pad_ops imx219_pad_ops = {
 	.set_fmt = imx219_set_pad_format,
 	.get_selection = imx219_get_selection,
 	.enum_frame_size = imx219_enum_frame_size,
+	.enable_streams = imx219_enable_streams,
+	.disable_streams = imx219_disable_streams,
 };
 
 static const struct v4l2_subdev_ops imx219_subdev_ops = {
-- 
2.34.1


