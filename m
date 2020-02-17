Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDC581615D0
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2020 16:14:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728138AbgBQPOD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Feb 2020 10:14:03 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:44945 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726911AbgBQPOC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Feb 2020 10:14:02 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1j3i5x-0005W4-44; Mon, 17 Feb 2020 16:14:01 +0100
Received: from mtr by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1j3i5w-0001Zq-7M; Mon, 17 Feb 2020 16:14:00 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH 01/18] media: allegro: print message on mcu error
Date:   Mon, 17 Feb 2020 16:13:41 +0100
Message-Id: <20200217151358.5695-2-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200217151358.5695-1-m.tretter@pengutronix.de>
References: <20200217151358.5695-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The codec firmware uses error codes to report errors during the
configuration of a channel or while encoding a frame. Translate them
into human readable strings for debugging.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 .../staging/media/allegro-dvt/allegro-core.c  | 62 +++++++++++++++++--
 1 file changed, 58 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-dvt/allegro-core.c
index 3be41698df4c..c400559637e9 100644
--- a/drivers/staging/media/allegro-dvt/allegro-core.c
+++ b/drivers/staging/media/allegro-dvt/allegro-core.c
@@ -572,6 +572,56 @@ static inline bool channel_exists(struct allegro_channel *channel)
 	return channel->mcu_channel_id != -1;
 }
 
+#define AL_ERROR			0x80
+#define AL_ERR_INIT_FAILED		0x81
+#define AL_ERR_NO_FRAME_DECODED		0x82
+#define AL_ERR_RESOLUTION_CHANGE	0x85
+#define AL_ERR_NO_MEMORY		0x87
+#define AL_ERR_STREAM_OVERFLOW		0x88
+#define AL_ERR_TOO_MANY_SLICES		0x89
+#define AL_ERR_BUF_NOT_READY		0x8c
+#define AL_ERR_NO_CHANNEL_AVAILABLE	0x8d
+#define AL_ERR_RESOURCE_UNAVAILABLE	0x8e
+#define AL_ERR_NOT_ENOUGH_CORES		0x8f
+#define AL_ERR_REQUEST_MALFORMED	0x90
+#define AL_ERR_CMD_NOT_ALLOWED		0x91
+#define AL_ERR_INVALID_CMD_VALUE	0x92
+
+static inline const char *allegro_err_to_string(unsigned int err)
+{
+	switch (err) {
+	case AL_ERR_INIT_FAILED:
+		return "initialization failed";
+	case AL_ERR_NO_FRAME_DECODED:
+		return "no frame decoded";
+	case AL_ERR_RESOLUTION_CHANGE:
+		return "resolution change";
+	case AL_ERR_NO_MEMORY:
+		return "out of memory";
+	case AL_ERR_STREAM_OVERFLOW:
+		return "stream buffer overflow";
+	case AL_ERR_TOO_MANY_SLICES:
+		return "too many slices";
+	case AL_ERR_BUF_NOT_READY:
+		return "buffer not ready";
+	case AL_ERR_NO_CHANNEL_AVAILABLE:
+		return "no channel available";
+	case AL_ERR_RESOURCE_UNAVAILABLE:
+		return "resource unavailable";
+	case AL_ERR_NOT_ENOUGH_CORES:
+		return "not enough cores";
+	case AL_ERR_REQUEST_MALFORMED:
+		return "request malformed";
+	case AL_ERR_CMD_NOT_ALLOWED:
+		return "command not allowed";
+	case AL_ERR_INVALID_CMD_VALUE:
+		return "invalid command value";
+	case AL_ERROR:
+	default:
+		return "unknown error";
+	}
+}
+
 static unsigned int estimate_stream_size(unsigned int width,
 					 unsigned int height)
 {
@@ -1488,8 +1538,10 @@ static void allegro_channel_finish_frame(struct allegro_channel *channel,
 
 	if (msg->error_code) {
 		v4l2_err(&dev->v4l2_dev,
-			 "channel %d: error while encoding frame: %x\n",
-			 channel->mcu_channel_id, msg->error_code);
+			 "channel %d: failed to encode frame: %s (%x)\n",
+			 channel->mcu_channel_id,
+			 allegro_err_to_string(msg->error_code),
+			 msg->error_code);
 		goto err;
 	}
 
@@ -1632,8 +1684,10 @@ allegro_handle_create_channel(struct allegro_dev *dev,
 
 	if (msg->error_code) {
 		v4l2_err(&dev->v4l2_dev,
-			 "user %d: mcu failed to create channel: error %x\n",
-			 channel->user_id, msg->error_code);
+			 "user %d: mcu failed to create channel: %s (%x)\n",
+			 channel->user_id,
+			 allegro_err_to_string(msg->error_code),
+			 msg->error_code);
 		err = -EIO;
 		goto out;
 	}
-- 
2.20.1

