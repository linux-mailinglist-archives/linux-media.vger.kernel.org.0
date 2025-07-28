Return-Path: <linux-media+bounces-38551-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DB1B13825
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 11:50:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A9D217A5855
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 09:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D90F25C80E;
	Mon, 28 Jul 2025 09:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T3t3Qf72"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A34525BF13
	for <linux-media@vger.kernel.org>; Mon, 28 Jul 2025 09:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753696117; cv=none; b=EgDw8AyZwZLw6EPZis05Fr6H5rOQLXEyIRVKaa9OTjuyxcVtbNrJJjQrpa0n0wLM73feipJ9vXjhjyXize2pkqYBmvrI2XCFIb09oeSdK36mjKppp2v2u4eD6q3r2RdSjExsBoHHarY+y5jv2P/ZAol5kPwE9+mu1Tv3levVfnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753696117; c=relaxed/simple;
	bh=SM8XPf1xrH2Uj59Z6rpe2/8f9hoLaCGHnsk79PDPYL0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RmPuJyPcH9PBbZVqWwzZH49o8wytlR5XQ9nKP6mJBB2Ktusvp+lHahaSlUFFgDqQskApwITc+e/kPqqGSCifiS7iYVDlJqi/SRDYK60eCu6TqFp6TIkZF9ngoI0HcFrjvLwBV4yk6DyOWsTAaTCQu3+OqzjwAAEHQNmd73EULr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T3t3Qf72; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70D9AC4CEE7;
	Mon, 28 Jul 2025 09:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753696117;
	bh=SM8XPf1xrH2Uj59Z6rpe2/8f9hoLaCGHnsk79PDPYL0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T3t3Qf72If8ftmWKgyToGfHNwxrJRgdAjf2KDOPeWXkD3sGZYc0Y8IhmZsED6Oiqd
	 QjJeE/ZWvx3x3+8GeXkgeKdaTdtaV2U6sNQUq1aQ/XyqJBsyiuXhtbiDwtR8virilE
	 ysijkW7t46dtsZAeXy44oJWWDKMOrUDCdFGtjhgrsJN4jwRmzpb4hvUPaM66272j7x
	 0BzhKMjrzbuSUmbYo5ka7h+5Vs8FDhc0JPkhhdo8HBo5gzMgcBCuajwvp1/4huugHS
	 YetzjDyifWLxOXjSMJ3PAv7x4RNkoL8FSQVsQrME9q7SiKm4qpaPI37MtoZqiD2u0q
	 ja1VZWr/oUn1Q==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@kernel.org>
Subject: [PATCHv2 7/8] media: update Hans Verkuil's email address
Date: Mon, 28 Jul 2025 11:47:02 +0200
Message-ID: <43103d86a40dab56ead759111d7e675bf85a4455.1753696023.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1753696022.git.hverkuil+cisco@kernel.org>
References: <cover.1753696022.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hans Verkuil <hverkuil@kernel.org>

Replace hverkuil@xs4all.nl by hverkuil@kernel.org.

Signed-off-by: Hans Verkuil <hverkuil@kernel.org>
---
 drivers/media/cec/usb/pulse8/pulse8-cec.c         | 4 ++--
 drivers/media/cec/usb/rainshadow/rainshadow-cec.c | 4 ++--
 drivers/media/common/cx2341x.c                    | 2 +-
 drivers/media/i2c/cx25840/cx25840-core.c          | 4 ++--
 drivers/media/i2c/saa6752hs.c                     | 2 +-
 drivers/media/i2c/saa7115.c                       | 2 +-
 drivers/media/i2c/saa7127.c                       | 2 +-
 drivers/media/i2c/saa717x.c                       | 2 +-
 drivers/media/i2c/tda9840.c                       | 2 +-
 drivers/media/i2c/tea6415c.c                      | 2 +-
 drivers/media/i2c/tea6420.c                       | 2 +-
 drivers/media/i2c/tlv320aic23b.c                  | 2 +-
 drivers/media/i2c/upd64031a.c                     | 2 +-
 drivers/media/i2c/upd64083.c                      | 2 +-
 drivers/media/i2c/vp27smpx.c                      | 2 +-
 drivers/media/i2c/wm8739.c                        | 2 +-
 drivers/media/i2c/wm8775.c                        | 2 +-
 drivers/media/pci/cx18/cx18-audio.c               | 2 +-
 drivers/media/pci/cx18/cx18-audio.h               | 2 +-
 drivers/media/pci/cx18/cx18-av-audio.c            | 2 +-
 drivers/media/pci/cx18/cx18-av-core.c             | 2 +-
 drivers/media/pci/cx18/cx18-av-core.h             | 2 +-
 drivers/media/pci/cx18/cx18-av-firmware.c         | 2 +-
 drivers/media/pci/cx18/cx18-av-vbi.c              | 2 +-
 drivers/media/pci/cx18/cx18-cards.c               | 2 +-
 drivers/media/pci/cx18/cx18-cards.h               | 2 +-
 drivers/media/pci/cx18/cx18-controls.c            | 2 +-
 drivers/media/pci/cx18/cx18-controls.h            | 2 +-
 drivers/media/pci/cx18/cx18-driver.c              | 2 +-
 drivers/media/pci/cx18/cx18-driver.h              | 2 +-
 drivers/media/pci/cx18/cx18-fileops.c             | 2 +-
 drivers/media/pci/cx18/cx18-fileops.h             | 2 +-
 drivers/media/pci/cx18/cx18-firmware.c            | 2 +-
 drivers/media/pci/cx18/cx18-firmware.h            | 2 +-
 drivers/media/pci/cx18/cx18-gpio.c                | 2 +-
 drivers/media/pci/cx18/cx18-gpio.h                | 2 +-
 drivers/media/pci/cx18/cx18-i2c.c                 | 2 +-
 drivers/media/pci/cx18/cx18-i2c.h                 | 2 +-
 drivers/media/pci/cx18/cx18-io.c                  | 2 +-
 drivers/media/pci/cx18/cx18-io.h                  | 2 +-
 drivers/media/pci/cx18/cx18-ioctl.c               | 2 +-
 drivers/media/pci/cx18/cx18-ioctl.h               | 2 +-
 drivers/media/pci/cx18/cx18-irq.c                 | 2 +-
 drivers/media/pci/cx18/cx18-irq.h                 | 2 +-
 drivers/media/pci/cx18/cx18-mailbox.c             | 2 +-
 drivers/media/pci/cx18/cx18-mailbox.h             | 2 +-
 drivers/media/pci/cx18/cx18-queue.c               | 2 +-
 drivers/media/pci/cx18/cx18-queue.h               | 2 +-
 drivers/media/pci/cx18/cx18-scb.c                 | 2 +-
 drivers/media/pci/cx18/cx18-scb.h                 | 2 +-
 drivers/media/pci/cx18/cx18-streams.c             | 2 +-
 drivers/media/pci/cx18/cx18-streams.h             | 2 +-
 drivers/media/pci/cx18/cx18-vbi.c                 | 2 +-
 drivers/media/pci/cx18/cx18-vbi.h                 | 2 +-
 drivers/media/pci/cx18/cx18-version.h             | 2 +-
 drivers/media/pci/cx18/cx18-video.c               | 2 +-
 drivers/media/pci/cx18/cx18-video.h               | 2 +-
 drivers/media/pci/cx18/cx23418.h                  | 2 +-
 drivers/media/pci/ivtv/ivtv-cards.c               | 2 +-
 drivers/media/pci/ivtv/ivtv-cards.h               | 2 +-
 drivers/media/pci/ivtv/ivtv-controls.c            | 2 +-
 drivers/media/pci/ivtv/ivtv-controls.h            | 2 +-
 drivers/media/pci/ivtv/ivtv-driver.c              | 2 +-
 drivers/media/pci/ivtv/ivtv-driver.h              | 2 +-
 drivers/media/pci/ivtv/ivtv-fileops.c             | 2 +-
 drivers/media/pci/ivtv/ivtv-fileops.h             | 2 +-
 drivers/media/pci/ivtv/ivtv-firmware.c            | 2 +-
 drivers/media/pci/ivtv/ivtv-firmware.h            | 2 +-
 drivers/media/pci/ivtv/ivtv-gpio.c                | 2 +-
 drivers/media/pci/ivtv/ivtv-gpio.h                | 2 +-
 drivers/media/pci/ivtv/ivtv-i2c.c                 | 2 +-
 drivers/media/pci/ivtv/ivtv-i2c.h                 | 2 +-
 drivers/media/pci/ivtv/ivtv-ioctl.c               | 2 +-
 drivers/media/pci/ivtv/ivtv-ioctl.h               | 2 +-
 drivers/media/pci/ivtv/ivtv-irq.c                 | 2 +-
 drivers/media/pci/ivtv/ivtv-irq.h                 | 2 +-
 drivers/media/pci/ivtv/ivtv-mailbox.c             | 2 +-
 drivers/media/pci/ivtv/ivtv-mailbox.h             | 2 +-
 drivers/media/pci/ivtv/ivtv-queue.c               | 2 +-
 drivers/media/pci/ivtv/ivtv-queue.h               | 2 +-
 drivers/media/pci/ivtv/ivtv-routing.c             | 2 +-
 drivers/media/pci/ivtv/ivtv-routing.h             | 2 +-
 drivers/media/pci/ivtv/ivtv-streams.c             | 2 +-
 drivers/media/pci/ivtv/ivtv-streams.h             | 2 +-
 drivers/media/pci/ivtv/ivtv-udma.c                | 2 +-
 drivers/media/pci/ivtv/ivtv-udma.h                | 2 +-
 drivers/media/pci/ivtv/ivtv-vbi.c                 | 2 +-
 drivers/media/pci/ivtv/ivtv-vbi.h                 | 2 +-
 drivers/media/pci/ivtv/ivtv-version.h             | 2 +-
 drivers/media/pci/tw68/tw68-core.c                | 4 ++--
 drivers/media/pci/tw68/tw68-reg.h                 | 2 +-
 drivers/media/pci/tw68/tw68-risc.c                | 2 +-
 drivers/media/pci/tw68/tw68-video.c               | 2 +-
 drivers/media/pci/tw68/tw68.h                     | 2 +-
 drivers/media/platform/marvell/cafe-driver.c      | 2 +-
 drivers/media/radio/radio-aztech.c                | 2 +-
 drivers/media/radio/radio-keene.c                 | 4 ++--
 drivers/media/radio/radio-raremono.c              | 4 ++--
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c     | 2 +-
 drivers/media/v4l2-core/v4l2-device.c             | 2 +-
 100 files changed, 106 insertions(+), 106 deletions(-)

diff --git a/drivers/media/cec/usb/pulse8/pulse8-cec.c b/drivers/media/cec/usb/pulse8/pulse8-cec.c
index 171366fe3544..60569f1670fe 100644
--- a/drivers/media/cec/usb/pulse8/pulse8-cec.c
+++ b/drivers/media/cec/usb/pulse8/pulse8-cec.c
@@ -2,7 +2,7 @@
 /*
  * Pulse Eight HDMI CEC driver
  *
- * Copyright 2016 Hans Verkuil <hverkuil@xs4all.nl
+ * Copyright 2016 Hans Verkuil <hverkuil@kernel.org>
  */
 
 /*
@@ -41,7 +41,7 @@
 
 #include <media/cec.h>
 
-MODULE_AUTHOR("Hans Verkuil <hverkuil@xs4all.nl>");
+MODULE_AUTHOR("Hans Verkuil <hverkuil@kernel.org>");
 MODULE_DESCRIPTION("Pulse Eight HDMI CEC driver");
 MODULE_LICENSE("GPL");
 
diff --git a/drivers/media/cec/usb/rainshadow/rainshadow-cec.c b/drivers/media/cec/usb/rainshadow/rainshadow-cec.c
index 6f8d6797c614..08f58456d682 100644
--- a/drivers/media/cec/usb/rainshadow/rainshadow-cec.c
+++ b/drivers/media/cec/usb/rainshadow/rainshadow-cec.c
@@ -2,7 +2,7 @@
 /*
  * RainShadow Tech HDMI CEC driver
  *
- * Copyright 2016 Hans Verkuil <hverkuil@xs4all.nl
+ * Copyright 2016 Hans Verkuil <hverkuil@kernel.org>
  */
 
 /*
@@ -31,7 +31,7 @@
 
 #include <media/cec.h>
 
-MODULE_AUTHOR("Hans Verkuil <hverkuil@xs4all.nl>");
+MODULE_AUTHOR("Hans Verkuil <hverkuil@kernel.org>");
 MODULE_DESCRIPTION("RainShadow Tech HDMI CEC driver");
 MODULE_LICENSE("GPL");
 
diff --git a/drivers/media/common/cx2341x.c b/drivers/media/common/cx2341x.c
index 1392bd6b0026..1ee159ef7f38 100644
--- a/drivers/media/common/cx2341x.c
+++ b/drivers/media/common/cx2341x.c
@@ -2,7 +2,7 @@
 /*
  * cx2341x - generic code for cx23415/6/8 based devices
  *
- * Copyright (C) 2006 Hans Verkuil <hverkuil@xs4all.nl>
+ * Copyright (C) 2006 Hans Verkuil <hverkuil@kernel.org>
  */
 
 
diff --git a/drivers/media/i2c/cx25840/cx25840-core.c b/drivers/media/i2c/cx25840/cx25840-core.c
index a90a9e5705a0..a86306304330 100644
--- a/drivers/media/i2c/cx25840/cx25840-core.c
+++ b/drivers/media/i2c/cx25840/cx25840-core.c
@@ -9,10 +9,10 @@
  * Changes by Tyler Trafford <tatrafford@comcast.net>
  *    - cleanup/rewrite for V4L2 API (2005)
  *
- * VBI support by Hans Verkuil <hverkuil@xs4all.nl>.
+ * VBI support by Hans Verkuil <hverkuil@kernel.org>.
  *
  * NTSC sliced VBI support by Christopher Neufeld <television@cneufeld.ca>
- * with additional fixes by Hans Verkuil <hverkuil@xs4all.nl>.
+ * with additional fixes by Hans Verkuil <hverkuil@kernel.org>.
  *
  * CX23885 support by Steven Toth <stoth@linuxtv.org>.
  *
diff --git a/drivers/media/i2c/saa6752hs.c b/drivers/media/i2c/saa6752hs.c
index 1ed8b5edb3fb..1c0031ba43b4 100644
--- a/drivers/media/i2c/saa6752hs.c
+++ b/drivers/media/i2c/saa6752hs.c
@@ -6,7 +6,7 @@
 
     AC-3 support:
 
-    Copyright (C) 2008 Hans Verkuil <hverkuil@xs4all.nl>
+    Copyright (C) 2008 Hans Verkuil <hverkuil@kernel.org>
 
   */
 
diff --git a/drivers/media/i2c/saa7115.c b/drivers/media/i2c/saa7115.c
index b8b8f206ec3a..48d6730d9271 100644
--- a/drivers/media/i2c/saa7115.c
+++ b/drivers/media/i2c/saa7115.c
@@ -18,7 +18,7 @@
 // Added saa7115 support by Kevin Thayer <nufan_wfk at yahoo.com>
 // (2/17/2003)
 //
-// VBI support (2004) and cleanups (2005) by Hans Verkuil <hverkuil@xs4all.nl>
+// VBI support (2004) and cleanups (2005) by Hans Verkuil <hverkuil@kernel.org>
 //
 // Copyright (c) 2005-2006 Mauro Carvalho Chehab <mchehab@kernel.org>
 //	SAA7111, SAA7113 and SAA7118 support
diff --git a/drivers/media/i2c/saa7127.c b/drivers/media/i2c/saa7127.c
index 818ed19cf37b..a42a7ffe3768 100644
--- a/drivers/media/i2c/saa7127.c
+++ b/drivers/media/i2c/saa7127.c
@@ -25,7 +25,7 @@
  * Copyright (C) 2004  Chris Kennedy <c@groovy.org>
  *
  * VBI additions & cleanup:
- * Copyright (C) 2004, 2005 Hans Verkuil <hverkuil@xs4all.nl>
+ * Copyright (C) 2004, 2005 Hans Verkuil <hverkuil@kernel.org>
  *
  * Note: the saa7126 is identical to the saa7127, and the saa7128 is
  * identical to the saa7129, except that the saa7126 and saa7128 have
diff --git a/drivers/media/i2c/saa717x.c b/drivers/media/i2c/saa717x.c
index b0793bb0c02a..713331be947c 100644
--- a/drivers/media/i2c/saa717x.c
+++ b/drivers/media/i2c/saa717x.c
@@ -10,7 +10,7 @@
  * Changes by T.Adachi (tadachi@tadachi-net.com)
  *    - support audio, video scaler etc, and checked the initialize sequence.
  *
- * Cleaned up by Hans Verkuil <hverkuil@xs4all.nl>
+ * Cleaned up by Hans Verkuil <hverkuil@kernel.org>
  *
  * Note: this is a reversed engineered driver based on captures from
  * the I2C bus under Windows. This chip is very similar to the saa7134,
diff --git a/drivers/media/i2c/tda9840.c b/drivers/media/i2c/tda9840.c
index d61da811c9da..e3b266db571f 100644
--- a/drivers/media/i2c/tda9840.c
+++ b/drivers/media/i2c/tda9840.c
@@ -3,7 +3,7 @@
     tda9840 - i2c-driver for the tda9840 by SGS Thomson
 
     Copyright (C) 1998-2003 Michael Hunold <michael@mihu.de>
-    Copyright (C) 2008 Hans Verkuil <hverkuil@xs4all.nl>
+    Copyright (C) 2008 Hans Verkuil <hverkuil@kernel.org>
 
     The tda9840 is a stereo/dual sound processor with digital
     identification. It can be found at address 0x84 on the i2c-bus.
diff --git a/drivers/media/i2c/tea6415c.c b/drivers/media/i2c/tea6415c.c
index 4aaf66353610..0cd2e6c52e20 100644
--- a/drivers/media/i2c/tea6415c.c
+++ b/drivers/media/i2c/tea6415c.c
@@ -3,7 +3,7 @@
     tea6415c - i2c-driver for the tea6415c by SGS Thomson
 
     Copyright (C) 1998-2003 Michael Hunold <michael@mihu.de>
-    Copyright (C) 2008 Hans Verkuil <hverkuil@xs4all.nl>
+    Copyright (C) 2008 Hans Verkuil <hverkuil@kernel.org>
 
     The tea6415c is a bus controlled video-matrix-switch
     with 8 inputs and 6 outputs.
diff --git a/drivers/media/i2c/tea6420.c b/drivers/media/i2c/tea6420.c
index 5c5ea3973251..400883fc0c0f 100644
--- a/drivers/media/i2c/tea6420.c
+++ b/drivers/media/i2c/tea6420.c
@@ -3,7 +3,7 @@
     tea6420 - i2c-driver for the tea6420 by SGS Thomson
 
     Copyright (C) 1998-2003 Michael Hunold <michael@mihu.de>
-    Copyright (C) 2008 Hans Verkuil <hverkuil@xs4all.nl>
+    Copyright (C) 2008 Hans Verkuil <hverkuil@kernel.org>
 
     The tea6420 is a bus controlled audio-matrix with 5 stereo inputs,
     4 stereo outputs and gain control for each output.
diff --git a/drivers/media/i2c/tlv320aic23b.c b/drivers/media/i2c/tlv320aic23b.c
index b7b31b6192af..6f6bc5236565 100644
--- a/drivers/media/i2c/tlv320aic23b.c
+++ b/drivers/media/i2c/tlv320aic23b.c
@@ -7,7 +7,7 @@
  * Based on wm8775 driver
  *
  * Copyright (C) 2004 Ulf Eklund <ivtv at eklund.to>
- * Copyright (C) 2005 Hans Verkuil <hverkuil@xs4all.nl>
+ * Copyright (C) 2005 Hans Verkuil <hverkuil@kernel.org>
  */
 
 #include <linux/module.h>
diff --git a/drivers/media/i2c/upd64031a.c b/drivers/media/i2c/upd64031a.c
index 9d0b72a213be..a178af46e695 100644
--- a/drivers/media/i2c/upd64031a.c
+++ b/drivers/media/i2c/upd64031a.c
@@ -4,7 +4,7 @@
  *
  * 2003 by T.Adachi <tadachi@tadachi-net.com>
  * 2003 by Takeru KOMORIYA <komoriya@paken.org>
- * 2006 by Hans Verkuil <hverkuil@xs4all.nl>
+ * 2006 by Hans Verkuil <hverkuil@kernel.org>
  */
 
 
diff --git a/drivers/media/i2c/upd64083.c b/drivers/media/i2c/upd64083.c
index 2e99ed5da42c..5421dc5e32c9 100644
--- a/drivers/media/i2c/upd64083.c
+++ b/drivers/media/i2c/upd64083.c
@@ -4,7 +4,7 @@
  *
  * 2003 by T.Adachi (tadachi@tadachi-net.com)
  * 2003 by Takeru KOMORIYA <komoriya@paken.org>
- * 2006 by Hans Verkuil <hverkuil@xs4all.nl>
+ * 2006 by Hans Verkuil <hverkuil@kernel.org>
  */
 
 #include <linux/module.h>
diff --git a/drivers/media/i2c/vp27smpx.c b/drivers/media/i2c/vp27smpx.c
index 06fd46a63c72..df21950be24f 100644
--- a/drivers/media/i2c/vp27smpx.c
+++ b/drivers/media/i2c/vp27smpx.c
@@ -2,7 +2,7 @@
 /*
  * vp27smpx - driver version 0.0.1
  *
- * Copyright (C) 2007 Hans Verkuil <hverkuil@xs4all.nl>
+ * Copyright (C) 2007 Hans Verkuil <hverkuil@kernel.org>
  *
  * Based on a tvaudio patch from Takahiro Adachi <tadachi@tadachi-net.com>
  * and Kazuhiko Kawakami <kazz-0@mail.goo.ne.jp>
diff --git a/drivers/media/i2c/wm8739.c b/drivers/media/i2c/wm8739.c
index c091b78a5b41..72eb10339d06 100644
--- a/drivers/media/i2c/wm8739.c
+++ b/drivers/media/i2c/wm8739.c
@@ -4,7 +4,7 @@
  *
  * Copyright (C) 2005 T. Adachi <tadachi@tadachi-net.com>
  *
- * Copyright (C) 2005 Hans Verkuil <hverkuil@xs4all.nl>
+ * Copyright (C) 2005 Hans Verkuil <hverkuil@kernel.org>
  * - Cleanup
  */
 
diff --git a/drivers/media/i2c/wm8775.c b/drivers/media/i2c/wm8775.c
index 619b2988577c..56778d3bc28a 100644
--- a/drivers/media/i2c/wm8775.c
+++ b/drivers/media/i2c/wm8775.c
@@ -6,7 +6,7 @@
  *
  * Based on saa7115 driver
  *
- * Copyright (C) 2005 Hans Verkuil <hverkuil@xs4all.nl>
+ * Copyright (C) 2005 Hans Verkuil <hverkuil@kernel.org>
  * - Cleanup
  * - V4L2 API update
  * - sound fixes
diff --git a/drivers/media/pci/cx18/cx18-audio.c b/drivers/media/pci/cx18/cx18-audio.c
index 8602d088601b..1464795619f9 100644
--- a/drivers/media/pci/cx18/cx18-audio.c
+++ b/drivers/media/pci/cx18/cx18-audio.c
@@ -4,7 +4,7 @@
  *
  *  Derived from ivtv-audio.c
  *
- *  Copyright (C) 2007  Hans Verkuil <hverkuil@xs4all.nl>
+ *  Copyright (C) 2007  Hans Verkuil <hverkuil@kernel.org>
  */
 
 #include "cx18-driver.h"
diff --git a/drivers/media/pci/cx18/cx18-audio.h b/drivers/media/pci/cx18/cx18-audio.h
index 36ce333ab07a..29cf89d38d60 100644
--- a/drivers/media/pci/cx18/cx18-audio.h
+++ b/drivers/media/pci/cx18/cx18-audio.h
@@ -4,7 +4,7 @@
  *
  *  Derived from ivtv-audio.c
  *
- *  Copyright (C) 2007  Hans Verkuil <hverkuil@xs4all.nl>
+ *  Copyright (C) 2007  Hans Verkuil <hverkuil@kernel.org>
  */
 
 int cx18_audio_set_io(struct cx18 *cx);
diff --git a/drivers/media/pci/cx18/cx18-av-audio.c b/drivers/media/pci/cx18/cx18-av-audio.c
index 78e05df9a7ba..644d8ca4519b 100644
--- a/drivers/media/pci/cx18/cx18-av-audio.c
+++ b/drivers/media/pci/cx18/cx18-av-audio.c
@@ -4,7 +4,7 @@
  *
  *  Derived from cx25840-audio.c
  *
- *  Copyright (C) 2007  Hans Verkuil <hverkuil@xs4all.nl>
+ *  Copyright (C) 2007  Hans Verkuil <hverkuil@kernel.org>
  *  Copyright (C) 2008  Andy Walls <awalls@md.metrocast.net>
  */
 
diff --git a/drivers/media/pci/cx18/cx18-av-core.c b/drivers/media/pci/cx18/cx18-av-core.c
index ee6e71157786..4fb19d26ee29 100644
--- a/drivers/media/pci/cx18/cx18-av-core.c
+++ b/drivers/media/pci/cx18/cx18-av-core.c
@@ -4,7 +4,7 @@
  *
  *  Derived from cx25840-core.c
  *
- *  Copyright (C) 2007  Hans Verkuil <hverkuil@xs4all.nl>
+ *  Copyright (C) 2007  Hans Verkuil <hverkuil@kernel.org>
  *  Copyright (C) 2008  Andy Walls <awalls@md.metrocast.net>
  */
 
diff --git a/drivers/media/pci/cx18/cx18-av-core.h b/drivers/media/pci/cx18/cx18-av-core.h
index 55aceb064b33..71ac9d7af28f 100644
--- a/drivers/media/pci/cx18/cx18-av-core.h
+++ b/drivers/media/pci/cx18/cx18-av-core.h
@@ -4,7 +4,7 @@
  *
  *  Derived from cx25840-core.h
  *
- *  Copyright (C) 2007  Hans Verkuil <hverkuil@xs4all.nl>
+ *  Copyright (C) 2007  Hans Verkuil <hverkuil@kernel.org>
  *  Copyright (C) 2008  Andy Walls <awalls@md.metrocast.net>
  */
 
diff --git a/drivers/media/pci/cx18/cx18-av-firmware.c b/drivers/media/pci/cx18/cx18-av-firmware.c
index 61aeb8c9af7f..02dde685a6ad 100644
--- a/drivers/media/pci/cx18/cx18-av-firmware.c
+++ b/drivers/media/pci/cx18/cx18-av-firmware.c
@@ -2,7 +2,7 @@
 /*
  *  cx18 ADEC firmware functions
  *
- *  Copyright (C) 2007  Hans Verkuil <hverkuil@xs4all.nl>
+ *  Copyright (C) 2007  Hans Verkuil <hverkuil@kernel.org>
  *  Copyright (C) 2008  Andy Walls <awalls@md.metrocast.net>
  */
 
diff --git a/drivers/media/pci/cx18/cx18-av-vbi.c b/drivers/media/pci/cx18/cx18-av-vbi.c
index 1a113aad9cd4..f9beeaeaa1cb 100644
--- a/drivers/media/pci/cx18/cx18-av-vbi.c
+++ b/drivers/media/pci/cx18/cx18-av-vbi.c
@@ -4,7 +4,7 @@
  *
  *  Derived from cx25840-vbi.c
  *
- *  Copyright (C) 2007  Hans Verkuil <hverkuil@xs4all.nl>
+ *  Copyright (C) 2007  Hans Verkuil <hverkuil@kernel.org>
  */
 
 
diff --git a/drivers/media/pci/cx18/cx18-cards.c b/drivers/media/pci/cx18/cx18-cards.c
index f5a30959a367..bddb9e0fffe0 100644
--- a/drivers/media/pci/cx18/cx18-cards.c
+++ b/drivers/media/pci/cx18/cx18-cards.c
@@ -4,7 +4,7 @@
  *
  *  Derived from ivtv-cards.c
  *
- *  Copyright (C) 2007  Hans Verkuil <hverkuil@xs4all.nl>
+ *  Copyright (C) 2007  Hans Verkuil <hverkuil@kernel.org>
  *  Copyright (C) 2008  Andy Walls <awalls@md.metrocast.net>
  */
 
diff --git a/drivers/media/pci/cx18/cx18-cards.h b/drivers/media/pci/cx18/cx18-cards.h
index ae9cf5bfdd59..511123b741d5 100644
--- a/drivers/media/pci/cx18/cx18-cards.h
+++ b/drivers/media/pci/cx18/cx18-cards.h
@@ -4,7 +4,7 @@
  *
  *  Derived from ivtv-cards.c
  *
- *  Copyright (C) 2007  Hans Verkuil <hverkuil@xs4all.nl>
+ *  Copyright (C) 2007  Hans Verkuil <hverkuil@kernel.org>
  *  Copyright (C) 2008  Andy Walls <awalls@md.metrocast.net>
  */
 
diff --git a/drivers/media/pci/cx18/cx18-controls.c b/drivers/media/pci/cx18/cx18-controls.c
index bb5fc120473c..78eadad8b6e8 100644
--- a/drivers/media/pci/cx18/cx18-controls.c
+++ b/drivers/media/pci/cx18/cx18-controls.c
@@ -4,7 +4,7 @@
  *
  *  Derived from ivtv-controls.c
  *
- *  Copyright (C) 2007  Hans Verkuil <hverkuil@xs4all.nl>
+ *  Copyright (C) 2007  Hans Verkuil <hverkuil@kernel.org>
  */
 #include <linux/kernel.h>
 #include <linux/slab.h>
diff --git a/drivers/media/pci/cx18/cx18-controls.h b/drivers/media/pci/cx18/cx18-controls.h
index 458a3595a2ae..99de78878a76 100644
--- a/drivers/media/pci/cx18/cx18-controls.h
+++ b/drivers/media/pci/cx18/cx18-controls.h
@@ -4,7 +4,7 @@
  *
  *  Derived from ivtv-controls.h
  *
- *  Copyright (C) 2007  Hans Verkuil <hverkuil@xs4all.nl>
+ *  Copyright (C) 2007  Hans Verkuil <hverkuil@kernel.org>
 
  */
 
diff --git a/drivers/media/pci/cx18/cx18-driver.c b/drivers/media/pci/cx18/cx18-driver.c
index 743fcc961374..b62fd12c93c1 100644
--- a/drivers/media/pci/cx18/cx18-driver.c
+++ b/drivers/media/pci/cx18/cx18-driver.c
@@ -4,7 +4,7 @@
  *
  *  Derived from ivtv-driver.c
  *
- *  Copyright (C) 2007  Hans Verkuil <hverkuil@xs4all.nl>
+ *  Copyright (C) 2007  Hans Verkuil <hverkuil@kernel.org>
  *  Copyright (C) 2008  Andy Walls <awalls@md.metrocast.net>
  */
 
diff --git a/drivers/media/pci/cx18/cx18-driver.h b/drivers/media/pci/cx18/cx18-driver.h
index 485ca9747c4c..f732b41267e6 100644
--- a/drivers/media/pci/cx18/cx18-driver.h
+++ b/drivers/media/pci/cx18/cx18-driver.h
@@ -4,7 +4,7 @@
  *
  *  Derived from ivtv-driver.h
  *
- *  Copyright (C) 2007  Hans Verkuil <hverkuil@xs4all.nl>
+ *  Copyright (C) 2007  Hans Verkuil <hverkuil@kernel.org>
  *  Copyright (C) 2008  Andy Walls <awalls@md.metrocast.net>
  */
 
diff --git a/drivers/media/pci/cx18/cx18-fileops.c b/drivers/media/pci/cx18/cx18-fileops.c
index cefa91b37f89..63c87dd93951 100644
--- a/drivers/media/pci/cx18/cx18-fileops.c
+++ b/drivers/media/pci/cx18/cx18-fileops.c
@@ -4,7 +4,7 @@
  *
  *  Derived from ivtv-fileops.c
  *
- *  Copyright (C) 2007  Hans Verkuil <hverkuil@xs4all.nl>
+ *  Copyright (C) 2007  Hans Verkuil <hverkuil@kernel.org>
  *  Copyright (C) 2008  Andy Walls <awalls@md.metrocast.net>
  */
 
diff --git a/drivers/media/pci/cx18/cx18-fileops.h b/drivers/media/pci/cx18/cx18-fileops.h
index 943057b83d94..bc999ea85dc2 100644
--- a/drivers/media/pci/cx18/cx18-fileops.h
+++ b/drivers/media/pci/cx18/cx18-fileops.h
@@ -4,7 +4,7 @@
  *
  *  Derived from ivtv-fileops.h
  *
- *  Copyright (C) 2007  Hans Verkuil <hverkuil@xs4all.nl>
+ *  Copyright (C) 2007  Hans Verkuil <hverkuil@kernel.org>
  */
 
 /* Testing/Debugging */
diff --git a/drivers/media/pci/cx18/cx18-firmware.c b/drivers/media/pci/cx18/cx18-firmware.c
index 1b038b2802bf..94e17948fb30 100644
--- a/drivers/media/pci/cx18/cx18-firmware.c
+++ b/drivers/media/pci/cx18/cx18-firmware.c
@@ -2,7 +2,7 @@
 /*
  *  cx18 firmware functions
  *
- *  Copyright (C) 2007  Hans Verkuil <hverkuil@xs4all.nl>
+ *  Copyright (C) 2007  Hans Verkuil <hverkuil@kernel.org>
  *  Copyright (C) 2008  Andy Walls <awalls@md.metrocast.net>
  */
 
diff --git a/drivers/media/pci/cx18/cx18-firmware.h b/drivers/media/pci/cx18/cx18-firmware.h
index 1357f76d613e..8e63677284bd 100644
--- a/drivers/media/pci/cx18/cx18-firmware.h
+++ b/drivers/media/pci/cx18/cx18-firmware.h
@@ -2,7 +2,7 @@
 /*
  *  cx18 firmware functions
  *
- *  Copyright (C) 2007  Hans Verkuil <hverkuil@xs4all.nl>
+ *  Copyright (C) 2007  Hans Verkuil <hverkuil@kernel.org>
  */
 
 int cx18_firmware_init(struct cx18 *cx);
diff --git a/drivers/media/pci/cx18/cx18-gpio.c b/drivers/media/pci/cx18/cx18-gpio.c
index 485a6cbeb15a..4aea92639599 100644
--- a/drivers/media/pci/cx18/cx18-gpio.c
+++ b/drivers/media/pci/cx18/cx18-gpio.c
@@ -4,7 +4,7 @@
  *
  *  Derived from ivtv-gpio.c
  *
- *  Copyright (C) 2007  Hans Verkuil <hverkuil@xs4all.nl>
+ *  Copyright (C) 2007  Hans Verkuil <hverkuil@kernel.org>
  *  Copyright (C) 2008  Andy Walls <awalls@md.metrocast.net>
  */
 
diff --git a/drivers/media/pci/cx18/cx18-gpio.h b/drivers/media/pci/cx18/cx18-gpio.h
index 8d5797dea7f5..3eefc4644101 100644
--- a/drivers/media/pci/cx18/cx18-gpio.h
+++ b/drivers/media/pci/cx18/cx18-gpio.h
@@ -4,7 +4,7 @@
  *
  *  Derived from ivtv-gpio.h
  *
- *  Copyright (C) 2007  Hans Verkuil <hverkuil@xs4all.nl>
+ *  Copyright (C) 2007  Hans Verkuil <hverkuil@kernel.org>
  *  Copyright (C) 2008  Andy Walls <awalls@md.metrocast.net>
  */
 
diff --git a/drivers/media/pci/cx18/cx18-i2c.c b/drivers/media/pci/cx18/cx18-i2c.c
index a83435245251..a1abb0631cae 100644
--- a/drivers/media/pci/cx18/cx18-i2c.c
+++ b/drivers/media/pci/cx18/cx18-i2c.c
@@ -4,7 +4,7 @@
  *
  *  Derived from ivtv-i2c.c
  *
- *  Copyright (C) 2007  Hans Verkuil <hverkuil@xs4all.nl>
+ *  Copyright (C) 2007  Hans Verkuil <hverkuil@kernel.org>
  *  Copyright (C) 2008  Andy Walls <awalls@md.metrocast.net>
  */
 
diff --git a/drivers/media/pci/cx18/cx18-i2c.h b/drivers/media/pci/cx18/cx18-i2c.h
index 4526cb324fec..8ae3125c78c0 100644
--- a/drivers/media/pci/cx18/cx18-i2c.h
+++ b/drivers/media/pci/cx18/cx18-i2c.h
@@ -4,7 +4,7 @@
  *
  *  Derived from ivtv-i2c.h
  *
- *  Copyright (C) 2007  Hans Verkuil <hverkuil@xs4all.nl>
+ *  Copyright (C) 2007  Hans Verkuil <hverkuil@kernel.org>
  */
 
 int cx18_i2c_register(struct cx18 *cx, unsigned idx);
diff --git a/drivers/media/pci/cx18/cx18-io.c b/drivers/media/pci/cx18/cx18-io.c
index 50e4e8a598d4..1d3d006e6329 100644
--- a/drivers/media/pci/cx18/cx18-io.c
+++ b/drivers/media/pci/cx18/cx18-io.c
@@ -2,7 +2,7 @@
 /*
  *  cx18 driver PCI memory mapped IO access routines
  *
- *  Copyright (C) 2007  Hans Verkuil <hverkuil@xs4all.nl>
+ *  Copyright (C) 2007  Hans Verkuil <hverkuil@kernel.org>
  *  Copyright (C) 2008  Andy Walls <awalls@md.metrocast.net>
  */
 
diff --git a/drivers/media/pci/cx18/cx18-io.h b/drivers/media/pci/cx18/cx18-io.h
index 190b142d047e..1f0bfad7d0f0 100644
--- a/drivers/media/pci/cx18/cx18-io.h
+++ b/drivers/media/pci/cx18/cx18-io.h
@@ -2,7 +2,7 @@
 /*
  *  cx18 driver PCI memory mapped IO access routines
  *
- *  Copyright (C) 2007  Hans Verkuil <hverkuil@xs4all.nl>
+ *  Copyright (C) 2007  Hans Verkuil <hverkuil@kernel.org>
  *  Copyright (C) 2008  Andy Walls <awalls@md.metrocast.net>
  */
 
diff --git a/drivers/media/pci/cx18/cx18-ioctl.c b/drivers/media/pci/cx18/cx18-ioctl.c
index 9a1512b1ccaa..d2c72af31921 100644
--- a/drivers/media/pci/cx18/cx18-ioctl.c
+++ b/drivers/media/pci/cx18/cx18-ioctl.c
@@ -4,7 +4,7 @@
  *
  *  Derived from ivtv-ioctl.c
  *
- *  Copyright (C) 2007  Hans Verkuil <hverkuil@xs4all.nl>
+ *  Copyright (C) 2007  Hans Verkuil <hverkuil@kernel.org>
  *  Copyright (C) 2008  Andy Walls <awalls@md.metrocast.net>
  */
 
diff --git a/drivers/media/pci/cx18/cx18-ioctl.h b/drivers/media/pci/cx18/cx18-ioctl.h
index 221e2400fb3e..97cd9f99e22d 100644
--- a/drivers/media/pci/cx18/cx18-ioctl.h
+++ b/drivers/media/pci/cx18/cx18-ioctl.h
@@ -4,7 +4,7 @@
  *
  *  Derived from ivtv-ioctl.h
  *
- *  Copyright (C) 2007  Hans Verkuil <hverkuil@xs4all.nl>
+ *  Copyright (C) 2007  Hans Verkuil <hverkuil@kernel.org>
  *  Copyright (C) 2008  Andy Walls <awalls@md.metrocast.net>
  */
 
diff --git a/drivers/media/pci/cx18/cx18-irq.c b/drivers/media/pci/cx18/cx18-irq.c
index db63077821b1..0ef01e98255d 100644
--- a/drivers/media/pci/cx18/cx18-irq.c
+++ b/drivers/media/pci/cx18/cx18-irq.c
@@ -2,7 +2,7 @@
 /*
  *  cx18 interrupt handling
  *
- *  Copyright (C) 2007  Hans Verkuil <hverkuil@xs4all.nl>
+ *  Copyright (C) 2007  Hans Verkuil <hverkuil@kernel.org>
  *  Copyright (C) 2008  Andy Walls <awalls@md.metrocast.net>
  */
 
diff --git a/drivers/media/pci/cx18/cx18-irq.h b/drivers/media/pci/cx18/cx18-irq.h
index fdb585a72827..c1456d69dffa 100644
--- a/drivers/media/pci/cx18/cx18-irq.h
+++ b/drivers/media/pci/cx18/cx18-irq.h
@@ -2,7 +2,7 @@
 /*
  *  cx18 interrupt handling
  *
- *  Copyright (C) 2007  Hans Verkuil <hverkuil@xs4all.nl>
+ *  Copyright (C) 2007  Hans Verkuil <hverkuil@kernel.org>
  *  Copyright (C) 2008  Andy Walls <awalls@md.metrocast.net>
  */
 
diff --git a/drivers/media/pci/cx18/cx18-mailbox.c b/drivers/media/pci/cx18/cx18-mailbox.c
index a6457c23d18c..8c70b638a40c 100644
--- a/drivers/media/pci/cx18/cx18-mailbox.c
+++ b/drivers/media/pci/cx18/cx18-mailbox.c
@@ -2,7 +2,7 @@
 /*
  *  cx18 mailbox functions
  *
- *  Copyright (C) 2007  Hans Verkuil <hverkuil@xs4all.nl>
+ *  Copyright (C) 2007  Hans Verkuil <hverkuil@kernel.org>
  *  Copyright (C) 2008  Andy Walls <awalls@md.metrocast.net>
  */
 
diff --git a/drivers/media/pci/cx18/cx18-mailbox.h b/drivers/media/pci/cx18/cx18-mailbox.h
index 971382ac0eca..1752b8e1ca13 100644
--- a/drivers/media/pci/cx18/cx18-mailbox.h
+++ b/drivers/media/pci/cx18/cx18-mailbox.h
@@ -2,7 +2,7 @@
 /*
  *  cx18 mailbox functions
  *
- *  Copyright (C) 2007  Hans Verkuil <hverkuil@xs4all.nl>
+ *  Copyright (C) 2007  Hans Verkuil <hverkuil@kernel.org>
  *  Copyright (C) 2008  Andy Walls <awalls@md.metrocast.net>
  */
 
diff --git a/drivers/media/pci/cx18/cx18-queue.c b/drivers/media/pci/cx18/cx18-queue.c
index 013694bfcb1c..1ef3cf49aa41 100644
--- a/drivers/media/pci/cx18/cx18-queue.c
+++ b/drivers/media/pci/cx18/cx18-queue.c
@@ -4,7 +4,7 @@
  *
  *  Derived from ivtv-queue.c
  *
- *  Copyright (C) 2007  Hans Verkuil <hverkuil@xs4all.nl>
+ *  Copyright (C) 2007  Hans Verkuil <hverkuil@kernel.org>
  *  Copyright (C) 2008  Andy Walls <awalls@md.metrocast.net>
  */
 
diff --git a/drivers/media/pci/cx18/cx18-queue.h b/drivers/media/pci/cx18/cx18-queue.h
index 26f2097c0496..972f234ffead 100644
--- a/drivers/media/pci/cx18/cx18-queue.h
+++ b/drivers/media/pci/cx18/cx18-queue.h
@@ -4,7 +4,7 @@
  *
  *  Derived from ivtv-queue.h
  *
- *  Copyright (C) 2007  Hans Verkuil <hverkuil@xs4all.nl>
+ *  Copyright (C) 2007  Hans Verkuil <hverkuil@kernel.org>
  *  Copyright (C) 2008  Andy Walls <awalls@md.metrocast.net>
  */
 
diff --git a/drivers/media/pci/cx18/cx18-scb.c b/drivers/media/pci/cx18/cx18-scb.c
index 4a0edc1e42e7..670dd9b0a332 100644
--- a/drivers/media/pci/cx18/cx18-scb.c
+++ b/drivers/media/pci/cx18/cx18-scb.c
@@ -2,7 +2,7 @@
 /*
  *  cx18 System Control Block initialization
  *
- *  Copyright (C) 2007  Hans Verkuil <hverkuil@xs4all.nl>
+ *  Copyright (C) 2007  Hans Verkuil <hverkuil@kernel.org>
  *  Copyright (C) 2008  Andy Walls <awalls@md.metrocast.net>
  */
 
diff --git a/drivers/media/pci/cx18/cx18-scb.h b/drivers/media/pci/cx18/cx18-scb.h
index 841edc0712ab..900f7291979f 100644
--- a/drivers/media/pci/cx18/cx18-scb.h
+++ b/drivers/media/pci/cx18/cx18-scb.h
@@ -2,7 +2,7 @@
 /*
  *  cx18 System Control Block initialization
  *
- *  Copyright (C) 2007  Hans Verkuil <hverkuil@xs4all.nl>
+ *  Copyright (C) 2007  Hans Verkuil <hverkuil@kernel.org>
  *  Copyright (C) 2008  Andy Walls <awalls@md.metrocast.net>
  */
 
diff --git a/drivers/media/pci/cx18/cx18-streams.c b/drivers/media/pci/cx18/cx18-streams.c
index 42d6f7b90ede..48203ba16387 100644
--- a/drivers/media/pci/cx18/cx18-streams.c
+++ b/drivers/media/pci/cx18/cx18-streams.c
@@ -4,7 +4,7 @@
  *
  *  Derived from ivtv-streams.c
  *
- *  Copyright (C) 2007  Hans Verkuil <hverkuil@xs4all.nl>
+ *  Copyright (C) 2007  Hans Verkuil <hverkuil@kernel.org>
  *  Copyright (C) 2008  Andy Walls <awalls@md.metrocast.net>
  */
 
diff --git a/drivers/media/pci/cx18/cx18-streams.h b/drivers/media/pci/cx18/cx18-streams.h
index bba4349c5c2e..e01bed6b4827 100644
--- a/drivers/media/pci/cx18/cx18-streams.h
+++ b/drivers/media/pci/cx18/cx18-streams.h
@@ -4,7 +4,7 @@
  *
  *  Derived from ivtv-streams.h
  *
- *  Copyright (C) 2007  Hans Verkuil <hverkuil@xs4all.nl>
+ *  Copyright (C) 2007  Hans Verkuil <hverkuil@kernel.org>
  *  Copyright (C) 2008  Andy Walls <awalls@md.metrocast.net>
  */
 
diff --git a/drivers/media/pci/cx18/cx18-vbi.c b/drivers/media/pci/cx18/cx18-vbi.c
index c7cce38dd754..8dc4ce325935 100644
--- a/drivers/media/pci/cx18/cx18-vbi.c
+++ b/drivers/media/pci/cx18/cx18-vbi.c
@@ -4,7 +4,7 @@
  *
  *  Derived from ivtv-vbi.c
  *
- *  Copyright (C) 2007  Hans Verkuil <hverkuil@xs4all.nl>
+ *  Copyright (C) 2007  Hans Verkuil <hverkuil@kernel.org>
  */
 
 #include "cx18-driver.h"
diff --git a/drivers/media/pci/cx18/cx18-vbi.h b/drivers/media/pci/cx18/cx18-vbi.h
index a5f81c6159f0..41f5026696c4 100644
--- a/drivers/media/pci/cx18/cx18-vbi.h
+++ b/drivers/media/pci/cx18/cx18-vbi.h
@@ -4,7 +4,7 @@
  *
  *  Derived from ivtv-vbi.h
  *
- *  Copyright (C) 2007  Hans Verkuil <hverkuil@xs4all.nl>
+ *  Copyright (C) 2007  Hans Verkuil <hverkuil@kernel.org>
  */
 
 void cx18_process_vbi_data(struct cx18 *cx, struct cx18_mdl *mdl,
diff --git a/drivers/media/pci/cx18/cx18-version.h b/drivers/media/pci/cx18/cx18-version.h
index e7396182fc5a..e8636ac5d5a5 100644
--- a/drivers/media/pci/cx18/cx18-version.h
+++ b/drivers/media/pci/cx18/cx18-version.h
@@ -2,7 +2,7 @@
 /*
  *  cx18 driver version information
  *
- *  Copyright (C) 2007  Hans Verkuil <hverkuil@xs4all.nl>
+ *  Copyright (C) 2007  Hans Verkuil <hverkuil@kernel.org>
  */
 
 #ifndef CX18_VERSION_H
diff --git a/drivers/media/pci/cx18/cx18-video.c b/drivers/media/pci/cx18/cx18-video.c
index 2fde8c2d3fdc..86cd44053d34 100644
--- a/drivers/media/pci/cx18/cx18-video.c
+++ b/drivers/media/pci/cx18/cx18-video.c
@@ -2,7 +2,7 @@
 /*
  *  cx18 video interface functions
  *
- *  Copyright (C) 2007  Hans Verkuil <hverkuil@xs4all.nl>
+ *  Copyright (C) 2007  Hans Verkuil <hverkuil@kernel.org>
  */
 
 #include "cx18-driver.h"
diff --git a/drivers/media/pci/cx18/cx18-video.h b/drivers/media/pci/cx18/cx18-video.h
index f613975ca5f0..ef212f1c5b17 100644
--- a/drivers/media/pci/cx18/cx18-video.h
+++ b/drivers/media/pci/cx18/cx18-video.h
@@ -2,7 +2,7 @@
 /*
  *  cx18 video interface functions
  *
- *  Copyright (C) 2007  Hans Verkuil <hverkuil@xs4all.nl>
+ *  Copyright (C) 2007  Hans Verkuil <hverkuil@kernel.org>
  */
 
 void cx18_video_set_io(struct cx18 *cx);
diff --git a/drivers/media/pci/cx18/cx23418.h b/drivers/media/pci/cx18/cx23418.h
index 8859c0e8557f..22486f39bcda 100644
--- a/drivers/media/pci/cx18/cx23418.h
+++ b/drivers/media/pci/cx18/cx23418.h
@@ -2,7 +2,7 @@
 /*
  *  cx18 header containing common defines.
  *
- *  Copyright (C) 2007  Hans Verkuil <hverkuil@xs4all.nl>
+ *  Copyright (C) 2007  Hans Verkuil <hverkuil@kernel.org>
  */
 
 #ifndef CX23418_H
diff --git a/drivers/media/pci/ivtv/ivtv-cards.c b/drivers/media/pci/ivtv/ivtv-cards.c
index c8f4ed7ff2c6..f2ccf8e98664 100644
--- a/drivers/media/pci/ivtv/ivtv-cards.c
+++ b/drivers/media/pci/ivtv/ivtv-cards.c
@@ -2,7 +2,7 @@
 /*
     Functions to query card hardware
     Copyright (C) 2003-2004  Kevin Thayer <nufan_wfk at yahoo.com>
-    Copyright (C) 2005-2007  Hans Verkuil <hverkuil@xs4all.nl>
+    Copyright (C) 2005-2007  Hans Verkuil <hverkuil@kernel.org>
 
  */
 
diff --git a/drivers/media/pci/ivtv/ivtv-cards.h b/drivers/media/pci/ivtv/ivtv-cards.h
index c252733df340..af64e55d3b80 100644
--- a/drivers/media/pci/ivtv/ivtv-cards.h
+++ b/drivers/media/pci/ivtv/ivtv-cards.h
@@ -2,7 +2,7 @@
 /*
     Functions to query card hardware
     Copyright (C) 2003-2004  Kevin Thayer <nufan_wfk at yahoo.com>
-    Copyright (C) 2005-2007  Hans Verkuil <hverkuil@xs4all.nl>
+    Copyright (C) 2005-2007  Hans Verkuil <hverkuil@kernel.org>
 
  */
 
diff --git a/drivers/media/pci/ivtv/ivtv-controls.c b/drivers/media/pci/ivtv/ivtv-controls.c
index a0b9a5a5c7f1..f087a12c4ebd 100644
--- a/drivers/media/pci/ivtv/ivtv-controls.c
+++ b/drivers/media/pci/ivtv/ivtv-controls.c
@@ -2,7 +2,7 @@
 /*
     ioctl control functions
     Copyright (C) 2003-2004  Kevin Thayer <nufan_wfk at yahoo.com>
-    Copyright (C) 2005-2007  Hans Verkuil <hverkuil@xs4all.nl>
+    Copyright (C) 2005-2007  Hans Verkuil <hverkuil@kernel.org>
 
  */
 
diff --git a/drivers/media/pci/ivtv/ivtv-controls.h b/drivers/media/pci/ivtv/ivtv-controls.h
index 444c86a47e5a..d152691ea255 100644
--- a/drivers/media/pci/ivtv/ivtv-controls.h
+++ b/drivers/media/pci/ivtv/ivtv-controls.h
@@ -2,7 +2,7 @@
 /*
     ioctl control functions
     Copyright (C) 2003-2004  Kevin Thayer <nufan_wfk at yahoo.com>
-    Copyright (C) 2005-2007  Hans Verkuil <hverkuil@xs4all.nl>
+    Copyright (C) 2005-2007  Hans Verkuil <hverkuil@kernel.org>
 
  */
 
diff --git a/drivers/media/pci/ivtv/ivtv-driver.c b/drivers/media/pci/ivtv/ivtv-driver.c
index ecc20cd89926..6f81a1b3059d 100644
--- a/drivers/media/pci/ivtv/ivtv-driver.c
+++ b/drivers/media/pci/ivtv/ivtv-driver.c
@@ -2,7 +2,7 @@
     ivtv driver initialization and card probing
     Copyright (C) 2003-2004  Kevin Thayer <nufan_wfk at yahoo.com>
     Copyright (C) 2004  Chris Kennedy <c@groovy.org>
-    Copyright (C) 2005-2007  Hans Verkuil <hverkuil@xs4all.nl>
+    Copyright (C) 2005-2007  Hans Verkuil <hverkuil@kernel.org>
 
     This program is free software; you can redistribute it and/or modify
     it under the terms of the GNU General Public License as published by
diff --git a/drivers/media/pci/ivtv/ivtv-driver.h b/drivers/media/pci/ivtv/ivtv-driver.h
index a6ffa99e16bc..a1147d5dd49d 100644
--- a/drivers/media/pci/ivtv/ivtv-driver.h
+++ b/drivers/media/pci/ivtv/ivtv-driver.h
@@ -2,7 +2,7 @@
     ivtv driver internal defines and structures
     Copyright (C) 2003-2004  Kevin Thayer <nufan_wfk at yahoo.com>
     Copyright (C) 2004  Chris Kennedy <c@groovy.org>
-    Copyright (C) 2005-2007  Hans Verkuil <hverkuil@xs4all.nl>
+    Copyright (C) 2005-2007  Hans Verkuil <hverkuil@kernel.org>
 
     This program is free software; you can redistribute it and/or modify
     it under the terms of the GNU General Public License as published by
diff --git a/drivers/media/pci/ivtv/ivtv-fileops.c b/drivers/media/pci/ivtv/ivtv-fileops.c
index cfa28d035586..40166f8a7a37 100644
--- a/drivers/media/pci/ivtv/ivtv-fileops.c
+++ b/drivers/media/pci/ivtv/ivtv-fileops.c
@@ -3,7 +3,7 @@
     file operation functions
     Copyright (C) 2003-2004  Kevin Thayer <nufan_wfk at yahoo.com>
     Copyright (C) 2004  Chris Kennedy <c@groovy.org>
-    Copyright (C) 2005-2007  Hans Verkuil <hverkuil@xs4all.nl>
+    Copyright (C) 2005-2007  Hans Verkuil <hverkuil@kernel.org>
 
  */
 
diff --git a/drivers/media/pci/ivtv/ivtv-fileops.h b/drivers/media/pci/ivtv/ivtv-fileops.h
index c2c01bba5d03..7bbe42b0030c 100644
--- a/drivers/media/pci/ivtv/ivtv-fileops.h
+++ b/drivers/media/pci/ivtv/ivtv-fileops.h
@@ -2,7 +2,7 @@
 /*
     file operation functions
     Copyright (C) 2003-2004  Kevin Thayer <nufan_wfk at yahoo.com>
-    Copyright (C) 2005-2007  Hans Verkuil <hverkuil@xs4all.nl>
+    Copyright (C) 2005-2007  Hans Verkuil <hverkuil@kernel.org>
 
  */
 
diff --git a/drivers/media/pci/ivtv/ivtv-firmware.c b/drivers/media/pci/ivtv/ivtv-firmware.c
index 56b25255faf5..1bc873ebef73 100644
--- a/drivers/media/pci/ivtv/ivtv-firmware.c
+++ b/drivers/media/pci/ivtv/ivtv-firmware.c
@@ -3,7 +3,7 @@
     ivtv firmware functions.
     Copyright (C) 2003-2004  Kevin Thayer <nufan_wfk at yahoo.com>
     Copyright (C) 2004  Chris Kennedy <c@groovy.org>
-    Copyright (C) 2005-2007  Hans Verkuil <hverkuil@xs4all.nl>
+    Copyright (C) 2005-2007  Hans Verkuil <hverkuil@kernel.org>
 
  */
 
diff --git a/drivers/media/pci/ivtv/ivtv-firmware.h b/drivers/media/pci/ivtv/ivtv-firmware.h
index 393e94a8d0e4..ce94b6c385de 100644
--- a/drivers/media/pci/ivtv/ivtv-firmware.h
+++ b/drivers/media/pci/ivtv/ivtv-firmware.h
@@ -3,7 +3,7 @@
     ivtv firmware functions.
     Copyright (C) 2003-2004  Kevin Thayer <nufan_wfk at yahoo.com>
     Copyright (C) 2004  Chris Kennedy <c@groovy.org>
-    Copyright (C) 2005-2007  Hans Verkuil <hverkuil@xs4all.nl>
+    Copyright (C) 2005-2007  Hans Verkuil <hverkuil@kernel.org>
 
  */
 
diff --git a/drivers/media/pci/ivtv/ivtv-gpio.c b/drivers/media/pci/ivtv/ivtv-gpio.c
index 6434c0d03a6d..d3477e1529c9 100644
--- a/drivers/media/pci/ivtv/ivtv-gpio.c
+++ b/drivers/media/pci/ivtv/ivtv-gpio.c
@@ -3,7 +3,7 @@
     gpio functions.
     Merging GPIO support into driver:
     Copyright (C) 2004  Chris Kennedy <c@groovy.org>
-    Copyright (C) 2005-2007  Hans Verkuil <hverkuil@xs4all.nl>
+    Copyright (C) 2005-2007  Hans Verkuil <hverkuil@kernel.org>
 
  */
 
diff --git a/drivers/media/pci/ivtv/ivtv-gpio.h b/drivers/media/pci/ivtv/ivtv-gpio.h
index 4ad817173f04..686c9b5e9c19 100644
--- a/drivers/media/pci/ivtv/ivtv-gpio.h
+++ b/drivers/media/pci/ivtv/ivtv-gpio.h
@@ -2,7 +2,7 @@
 /*
     gpio functions.
     Copyright (C) 2004  Chris Kennedy <c@groovy.org>
-    Copyright (C) 2005-2007  Hans Verkuil <hverkuil@xs4all.nl>
+    Copyright (C) 2005-2007  Hans Verkuil <hverkuil@kernel.org>
 
  */
 
diff --git a/drivers/media/pci/ivtv/ivtv-i2c.c b/drivers/media/pci/ivtv/ivtv-i2c.c
index c052c57c6dce..28cb22d6a892 100644
--- a/drivers/media/pci/ivtv/ivtv-i2c.c
+++ b/drivers/media/pci/ivtv/ivtv-i2c.c
@@ -2,7 +2,7 @@
 /*
     I2C functions
     Copyright (C) 2003-2004  Kevin Thayer <nufan_wfk at yahoo.com>
-    Copyright (C) 2005-2007  Hans Verkuil <hverkuil@xs4all.nl>
+    Copyright (C) 2005-2007  Hans Verkuil <hverkuil@kernel.org>
 
  */
 
diff --git a/drivers/media/pci/ivtv/ivtv-i2c.h b/drivers/media/pci/ivtv/ivtv-i2c.h
index 2d9cdaa682c5..504bbc1dee25 100644
--- a/drivers/media/pci/ivtv/ivtv-i2c.h
+++ b/drivers/media/pci/ivtv/ivtv-i2c.h
@@ -2,7 +2,7 @@
 /*
     I2C functions
     Copyright (C) 2003-2004  Kevin Thayer <nufan_wfk at yahoo.com>
-    Copyright (C) 2005-2007  Hans Verkuil <hverkuil@xs4all.nl>
+    Copyright (C) 2005-2007  Hans Verkuil <hverkuil@kernel.org>
 
  */
 
diff --git a/drivers/media/pci/ivtv/ivtv-ioctl.c b/drivers/media/pci/ivtv/ivtv-ioctl.c
index 7947dcd615e8..5893e518b92f 100644
--- a/drivers/media/pci/ivtv/ivtv-ioctl.c
+++ b/drivers/media/pci/ivtv/ivtv-ioctl.c
@@ -2,7 +2,7 @@
 /*
     ioctl system call
     Copyright (C) 2003-2004  Kevin Thayer <nufan_wfk at yahoo.com>
-    Copyright (C) 2005-2007  Hans Verkuil <hverkuil@xs4all.nl>
+    Copyright (C) 2005-2007  Hans Verkuil <hverkuil@kernel.org>
 
  */
 
diff --git a/drivers/media/pci/ivtv/ivtv-ioctl.h b/drivers/media/pci/ivtv/ivtv-ioctl.h
index 42c2516379fc..7f8c6f43d397 100644
--- a/drivers/media/pci/ivtv/ivtv-ioctl.h
+++ b/drivers/media/pci/ivtv/ivtv-ioctl.h
@@ -2,7 +2,7 @@
 /*
     ioctl system call
     Copyright (C) 2003-2004  Kevin Thayer <nufan_wfk at yahoo.com>
-    Copyright (C) 2005-2007  Hans Verkuil <hverkuil@xs4all.nl>
+    Copyright (C) 2005-2007  Hans Verkuil <hverkuil@kernel.org>
 
  */
 
diff --git a/drivers/media/pci/ivtv/ivtv-irq.c b/drivers/media/pci/ivtv/ivtv-irq.c
index 748c14e87963..95fcd16a03d4 100644
--- a/drivers/media/pci/ivtv/ivtv-irq.c
+++ b/drivers/media/pci/ivtv/ivtv-irq.c
@@ -2,7 +2,7 @@
 /* interrupt handling
     Copyright (C) 2003-2004  Kevin Thayer <nufan_wfk at yahoo.com>
     Copyright (C) 2004  Chris Kennedy <c@groovy.org>
-    Copyright (C) 2005-2007  Hans Verkuil <hverkuil@xs4all.nl>
+    Copyright (C) 2005-2007  Hans Verkuil <hverkuil@kernel.org>
 
  */
 
diff --git a/drivers/media/pci/ivtv/ivtv-irq.h b/drivers/media/pci/ivtv/ivtv-irq.h
index b8b0703a1c82..8a780bea7de4 100644
--- a/drivers/media/pci/ivtv/ivtv-irq.h
+++ b/drivers/media/pci/ivtv/ivtv-irq.h
@@ -3,7 +3,7 @@
     interrupt handling
     Copyright (C) 2003-2004  Kevin Thayer <nufan_wfk at yahoo.com>
     Copyright (C) 2004  Chris Kennedy <c@groovy.org>
-    Copyright (C) 2005-2007  Hans Verkuil <hverkuil@xs4all.nl>
+    Copyright (C) 2005-2007  Hans Verkuil <hverkuil@kernel.org>
 
  */
 
diff --git a/drivers/media/pci/ivtv/ivtv-mailbox.c b/drivers/media/pci/ivtv/ivtv-mailbox.c
index d3fdaaa903f1..cd7c9f2d473f 100644
--- a/drivers/media/pci/ivtv/ivtv-mailbox.c
+++ b/drivers/media/pci/ivtv/ivtv-mailbox.c
@@ -3,7 +3,7 @@
     mailbox functions
     Copyright (C) 2003-2004  Kevin Thayer <nufan_wfk at yahoo.com>
     Copyright (C) 2004  Chris Kennedy <c@groovy.org>
-    Copyright (C) 2005-2007  Hans Verkuil <hverkuil@xs4all.nl>
+    Copyright (C) 2005-2007  Hans Verkuil <hverkuil@kernel.org>
 
  */
 
diff --git a/drivers/media/pci/ivtv/ivtv-mailbox.h b/drivers/media/pci/ivtv/ivtv-mailbox.h
index 537c90437e1d..364e7f51508e 100644
--- a/drivers/media/pci/ivtv/ivtv-mailbox.h
+++ b/drivers/media/pci/ivtv/ivtv-mailbox.h
@@ -2,7 +2,7 @@
 /*
     mailbox functions
     Copyright (C) 2003-2004  Kevin Thayer <nufan_wfk at yahoo.com>
-    Copyright (C) 2005-2007  Hans Verkuil <hverkuil@xs4all.nl>
+    Copyright (C) 2005-2007  Hans Verkuil <hverkuil@kernel.org>
 
  */
 
diff --git a/drivers/media/pci/ivtv/ivtv-queue.c b/drivers/media/pci/ivtv/ivtv-queue.c
index f9b192ab7e7c..f7d2d159d800 100644
--- a/drivers/media/pci/ivtv/ivtv-queue.c
+++ b/drivers/media/pci/ivtv/ivtv-queue.c
@@ -3,7 +3,7 @@
     buffer queues.
     Copyright (C) 2003-2004  Kevin Thayer <nufan_wfk at yahoo.com>
     Copyright (C) 2004  Chris Kennedy <c@groovy.org>
-    Copyright (C) 2005-2007  Hans Verkuil <hverkuil@xs4all.nl>
+    Copyright (C) 2005-2007  Hans Verkuil <hverkuil@kernel.org>
 
  */
 
diff --git a/drivers/media/pci/ivtv/ivtv-queue.h b/drivers/media/pci/ivtv/ivtv-queue.h
index 983e99642364..9619745d6de1 100644
--- a/drivers/media/pci/ivtv/ivtv-queue.h
+++ b/drivers/media/pci/ivtv/ivtv-queue.h
@@ -3,7 +3,7 @@
     buffer queues.
     Copyright (C) 2003-2004  Kevin Thayer <nufan_wfk at yahoo.com>
     Copyright (C) 2004  Chris Kennedy <c@groovy.org>
-    Copyright (C) 2005-2007  Hans Verkuil <hverkuil@xs4all.nl>
+    Copyright (C) 2005-2007  Hans Verkuil <hverkuil@kernel.org>
 
  */
 
diff --git a/drivers/media/pci/ivtv/ivtv-routing.c b/drivers/media/pci/ivtv/ivtv-routing.c
index 57d4d5a3cb87..b1dfc2e96d91 100644
--- a/drivers/media/pci/ivtv/ivtv-routing.c
+++ b/drivers/media/pci/ivtv/ivtv-routing.c
@@ -2,7 +2,7 @@
 /*
     Audio/video-routing-related ivtv functions.
     Copyright (C) 2003-2004  Kevin Thayer <nufan_wfk at yahoo.com>
-    Copyright (C) 2005-2007  Hans Verkuil <hverkuil@xs4all.nl>
+    Copyright (C) 2005-2007  Hans Verkuil <hverkuil@kernel.org>
 
  */
 
diff --git a/drivers/media/pci/ivtv/ivtv-routing.h b/drivers/media/pci/ivtv/ivtv-routing.h
index e4a0ae0694d2..69ddb66ef26f 100644
--- a/drivers/media/pci/ivtv/ivtv-routing.h
+++ b/drivers/media/pci/ivtv/ivtv-routing.h
@@ -2,7 +2,7 @@
 /*
     Audio/video-routing-related ivtv functions.
     Copyright (C) 2003-2004  Kevin Thayer <nufan_wfk at yahoo.com>
-    Copyright (C) 2005-2007  Hans Verkuil <hverkuil@xs4all.nl>
+    Copyright (C) 2005-2007  Hans Verkuil <hverkuil@kernel.org>
 
  */
 
diff --git a/drivers/media/pci/ivtv/ivtv-streams.c b/drivers/media/pci/ivtv/ivtv-streams.c
index ac085925d3cb..165ae403b579 100644
--- a/drivers/media/pci/ivtv/ivtv-streams.c
+++ b/drivers/media/pci/ivtv/ivtv-streams.c
@@ -2,7 +2,7 @@
     init/start/stop/exit stream functions
     Copyright (C) 2003-2004  Kevin Thayer <nufan_wfk at yahoo.com>
     Copyright (C) 2004  Chris Kennedy <c@groovy.org>
-    Copyright (C) 2005-2007  Hans Verkuil <hverkuil@xs4all.nl>
+    Copyright (C) 2005-2007  Hans Verkuil <hverkuil@kernel.org>
 
     This program is free software; you can redistribute it and/or modify
     it under the terms of the GNU General Public License as published by
diff --git a/drivers/media/pci/ivtv/ivtv-streams.h b/drivers/media/pci/ivtv/ivtv-streams.h
index 5f35c57fcdfd..43d4ecd6dd6f 100644
--- a/drivers/media/pci/ivtv/ivtv-streams.h
+++ b/drivers/media/pci/ivtv/ivtv-streams.h
@@ -2,7 +2,7 @@
 /*
     init/start/stop/exit stream functions
     Copyright (C) 2003-2004  Kevin Thayer <nufan_wfk at yahoo.com>
-    Copyright (C) 2005-2007  Hans Verkuil <hverkuil@xs4all.nl>
+    Copyright (C) 2005-2007  Hans Verkuil <hverkuil@kernel.org>
 
  */
 
diff --git a/drivers/media/pci/ivtv/ivtv-udma.c b/drivers/media/pci/ivtv/ivtv-udma.c
index f467a00492f4..7dedf04f9f87 100644
--- a/drivers/media/pci/ivtv/ivtv-udma.c
+++ b/drivers/media/pci/ivtv/ivtv-udma.c
@@ -4,7 +4,7 @@
 
     Copyright (C) 2003-2004  Kevin Thayer <nufan_wfk at yahoo.com>
     Copyright (C) 2004  Chris Kennedy <c@groovy.org>
-    Copyright (C) 2005-2007  Hans Verkuil <hverkuil@xs4all.nl>
+    Copyright (C) 2005-2007  Hans Verkuil <hverkuil@kernel.org>
 
  */
 
diff --git a/drivers/media/pci/ivtv/ivtv-udma.h b/drivers/media/pci/ivtv/ivtv-udma.h
index 12b9426b2db2..3030fadfdbc7 100644
--- a/drivers/media/pci/ivtv/ivtv-udma.h
+++ b/drivers/media/pci/ivtv/ivtv-udma.h
@@ -2,7 +2,7 @@
 /*
     Copyright (C) 2003-2004  Kevin Thayer <nufan_wfk at yahoo.com>
     Copyright (C) 2004  Chris Kennedy <c@groovy.org>
-    Copyright (C) 2006-2007  Hans Verkuil <hverkuil@xs4all.nl>
+    Copyright (C) 2006-2007  Hans Verkuil <hverkuil@kernel.org>
 
  */
 
diff --git a/drivers/media/pci/ivtv/ivtv-vbi.c b/drivers/media/pci/ivtv/ivtv-vbi.c
index 80478b026d75..ae7a00f46257 100644
--- a/drivers/media/pci/ivtv/ivtv-vbi.c
+++ b/drivers/media/pci/ivtv/ivtv-vbi.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
     Vertical Blank Interval support functions
-    Copyright (C) 2004-2007  Hans Verkuil <hverkuil@xs4all.nl>
+    Copyright (C) 2004-2007  Hans Verkuil <hverkuil@kernel.org>
 
  */
 
diff --git a/drivers/media/pci/ivtv/ivtv-vbi.h b/drivers/media/pci/ivtv/ivtv-vbi.h
index 780f73d2ab6b..12fe27da544b 100644
--- a/drivers/media/pci/ivtv/ivtv-vbi.h
+++ b/drivers/media/pci/ivtv/ivtv-vbi.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
     Vertical Blank Interval support functions
-    Copyright (C) 2004-2007  Hans Verkuil <hverkuil@xs4all.nl>
+    Copyright (C) 2004-2007  Hans Verkuil <hverkuil@kernel.org>
 
  */
 
diff --git a/drivers/media/pci/ivtv/ivtv-version.h b/drivers/media/pci/ivtv/ivtv-version.h
index 996f1871e49c..21e26d1f66b8 100644
--- a/drivers/media/pci/ivtv/ivtv-version.h
+++ b/drivers/media/pci/ivtv/ivtv-version.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
     ivtv driver version information
-    Copyright (C) 2005-2007  Hans Verkuil <hverkuil@xs4all.nl>
+    Copyright (C) 2005-2007  Hans Verkuil <hverkuil@kernel.org>
 
  */
 
diff --git a/drivers/media/pci/tw68/tw68-core.c b/drivers/media/pci/tw68/tw68-core.c
index 35dd19b2427e..08b7ce1043aa 100644
--- a/drivers/media/pci/tw68/tw68-core.c
+++ b/drivers/media/pci/tw68/tw68-core.c
@@ -14,7 +14,7 @@
  *
  *  Refactored and updated to the latest v4l core frameworks:
  *
- *  Copyright (C) 2014 Hans Verkuil <hverkuil@xs4all.nl>
+ *  Copyright (C) 2014 Hans Verkuil <hverkuil@kernel.org>
  */
 
 #include <linux/init.h>
@@ -37,7 +37,7 @@
 
 MODULE_DESCRIPTION("v4l2 driver module for tw6800 based video capture cards");
 MODULE_AUTHOR("William M. Brack");
-MODULE_AUTHOR("Hans Verkuil <hverkuil@xs4all.nl>");
+MODULE_AUTHOR("Hans Verkuil <hverkuil@kernel.org>");
 MODULE_LICENSE("GPL");
 
 static unsigned int latency = UNSET;
diff --git a/drivers/media/pci/tw68/tw68-reg.h b/drivers/media/pci/tw68/tw68-reg.h
index dcd9931b25cc..8aeef452ea8a 100644
--- a/drivers/media/pci/tw68/tw68-reg.h
+++ b/drivers/media/pci/tw68/tw68-reg.h
@@ -13,7 +13,7 @@
  *
  *  Refactored and updated to the latest v4l core frameworks:
  *
- *  Copyright (C) 2014 Hans Verkuil <hverkuil@xs4all.nl>
+ *  Copyright (C) 2014 Hans Verkuil <hverkuil@kernel.org>
 */
 
 #ifndef _TW68_REG_H_
diff --git a/drivers/media/pci/tw68/tw68-risc.c b/drivers/media/pci/tw68/tw68-risc.c
index dacb136c4f3a..e793db6134e4 100644
--- a/drivers/media/pci/tw68/tw68-risc.c
+++ b/drivers/media/pci/tw68/tw68-risc.c
@@ -14,7 +14,7 @@
  *
  *  Refactored and updated to the latest v4l core frameworks:
  *
- *  Copyright (C) 2014 Hans Verkuil <hverkuil@xs4all.nl>
+ *  Copyright (C) 2014 Hans Verkuil <hverkuil@kernel.org>
  */
 
 #include "tw68.h"
diff --git a/drivers/media/pci/tw68/tw68-video.c b/drivers/media/pci/tw68/tw68-video.c
index 77773dec48b8..6232bac170d0 100644
--- a/drivers/media/pci/tw68/tw68-video.c
+++ b/drivers/media/pci/tw68/tw68-video.c
@@ -13,7 +13,7 @@
  *
  *  Refactored and updated to the latest v4l core frameworks:
  *
- *  Copyright (C) 2014 Hans Verkuil <hverkuil@xs4all.nl>
+ *  Copyright (C) 2014 Hans Verkuil <hverkuil@kernel.org>
  */
 
 #include <linux/module.h>
diff --git a/drivers/media/pci/tw68/tw68.h b/drivers/media/pci/tw68/tw68.h
index a1f422d6e600..66be6b3bb7b6 100644
--- a/drivers/media/pci/tw68/tw68.h
+++ b/drivers/media/pci/tw68/tw68.h
@@ -13,7 +13,7 @@
  *
  *  Refactored and updated to the latest v4l core frameworks:
  *
- *  Copyright (C) 2014 Hans Verkuil <hverkuil@xs4all.nl>
+ *  Copyright (C) 2014 Hans Verkuil <hverkuil@kernel.org>
  */
 
 #include <linux/pci.h>
diff --git a/drivers/media/platform/marvell/cafe-driver.c b/drivers/media/platform/marvell/cafe-driver.c
index ef810249def6..f9796de92aa7 100644
--- a/drivers/media/platform/marvell/cafe-driver.c
+++ b/drivers/media/platform/marvell/cafe-driver.c
@@ -14,7 +14,7 @@
  * Written by Jonathan Corbet, corbet@lwn.net.
  *
  * v4l2_device/v4l2_subdev conversion by:
- * Copyright (C) 2009 Hans Verkuil <hverkuil@xs4all.nl>
+ * Copyright (C) 2009 Hans Verkuil <hverkuil@kernel.org>
  */
 #include <linux/kernel.h>
 #include <linux/module.h>
diff --git a/drivers/media/radio/radio-aztech.c b/drivers/media/radio/radio-aztech.c
index d989c0b3966f..0a4667bb7034 100644
--- a/drivers/media/radio/radio-aztech.c
+++ b/drivers/media/radio/radio-aztech.c
@@ -2,7 +2,7 @@
 /*
  * radio-aztech.c - Aztech radio card driver
  *
- * Converted to the radio-isa framework by Hans Verkuil <hverkuil@xs4all.nl>
+ * Converted to the radio-isa framework by Hans Verkuil <hverkuil@kernel.org>
  * Converted to V4L2 API by Mauro Carvalho Chehab <mchehab@kernel.org>
  * Adapted to support the Video for Linux API by
  * Russell Kroll <rkroll@exploits.org>.  Based on original tuner code by:
diff --git a/drivers/media/radio/radio-keene.c b/drivers/media/radio/radio-keene.c
index a35648316aa8..f3b57f0cb1ec 100644
--- a/drivers/media/radio/radio-keene.c
+++ b/drivers/media/radio/radio-keene.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Copyright (c) 2012 Hans Verkuil <hverkuil@xs4all.nl>
+ * Copyright (c) 2012 Hans Verkuil <hverkuil@kernel.org>
  */
 
 /* kernel includes */
@@ -18,7 +18,7 @@
 #include <linux/mutex.h>
 
 /* driver and module definitions */
-MODULE_AUTHOR("Hans Verkuil <hverkuil@xs4all.nl>");
+MODULE_AUTHOR("Hans Verkuil <hverkuil@kernel.org>");
 MODULE_DESCRIPTION("Keene FM Transmitter driver");
 MODULE_LICENSE("GPL");
 
diff --git a/drivers/media/radio/radio-raremono.c b/drivers/media/radio/radio-raremono.c
index 64c7452c05b5..f60775b005e1 100644
--- a/drivers/media/radio/radio-raremono.c
+++ b/drivers/media/radio/radio-raremono.c
@@ -25,14 +25,14 @@
  *
  * The USB protocol has been reversed engineered using wireshark, initially
  * by Dinesh Ram <dinesh.ram@cern.ch> and finished by Hans Verkuil
- * <hverkuil@xs4all.nl>.
+ * <hverkuil@kernel.org>.
  *
  * Sadly the firmware used in this product hides lots of goodies since the
  * si4734 has more features than are supported by the firmware. Oh well...
  */
 
 /* driver and module definitions */
-MODULE_AUTHOR("Hans Verkuil <hverkuil@xs4all.nl>");
+MODULE_AUTHOR("Hans Verkuil <hverkuil@kernel.org>");
 MODULE_DESCRIPTION("Thanko's Raremono AM/FM/SW Receiver USB driver");
 MODULE_LICENSE("GPL v2");
 
diff --git a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
index 8c07400bd280..4afa96b7d13e 100644
--- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
+++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
@@ -8,7 +8,7 @@
  * Copyright (C) 2001,2002  Andi Kleen, SuSE Labs
  * Copyright (C) 2003       Pavel Machek (pavel@ucw.cz)
  * Copyright (C) 2005       Philippe De Muyter (phdm@macqel.be)
- * Copyright (C) 2008       Hans Verkuil <hverkuil@xs4all.nl>
+ * Copyright (C) 2008       Hans Verkuil <hverkuil@kernel.org>
  *
  * These routines maintain argument size conversion between 32bit and 64bit
  * ioctls.
diff --git a/drivers/media/v4l2-core/v4l2-device.c b/drivers/media/v4l2-core/v4l2-device.c
index 5e537454f5cd..63b12ef9d4d9 100644
--- a/drivers/media/v4l2-core/v4l2-device.c
+++ b/drivers/media/v4l2-core/v4l2-device.c
@@ -2,7 +2,7 @@
 /*
     V4L2 device support.
 
-    Copyright (C) 2008  Hans Verkuil <hverkuil@xs4all.nl>
+    Copyright (C) 2008  Hans Verkuil <hverkuil@kernel.org>
 
  */
 
-- 
2.47.2


