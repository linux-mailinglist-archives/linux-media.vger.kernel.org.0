Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C7482C583F
	for <lists+linux-media@lfdr.de>; Thu, 26 Nov 2020 16:29:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390351AbgKZP3q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Nov 2020 10:29:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729947AbgKZP3q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Nov 2020 10:29:46 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D71B7C0613D4
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2020 07:29:45 -0800 (PST)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1kiJDL-00080A-LA; Thu, 26 Nov 2020 16:29:44 +0100
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@dude03.red.stw.pengutronix.de>)
        id 1kiJDL-00G3G3-2E; Thu, 26 Nov 2020 16:29:43 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     kernel@pengutronix.de, robh+dt@kernel.org,
        hverkuil-cisco@xs4all.nl,
        Michael Tretter <m.tretter@pengutronix.de>
Date:   Thu, 26 Nov 2020 16:29:41 +0100
Message-Id: <20201126152941.3825721-5-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201126152941.3825721-1-m.tretter@pengutronix.de>
References: <20201126152941.3825721-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
        metis.ext.pengutronix.de
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=4.0 tests=AWL,BAYES_00,RDNS_NONE,
        SPF_HELO_NONE,SPF_SOFTFAIL autolearn=no autolearn_force=no
        version=3.4.2
Subject: [PATCH 4/4] media: allegro: rename stream_id to dst_handle
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The dst_handle field in the PUT_STREAM_BUFFER and ENCODE_FRAME_RESPONSE
is used to retrieve the V4L2 CAPTURE buffer. Calling it stream_id is
confusing. Call it dst_handle inspired by src_handle for the OUTPUT
buffer.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/media/platform/allegro-dvt/allegro-core.c | 6 +++---
 drivers/media/platform/allegro-dvt/allegro-mail.c | 8 ++++----
 drivers/media/platform/allegro-dvt/allegro-mail.h | 4 ++--
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index 902b8af90ac6..6b5cbee05040 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -1038,7 +1038,7 @@ static int allegro_mcu_send_put_stream_buffer(struct allegro_dev *dev,
 					      struct allegro_channel *channel,
 					      dma_addr_t paddr,
 					      unsigned long size,
-					      u64 stream_id)
+					      u64 dst_handle)
 {
 	struct mcu_msg_put_stream_buffer msg;
 
@@ -1053,7 +1053,7 @@ static int allegro_mcu_send_put_stream_buffer(struct allegro_dev *dev,
 	msg.size = size;
 	msg.offset = ENCODER_STREAM_OFFSET;
 	/* copied to mcu_msg_encode_frame_response */
-	msg.stream_id = stream_id;
+	msg.dst_handle = dst_handle;
 
 	allegro_mbox_send(dev->mbox_command, &msg);
 
@@ -1437,7 +1437,7 @@ static void allegro_channel_finish_frame(struct allegro_channel *channel,
 			  channel->mcu_channel_id);
 
 	dst_buf = allegro_get_buffer(channel, &channel->stream_shadow_list,
-				     msg->stream_id);
+				     msg->dst_handle);
 	if (!dst_buf)
 		v4l2_warn(&dev->v4l2_dev,
 			  "channel %d: invalid stream buffer\n",
diff --git a/drivers/media/platform/allegro-dvt/allegro-mail.c b/drivers/media/platform/allegro-dvt/allegro-mail.c
index 9286d2162377..993e16f06305 100644
--- a/drivers/media/platform/allegro-dvt/allegro-mail.c
+++ b/drivers/media/platform/allegro-dvt/allegro-mail.c
@@ -302,8 +302,8 @@ allegro_enc_put_stream_buffer(u32 *dst,
 	dst[i++] = msg->mcu_addr;
 	dst[i++] = msg->size;
 	dst[i++] = msg->offset;
-	dst[i++] = lower_32_bits(msg->stream_id);
-	dst[i++] = upper_32_bits(msg->stream_id);
+	dst[i++] = lower_32_bits(msg->dst_handle);
+	dst[i++] = upper_32_bits(msg->dst_handle);
 
 	return i * sizeof(*dst);
 }
@@ -406,8 +406,8 @@ allegro_dec_encode_frame(struct mcu_msg_encode_frame_response *msg, u32 *src)
 
 	msg->channel_id = src[i++];
 
-	msg->stream_id = src[i++];
-	msg->stream_id |= (((u64)src[i++]) << 32);
+	msg->dst_handle = src[i++];
+	msg->dst_handle |= (((u64)src[i++]) << 32);
 	msg->user_param = src[i++];
 	msg->user_param |= (((u64)src[i++]) << 32);
 	msg->src_handle = src[i++];
diff --git a/drivers/media/platform/allegro-dvt/allegro-mail.h b/drivers/media/platform/allegro-dvt/allegro-mail.h
index 486ecb12b098..f7485cf78c4f 100644
--- a/drivers/media/platform/allegro-dvt/allegro-mail.h
+++ b/drivers/media/platform/allegro-dvt/allegro-mail.h
@@ -191,7 +191,7 @@ struct mcu_msg_put_stream_buffer {
 	u32 mcu_addr;
 	u32 size;
 	u32 offset;
-	u64 stream_id;
+	u64 dst_handle;
 };
 
 struct mcu_msg_encode_frame {
@@ -233,7 +233,7 @@ struct mcu_msg_encode_frame {
 struct mcu_msg_encode_frame_response {
 	struct mcu_msg_header header;
 	u32 channel_id;
-	u64 stream_id;		/* see mcu_msg_put_stream_buffer */
+	u64 dst_handle;		/* see mcu_msg_put_stream_buffer */
 	u64 user_param;		/* see mcu_msg_encode_frame */
 	u64 src_handle;		/* see mcu_msg_encode_frame */
 	u16 skip;
-- 
2.20.1

