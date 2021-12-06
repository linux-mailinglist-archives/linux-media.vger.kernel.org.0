Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EBE8469920
	for <lists+linux-media@lfdr.de>; Mon,  6 Dec 2021 15:37:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344364AbhLFOki (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Dec 2021 09:40:38 -0500
Received: from gofer.mess.org ([88.97.38.141]:54155 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1344015AbhLFOki (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 6 Dec 2021 09:40:38 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 9B765C603C; Mon,  6 Dec 2021 14:37:08 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1638801428; bh=U0tk56XprXZCOh//Hxbx2CiZTaBUINfgSaJredGFmWE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=YB1KyzjEkwcyhETVd6mbgXKh0d17Wvq6V3+ffkW6/VQBrk+00Cyf0iGx4ar+KUDfg
         oaT1Cb/H+CqP2Sp7BkYEYHWEyJVM95SE/SpT7w5Y5j/D34pFcQ8FXXmaFHFpJaaYPS
         9i9Y3vnFJMoytqeVUiG+ebacmChKPEwQ9+fQL1uazFuvl29dR6XJ5m9/GM0OChmAUX
         CE+POWcXq+nWvqyIro7D4CJrwrs7Et2GSs8L9fGCZA1tvspBp0Jl3Nr54204dm5/CC
         Q/Is9sEcOmFLBh9o9CxKoTWMVDIx/a32MECK9Aj/WB8eISE/bSVC9l2EPzlVk/bAO8
         L7EmcABtapS6w==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH 2/2] media: streamzap: remove redundant gap calculations
Date:   Mon,  6 Dec 2021 14:37:08 +0000
Message-Id: <9bc3bacf8d97b219d055929fddb5e46ec5eacf34.1638801410.git.sean@mess.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <3756e0cf7c64858510531867a9c10dbd80c1ee40.1638801410.git.sean@mess.org>
References: <3756e0cf7c64858510531867a9c10dbd80c1ee40.1638801410.git.sean@mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The lirc driver already introduces gaps, so there is no need for this in
the driver.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/streamzap.c | 55 ++++++------------------------------
 1 file changed, 8 insertions(+), 47 deletions(-)

diff --git a/drivers/media/rc/streamzap.c b/drivers/media/rc/streamzap.c
index 39856af16305..71ad750730fc 100644
--- a/drivers/media/rc/streamzap.c
+++ b/drivers/media/rc/streamzap.c
@@ -21,7 +21,6 @@
 #include <linux/device.h>
 #include <linux/module.h>
 #include <linux/slab.h>
-#include <linux/ktime.h>
 #include <linux/usb.h>
 #include <linux/usb/input.h>
 #include <media/rc-core.h>
@@ -75,13 +74,6 @@ struct streamzap_ir {
 
 	/* track what state we're in */
 	enum StreamzapDecoderState decoder_state;
-	/* tracks whether we are currently receiving some signal */
-	bool			idle;
-	/* sum of signal lengths received since signal start */
-	unsigned long		sum;
-	/* start time of signal; necessary for gap tracking */
-	ktime_t			signal_last;
-	ktime_t			signal_start;
 
 	char			phys[64];
 };
@@ -115,37 +107,11 @@ static void sz_push(struct streamzap_ir *sz, struct ir_raw_event rawir)
 static void sz_push_full_pulse(struct streamzap_ir *sz,
 			       unsigned char value)
 {
-	struct ir_raw_event rawir = {};
-
-	if (sz->idle) {
-		int delta;
-
-		sz->signal_last = sz->signal_start;
-		sz->signal_start = ktime_get_real();
-
-		delta = ktime_us_delta(sz->signal_start, sz->signal_last);
-		rawir.pulse = false;
-		if (delta > (15 * USEC_PER_SEC)) {
-			/* really long time */
-			rawir.duration = IR_MAX_DURATION;
-		} else {
-			rawir.duration = delta;
-			rawir.duration -= sz->sum;
-			rawir.duration = (rawir.duration > IR_MAX_DURATION) ?
-					 IR_MAX_DURATION : rawir.duration;
-		}
-		sz_push(sz, rawir);
-
-		sz->idle = false;
-		sz->sum = 0;
-	}
+	struct ir_raw_event rawir = {
+		.pulse = true,
+		.duration = value * SZ_RESOLUTION + SZ_RESOLUTION / 2,
+	};
 
-	rawir.pulse = true;
-	rawir.duration = ((int) value) * SZ_RESOLUTION;
-	rawir.duration += SZ_RESOLUTION / 2;
-	sz->sum += rawir.duration;
-	rawir.duration = (rawir.duration > IR_MAX_DURATION) ?
-			 IR_MAX_DURATION : rawir.duration;
 	sz_push(sz, rawir);
 }
 
@@ -158,12 +124,11 @@ static void sz_push_half_pulse(struct streamzap_ir *sz,
 static void sz_push_full_space(struct streamzap_ir *sz,
 			       unsigned char value)
 {
-	struct ir_raw_event rawir = {};
+	struct ir_raw_event rawir = {
+		.pulse = false,
+		.duration = value * SZ_RESOLUTION + SZ_RESOLUTION / 2,
+	};
 
-	rawir.pulse = false;
-	rawir.duration = ((int) value) * SZ_RESOLUTION;
-	rawir.duration += SZ_RESOLUTION / 2;
-	sz->sum += rawir.duration;
 	sz_push(sz, rawir);
 }
 
@@ -235,7 +200,6 @@ static void streamzap_callback(struct urb *urb)
 					.pulse = false,
 					.duration = sz->rdev->timeout
 				};
-				sz->idle = true;
 				sz_push(sz, rawir);
 			} else {
 				sz_push_full_space(sz, sz->buf_in[i]);
@@ -368,7 +332,6 @@ static int streamzap_probe(struct usb_interface *intf,
 	if (!sz->rdev)
 		goto rc_dev_fail;
 
-	sz->idle = true;
 	sz->decoder_state = PulseSpace;
 	/* FIXME: don't yet have a way to set this */
 	sz->rdev->timeout = SZ_TIMEOUT * SZ_RESOLUTION;
@@ -379,8 +342,6 @@ static int streamzap_probe(struct usb_interface *intf,
 	sz->max_timeout = SZ_TIMEOUT * SZ_RESOLUTION;
 	#endif
 
-	sz->signal_start = ktime_get_real();
-
 	/* Complete final initialisations */
 	usb_fill_int_urb(sz->urb_in, usbdev, pipe, sz->buf_in,
 			 maxp, (usb_complete_t)streamzap_callback,
-- 
2.33.1

