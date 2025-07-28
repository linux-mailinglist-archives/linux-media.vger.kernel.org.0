Return-Path: <linux-media+bounces-38539-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E35B13828
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 11:50:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BBDEE189CD15
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 09:48:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3254026980D;
	Mon, 28 Jul 2025 09:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FziQYcGn"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBF2267B02
	for <linux-media@vger.kernel.org>; Mon, 28 Jul 2025 09:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753695866; cv=none; b=TR0VGhIbDc39Cktvy6SrSCkATqpriHazHdIAvksPp2Rjukcb7tvSymULMVSefdmCdaG0O55C0qH9g6dGbkYOJgYdv4EuLnQ+HLGDLdUOVPW+15NsKQ2lYk6lF2hxAIk4OuUVN6uAKGZgqq2xQILpmQIul8DznyqUfDQreR4nFO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753695866; c=relaxed/simple;
	bh=YvGHBW7vhLn7bDMnNtnbOviRcXt0cS+g6+O+B7GejQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PhGKiJH2YV1jQjjdRNS5R6SYEzlYUb8v5vbJY6ETGwZD7whyX8/kv6HK5iXknDtaIVZ4fGSnl206RHwCLoue6OIm06JnomYRe6IfcQ2DAbGWgUka7WaGsAV81YTLA2gCq+OWyXfcq8vslgADvPgQwp4mZVv7d4Jhi8U2pIVlmrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FziQYcGn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99D96C4CEFF;
	Mon, 28 Jul 2025 09:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753695866;
	bh=YvGHBW7vhLn7bDMnNtnbOviRcXt0cS+g6+O+B7GejQY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FziQYcGnAVTXopcUkUlabLaKYRugnEtaLlF9RtbZzzSp5KVLBrMQK6WHQt4j/xeMv
	 kJIQ3mFhjw2Y2Ph2C227NYj+9Hmes41hGFfs2B+l2tS2i2Eno4p5iS2a10ZQxGKGSU
	 uSaHC0lWEsB8GhZNomrJUgZBxS0ViVE4Zoa4BcGoaPQQeGs47jdO86QFiVgvs9Nreb
	 97IFA+0Glj6QYi5LlZzDWT51JMDwlnnj8YchBtLjQTeM1TReDedhqAizZeSny+sCvC
	 OdWv0T5ByLA4KTkqrNGSzmv7ZqWULH9CWCbn5u54MtadNBh4WnUJRuIG0AxldSa+H3
	 dCBqBEn5pqT+A==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@kernel.org>
Subject: [PATCH 4/8] media: update Hans Verkuil's email address
Date: Mon, 28 Jul 2025 11:41:53 +0200
Message-ID: <d80ac038b3019236300e8a2b939358c6ae1f798a.1753695717.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1753695717.git.hverkuil+cisco@kernel.org>
References: <cover.1753695717.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hans Verkuil <hverkuil@xs4all.nl>

Replace hansverk@cisco.com by hverkuil@kernel.org.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
---
 drivers/media/cec/core/cec-core.c                               | 2 +-
 drivers/media/cec/platform/cec-gpio/cec-gpio.c                  | 2 +-
 .../media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c   | 2 +-
 drivers/media/i2c/adv7604.c                                     | 2 +-
 drivers/media/i2c/adv7842.c                                     | 2 +-
 drivers/media/i2c/ths7303.c                                     | 2 +-
 drivers/media/mc/mc-request.c                                   | 2 +-
 drivers/media/pci/cobalt/cobalt-driver.c                        | 2 +-
 drivers/media/radio/radio-aimslab.c                             | 2 +-
 drivers/media/radio/radio-gemtek.c                              | 2 +-
 drivers/media/radio/radio-isa.c                                 | 2 +-
 drivers/media/radio/radio-isa.h                                 | 2 +-
 drivers/media/radio/radio-miropcm20.c                           | 2 +-
 drivers/media/radio/radio-rtrack2.c                             | 2 +-
 drivers/media/radio/radio-terratec.c                            | 2 +-
 drivers/media/radio/radio-zoltrix.c                             | 2 +-
 drivers/media/test-drivers/vicodec/vicodec-core.c               | 2 +-
 include/media/i2c/ths7303.h                                     | 2 +-
 include/media/media-request.h                                   | 2 +-
 include/uapi/linux/v4l2-dv-timings.h                            | 2 +-
 20 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/media/cec/core/cec-core.c b/drivers/media/cec/core/cec-core.c
index e10bd588a586..d7259599029f 100644
--- a/drivers/media/cec/core/cec-core.c
+++ b/drivers/media/cec/core/cec-core.c
@@ -439,6 +439,6 @@ static void __exit cec_devnode_exit(void)
 subsys_initcall(cec_devnode_init);
 module_exit(cec_devnode_exit)
 
-MODULE_AUTHOR("Hans Verkuil <hansverk@cisco.com>");
+MODULE_AUTHOR("Hans Verkuil <hverkuil@kernel.org>");
 MODULE_DESCRIPTION("Device node registration for cec drivers");
 MODULE_LICENSE("GPL");
diff --git a/drivers/media/cec/platform/cec-gpio/cec-gpio.c b/drivers/media/cec/platform/cec-gpio/cec-gpio.c
index 3c27789d8657..842555ed42c7 100644
--- a/drivers/media/cec/platform/cec-gpio/cec-gpio.c
+++ b/drivers/media/cec/platform/cec-gpio/cec-gpio.c
@@ -291,6 +291,6 @@ static struct platform_driver cec_gpio_pdrv = {
 
 module_platform_driver(cec_gpio_pdrv);
 
-MODULE_AUTHOR("Hans Verkuil <hansverk@cisco.com>");
+MODULE_AUTHOR("Hans Verkuil <hverkuil@kernel.org>");
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("CEC GPIO driver");
diff --git a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
index 41d019b01ec0..46e50a79693c 100644
--- a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
+++ b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
@@ -28,7 +28,7 @@
 
 #include "extron-da-hd-4k-plus.h"
 
-MODULE_AUTHOR("Hans Verkuil <hansverk@cisco.com>");
+MODULE_AUTHOR("Hans Verkuil <hverkuil@kernel.org>");
 MODULE_DESCRIPTION("Extron DA HD 4K PLUS HDMI CEC driver");
 MODULE_LICENSE("GPL");
 
diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
index afed38596362..8fe7c2f72883 100644
--- a/drivers/media/i2c/adv7604.c
+++ b/drivers/media/i2c/adv7604.c
@@ -42,7 +42,7 @@ module_param(debug, int, 0644);
 MODULE_PARM_DESC(debug, "debug level (0-2)");
 
 MODULE_DESCRIPTION("Analog Devices ADV7604/10/11/12 video decoder driver");
-MODULE_AUTHOR("Hans Verkuil <hansverk@cisco.com>");
+MODULE_AUTHOR("Hans Verkuil <hverkuil@kernel.org>");
 MODULE_AUTHOR("Mats Randgaard <mats.randgaard@cisco.com>");
 MODULE_LICENSE("GPL");
 
diff --git a/drivers/media/i2c/adv7842.c b/drivers/media/i2c/adv7842.c
index 5545cd23e113..9780082db841 100644
--- a/drivers/media/i2c/adv7842.c
+++ b/drivers/media/i2c/adv7842.c
@@ -38,7 +38,7 @@ module_param(debug, int, 0644);
 MODULE_PARM_DESC(debug, "debug level (0-2)");
 
 MODULE_DESCRIPTION("Analog Devices ADV7842 video decoder driver");
-MODULE_AUTHOR("Hans Verkuil <hansverk@cisco.com>");
+MODULE_AUTHOR("Hans Verkuil <hverkuil@kernel.org>");
 MODULE_AUTHOR("Martin Bugge <marbugge@cisco.com>");
 MODULE_LICENSE("GPL");
 
diff --git a/drivers/media/i2c/ths7303.c b/drivers/media/i2c/ths7303.c
index b7cedc5b3e8e..ff268ebeb4d9 100644
--- a/drivers/media/i2c/ths7303.c
+++ b/drivers/media/i2c/ths7303.c
@@ -7,7 +7,7 @@
  * Author: Chaithrika U S <chaithrika@ti.com>
  *
  * Contributors:
- *     Hans Verkuil <hansverk@cisco.com>
+ *     Hans Verkuil <hverkuil@kernel.org>
  *     Lad, Prabhakar <prabhakar.lad@ti.com>
  *     Martin Bugge <marbugge@cisco.com>
  *
diff --git a/drivers/media/mc/mc-request.c b/drivers/media/mc/mc-request.c
index 5edfc2791ce7..f66f728b1b43 100644
--- a/drivers/media/mc/mc-request.c
+++ b/drivers/media/mc/mc-request.c
@@ -6,7 +6,7 @@
  * Copyright (C) 2018 Intel Corporation
  * Copyright (C) 2018 Google, Inc.
  *
- * Author: Hans Verkuil <hansverk@cisco.com>
+ * Author: Hans Verkuil <hverkuil@kernel.org>
  * Author: Sakari Ailus <sakari.ailus@linux.intel.com>
  */
 
diff --git a/drivers/media/pci/cobalt/cobalt-driver.c b/drivers/media/pci/cobalt/cobalt-driver.c
index 39e25cc53edb..b7695705fdee 100644
--- a/drivers/media/pci/cobalt/cobalt-driver.c
+++ b/drivers/media/pci/cobalt/cobalt-driver.c
@@ -44,7 +44,7 @@ module_param_named(ignore_err, cobalt_ignore_err, int, 0644);
 MODULE_PARM_DESC(ignore_err,
 	"If set then ignore missing i2c adapters/receivers. Default: 0\n");
 
-MODULE_AUTHOR("Hans Verkuil <hansverk@cisco.com> & Morten Hestnes");
+MODULE_AUTHOR("Hans Verkuil <hverkuil@kernel.org> & Morten Hestnes");
 MODULE_DESCRIPTION("cobalt driver");
 MODULE_LICENSE("GPL");
 
diff --git a/drivers/media/radio/radio-aimslab.c b/drivers/media/radio/radio-aimslab.c
index 3c8c17d64821..2c1d413e8636 100644
--- a/drivers/media/radio/radio-aimslab.c
+++ b/drivers/media/radio/radio-aimslab.c
@@ -4,7 +4,7 @@
  *
  * Copyright 1997 M. Kirkwood
  *
- * Converted to the radio-isa framework by Hans Verkuil <hansverk@cisco.com>
+ * Converted to the radio-isa framework by Hans Verkuil <hverkuil@kernel.org>
  * Converted to V4L2 API by Mauro Carvalho Chehab <mchehab@kernel.org>
  * Converted to new API by Alan Cox <alan@lxorguk.ukuu.org.uk>
  * Various bugfixes and enhancements by Russell Kroll <rkroll@exploits.org>
diff --git a/drivers/media/radio/radio-gemtek.c b/drivers/media/radio/radio-gemtek.c
index 5ca6274c45bd..a3265f1dd189 100644
--- a/drivers/media/radio/radio-gemtek.c
+++ b/drivers/media/radio/radio-gemtek.c
@@ -15,7 +15,7 @@
  *    Converted to new API by Alan Cox <alan@lxorguk.ukuu.org.uk>
  *    Various bugfixes and enhancements by Russell Kroll <rkroll@exploits.org>
  *
- * Converted to the radio-isa framework by Hans Verkuil <hansverk@cisco.com>
+ * Converted to the radio-isa framework by Hans Verkuil <hverkuil@kernel.org>
  * Converted to V4L2 API by Mauro Carvalho Chehab <mchehab@kernel.org>
  *
  * Note: this card seems to swap the left and right audio channels!
diff --git a/drivers/media/radio/radio-isa.c b/drivers/media/radio/radio-isa.c
index 4f87c76a2a96..1a144536ffa7 100644
--- a/drivers/media/radio/radio-isa.c
+++ b/drivers/media/radio/radio-isa.c
@@ -4,7 +4,7 @@
  * This takes care of all the V4L2 scaffolding, allowing the ISA drivers
  * to concentrate on the actual hardware operation.
  *
- * Copyright (C) 2012 Hans Verkuil <hansverk@cisco.com>
+ * Copyright (C) 2012 Hans Verkuil <hverkuil@kernel.org>
  */
 
 #include <linux/module.h>
diff --git a/drivers/media/radio/radio-isa.h b/drivers/media/radio/radio-isa.h
index 0f3db473da5e..62ff5c3fb5d5 100644
--- a/drivers/media/radio/radio-isa.h
+++ b/drivers/media/radio/radio-isa.h
@@ -4,7 +4,7 @@
  * This takes care of all the V4L2 scaffolding, allowing the ISA drivers
  * to concentrate on the actual hardware operation.
  *
- * Copyright (C) 2012 Hans Verkuil <hansverk@cisco.com>
+ * Copyright (C) 2012 Hans Verkuil <hverkuil@kernel.org>
  */
 
 #ifndef _RADIO_ISA_H_
diff --git a/drivers/media/radio/radio-miropcm20.c b/drivers/media/radio/radio-miropcm20.c
index 27f058c5e677..67712ab3d564 100644
--- a/drivers/media/radio/radio-miropcm20.c
+++ b/drivers/media/radio/radio-miropcm20.c
@@ -23,7 +23,7 @@
  * This code has been reintroduced and converted to use
  * the new V4L2 RDS API by:
  *
- * Hans Verkuil <hansverk@cisco.com>
+ * Hans Verkuil <hverkuil@kernel.org>
  */
 
 #include <linux/module.h>
diff --git a/drivers/media/radio/radio-rtrack2.c b/drivers/media/radio/radio-rtrack2.c
index 16b13a63bfed..efc02069bf9d 100644
--- a/drivers/media/radio/radio-rtrack2.c
+++ b/drivers/media/radio/radio-rtrack2.c
@@ -7,7 +7,7 @@
  * Converted to new API by Alan Cox <alan@lxorguk.ukuu.org.uk>
  * Various bugfixes and enhancements by Russell Kroll <rkroll@exploits.org>
  *
- * Converted to the radio-isa framework by Hans Verkuil <hansverk@cisco.com>
+ * Converted to the radio-isa framework by Hans Verkuil <hverkuil@kernel.org>
  * Converted to V4L2 API by Mauro Carvalho Chehab <mchehab@kernel.org>
  *
  * Fully tested with actual hardware and the v4l2-compliance tool.
diff --git a/drivers/media/radio/radio-terratec.c b/drivers/media/radio/radio-terratec.c
index 720080634454..43817dd0a0fe 100644
--- a/drivers/media/radio/radio-terratec.c
+++ b/drivers/media/radio/radio-terratec.c
@@ -17,7 +17,7 @@
  *  Frequency control is done digitally -- ie out(port,encodefreq(95.8));
  *  Volume Control is done digitally
  *
- * Converted to the radio-isa framework by Hans Verkuil <hansverk@cisco.com>
+ * Converted to the radio-isa framework by Hans Verkuil <hverkuil@kernel.org>
  * Converted to V4L2 API by Mauro Carvalho Chehab <mchehab@kernel.org>
  */
 
diff --git a/drivers/media/radio/radio-zoltrix.c b/drivers/media/radio/radio-zoltrix.c
index 099b7af6a410..e043bee52384 100644
--- a/drivers/media/radio/radio-zoltrix.c
+++ b/drivers/media/radio/radio-zoltrix.c
@@ -30,7 +30,7 @@
  * 2006-07-24 - Converted to V4L2 API
  *		by Mauro Carvalho Chehab <mchehab@kernel.org>
  *
- * Converted to the radio-isa framework by Hans Verkuil <hansverk@cisco.com>
+ * Converted to the radio-isa framework by Hans Verkuil <hverkuil@kernel.org>
  *
  * Note that this is the driver for the Zoltrix Radio Plus.
  * This driver does not work for the Zoltrix Radio Plus 108 or the
diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drivers/media/test-drivers/vicodec/vicodec-core.c
index c45f5cf12ded..466ccd0a3e27 100644
--- a/drivers/media/test-drivers/vicodec/vicodec-core.c
+++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
@@ -26,7 +26,7 @@
 #include "codec-v4l2-fwht.h"
 
 MODULE_DESCRIPTION("Virtual codec device");
-MODULE_AUTHOR("Hans Verkuil <hansverk@cisco.com>");
+MODULE_AUTHOR("Hans Verkuil <hverkuil@kernel.org>");
 MODULE_LICENSE("GPL v2");
 
 static bool multiplanar;
diff --git a/include/media/i2c/ths7303.h b/include/media/i2c/ths7303.h
index fc937025cdb4..7eda467b6725 100644
--- a/include/media/i2c/ths7303.h
+++ b/include/media/i2c/ths7303.h
@@ -5,7 +5,7 @@
  * Copyright 2013 Cisco Systems, Inc. and/or its affiliates.
  *
  * Contributors:
- *     Hans Verkuil <hansverk@cisco.com>
+ *     Hans Verkuil <hverkuil@kernel.org>
  *     Lad, Prabhakar <prabhakar.lad@ti.com>
  *     Martin Bugge <marbugge@cisco.com>
  */
diff --git a/include/media/media-request.h b/include/media/media-request.h
index d4ac557678a7..bb500b2f9da4 100644
--- a/include/media/media-request.h
+++ b/include/media/media-request.h
@@ -5,7 +5,7 @@
  * Copyright 2018 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
  * Copyright (C) 2018 Intel Corporation
  *
- * Author: Hans Verkuil <hansverk@cisco.com>
+ * Author: Hans Verkuil <hverkuil@kernel.org>
  * Author: Sakari Ailus <sakari.ailus@linux.intel.com>
  */
 
diff --git a/include/uapi/linux/v4l2-dv-timings.h b/include/uapi/linux/v4l2-dv-timings.h
index 44a16e0e5a12..58f478f98a35 100644
--- a/include/uapi/linux/v4l2-dv-timings.h
+++ b/include/uapi/linux/v4l2-dv-timings.h
@@ -2,7 +2,7 @@
 /*
  * V4L2 DV timings header.
  *
- * Copyright (C) 2012-2016  Hans Verkuil <hansverk@cisco.com>
+ * Copyright (C) 2012-2016  Hans Verkuil <hverkuil@kernel.org>
  */
 
 #ifndef _V4L2_DV_TIMINGS_H
-- 
2.47.2


