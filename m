Return-Path: <linux-media+bounces-20674-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6D69B8D77
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 10:12:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCA8C1C20E72
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 09:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 160DB158208;
	Fri,  1 Nov 2024 09:12:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E253FF1
	for <linux-media@vger.kernel.org>; Fri,  1 Nov 2024 09:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730452325; cv=none; b=Yxqc/37gggXP8dTmNnHSV8Vcnsg+iCcxWgk+goTXZ9tO/iAu7VdAyR9g4u4HMjxl7ZcHFsjMfqnVpF9aqvF9KVfEwZGF1k986OPbca7Ac1vKuzlpGITxb9B4cVwv2f9YZsz0Z1texIbsq0M6qjQvH7APHjUVEeV3O/c5swkwd3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730452325; c=relaxed/simple;
	bh=ftzdv7U6+6r8Bazx//gJKR/xs8QZetK8kMv4Mp7hF0k=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=W2WHHrRaD+u08wQzuRyu7Wj94T27eh2Ap5zFMj1OMSXARBkwQFvlssjMF3wRMjgWfVJhXwb0NCXD4qLhCb+z9qH6O5JfT7vgmfoeh7oMiTBhD/VpstTuUdgvFWYQN3MO+pf7kxDHidWKdttMN2aFHqtt0HVKbkoni/kzstiquXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4FC4C4CECD
	for <linux-media@vger.kernel.org>; Fri,  1 Nov 2024 09:12:04 +0000 (UTC)
Message-ID: <5a502f7e-62e5-4be0-a5fc-e82ea4442589@xs4all.nl>
Date: Fri, 1 Nov 2024 10:12:03 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] media: replace obsolete hans.verkuil@cisco.com alias
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The old hans.verkuil@cisco.com email address was discontinued years ago.

Replace it with the correct hansverk@cisco.com email.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
---
diff --git a/drivers/media/cec/core/cec-core.c b/drivers/media/cec/core/cec-core.c
index 48282d272fe6..ca0db8d457b4 100644
--- a/drivers/media/cec/core/cec-core.c
+++ b/drivers/media/cec/core/cec-core.c
@@ -438,6 +438,6 @@ static void __exit cec_devnode_exit(void)
 subsys_initcall(cec_devnode_init);
 module_exit(cec_devnode_exit)

-MODULE_AUTHOR("Hans Verkuil <hans.verkuil@cisco.com>");
+MODULE_AUTHOR("Hans Verkuil <hansverk@cisco.com>");
 MODULE_DESCRIPTION("Device node registration for cec drivers");
 MODULE_LICENSE("GPL");
diff --git a/drivers/media/cec/platform/cec-gpio/cec-gpio.c b/drivers/media/cec/platform/cec-gpio/cec-gpio.c
index 69351730ce86..cf64e8871fe5 100644
--- a/drivers/media/cec/platform/cec-gpio/cec-gpio.c
+++ b/drivers/media/cec/platform/cec-gpio/cec-gpio.c
@@ -288,6 +288,6 @@ static struct platform_driver cec_gpio_pdrv = {

 module_platform_driver(cec_gpio_pdrv);

-MODULE_AUTHOR("Hans Verkuil <hans.verkuil@cisco.com>");
+MODULE_AUTHOR("Hans Verkuil <hansverk@cisco.com>");
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("CEC GPIO driver");
diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
index 4504909d95bc..d91b084b2c7a 100644
--- a/drivers/media/i2c/adv7604.c
+++ b/drivers/media/i2c/adv7604.c
@@ -42,7 +42,7 @@ module_param(debug, int, 0644);
 MODULE_PARM_DESC(debug, "debug level (0-2)");

 MODULE_DESCRIPTION("Analog Devices ADV7604/10/11/12 video decoder driver");
-MODULE_AUTHOR("Hans Verkuil <hans.verkuil@cisco.com>");
+MODULE_AUTHOR("Hans Verkuil <hansverk@cisco.com>");
 MODULE_AUTHOR("Mats Randgaard <mats.randgaard@cisco.com>");
 MODULE_LICENSE("GPL");

diff --git a/drivers/media/i2c/adv7842.c b/drivers/media/i2c/adv7842.c
index 3c9e613af0ce..5545cd23e113 100644
--- a/drivers/media/i2c/adv7842.c
+++ b/drivers/media/i2c/adv7842.c
@@ -38,7 +38,7 @@ module_param(debug, int, 0644);
 MODULE_PARM_DESC(debug, "debug level (0-2)");

 MODULE_DESCRIPTION("Analog Devices ADV7842 video decoder driver");
-MODULE_AUTHOR("Hans Verkuil <hans.verkuil@cisco.com>");
+MODULE_AUTHOR("Hans Verkuil <hansverk@cisco.com>");
 MODULE_AUTHOR("Martin Bugge <marbugge@cisco.com>");
 MODULE_LICENSE("GPL");

diff --git a/drivers/media/i2c/ths7303.c b/drivers/media/i2c/ths7303.c
index 7526fabc7ee4..b7cedc5b3e8e 100644
--- a/drivers/media/i2c/ths7303.c
+++ b/drivers/media/i2c/ths7303.c
@@ -7,7 +7,7 @@
  * Author: Chaithrika U S <chaithrika@ti.com>
  *
  * Contributors:
- *     Hans Verkuil <hans.verkuil@cisco.com>
+ *     Hans Verkuil <hansverk@cisco.com>
  *     Lad, Prabhakar <prabhakar.lad@ti.com>
  *     Martin Bugge <marbugge@cisco.com>
  *
diff --git a/drivers/media/mc/mc-request.c b/drivers/media/mc/mc-request.c
index e064914c476e..1013c76ede27 100644
--- a/drivers/media/mc/mc-request.c
+++ b/drivers/media/mc/mc-request.c
@@ -6,7 +6,7 @@
  * Copyright (C) 2018 Intel Corporation
  * Copyright (C) 2018 Google, Inc.
  *
- * Author: Hans Verkuil <hans.verkuil@cisco.com>
+ * Author: Hans Verkuil <hansverk@cisco.com>
  * Author: Sakari Ailus <sakari.ailus@linux.intel.com>
  */

diff --git a/drivers/media/pci/cobalt/cobalt-driver.c b/drivers/media/pci/cobalt/cobalt-driver.c
index 6e1a0614e6d0..39e25cc53edb 100644
--- a/drivers/media/pci/cobalt/cobalt-driver.c
+++ b/drivers/media/pci/cobalt/cobalt-driver.c
@@ -44,7 +44,7 @@ module_param_named(ignore_err, cobalt_ignore_err, int, 0644);
 MODULE_PARM_DESC(ignore_err,
 	"If set then ignore missing i2c adapters/receivers. Default: 0\n");

-MODULE_AUTHOR("Hans Verkuil <hans.verkuil@cisco.com> & Morten Hestnes");
+MODULE_AUTHOR("Hans Verkuil <hansverk@cisco.com> & Morten Hestnes");
 MODULE_DESCRIPTION("cobalt driver");
 MODULE_LICENSE("GPL");

diff --git a/drivers/media/radio/radio-aimslab.c b/drivers/media/radio/radio-aimslab.c
index 0e9a3787724c..3c8c17d64821 100644
--- a/drivers/media/radio/radio-aimslab.c
+++ b/drivers/media/radio/radio-aimslab.c
@@ -4,7 +4,7 @@
  *
  * Copyright 1997 M. Kirkwood
  *
- * Converted to the radio-isa framework by Hans Verkuil <hans.verkuil@cisco.com>
+ * Converted to the radio-isa framework by Hans Verkuil <hansverk@cisco.com>
  * Converted to V4L2 API by Mauro Carvalho Chehab <mchehab@kernel.org>
  * Converted to new API by Alan Cox <alan@lxorguk.ukuu.org.uk>
  * Various bugfixes and enhancements by Russell Kroll <rkroll@exploits.org>
diff --git a/drivers/media/radio/radio-gemtek.c b/drivers/media/radio/radio-gemtek.c
index a532f63aa9d9..5ca6274c45bd 100644
--- a/drivers/media/radio/radio-gemtek.c
+++ b/drivers/media/radio/radio-gemtek.c
@@ -15,7 +15,7 @@
  *    Converted to new API by Alan Cox <alan@lxorguk.ukuu.org.uk>
  *    Various bugfixes and enhancements by Russell Kroll <rkroll@exploits.org>
  *
- * Converted to the radio-isa framework by Hans Verkuil <hans.verkuil@cisco.com>
+ * Converted to the radio-isa framework by Hans Verkuil <hansverk@cisco.com>
  * Converted to V4L2 API by Mauro Carvalho Chehab <mchehab@kernel.org>
  *
  * Note: this card seems to swap the left and right audio channels!
diff --git a/drivers/media/radio/radio-isa.c b/drivers/media/radio/radio-isa.c
index ad49151f5ff0..4f87c76a2a96 100644
--- a/drivers/media/radio/radio-isa.c
+++ b/drivers/media/radio/radio-isa.c
@@ -4,7 +4,7 @@
  * This takes care of all the V4L2 scaffolding, allowing the ISA drivers
  * to concentrate on the actual hardware operation.
  *
- * Copyright (C) 2012 Hans Verkuil <hans.verkuil@cisco.com>
+ * Copyright (C) 2012 Hans Verkuil <hansverk@cisco.com>
  */

 #include <linux/module.h>
diff --git a/drivers/media/radio/radio-isa.h b/drivers/media/radio/radio-isa.h
index c9159958203e..0f3db473da5e 100644
--- a/drivers/media/radio/radio-isa.h
+++ b/drivers/media/radio/radio-isa.h
@@ -4,7 +4,7 @@
  * This takes care of all the V4L2 scaffolding, allowing the ISA drivers
  * to concentrate on the actual hardware operation.
  *
- * Copyright (C) 2012 Hans Verkuil <hans.verkuil@cisco.com>
+ * Copyright (C) 2012 Hans Verkuil <hansverk@cisco.com>
  */

 #ifndef _RADIO_ISA_H_
diff --git a/drivers/media/radio/radio-miropcm20.c b/drivers/media/radio/radio-miropcm20.c
index 08be77b8f3b7..27f058c5e677 100644
--- a/drivers/media/radio/radio-miropcm20.c
+++ b/drivers/media/radio/radio-miropcm20.c
@@ -23,7 +23,7 @@
  * This code has been reintroduced and converted to use
  * the new V4L2 RDS API by:
  *
- * Hans Verkuil <hans.verkuil@cisco.com>
+ * Hans Verkuil <hansverk@cisco.com>
  */

 #include <linux/module.h>
diff --git a/drivers/media/radio/radio-rtrack2.c b/drivers/media/radio/radio-rtrack2.c
index 73d2c187f122..16b13a63bfed 100644
--- a/drivers/media/radio/radio-rtrack2.c
+++ b/drivers/media/radio/radio-rtrack2.c
@@ -7,7 +7,7 @@
  * Converted to new API by Alan Cox <alan@lxorguk.ukuu.org.uk>
  * Various bugfixes and enhancements by Russell Kroll <rkroll@exploits.org>
  *
- * Converted to the radio-isa framework by Hans Verkuil <hans.verkuil@cisco.com>
+ * Converted to the radio-isa framework by Hans Verkuil <hansverk@cisco.com>
  * Converted to V4L2 API by Mauro Carvalho Chehab <mchehab@kernel.org>
  *
  * Fully tested with actual hardware and the v4l2-compliance tool.
diff --git a/drivers/media/radio/radio-terratec.c b/drivers/media/radio/radio-terratec.c
index 621bb8523271..720080634454 100644
--- a/drivers/media/radio/radio-terratec.c
+++ b/drivers/media/radio/radio-terratec.c
@@ -17,7 +17,7 @@
  *  Frequency control is done digitally -- ie out(port,encodefreq(95.8));
  *  Volume Control is done digitally
  *
- * Converted to the radio-isa framework by Hans Verkuil <hans.verkuil@cisco.com>
+ * Converted to the radio-isa framework by Hans Verkuil <hansverk@cisco.com>
  * Converted to V4L2 API by Mauro Carvalho Chehab <mchehab@kernel.org>
  */

diff --git a/drivers/media/radio/radio-zoltrix.c b/drivers/media/radio/radio-zoltrix.c
index f3dc57c75131..099b7af6a410 100644
--- a/drivers/media/radio/radio-zoltrix.c
+++ b/drivers/media/radio/radio-zoltrix.c
@@ -30,7 +30,7 @@
  * 2006-07-24 - Converted to V4L2 API
  *		by Mauro Carvalho Chehab <mchehab@kernel.org>
  *
- * Converted to the radio-isa framework by Hans Verkuil <hans.verkuil@cisco.com>
+ * Converted to the radio-isa framework by Hans Verkuil <hansverk@cisco.com>
  *
  * Note that this is the driver for the Zoltrix Radio Plus.
  * This driver does not work for the Zoltrix Radio Plus 108 or the
diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drivers/media/test-drivers/vicodec/vicodec-core.c
index 00c84a06f343..9e29db5fe27b 100644
--- a/drivers/media/test-drivers/vicodec/vicodec-core.c
+++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
@@ -26,7 +26,7 @@
 #include "codec-v4l2-fwht.h"

 MODULE_DESCRIPTION("Virtual codec device");
-MODULE_AUTHOR("Hans Verkuil <hans.verkuil@cisco.com>");
+MODULE_AUTHOR("Hans Verkuil <hansverk@cisco.com>");
 MODULE_LICENSE("GPL v2");

 static bool multiplanar;
diff --git a/include/media/i2c/ths7303.h b/include/media/i2c/ths7303.h
index fee2818c558d..fc937025cdb4 100644
--- a/include/media/i2c/ths7303.h
+++ b/include/media/i2c/ths7303.h
@@ -5,7 +5,7 @@
  * Copyright 2013 Cisco Systems, Inc. and/or its affiliates.
  *
  * Contributors:
- *     Hans Verkuil <hans.verkuil@cisco.com>
+ *     Hans Verkuil <hansverk@cisco.com>
  *     Lad, Prabhakar <prabhakar.lad@ti.com>
  *     Martin Bugge <marbugge@cisco.com>
  */
diff --git a/include/media/media-request.h b/include/media/media-request.h
index 3cd25a2717ce..d4ac557678a7 100644
--- a/include/media/media-request.h
+++ b/include/media/media-request.h
@@ -5,7 +5,7 @@
  * Copyright 2018 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
  * Copyright (C) 2018 Intel Corporation
  *
- * Author: Hans Verkuil <hans.verkuil@cisco.com>
+ * Author: Hans Verkuil <hansverk@cisco.com>
  * Author: Sakari Ailus <sakari.ailus@linux.intel.com>
  */

diff --git a/include/uapi/linux/v4l2-dv-timings.h b/include/uapi/linux/v4l2-dv-timings.h
index ef0128c7369c..44a16e0e5a12 100644
--- a/include/uapi/linux/v4l2-dv-timings.h
+++ b/include/uapi/linux/v4l2-dv-timings.h
@@ -2,7 +2,7 @@
 /*
  * V4L2 DV timings header.
  *
- * Copyright (C) 2012-2016  Hans Verkuil <hans.verkuil@cisco.com>
+ * Copyright (C) 2012-2016  Hans Verkuil <hansverk@cisco.com>
  */

 #ifndef _V4L2_DV_TIMINGS_H

