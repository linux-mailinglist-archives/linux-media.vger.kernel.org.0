Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A7F6E778
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2019 18:17:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728778AbfD2QRQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Apr 2019 12:17:16 -0400
Received: from vps-vb.mhejs.net ([37.28.154.113]:56180 "EHLO vps-vb.mhejs.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728481AbfD2QRP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Apr 2019 12:17:15 -0400
Received: from MUA
        by vps-vb.mhejs.net with esmtps (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <mail@maciej.szmigiero.name>)
        id 1hL8xq-0002p8-Ki; Mon, 29 Apr 2019 18:17:10 +0200
From:   "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
To:     Michael Krufky <mkrufky@linuxtv.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Andy Walls <awalls@md.metrocast.net>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH v12 1/8] cx25840: don't open-code cx25840_reset() inside cx25840_load_fw()
Date:   Mon, 29 Apr 2019 18:16:52 +0200
Message-Id: <ea0424b536faaa30afdd796d85b5cc949d574900.1556554056.git.mail@maciej.szmigiero.name>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1556554056.git.mail@maciej.szmigiero.name>
References: <cover.1556554056.git.mail@maciej.szmigiero.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

cx25840_load_fw() does the same thing as cx25840_reset(), only keeps
"is_initialized" flag so any further invocation of this function besides
the first one is a NOP.
Let's just call cx25840_reset() directly from cx25840_load_fw() instead of
open coding it there.

While we are at it, let's also improve comments about cx25840_load_fw()
so they are current and in the proper style (one of them even referred to a
non-existing cx25840 init operation).

Signed-off-by: Maciej S. Szmigiero <mail@maciej.szmigiero.name>
---
 drivers/media/i2c/cx25840/cx25840-core.c | 70 ++++++++++++------------
 include/media/drv-intf/cx25840.h         | 28 ++++++----
 2 files changed, 51 insertions(+), 47 deletions(-)

diff --git a/drivers/media/i2c/cx25840/cx25840-core.c b/drivers/media/i2c/cx25840/cx25840-core.c
index 8b0b8b5aa531..0bf30222cf93 100644
--- a/drivers/media/i2c/cx25840/cx25840-core.c
+++ b/drivers/media/i2c/cx25840/cx25840-core.c
@@ -1649,32 +1649,46 @@ static void log_audio_status(struct i2c_client *client)
 
 /* ----------------------------------------------------------------------- */
 
-/* This load_fw operation must be called to load the driver's firmware.
-   Without this the audio standard detection will fail and you will
-   only get mono.
-
-   Since loading the firmware is often problematic when the driver is
-   compiled into the kernel I recommend postponing calling this function
-   until the first open of the video device. Another reason for
-   postponing it is that loading this firmware takes a long time (seconds)
-   due to the slow i2c bus speed. So it will speed up the boot process if
-   you can avoid loading the fw as long as the video device isn't used.  */
-static int cx25840_load_fw(struct v4l2_subdev *sd)
+static int cx25840_reset(struct v4l2_subdev *sd, u32 val)
 {
 	struct cx25840_state *state = to_state(sd);
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 
+	if (is_cx2583x(state))
+		cx25836_initialize(client);
+	else if (is_cx2388x(state))
+		cx23885_initialize(client);
+	else if (is_cx231xx(state))
+		cx231xx_initialize(client);
+	else
+		cx25840_initialize(client);
+
+	state->is_initialized = 1;
+
+	return 0;
+}
+
+/*
+ * This load_fw operation must be called to load the driver's firmware.
+ * This will load the firmware on the first invocation (further ones are NOP).
+ * Without this the audio standard detection will fail and you will
+ * only get mono.
+ * Alternatively, you can call the reset operation instead of this one.
+ *
+ * Since loading the firmware is often problematic when the driver is
+ * compiled into the kernel I recommend postponing calling this function
+ * until the first open of the video device. Another reason for
+ * postponing it is that loading this firmware takes a long time (seconds)
+ * due to the slow i2c bus speed. So it will speed up the boot process if
+ * you can avoid loading the fw as long as the video device isn't used.
+ */
+static int cx25840_load_fw(struct v4l2_subdev *sd)
+{
+	struct cx25840_state *state = to_state(sd);
+
 	if (!state->is_initialized) {
 		/* initialize and load firmware */
-		state->is_initialized = 1;
-		if (is_cx2583x(state))
-			cx25836_initialize(client);
-		else if (is_cx2388x(state))
-			cx23885_initialize(client);
-		else if (is_cx231xx(state))
-			cx231xx_initialize(client);
-		else
-			cx25840_initialize(client);
+		cx25840_reset(sd, 0);
 	}
 	return 0;
 }
@@ -1937,22 +1951,6 @@ static int cx25840_s_tuner(struct v4l2_subdev *sd, const struct v4l2_tuner *vt)
 	return 0;
 }
 
-static int cx25840_reset(struct v4l2_subdev *sd, u32 val)
-{
-	struct cx25840_state *state = to_state(sd);
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
-
-	if (is_cx2583x(state))
-		cx25836_initialize(client);
-	else if (is_cx2388x(state))
-		cx23885_initialize(client);
-	else if (is_cx231xx(state))
-		cx231xx_initialize(client);
-	else
-		cx25840_initialize(client);
-	return 0;
-}
-
 static int cx25840_log_status(struct v4l2_subdev *sd)
 {
 	struct cx25840_state *state = to_state(sd);
diff --git a/include/media/drv-intf/cx25840.h b/include/media/drv-intf/cx25840.h
index 783c5bdd63eb..ccbfe72b5d6e 100644
--- a/include/media/drv-intf/cx25840.h
+++ b/include/media/drv-intf/cx25840.h
@@ -21,17 +21,23 @@
 #ifndef _CX25840_H_
 #define _CX25840_H_
 
-/* Note that the cx25840 driver requires that the bridge driver calls the
-   v4l2_subdev's init operation in order to load the driver's firmware.
-   Without this the audio standard detection will fail and you will
-   only get mono.
-
-   Since loading the firmware is often problematic when the driver is
-   compiled into the kernel I recommend postponing calling this function
-   until the first open of the video device. Another reason for
-   postponing it is that loading this firmware takes a long time (seconds)
-   due to the slow i2c bus speed. So it will speed up the boot process if
-   you can avoid loading the fw as long as the video device isn't used. */
+/*
+ * Note that the cx25840 driver requires that the bridge driver calls the
+ * v4l2_subdev's load_fw operation in order to load the driver's firmware.
+ * This will load the firmware on the first invocation (further ones are NOP).
+ * Without this the audio standard detection will fail and you will
+ * only get mono.
+ * Alternatively, you can call the reset operation (this can be done
+ * multiple times if needed, each invocation will fully reinitialize
+ * the device).
+ *
+ * Since loading the firmware is often problematic when the driver is
+ * compiled into the kernel I recommend postponing calling this function
+ * until the first open of the video device. Another reason for
+ * postponing it is that loading this firmware takes a long time (seconds)
+ * due to the slow i2c bus speed. So it will speed up the boot process if
+ * you can avoid loading the fw as long as the video device isn't used.
+ */
 
 enum cx25840_video_input {
 	/* Composite video inputs In1-In8 */
