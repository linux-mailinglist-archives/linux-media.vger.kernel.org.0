Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC34A1BBC5
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2019 19:21:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731561AbfEMRVh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 May 2019 13:21:37 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:49555 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731505AbfEMRVg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 May 2019 13:21:36 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <mtr@pengutronix.de>)
        id 1hQEdq-0008VU-Ve; Mon, 13 May 2019 19:21:34 +0200
Received: from mtr by dude02.lab.pengutronix.de with local (Exim 4.89)
        (envelope-from <mtr@pengutronix.de>)
        id 1hQEdp-0003vp-C5; Mon, 13 May 2019 19:21:33 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     kernel@pengutronix.de, robh+dt@kernel.org, mchehab@kernel.org,
        tfiga@chromium.org, dshah@xilinx.com, hverkuil@xs4all.nl,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH v6 5/5] [media] allegro: add SPS/PPS nal unit writer
Date:   Mon, 13 May 2019 19:21:31 +0200
Message-Id: <20190513172131.15048-6-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190513172131.15048-1-m.tretter@pengutronix.de>
References: <20190513172131.15048-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The allegro hardware encoder does not write SPS/PPS nal units into the
encoded video stream. Therefore, we need to write the units in software.

The implementation follows Rec. ITU-T H.264 (04/2017) to allow to
convert between a C struct and the RBSP representation of the SPS and
PPS nal units.

The allegro driver writes the nal units into the v4l2 capture buffer in
front of the actual video data which is written at an offset by the IP
core. The remaining gap is filled with a filler nal unit.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
v5 -> v6:
- fix sparse warnings regarding non-static functions
- fix return type of rbsp_read_bit

v4 -> v5:
- completely rework implementation
- move out of staging

v3 -> v4:
- fix compiler warnings regarding printing size_t
- add documentation for nal_h264.h

v2 -> v3:
none

v1 -> v2:
- clean up debug log levels
- fix missing error handling in allegro_h264_write_sps
- enable configuration of frame size
- enable configuration of bit rate and CPB size
---
 drivers/media/platform/allegro-dvt/Makefile   |    4 +-
 .../media/platform/allegro-dvt/allegro-core.c |  182 ++-
 drivers/media/platform/allegro-dvt/nal-h264.c | 1001 +++++++++++++++++
 drivers/media/platform/allegro-dvt/nal-h264.h |  208 ++++
 4 files changed, 1393 insertions(+), 2 deletions(-)
 create mode 100644 drivers/media/platform/allegro-dvt/nal-h264.c
 create mode 100644 drivers/media/platform/allegro-dvt/nal-h264.h

diff --git a/drivers/media/platform/allegro-dvt/Makefile b/drivers/media/platform/allegro-dvt/Makefile
index bc30addee47f..eee9713c10e3 100644
--- a/drivers/media/platform/allegro-dvt/Makefile
+++ b/drivers/media/platform/allegro-dvt/Makefile
@@ -1,4 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
-allegro-objs := allegro-core.o
+ccflags-y += -I$(src)
+
+allegro-objs := allegro-core.o nal-h264.o
 
 obj-$(CONFIG_VIDEO_ALLEGRO_DVT) += allegro.o
diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index cdfbc736d018..107674e54ec4 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -26,6 +26,8 @@
 #include <media/videobuf2-dma-contig.h>
 #include <media/videobuf2-v4l2.h>
 
+#include "nal-h264.h"
+
 /*
  * Support up to 4k video streams. The hardware actually supports higher
  * resolutions, which are specified in PG252 June 6, 2018 (H.264/H.265 Video
@@ -1313,6 +1315,131 @@ static int allocate_reference_buffers(struct allegro_channel *channel,
 					 n, PAGE_ALIGN(size));
 }
 
+static ssize_t allegro_h264_write_sps(struct allegro_channel *channel,
+				      void *dest, size_t n)
+{
+	struct allegro_dev *dev = channel->dev;
+	struct nal_h264_sps *sps;
+	ssize_t size;
+	unsigned int size_mb = SIZE_MACROBLOCK;
+	/* Calculation of crop units in Rec. ITU-T H.264 (04/2017) p. 76 */
+	unsigned int crop_unit_x = 2;
+	unsigned int crop_unit_y = 2;
+
+	sps = kzalloc(sizeof(*sps), GFP_KERNEL);
+	if (!sps)
+		return -ENOMEM;
+
+	sps->profile_idc = nal_h264_profile_from_v4l2(channel->profile);
+	sps->constraint_set0_flag = 0;
+	sps->constraint_set1_flag = 1;
+	sps->constraint_set2_flag = 0;
+	sps->constraint_set3_flag = 0;
+	sps->constraint_set4_flag = 0;
+	sps->constraint_set5_flag = 0;
+	sps->level_idc = nal_h264_level_from_v4l2(channel->level);
+	sps->seq_parameter_set_id = 0;
+	sps->log2_max_frame_num_minus4 = 0;
+	sps->pic_order_cnt_type = 0;
+	sps->log2_max_pic_order_cnt_lsb_minus4 = 6;
+	sps->max_num_ref_frames = 3;
+	sps->gaps_in_frame_num_value_allowed_flag = 0;
+	sps->pic_width_in_mbs_minus1 =
+		DIV_ROUND_UP(channel->width, size_mb) - 1;
+	sps->pic_height_in_map_units_minus1 =
+		DIV_ROUND_UP(channel->height, size_mb) - 1;
+	sps->frame_mbs_only_flag = 1;
+	sps->mb_adaptive_frame_field_flag = 0;
+	sps->direct_8x8_inference_flag = 1;
+	sps->frame_cropping_flag =
+		(channel->width % size_mb) || (channel->height % size_mb);
+	if (sps->frame_cropping_flag) {
+		sps->crop_left = 0;
+		sps->crop_right = (round_up(channel->width, size_mb) - channel->width) / crop_unit_x;
+		sps->crop_top = 0;
+		sps->crop_bottom = (round_up(channel->height, size_mb) - channel->height) / crop_unit_y;
+	}
+	sps->vui_parameters_present_flag = 1;
+	sps->vui.aspect_ratio_info_present_flag = 0;
+	sps->vui.overscan_info_present_flag = 0;
+	sps->vui.video_signal_type_present_flag = 1;
+	sps->vui.video_format = 1;
+	sps->vui.video_full_range_flag = 0;
+	sps->vui.colour_description_present_flag = 1;
+	sps->vui.colour_primaries = 5;
+	sps->vui.transfer_characteristics = 5;
+	sps->vui.matrix_coefficients = 5;
+	sps->vui.chroma_loc_info_present_flag = 1;
+	sps->vui.chroma_sample_loc_type_top_field = 0;
+	sps->vui.chroma_sample_loc_type_bottom_field = 0;
+	sps->vui.timing_info_present_flag = 1;
+	sps->vui.num_units_in_tick = 1;
+	sps->vui.time_scale = 50;
+	sps->vui.fixed_frame_rate_flag = 1;
+	sps->vui.nal_hrd_parameters_present_flag = 0;
+	sps->vui.vcl_hrd_parameters_present_flag = 1;
+	sps->vui.vcl_hrd_parameters.cpb_cnt_minus1 = 0;
+	sps->vui.vcl_hrd_parameters.bit_rate_scale = 0;
+	sps->vui.vcl_hrd_parameters.cpb_size_scale = 1;
+	/* See Rec. ITU-T H.264 (04/2017) p. 410 E-53 */
+	sps->vui.vcl_hrd_parameters.bit_rate_value_minus1[0] =
+		channel->bitrate_peak / (1 << (6 + sps->vui.vcl_hrd_parameters.bit_rate_scale)) - 1;
+	/* See Rec. ITU-T H.264 (04/2017) p. 410 E-54 */
+	sps->vui.vcl_hrd_parameters.cpb_size_value_minus1[0] =
+		(channel->cpb_size * 1000) / (1 << (4 + sps->vui.vcl_hrd_parameters.cpb_size_scale)) - 1;
+	sps->vui.vcl_hrd_parameters.cbr_flag[0] = 1;
+	sps->vui.vcl_hrd_parameters.initial_cpb_removal_delay_length_minus1 = 31;
+	sps->vui.vcl_hrd_parameters.cpb_removal_delay_length_minus1 = 31;
+	sps->vui.vcl_hrd_parameters.dpb_output_delay_length_minus1 = 31;
+	sps->vui.vcl_hrd_parameters.time_offset_length = 0;
+	sps->vui.low_delay_hrd_flag = 0;
+	sps->vui.pic_struct_present_flag = 1;
+	sps->vui.bitstream_restriction_flag = 0;
+
+	size = nal_h264_write_sps(&dev->plat_dev->dev, dest, n, sps);
+
+	kfree(sps);
+
+	return size;
+}
+
+static ssize_t allegro_h264_write_pps(struct allegro_channel *channel,
+				      void *dest, size_t n)
+{
+	struct allegro_dev *dev = channel->dev;
+	struct nal_h264_pps *pps;
+	ssize_t size;
+
+	pps = kzalloc(sizeof(*pps), GFP_KERNEL);
+	if (!pps)
+		return -ENOMEM;
+
+	pps->pic_parameter_set_id = 0;
+	pps->seq_parameter_set_id = 0;
+	pps->entropy_coding_mode_flag = 0;
+	pps->bottom_field_pic_order_in_frame_present_flag = 0;
+	pps->num_slice_groups_minus1 = 0;
+	pps->num_ref_idx_l0_default_active_minus1 = 2;
+	pps->num_ref_idx_l1_default_active_minus1 = 2;
+	pps->weighted_pred_flag = 0;
+	pps->weighted_bipred_idc = 0;
+	pps->pic_init_qp_minus26 = 0;
+	pps->pic_init_qs_minus26 = 0;
+	pps->chroma_qp_index_offset = 0;
+	pps->deblocking_filter_control_present_flag = 1;
+	pps->constrained_intra_pred_flag = 0;
+	pps->redundant_pic_cnt_present_flag = 0;
+	pps->transform_8x8_mode_flag = 0;
+	pps->pic_scaling_matrix_present_flag = 0;
+	pps->second_chroma_qp_index_offset = 0;
+
+	size = nal_h264_write_pps(&dev->plat_dev->dev, dest, n, pps);
+
+	kfree(pps);
+
+	return size;
+}
+
 static bool allegro_channel_is_at_eos(struct allegro_channel *channel)
 {
 	bool is_at_eos = false;
@@ -1362,6 +1489,9 @@ static void allegro_channel_finish_frame(struct allegro_channel *channel,
 		u32 size;
 	} *partition;
 	enum vb2_buffer_state state = VB2_BUF_STATE_ERROR;
+	char *curr;
+	ssize_t len;
+	ssize_t free;
 
 	src_buf = v4l2_m2m_src_buf_remove(channel->fh.m2m_ctx);
 
@@ -1409,10 +1539,60 @@ static void allegro_channel_finish_frame(struct allegro_channel *channel,
 	 * The payload must include the data before the partition offset,
 	 * because we will put the sps and pps data there.
 	 */
-
 	vb2_set_plane_payload(&dst_buf->vb2_buf, 0,
 			      partition->offset + partition->size);
 
+	curr = vb2_plane_vaddr(&dst_buf->vb2_buf, 0);
+	free = partition->offset;
+	if (msg->is_idr) {
+		len = allegro_h264_write_sps(channel, curr, free);
+		if (len < 0) {
+			v4l2_err(&dev->v4l2_dev,
+				 "not enough space for sequence parameter set: %zd left\n",
+				 free);
+			goto err;
+		}
+		curr += len;
+		free -= len;
+		v4l2_dbg(1, debug, &dev->v4l2_dev,
+			 "channel %d: wrote %zd byte SPS nal unit\n",
+			 channel->mcu_channel_id, len);
+	}
+
+	if (msg->slice_type == AL_ENC_SLICE_TYPE_I) {
+		len = allegro_h264_write_pps(channel, curr, free);
+		if (len < 0) {
+			v4l2_err(&dev->v4l2_dev,
+				 "not enough space for picture parameter set: %zd left\n",
+				 free);
+			goto err;
+		}
+		curr += len;
+		free -= len;
+		v4l2_dbg(1, debug, &dev->v4l2_dev,
+			 "channel %d: wrote %zd byte PPS nal unit\n",
+			 channel->mcu_channel_id, len);
+	}
+
+	len = nal_h264_write_filler(&dev->plat_dev->dev, curr, free);
+	if (len < 0) {
+		v4l2_err(&dev->v4l2_dev,
+			 "failed to write %zd filler data\n", free);
+		goto err;
+	}
+	curr += len;
+	free -= len;
+	v4l2_dbg(2, debug, &dev->v4l2_dev,
+		 "channel %d: wrote %zd bytes filler nal unit\n",
+		 channel->mcu_channel_id, len);
+
+	if (free != 0) {
+		v4l2_err(&dev->v4l2_dev,
+			 "non-VCL NAL units do not fill space until VCL NAL unit: %zd bytes left\n",
+			 free);
+		goto err;
+	}
+
 	state = VB2_BUF_STATE_DONE;
 
 	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, false);
diff --git a/drivers/media/platform/allegro-dvt/nal-h264.c b/drivers/media/platform/allegro-dvt/nal-h264.c
new file mode 100644
index 000000000000..94e25e00401a
--- /dev/null
+++ b/drivers/media/platform/allegro-dvt/nal-h264.c
@@ -0,0 +1,1001 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 Pengutronix, Michael Tretter <kernel@pengutronix.de>
+ *
+ * Convert NAL units between raw byte sequence payloads (RBSP) and C structs
+ *
+ * The conversion is defined in "ITU-T Rec. H.264 (04/2017) Advanced video
+ * coding for generic audiovisual services". Decoder drivers may use the
+ * parser to parse RBSP from encoded streams and configure the hardware, if
+ * the hardware is not able to parse RBSP itself.  Encoder drivers may use the
+ * generator to generate the RBSP for SPS/PPS nal units and add them to the
+ * encoded stream if the hardware does not generate the units.
+ */
+
+#include <linux/kernel.h>
+#include <linux/types.h>
+#include <linux/string.h>
+#include <linux/v4l2-controls.h>
+
+#include <linux/device.h>
+#include <linux/export.h>
+#include <linux/log2.h>
+
+#include <nal-h264.h>
+
+/*
+ * See Rec. ITU-T H.264 (04/2017) Table 7-1 – NAL unit type codes, syntax
+ * element categories, and NAL unit type classes
+ */
+enum nal_unit_type {
+	SEQUENCE_PARAMETER_SET = 7,
+	PICTURE_PARAMETER_SET = 8,
+	FILLER_DATA = 12,
+};
+
+struct rbsp;
+
+struct nal_h264_ops {
+	int (*rbsp_bit)(struct rbsp *rbsp, int *val);
+	int (*rbsp_bits)(struct rbsp *rbsp, int n, unsigned int *val);
+	int (*rbsp_uev)(struct rbsp *rbsp, unsigned int *val);
+	int (*rbsp_sev)(struct rbsp *rbsp, int *val);
+};
+
+/**
+ * struct rbsp - State object for handling a raw byte sequence payload
+ * @data: pointer to the data of the rbsp
+ * @size: maximum size of the data of the rbsp
+ * @pos: current bit position inside the rbsp
+ * @num_consecutive_zeros: number of zeros before @pos
+ * @ops: per datatype functions for interacting with the rbsp
+ * @error: an error occurred while handling the rbsp
+ *
+ * This struct is passed around the various parsing functions and tracks the
+ * current position within the raw byte sequence payload.
+ *
+ * The @ops field allows to separate the operation, i.e., reading/writing a
+ * value from/to that rbsp, from the structure of the NAL unit. This allows to
+ * have a single function for iterating the NAL unit, while @ops has function
+ * pointers for handling each type in the rbsp.
+ */
+struct rbsp {
+	u8 *data;
+	size_t size;
+	unsigned int pos;
+	unsigned int num_consecutive_zeros;
+	struct nal_h264_ops *ops;
+	int error;
+};
+
+static void rbsp_init(struct rbsp *rbsp, void *addr, size_t size,
+		      struct nal_h264_ops *ops)
+{
+	if (!rbsp)
+		return;
+
+	rbsp->data = addr;
+	rbsp->size = size;
+	rbsp->pos = 0;
+	rbsp->ops = ops;
+	rbsp->error = 0;
+}
+
+/**
+ * nal_h264_profile_from_v4l2() - Get profile_idc for v4l2 h264 profile
+ * @profile: the profile as &enum v4l2_mpeg_video_h264_profile
+ *
+ * Convert the &enum v4l2_mpeg_video_h264_profile to profile_idc as specified
+ * in Rec. ITU-T H.264 (04/2017) A.2.
+ *
+ * Return: the profile_idc for the passed level
+ */
+int nal_h264_profile_from_v4l2(enum v4l2_mpeg_video_h264_profile profile)
+{
+	switch (profile) {
+	case V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE:
+		return 66;
+	case V4L2_MPEG_VIDEO_H264_PROFILE_MAIN:
+		return 77;
+	case V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED:
+		return 88;
+	case V4L2_MPEG_VIDEO_H264_PROFILE_HIGH:
+		return 100;
+	default:
+		return -EINVAL;
+	}
+}
+
+/**
+ * nal_h264_level_from_v4l2() - Get level_idc for v4l2 h264 level
+ * @level: the level as &enum v4l2_mpeg_video_h264_level
+ *
+ * Convert the &enum v4l2_mpeg_video_h264_level to level_idc as specified in
+ * Rec. ITU-T H.264 (04/2017) A.3.2.
+ *
+ * Return: the level_idc for the passed level
+ */
+int nal_h264_level_from_v4l2(enum v4l2_mpeg_video_h264_level level)
+{
+	switch (level) {
+	case V4L2_MPEG_VIDEO_H264_LEVEL_1_0:
+		return 10;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_1B:
+		return 9;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_1_1:
+		return 11;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_1_2:
+		return 12;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_1_3:
+		return 13;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_2_0:
+		return 20;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_2_1:
+		return 21;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_2_2:
+		return 22;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_3_0:
+		return 30;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_3_1:
+		return 31;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_3_2:
+		return 32;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_4_0:
+		return 40;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_4_1:
+		return 41;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_4_2:
+		return 42;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_5_0:
+		return 50;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_5_1:
+		return 51;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int rbsp_read_bits(struct rbsp *rbsp, int n, unsigned int *value);
+static int rbsp_write_bits(struct rbsp *rbsp, int n, unsigned int value);
+
+/*
+ * When reading or writing, the emulation_prevention_three_byte is detected
+ * only when the 2 one bits need to be inserted. Therefore, we are not
+ * actually adding the 0x3 byte, but the 2 one bits and the six 0 bits of the
+ * next byte.
+ */
+#define EMULATION_PREVENTION_THREE_BYTE (0x3 << 6)
+
+static int add_emulation_prevention_three_byte(struct rbsp *rbsp)
+{
+	rbsp->num_consecutive_zeros = 0;
+	rbsp_write_bits(rbsp, 8, EMULATION_PREVENTION_THREE_BYTE);
+
+	return 0;
+}
+
+static int discard_emulation_prevention_three_byte(struct rbsp *rbsp)
+{
+	unsigned int tmp = 0;
+
+	rbsp->num_consecutive_zeros = 0;
+	rbsp_read_bits(rbsp, 8, &tmp);
+	if (tmp != EMULATION_PREVENTION_THREE_BYTE)
+		return -EINVAL;
+
+	return 0;
+}
+
+static inline int rbsp_read_bit(struct rbsp *rbsp)
+{
+	int shift;
+	int ofs;
+	int bit;
+	int err;
+
+	if (rbsp->num_consecutive_zeros == 22) {
+		err = discard_emulation_prevention_three_byte(rbsp);
+		if (err)
+			return err;
+	}
+
+	shift = 7 - (rbsp->pos % 8);
+	ofs = rbsp->pos / 8;
+	if (ofs >= rbsp->size)
+		return -EINVAL;
+
+	bit = (rbsp->data[ofs] >> shift) & 1;
+
+	rbsp->pos++;
+
+	if (bit == 1 ||
+	    (rbsp->num_consecutive_zeros < 7 && (rbsp->pos % 8 == 0)))
+		rbsp->num_consecutive_zeros = 0;
+	else
+		rbsp->num_consecutive_zeros++;
+
+	return bit;
+}
+
+static inline int rbsp_write_bit(struct rbsp *rbsp, bool value)
+{
+	int shift;
+	int ofs;
+
+	if (rbsp->num_consecutive_zeros == 22)
+		add_emulation_prevention_three_byte(rbsp);
+
+	shift = 7 - (rbsp->pos % 8);
+	ofs = rbsp->pos / 8;
+	if (ofs >= rbsp->size)
+		return -EINVAL;
+
+	rbsp->data[ofs] &= ~(1 << shift);
+	rbsp->data[ofs] |= value << shift;
+
+	rbsp->pos++;
+
+	if (value == 1 ||
+	    (rbsp->num_consecutive_zeros < 7 && (rbsp->pos % 8 == 0))) {
+		rbsp->num_consecutive_zeros = 0;
+	} else {
+		rbsp->num_consecutive_zeros++;
+	}
+
+	return 0;
+}
+
+static inline int rbsp_read_bits(struct rbsp *rbsp, int n, unsigned int *value)
+{
+	int i;
+	int bit;
+	unsigned int tmp = 0;
+
+	if (n > 8 * sizeof(*value))
+		return -EINVAL;
+
+	for (i = n; i > 0; i--) {
+		bit = rbsp_read_bit(rbsp);
+		if (bit < 0)
+			return bit;
+		tmp |= bit << (i - 1);
+	}
+
+	if (value)
+		*value = tmp;
+
+	return 0;
+}
+
+static int rbsp_write_bits(struct rbsp *rbsp, int n, unsigned int value)
+{
+	int ret;
+
+	if (n > 8 * sizeof(value))
+		return -EINVAL;
+
+	while (n--) {
+		ret = rbsp_write_bit(rbsp, (value >> n) & 1);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int rbsp_read_uev(struct rbsp *rbsp, unsigned int *value)
+{
+	int leading_zero_bits = 0;
+	unsigned int tmp = 0;
+	int ret;
+
+	while ((ret = rbsp_read_bit(rbsp)) == 0)
+		leading_zero_bits++;
+	if (ret < 0)
+		return ret;
+
+	if (leading_zero_bits > 0) {
+		ret = rbsp_read_bits(rbsp, leading_zero_bits, &tmp);
+		if (ret)
+			return ret;
+	}
+
+	if (value)
+		*value = (1 << leading_zero_bits) - 1 + tmp;
+
+	return 0;
+}
+
+static int rbsp_write_uev(struct rbsp *rbsp, unsigned int *value)
+{
+	int ret;
+	int leading_zero_bits;
+
+	if (!value)
+		return -EINVAL;
+
+	leading_zero_bits = ilog2(*value + 1);
+
+	ret = rbsp_write_bits(rbsp, leading_zero_bits, 0);
+	if (ret)
+		return ret;
+
+	return rbsp_write_bits(rbsp, leading_zero_bits + 1, *value + 1);
+}
+
+static int rbsp_read_sev(struct rbsp *rbsp, int *value)
+{
+	int ret;
+	unsigned int tmp;
+
+	ret = rbsp_read_uev(rbsp, &tmp);
+	if (ret)
+		return ret;
+
+	if (value) {
+		if (tmp & 1)
+			*value = (tmp + 1) / 2;
+		else
+			*value = -(tmp / 2);
+	}
+
+	return 0;
+}
+
+static int rbsp_write_sev(struct rbsp *rbsp, int *value)
+{
+	unsigned int tmp;
+
+	if (!value)
+		return -EINVAL;
+
+	if (*value > 0)
+		tmp = (2 * (*value)) | 1;
+	else
+		tmp = -2 * (*value);
+
+	return rbsp_write_uev(rbsp, &tmp);
+}
+
+static int __rbsp_write_bit(struct rbsp *rbsp, int *value)
+{
+	return rbsp_write_bit(rbsp, *value);
+}
+
+static int __rbsp_write_bits(struct rbsp *rbsp, int n, unsigned int *value)
+{
+	return rbsp_write_bits(rbsp, n, *value);
+}
+
+static struct nal_h264_ops write = {
+	.rbsp_bit = __rbsp_write_bit,
+	.rbsp_bits = __rbsp_write_bits,
+	.rbsp_uev = rbsp_write_uev,
+	.rbsp_sev = rbsp_write_sev,
+};
+
+static int __rbsp_read_bit(struct rbsp *rbsp, int *value)
+{
+	int tmp = rbsp_read_bit(rbsp);
+
+	if (tmp < 0)
+		return tmp;
+	*value = tmp;
+
+	return 0;
+}
+
+static struct nal_h264_ops read = {
+	.rbsp_bit = __rbsp_read_bit,
+	.rbsp_bits = rbsp_read_bits,
+	.rbsp_uev = rbsp_read_uev,
+	.rbsp_sev = rbsp_read_sev,
+};
+
+static inline void rbsp_bit(struct rbsp *rbsp, int *value)
+{
+	if (rbsp->error)
+		return;
+	rbsp->error = rbsp->ops->rbsp_bit(rbsp, value);
+}
+
+static inline void rbsp_bits(struct rbsp *rbsp, int n, int *value)
+{
+	if (rbsp->error)
+		return;
+	rbsp->error = rbsp->ops->rbsp_bits(rbsp, n, value);
+}
+
+static inline void rbsp_uev(struct rbsp *rbsp, unsigned int *value)
+{
+	if (rbsp->error)
+		return;
+	rbsp->error = rbsp->ops->rbsp_uev(rbsp, value);
+}
+
+static inline void rbsp_sev(struct rbsp *rbsp, int *value)
+{
+	if (rbsp->error)
+		return;
+	rbsp->error = rbsp->ops->rbsp_sev(rbsp, value);
+}
+
+static void nal_h264_rbsp_trailing_bits(struct rbsp *rbsp)
+{
+	unsigned int rbsp_stop_one_bit = 1;
+	unsigned int rbsp_alignment_zero_bit = 0;
+
+	rbsp_bit(rbsp, &rbsp_stop_one_bit);
+	rbsp_bits(rbsp, round_up(rbsp->pos, 8) - rbsp->pos,
+		  &rbsp_alignment_zero_bit);
+}
+
+static void nal_h264_write_start_code_prefix(struct rbsp *rbsp)
+{
+	u8 *p = rbsp->data + DIV_ROUND_UP(rbsp->pos, 8);
+	int i = 4;
+
+	if (DIV_ROUND_UP(rbsp->pos, 8) + i > rbsp->size) {
+		rbsp->error = -EINVAL;
+		return;
+	}
+
+	p[0] = 0x00;
+	p[1] = 0x00;
+	p[2] = 0x00;
+	p[3] = 0x01;
+
+	rbsp->pos += i * 8;
+}
+
+static void nal_h264_read_start_code_prefix(struct rbsp *rbsp)
+{
+	u8 *p = rbsp->data + DIV_ROUND_UP(rbsp->pos, 8);
+	int i = 4;
+
+	if (DIV_ROUND_UP(rbsp->pos, 8) + i > rbsp->size) {
+		rbsp->error = -EINVAL;
+		return;
+	}
+
+	if (p[0] != 0x00 || p[1] != 0x00 || p[2] != 0x00 || p[3] != 0x01) {
+		rbsp->error = -EINVAL;
+		return;
+	}
+
+	rbsp->pos += i * 8;
+}
+
+static void nal_h264_write_filler_data(struct rbsp *rbsp)
+{
+	u8 *p = rbsp->data + DIV_ROUND_UP(rbsp->pos, 8);
+	int i;
+
+	/* Keep 1 byte extra for terminating the NAL unit */
+	i = rbsp->size - DIV_ROUND_UP(rbsp->pos, 8) - 1;
+	memset(p, 0xff, i);
+	rbsp->pos += i * 8;
+}
+
+static void nal_h264_read_filler_data(struct rbsp *rbsp)
+{
+	u8 *p = rbsp->data + DIV_ROUND_UP(rbsp->pos, 8);
+
+	while (*p == 0xff) {
+		if (DIV_ROUND_UP(rbsp->pos, 8) > rbsp->size) {
+			rbsp->error = -EINVAL;
+			return;
+		}
+
+		p++;
+		rbsp->pos += 8;
+	}
+}
+
+static void nal_h264_rbsp_hrd_parameters(struct rbsp *rbsp,
+					 struct nal_h264_hrd_parameters *hrd)
+{
+	unsigned int i;
+
+	if (!hrd) {
+		rbsp->error = -EINVAL;
+		return;
+	}
+
+	rbsp_uev(rbsp, &hrd->cpb_cnt_minus1);
+	rbsp_bits(rbsp, 4, &hrd->bit_rate_scale);
+	rbsp_bits(rbsp, 4, &hrd->cpb_size_scale);
+
+	for (i = 0; i <= hrd->cpb_cnt_minus1; i++) {
+		rbsp_uev(rbsp, &hrd->bit_rate_value_minus1[i]);
+		rbsp_uev(rbsp, &hrd->cpb_size_value_minus1[i]);
+		rbsp_bit(rbsp, &hrd->cbr_flag[i]);
+	}
+
+	rbsp_bits(rbsp, 5, &hrd->initial_cpb_removal_delay_length_minus1);
+	rbsp_bits(rbsp, 5, &hrd->cpb_removal_delay_length_minus1);
+	rbsp_bits(rbsp, 5, &hrd->dpb_output_delay_length_minus1);
+	rbsp_bits(rbsp, 5, &hrd->time_offset_length);
+}
+
+static void nal_h264_rbsp_vui_parameters(struct rbsp *rbsp,
+					 struct nal_h264_vui_parameters *vui)
+{
+	if (!vui) {
+		rbsp->error = -EINVAL;
+		return;
+	}
+
+	rbsp_bit(rbsp, &vui->aspect_ratio_info_present_flag);
+	if (vui->aspect_ratio_info_present_flag) {
+		rbsp_bits(rbsp, 8, &vui->aspect_ratio_idc);
+		if (vui->aspect_ratio_idc == 255) {
+			rbsp_bits(rbsp, 16, &vui->sar_width);
+			rbsp_bits(rbsp, 16, &vui->sar_height);
+		}
+	}
+
+	rbsp_bit(rbsp, &vui->overscan_info_present_flag);
+	if (vui->overscan_info_present_flag)
+		rbsp_bit(rbsp, &vui->overscan_appropriate_flag);
+
+	rbsp_bit(rbsp, &vui->video_signal_type_present_flag);
+	if (vui->video_signal_type_present_flag) {
+		rbsp_bits(rbsp, 3, &vui->video_format);
+		rbsp_bit(rbsp, &vui->video_full_range_flag);
+
+		rbsp_bit(rbsp, &vui->colour_description_present_flag);
+		if (vui->colour_description_present_flag) {
+			rbsp_bits(rbsp, 8, &vui->colour_primaries);
+			rbsp_bits(rbsp, 8, &vui->transfer_characteristics);
+			rbsp_bits(rbsp, 8, &vui->matrix_coefficients);
+		}
+	}
+
+	rbsp_bit(rbsp, &vui->chroma_loc_info_present_flag);
+	if (vui->chroma_loc_info_present_flag) {
+		rbsp_uev(rbsp, &vui->chroma_sample_loc_type_top_field);
+		rbsp_uev(rbsp, &vui->chroma_sample_loc_type_bottom_field);
+	}
+
+	rbsp_bit(rbsp, &vui->timing_info_present_flag);
+	if (vui->timing_info_present_flag) {
+		rbsp_bits(rbsp, 32, &vui->num_units_in_tick);
+		rbsp_bits(rbsp, 32, &vui->time_scale);
+		rbsp_bit(rbsp, &vui->fixed_frame_rate_flag);
+	}
+
+	rbsp_bit(rbsp, &vui->nal_hrd_parameters_present_flag);
+	if (vui->nal_hrd_parameters_present_flag)
+		nal_h264_rbsp_hrd_parameters(rbsp, &vui->nal_hrd_parameters);
+
+	rbsp_bit(rbsp, &vui->vcl_hrd_parameters_present_flag);
+	if (vui->vcl_hrd_parameters_present_flag)
+		nal_h264_rbsp_hrd_parameters(rbsp, &vui->vcl_hrd_parameters);
+
+	if (vui->nal_hrd_parameters_present_flag ||
+	    vui->vcl_hrd_parameters_present_flag)
+		rbsp_bit(rbsp, &vui->low_delay_hrd_flag);
+
+	rbsp_bit(rbsp, &vui->pic_struct_present_flag);
+
+	rbsp_bit(rbsp, &vui->bitstream_restriction_flag);
+	if (vui->bitstream_restriction_flag) {
+		rbsp_bit(rbsp, &vui->motion_vectors_over_pic_boundaries_flag);
+		rbsp_uev(rbsp, &vui->max_bytes_per_pic_denom);
+		rbsp_uev(rbsp, &vui->max_bits_per_mb_denom);
+		rbsp_uev(rbsp, &vui->log2_max_mv_length_horizontal);
+		rbsp_uev(rbsp, &vui->log21_max_mv_length_vertical);
+		rbsp_uev(rbsp, &vui->max_num_reorder_frames);
+		rbsp_uev(rbsp, &vui->max_dec_frame_buffering);
+	}
+}
+
+static void nal_h264_rbsp_sps(struct rbsp *rbsp, struct nal_h264_sps *sps)
+{
+	unsigned int i;
+
+	if (!sps) {
+		rbsp->error = -EINVAL;
+		return;
+	}
+
+	rbsp_bits(rbsp, 8, &sps->profile_idc);
+	rbsp_bit(rbsp, &sps->constraint_set0_flag);
+	rbsp_bit(rbsp, &sps->constraint_set1_flag);
+	rbsp_bit(rbsp, &sps->constraint_set2_flag);
+	rbsp_bit(rbsp, &sps->constraint_set3_flag);
+	rbsp_bit(rbsp, &sps->constraint_set4_flag);
+	rbsp_bit(rbsp, &sps->constraint_set5_flag);
+	rbsp_bits(rbsp, 2, &sps->reserved_zero_2bits);
+	rbsp_bits(rbsp, 8, &sps->level_idc);
+
+	rbsp_uev(rbsp, &sps->seq_parameter_set_id);
+
+	if (sps->profile_idc == 100 || sps->profile_idc == 110 ||
+	    sps->profile_idc == 122 || sps->profile_idc == 244 ||
+	    sps->profile_idc == 44 || sps->profile_idc == 83 ||
+	    sps->profile_idc == 86 || sps->profile_idc == 118 ||
+	    sps->profile_idc == 128 || sps->profile_idc == 138 ||
+	    sps->profile_idc == 139 || sps->profile_idc == 134 ||
+	    sps->profile_idc == 135) {
+		rbsp_uev(rbsp, &sps->chroma_format_idc);
+
+		if (sps->chroma_format_idc == 3)
+			rbsp_bit(rbsp, &sps->separate_colour_plane_flag);
+		rbsp_uev(rbsp, &sps->bit_depth_luma_minus8);
+		rbsp_uev(rbsp, &sps->bit_depth_chroma_minus8);
+		rbsp_bit(rbsp, &sps->qpprime_y_zero_transform_bypass_flag);
+		rbsp_bit(rbsp, &sps->seq_scaling_matrix_present_flag);
+		if (sps->seq_scaling_matrix_present_flag)
+			rbsp->error = -EINVAL;
+	}
+
+	rbsp_uev(rbsp, &sps->log2_max_frame_num_minus4);
+
+	rbsp_uev(rbsp, &sps->pic_order_cnt_type);
+	switch (sps->pic_order_cnt_type) {
+	case 0:
+		rbsp_uev(rbsp, &sps->log2_max_pic_order_cnt_lsb_minus4);
+		break;
+	case 1:
+		rbsp_bit(rbsp, &sps->delta_pic_order_always_zero_flag);
+		rbsp_sev(rbsp, &sps->offset_for_non_ref_pic);
+		rbsp_sev(rbsp, &sps->offset_for_top_to_bottom_field);
+
+		rbsp_uev(rbsp, &sps->num_ref_frames_in_pic_order_cnt_cycle);
+		for (i = 0; i < sps->num_ref_frames_in_pic_order_cnt_cycle; i++)
+			rbsp_sev(rbsp, &sps->offset_for_ref_frame[i]);
+		break;
+	default:
+		rbsp->error = -EINVAL;
+		break;
+	}
+
+	rbsp_uev(rbsp, &sps->max_num_ref_frames);
+	rbsp_bit(rbsp, &sps->gaps_in_frame_num_value_allowed_flag);
+	rbsp_uev(rbsp, &sps->pic_width_in_mbs_minus1);
+	rbsp_uev(rbsp, &sps->pic_height_in_map_units_minus1);
+
+	rbsp_bit(rbsp, &sps->frame_mbs_only_flag);
+	if (!sps->frame_mbs_only_flag)
+		rbsp_bit(rbsp, &sps->mb_adaptive_frame_field_flag);
+
+	rbsp_bit(rbsp, &sps->direct_8x8_inference_flag);
+
+	rbsp_bit(rbsp, &sps->frame_cropping_flag);
+	if (sps->frame_cropping_flag) {
+		rbsp_uev(rbsp, &sps->crop_left);
+		rbsp_uev(rbsp, &sps->crop_right);
+		rbsp_uev(rbsp, &sps->crop_top);
+		rbsp_uev(rbsp, &sps->crop_bottom);
+	}
+
+	rbsp_bit(rbsp, &sps->vui_parameters_present_flag);
+	if (sps->vui_parameters_present_flag)
+		nal_h264_rbsp_vui_parameters(rbsp, &sps->vui);
+}
+
+static void nal_h264_rbsp_pps(struct rbsp *rbsp, struct nal_h264_pps *pps)
+{
+	int i;
+
+	rbsp_uev(rbsp, &pps->pic_parameter_set_id);
+	rbsp_uev(rbsp, &pps->seq_parameter_set_id);
+	rbsp_bit(rbsp, &pps->entropy_coding_mode_flag);
+	rbsp_bit(rbsp, &pps->bottom_field_pic_order_in_frame_present_flag);
+	rbsp_uev(rbsp, &pps->num_slice_groups_minus1);
+	if (pps->num_slice_groups_minus1 > 0) {
+		rbsp_uev(rbsp, &pps->slice_group_map_type);
+		switch (pps->slice_group_map_type) {
+		case 0:
+			for (i = 0; i < pps->num_slice_groups_minus1; i++)
+				rbsp_uev(rbsp, &pps->run_length_minus1[i]);
+			break;
+		case 2:
+			for (i = 0; i < pps->num_slice_groups_minus1; i++) {
+				rbsp_uev(rbsp, &pps->top_left[i]);
+				rbsp_uev(rbsp, &pps->bottom_right[i]);
+			}
+			break;
+		case 3: case 4: case 5:
+			rbsp_bit(rbsp, &pps->slice_group_change_direction_flag);
+			rbsp_uev(rbsp, &pps->slice_group_change_rate_minus1);
+			break;
+		case 6:
+			rbsp_uev(rbsp, &pps->pic_size_in_map_units_minus1);
+			for (i = 0; i < pps->pic_size_in_map_units_minus1; i++)
+				rbsp_bits(rbsp,
+					  order_base_2(pps->num_slice_groups_minus1 + 1),
+					  &pps->slice_group_id[i]);
+			break;
+		default:
+			break;
+		}
+	}
+	rbsp_uev(rbsp, &pps->num_ref_idx_l0_default_active_minus1);
+	rbsp_uev(rbsp, &pps->num_ref_idx_l1_default_active_minus1);
+	rbsp_bit(rbsp, &pps->weighted_pred_flag);
+	rbsp_bits(rbsp, 2, &pps->weighted_bipred_idc);
+	rbsp_sev(rbsp, &pps->pic_init_qp_minus26);
+	rbsp_sev(rbsp, &pps->pic_init_qs_minus26);
+	rbsp_sev(rbsp, &pps->chroma_qp_index_offset);
+	rbsp_bit(rbsp, &pps->deblocking_filter_control_present_flag);
+	rbsp_bit(rbsp, &pps->constrained_intra_pred_flag);
+	rbsp_bit(rbsp, &pps->redundant_pic_cnt_present_flag);
+	if (/* more_rbsp_data() */ false) {
+		rbsp_bit(rbsp, &pps->transform_8x8_mode_flag);
+		rbsp_bit(rbsp, &pps->pic_scaling_matrix_present_flag);
+		if (pps->pic_scaling_matrix_present_flag)
+			rbsp->error = -EINVAL;
+		rbsp_sev(rbsp, &pps->second_chroma_qp_index_offset);
+	}
+}
+
+/**
+ * nal_h264_write_sps() - Write SPS NAL unit into RBSP format
+ * @dev:
+ * @dest: the buffer that is filled with RBSP data
+ * @n: maximum size of @dest in bytes
+ * @sps: &struct nal_h264_sps to convert to RBSP
+ *
+ * Convert @sps to RBSP data and write it into @dest.
+ *
+ * The size of the SPS NAL unit is not known in advance and this function will
+ * fail, if @dest does not hold sufficient space for the SPS NAL unit.
+ *
+ * Return: number of bytes written to @dest or negative error code
+ */
+ssize_t nal_h264_write_sps(const struct device *dev,
+			   void *dest, size_t n, struct nal_h264_sps *sps)
+{
+	struct rbsp rbsp;
+	unsigned int forbidden_zero_bit = 0;
+	unsigned int nal_ref_idc = 0;
+	unsigned int nal_unit_type = SEQUENCE_PARAMETER_SET;
+
+	if (!dest)
+		return -EINVAL;
+
+	rbsp_init(&rbsp, dest, n, &write);
+
+	nal_h264_write_start_code_prefix(&rbsp);
+
+	rbsp_bit(&rbsp, &forbidden_zero_bit);
+	rbsp_bits(&rbsp, 2, &nal_ref_idc);
+	rbsp_bits(&rbsp, 5, &nal_unit_type);
+
+	nal_h264_rbsp_sps(&rbsp, sps);
+
+	nal_h264_rbsp_trailing_bits(&rbsp);
+
+	if (rbsp.error)
+		return rbsp.error;
+
+	return DIV_ROUND_UP(rbsp.pos, 8);
+}
+EXPORT_SYMBOL_GPL(nal_h264_write_sps);
+
+/**
+ * nal_h264_read_sps() - Read SPS NAL unit from RBSP format
+ * @dev:
+ * @sps: the &struct nal_h264_sps to fill from the RBSP data
+ * @src: the buffer that contains the RBSP data
+ * @n: size of @src in bytes
+ *
+ * Read RBSP data from @src and use it to fill @sps.
+ *
+ * Return: number of bytes read from @src or negative error code
+ */
+ssize_t nal_h264_read_sps(const struct device *dev,
+			  struct nal_h264_sps *sps, void *src, size_t n)
+{
+	struct rbsp rbsp;
+	unsigned int forbidden_zero_bit;
+	unsigned int nal_ref_idc;
+	unsigned int nal_unit_type;
+
+	if (!src)
+		return -EINVAL;
+
+	rbsp_init(&rbsp, src, n, &read);
+
+	nal_h264_read_start_code_prefix(&rbsp);
+
+	rbsp_bit(&rbsp, &forbidden_zero_bit);
+	rbsp_bits(&rbsp, 2, &nal_ref_idc);
+	rbsp_bits(&rbsp, 5, &nal_unit_type);
+
+	if (rbsp.error ||
+	    forbidden_zero_bit != 0 ||
+	    nal_ref_idc != 0 ||
+	    nal_unit_type != SEQUENCE_PARAMETER_SET)
+		return -EINVAL;
+
+	nal_h264_rbsp_sps(&rbsp, sps);
+
+	nal_h264_rbsp_trailing_bits(&rbsp);
+
+	if (rbsp.error)
+		return rbsp.error;
+
+	return DIV_ROUND_UP(rbsp.pos, 8);
+}
+EXPORT_SYMBOL_GPL(nal_h264_read_sps);
+
+/**
+ * nal_h264_write_pps() - Write PPS NAL unit into RBSP format
+ * @dev:
+ * @dest: the buffer that is filled with RBSP data
+ * @n: maximum size of @dest in bytes
+ * @pps: &struct nal_h264_pps to convert to RBSP
+ *
+ * Convert @pps to RBSP data and write it into @dest.
+ *
+ * The size of the PPS NAL unit is not known in advance and this function will
+ * fail, if @dest does not hold sufficient space for the PPS NAL unit.
+ *
+ * Return: number of bytes written to @dest or negative error code
+ */
+ssize_t nal_h264_write_pps(const struct device *dev,
+			   void *dest, size_t n, struct nal_h264_pps *pps)
+{
+	struct rbsp rbsp;
+	unsigned int forbidden_zero_bit = 0;
+	unsigned int nal_ref_idc = 0;
+	unsigned int nal_unit_type = PICTURE_PARAMETER_SET;
+
+	if (!dest)
+		return -EINVAL;
+
+	rbsp_init(&rbsp, dest, n, &write);
+
+	nal_h264_write_start_code_prefix(&rbsp);
+
+	/* NAL unit header */
+	rbsp_bit(&rbsp, &forbidden_zero_bit);
+	rbsp_bits(&rbsp, 2, &nal_ref_idc);
+	rbsp_bits(&rbsp, 5, &nal_unit_type);
+
+	nal_h264_rbsp_pps(&rbsp, pps);
+
+	nal_h264_rbsp_trailing_bits(&rbsp);
+
+	if (rbsp.error)
+		return rbsp.error;
+
+	return DIV_ROUND_UP(rbsp.pos, 8);
+}
+EXPORT_SYMBOL_GPL(nal_h264_write_pps);
+
+/**
+ * nal_h264_read_pps() - Read PPS NAL unit from RBSP format
+ * @dev:
+ * @pps: the &struct nal_h264_pps to fill from the RBSP data
+ * @src: the buffer that contains the RBSP data
+ * @n: size of @src in bytes
+ *
+ * Read RBSP data from @src and use it to fill @pps.
+ *
+ * Return: number of bytes read from @src or negative error code
+ */
+ssize_t nal_h264_read_pps(const struct device *dev,
+			  struct nal_h264_pps *pps, void *src, size_t n)
+{
+	struct rbsp rbsp;
+
+	if (!src)
+		return -EINVAL;
+
+	rbsp_init(&rbsp, src, n, &read);
+
+	nal_h264_read_start_code_prefix(&rbsp);
+
+	/* NAL unit header */
+	rbsp.pos += 8;
+
+	nal_h264_rbsp_pps(&rbsp, pps);
+
+	nal_h264_rbsp_trailing_bits(&rbsp);
+
+	if (rbsp.error)
+		return rbsp.error;
+
+	return DIV_ROUND_UP(rbsp.pos, 8);
+}
+EXPORT_SYMBOL_GPL(nal_h264_read_pps);
+
+/**
+ * nal_h264_write_filler() - Write filler data RBSP
+ * @dev:
+ * @dest: buffer to fill with filler data
+ * @n: size of the buffer to fill with filler data
+ *
+ * Write a filler data RBSP to @dest with a size of @n bytes and return the
+ * number of written filler data bytes.
+ *
+ * Use this function to generate dummy data in an RBSP data stream that can be
+ * safely ignored by h264 decoders.
+ *
+ * The RBSP format of the filler data is specified in Rec. ITU-T H.264
+ * (04/2017) 7.3.2.7 Filler data RBSP syntax.
+ *
+ * Return: number of filler data bytes (including marker) or negative error
+ */
+ssize_t nal_h264_write_filler(const struct device *dev, void *dest, size_t n)
+{
+	struct rbsp rbsp;
+	unsigned int forbidden_zero_bit = 0;
+	unsigned int nal_ref_idc = 0;
+	unsigned int nal_unit_type = FILLER_DATA;
+
+	if (!dest)
+		return -EINVAL;
+
+	rbsp_init(&rbsp, dest, n, &write);
+
+	nal_h264_write_start_code_prefix(&rbsp);
+
+	rbsp_bit(&rbsp, &forbidden_zero_bit);
+	rbsp_bits(&rbsp, 2, &nal_ref_idc);
+	rbsp_bits(&rbsp, 5, &nal_unit_type);
+
+	nal_h264_write_filler_data(&rbsp);
+
+	nal_h264_rbsp_trailing_bits(&rbsp);
+
+	return DIV_ROUND_UP(rbsp.pos, 8);
+}
+EXPORT_SYMBOL_GPL(nal_h264_write_filler);
+
+/**
+ * nal_h264_read_filler() - Read filler data RBSP
+ * @dev:
+ * @src: buffer with RBSP data that is read
+ * @n: maximum size of src that shall be read
+ *
+ * Read a filler data RBSP from @src up to a maximum size of @n bytes and
+ * return the size of the filler data in bytes including the marker.
+ *
+ * This function is used to parse filler data and skip the respective bytes in
+ * the RBSP data.
+ *
+ * The RBSP format of the filler data is specified in Rec. ITU-T H.264
+ * (04/2017) 7.3.2.7 Filler data RBSP syntax.
+ *
+ * Return: number of filler data bytes (including marker) or negative error
+ */
+ssize_t nal_h264_read_filler(const struct device *dev, void *src, size_t n)
+{
+	struct rbsp rbsp;
+	unsigned int forbidden_zero_bit;
+	unsigned int nal_ref_idc;
+	unsigned int nal_unit_type;
+
+	if (!src)
+		return -EINVAL;
+
+	rbsp_init(&rbsp, src, n, &read);
+
+	nal_h264_read_start_code_prefix(&rbsp);
+
+	rbsp_bit(&rbsp, &forbidden_zero_bit);
+	rbsp_bits(&rbsp, 2, &nal_ref_idc);
+	rbsp_bits(&rbsp, 5, &nal_unit_type);
+
+	if (rbsp.error)
+		return rbsp.error;
+	if (forbidden_zero_bit != 0 ||
+	    nal_ref_idc != 0 ||
+	    nal_unit_type != FILLER_DATA)
+		return -EINVAL;
+
+	nal_h264_read_filler_data(&rbsp);
+	nal_h264_rbsp_trailing_bits(&rbsp);
+
+	if (rbsp.error)
+		return rbsp.error;
+
+	return DIV_ROUND_UP(rbsp.pos, 8);
+}
+EXPORT_SYMBOL_GPL(nal_h264_read_filler);
diff --git a/drivers/media/platform/allegro-dvt/nal-h264.h b/drivers/media/platform/allegro-dvt/nal-h264.h
new file mode 100644
index 000000000000..2ba7cbced7a5
--- /dev/null
+++ b/drivers/media/platform/allegro-dvt/nal-h264.h
@@ -0,0 +1,208 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2019 Pengutronix, Michael Tretter <kernel@pengutronix.de>
+ *
+ * Convert NAL units between raw byte sequence payloads (RBSP) and C structs.
+ */
+
+#ifndef __NAL_H264_H__
+#define __NAL_H264_H__
+
+#include <linux/kernel.h>
+#include <linux/types.h>
+
+/**
+ * struct nal_h264_hdr_parameters - HDR parameters
+ *
+ * C struct representation of the sequence parameter set NAL unit as defined by
+ * Rec. ITU-T H.264 (04/2017) E.1.2 HRD parameters syntax.
+ */
+struct nal_h264_hrd_parameters {
+	unsigned int cpb_cnt_minus1;
+	unsigned int bit_rate_scale;
+	unsigned int cpb_size_scale;
+	struct {
+		int bit_rate_value_minus1[16];
+		int cpb_size_value_minus1[16];
+		unsigned int cbr_flag[16];
+	};
+	unsigned int initial_cpb_removal_delay_length_minus1;
+	unsigned int cpb_removal_delay_length_minus1;
+	unsigned int dpb_output_delay_length_minus1;
+	unsigned int time_offset_length;
+};
+
+/**
+ * struct nal_h264_vui_parameters - VUI parameters
+ *
+ * C struct representation of the VUI parameters as defined by Rec. ITU-T
+ * H.264 (04/2017) E.1.1 VUI parameters syntax.
+ */
+struct nal_h264_vui_parameters {
+	unsigned int aspect_ratio_info_present_flag;
+	struct {
+		unsigned int aspect_ratio_idc;
+		unsigned int sar_width;
+		unsigned int sar_height;
+	};
+	unsigned int overscan_info_present_flag;
+	unsigned int overscan_appropriate_flag;
+	unsigned int video_signal_type_present_flag;
+	struct {
+		unsigned int video_format;
+		unsigned int video_full_range_flag;
+		unsigned int colour_description_present_flag;
+		struct {
+			unsigned int colour_primaries;
+			unsigned int transfer_characteristics;
+			unsigned int matrix_coefficients;
+		};
+	};
+	unsigned int chroma_loc_info_present_flag;
+	struct {
+		unsigned int chroma_sample_loc_type_top_field;
+		unsigned int chroma_sample_loc_type_bottom_field;
+	};
+	unsigned int timing_info_present_flag;
+	struct {
+		unsigned int num_units_in_tick;
+		unsigned int time_scale;
+		unsigned int fixed_frame_rate_flag;
+	};
+	unsigned int nal_hrd_parameters_present_flag;
+	struct nal_h264_hrd_parameters nal_hrd_parameters;
+	unsigned int vcl_hrd_parameters_present_flag;
+	struct nal_h264_hrd_parameters vcl_hrd_parameters;
+	unsigned int low_delay_hrd_flag;
+	unsigned int pic_struct_present_flag;
+	unsigned int bitstream_restriction_flag;
+	struct {
+		unsigned int motion_vectors_over_pic_boundaries_flag;
+		unsigned int max_bytes_per_pic_denom;
+		unsigned int max_bits_per_mb_denom;
+		unsigned int log2_max_mv_length_horizontal;
+		unsigned int log21_max_mv_length_vertical;
+		unsigned int max_num_reorder_frames;
+		unsigned int max_dec_frame_buffering;
+	};
+};
+
+/**
+ * struct nal_h264_sps - Sequence parameter set
+ *
+ * C struct representation of the sequence parameter set NAL unit as defined by
+ * Rec. ITU-T H.264 (04/2017) 7.3.2.1.1 Sequence parameter set data syntax.
+ */
+struct nal_h264_sps {
+	unsigned int profile_idc;
+	unsigned int constraint_set0_flag;
+	unsigned int constraint_set1_flag;
+	unsigned int constraint_set2_flag;
+	unsigned int constraint_set3_flag;
+	unsigned int constraint_set4_flag;
+	unsigned int constraint_set5_flag;
+	unsigned int reserved_zero_2bits;
+	unsigned int level_idc;
+	unsigned int seq_parameter_set_id;
+	struct {
+		unsigned int chroma_format_idc;
+		unsigned int separate_colour_plane_flag;
+		unsigned int bit_depth_luma_minus8;
+		unsigned int bit_depth_chroma_minus8;
+		unsigned int qpprime_y_zero_transform_bypass_flag;
+		unsigned int seq_scaling_matrix_present_flag;
+	};
+	unsigned int log2_max_frame_num_minus4;
+	unsigned int pic_order_cnt_type;
+	union {
+		unsigned int log2_max_pic_order_cnt_lsb_minus4;
+		struct {
+			unsigned int delta_pic_order_always_zero_flag;
+			int offset_for_non_ref_pic;
+			int offset_for_top_to_bottom_field;
+			unsigned int num_ref_frames_in_pic_order_cnt_cycle;
+			int offset_for_ref_frame[255];
+		};
+	};
+	unsigned int max_num_ref_frames;
+	unsigned int gaps_in_frame_num_value_allowed_flag;
+	unsigned int pic_width_in_mbs_minus1;
+	unsigned int pic_height_in_map_units_minus1;
+	unsigned int frame_mbs_only_flag;
+	unsigned int mb_adaptive_frame_field_flag;
+	unsigned int direct_8x8_inference_flag;
+	unsigned int frame_cropping_flag;
+	struct {
+		unsigned int crop_left;
+		unsigned int crop_right;
+		unsigned int crop_top;
+		unsigned int crop_bottom;
+	};
+	unsigned int vui_parameters_present_flag;
+	struct nal_h264_vui_parameters vui;
+};
+
+/**
+ * struct nal_h264_pps - Picture parameter set
+ *
+ * C struct representation of the picture parameter set NAL unit as defined by
+ * Rec. ITU-T H.264 (04/2017) 7.3.2.2 Picture parameter set RBSP syntax.
+ */
+struct nal_h264_pps {
+	unsigned int pic_parameter_set_id;
+	unsigned int seq_parameter_set_id;
+	unsigned int entropy_coding_mode_flag;
+	unsigned int bottom_field_pic_order_in_frame_present_flag;
+	unsigned int num_slice_groups_minus1;
+	unsigned int slice_group_map_type;
+	union {
+		unsigned int run_length_minus1[8];
+		struct {
+			unsigned int top_left[8];
+			unsigned int bottom_right[8];
+		};
+		struct {
+			unsigned int slice_group_change_direction_flag;
+			unsigned int slice_group_change_rate_minus1;
+		};
+		struct {
+			unsigned int pic_size_in_map_units_minus1;
+			unsigned int slice_group_id[8];
+		};
+	};
+	unsigned int num_ref_idx_l0_default_active_minus1;
+	unsigned int num_ref_idx_l1_default_active_minus1;
+	unsigned int weighted_pred_flag;
+	unsigned int weighted_bipred_idc;
+	int pic_init_qp_minus26;
+	int pic_init_qs_minus26;
+	int chroma_qp_index_offset;
+	unsigned int deblocking_filter_control_present_flag;
+	unsigned int constrained_intra_pred_flag;
+	unsigned int redundant_pic_cnt_present_flag;
+	struct {
+		unsigned int transform_8x8_mode_flag;
+		unsigned int pic_scaling_matrix_present_flag;
+		int second_chroma_qp_index_offset;
+	};
+};
+
+int nal_h264_profile_from_v4l2(enum v4l2_mpeg_video_h264_profile profile);
+int nal_h264_level_from_v4l2(enum v4l2_mpeg_video_h264_level level);
+
+ssize_t nal_h264_write_sps(const struct device *dev,
+			   void *dest, size_t n, struct nal_h264_sps *sps);
+ssize_t nal_h264_read_sps(const struct device *dev,
+			  struct nal_h264_sps *sps, void *src, size_t n);
+void nal_h264_print_sps(const struct device *dev, struct nal_h264_sps *sps);
+
+ssize_t nal_h264_write_pps(const struct device *dev,
+			   void *dest, size_t n, struct nal_h264_pps *pps);
+ssize_t nal_h264_read_pps(const struct device *dev,
+			  struct nal_h264_pps *pps, void *src, size_t n);
+void nal_h264_print_pps(const struct device *dev, struct nal_h264_pps *pps);
+
+ssize_t nal_h264_write_filler(const struct device *dev, void *dest, size_t n);
+ssize_t nal_h264_read_filler(const struct device *dev, void *src, size_t n);
+
+#endif /* __NAL_H264_H__ */
-- 
2.20.1

