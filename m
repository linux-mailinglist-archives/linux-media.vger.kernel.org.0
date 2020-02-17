Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 402401615D7
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2020 16:14:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728363AbgBQPOH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Feb 2020 10:14:07 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:47449 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728101AbgBQPOD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Feb 2020 10:14:03 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1j3i5x-0005WK-CA; Mon, 17 Feb 2020 16:14:01 +0100
Received: from mtr by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1j3i5w-0001bB-EI; Mon, 17 Feb 2020 16:14:00 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH 17/18] media: allegro: move mail definitions to separate file
Date:   Mon, 17 Feb 2020 16:13:57 +0100
Message-Id: <20200217151358.5695-18-m.tretter@pengutronix.de>
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

Move the mail definitions from the driver core to a dedicated file.

The mails that are exchanged between driver and firmware are not stable
across firmware versions. This is in preparation to make the driver able
to handle multiple firmware version by having dedicated code for
handling mails.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/staging/media/allegro-dvt/Makefile    |   2 +-
 .../staging/media/allegro-dvt/allegro-core.c  | 274 +-----------------
 .../staging/media/allegro-dvt/allegro-mail.c  |  37 +++
 .../staging/media/allegro-dvt/allegro-mail.h  | 263 +++++++++++++++++
 4 files changed, 302 insertions(+), 274 deletions(-)
 create mode 100644 drivers/staging/media/allegro-dvt/allegro-mail.c
 create mode 100644 drivers/staging/media/allegro-dvt/allegro-mail.h

diff --git a/drivers/staging/media/allegro-dvt/Makefile b/drivers/staging/media/allegro-dvt/Makefile
index 80817160815c..8e306dcdc55c 100644
--- a/drivers/staging/media/allegro-dvt/Makefile
+++ b/drivers/staging/media/allegro-dvt/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 
-allegro-objs := allegro-core.o nal-h264.o
+allegro-objs := allegro-core.o nal-h264.o allegro-mail.o
 
 obj-$(CONFIG_VIDEO_ALLEGRO_DVT) += allegro.o
diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-dvt/allegro-core.c
index 80d3383b84f8..e56256d1cdb3 100644
--- a/drivers/staging/media/allegro-dvt/allegro-core.c
+++ b/drivers/staging/media/allegro-dvt/allegro-core.c
@@ -28,6 +28,7 @@
 #include <media/videobuf2-dma-contig.h>
 #include <media/videobuf2-v4l2.h>
 
+#include "allegro-mail.h"
 #include "nal-h264.h"
 
 /*
@@ -281,279 +282,6 @@ static const struct fw_info supported_firmware[] = {
 	},
 };
 
-enum mcu_msg_type {
-	MCU_MSG_TYPE_INIT = 0x0000,
-	MCU_MSG_TYPE_CREATE_CHANNEL = 0x0005,
-	MCU_MSG_TYPE_DESTROY_CHANNEL = 0x0006,
-	MCU_MSG_TYPE_ENCODE_FRAME = 0x0007,
-	MCU_MSG_TYPE_PUT_STREAM_BUFFER = 0x0012,
-	MCU_MSG_TYPE_PUSH_BUFFER_INTERMEDIATE = 0x000e,
-	MCU_MSG_TYPE_PUSH_BUFFER_REFERENCE = 0x000f,
-};
-
-static const char *msg_type_name(enum mcu_msg_type type)
-{
-	static char buf[9];
-
-	switch (type) {
-	case MCU_MSG_TYPE_INIT:
-		return "INIT";
-	case MCU_MSG_TYPE_CREATE_CHANNEL:
-		return "CREATE_CHANNEL";
-	case MCU_MSG_TYPE_DESTROY_CHANNEL:
-		return "DESTROY_CHANNEL";
-	case MCU_MSG_TYPE_ENCODE_FRAME:
-		return "ENCODE_FRAME";
-	case MCU_MSG_TYPE_PUT_STREAM_BUFFER:
-		return "PUT_STREAM_BUFFER";
-	case MCU_MSG_TYPE_PUSH_BUFFER_INTERMEDIATE:
-		return "PUSH_BUFFER_INTERMEDIATE";
-	case MCU_MSG_TYPE_PUSH_BUFFER_REFERENCE:
-		return "PUSH_BUFFER_REFERENCE";
-	default:
-		snprintf(buf, sizeof(buf), "(0x%04x)", type);
-		return buf;
-	}
-}
-
-struct mcu_msg_header {
-	u16 length;		/* length of the body in bytes */
-	u16 type;
-} __attribute__ ((__packed__));
-
-struct mcu_msg_init_request {
-	struct mcu_msg_header header;
-	u32 reserved0;		/* maybe a unused channel id */
-	u32 suballoc_dma;
-	u32 suballoc_size;
-	s32 l2_cache[3];
-} __attribute__ ((__packed__));
-
-struct mcu_msg_init_response {
-	struct mcu_msg_header header;
-	u32 reserved0;
-} __attribute__ ((__packed__));
-
-struct mcu_msg_create_channel {
-	struct mcu_msg_header header;
-	u32 user_id;
-	u16 width;
-	u16 height;
-	u32 format;
-	u32 colorspace;
-	u32 src_mode;
-	u8 profile;
-	u16 constraint_set_flags;
-	s8 codec;
-	u16 level;
-	u16 tier;
-	u32 sps_param;
-	u32 pps_param;
-
-	u32 enc_option;
-#define AL_OPT_WPP			BIT(0)
-#define AL_OPT_TILE			BIT(1)
-#define AL_OPT_LF			BIT(2)
-#define AL_OPT_LF_X_SLICE		BIT(3)
-#define AL_OPT_LF_X_TILE		BIT(4)
-#define AL_OPT_SCL_LST			BIT(5)
-#define AL_OPT_CONST_INTRA_PRED		BIT(6)
-#define AL_OPT_QP_TAB_RELATIVE		BIT(7)
-#define AL_OPT_FIX_PREDICTOR		BIT(8)
-#define AL_OPT_CUSTOM_LDA		BIT(9)
-#define AL_OPT_ENABLE_AUTO_QP		BIT(10)
-#define AL_OPT_ADAPT_AUTO_QP		BIT(11)
-#define AL_OPT_TRANSFO_SKIP		BIT(13)
-#define AL_OPT_FORCE_REC		BIT(15)
-#define AL_OPT_FORCE_MV_OUT		BIT(16)
-#define AL_OPT_FORCE_MV_CLIP		BIT(17)
-#define AL_OPT_LOWLAT_SYNC		BIT(18)
-#define AL_OPT_LOWLAT_INT		BIT(19)
-#define AL_OPT_RDO_COST_MODE		BIT(20)
-
-	s8 beta_offset;
-	s8 tc_offset;
-	u16 reserved10;
-	u32 unknown11;
-	u32 unknown12;
-	u16 num_slices;
-	u16 prefetch_auto;
-	u32 prefetch_mem_offset;
-	u32 prefetch_mem_size;
-	u16 clip_hrz_range;
-	u16 clip_vrt_range;
-	u16 me_range[4];
-	u8 max_cu_size;
-	u8 min_cu_size;
-	u8 max_tu_size;
-	u8 min_tu_size;
-	u8 max_transfo_depth_inter;
-	u8 max_transfo_depth_intra;
-	u16 reserved20;
-	u32 entropy_mode;
-	u32 wp_mode;
-
-	/* rate control param */
-	u32 rate_control_mode;
-	u32 initial_rem_delay;
-	u32 cpb_size;
-	u16 framerate;
-	u16 clk_ratio;
-	u32 target_bitrate;
-	u32 max_bitrate;
-	u16 initial_qp;
-	u16 min_qp;
-	u16 max_qp;
-	s16 ip_delta;
-	s16 pb_delta;
-	u16 golden_ref;
-	u16 golden_delta;
-	u16 golden_ref_frequency;
-	u32 rate_control_option;
-
-	/* gop param */
-	u32 gop_ctrl_mode;
-	u32 freq_idr;
-	u32 freq_lt;
-	u32 gdr_mode;
-	u16 gop_length;
-	u8 num_b;
-	u8 freq_golden_ref;
-
-	u32 subframe_latency;
-	u32 lda_control_mode;
-	u32 unknown41;
-} __attribute__ ((__packed__));
-
-struct mcu_msg_create_channel_response {
-	struct mcu_msg_header header;
-	u32 channel_id;
-	u32 user_id;
-	u32 options;
-	u32 num_core;
-	u32 pps_param;
-	u32 int_buffers_count;
-	u32 int_buffers_size;
-	u32 rec_buffers_count;
-	u32 rec_buffers_size;
-	u32 reserved;
-	u32 error_code;
-} __attribute__ ((__packed__));
-
-struct mcu_msg_destroy_channel {
-	struct mcu_msg_header header;
-	u32 channel_id;
-} __attribute__ ((__packed__));
-
-struct mcu_msg_destroy_channel_response {
-	struct mcu_msg_header header;
-	u32 channel_id;
-} __attribute__ ((__packed__));
-
-struct mcu_msg_push_buffers_internal_buffer {
-	u32 dma_addr;
-	u32 mcu_addr;
-	u32 size;
-} __attribute__ ((__packed__));
-
-struct mcu_msg_push_buffers_internal {
-	struct mcu_msg_header header;
-	u32 channel_id;
-	struct mcu_msg_push_buffers_internal_buffer buffer[0];
-} __attribute__ ((__packed__));
-
-struct mcu_msg_put_stream_buffer {
-	struct mcu_msg_header header;
-	u32 channel_id;
-	u32 dma_addr;
-	u32 mcu_addr;
-	u32 size;
-	u32 offset;
-	u64 stream_id;
-} __attribute__ ((__packed__));
-
-struct mcu_msg_encode_frame {
-	struct mcu_msg_header header;
-	u32 channel_id;
-	u32 reserved;
-
-	u32 encoding_options;
-#define AL_OPT_USE_QP_TABLE		BIT(0)
-#define AL_OPT_FORCE_LOAD		BIT(1)
-#define AL_OPT_USE_L2			BIT(2)
-#define AL_OPT_DISABLE_INTRA		BIT(3)
-#define AL_OPT_DEPENDENT_SLICES		BIT(4)
-
-	s16 pps_qp;
-	u16 padding;
-	u64 user_param;
-	u64 src_handle;
-
-	u32 request_options;
-#define AL_OPT_SCENE_CHANGE		BIT(0)
-#define AL_OPT_RESTART_GOP		BIT(1)
-#define AL_OPT_USE_LONG_TERM		BIT(2)
-#define AL_OPT_UPDATE_PARAMS		BIT(3)
-
-	/* u32 scene_change_delay (optional) */
-	/* rate control param (optional) */
-	/* gop param (optional) */
-	u32 src_y;
-	u32 src_uv;
-	u32 stride;
-	u32 ep2;
-	u64 ep2_v;
-} __attribute__ ((__packed__));
-
-struct mcu_msg_encode_frame_response {
-	struct mcu_msg_header header;
-	u32 channel_id;
-	u64 stream_id;		/* see mcu_msg_put_stream_buffer */
-	u64 user_param;		/* see mcu_msg_encode_frame */
-	u64 src_handle;		/* see mcu_msg_encode_frame */
-	u16 skip;
-	u16 is_ref;
-	u32 initial_removal_delay;
-	u32 dpb_output_delay;
-	u32 size;
-	u32 frame_tag_size;
-	s32 stuffing;
-	s32 filler;
-	u16 num_column;
-	u16 num_row;
-	u16 qp;
-	u8 num_ref_idx_l0;
-	u8 num_ref_idx_l1;
-	u32 partition_table_offset;
-	s32 partition_table_size;
-	u32 sum_complex;
-	s32 tile_width[4];
-	s32 tile_height[22];
-	u32 error_code;
-
-	u32 slice_type;
-#define AL_ENC_SLICE_TYPE_B             0
-#define AL_ENC_SLICE_TYPE_P             1
-#define AL_ENC_SLICE_TYPE_I             2
-
-	u32 pic_struct;
-	u8 is_idr;
-	u8 is_first_slice;
-	u8 is_last_slice;
-	u8 reserved;
-	u16 pps_qp;
-	u16 reserved1;
-	u32 reserved2;
-} __attribute__ ((__packed__));
-
-union mcu_msg_response {
-	struct mcu_msg_header header;
-	struct mcu_msg_init_response init;
-	struct mcu_msg_create_channel_response create_channel;
-	struct mcu_msg_destroy_channel_response destroy_channel;
-	struct mcu_msg_encode_frame_response encode_frame;
-};
-
 static inline u32 to_mcu_addr(struct allegro_dev *dev, dma_addr_t phys)
 {
 	if (upper_32_bits(phys) || (lower_32_bits(phys) & MCU_CACHE_OFFSET))
diff --git a/drivers/staging/media/allegro-dvt/allegro-mail.c b/drivers/staging/media/allegro-dvt/allegro-mail.c
new file mode 100644
index 000000000000..df0d8d26a6fb
--- /dev/null
+++ b/drivers/staging/media/allegro-dvt/allegro-mail.c
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 Pengutronix, Michael Tretter <kernel@pengutronix.de>
+ *
+ * Helper functions for handling messages that are send via mailbox to the
+ * Allegro VCU firmware.
+ */
+
+#include <linux/export.h>
+
+#include "allegro-mail.h"
+
+const char *msg_type_name(enum mcu_msg_type type)
+{
+	static char buf[9];
+
+	switch (type) {
+	case MCU_MSG_TYPE_INIT:
+		return "INIT";
+	case MCU_MSG_TYPE_CREATE_CHANNEL:
+		return "CREATE_CHANNEL";
+	case MCU_MSG_TYPE_DESTROY_CHANNEL:
+		return "DESTROY_CHANNEL";
+	case MCU_MSG_TYPE_ENCODE_FRAME:
+		return "ENCODE_FRAME";
+	case MCU_MSG_TYPE_PUT_STREAM_BUFFER:
+		return "PUT_STREAM_BUFFER";
+	case MCU_MSG_TYPE_PUSH_BUFFER_INTERMEDIATE:
+		return "PUSH_BUFFER_INTERMEDIATE";
+	case MCU_MSG_TYPE_PUSH_BUFFER_REFERENCE:
+		return "PUSH_BUFFER_REFERENCE";
+	default:
+		snprintf(buf, sizeof(buf), "(0x%04x)", type);
+		return buf;
+	}
+}
+EXPORT_SYMBOL(msg_type_name);
diff --git a/drivers/staging/media/allegro-dvt/allegro-mail.h b/drivers/staging/media/allegro-dvt/allegro-mail.h
new file mode 100644
index 000000000000..d9050d6b5c97
--- /dev/null
+++ b/drivers/staging/media/allegro-dvt/allegro-mail.h
@@ -0,0 +1,263 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 Pengutronix, Michael Tretter <kernel@pengutronix.de>
+ *
+ * Allegro VCU firmware mailbox mail definitions
+ */
+
+#ifndef ALLEGRO_MAIL_H
+#define ALLEGRO_MAIL_H
+
+#include <linux/kernel.h>
+
+enum mcu_msg_type {
+	MCU_MSG_TYPE_INIT = 0x0000,
+	MCU_MSG_TYPE_CREATE_CHANNEL = 0x0005,
+	MCU_MSG_TYPE_DESTROY_CHANNEL = 0x0006,
+	MCU_MSG_TYPE_ENCODE_FRAME = 0x0007,
+	MCU_MSG_TYPE_PUT_STREAM_BUFFER = 0x0012,
+	MCU_MSG_TYPE_PUSH_BUFFER_INTERMEDIATE = 0x000e,
+	MCU_MSG_TYPE_PUSH_BUFFER_REFERENCE = 0x000f,
+};
+
+const char *msg_type_name(enum mcu_msg_type type);
+
+struct mcu_msg_header {
+	u16 length;		/* length of the body in bytes */
+	u16 type;
+} __attribute__ ((__packed__));
+
+struct mcu_msg_init_request {
+	struct mcu_msg_header header;
+	u32 reserved0;		/* maybe a unused channel id */
+	u32 suballoc_dma;
+	u32 suballoc_size;
+	s32 l2_cache[3];
+} __attribute__ ((__packed__));
+
+struct mcu_msg_init_response {
+	struct mcu_msg_header header;
+	u32 reserved0;
+} __attribute__ ((__packed__));
+
+struct mcu_msg_create_channel {
+	struct mcu_msg_header header;
+	u32 user_id;
+	u16 width;
+	u16 height;
+	u32 format;
+	u32 colorspace;
+	u32 src_mode;
+	u8 profile;
+	u16 constraint_set_flags;
+	s8 codec;
+	u16 level;
+	u16 tier;
+	u32 sps_param;
+	u32 pps_param;
+
+	u32 enc_option;
+#define AL_OPT_WPP			BIT(0)
+#define AL_OPT_TILE			BIT(1)
+#define AL_OPT_LF			BIT(2)
+#define AL_OPT_LF_X_SLICE		BIT(3)
+#define AL_OPT_LF_X_TILE		BIT(4)
+#define AL_OPT_SCL_LST			BIT(5)
+#define AL_OPT_CONST_INTRA_PRED		BIT(6)
+#define AL_OPT_QP_TAB_RELATIVE		BIT(7)
+#define AL_OPT_FIX_PREDICTOR		BIT(8)
+#define AL_OPT_CUSTOM_LDA		BIT(9)
+#define AL_OPT_ENABLE_AUTO_QP		BIT(10)
+#define AL_OPT_ADAPT_AUTO_QP		BIT(11)
+#define AL_OPT_TRANSFO_SKIP		BIT(13)
+#define AL_OPT_FORCE_REC		BIT(15)
+#define AL_OPT_FORCE_MV_OUT		BIT(16)
+#define AL_OPT_FORCE_MV_CLIP		BIT(17)
+#define AL_OPT_LOWLAT_SYNC		BIT(18)
+#define AL_OPT_LOWLAT_INT		BIT(19)
+#define AL_OPT_RDO_COST_MODE		BIT(20)
+
+	s8 beta_offset;
+	s8 tc_offset;
+	u16 reserved10;
+	u32 unknown11;
+	u32 unknown12;
+	u16 num_slices;
+	u16 prefetch_auto;
+	u32 prefetch_mem_offset;
+	u32 prefetch_mem_size;
+	u16 clip_hrz_range;
+	u16 clip_vrt_range;
+	u16 me_range[4];
+	u8 max_cu_size;
+	u8 min_cu_size;
+	u8 max_tu_size;
+	u8 min_tu_size;
+	u8 max_transfo_depth_inter;
+	u8 max_transfo_depth_intra;
+	u16 reserved20;
+	u32 entropy_mode;
+	u32 wp_mode;
+
+	/* rate control param */
+	u32 rate_control_mode;
+	u32 initial_rem_delay;
+	u32 cpb_size;
+	u16 framerate;
+	u16 clk_ratio;
+	u32 target_bitrate;
+	u32 max_bitrate;
+	u16 initial_qp;
+	u16 min_qp;
+	u16 max_qp;
+	s16 ip_delta;
+	s16 pb_delta;
+	u16 golden_ref;
+	u16 golden_delta;
+	u16 golden_ref_frequency;
+	u32 rate_control_option;
+
+	/* gop param */
+	u32 gop_ctrl_mode;
+	u32 freq_idr;
+	u32 freq_lt;
+	u32 gdr_mode;
+	u16 gop_length;
+	u8 num_b;
+	u8 freq_golden_ref;
+
+	u32 subframe_latency;
+	u32 lda_control_mode;
+	u32 unknown41;
+} __attribute__ ((__packed__));
+
+struct mcu_msg_create_channel_response {
+	struct mcu_msg_header header;
+	u32 channel_id;
+	u32 user_id;
+	u32 options;
+	u32 num_core;
+	u32 pps_param;
+	u32 int_buffers_count;
+	u32 int_buffers_size;
+	u32 rec_buffers_count;
+	u32 rec_buffers_size;
+	u32 reserved;
+	u32 error_code;
+} __attribute__ ((__packed__));
+
+struct mcu_msg_destroy_channel {
+	struct mcu_msg_header header;
+	u32 channel_id;
+} __attribute__ ((__packed__));
+
+struct mcu_msg_destroy_channel_response {
+	struct mcu_msg_header header;
+	u32 channel_id;
+} __attribute__ ((__packed__));
+
+struct mcu_msg_push_buffers_internal_buffer {
+	u32 dma_addr;
+	u32 mcu_addr;
+	u32 size;
+} __attribute__ ((__packed__));
+
+struct mcu_msg_push_buffers_internal {
+	struct mcu_msg_header header;
+	u32 channel_id;
+	struct mcu_msg_push_buffers_internal_buffer buffer[0];
+} __attribute__ ((__packed__));
+
+struct mcu_msg_put_stream_buffer {
+	struct mcu_msg_header header;
+	u32 channel_id;
+	u32 dma_addr;
+	u32 mcu_addr;
+	u32 size;
+	u32 offset;
+	u64 stream_id;
+} __attribute__ ((__packed__));
+
+struct mcu_msg_encode_frame {
+	struct mcu_msg_header header;
+	u32 channel_id;
+	u32 reserved;
+
+	u32 encoding_options;
+#define AL_OPT_USE_QP_TABLE		BIT(0)
+#define AL_OPT_FORCE_LOAD		BIT(1)
+#define AL_OPT_USE_L2			BIT(2)
+#define AL_OPT_DISABLE_INTRA		BIT(3)
+#define AL_OPT_DEPENDENT_SLICES		BIT(4)
+
+	s16 pps_qp;
+	u16 padding;
+	u64 user_param;
+	u64 src_handle;
+
+	u32 request_options;
+#define AL_OPT_SCENE_CHANGE		BIT(0)
+#define AL_OPT_RESTART_GOP		BIT(1)
+#define AL_OPT_USE_LONG_TERM		BIT(2)
+#define AL_OPT_UPDATE_PARAMS		BIT(3)
+
+	/* u32 scene_change_delay (optional) */
+	/* rate control param (optional) */
+	/* gop param (optional) */
+	u32 src_y;
+	u32 src_uv;
+	u32 stride;
+	u32 ep2;
+	u64 ep2_v;
+} __attribute__ ((__packed__));
+
+struct mcu_msg_encode_frame_response {
+	struct mcu_msg_header header;
+	u32 channel_id;
+	u64 stream_id;		/* see mcu_msg_put_stream_buffer */
+	u64 user_param;		/* see mcu_msg_encode_frame */
+	u64 src_handle;		/* see mcu_msg_encode_frame */
+	u16 skip;
+	u16 is_ref;
+	u32 initial_removal_delay;
+	u32 dpb_output_delay;
+	u32 size;
+	u32 frame_tag_size;
+	s32 stuffing;
+	s32 filler;
+	u16 num_column;
+	u16 num_row;
+	u16 qp;
+	u8 num_ref_idx_l0;
+	u8 num_ref_idx_l1;
+	u32 partition_table_offset;
+	s32 partition_table_size;
+	u32 sum_complex;
+	s32 tile_width[4];
+	s32 tile_height[22];
+	u32 error_code;
+
+	u32 slice_type;
+#define AL_ENC_SLICE_TYPE_B             0
+#define AL_ENC_SLICE_TYPE_P             1
+#define AL_ENC_SLICE_TYPE_I             2
+
+	u32 pic_struct;
+	u8 is_idr;
+	u8 is_first_slice;
+	u8 is_last_slice;
+	u8 reserved;
+	u16 pps_qp;
+	u16 reserved1;
+	u32 reserved2;
+} __attribute__ ((__packed__));
+
+union mcu_msg_response {
+	struct mcu_msg_header header;
+	struct mcu_msg_init_response init;
+	struct mcu_msg_create_channel_response create_channel;
+	struct mcu_msg_destroy_channel_response destroy_channel;
+	struct mcu_msg_encode_frame_response encode_frame;
+};
+
+#endif
-- 
2.20.1

