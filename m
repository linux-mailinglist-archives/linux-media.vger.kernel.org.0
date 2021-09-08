Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6326F403A39
	for <lists+linux-media@lfdr.de>; Wed,  8 Sep 2021 15:03:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232704AbhIHNEc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Sep 2021 09:04:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238143AbhIHNE1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Sep 2021 09:04:27 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E068CC0613D9
        for <linux-media@vger.kernel.org>; Wed,  8 Sep 2021 06:03:18 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mNxET-0004n7-8V; Wed, 08 Sep 2021 15:03:17 +0200
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mNxES-0004SM-NO; Wed, 08 Sep 2021 15:03:16 +0200
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mNxER-00DpGI-MZ; Wed, 08 Sep 2021 15:03:15 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl
Cc:     kernel@pengutronix.de, m.tretter@pengutronix.de
Subject: [PATCH 5/6] media: allegro: add encoder buffer support
Date:   Wed,  8 Sep 2021 15:03:14 +0200
Message-Id: <20210908130315.3295253-6-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210908130315.3295253-1-m.tretter@pengutronix.de>
References: <20210908130315.3295253-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The encoder buffer serves as a cache for reference frames during the
encoding process. The encoder buffer significantly reduces the bandwidth
requirement for read accesses on the AXI ports of the VCU, but slightly
reduces the quality of the encoded video.

The encoder buffer must be configured as a whole during the firmware
initialization and later explicitly enabled for every channel that shall
use the encoder buffer.

Prior to firmware version 2019.2, it was necessary to explicitly set the
size of the encoder buffer for every channel. Since 2019.2 it is
sufficient to enable the encoder buffer and leave the rest to the
firmware. Therefore, only support the encoder buffer for firmware 2019.2
and later.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 .../media/platform/allegro-dvt/allegro-core.c | 83 +++++++++++++++++--
 .../media/platform/allegro-dvt/allegro-mail.c | 19 ++---
 .../media/platform/allegro-dvt/allegro-mail.h | 10 ++-
 3 files changed, 90 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index 3deece8176eb..cb42b6e3d85a 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -129,6 +129,13 @@ struct allegro_mbox {
 	struct mutex lock;
 };
 
+struct allegro_encoder_buffer {
+	unsigned int size;
+	unsigned int color_depth;
+	unsigned int num_cores;
+	unsigned int clk_rate;
+};
+
 struct allegro_dev {
 	struct v4l2_device v4l2_dev;
 	struct video_device video_dev;
@@ -148,6 +155,8 @@ struct allegro_dev {
 	const struct fw_info *fw_info;
 	struct allegro_buffer firmware;
 	struct allegro_buffer suballocator;
+	bool has_encoder_buffer;
+	struct allegro_encoder_buffer encoder_buffer;
 
 	struct completion init_complete;
 	bool initialized;
@@ -930,6 +939,52 @@ static void allegro_mbox_notify(struct allegro_mbox *mbox)
 	kfree(msg);
 }
 
+static int allegro_encoder_buffer_init(struct allegro_dev *dev,
+				       struct allegro_encoder_buffer *buffer)
+{
+	int err;
+	struct regmap *settings = dev->settings;
+	unsigned int supports_10_bit;
+	unsigned int memory_depth;
+	unsigned int num_cores;
+	unsigned int color_depth;
+	unsigned long clk_rate;
+
+	/* We don't support the encoder buffer pre Firmware version 2019.2 */
+	if (dev->fw_info->mailbox_version < MCU_MSG_VERSION_2019_2)
+		return -ENODEV;
+
+	if (!settings)
+		return -EINVAL;
+
+	err = regmap_read(settings, VCU_ENC_COLOR_DEPTH, &supports_10_bit);
+	if (err < 0)
+		return err;
+	err = regmap_read(settings, VCU_MEMORY_DEPTH, &memory_depth);
+	if (err < 0)
+		return err;
+	err = regmap_read(settings, VCU_NUM_CORE, &num_cores);
+	if (err < 0)
+		return err;
+
+	clk_rate = clk_get_rate(dev->clk_core);
+	if (clk_rate == 0)
+		return -EINVAL;
+
+	color_depth = supports_10_bit ? 10 : 8;
+	/* The firmware expects the encoder buffer size in bits. */
+	buffer->size = color_depth * 32 * memory_depth;
+	buffer->color_depth = color_depth;
+	buffer->num_cores = num_cores;
+	buffer->clk_rate = clk_rate;
+
+	v4l2_dbg(1, debug, &dev->v4l2_dev,
+		 "using %d bits encoder buffer with %d-bit color depth\n",
+		 buffer->size, color_depth);
+
+	return 0;
+}
+
 static void allegro_mcu_send_init(struct allegro_dev *dev,
 				  dma_addr_t suballoc_dma, size_t suballoc_size)
 {
@@ -943,10 +998,17 @@ static void allegro_mcu_send_init(struct allegro_dev *dev,
 	msg.suballoc_dma = to_mcu_addr(dev, suballoc_dma);
 	msg.suballoc_size = to_mcu_size(dev, suballoc_size);
 
-	/* disable L2 cache */
-	msg.l2_cache[0] = -1;
-	msg.l2_cache[1] = -1;
-	msg.l2_cache[2] = -1;
+	if (dev->has_encoder_buffer) {
+		msg.encoder_buffer_size = dev->encoder_buffer.size;
+		msg.encoder_buffer_color_depth = dev->encoder_buffer.color_depth;
+		msg.num_cores = dev->encoder_buffer.num_cores;
+		msg.clk_rate = dev->encoder_buffer.clk_rate;
+	} else {
+		msg.encoder_buffer_size = -1;
+		msg.encoder_buffer_color_depth = -1;
+		msg.num_cores = -1;
+		msg.clk_rate = -1;
+	}
 
 	allegro_mbox_send(dev->mbox_command, &msg);
 }
@@ -1193,9 +1255,8 @@ static int fill_create_channel_param(struct allegro_channel *channel,
 	param->max_transfo_depth_intra = channel->max_transfo_depth_intra;
 	param->max_transfo_depth_inter = channel->max_transfo_depth_inter;
 
-	param->prefetch_auto = 0;
-	param->prefetch_mem_offset = 0;
-	param->prefetch_mem_size = 0;
+	param->encoder_buffer_enabled = channel->dev->has_encoder_buffer;
+	param->encoder_buffer_offset = 0;
 
 	param->rate_control_mode = channel->frame_rc_enable ?
 		v4l2_bitrate_mode_to_mcu_mode(bitrate_mode) : 0;
@@ -1320,6 +1381,7 @@ static int allegro_mcu_send_encode_frame(struct allegro_dev *dev,
 					 u64 src_handle)
 {
 	struct mcu_msg_encode_frame msg;
+	bool use_encoder_buffer = channel->dev->has_encoder_buffer;
 
 	memset(&msg, 0, sizeof(msg));
 
@@ -1328,6 +1390,8 @@ static int allegro_mcu_send_encode_frame(struct allegro_dev *dev,
 
 	msg.channel_id = channel->mcu_channel_id;
 	msg.encoding_options = AL_OPT_FORCE_LOAD;
+	if (use_encoder_buffer)
+		msg.encoding_options |= AL_OPT_USE_L2;
 	msg.pps_qp = 26; /* qp are relative to 26 */
 	msg.user_param = 0; /* copied to mcu_msg_encode_frame_response */
 	/* src_handle is copied to mcu_msg_encode_frame_response */
@@ -3522,6 +3586,11 @@ static int allegro_mcu_hw_init(struct allegro_dev *dev,
 		return -EIO;
 	}
 
+	err = allegro_encoder_buffer_init(dev, &dev->encoder_buffer);
+	dev->has_encoder_buffer = (err == 0);
+	if (!dev->has_encoder_buffer)
+		v4l2_info(&dev->v4l2_dev, "encoder buffer not available\n");
+
 	allegro_mcu_enable_interrupts(dev);
 
 	/* The mcu sends INIT after reset. */
diff --git a/drivers/media/platform/allegro-dvt/allegro-mail.c b/drivers/media/platform/allegro-dvt/allegro-mail.c
index 7e08c5050f2e..d81fae3ed3e4 100644
--- a/drivers/media/platform/allegro-dvt/allegro-mail.c
+++ b/drivers/media/platform/allegro-dvt/allegro-mail.c
@@ -49,11 +49,11 @@ allegro_enc_init(u32 *dst, struct mcu_msg_init_request *msg)
 	dst[i++] = msg->reserved0;
 	dst[i++] = msg->suballoc_dma;
 	dst[i++] = msg->suballoc_size;
-	dst[i++] = msg->l2_cache[0];
-	dst[i++] = msg->l2_cache[1];
-	dst[i++] = msg->l2_cache[2];
+	dst[i++] = msg->encoder_buffer_size;
+	dst[i++] = msg->encoder_buffer_color_depth;
+	dst[i++] = msg->num_cores;
 	if (version >= MCU_MSG_VERSION_2019_2) {
-		dst[i++] = -1;
+		dst[i++] = msg->clk_rate;
 		dst[i++] = 0;
 	}
 
@@ -146,13 +146,10 @@ allegro_encode_config_blob(u32 *dst, struct create_channel_param *param)
 		   FIELD_PREP(GENMASK(7, 0), param->tc_offset);
 	dst[i++] = param->unknown11;
 	dst[i++] = param->unknown12;
-	if (version >= MCU_MSG_VERSION_2019_2)
-		dst[i++] = param->num_slices;
-	else
-		dst[i++] = FIELD_PREP(GENMASK(31, 16), param->prefetch_auto) |
-			   FIELD_PREP(GENMASK(15, 0), param->num_slices);
-	dst[i++] = param->prefetch_mem_offset;
-	dst[i++] = param->prefetch_mem_size;
+	dst[i++] = param->num_slices;
+	dst[i++] = param->encoder_buffer_offset;
+	dst[i++] = param->encoder_buffer_enabled;
+
 	dst[i++] = FIELD_PREP(GENMASK(31, 16), param->clip_vrt_range) |
 		   FIELD_PREP(GENMASK(15, 0), param->clip_hrz_range);
 	dst[i++] = FIELD_PREP(GENMASK(31, 16), param->me_range[1]) |
diff --git a/drivers/media/platform/allegro-dvt/allegro-mail.h b/drivers/media/platform/allegro-dvt/allegro-mail.h
index 2c7bc509eac3..a5686058d754 100644
--- a/drivers/media/platform/allegro-dvt/allegro-mail.h
+++ b/drivers/media/platform/allegro-dvt/allegro-mail.h
@@ -37,7 +37,10 @@ struct mcu_msg_init_request {
 	u32 reserved0;		/* maybe a unused channel id */
 	u32 suballoc_dma;
 	u32 suballoc_size;
-	s32 l2_cache[3];
+	s32 encoder_buffer_size;
+	s32 encoder_buffer_color_depth;
+	s32 num_cores;
+	s32 clk_rate;
 };
 
 struct mcu_msg_init_response {
@@ -79,9 +82,8 @@ struct create_channel_param {
 	u32 unknown11;
 	u32 unknown12;
 	u16 num_slices;
-	u16 prefetch_auto;
-	u32 prefetch_mem_offset;
-	u32 prefetch_mem_size;
+	u32 encoder_buffer_offset;
+	u32 encoder_buffer_enabled;
 	u16 clip_hrz_range;
 	u16 clip_vrt_range;
 	u16 me_range[4];
-- 
2.30.2

