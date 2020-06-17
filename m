Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A27701FCCBD
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2020 13:46:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726652AbgFQLqB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jun 2020 07:46:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726573AbgFQLp4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jun 2020 07:45:56 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EDC5C0613EF
        for <linux-media@vger.kernel.org>; Wed, 17 Jun 2020 04:45:55 -0700 (PDT)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jlWVt-0002Wd-7q; Wed, 17 Jun 2020 13:45:53 +0200
Received: from mtr by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jlWVs-0000rh-JX; Wed, 17 Jun 2020 13:45:52 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        kernel@pengutronix.de, Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH 12/12] media: allegro: add support for allegro firmware 2019.2
Date:   Wed, 17 Jun 2020 13:45:50 +0200
Message-Id: <20200617114550.3235-13-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200617114550.3235-1-m.tretter@pengutronix.de>
References: <20200617114550.3235-1-m.tretter@pengutronix.de>
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

Encode messages as necessary for the firmware 2019.2 and, thus, support
the more recent firmware version in the driver, too.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 .../staging/media/allegro-dvt/allegro-core.c  |  27 ++-
 .../staging/media/allegro-dvt/allegro-mail.c  | 163 +++++++++++++++---
 .../staging/media/allegro-dvt/allegro-mail.h  |  24 +++
 3 files changed, 186 insertions(+), 28 deletions(-)

diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-dvt/allegro-core.c
index 36da55fc5792..e14dbb18b4e1 100644
--- a/drivers/staging/media/allegro-dvt/allegro-core.c
+++ b/drivers/staging/media/allegro-dvt/allegro-core.c
@@ -292,6 +292,15 @@ static const struct fw_info supported_firmware[] = {
 		.mailbox_size = 0x400 - 0x8,
 		.mailbox_version = MCU_MSG_VERSION_2018_2,
 		.suballocator_size = SZ_16M,
+	}, {
+		.id = 14680,
+		.id_codec = 126572,
+		.version = "v2019.2",
+		.mailbox_cmd = 0x7000,
+		.mailbox_status = 0x7800,
+		.mailbox_size = 0x800 - 0x8,
+		.mailbox_version = MCU_MSG_VERSION_2019_2,
+		.suballocator_size = SZ_32M,
 	},
 };
 
@@ -934,10 +943,13 @@ static int fill_create_channel_param(struct allegro_channel *channel,
 
 	param->dbf_ovr_en = 1;
 	param->rdo_cost_mode = 1;
+	param->custom_lda = 1;
 	param->lf = 1;
 	param->lf_x_tile = 1;
 	param->lf_x_slice = 1;
 
+	param->src_bit_depth = 8;
+
 	param->beta_offset = -1;
 	param->tc_offset = -1;
 	param->num_slices = 1;
@@ -978,13 +990,26 @@ static int fill_create_channel_param(struct allegro_channel *channel,
 	param->golden_ref_frequency = 10;
 	param->rate_control_option = 0x00000000;
 
-	param->gop_ctrl_mode = 0x00000000;
+	param->num_pixel = channel->width + channel->height;
+	param->max_psnr = 4200;
+	param->max_pixel_value = 255;
+
+	param->gop_ctrl_mode = 0x00000002;
 	param->freq_idr = channel->gop_size;
 	param->freq_lt = 0;
 	param->gdr_mode = 0x00000000;
 	param->gop_length = channel->gop_size;
 	param->subframe_latency = 0x00000000;
 
+	param->lda_factors[0] = 51;
+	param->lda_factors[1] = 90;
+	param->lda_factors[2] = 151;
+	param->lda_factors[3] = 151;
+	param->lda_factors[4] = 151;
+	param->lda_factors[5] = 151;
+
+	param->max_num_merge_cand = 5;
+
 	return 0;
 }
 
diff --git a/drivers/staging/media/allegro-dvt/allegro-mail.c b/drivers/staging/media/allegro-dvt/allegro-mail.c
index e324a9ae5fff..28f65ef93000 100644
--- a/drivers/staging/media/allegro-dvt/allegro-mail.c
+++ b/drivers/staging/media/allegro-dvt/allegro-mail.c
@@ -43,6 +43,7 @@ static ssize_t
 allegro_enc_init(u32 *dst, struct mcu_msg_init_request *msg)
 {
 	unsigned int i = 0;
+	enum mcu_msg_version version = msg->header.version;
 
 	dst[i++] = msg->reserved0;
 	dst[i++] = msg->suballoc_dma;
@@ -50,33 +51,55 @@ allegro_enc_init(u32 *dst, struct mcu_msg_init_request *msg)
 	dst[i++] = msg->l2_cache[0];
 	dst[i++] = msg->l2_cache[1];
 	dst[i++] = msg->l2_cache[2];
+	if (version >= MCU_MSG_VERSION_2019_2) {
+		dst[i++] = -1;
+		dst[i++] = 0;
+	}
 
 	return i * sizeof(*dst);
 }
 
 static inline u32 settings_get_mcu_codec(struct create_channel_param *param)
 {
+	enum mcu_msg_version version = param->version;
 	u32 pixelformat = param->codec;
 
-	switch (pixelformat) {
-	case V4L2_PIX_FMT_H264:
-	default:
-		return 1;
+	if (version < MCU_MSG_VERSION_2019_2) {
+		switch (pixelformat) {
+		case V4L2_PIX_FMT_H264:
+		default:
+			return 1;
+		}
+	} else {
+		switch (pixelformat) {
+		case V4L2_PIX_FMT_H264:
+		default:
+			return 0;
+		}
 	}
 }
 
 ssize_t
 allegro_encode_config_blob(u32 *dst, struct create_channel_param *param)
 {
+	enum mcu_msg_version version = param->version;
 	unsigned int i = 0;
+	unsigned int j = 0;
 	u32 val;
 	unsigned int codec = settings_get_mcu_codec(param);
 
+	if (version >= MCU_MSG_VERSION_2019_2)
+		dst[i++] = param->layer_id;
 	dst[i++] = FIELD_PREP(GENMASK(31, 16), param->height) |
 		   FIELD_PREP(GENMASK(15, 0), param->width);
+	if (version >= MCU_MSG_VERSION_2019_2)
+		dst[i++] = param->videomode;
 	dst[i++] = param->format;
-	dst[i++] = param->colorspace;
+	if (version < MCU_MSG_VERSION_2019_2)
+		dst[i++] = param->colorspace;
 	dst[i++] = param->src_mode;
+	if (version >= MCU_MSG_VERSION_2019_2)
+		dst[i++] = param->src_bit_depth;
 	dst[i++] = FIELD_PREP(GENMASK(31, 24), codec) |
 		   FIELD_PREP(GENMASK(23, 8), param->constraint_set_flags) |
 		   FIELD_PREP(GENMASK(7, 0), param->profile);
@@ -93,19 +116,31 @@ allegro_encode_config_blob(u32 *dst, struct create_channel_param *param)
 	val |= param->dbf_ovr_en ? BIT(2) : 0;
 	dst[i++] = val;
 
-	val = 0;
-	val |= param->lf ? BIT(2) : 0;
-	val |= param->lf_x_tile ? BIT(3) : 0;
-	val |= param->lf_x_slice ? BIT(4) : 0;
-	val |= param->rdo_cost_mode ? BIT(20) : 0;
-	dst[i++] = val;
+	if (version >= MCU_MSG_VERSION_2019_2) {
+		val = 0;
+		val |= param->custom_lda ? BIT(2) : 0;
+		val |= param->rdo_cost_mode ? BIT(20) : 0;
+		dst[i++] = val;
+
+		val = 0;
+		val |= param->lf ? BIT(2) : 0;
+		val |= param->lf_x_tile ? BIT(3) : 0;
+		val |= param->lf_x_slice ? BIT(4) : 0;
+		dst[i++] = val;
+	} else {
+		val = 0;
+		dst[i++] = val;
+	}
 
 	dst[i++] = FIELD_PREP(GENMASK(15, 8), param->beta_offset) |
 		   FIELD_PREP(GENMASK(7, 0), param->tc_offset);
 	dst[i++] = param->unknown11;
 	dst[i++] = param->unknown12;
-	dst[i++] = FIELD_PREP(GENMASK(31, 16), param->prefetch_auto) |
-		   FIELD_PREP(GENMASK(15, 0), param->num_slices);
+	if (version >= MCU_MSG_VERSION_2019_2)
+		dst[i++] = param->num_slices;
+	else
+		dst[i++] = FIELD_PREP(GENMASK(31, 16), param->prefetch_auto) |
+			   FIELD_PREP(GENMASK(15, 0), param->num_slices);
 	dst[i++] = param->prefetch_mem_offset;
 	dst[i++] = param->prefetch_mem_size;
 	dst[i++] = FIELD_PREP(GENMASK(31, 16), param->clip_vrt_range) |
@@ -138,19 +173,51 @@ allegro_encode_config_blob(u32 *dst, struct create_channel_param *param)
 		   FIELD_PREP(GENMASK(15, 0), param->pb_delta);
 	dst[i++] = FIELD_PREP(GENMASK(31, 16), param->golden_ref_frequency) |
 		   FIELD_PREP(GENMASK(15, 0), param->golden_delta);
-	dst[i++] = param->rate_control_option;
+	if (version >= MCU_MSG_VERSION_2019_2)
+		dst[i++] = param->rate_control_option;
+	else
+		dst[i++] = 0;
+
+	if (version >= MCU_MSG_VERSION_2019_2) {
+		dst[i++] = param->num_pixel;
+		dst[i++] = FIELD_PREP(GENMASK(31, 16), param->max_pixel_value) |
+			FIELD_PREP(GENMASK(15, 0), param->max_psnr);
+		for (j = 0; j < 3; j++)
+			dst[i++] = param->maxpicturesize[j];
+	}
+
+	if (version >= MCU_MSG_VERSION_2019_2)
+		dst[i++] = param->gop_ctrl_mode;
+	else
+		dst[i++] = 0;
 
-	dst[i++] = param->gop_ctrl_mode;
+	if (version >= MCU_MSG_VERSION_2019_2)
+		dst[i++] = FIELD_PREP(GENMASK(31, 24), param->freq_golden_ref) |
+			   FIELD_PREP(GENMASK(23, 16), param->num_b) |
+			   FIELD_PREP(GENMASK(15, 0), param->gop_length);
 	dst[i++] = param->freq_idr;
+	if (version >= MCU_MSG_VERSION_2019_2)
+		dst[i++] = param->enable_lt;
 	dst[i++] = param->freq_lt;
 	dst[i++] = param->gdr_mode;
-	dst[i++] = FIELD_PREP(GENMASK(31, 24), param->freq_golden_ref) |
-		   FIELD_PREP(GENMASK(23, 16), param->num_b) |
-		   FIELD_PREP(GENMASK(15, 0), param->gop_length);
+	if (version < MCU_MSG_VERSION_2019_2)
+		dst[i++] = FIELD_PREP(GENMASK(31, 24), param->freq_golden_ref) |
+			   FIELD_PREP(GENMASK(23, 16), param->num_b) |
+			   FIELD_PREP(GENMASK(15, 0), param->gop_length);
+
+	if (version >= MCU_MSG_VERSION_2019_2)
+		dst[i++] = param->tmpdqp;
 
 	dst[i++] = param->subframe_latency;
 	dst[i++] = param->lda_control_mode;
-	dst[i++] = param->unknown41;
+	if (version < MCU_MSG_VERSION_2019_2)
+		dst[i++] = param->unknown41;
+
+	if (version >= MCU_MSG_VERSION_2019_2) {
+		for (j = 0; j < 6; j++)
+			dst[i++] = param->lda_factors[j];
+		dst[i++] = param->max_num_merge_cand;
+	}
 
 	return i * sizeof(*dst);
 }
@@ -158,12 +225,20 @@ allegro_encode_config_blob(u32 *dst, struct create_channel_param *param)
 static ssize_t
 allegro_enc_create_channel(u32 *dst, struct mcu_msg_create_channel *msg)
 {
+	enum mcu_msg_version version = msg->header.version;
 	unsigned int i = 0;
 
 	dst[i++] = msg->user_id;
 
-	memcpy(&dst[i], msg->blob, msg->blob_size);
-	i += msg->blob_size / sizeof(*dst);
+	if (version >= MCU_MSG_VERSION_2019_2) {
+		dst[i++] = msg->blob_mcu_addr;
+	} else {
+		memcpy(&dst[i], msg->blob, msg->blob_size);
+		i += msg->blob_size / sizeof(*dst);
+	}
+
+	if (version >= MCU_MSG_VERSION_2019_2)
+		dst[i++] = msg->ep1_addr;
 
 	return i * sizeof(*dst);
 }
@@ -172,8 +247,15 @@ ssize_t allegro_decode_config_blob(struct create_channel_param *param,
 				   struct mcu_msg_create_channel_response *msg,
 				   u32 *src)
 {
-	param->num_ref_idx_l0 = msg->num_ref_idx_l0;
-	param->num_ref_idx_l1 = msg->num_ref_idx_l1;
+	enum mcu_msg_version version = msg->header.version;
+
+	if (version >= MCU_MSG_VERSION_2019_2) {
+		param->num_ref_idx_l0 = FIELD_GET(GENMASK(7, 4), src[9]);
+		param->num_ref_idx_l1 = FIELD_GET(GENMASK(11, 8), src[9]);
+	} else {
+		param->num_ref_idx_l0 = msg->num_ref_idx_l0;
+		param->num_ref_idx_l1 = msg->num_ref_idx_l1;
+	}
 
 	return 0;
 }
@@ -228,6 +310,7 @@ allegro_enc_put_stream_buffer(u32 *dst,
 static ssize_t
 allegro_enc_encode_frame(u32 *dst, struct mcu_msg_encode_frame *msg)
 {
+	enum mcu_msg_version version = msg->header.version;
 	unsigned int i = 0;
 
 	dst[i++] = msg->channel_id;
@@ -236,6 +319,14 @@ allegro_enc_encode_frame(u32 *dst, struct mcu_msg_encode_frame *msg)
 	dst[i++] = msg->encoding_options;
 	dst[i++] = FIELD_PREP(GENMASK(31, 16), msg->padding) |
 		   FIELD_PREP(GENMASK(15, 0), msg->pps_qp);
+
+	if (version >= MCU_MSG_VERSION_2019_2) {
+		dst[i++] = 0;
+		dst[i++] = 0;
+		dst[i++] = 0;
+		dst[i++] = 0;
+	}
+
 	dst[i++] = lower_32_bits(msg->user_param);
 	dst[i++] = upper_32_bits(msg->user_param);
 	dst[i++] = lower_32_bits(msg->src_handle);
@@ -243,7 +334,11 @@ allegro_enc_encode_frame(u32 *dst, struct mcu_msg_encode_frame *msg)
 	dst[i++] = msg->request_options;
 	dst[i++] = msg->src_y;
 	dst[i++] = msg->src_uv;
+	if (version >= MCU_MSG_VERSION_2019_2)
+		dst[i++] = msg->is_10_bit;
 	dst[i++] = msg->stride;
+	if (version >= MCU_MSG_VERSION_2019_2)
+		dst[i++] = msg->format;
 	dst[i++] = msg->ep2;
 	dst[i++] = lower_32_bits(msg->ep2_v);
 	dst[i++] = upper_32_bits(msg->ep2_v);
@@ -265,14 +360,21 @@ static ssize_t
 allegro_dec_create_channel(struct mcu_msg_create_channel_response *msg,
 			   u32 *src)
 {
+	enum mcu_msg_version version = msg->header.version;
 	unsigned int i = 0;
 
 	msg->channel_id = src[i++];
 	msg->user_id = src[i++];
-	msg->options = src[i++];
-	msg->num_core = src[i++];
-	msg->num_ref_idx_l0 = FIELD_GET(GENMASK(7, 4), src[i]);
-	msg->num_ref_idx_l1 = FIELD_GET(GENMASK(11, 8), src[i++]);
+	/*
+	 * Version >= MCU_MSG_VERSION_2019_2 is handled in
+	 * allegro_decode_config_blob().
+	 */
+	if (version < MCU_MSG_VERSION_2019_2) {
+		msg->options = src[i++];
+		msg->num_core = src[i++];
+		msg->num_ref_idx_l0 = FIELD_GET(GENMASK(7, 4), src[i]);
+		msg->num_ref_idx_l1 = FIELD_GET(GENMASK(11, 8), src[i++]);
+	}
 	msg->int_buffers_count = src[i++];
 	msg->int_buffers_size = src[i++];
 	msg->rec_buffers_count = src[i++];
@@ -297,6 +399,7 @@ allegro_dec_destroy_channel(struct mcu_msg_destroy_channel_response *msg,
 static ssize_t
 allegro_dec_encode_frame(struct mcu_msg_encode_frame_response *msg, u32 *src)
 {
+	enum mcu_msg_version version = msg->header.version;
 	unsigned int i = 0;
 	unsigned int j;
 
@@ -340,6 +443,12 @@ allegro_dec_encode_frame(struct mcu_msg_encode_frame_response *msg, u32 *src)
 	msg->pps_qp = FIELD_GET(GENMASK(15, 0), src[i++]);
 
 	msg->reserved2 = src[i++];
+	if (version >= MCU_MSG_VERSION_2019_2) {
+		msg->reserved3 = src[i++];
+		msg->reserved4 = src[i++];
+		msg->reserved5 = src[i++];
+		msg->reserved6 = src[i++];
+	}
 
 	return i * sizeof(*src);
 }
diff --git a/drivers/staging/media/allegro-dvt/allegro-mail.h b/drivers/staging/media/allegro-dvt/allegro-mail.h
index c095dbfcf104..486ecb12b098 100644
--- a/drivers/staging/media/allegro-dvt/allegro-mail.h
+++ b/drivers/staging/media/allegro-dvt/allegro-mail.h
@@ -22,6 +22,7 @@ enum mcu_msg_type {
 
 enum mcu_msg_version {
 	MCU_MSG_VERSION_2018_2,
+	MCU_MSG_VERSION_2019_2,
 };
 
 const char *msg_type_name(enum mcu_msg_type type);
@@ -46,11 +47,14 @@ struct mcu_msg_init_response {
 
 struct create_channel_param {
 	enum mcu_msg_version version;
+	u32 layer_id;
 	u16 width;
 	u16 height;
+	u32 videomode;
 	u32 format;
 	u32 colorspace;
 	u32 src_mode;
+	u32 src_bit_depth;
 	u8 profile;
 	u16 constraint_set_flags;
 	u32 codec;
@@ -59,9 +63,11 @@ struct create_channel_param {
 	u32 log2_max_poc;
 	u32 log2_max_frame_num;
 	u32 temporal_mvp_enable;
+	u32 enable_reordering;
 	u32 dbf_ovr_en;
 	u32 num_ref_idx_l0;
 	u32 num_ref_idx_l1;
+	u32 custom_lda;
 	u32 rdo_cost_mode;
 	u32 lf;
 	u32 lf_x_tile;
@@ -105,6 +111,10 @@ struct create_channel_param {
 	u16 golden_delta;
 	u16 golden_ref_frequency;
 	u32 rate_control_option;
+	u32 num_pixel;
+	u16 max_psnr;
+	u16 max_pixel_value;
+	u32 maxpicturesize[3];
 
 	/* gop param */
 	u32 gop_ctrl_mode;
@@ -114,10 +124,16 @@ struct create_channel_param {
 	u16 gop_length;
 	u8 num_b;
 	u8 freq_golden_ref;
+	u32 enable_lt;
+	u32 tmpdqp;
 
 	u32 subframe_latency;
 	u32 lda_control_mode;
 	u32 unknown41;
+
+	u32 lda_factors[6];
+
+	u32 max_num_merge_cand;
 };
 
 struct mcu_msg_create_channel {
@@ -126,6 +142,7 @@ struct mcu_msg_create_channel {
 	u32 *blob;
 	size_t blob_size;
 	u32 blob_mcu_addr;
+	u32 ep1_addr;
 };
 
 struct mcu_msg_create_channel_response {
@@ -203,9 +220,12 @@ struct mcu_msg_encode_frame {
 	/* u32 scene_change_delay (optional) */
 	/* rate control param (optional) */
 	/* gop param (optional) */
+	/* dynamic resolution params (optional) */
 	u32 src_y;
 	u32 src_uv;
+	u32 is_10_bit;
 	u32 stride;
+	u32 format;
 	u32 ep2;
 	u64 ep2_v;
 };
@@ -249,6 +269,10 @@ struct mcu_msg_encode_frame_response {
 	u16 pps_qp;
 	u16 reserved1;
 	u32 reserved2;
+	u32 reserved3;
+	u32 reserved4;
+	u32 reserved5;
+	u32 reserved6;
 };
 
 union mcu_msg_response {
-- 
2.20.1

