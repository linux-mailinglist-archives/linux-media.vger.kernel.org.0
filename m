Return-Path: <linux-media+bounces-28974-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CE004A75454
	for <lists+linux-media@lfdr.de>; Sat, 29 Mar 2025 06:45:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B8E497A7141
	for <lists+linux-media@lfdr.de>; Sat, 29 Mar 2025 05:44:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6493617A5A4;
	Sat, 29 Mar 2025 05:45:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021140.outbound.protection.outlook.com [40.107.57.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFF317A2EB;
	Sat, 29 Mar 2025 05:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743227118; cv=fail; b=RDfYmspNJ09o37KqdzlAWeCZ/YyEaW4oQPGnpcZcvcBZyIJkoDVvgIMx214EubJ9i/tFo4B+cUiQe/kZuRLy9jF27Rtrg5SgH8QmFaUXP2h30/4uDh6CBnsqTHGF0sWYWoLYOK4pqSjY1Q7N7jPsytUpn4uUmPdqoXLesk+miwM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743227118; c=relaxed/simple;
	bh=s1GPMlOovNRVYsCTzswDj7ZglxioGOMSlitTdMKG2K8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OKiu8AwCj8JMlmdeobD3uzrD5d0IE+OIdsjhOoDX7hTjYWA5x4e5tgiOspAE2ki44XEwugjnXPQQ0nJs8O0WcAbqtuJcFa9LXEBwNiBzvzrDc1yyG5pFDeqROeRUGKdAyp028bnTR8SDYfhBzw4Nv+nMFU0d5g/Zfr+obbhQ+y8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.57.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qoUniVI2kFNMbCEwpEk3KgjRXQhJyq75Z5hs++/V1cmk4w4h1m3RLB2VFPxn66M3/cp40+HMtdFNkSYBbEHc97TSxEs0P3JS84VB0gvrVAUrnsyLTUWYaqC3Y0fPlJNdU9L7TQufz/ANR/f7P78wS+2JRUFNYLoyZJU8Z0bkXy2CBW0NthUPmifl7+LibHUcJPk70kQopcNLr+audZUDioRKdUDmp+8Gv6J+lRVRVwfkl9eWDTwgFfUToybgZk0BSpIjvM8s/axJYSkNcKV9KmKPfIkBtKnqYrEOXg1AuPXYNKaaMd7mQ2AQTBlyNhBJtasWC+FHUX/Mb256b+AQtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=azlX4BaSHk8ee9LeL2wg8X0j41EQ3hOwgyCu2CY8QAs=;
 b=TOJJVhQhGpp0o6/OGI0WujTXXbfmWmCm4ckCKGoi5sxVJNRObvm5Uuc+yniFlNnNVWO3kPs2Z4O0ebQwmtsar8x+haQatQAu4rIXKHYUR9bBLYvCFYAfF63LRM7HarxQQ29E2Ggz7YGWnM+nKbqAELBUMvnkj7BruOeBerZ+wcwOv7XyOHumBulRYGFQPftrdHjSgEhIeRKiQmMUPBhws4pkLQw1Ah1ldIFAntz9JR+JYCyBKJRAKtS/tt8QbTZwWAhuy6Gh0GnoK5gS29R11rmjjYq6iVYqhYkfrr9F6rqLKBghhxwT8qrt0+fd0e3sJ9VvaDfMmX5GOHb8qcaa9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN0P287MB1842.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:18f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.46; Sat, 29 Mar
 2025 05:45:13 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%4]) with mapi id 15.20.8534.048; Sat, 29 Mar 2025
 05:45:13 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	kieran.bingham@ideasonboard.com
Cc: Shravan.Chippa@microchip.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Julien Massot <julien.massot@collabora.com>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/9] media: i2c: imx334: Simplify with dev_err_probe()
Date: Sat, 29 Mar 2025 11:13:23 +0530
Message-Id: <20250329054335.19931-2-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250329054335.19931-1-tarang.raval@siliconsignals.io>
References: <20250329054335.19931-1-tarang.raval@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BMXPR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::36) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PN0P287MB1842:EE_
X-MS-Office365-Filtering-Correlation-Id: 74357300-29bd-439b-f349-08dd6e84dff9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MuvLd0Q1nmM9oLB5JV25veovj4Gg/bGb2btM8pNndP7lfk5/gqB+ecpXJd/C?=
 =?us-ascii?Q?dKxlIwIvitqnP99vqHBO4z9ksvihRehJ5ootJhskzyTER6+NUtdzIjU8zsl+?=
 =?us-ascii?Q?T+MNVE6KXjC4VLKkW053uljvcq8YNeZqmHDgZCBqPL5wfKYiPReIA5VRrFaL?=
 =?us-ascii?Q?GHwOf9WzWVGgIt7SSq/M0kPNtCzxv/v7gmzvkKENnD0xyCMuSMe9FNS+l3qW?=
 =?us-ascii?Q?wpoHlntfz8UTmOd+pOA158h1cA9s+dVYFgx3ctbQSLbdaCSo0fl58o0Cy1ia?=
 =?us-ascii?Q?5WyOzYgxziMePuoyXXcOSaYJiIEARWcjBmNpA9Oz2DqSnIOhIkZThiRIj1wK?=
 =?us-ascii?Q?Do62dtCZRUrWBstegzrpt2dIpe2iW41kNcL7GMAohyHWH5ZjaeyMhvaXCPZl?=
 =?us-ascii?Q?vvj6OS9mKgg99Q3HlxwzOaJkf5BumbdmauC986ekM6okc0YdrL9lymHBx4Kb?=
 =?us-ascii?Q?Qz8vmpePbLfT0yuZ8YZBAd00xq7hSUpU9VdwPUhV5GmPPS8sxw2S6/2g3kTB?=
 =?us-ascii?Q?bsEKVC30qrhVUQayKK0jZ5gPm23++iZBAWXpp/NkPuQHr8BhChfzUYZv50ai?=
 =?us-ascii?Q?SIfhe5j2zZgDKANXeDhfiyE8IuldGfbWlW/s/Uck2zRDybflMS9LOjtvPjCd?=
 =?us-ascii?Q?KcDVAXYxpx5YFK1em0d1S2ENKENoAeEORRhIZmZIWirhbToa364Zyf+MxdoV?=
 =?us-ascii?Q?tVXdKKl+k8BunS+r9IDWEO0Ez5dGg4syXmg5LCo1JRfmsUozvHkx6vjHf300?=
 =?us-ascii?Q?o5b3eg6aE3bUbMTgzR0NuN+yHmLOwU1LDOsjmo400eYR9jrMp8layQugKvbH?=
 =?us-ascii?Q?3vEEoV8c7py7rmi6BNifPQu0lMWlo3/aqKXYYhXVRlmPPe1RgwJdLIGEwnF0?=
 =?us-ascii?Q?r4DqO4S64RCgNS7/lShExiAW4C5xHBDcpY631g26SfpzqbnkOcsBshWbIiSz?=
 =?us-ascii?Q?PsQxzy8KfAddwztVmYKaGGElbITNNQA/7BHFuImFhlYFYuAk3H0MxZuObEmK?=
 =?us-ascii?Q?xiV/ZOxLgw56j9hFssXSDKtuRA1VYlNjzCbxcwYqxyAEeBpzBsStNQ4ZVvZp?=
 =?us-ascii?Q?BlLRr6G4AgEtQUqPg/D05aYCbcG12WBjFp8c1Due1RLU6pg+fDfvjKWXppQ9?=
 =?us-ascii?Q?hbVISUfnmo2mjE6pPq1I7AdwuIpMPQ0GnrIR3gpFnn6F2WXVZ8t9R6Tp7bLK?=
 =?us-ascii?Q?HCLt1LL5D7Fl3fbIe6w2efHS5REiivpOwpH4a6mxeqGC4JOT0CNCerAyJ0GK?=
 =?us-ascii?Q?okxi2K2MeK1dZ1lEP42nHLt/8pegj/HQwaKFMJPNdLdW0jkwNyzNihTc7vQr?=
 =?us-ascii?Q?7MyS+ubn0wE8YZlHxrBi1XW9JQdB5WIsUdjGX9EN36S62ZOuRsQKzgQxmK4h?=
 =?us-ascii?Q?CrlvEFx7SnuYIHCmuLrYIaJQAW8MHAPLH5+8H0F6UgWfPC9a2Wytj1XWJXG3?=
 =?us-ascii?Q?XFMNHcxE5g4d6nzyBUQfpLlhoNjpnT5UWQBl7oZql1vOpjen4ObmDQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rCSkvkak8FQSi48jTzkP7C5D9+rqeWgvXhlUQp9e+E4OKqhHF/gu8x2dnFgN?=
 =?us-ascii?Q?MJsntvQc0beqEGIDF1zWE2L59Big1lVa0gVEbv7wthQIBTM34GMbG3nLxERS?=
 =?us-ascii?Q?dnYilWdNNe+aVtIrs/jJ7p1K0+T1p+kHHW7uZcbLwk2rCmXH3ak+T+iW2pOb?=
 =?us-ascii?Q?1IkWLEX7Q3ZohquLVLnisVAKcY1rYCISBJI0jS0sv4Hj0gh5+mmaUGH9F8wH?=
 =?us-ascii?Q?ZhHNUxirpePOcTZ/GvG0m6NETdrOVYPkkKFSs0KosX9VbEGRXN4/cHGAxeOG?=
 =?us-ascii?Q?lB4zuOuEYQ9yvcLR0jG3CAXZVsH74pGUE2uqDkv3bY4yUzr45GjEHvjJ9/1a?=
 =?us-ascii?Q?gdZN9gIZuODVsd7eSU2rrUs+QrIJhVc3cYzpJAG4Sx/+ckrbffQ9g6Q3Ai/v?=
 =?us-ascii?Q?P98pW9xrQT0hhfKHFh8k+bppWOy0lSUrpEeetCeTkdlFIlLJw7ek1r0hgHbn?=
 =?us-ascii?Q?ZDQCdbx49+Wdr7LuXp5A6R5jZNSE0k/2mC22rZMYYFONCVJtASIRaeAbwr1T?=
 =?us-ascii?Q?QghVZU2fhu/M+VoFQC8QizIT/UoGshPRYHIqsAG21LKe/b0GsqF+ujtbiYf4?=
 =?us-ascii?Q?ZNQYBthRQg4KQSVXh1EvppISgrfKs9Aw7TqmKAci3TXo3qQJhZ8w8lxANvaJ?=
 =?us-ascii?Q?PJTiEAtOU3A5HwjQtiERP0Jj6k4LsKx1iwMYL+bYFskYQz5Ql5FZP6dU/2wx?=
 =?us-ascii?Q?3SlN95YKFoIcYk5lWYOc3h3wOWEOExOnaEBqIOo81GalVD0yFPt+/EFiVjhB?=
 =?us-ascii?Q?HcNrKXFqfngr7eOUXF3uO8cpl/Bl+KDevi4KOmIaHSEdUWzbOvrHyRbaWe6C?=
 =?us-ascii?Q?7x8yG0zpTL5QCpOuHxFrkDiAo3e/gJFOqq7a83TNjVKLjZGrNfVh2rVbq8GZ?=
 =?us-ascii?Q?D3jppxdvLtjiAy3x9QgJnA9+udVhGopeVCzn7R0+X3KLn+9xXFMWZwJD7Ycs?=
 =?us-ascii?Q?L1XsDDl8NOZ00ppUuhLd/Kaot0neqffc6p24QRlCKUWsCV5ZGybi4rKclj3U?=
 =?us-ascii?Q?q1gfa4oCgv9hR7MGscO47byL6EEaDLMaw7gBbqqZF4zbo7ToJB8l0luWiyl7?=
 =?us-ascii?Q?T1Vw23jYLGKFGA22sdFnhkx5tfy6sh63ukAnSCLbOJ1Obo2lbgvsAd94HS7R?=
 =?us-ascii?Q?jGci4GmxIhH9VkBGIGPRP+V4P+28cn18mUL3FnJiqGjVyfZDwdFQZmK2eoPe?=
 =?us-ascii?Q?Zr198IOdPopfz/SM0cBvzr3HKCTmSbv8VN/aExMY/Fkg1QtqIYNh780KDu0i?=
 =?us-ascii?Q?qBLxrQxd+VXD45qtMnkaj+SKbcD20teyPTDDZejUlU3QhUNxamOUSrpvI5F5?=
 =?us-ascii?Q?kI/uPLzBcwwa/wyEdq8IXasdBBop3dOavvSgXpepuMLaDZ5P/o0LYFcspFT7?=
 =?us-ascii?Q?pKASypbdD6QZb2BTgRE5zwPM9BQqvve+V54vcQ4Wvj2hDSRcxALhtM8b5SCu?=
 =?us-ascii?Q?eMpSAO7MPRN9dPkTRVo8wNBh5mWY1BAC94CzfOyp9rcHoD8cktgPSxCuns1s?=
 =?us-ascii?Q?aYUxa8ogtiK0PcEuzeXpPdxL3E+qDEldNb7InFjj2j4W/UqJORCHNdWNYVVw?=
 =?us-ascii?Q?WYA8fih7ywYwO0Bsxl+j+WqKiPTwnJefuttwDKw+ylCJZubc7+xfw0H6o43o?=
 =?us-ascii?Q?XA=3D=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 74357300-29bd-439b-f349-08dd6e84dff9
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2025 05:45:13.0594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GVE+L0zMdUE3Mg0Y2Apk+Gk/DmmhKJKRxnwdWc4aKqsXZbFaD7R74m+T7S4xq0B+EuFuWOR3ctS6KqlmEMZ2qjv7uTclW7UN3H3rW4STQHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1842

Error handling in probe() can be a bit simpler with dev_err_probe().

also, Added missing newline characters (\n) in error messages.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/imx334.c | 61 +++++++++++++++++---------------------
 1 file changed, 28 insertions(+), 33 deletions(-)

diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
index 8cd1eecd0143..ad0b03a3f573 100644
--- a/drivers/media/i2c/imx334.c
+++ b/drivers/media/i2c/imx334.c
@@ -658,7 +658,7 @@ static int imx334_update_exp_gain(struct imx334 *imx334, u32 exposure, u32 gain)
 	lpfr = imx334->vblank + imx334->cur_mode->height;
 	shutter = lpfr - exposure;
 
-	dev_dbg(imx334->dev, "Set long exp %u analog gain %u sh0 %u lpfr %u",
+	dev_dbg(imx334->dev, "Set long exp %u analog gain %u sh0 %u lpfr %u\n",
 		exposure, gain, shutter, lpfr);
 
 	ret = imx334_write_reg(imx334, IMX334_REG_HOLD, 1, 1);
@@ -705,7 +705,7 @@ static int imx334_set_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_VBLANK:
 		imx334->vblank = imx334->vblank_ctrl->val;
 
-		dev_dbg(imx334->dev, "Received vblank %u, new lpfr %u",
+		dev_dbg(imx334->dev, "Received vblank %u, new lpfr %u\n",
 			imx334->vblank,
 			imx334->vblank + imx334->cur_mode->height);
 
@@ -725,7 +725,7 @@ static int imx334_set_ctrl(struct v4l2_ctrl *ctrl)
 		exposure = ctrl->val;
 		analog_gain = imx334->again_ctrl->val;
 
-		dev_dbg(imx334->dev, "Received exp %u analog gain %u",
+		dev_dbg(imx334->dev, "Received exp %u analog gain %u\n",
 			exposure, analog_gain);
 
 		ret = imx334_update_exp_gain(imx334, exposure, analog_gain);
@@ -759,7 +759,7 @@ static int imx334_set_ctrl(struct v4l2_ctrl *ctrl)
 		ret = 0;
 		break;
 	default:
-		dev_err(imx334->dev, "Invalid control %d", ctrl->id);
+		dev_err(imx334->dev, "Invalid control %d\n", ctrl->id);
 		ret = -EINVAL;
 	}
 
@@ -986,7 +986,7 @@ static int imx334_start_streaming(struct imx334 *imx334)
 	ret = imx334_write_regs(imx334, common_mode_regs,
 				ARRAY_SIZE(common_mode_regs));
 	if (ret) {
-		dev_err(imx334->dev, "fail to write common registers");
+		dev_err(imx334->dev, "fail to write common registers\n");
 		return ret;
 	}
 
@@ -995,7 +995,7 @@ static int imx334_start_streaming(struct imx334 *imx334)
 	ret = imx334_write_regs(imx334, reg_list->regs,
 				reg_list->num_of_regs);
 	if (ret) {
-		dev_err(imx334->dev, "fail to write initial registers");
+		dev_err(imx334->dev, "fail to write initial registers\n");
 		return ret;
 	}
 
@@ -1009,7 +1009,7 @@ static int imx334_start_streaming(struct imx334 *imx334)
 	/* Setup handler will write actual exposure and gain */
 	ret =  __v4l2_ctrl_handler_setup(imx334->sd.ctrl_handler);
 	if (ret) {
-		dev_err(imx334->dev, "fail to setup handler");
+		dev_err(imx334->dev, "fail to setup handler\n");
 		return ret;
 	}
 
@@ -1017,7 +1017,7 @@ static int imx334_start_streaming(struct imx334 *imx334)
 	ret = imx334_write_reg(imx334, IMX334_REG_MODE_SELECT,
 			       1, IMX334_MODE_STREAMING);
 	if (ret) {
-		dev_err(imx334->dev, "fail to start streaming");
+		dev_err(imx334->dev, "fail to start streaming\n");
 		return ret;
 	}
 
@@ -1091,7 +1091,7 @@ static int imx334_detect(struct imx334 *imx334)
 		return ret;
 
 	if (val != IMX334_ID) {
-		dev_err(imx334->dev, "chip id mismatch: %x!=%x",
+		dev_err(imx334->dev, "chip id mismatch: %x!=%x\n",
 			IMX334_ID, val);
 		return -ENXIO;
 	}
@@ -1121,24 +1121,20 @@ static int imx334_parse_hw_config(struct imx334 *imx334)
 	/* Request optional reset pin */
 	imx334->reset_gpio = devm_gpiod_get_optional(imx334->dev, "reset",
 						     GPIOD_OUT_LOW);
-	if (IS_ERR(imx334->reset_gpio)) {
-		dev_err(imx334->dev, "failed to get reset gpio %ld",
-			PTR_ERR(imx334->reset_gpio));
-		return PTR_ERR(imx334->reset_gpio);
-	}
+	if (IS_ERR(imx334->reset_gpio))
+		return dev_err_probe(imx334->dev, PTR_ERR(imx334->reset_gpio),
+				     "failed to get reset gpio\n");
 
 	/* Get sensor input clock */
 	imx334->inclk = devm_clk_get(imx334->dev, NULL);
-	if (IS_ERR(imx334->inclk)) {
-		dev_err(imx334->dev, "could not get inclk");
-		return PTR_ERR(imx334->inclk);
-	}
+	if (IS_ERR(imx334->inclk))
+		return dev_err_probe(imx334->dev, PTR_ERR(imx334->inclk),
+					 "could not get inclk\n");
 
 	rate = clk_get_rate(imx334->inclk);
-	if (rate != IMX334_INCLK_RATE) {
-		dev_err(imx334->dev, "inclk frequency mismatch");
-		return -EINVAL;
-	}
+	if (rate != IMX334_INCLK_RATE)
+		return dev_err_probe(imx334->dev, -EINVAL,
+					 "inclk frequency mismatch\n");
 
 	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
 	if (!ep)
@@ -1151,7 +1147,7 @@ static int imx334_parse_hw_config(struct imx334 *imx334)
 
 	if (bus_cfg.bus.mipi_csi2.num_data_lanes != IMX334_NUM_DATA_LANES) {
 		dev_err(imx334->dev,
-			"number of CSI2 data lanes %d is not supported",
+			"number of CSI2 data lanes %d is not supported\n",
 			bus_cfg.bus.mipi_csi2.num_data_lanes);
 		ret = -EINVAL;
 		goto done_endpoint_free;
@@ -1205,7 +1201,7 @@ static int imx334_power_on(struct device *dev)
 
 	ret = clk_prepare_enable(imx334->inclk);
 	if (ret) {
-		dev_err(imx334->dev, "fail to enable inclk");
+		dev_err(imx334->dev, "fail to enable inclk\n");
 		goto error_reset;
 	}
 
@@ -1349,23 +1345,22 @@ static int imx334_probe(struct i2c_client *client)
 	imx334->sd.internal_ops = &imx334_internal_ops;
 
 	ret = imx334_parse_hw_config(imx334);
-	if (ret) {
-		dev_err(imx334->dev, "HW configuration is not supported");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(imx334->dev, ret,
+					"HW configuration is not supported\n");
 
 	mutex_init(&imx334->mutex);
 
 	ret = imx334_power_on(imx334->dev);
 	if (ret) {
-		dev_err(imx334->dev, "failed to power-on the sensor");
+		dev_err_probe(imx334->dev, ret, "failed to power-on the sensor\n");
 		goto error_mutex_destroy;
 	}
 
 	/* Check module identity */
 	ret = imx334_detect(imx334);
 	if (ret) {
-		dev_err(imx334->dev, "failed to find sensor: %d", ret);
+		dev_err(imx334->dev, "failed to find sensor: %d\n", ret);
 		goto error_power_off;
 	}
 
@@ -1376,7 +1371,7 @@ static int imx334_probe(struct i2c_client *client)
 
 	ret = imx334_init_controls(imx334);
 	if (ret) {
-		dev_err(imx334->dev, "failed to init controls: %d", ret);
+		dev_err(imx334->dev, "failed to init controls: %d\n", ret);
 		goto error_power_off;
 	}
 
@@ -1388,14 +1383,14 @@ static int imx334_probe(struct i2c_client *client)
 	imx334->pad.flags = MEDIA_PAD_FL_SOURCE;
 	ret = media_entity_pads_init(&imx334->sd.entity, 1, &imx334->pad);
 	if (ret) {
-		dev_err(imx334->dev, "failed to init entity pads: %d", ret);
+		dev_err(imx334->dev, "failed to init entity pads: %d\n", ret);
 		goto error_handler_free;
 	}
 
 	ret = v4l2_async_register_subdev_sensor(&imx334->sd);
 	if (ret < 0) {
 		dev_err(imx334->dev,
-			"failed to register async subdev: %d", ret);
+			"failed to register async subdev: %d\n", ret);
 		goto error_media_entity;
 	}
 
-- 
2.34.1


