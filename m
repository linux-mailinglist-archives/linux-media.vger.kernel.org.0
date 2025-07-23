Return-Path: <linux-media+bounces-38243-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AB3B0EFC1
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 12:27:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5822E583836
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 10:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92CDD28FFE7;
	Wed, 23 Jul 2025 10:26:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020143.outbound.protection.outlook.com [52.101.225.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E11E28CF43;
	Wed, 23 Jul 2025 10:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.143
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753266384; cv=fail; b=e+nCPxhfYGAFWboyyvESI9I/cItY4OS/FE9X00eu5q5ewSenQiSV34h1NRjpjAFE1rtOLGHrBNwvQ7JVROGxPV1fI8WONqCLFUrw0sZorzU2dGm9raNxlBrDgB9LAsvxFSkwLPVfY7NNsH8Woo/WtaDOygtHeVSr3elnsunE5cY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753266384; c=relaxed/simple;
	bh=3HRROs0D+B7zajq+qSKPuyoYMFpI2ksuhnTxpnO+iA8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uRnxQoP65mREX68eYyzM5Ioul+xg0pjeO16lKOOqJQPZTQqwR9X9ia/QkAv17goBBr4nPWEe37kivrfPbi8MPc2YuvK/bA7YpIqT1/NFHaXruD+mlpj93nEyaCVMisFCFWrw9QZGFOFNuHI0WTSoMEOHyZ2NYqgPjW87QzN36mc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.225.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YYtKNrjr1Om/VfoZdGzqX4VZVQdUWgBfS5MgN7J8bWf7jYYuwLxjmoBT9NfYAa0VxDRjPBSd/IknCYyLUT0qOkT1xUtnAtRix1jfyqcs2Kz2+1VkFaT2w4e8tdVPtn/Rt5lUdqfz8cOaW6RJtrEnQoDCQUq+oYz9m1LOqXWDt3o4z9NGaquY5jIVhOvwLhl+GAGi2IW24DYJy2qGcmeaQWmESeO2fLY4AHroZV2PRoneeSlH7uBwlo8FUyGNIiAajJhLOsvsUVeFXfDXOrdPfoL/Eo/cgDtq8ff3uR0CJruyKuFnMHM6YPPrrHUMtStT0CWPCeLYW7dmwXNr5qWX0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mnS7UGelQ9H1HjROEmUzp9abmqJQ/rYycosdNW+pZmc=;
 b=OlAInMITeViM75J544nJvuoaz3fK7NvEfaU5ny0FABq2Wdx/jTMGPcyvuQLTgfIlc5ITBpxm180uSZP232jj2e1JTYjHe9TiUcd2aAyeQwzQfVBATSn21AGvkWZ2HY+WKU1bP5Ibzif5c5f4kw085S9TQY8aMsrHtHJ/K9P1hUD1bHfglT1VmuJIManFzZliCMUjwr+4lqFY/W+QIvgVRfSaSmHvREfjQpnGwxqtMxcFhgACUzP1fRVrrXsQsavP29bxlMSXVAN2IZTAmoszJLWETH+1qGMQ7y0fl3w07XY01oYzzDcn55r3ZnsoJ5rt8bhZ11bTJpByT/tjwoGRuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MA5P287MB4176.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:162::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Wed, 23 Jul
 2025 10:26:18 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%5]) with mapi id 15.20.8964.019; Wed, 23 Jul 2025
 10:26:18 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans de Goede <hansg@kernel.org>,
	Yunke Cao <yunkec@google.com>,
	James Cowgill <james.cowgill@blaize.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] media: v4l: async: Add devm_v4l2_async_register_subdev_sensor() helper
Date: Wed, 23 Jul 2025 15:55:06 +0530
Message-Id: <20250723102515.64585-3-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250723102515.64585-1-tarang.raval@siliconsignals.io>
References: <20250723102515.64585-1-tarang.raval@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BM1PR01CA0152.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::22) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|MA5P287MB4176:EE_
X-MS-Office365-Filtering-Correlation-Id: dd4fe0ba-0760-4ed9-0032-08ddc9d35c17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TeQgpkcZKkKXQlVv4Af4K/zAmFCIYqdb39qgIXqB63OnUrcJa2+Xe6KY/bNT?=
 =?us-ascii?Q?1r3CgirkjQNPeBMeMSKKv6YtPXjnq8DylSmAkbCW1zf+rrYPtbIUHgOG8CgF?=
 =?us-ascii?Q?Qzy6L3AXk50/TYUKVdpMRwyaI8QR1geEcZ+kCnXk4h7uMY4ge0iOloEH5vTC?=
 =?us-ascii?Q?P+wG0Fq7qpLUkml6YvY8I9ZKVs/YGIE/n4GSRWClrF24lR+1ferqLn88O/fo?=
 =?us-ascii?Q?hg/Maa1hSysw+GqCIfM8fSlqwJYBYO3YeMiyNZLPd4VLpoA6gNpEoJRh9RGd?=
 =?us-ascii?Q?rQ7rIzdfzQPYYYJVHpyKCMAAJKopVSDRpP+CM3Jx/dzYzisP/U4WOO/Ku1k1?=
 =?us-ascii?Q?c+nCesMThjvaVtk4dv/nAXkBwjNp9ou2DrwAoQ9o+cJiLtPFdkC4V7N1d8+N?=
 =?us-ascii?Q?CiOCIdQ/ioBLGk5G+7D2dsIoUhRDu9pQNs0ReSk7Lg9ZD/6/AaEkiDms3lwl?=
 =?us-ascii?Q?J5Z5a3kDFnbRb6qxlpFAq0F+dfbawTbl7PXWYhHjq5QeN1wGiEoi5QbCpeyi?=
 =?us-ascii?Q?1iV8j8tpBNjbVLwLv8/BiuM/VJpuDc1u0EiK0coTyFUXfLKXCQwvvBE8qALn?=
 =?us-ascii?Q?UQSR7/pJacr3yd2qutJn23ts0jbnMf8dlS7um9sOlP10Vl+Wbd2Rvk9y8r8/?=
 =?us-ascii?Q?sCyhEqle9uW1V2JIA5CWQ2wVB2AlmfmmkhYmAXZFEpNhDjGrGicVYSE31Hh3?=
 =?us-ascii?Q?2YRpq2lmuKNWWe32J3gzVwbJy/IttpGXjVLv0i66idWUZXE9kmOg7quD4MXt?=
 =?us-ascii?Q?rtBwULugWBjzANS/fFjSDWDbv1PMICFyDDfQpDtrAzKFhCHqMfghg6bIC++x?=
 =?us-ascii?Q?57Y4XcJT9B5dr622H/4F/QMfcjejrWZW2xpHkQmYx6mpPOwgafMyDK/Q7edl?=
 =?us-ascii?Q?HTKFzeevRafJeGk4pSIOrOWEVoXqBs3IaVn8jCE7nbEA/yDD5c2CJorGbi0z?=
 =?us-ascii?Q?pNAW6UK2LjdQKg+/4OKl9HUOW9fTlBhvFEmn0BLwHZugVcDdMSty+YhDdd6C?=
 =?us-ascii?Q?CnPeJwmEf0I1TgL+nKs3YpQ+zXT+xhYG2fTrVRic9L8EtgytfS+6Dupkme91?=
 =?us-ascii?Q?ltm0GQ3kNeCVXFsMdxS4Wj55QJyEMPue7PiPnNpjMmwX6GGSI7eIrDVjWJaX?=
 =?us-ascii?Q?C/7nOTq4cIZl4MB4+mvw9riJH4OEwsLGqjtBoANLhL1UbpfpN461hLiyZoqq?=
 =?us-ascii?Q?HyAALt+Z01M9JzVPv3MkSyF533SeWk/jOcJzuKJRO1T622EPxdgYzO+ZtzQn?=
 =?us-ascii?Q?PNwfL0PvM9EKTMl3FBjInYtQg9Heol6zoT0XR/WdcXtLwIPZhRb8j12OukCd?=
 =?us-ascii?Q?aI2o/TOEIuUhn6kLlVjaEjp+CHfuMTfPBcaVhXG5Mw6YRDecAbL10BWGB7qr?=
 =?us-ascii?Q?g44j/yc2kTikLsOH2jIilFoqhGkZwNCen4Fo2lex6Olvzlzo0sXVi3wnBaA8?=
 =?us-ascii?Q?pPq6zvVnnk1SZkwwhyv3kO6DMhEYcWS9MFBnhherTf16R1P8hwjXMQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lWFYmPnYdbHwrmyEW373W303/MVOmc2NvsMpxQa2GxYUTdvUJMBTsY7b5cdu?=
 =?us-ascii?Q?Z+1D+r7xn3CVGRJNfIm9s0O5N4JxRTKsWJWaWw2OBnLXb34dlIqG+dda8t/q?=
 =?us-ascii?Q?zuaD4XpVIqpzyrOy4Gt9tVwLALf1Q+tuiYm1/3k+3iw+HW4SO2c6gTP8WpuQ?=
 =?us-ascii?Q?49XzF3qHyf5UlvrIxpxuoNtFv2DjOAd3kjG5JB1f/qQKWQWmOaj1jc6kM3Zp?=
 =?us-ascii?Q?jjwtFFPUpOlEpKDNm1Rg4J9sgv3Jy0Ryl9I1xE3TAA5AldMaYHPf3k0PslLy?=
 =?us-ascii?Q?8AXF9fPSQ9DxqylK3oGNBulJFWtyA8R3ADMTuJE/MJwN1zKEiRdqTqzjdJkI?=
 =?us-ascii?Q?dU8fnqkznNezxHAfH5cl7Hkwvd7uYHCb9CCf+O8DvOCaZsA3I9OCZWd5NtA6?=
 =?us-ascii?Q?zwUn6zUZvEQaQQF3LqYviYUvUROxBpT6iP9AsELDp/34e9iXeSSz4Gvgrcq6?=
 =?us-ascii?Q?hO2g5Jtt79tAgeF64y+jA1VrHInjrbkyWvf0K8+PyzbcLGJGIOWsDUIN1uUA?=
 =?us-ascii?Q?YoSieBt7mNDgwfnpgBxae5K2sZBAtuAGo4Oe/klDlxJLLsTv06lFoNCDRYEq?=
 =?us-ascii?Q?1w2XG9TNhurSOxKgXj49fGVhrik8gyQNeVLySORcUM03wyuVcZAD6TNzTe6g?=
 =?us-ascii?Q?u/PqR/7aL23tiiX9hRaaZuhdcLpGSj1W1eodXdkTcjfUnLnvDyNRYG2UDnaH?=
 =?us-ascii?Q?7qnf4TdGmgv/TICY3+26zJWh4rIzBkAFjDr6hY8S9AYFTl5pCudDe6JrOF+i?=
 =?us-ascii?Q?JRixVj8QaOJNOPFeTrcvjMAetotu6KRZgqcxgSGUqvPzrKJJLApa0y3MEBXT?=
 =?us-ascii?Q?GKPlHmHfDhxfF3cvih28Ht5ZSaeQFZKD6v6h3YEEqnQvzhzvJrRTkMQFX//C?=
 =?us-ascii?Q?IpEiulaFUVdhoEl5LM/OI0n8LDyiDdmEFssob/5rXp0mNoQFwJAVY42cct+v?=
 =?us-ascii?Q?OMiIPmkY1ozujqmB4di4xZgSsNX1AtOOhp22GtWOguRyc1awKgEdBss8FMqo?=
 =?us-ascii?Q?lg199f8ipT+RDOnNF3Ae1Kqo73Wf25uX94R0zQ0oT80AKAwbwA9vID62uQ3o?=
 =?us-ascii?Q?qqVd6nMNjX9xMvkCg+4DNNWajn/czSSoQXqfNGeOXmJGqdjO/J4d4iLWK3zu?=
 =?us-ascii?Q?rYPTenksKLPwYQ0TIhEaVkyL3r0gaMUxJhVgWoyHtisuJnpgSkRmVParZMwV?=
 =?us-ascii?Q?3EehAWTrz0DW7N/v3eomHW+Q0vpD5G03t5KJH8YvF5rOvWbQsmDX7wmbHVFH?=
 =?us-ascii?Q?aR89iabafs0xCDOhPFVd8X1nycDt67eYYqXr6juihov+4dTTDea9IFKqZO9t?=
 =?us-ascii?Q?nKLc1kyRmm63LcQLUhYSAbclyubBoSW0cZlc7ATuXtqo9NR70CeO6W+pAGCY?=
 =?us-ascii?Q?R6911Q0Lkpn3I2VAjsDWqWP1HMD9uXrtvhpMIu8YdmPI0umxnDODki0+A8Jz?=
 =?us-ascii?Q?/uxyLVtpZzreOAK9WWJJ81lMp06PyCIxcjMMNtKNc43XHlxY8STi6dNte6XQ?=
 =?us-ascii?Q?Ec5pYpcp8SUgROYOOnP85JPN5E3Y4qaWVVDKmlRiX9TrAuAV1k1tMlgWRKIM?=
 =?us-ascii?Q?Ge2p/I1vnZdbV/9k7nz4RAPxPyHwDFHp04qx8Yr7rvWFOpgmWZ/bGm82RSEn?=
 =?us-ascii?Q?AQ=3D=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: dd4fe0ba-0760-4ed9-0032-08ddc9d35c17
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 10:26:18.0184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TmCLv9VcEQly5K3pYBbewqZTNT0KfNMyHWxGJqyTvQLUmiRBq3QfhlNendtPNH1r7nq4tROFKd4XeJJ7VhRSmMgDahvXCpxkFxndudHyn7A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5P287MB4176

Add a devm-managed version of v4l2_async_register_subdev_sensor() to
simplify sensor sub-device registration and cleanup using devres.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/v4l2-core/v4l2-async.c | 19 +++++++++++++++++++
 include/media/v4l2-async.h           | 18 ++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index ee884a8221fb..197a01a2d5d6 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -7,6 +7,7 @@
 
 #include <linux/debugfs.h>
 #include <linux/device.h>
+#include <linux/device/devres.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
 #include <linux/list.h>
@@ -894,6 +895,24 @@ void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
 }
 EXPORT_SYMBOL(v4l2_async_unregister_subdev);
 
+static void devm_v4l2_async_unregister_subdev(void *data)
+{
+	v4l2_async_unregister_subdev(data);
+}
+
+int devm_v4l2_async_register_subdev_sensor(struct device *dev,
+					   struct v4l2_subdev *sd)
+{
+	int err;
+
+	err = v4l2_async_register_subdev_sensor(sd);
+	if (err)
+		return err;
+
+	return devm_add_action_or_reset(dev, devm_v4l2_async_unregister_subdev, sd);
+};
+EXPORT_SYMBOL(devm_v4l2_async_register_subdev_sensor);
+
 static void print_waiting_match(struct seq_file *s,
 				struct v4l2_async_match_desc *match)
 {
diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
index f26c323e9c96..df0e7337fd22 100644
--- a/include/media/v4l2-async.h
+++ b/include/media/v4l2-async.h
@@ -343,4 +343,22 @@ v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd);
  * @sd: pointer to &struct v4l2_subdev
  */
 void v4l2_async_unregister_subdev(struct v4l2_subdev *sd);
+
+/**
+ * devm_v4l2_async_register_subdev_sensor - Managed registration of V4L2 sensor sub-device
+ *
+ * @dev:        Device that manages the lifecycle of the V4L2 sub-device.
+ * @sd:         V4L2 sub-device to be registered as a sensor.
+ *
+ * This function registers a V4L2 sub-device using the asynchronous sub-device
+ * framework and registers a managed cleanup action to be performed automatically
+ * when the device is detached or the driver is unloaded.
+ *
+ * This is a managed version of v4l2_async_register_subdev_sensor(), and simplifies
+ * resource management using devres.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int devm_v4l2_async_register_subdev_sensor(struct device *dev,
+					   struct v4l2_subdev *sd);
 #endif
-- 
2.34.1


