Return-Path: <linux-media+bounces-38244-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 479FCB0EFC3
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 12:27:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E02858387F
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 10:27:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C3112900BA;
	Wed, 23 Jul 2025 10:26:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021141.outbound.protection.outlook.com [40.107.57.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B8528D8C4;
	Wed, 23 Jul 2025 10:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753266392; cv=fail; b=PH+to1Bx+LZVq1MY31BXm672hWhjmvgzVcJPIb7JELI61RxLLs4V66F/uWKnnbKuoH+EWvQAd0JLd/3GhJ16F/0A6ttam13EwVceBI/XaTL8M5Ad/8twntjinVrUqzICSlCocsPYZlruUSCnKGZju3sg3A+CUVEQt6Mq9pS1mY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753266392; c=relaxed/simple;
	bh=kaFwLkElVI1SFP6eNZDER9C4JCemVQLQFzkKuxLJW3E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NSAXotFzhFjWGxBjUBHFzA1LJqI0/izOeEMP/hLpoQaYE1KIfzms/bOww/L+JwVom7pgGYbTkMjXzbkyP281UcSMGnEIYWVzYt9W/ZYpLQru69Szyup9un/DdgObfbJMdqK0/sVqefs98KGiuAGnZiu1O5/3kgHznN+7pKAP9s8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.57.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t6c56ZAG7D4ZialkVvNZWcDGVxbdT6gJY/uPU2g9Lwug9a+uJaDHrQGoXs/mD87FjDb6sgMeck2S7qoOoDx0wTBsOEoET6H9hwj9mkJB0Cc+SZNlp3Y5K/9eZuQ/mpouWEv6r32yGy+2hKiWFM0eFPV0d/rbNklTqUBia8jKpNSsTNcBdsjJN0Du+mOVpeGE63eSlUNLpc9z/Q4vCaAbBFrbPslrzPEG9zSb7Ge/HoppO5ZIkX9dRrJqW66EfiarAE/iaObJzXj/uNZqEI8XxclIT4iMp78Uysru9ny/Z+iMXs8HKY6q2wVSZOKuJUG3egVX5x9JD5kxP/M2BSg8Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M1AXEpaMMUf58gpAzaHEXhZgWFNvfjz7EIJvKJn1WDQ=;
 b=vXhQ/PIc7kqQtmcAmlq+tsNR9IIZMWL7L7BHnzObLwFqu/cOYJqk8kNve563tLAFW00EukQur0b7GbiIXgKWVEG98yI9NMOKnLNKz433+t++CFTnkYEX9mZ92YNRxt3IglCuIdgyUg0Q3toKldDa6BemQqlbmM78q5xzRN54fjpazo2FHSDY8KUF0w/W6dua42GBRSQA38eLEUf9w6ivSRQRaqU/kolVGleqrvHSq42GMnRcz3ThvrFICFChq1opV1gI3JZSvGTIELGqsbwP+VJm7rIGXKFWL+DmpZPBq3u3Etuwu/YHmglEpp32sxWkc8udGGJWQ5+bmXEOO+pgMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MA5P287MB4176.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:162::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Wed, 23 Jul
 2025 10:26:28 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%5]) with mapi id 15.20.8964.019; Wed, 23 Jul 2025
 10:26:27 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Yunke Cao <yunkec@google.com>,
	James Cowgill <james.cowgill@blaize.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] media: v4l2-subdev: Add devm_v4l2_subdev_init_finalize() helper
Date: Wed, 23 Jul 2025 15:55:07 +0530
Message-Id: <20250723102515.64585-4-tarang.raval@siliconsignals.io>
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
X-MS-Office365-Filtering-Correlation-Id: cf38acad-acda-4db9-727a-08ddc9d3621e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Db8gt0SVWTsAIGDuy03tco/hrtecFd3WznWzsxl1N4VauI3O6qnP6ay5Y5wr?=
 =?us-ascii?Q?MHsPMdxczYpDbxF9J7Ii0IClKgxW6XA9SUp+DddB2pxMugQn9UZXKHV4LrcU?=
 =?us-ascii?Q?VzBIX/yikByC57yNRp0/b+COi8bSdwr7DfPWAr+7c88pSOLO2bw1ppxqDphj?=
 =?us-ascii?Q?nUBmUcofFHx5twk2p59s8+m5Y1KRPiXu/qD0a/UrhQniQKdUBZO6VWu+PQt3?=
 =?us-ascii?Q?hr5r234508pEU+8Y5HwmoSPzHUx5kBy8TBHxiTTAgRDitVouTEJfeBmN3je4?=
 =?us-ascii?Q?al9GuDuJjWHZSxUb9ox0qPIw7Dgp9uPoOMVEDj9gT7qbJjXyh8kzSuP0s1FD?=
 =?us-ascii?Q?n5hRbpXjRBeRVjKFIUPb84Z9eARKJ+TsfJLUdtpuLue1p2iSV7JIG991ZXak?=
 =?us-ascii?Q?8/OIk9SfADVnivuns42Qe6TrVW1a0fuRpdkDtfC8Pa8lKJiGI3+1WMrq3rxS?=
 =?us-ascii?Q?+5vglJ+bLFZASZWY+hwsuklJN9/XjAvYS1rzqVaFQQgo9QE/NHt2vgnerqj3?=
 =?us-ascii?Q?loqhx3lpAdaarVEX1amI1Ds7GKmifg5gBgqrMMrJOYYbgXLZ/+ZjEdxcMps6?=
 =?us-ascii?Q?b5edJP+rXzcS9jiFnwXnOjCBxGU19sZtiQ8dcCoAC///UGJIWGG7fygH+rfF?=
 =?us-ascii?Q?pron87KC/Owcn71Y70uos6y26eLtuOwLnYRr4rLMIX91woZOKHAfAngdWT6k?=
 =?us-ascii?Q?1xm4YKY4walBKEokSDJzCIxJ0sNBqeYZQCmYH8hsd9srGCZxmj/8PJN7bnn9?=
 =?us-ascii?Q?uHu/B39pVNk/nOB35LBkj9xgc1iWxKJ+5bKe5CkIY5Uy26gRDGrn7A/dq6AQ?=
 =?us-ascii?Q?GqqapBNk1LmVWAHh0PjycYo4zbUNxaWMej8H873foEdPyhgk/U2LG+zp9DIi?=
 =?us-ascii?Q?YiAynagxuVUv9+yAWk1cBUHk5/MvTFhEx5xbFb1B2L/jd1vObogrfZHPJidh?=
 =?us-ascii?Q?PMXutTVuPPe7G5F0m8cikZ6H9OGUWMMhEgwX6V9GvlThm01iH5naWSy+gqRu?=
 =?us-ascii?Q?A2+u2i86L11nJR+muuViS7wMo6j9fKpuVZPuonvmeOpd6Vx6AglwTmNWcjqR?=
 =?us-ascii?Q?NnJvFpxte/ZZ+78nG0FjKkWcQGcP9GY5JwlpYn38JFPEU+LTCL5mvx/uF5zG?=
 =?us-ascii?Q?0qIHdrR27Hwe2YTM9EwiwRTuO8dJQSMRf9KKWaPisYJKljZiLnYwli6RdPW0?=
 =?us-ascii?Q?IoOddzBdkfeXtYp5lhZo2rKPC8Zm/M6MSQ4cPYbyk4wbnrCrnHoFEwfcMKfe?=
 =?us-ascii?Q?ANcyCMsV7hdAVAAXppwd0sXLvO6oR9lVj0o5jwVdHTgWXI3UOwObmifR2/zC?=
 =?us-ascii?Q?WZRYxLBJqdlysaQTvqiH5m3jn5KGG1P4BII0OyIHvzS2ojamlphRzkddhaFS?=
 =?us-ascii?Q?yubaWqJ7c74NoJni2gXl58uZ8Psn7AzICCV3f5+Q6ZkcJUe0DBvxKAsyfkrl?=
 =?us-ascii?Q?xSMOgN7FnTz+u9tS3DTE6gm3NFhzTz0OUzNWKMRsg+5Ghpol0qpNFw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?56mvHxA4Knpy/i/1IBlA/R5DDXqDmEdjDKdk2++0pOK2ist3bvewoH2sOtfh?=
 =?us-ascii?Q?gPbe25rzmnYK6mF6Mtv1x62PJGW8+nSdw5gkB+ZJot///S4dyN/n+0IjwO7l?=
 =?us-ascii?Q?WHdb10Z4AXckvRq3FrYPGoibxn8tfFGqiwB5syD4NM0Sq1WPMy6mNTgtGJSU?=
 =?us-ascii?Q?kSmuXBXLZpo7ca8fSxcvKgjjM13Zn3C0/Kaepvfg7fT8nJ8RY+FLACGscG6f?=
 =?us-ascii?Q?G81FCUB5bcaZKNGLIIp9ytXp2C6UbWAtMntWyzzpmL7IWW02CUnEt6Lg3rDi?=
 =?us-ascii?Q?I8foGdD/w8pHuAvnUzDsNt1ggaC95r3DZhSYcq8WZKOsmR0HptpHVxtd9kM9?=
 =?us-ascii?Q?etbgDZXEQrZvvO6w7L9PGgd2bk1w/tQ0AlGbC+YCSYtEBKxyByeJvKbsKxvv?=
 =?us-ascii?Q?KCux2YB1unEdSdXvQJFl2D1JH1hmYRhRxEbkpf/LwNaPC83cLV96PryU7UOi?=
 =?us-ascii?Q?im8R8/6cM2otxN86fb47pSPzNFgTQ8aOjGtBx2EP/HO29+9QZd65GA0LG0G9?=
 =?us-ascii?Q?hwQcbdtvnE6biHs0GIKrIiyHkiWYlYkRj0A1QZd/PKpGpe8heOmBS7PrGvdV?=
 =?us-ascii?Q?ykt8wvDL1uVcu44eCyILAk/z7ygJ+5s3N8dTigWi82OgvDD0LFiE7FCNZMhA?=
 =?us-ascii?Q?UTPV7qH9KHkh6Xobgk37kd/hwvYkqkueEI6uxaRQMe0dZ9uhlcpX0R1LmhxT?=
 =?us-ascii?Q?C8OxCvSrMbhFV+2YrAJGccs9mQM2Qh1IdrpUVLeEhrcFX3sAnGdulZcX3zjX?=
 =?us-ascii?Q?5c0j7/TSXXEVYRZKyIXQPBVHluSPYkrdZ2aWi5sahZ3OhGV3mbwy49AOHxL1?=
 =?us-ascii?Q?tGSO+990Ad5w/qhC6njqmGOd94qwVkgCGkr728WNTxDAFcrNGvDCvRmHEtOT?=
 =?us-ascii?Q?YL0MFFUyFwQtbGCbU0C8iiPbtZdus7UPQmfUzJ9anC1jZQherh13EW8AV5OB?=
 =?us-ascii?Q?bK/fzOI9dtRPNiUJu4CbiWxzPZh/CQ7PnzUkkra7y2lzoHHFriY1Zi8JN4og?=
 =?us-ascii?Q?lICnSm9POiV4G8ueIXJeYDBEhpH+oezu6UV6E3ZoDFQrzVeLL7TX3JUlK7W3?=
 =?us-ascii?Q?WODCjQZIp3ozOtmTF7cqG2Y6QJojro3Ee2GGNipdnJQ70q3lw7hMiZVJY1Dr?=
 =?us-ascii?Q?ULAeHFtVmpsfeEFV6Orj+z6GT/BgkQQUYvQJ7x7GhVZpUVg8F8HRTE56cM70?=
 =?us-ascii?Q?bjlnC5+JxLziHXRDTsItmEIhhBMGURIUDEbVuxtNWNl8bpxvDMlXlxPo8Mv2?=
 =?us-ascii?Q?lslRHVeyq90jldDR9Ut6vIv4DiHBAlhe8j5n7EH3TCabWvjjFqsw+uMEzXLy?=
 =?us-ascii?Q?07PyiyoSknJeQpFM9hqZJ6tXCfShyoj5Wj/Qq5TZGOKua7/tU+LXW6itU32l?=
 =?us-ascii?Q?FwWuCCk2Xca/+g6AZ2iS5qrx8vhZHtTOZcNp1AagIjMRA+5hYdaxNYFDCe7g?=
 =?us-ascii?Q?QkwxOnnPHJladnLsT3V30IY/HUy4vwJqluGN3lY6yxwsdfYGriJiAS5Vy3bO?=
 =?us-ascii?Q?qLc/YsUairUisZMJ/SygfCRkeDXktkAul+EmlKLfhbf9QeZJCDHVoYRED+fS?=
 =?us-ascii?Q?srbUHXSKv//Eqwo4kNV03tqC92FlB8Hd157oDnlPncdXJTxZ2h3glqQ87Tig?=
 =?us-ascii?Q?Rw=3D=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: cf38acad-acda-4db9-727a-08ddc9d3621e
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 10:26:27.8905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N2vhrqScqduEwRjYLIyWAr9Ft4+0Buz3nzvCArF95gL+l1s5apPAFyHdeOykhq00jhaBcLMSlsRNekSkUHQQiR71K0QnYdVOReq9sZoOFp4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5P287MB4176

Add a devm-managed version of v4l2_subdev_init_finalize() to simplify
sub-device finalization and cleanup using devres.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 18 ++++++++++++++++++
 include/media/v4l2-subdev.h           | 17 +++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index c69d1aff701f..da7a479584bc 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -8,6 +8,7 @@
  *	    Sakari Ailus <sakari.ailus@iki.fi>
  */
 
+#include <linux/device/devres.h>
 #include <linux/export.h>
 #include <linux/ioctl.h>
 #include <linux/leds.h>
@@ -1710,6 +1711,23 @@ void v4l2_subdev_cleanup(struct v4l2_subdev *sd)
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_cleanup);
 
+static void devm_v4l2_subdev_cleanup(void *data)
+{
+	v4l2_subdev_cleanup(data);
+}
+
+int devm_v4l2_subdev_init_finalize(struct device *dev, struct v4l2_subdev *sd)
+{
+	int err;
+
+	err = v4l2_subdev_init_finalize(sd);
+	if (err)
+		return err;
+
+	return devm_add_action_or_reset(dev, devm_v4l2_subdev_cleanup, sd);
+}
+EXPORT_SYMBOL_GPL(devm_v4l2_subdev_init_finalize);
+
 struct v4l2_mbus_framefmt *
 __v4l2_subdev_state_get_format(struct v4l2_subdev_state *state,
 			       unsigned int pad, u32 stream)
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 57f2bcb4eb16..a5da32783846 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1337,6 +1337,23 @@ void __v4l2_subdev_state_free(struct v4l2_subdev_state *state);
 int __v4l2_subdev_init_finalize(struct v4l2_subdev *sd, const char *name,
 				struct lock_class_key *key);
 
+/**
+ * devm_v4l2_subdev_init_finalize - Managed finalization of V4L2 sub-device initialization
+ *
+ * @dev:        Device that manages the lifecycle of the V4L2 sub-device.
+ * @sd:         Pointer to the initialized V4L2 sub-device.
+ *
+ * This function finalizes the initialization of a V4L2 sub-device and registers
+ * a managed cleanup action to be performed automatically when the device is
+ * detached or the driver is unloaded.
+ *
+ * This is a managed version of v4l2_subdev_init_finalize(), and simplifies
+ * resource management using devres.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int devm_v4l2_subdev_init_finalize(struct device *dev, struct v4l2_subdev *sd);
+
 /**
  * v4l2_subdev_cleanup() - Releases the resources allocated by the subdevice
  * @sd: The subdevice
-- 
2.34.1


