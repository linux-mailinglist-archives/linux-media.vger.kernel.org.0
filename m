Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B79E21D8C7
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2020 16:42:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730035AbgGMOmk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jul 2020 10:42:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729957AbgGMOmd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jul 2020 10:42:33 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40B05C08C5DB
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2020 07:42:33 -0700 (PDT)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1juzf5-0001mQ-FG; Mon, 13 Jul 2020 16:42:31 +0200
Received: from mtr by dude02.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1juzf4-0007rT-KE; Mon, 13 Jul 2020 16:42:30 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        kernel@pengutronix.de, Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH v2 03/12] media: allegro: add explicit mail encoding and decoding
Date:   Mon, 13 Jul 2020 16:42:20 +0200
Message-Id: <20200713144229.30057-4-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200713144229.30057-1-m.tretter@pengutronix.de>
References: <20200713144229.30057-1-m.tretter@pengutronix.de>
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

The message format in the mailboxes differ between firmware versions.
Therefore, it is necessary to decouple the mailbox format of the driver
from the message format of the firmware. This allows to keep a
consistent message format in the driver while still supporting various
firmware versions.

Add an intermediate step to encode and decode message before writing the
mails to the mailboxes.

On the other hand, this allows to handle optional fields in the
messages, which is required for advanced features of the encoder and was
not possible until now.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 .../staging/media/allegro-dvt/allegro-core.c  |  28 +-
 .../staging/media/allegro-dvt/allegro-mail.c  | 364 ++++++++++++++++++
 .../staging/media/allegro-dvt/allegro-mail.h  |   3 +
 3 files changed, 391 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-dvt/allegro-core.c
index dc2627df0eec..6334b351ee3b 100644
--- a/drivers/staging/media/allegro-dvt/allegro-core.c
+++ b/drivers/staging/media/allegro-dvt/allegro-core.c
@@ -705,11 +705,20 @@ static ssize_t allegro_mbox_read(struct allegro_mbox *mbox,
 static int allegro_mbox_send(struct allegro_mbox *mbox, void *msg)
 {
 	struct allegro_dev *dev = mbox->dev;
-	struct mcu_msg_header *header = msg;
-	ssize_t size = sizeof(*header) + header->length;
+	ssize_t size;
 	int err;
+	u32 *tmp;
+
+	tmp = kzalloc(mbox->size, GFP_KERNEL);
+	if (!tmp) {
+		err = -ENOMEM;
+		goto out;
+	}
+
+	size = allegro_encode_mail(tmp, msg);
 
-	err = allegro_mbox_write(mbox, msg, size);
+	err = allegro_mbox_write(mbox, tmp, size);
+	kfree(tmp);
 	if (err)
 		goto out;
 
@@ -728,18 +737,29 @@ static void allegro_mbox_notify(struct allegro_mbox *mbox)
 	struct allegro_dev *dev = mbox->dev;
 	union mcu_msg_response *msg;
 	ssize_t size;
+	u32 *tmp;
+	int err;
 
 	msg = kmalloc(sizeof(*msg), GFP_KERNEL);
 	if (!msg)
 		return;
 
-	size = allegro_mbox_read(mbox, (u32 *)msg, sizeof(*msg));
+	tmp = kmalloc(mbox->size, GFP_KERNEL);
+	if (!tmp)
+		goto out;
+
+	size = allegro_mbox_read(mbox, tmp, mbox->size);
 	if (size < 0)
 		goto out;
 
+	err = allegro_decode_mail(msg, tmp);
+	if (err)
+		goto out;
+
 	allegro_handle_message(dev, msg);
 
 out:
+	kfree(tmp);
 	kfree(msg);
 }
 
diff --git a/drivers/staging/media/allegro-dvt/allegro-mail.c b/drivers/staging/media/allegro-dvt/allegro-mail.c
index df0d8d26a6fb..c78367d36e2e 100644
--- a/drivers/staging/media/allegro-dvt/allegro-mail.c
+++ b/drivers/staging/media/allegro-dvt/allegro-mail.c
@@ -6,7 +6,9 @@
  * Allegro VCU firmware.
  */
 
+#include <linux/bitfield.h>
 #include <linux/export.h>
+#include <linux/errno.h>
 
 #include "allegro-mail.h"
 
@@ -35,3 +37,365 @@ const char *msg_type_name(enum mcu_msg_type type)
 	}
 }
 EXPORT_SYMBOL(msg_type_name);
+
+static ssize_t
+allegro_enc_init(u32 *dst, struct mcu_msg_init_request *msg)
+{
+	unsigned int i = 0;
+
+	dst[i++] = msg->reserved0;
+	dst[i++] = msg->suballoc_dma;
+	dst[i++] = msg->suballoc_size;
+	dst[i++] = msg->l2_cache[0];
+	dst[i++] = msg->l2_cache[1];
+	dst[i++] = msg->l2_cache[2];
+
+	return i * sizeof(*dst);
+}
+
+static ssize_t
+allegro_encode_channel_config(u32 *dst, struct create_channel_param *param)
+{
+	unsigned int i = 0;
+
+	dst[i++] = FIELD_PREP(GENMASK(31, 16), param->height) |
+		   FIELD_PREP(GENMASK(15, 0), param->width);
+	dst[i++] = param->format;
+	dst[i++] = param->colorspace;
+	dst[i++] = param->src_mode;
+	dst[i++] = FIELD_PREP(GENMASK(31, 24), param->codec) |
+		   FIELD_PREP(GENMASK(23, 8), param->constraint_set_flags) |
+		   FIELD_PREP(GENMASK(7, 0), param->profile);
+	dst[i++] = FIELD_PREP(GENMASK(31, 16), param->tier) |
+		   FIELD_PREP(GENMASK(15, 0), param->level);
+	dst[i++] = param->sps_param;
+	dst[i++] = param->pps_param;
+	dst[i++] = param->enc_option;
+	dst[i++] = FIELD_PREP(GENMASK(15, 8), param->beta_offset) |
+		   FIELD_PREP(GENMASK(7, 0), param->tc_offset);
+	dst[i++] = param->unknown11;
+	dst[i++] = param->unknown12;
+	dst[i++] = FIELD_PREP(GENMASK(31, 16), param->prefetch_auto) |
+		   FIELD_PREP(GENMASK(15, 0), param->num_slices);
+	dst[i++] = param->prefetch_mem_offset;
+	dst[i++] = param->prefetch_mem_size;
+	dst[i++] = FIELD_PREP(GENMASK(31, 16), param->clip_vrt_range) |
+		   FIELD_PREP(GENMASK(15, 0), param->clip_hrz_range);
+	dst[i++] = FIELD_PREP(GENMASK(31, 16), param->me_range[1]) |
+		   FIELD_PREP(GENMASK(15, 0), param->me_range[0]);
+	dst[i++] = FIELD_PREP(GENMASK(31, 16), param->me_range[3]) |
+		   FIELD_PREP(GENMASK(15, 0), param->me_range[2]);
+	dst[i++] = FIELD_PREP(GENMASK(31, 24), param->min_tu_size) |
+		   FIELD_PREP(GENMASK(23, 16), param->max_tu_size) |
+		   FIELD_PREP(GENMASK(15, 8), param->min_cu_size) |
+		   FIELD_PREP(GENMASK(8, 0), param->max_cu_size);
+	dst[i++] = FIELD_PREP(GENMASK(15, 8), param->max_transfo_depth_intra) |
+		   FIELD_PREP(GENMASK(7, 0), param->max_transfo_depth_inter);
+	dst[i++] = param->entropy_mode;
+	dst[i++] = param->wp_mode;
+
+	dst[i++] = param->rate_control_mode;
+	dst[i++] = param->initial_rem_delay;
+	dst[i++] = param->cpb_size;
+	dst[i++] = FIELD_PREP(GENMASK(31, 16), param->clk_ratio) |
+		   FIELD_PREP(GENMASK(15, 0), param->framerate);
+	dst[i++] = param->target_bitrate;
+	dst[i++] = param->max_bitrate;
+	dst[i++] = FIELD_PREP(GENMASK(31, 16), param->min_qp) |
+		   FIELD_PREP(GENMASK(15, 0), param->initial_qp);
+	dst[i++] = FIELD_PREP(GENMASK(31, 16), param->ip_delta) |
+		   FIELD_PREP(GENMASK(15, 0), param->max_qp);
+	dst[i++] = FIELD_PREP(GENMASK(31, 16), param->golden_ref) |
+		   FIELD_PREP(GENMASK(15, 0), param->pb_delta);
+	dst[i++] = FIELD_PREP(GENMASK(31, 16), param->golden_ref_frequency) |
+		   FIELD_PREP(GENMASK(15, 0), param->golden_delta);
+	dst[i++] = param->rate_control_option;
+
+	dst[i++] = param->gop_ctrl_mode;
+	dst[i++] = param->freq_idr;
+	dst[i++] = param->freq_lt;
+	dst[i++] = param->gdr_mode;
+	dst[i++] = FIELD_PREP(GENMASK(31, 24), param->freq_golden_ref) |
+		   FIELD_PREP(GENMASK(23, 16), param->num_b) |
+		   FIELD_PREP(GENMASK(15, 0), param->gop_length);
+
+	dst[i++] = param->subframe_latency;
+	dst[i++] = param->lda_control_mode;
+	dst[i++] = param->unknown41;
+
+	return i * sizeof(*dst);
+}
+
+static ssize_t
+allegro_enc_create_channel(u32 *dst, struct mcu_msg_create_channel *msg)
+{
+	struct create_channel_param *param = &msg->param;
+	ssize_t size = 0;
+	unsigned int i = 0;
+
+	dst[i++] = msg->user_id;
+
+	size = allegro_encode_channel_config(&dst[i], param);
+	i += size / sizeof(*dst);
+
+	return i * sizeof(*dst);
+}
+
+static ssize_t
+allegro_enc_destroy_channel(u32 *dst, struct mcu_msg_destroy_channel *msg)
+{
+	unsigned int i = 0;
+
+	dst[i++] = msg->channel_id;
+
+	return i * sizeof(*dst);
+}
+
+static ssize_t
+allegro_enc_push_buffers(u32 *dst, struct mcu_msg_push_buffers_internal *msg)
+{
+	unsigned int i = 0;
+	struct mcu_msg_push_buffers_internal_buffer *buffer;
+	unsigned int num_buffers = (msg->header.length - 4) / sizeof(*buffer);
+	unsigned int j;
+
+	dst[i++] = msg->channel_id;
+
+	for (j = 0; j < num_buffers; j++) {
+		buffer = &msg->buffer[j];
+		dst[i++] = buffer->dma_addr;
+		dst[i++] = buffer->mcu_addr;
+		dst[i++] = buffer->size;
+	}
+
+	return i * sizeof(*dst);
+}
+
+static ssize_t
+allegro_enc_put_stream_buffer(u32 *dst,
+			      struct mcu_msg_put_stream_buffer *msg)
+{
+	unsigned int i = 0;
+
+	dst[i++] = msg->channel_id;
+	dst[i++] = msg->dma_addr;
+	dst[i++] = msg->mcu_addr;
+	dst[i++] = msg->size;
+	dst[i++] = msg->offset;
+	dst[i++] = lower_32_bits(msg->stream_id);
+	dst[i++] = upper_32_bits(msg->stream_id);
+
+	return i * sizeof(*dst);
+}
+
+static ssize_t
+allegro_enc_encode_frame(u32 *dst, struct mcu_msg_encode_frame *msg)
+{
+	unsigned int i = 0;
+
+	dst[i++] = msg->channel_id;
+
+	dst[i++] = msg->reserved;
+	dst[i++] = msg->encoding_options;
+	dst[i++] = FIELD_PREP(GENMASK(31, 16), msg->padding) |
+		   FIELD_PREP(GENMASK(15, 0), msg->pps_qp);
+	dst[i++] = lower_32_bits(msg->user_param);
+	dst[i++] = upper_32_bits(msg->user_param);
+	dst[i++] = lower_32_bits(msg->src_handle);
+	dst[i++] = upper_32_bits(msg->src_handle);
+	dst[i++] = msg->request_options;
+	dst[i++] = msg->src_y;
+	dst[i++] = msg->src_uv;
+	dst[i++] = msg->stride;
+	dst[i++] = msg->ep2;
+	dst[i++] = lower_32_bits(msg->ep2_v);
+	dst[i++] = upper_32_bits(msg->ep2_v);
+
+	return i * sizeof(*dst);
+}
+
+static ssize_t
+allegro_dec_init(struct mcu_msg_init_response *msg, u32 *src)
+{
+	unsigned int i = 0;
+
+	msg->header.type = FIELD_GET(GENMASK(31, 16), src[i]);
+	msg->header.length = FIELD_GET(GENMASK(15, 0), src[i++]);
+	msg->reserved0 = src[i++];
+
+	return i * sizeof(*src);
+}
+
+static ssize_t
+allegro_dec_create_channel(struct mcu_msg_create_channel_response *msg,
+			   u32 *src)
+{
+	unsigned int i = 0;
+
+	msg->header.type = FIELD_GET(GENMASK(31, 16), src[i]);
+	msg->header.length = FIELD_GET(GENMASK(15, 0), src[i++]);
+	msg->channel_id = src[i++];
+	msg->user_id = src[i++];
+	msg->options = src[i++];
+	msg->num_core = src[i++];
+	msg->pps_param = src[i++];
+	msg->int_buffers_count = src[i++];
+	msg->int_buffers_size = src[i++];
+	msg->rec_buffers_count = src[i++];
+	msg->rec_buffers_size = src[i++];
+	msg->reserved = src[i++];
+	msg->error_code = src[i++];
+
+	return i * sizeof(*src);
+}
+
+static ssize_t
+allegro_dec_destroy_channel(struct mcu_msg_destroy_channel_response *msg,
+			    u32 *src)
+{
+	unsigned int i = 0;
+
+	msg->header.type = FIELD_GET(GENMASK(31, 16), src[i]);
+	msg->header.length = FIELD_GET(GENMASK(15, 0), src[i++]);
+	msg->channel_id = src[i++];
+
+	return i * sizeof(*src);
+}
+
+static ssize_t
+allegro_dec_encode_frame(struct mcu_msg_encode_frame_response *msg, u32 *src)
+{
+	unsigned int i = 0;
+	unsigned int j;
+
+	msg->header.type = FIELD_GET(GENMASK(31, 16), src[i]);
+	msg->header.length = FIELD_GET(GENMASK(15, 0), src[i++]);
+	msg->channel_id = src[i++];
+
+	msg->stream_id = src[i++];
+	msg->stream_id |= (((u64)src[i++]) << 32);
+	msg->user_param = src[i++];
+	msg->user_param |= (((u64)src[i++]) << 32);
+	msg->src_handle = src[i++];
+	msg->src_handle |= (((u64)src[i++]) << 32);
+	msg->skip = FIELD_GET(GENMASK(31, 16), src[i]);
+	msg->is_ref = FIELD_GET(GENMASK(15, 0), src[i++]);
+	msg->initial_removal_delay = src[i++];
+	msg->dpb_output_delay = src[i++];
+	msg->size = src[i++];
+	msg->frame_tag_size = src[i++];
+	msg->stuffing = src[i++];
+	msg->filler = src[i++];
+	msg->num_column = FIELD_GET(GENMASK(31, 16), src[i]);
+	msg->num_row = FIELD_GET(GENMASK(15, 0), src[i++]);
+	msg->num_ref_idx_l1 = FIELD_GET(GENMASK(31, 24), src[i]);
+	msg->num_ref_idx_l0 = FIELD_GET(GENMASK(23, 16), src[i]);
+	msg->qp = FIELD_GET(GENMASK(15, 0), src[i++]);
+	msg->partition_table_offset = src[i++];
+	msg->partition_table_size = src[i++];
+	msg->sum_complex = src[i++];
+	for (j = 0; j < 4; j++)
+		msg->tile_width[j] = src[i++];
+	for (j = 0; j < 22; j++)
+		msg->tile_height[j] = src[i++];
+	msg->error_code = src[i++];
+	msg->slice_type = src[i++];
+	msg->pic_struct = src[i++];
+	msg->reserved = FIELD_GET(GENMASK(31, 24), src[i]);
+	msg->is_last_slice = FIELD_GET(GENMASK(23, 16), src[i]);
+	msg->is_first_slice = FIELD_GET(GENMASK(15, 8), src[i]);
+	msg->is_idr = FIELD_GET(GENMASK(7, 0), src[i++]);
+
+	msg->reserved1 = FIELD_GET(GENMASK(31, 16), src[i]);
+	msg->pps_qp = FIELD_GET(GENMASK(15, 0), src[i++]);
+
+	msg->reserved2 = src[i++];
+
+	return i * sizeof(*src);
+}
+
+/**
+ * allegro_encode_mail() - Encode allegro messages to firmware format
+ * @dst: Pointer to the memory that will be filled with data
+ * @msg: The allegro message that will be encoded
+ */
+ssize_t allegro_encode_mail(u32 *dst, void *msg)
+{
+	const struct mcu_msg_header *header = msg;
+	enum mcu_msg_type type = header->type;
+	ssize_t size;
+
+	if (!msg || !dst)
+		return -EINVAL;
+
+	switch (type) {
+	case MCU_MSG_TYPE_INIT:
+		size = allegro_enc_init(&dst[1], msg);
+		break;
+	case MCU_MSG_TYPE_CREATE_CHANNEL:
+		size = allegro_enc_create_channel(&dst[1], msg);
+		break;
+	case MCU_MSG_TYPE_DESTROY_CHANNEL:
+		size = allegro_enc_destroy_channel(&dst[1], msg);
+		break;
+	case MCU_MSG_TYPE_ENCODE_FRAME:
+		size = allegro_enc_encode_frame(&dst[1], msg);
+		break;
+	case MCU_MSG_TYPE_PUT_STREAM_BUFFER:
+		size = allegro_enc_put_stream_buffer(&dst[1], msg);
+		break;
+	case MCU_MSG_TYPE_PUSH_BUFFER_INTERMEDIATE:
+	case MCU_MSG_TYPE_PUSH_BUFFER_REFERENCE:
+		size = allegro_enc_push_buffers(&dst[1], msg);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/*
+	 * The encoded messages might have different length depending on
+	 * the firmware version or certain fields. Therefore, we have to
+	 * set the body length after encoding the message.
+	 */
+	dst[0] = FIELD_PREP(GENMASK(31, 16), header->type) |
+		 FIELD_PREP(GENMASK(15, 0), size);
+
+	return size + sizeof(*dst);
+}
+
+/**
+ * allegro_decode_mail() - Parse allegro messages from the firmware.
+ * @msg: The mcu_msg_response that will be filled with parsed values.
+ * @src: Pointer to the memory that will be parsed
+ *
+ * The message format in the mailbox depends on the firmware. Parse the
+ * different formats into a uniform message format that can be used without
+ * taking care of the firmware version.
+ */
+int allegro_decode_mail(void *msg, u32 *src)
+{
+	struct mcu_msg_header *header;
+
+	if (!src || !msg)
+		return -EINVAL;
+
+	header = (struct mcu_msg_header *)src;
+	switch (header->type) {
+	case MCU_MSG_TYPE_INIT:
+		allegro_dec_init(msg, src);
+		break;
+	case MCU_MSG_TYPE_CREATE_CHANNEL:
+		allegro_dec_create_channel(msg, src);
+		break;
+	case MCU_MSG_TYPE_DESTROY_CHANNEL:
+		allegro_dec_destroy_channel(msg, src);
+		break;
+	case MCU_MSG_TYPE_ENCODE_FRAME:
+		allegro_dec_encode_frame(msg, src);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
diff --git a/drivers/staging/media/allegro-dvt/allegro-mail.h b/drivers/staging/media/allegro-dvt/allegro-mail.h
index 17db665f8e1e..457caf50ebe6 100644
--- a/drivers/staging/media/allegro-dvt/allegro-mail.h
+++ b/drivers/staging/media/allegro-dvt/allegro-mail.h
@@ -264,4 +264,7 @@ union mcu_msg_response {
 	struct mcu_msg_encode_frame_response encode_frame;
 };
 
+int allegro_decode_mail(void *msg, u32 *src);
+ssize_t allegro_encode_mail(u32 *dst, void *msg);
+
 #endif
-- 
2.20.1

