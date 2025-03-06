Return-Path: <linux-media+bounces-27672-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D962A54235
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 06:35:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38929169CA8
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 05:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43DE41A00F0;
	Thu,  6 Mar 2025 05:35:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021074.outbound.protection.outlook.com [40.107.51.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D9219E971;
	Thu,  6 Mar 2025 05:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741239309; cv=fail; b=P6nrMszDxkCDB0FO4QiFKvFPduU/bOU4kMcrhs7BniLZsRNKdWL6htRm2jEcdHHhJlh1ieV06aStNrrBx3JiLcTbLbf68ozLauF/3xWoz3PDKA7p2aYjNONlvawocRADRDel+ylvaTtb7VaUaKdxrn4m9YhRSp4j5fZw2q+aLIo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741239309; c=relaxed/simple;
	bh=d2TuhWKMGYs0EVnBACGAdPLLjctR4FFRocV9OQexQs8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=V1WCGNBaV5JmYh16z58sfDM4TYahOorbsqriqqjO9DeX3N4p6RhXdcqFYF3trHXHywj2daDycQuGFFlSQ9HPJXyN3ipor+MjkslGIsv5LMLfwik6NrvTmxCR44tW/wePWUlIq+iLFxtMaeVQI/oivbH2MtxKsVRCynhB/CfcLQE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.51.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jmk7tgq1aZgfg9EIwpL0JMNEwyXB7tcV0DAOd/Nj7qvuLcIbnxKAi5li6JmETh+nLuFOZfYajUJ5d1+M8mT2AD1+jcP+Xl60AFUNY21Xs38HNjwthOsT0STf6WZdx3AIgAUy3mw7K81lNCXGhkUYKg/B3fIvSiFHHATnNkFbmXS1OX0vsOuLYAL929YC21b3JDbM7TBQgKMaTYmDjBLHYuqKcQcIhNaT10KhCvqLAbdfC0z9UJJMRYxGuUBqkSyAm56CY7VsVtAXBVgZBc0VrQocCG4y5JTtGCa5HApnEqDkWcv7COvQRZYsUZ/9oaKYReAsVdcTj6Sbyf2HQSAkEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cgml1PYojAZ8BhvrCT+xdeoS6QCM1jvpuD9CUpekvRw=;
 b=sLET1kfZr8AR8LPEmoEL04BG30N7EnrDiijZyyrttH4uQjG3okEeR0gjAxWKS3XL10Nmb+ZC1m+l3bQ3/ItOfFk83bgQQpmYQhEzDEXsOU2sSeligA22CD+7wcH17ZnxTQ0FznsL24YmFqIfOyNd8g3aiTLEJZ+yFcHkSdbhppJlMEWRd1MYu+5q4dZVASn99RYr2lQ7d5T62/j4qRE6JnIsZqZDtWI93wi93kaHXlZSSs/CAPj5W5N3mrUFnxKsO0yxb/w/f1dyNxUvRfs44b8GqnjXZkpgE9Irw160o659Q94PPTJN1C4KWaWqXZ+wzp6mHcVglCqLqjZWasR3qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN1P287MB3789.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:256::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.18; Thu, 6 Mar
 2025 05:35:00 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%3]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 05:35:00 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] media: i2c: imx219: switch to {enable,disable}_streams
Date: Thu,  6 Mar 2025 11:04:43 +0530
Message-Id: <20250306053445.40054-2-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306053445.40054-1-tarang.raval@siliconsignals.io>
References: <20250306053445.40054-1-tarang.raval@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN3PR01CA0128.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::13) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PN1P287MB3789:EE_
X-MS-Office365-Filtering-Correlation-Id: f973f480-1fcd-40b3-86ac-08dd5c70a36d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SmlmZ0AQ7SUEsY+19P+0p9Dox1nlyaMxptLXRPO1dDp2gu1YCC6r9ijf8vya?=
 =?us-ascii?Q?GDTOpbleZXmy4Px6uObeYwukiFZLy+w1UlQK9WyxAs3SqdvCFUxYkKxPFf0b?=
 =?us-ascii?Q?bssVYqhTuufys521FS4UtxrYLa1hen+zYYaOOUFvUZnDesIbrm+SS+tvXoyf?=
 =?us-ascii?Q?fSo2sqvn1eXr1ikeb+SufPc1kKcrVzn7VxTxS/bOxGqbs0eEUS7aywKg22QH?=
 =?us-ascii?Q?5SqtHVe1FOe8NA/0dWn4nI9lpBiL5DBUCiaI2P4YMr03TX42I59DXKSLjMoc?=
 =?us-ascii?Q?SNLyOs3VTzMMUVInxqhJBuBuA6jnPzAUUJ9FQLU28EJ9iWYEK1Yrg9ZctQ7d?=
 =?us-ascii?Q?fqeOrqG+9UOoYOYyplmlf2JUBVWwiePSgjEORdmrw9TFH7bg/fvwOYhiMlEH?=
 =?us-ascii?Q?V7m7MyDSRKTBrZfdwPiwycMYrUTvIcqwCvh5TvAur3A50q95nhuIz2eOKYgf?=
 =?us-ascii?Q?IIhqAppcfrQjdTrbmgOkPNddTq+uGid/dTZY0DeQhCcgmbncn4SWvXNTf3gC?=
 =?us-ascii?Q?xtmQq4bysycCLYoaEwcRzDiZd+pdsoZJ6SenXtmGekkmdMNUbGm5G0G5GZCE?=
 =?us-ascii?Q?l1EeA+9uAFkPhyif0L5uW+ZMWQe+6RVLhzXI2m5izCttgYtRCm3GC5fB3Utb?=
 =?us-ascii?Q?thz61Ubm3nWVnqKM5jx9WzWtYl/HeQGkiKKyQQD92fhn0vq+h9mRhANcC9O/?=
 =?us-ascii?Q?J6S13pxNGMUgUa9+uPcclPd8Wy1ycG0WZQBnITT3WCX+UXpa5gHQ51JITh4C?=
 =?us-ascii?Q?/TYWg3DX8qlL/2NblvI11Oy1ovD8tYkEI0aclbHa0PhGTtVOPQpNMzpWzf72?=
 =?us-ascii?Q?qjWn9pcp3m/l3UQHDWShcEgfLhfiVoF/dtW8iTb+TzNPc+Yc9b9iQs+dHhcV?=
 =?us-ascii?Q?+UNdHxKO6RTvlTNC5KKUdaL5bBh0FQ0JwjL0WwcHalEHDXHlZzcd2lJzpVQ0?=
 =?us-ascii?Q?hXA+prt08tJK9VvS8aJ8CXdZvgN21DaFMZuv0wx/yhnJmV9mErcSEPkLals6?=
 =?us-ascii?Q?jkY9g9O/A04qWRNutCc2PKodVdcsUFASRj2VbCEwo3A35zjnD9vG9d+pTlaA?=
 =?us-ascii?Q?Puks00K/z8quFPbS0QxkPEfRj72wUy1OuczM9yJnuOt/BTXoBjtv49Px2TTJ?=
 =?us-ascii?Q?8ONrOo5lSOrDEw6PIjJ642VmMW6hjzmmu2VaPb8kBDvs3bPmKW8KMsMmS+pp?=
 =?us-ascii?Q?4COGiDawv6cOXCna/YuAZ3MsQk1rrnKkWfqCfOlmi2Iztfo8VARn+bfA+u3A?=
 =?us-ascii?Q?+7I5LwSnv94T/gwXwVyZIDTx4UPB7hRA61LgUMOOOhc39tAHqTOC9rB0lWKn?=
 =?us-ascii?Q?tyWCZgYgtJRKrqZCbdS66DCf47bMeqo8FjFRTmMUityv9tae1PSwfW10F57W?=
 =?us-ascii?Q?jSDshiHBuuPOTD8GRXNb5kQtyx2VBBb36f5bB9RbjCPRev2iGImzoE0svNts?=
 =?us-ascii?Q?2KImzFsuuFcLutxM8TKcTzkwrHtw4oo5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EvNJ6+qOcfmd0yQo6qy9ufUqtYshY6e3kSTnhQQI/kM+/P5ZPe2jt0m5FKHn?=
 =?us-ascii?Q?YQVeJynXzVTrbQdiJSjTnCcTKE3VsHk1oMtb+YmKmitPiVRrpJO8L6sTip4i?=
 =?us-ascii?Q?qUd5O9qk28kDFVNn5+Ru1cVjQWKk6VnoO3NilL1yFFXz/793HIQ+bHIZMnoU?=
 =?us-ascii?Q?TBjdLg4UtsryyI/B9IJ0L7uZ7J0fDPbfwtoqUmovXS+KLk89fnRG3eCMxBG7?=
 =?us-ascii?Q?W1hlFESHGypoiuzAYxdS4ApfFc9J/oViIxj0u93uJvIGsc/NIh+/93q2zIGc?=
 =?us-ascii?Q?wmTQWpzjQ35ylkWGI1zili5QupDMGo9pSu0Uirw1S0sABHPo83kR+odWyEpC?=
 =?us-ascii?Q?+DT1CMWNn4+6XpBQX1GPqRdjQqC8HjzpaJXW8fd9JY0YwuhelKM+liUwk1Eh?=
 =?us-ascii?Q?RNmQNuGmGAi1WFIMzlMWmYiP0ygIZ2dh4BlUTQCMy6MBmHj9F8FcxRfWGYlq?=
 =?us-ascii?Q?Vcf/Q1LDYbv1GpPTNDgjNavZ1l0zQfSXUlPXrc9fi6HtboQhHeaDLG+IDebG?=
 =?us-ascii?Q?jca8wY8jkzHL3+biRHxD7K6YzPUndZoNtWl516SKNeGQj+ylFS1/d2Vr+AjM?=
 =?us-ascii?Q?YeykittiEMkrKoxcUOy2pQGHdhqwm75Sp/A4Hs90qdsIalzETCBkQ5a1N8P/?=
 =?us-ascii?Q?lXv29zOCGF9x0g0RmxQy9KJHF0hghv14vxBDCBZwtJgyDPuMJ0Wxjeua2NYH?=
 =?us-ascii?Q?N78EH2jFkZom2IEv3eElJ3IabOtQg0qwf6P3K8QJ1aBPXi+9JsbFimcMjk4I?=
 =?us-ascii?Q?wu1uAPpx3DRVw4v6r/FXFLwiNZMv2M9r6bUKTygWwUQYvqbrBcvo6cV506ja?=
 =?us-ascii?Q?hpEpCgtPIG8v1++2MWLBKCC38kLbgpZVyJ+HRb0MlQnedaZCYuNdIlCn2Q7w?=
 =?us-ascii?Q?xF+pusAO6KlZKyMBVepXcS+flHv+UO7f3kbDD1VnEw3p62aN4TIYJUCDnS4m?=
 =?us-ascii?Q?MICunKNNy6pZp18SvuBW+dfzdves07SwJLfGG8dE9sk6b4YMP382x7cSVMK1?=
 =?us-ascii?Q?yyxUuChQX5ePWSeTFkLxkRSX0Fev8L60IjY9WsGQZ4lB2Kfo5/TrrugUyvNU?=
 =?us-ascii?Q?2/a1t3QSaYwouCBHPIrHaylnJ/QxOOuJDjN/A98gJbjkDMFsw72X1VriG0OD?=
 =?us-ascii?Q?Q/LuBWHn+bkwnjVGzpsmRB7a/5fBxoJxDuI+yFlZ/uZAN4csXwwCnYqzBZyq?=
 =?us-ascii?Q?pMSYu1xt699BGLpcJ/QqElWqmbFd3Z/usLOsOam7d8pbQG2zPo2xEOPPUs1w?=
 =?us-ascii?Q?SG9AAH5sCmaUdr5KimdC8iiR0KMPT79e4/3786+iC1+/wknoWgwrSTypMB+g?=
 =?us-ascii?Q?V3Go5Tk3WDC4Uf8NUeLYR1xBOQ4q+Vaa1t5FmRbfhUzFiHUfayXFA0n9LomC?=
 =?us-ascii?Q?tZR4owRT49+jgrSrt6w9aYyiZMHTjIBG6vrthWW8Hj5g1mvrj4bd+JG/7RZt?=
 =?us-ascii?Q?Fkn3pU/nIoaUN8Wi+p4uwGWZZ9CZLsVeiVCyCP+fUaQUTBS9AO8YqITphS0D?=
 =?us-ascii?Q?TlL2zFfChY1X7KaED0E+YOa2RnW1QnWANqqEtr3dvVtpx9gfAUOBj6ybMUMm?=
 =?us-ascii?Q?1MTG5wg3spziNP7SH9n+xYCknKcyAMq2DHU41UeJuiYPc56/ruYOVUUQuQZf?=
 =?us-ascii?Q?dg=3D=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: f973f480-1fcd-40b3-86ac-08dd5c70a36d
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 05:35:00.5774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rew05muNlsfxGBmRtrA7l9dP5TVrdDM6abctX7zHiQkEDfbFheLZhEmz3j7CpTLQrMRuORoX04ZHzMsaV/eRQGKiklc5vPZjt684o5VMxnM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN1P287MB3789

Switch from s_stream to enable_streams and disable_streams callbacks.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/imx219.c | 30 +++++++++++-------------------
 1 file changed, 11 insertions(+), 19 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index f662c9d75511..390a7b9780b4 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -723,9 +723,11 @@ static int imx219_configure_lanes(struct imx219 *imx219)
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
 
@@ -778,8 +780,11 @@ static int imx219_start_streaming(struct imx219 *imx219,
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
 
@@ -793,22 +798,7 @@ static void imx219_stop_streaming(struct imx219 *imx219)
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
 
@@ -992,7 +982,7 @@ static int imx219_init_state(struct v4l2_subdev *sd,
 }
 
 static const struct v4l2_subdev_video_ops imx219_video_ops = {
-	.s_stream = imx219_set_stream,
+	.s_stream = v4l2_subdev_s_stream_helper,
 };
 
 static const struct v4l2_subdev_pad_ops imx219_pad_ops = {
@@ -1001,6 +991,8 @@ static const struct v4l2_subdev_pad_ops imx219_pad_ops = {
 	.set_fmt = imx219_set_pad_format,
 	.get_selection = imx219_get_selection,
 	.enum_frame_size = imx219_enum_frame_size,
+	.enable_streams = imx219_enable_streams,
+	.disable_streams = imx219_disable_streams,
 };
 
 static const struct v4l2_subdev_ops imx219_subdev_ops = {
-- 
2.34.1


