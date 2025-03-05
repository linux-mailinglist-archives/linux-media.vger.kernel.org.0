Return-Path: <linux-media+bounces-27640-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C429A501D6
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 15:26:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3BFA1895C22
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 14:24:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C86524E4C7;
	Wed,  5 Mar 2025 14:23:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020129.outbound.protection.outlook.com [52.101.225.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4469824CEF0;
	Wed,  5 Mar 2025 14:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741184580; cv=fail; b=ohEzLLRT+MpB4msT7OyKSXY1CbEadn0v1LF+rzrKP726M3YBeAGOFdUQEYdWtzBdzd7f99I6AB+te1YirzcM1XnhBjTZt5RpItrKjjywHzT9ECvttyfsUIOjWwDNOmOVzOqd3hnMAAxOIG8axVe7DCp4hrYktrmmhg2AriL6njE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741184580; c=relaxed/simple;
	bh=RA1jCBUo8A0xGhFZlZtu63ZiK0LiShk3+r0MKw0c9Ak=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KL54oJLEo6Fvg266QYad5SYeCvfmpfsliHlBCtecxE4i3+LJYKxvOd0+JspXkuX7a93ir8yVcd56rm8s1CVjvO5FfPb4ZE+jptU/c47ks28tSvJrIlsQ7jVlNsRrn7AL0xngwMtpVRFqoHjKNhR6b328vGz906973S/ubCccMuc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.225.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rFmgJg6wVyBINLod3JmstGc4vS5BkH+oJ2+HhbNhlF8ZqDlq4PzRr7M8gODWmh7mg4M8BaOiruzHifCP5aXrDJb6CwPi/LIftjnaR3b78V+UozrkyUM36/8hjB1Nl4SrpPqaj504agpsOK0Gjrh0UXj2Y3BNS6oidGCZJnZGwOAzEIZakmwN2MnR/gnMAslgqm+Fe+SZJpoECBKSSVIuqfluzVxiPZLt/wN8dwcxJlMyW/Ghz2/FSflIhckU4+Rp1vi1LA8DSjJos4cOgu4MGKn+0Qn+lYqGKIzhmKNYW98kDXKxATje+5CFU2GDbEMwfsz8NfwigiptRdmhMgGofA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SCyxuHHCIr0Y799oaE3229se6t+xk0Djbvk3PbwrYy8=;
 b=EdCn3EDTT5sC2ZOamgmCl+k8TPCVPlVRWZ5u5CJ8ofzRSYw2yCxFbexmcmBwd06Hs4fYM1R95+a/Fq2+yUg9fuECrP1qyQwaXKrT869ck+XoHVIj4tYWgpot4nqNkjB8BY4bZaD7t07sJqx4GZm9+CTJzMqBC2OqzcmkHojgaANXT9ETteR7bLyg1SSO50QsPKBLVukLSUMVCh5vKR+YyHDZpUiiuD/0aQvPd2oCvvuygkA+ChnlPztNBqFzBHvVqbQrKZm31Ku40ASD3zzP27hm0PE6Y41Lo4tmy4/MBPHsI2N06yEEXFA2eQpZJ2XUM2oLl7qMFNlPa5iDRUjU4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MAZP287MB0486.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:d5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 14:22:53 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%3]) with mapi id 15.20.8511.017; Wed, 5 Mar 2025
 14:22:53 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: kieran.bingham@ideasonboard.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] media: i2c: imx219: switch to {enable,disable}_streams
Date: Wed,  5 Mar 2025 19:51:15 +0530
Message-Id: <20250305142117.29182-2-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250305142117.29182-1-tarang.raval@siliconsignals.io>
References: <20250305142117.29182-1-tarang.raval@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BMXP287CA0005.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::19) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|MAZP287MB0486:EE_
X-MS-Office365-Filtering-Correlation-Id: 2478d61b-dbad-4c95-7025-08dd5bf13782
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8E8yBsazSvsWWJcvN1nbbjNTsqzmqh+68zVwHQG93KO5Yx0kYyCrR/fO9mVU?=
 =?us-ascii?Q?iujOMk6XS2d9AJUsKffSjvYYoNSDy5begE3BSQAVRXNcjhw37Q2btLb4WD57?=
 =?us-ascii?Q?hE2CH/I86+NBwtVIdQ6tgGSHo9EdIPjkI8PKto8wWudtheMkKqlyj5S9/VEs?=
 =?us-ascii?Q?3c5XLTtNe3iaXV1r429EYWWTa2MqIuBFtBh/uJG3A38DqbTCwyGlpWz7I/ep?=
 =?us-ascii?Q?p0WhGWUeJo5l6Zty0DE6uwZIQzI/bs1RWW9oPdkAnmzCCCS/nk1i4zqMxr2e?=
 =?us-ascii?Q?4f9Gu4NQUokdRkzBFty2DuRnQPxmvasWqkWYFeWfRTikMvPN4C9QYtWUzVtJ?=
 =?us-ascii?Q?iWBpXaNY7VAc0hs5F4Zyxk7L4TnfdIgdQJjh8YmvdLSdcKd4OSOYrCQ3VYWr?=
 =?us-ascii?Q?OTUsw2RpBq3zwf7fa4jatVl22f5RE6RV8XPFK+yBWBAfoMZVy4fUPZVy9+o7?=
 =?us-ascii?Q?UNOTZ5ezsgXwIpbCgQq0DoNkCXB1w9xSyeaYUH/c/93a7/XYlzk6+xvmP/Dn?=
 =?us-ascii?Q?nnpLZCw6MfWnk3kMTimAS1qjd15k1rdropT3CwsnkAQLacyWnnyG0a6eGS+E?=
 =?us-ascii?Q?jeCES+uPtVZkBBcFqA4I1banBZG7l3AUJQC7Wrtd7BjCghHPQY3Y+GR/R0rX?=
 =?us-ascii?Q?0pAzEccvn6sLK6uyt7fmX4GGB2nGLPTwdOMlKAOV3BbaniOBCzbnJN3JE3AS?=
 =?us-ascii?Q?aNSZrVFLd30rG4GNkCKxEr3fv/m0AoF/MPS1vf8m6ZT69/0D1OToiAz7h/Ti?=
 =?us-ascii?Q?WyiZ3oe5FrDhf/j1K/ffihOD26rBLvjBD56MqOaLU4WbiEntw0CGRDeQ5pJ7?=
 =?us-ascii?Q?XUiNsUUdCnTdpRZiZn8nCai5ZUL4QCFmwgYdpXoC4vJkiqp/ViprtUoZDsGz?=
 =?us-ascii?Q?QNxh3HleWNaO0aaCPyvKG/q1p+HOn+RvSTJWGckqRbdpGL6xASCBGrblxmUV?=
 =?us-ascii?Q?EiKw7MFmFvQax/KW6aeFXGiN86ZuLHSq8/4bo2s1nKQp6ISq6k1tWxkr4iyH?=
 =?us-ascii?Q?l+8upBJwIl7ohTBx1iZz7Bolfa0MdHZoFd520U8OTvpKwtTSf1QMmtW2eyPd?=
 =?us-ascii?Q?VcHgxwKO92oiDW8nOL1F7m9NqHg1OAHKWPEquxZcvkPcegHI1XBpSEvA6eWF?=
 =?us-ascii?Q?CXe9yYbnzP+oDLScMGgO+2piGQge58qsNYNnx461lvSLcIfaI/ETE3BfvCt9?=
 =?us-ascii?Q?k90fgi+5+Qh1O5HbcDB5MBm13VnlkRgLc6Cq7wQsYRx7ARpZJ878mri6w6Oz?=
 =?us-ascii?Q?mU/klY5zixFSBmigMZ0rt51RfXcyja7Q1R3nwItnWJpvcfccmIVEhfnw3muN?=
 =?us-ascii?Q?80Xl1PjQMlSAV9bxbMHPUfoMEvDCqMzcsKRrhvAIqlg2AD0lbVLO5HGu/23u?=
 =?us-ascii?Q?X1t1kJdVdR6S7hbtwQ/3tIbBpd1uEfluGmtA1a2HMpZrLH8wSWLg81zxecv2?=
 =?us-ascii?Q?jcAjtUnQqR911ptL+x2s8wNBb0XYAlZG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?c21KTF2hUB2CWh4tmpU//vT2bvcv3rKB35PhuUGPnT4OYKu6iAb7hep//sZ5?=
 =?us-ascii?Q?ivpMlDZFYjA0sBim79YmyGVVmTVq7GiUQfaAInAGshJc+XEEESp9EzsTu9+F?=
 =?us-ascii?Q?cT11Ky/HUN5WJmJ6HiszYFAqnYuoqV3nujJ5xstZ442uTxXyucknHxFedwd5?=
 =?us-ascii?Q?XETe9vGbc1T1nNxY+2zh6KZ7Ft0H41ikMzCmlSza/cw05TgCEJ/U1v7i7et0?=
 =?us-ascii?Q?yzRn+s2hEnJ7N2y/gwH2I6f3Z2biZaMTffMNiQJXXYlxgTAXHAiuH7zVTyEe?=
 =?us-ascii?Q?XyhNqUhnlBGjZufGRcjfjhq3aC7dogQhQ9ooPQydCiEvTxA0SQ9pO4cnxdIU?=
 =?us-ascii?Q?rw2cuvIZHhjUd1xjbIpmP4MMvxaCpl+fC3EKuoZAl6D/9dDK+QWjpm6rdev8?=
 =?us-ascii?Q?YYVB0LQx2wqjEPxqFqkZiHMu8KHPXZVc3IR+5nYAa+Nz3jislPvmreAJYl5l?=
 =?us-ascii?Q?74n9M1KClHUdlGWlJN63Gq+aLJV8B4XONKMzDxRTmR9Dj+YPQHxBgORXKTId?=
 =?us-ascii?Q?/l9TxUL7ZOK5K2iOUhnvhkNbom4D3H760cK3acxglK5Ji0qTnAphcSCc1hyz?=
 =?us-ascii?Q?qe3EkUvaAou/Lju3ypzBXCSQLeMd3VCitPYDtpESlMiPi2fbSNeQxhp35t0s?=
 =?us-ascii?Q?6fz7bk2p445N83AfIP+FebSfxHyh5cJT7f7vxeZfSp1isEJzeplZ/QWaXo1i?=
 =?us-ascii?Q?px1LE7CEb4ZBp/4qo6S7J/MUrUHOXb73aPihPU7nr2/PEjJVJHZfESWiYt1H?=
 =?us-ascii?Q?335PO34lyvhslZP6wbIaXgGKotSAb6RfLadkggkD0cY0VwMy5X/tQXG0xq61?=
 =?us-ascii?Q?j9RzL0A4k9HqCtRGug50K2BLNzy0tU3Zzzez9xzCYED1lR5m8U4RLGxJ5QWc?=
 =?us-ascii?Q?dyrs4VOG7xWZRCykYCktnTiWNvDHRN7xTZ2heCHUeXeqwSys00K7b4XAN65i?=
 =?us-ascii?Q?X45S3ltlC3T+pR5Iivi7Jykb8qkz7kmJdpttXZdD5mGnd9pVjBBd/SE9pyJl?=
 =?us-ascii?Q?e2YaCGaCmbBcUa67KH0b4fB/+zOa479N7m5aO3ZFkU8+PJeR2d41KdxwwOr3?=
 =?us-ascii?Q?6uvQRAruWEIuGKbmVrPIpA5fcXsZ4dZT5Uw60BZ3MQUa7Xf4Sy3hCcJiRp5r?=
 =?us-ascii?Q?S+015Rcn797zN/Wy/P0HTIkgefcFrLS642r/p5+iNJ2tEHfL2pBsG4PzTGqk?=
 =?us-ascii?Q?VHQMEfAbFWVocAwvWFDTaqtO7VzAkblC2SbgPzHbJgFRwRU10+h94pEpNNg2?=
 =?us-ascii?Q?Ge9VIifzpkn+ZKTLZVa5pPEcTP8KyKcV8cRMdu6mHk4krXUAFN385bhfWBSf?=
 =?us-ascii?Q?dfBi6zm5QkG7M4nFI81g3KNWVjb5WbMoqsLwVqkS/tqD79ujYLpv3Z8qjjb3?=
 =?us-ascii?Q?xCSSK+96eFmYX06j9QwA21gK3d5IKW0KA6nzWmrbpYndlSEmVs1zjMHaxn/e?=
 =?us-ascii?Q?mzGAb5dryqLPADArkCvqkixPcNmeYfOPMSEMiKls+WN3lechQG9dxagEpK1j?=
 =?us-ascii?Q?nBcxXeu3ah2dq54YzJVdkjyVvvhi0I5mjP/YxoK2ehqYBy7JOIbiK5kZETCT?=
 =?us-ascii?Q?QXbF2YJp0cotwZ2CnRcrVZgpnlN/eZ88RBgG1E4JKxYztCejYlqbcd8Yg2Jz?=
 =?us-ascii?Q?qg=3D=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 2478d61b-dbad-4c95-7025-08dd5bf13782
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 14:22:53.4029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c/kvybJqdBDJ36YmxSVqgv2AtZPa9cQoN8kSPwV3J5PIqkHM9XHRagHaaNuuOcWlTa4t8bSk6Mx7lChvCp/Mj31tPbpljmZoyI0lqKoKbRs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZP287MB0486

Switch from s_stream to enable_streams and disable_streams callbacks.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/imx219.c | 36 +++++++++++++++++-------------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index f662c9d75511..12f1aa8824fe 100644
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
@@ -778,11 +783,17 @@ static int imx219_start_streaming(struct imx219 *imx219,
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
@@ -793,22 +804,7 @@ static void imx219_stop_streaming(struct imx219 *imx219)
 	__v4l2_ctrl_grab(imx219->hflip, false);
 
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
 
@@ -992,7 +988,7 @@ static int imx219_init_state(struct v4l2_subdev *sd,
 }
 
 static const struct v4l2_subdev_video_ops imx219_video_ops = {
-	.s_stream = imx219_set_stream,
+	.s_stream = v4l2_subdev_s_stream_helper,
 };
 
 static const struct v4l2_subdev_pad_ops imx219_pad_ops = {
@@ -1001,6 +997,8 @@ static const struct v4l2_subdev_pad_ops imx219_pad_ops = {
 	.set_fmt = imx219_set_pad_format,
 	.get_selection = imx219_get_selection,
 	.enum_frame_size = imx219_enum_frame_size,
+	.enable_streams = imx219_enable_streams,
+	.disable_streams = imx219_disable_streams,
 };
 
 static const struct v4l2_subdev_ops imx219_subdev_ops = {
-- 
2.34.1


