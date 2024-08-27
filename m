Return-Path: <linux-media+bounces-16907-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC64960705
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 12:10:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5BAF3B2242F
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 10:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED0291A4B7A;
	Tue, 27 Aug 2024 10:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RckJj8Du"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D9F1A0AF3;
	Tue, 27 Aug 2024 10:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724753196; cv=none; b=TzgZJ4Ckp/RCw90eyxThzpMuaQ/w+owK/H1ApWGQi6HEWspmDFc3unLytHey1LWwrankrHIwqcBp7s5LKafdBYASMLhN3uTihd1QfLeNjKcPpI7JOsIrTngr5787KG56Wcj9vH0Ugvq5RMAl9uUOIIp8rxFvpz6BH2W8dfPpt4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724753196; c=relaxed/simple;
	bh=LLRO//lN3i9LCVuQYFkIuhkWOOEigPCBPLM5YhPCcS8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gyNZpyrNLlTucZsAE4cCwJq4HCEoy5Wf91rcCwH8/xDBW32HLYC6X1cp5t+U0ozgq2HXc7DTG5c5vGhVmB1NfOIGD1dOkASTATrBHWA+HHlKi/YXqEmliwmXr27ndj4xYwsEljQdd2IE3RLKNb7TSk9Nrl+1l1lr4XAnvL8n/8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RckJj8Du; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 68511C4FE97;
	Tue, 27 Aug 2024 10:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724753196;
	bh=LLRO//lN3i9LCVuQYFkIuhkWOOEigPCBPLM5YhPCcS8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RckJj8DuvZRi8MU20vwzFgy41k2hXukQ1olFOM7cwkPkRXZ+iAmpGNo6LQWZXALU0
	 sbTlGhKlLCpQlKkeYido4v33PC91J6x+6cR5tuQRSyignHBjODKUC0XY/0F9X7NDoV
	 V/kHvMy4FvTlkEgHane5nd3pxz2la9Z7Jkh4UQalGnx53DNdLGdYuac+3J6783Vs+T
	 +WGUewyN4RuwoAajDmkPYZZ9MC4ccwHxkOch6NkfqaJ/zW0UtFS7vcReYexbNdneyD
	 b1vm+eXliGylWiiQPa19AubXt71QZf94rblrTJrKqcIeznxhHiTf+Cw2zpsfpC3Yc4
	 /RfK4nLARDc/w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C7A5C54736;
	Tue, 27 Aug 2024 10:06:36 +0000 (UTC)
From: Dikshita Agarwal via B4 Relay <devnull+quic_dikshita.quicinc.com@kernel.org>
Date: Tue, 27 Aug 2024 15:35:48 +0530
Subject: [PATCH v3 23/29] media: iris: add support for dynamic resolution
 change
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240827-iris_v3-v3-23-c5fdbbe65e70@quicinc.com>
References: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
In-Reply-To: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724753190; l=34685;
 i=quic_dikshita@quicinc.com; s=20240826; h=from:subject:message-id;
 bh=upBLZDwdKpnMwlbB2QnyIaK5IaJu314T3xLvE9tO2p8=;
 b=gjXWZqhK+9CNDHVL74c4JHkMTdV/F6CJ319Wyq9C7MCffJDjXwtInmDPD3cZS90ADRaSEeDY8
 B8eewcp8PfaA5i71pUq9z2R3Jpc9tsUUhKP/9hhDJZCqXccTflsh2i6
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=+c7562uu1Y968VTv9z59ch2v3jmlO2Qv3uX7srN3LJY=
X-Endpoint-Received: by B4 Relay for quic_dikshita@quicinc.com/20240826
 with auth_id=199
X-Original-From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Reply-To: quic_dikshita@quicinc.com

From: Dikshita Agarwal <quic_dikshita@quicinc.com>

Handle the response sent by firmware, when source change is
detected by firmware. Read the parameter subscribed to firmware
for source change to detect the parameter with changed value.
Raise the source change event to client and update the instance
sub state.

Mark the last buffer from before the source change with
the V4L2_BUF_FLAG_LAST flag and return to client.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_common.c |  96 ++++++++++
 drivers/media/platform/qcom/iris/iris_hfi_common.h |   3 +
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  82 +++++++++
 .../platform/qcom/iris/iris_hfi_gen1_response.c    | 204 +++++++++++++++++++++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   4 +
 .../platform/qcom/iris/iris_hfi_gen2_response.c    | 179 ++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_instance.h   |   2 +
 drivers/media/platform/qcom/iris/iris_state.c      |  64 +++++++
 drivers/media/platform/qcom/iris/iris_state.h      |  35 ++++
 drivers/media/platform/qcom/iris/iris_vb2.c        |  15 ++
 drivers/media/platform/qcom/iris/iris_vdec.c       |  15 ++
 drivers/media/platform/qcom/iris/iris_vdec.h       |   1 +
 12 files changed, 700 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.c b/drivers/media/platform/qcom/iris/iris_hfi_common.c
index bf9ec678ff90..e1a21ea73ad9 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.c
@@ -11,6 +11,102 @@
 #include "iris_power.h"
 #include "iris_vpu_common.h"
 
+u32 iris_hfi_get_v4l2_color_primaries(u32 hfi_primaries)
+{
+	u32 primaries = V4L2_COLORSPACE_DEFAULT;
+
+	switch (hfi_primaries) {
+	case HFI_PRIMARIES_RESERVED:
+		primaries = V4L2_COLORSPACE_DEFAULT;
+		break;
+	case HFI_PRIMARIES_BT709:
+		primaries = V4L2_COLORSPACE_REC709;
+		break;
+	case HFI_PRIMARIES_BT470_SYSTEM_M:
+		primaries = V4L2_COLORSPACE_470_SYSTEM_M;
+		break;
+	case HFI_PRIMARIES_BT470_SYSTEM_BG:
+		primaries = V4L2_COLORSPACE_470_SYSTEM_BG;
+		break;
+	case HFI_PRIMARIES_BT601_525:
+		primaries = V4L2_COLORSPACE_SMPTE170M;
+		break;
+	case HFI_PRIMARIES_SMPTE_ST240M:
+		primaries = V4L2_COLORSPACE_SMPTE240M;
+		break;
+	case HFI_PRIMARIES_BT2020:
+		primaries = V4L2_COLORSPACE_BT2020;
+		break;
+	case V4L2_COLORSPACE_DCI_P3:
+		primaries = HFI_PRIMARIES_SMPTE_RP431_2;
+		break;
+	default:
+		break;
+	}
+
+	return primaries;
+}
+
+u32 iris_hfi_get_v4l2_transfer_char(u32 hfi_characterstics)
+{
+	u32 characterstics = V4L2_XFER_FUNC_DEFAULT;
+
+	switch (hfi_characterstics) {
+	case HFI_TRANSFER_RESERVED:
+		characterstics = V4L2_XFER_FUNC_DEFAULT;
+		break;
+	case HFI_TRANSFER_BT709:
+		characterstics = V4L2_XFER_FUNC_709;
+		break;
+	case HFI_TRANSFER_SMPTE_ST240M:
+		characterstics = V4L2_XFER_FUNC_SMPTE240M;
+		break;
+	case HFI_TRANSFER_SRGB_SYCC:
+		characterstics = V4L2_XFER_FUNC_SRGB;
+		break;
+	case HFI_TRANSFER_SMPTE_ST2084_PQ:
+		characterstics = V4L2_XFER_FUNC_SMPTE2084;
+		break;
+	default:
+		break;
+	}
+
+	return characterstics;
+}
+
+u32 iris_hfi_get_v4l2_matrix_coefficients(u32 hfi_coefficients)
+{
+	u32 coefficients = V4L2_YCBCR_ENC_DEFAULT;
+
+	switch (hfi_coefficients) {
+	case HFI_MATRIX_COEFF_RESERVED:
+		coefficients = V4L2_YCBCR_ENC_DEFAULT;
+		break;
+	case HFI_MATRIX_COEFF_BT709:
+		coefficients = V4L2_YCBCR_ENC_709;
+		break;
+	case HFI_MATRIX_COEFF_BT470_SYS_BG_OR_BT601_625:
+		coefficients = V4L2_YCBCR_ENC_XV601;
+		break;
+	case HFI_MATRIX_COEFF_BT601_525_BT1358_525_OR_625:
+		coefficients = V4L2_YCBCR_ENC_601;
+		break;
+	case HFI_MATRIX_COEFF_SMPTE_ST240:
+		coefficients = V4L2_YCBCR_ENC_SMPTE240M;
+		break;
+	case HFI_MATRIX_COEFF_BT2020_NON_CONSTANT:
+		coefficients = V4L2_YCBCR_ENC_BT2020;
+		break;
+	case HFI_MATRIX_COEFF_BT2020_CONSTANT:
+		coefficients = V4L2_YCBCR_ENC_BT2020_CONST_LUM;
+		break;
+	default:
+		break;
+	}
+
+	return coefficients;
+}
+
 int iris_hfi_core_init(struct iris_core *core)
 {
 	const struct iris_hfi_command_ops *hfi_ops = core->hfi_ops;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
index 9a6bb72e6134..22b0cbfcce76 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
@@ -138,6 +138,9 @@ struct hfi_subscription_params {
 	u32	level;
 };
 
+u32 iris_hfi_get_v4l2_color_primaries(u32 hfi_primaries);
+u32 iris_hfi_get_v4l2_transfer_char(u32 hfi_characterstics);
+u32 iris_hfi_get_v4l2_matrix_coefficients(u32 hfi_coefficients);
 int iris_hfi_core_init(struct iris_core *core);
 int iris_hfi_pm_suspend(struct iris_core *core);
 int iris_hfi_pm_resume(struct iris_core *core);
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index b7f9e0f47675..41e103744bd5 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -44,18 +44,28 @@
 #define HFI_EVENT_SYS_ERROR				0x1
 #define HFI_EVENT_SESSION_ERROR				0x2
 
+#define HFI_EVENT_DATA_SEQUENCE_CHANGED_SUFFICIENT_BUF_RESOURCES   0x1000001
+#define HFI_EVENT_DATA_SEQUENCE_CHANGED_INSUFFICIENT_BUF_RESOURCES 0x1000002
+#define HFI_EVENT_SESSION_SEQUENCE_CHANGED			   0x1000003
+
 #define HFI_BUFFERFLAG_TIMESTAMPINVALID			0x00000100
 
 #define HFI_FLUSH_OUTPUT				0x1000002
 #define HFI_FLUSH_OUTPUT2				0x1000003
 #define HFI_FLUSH_ALL					0x1000004
 
+#define HFI_INDEX_EXTRADATA_INPUT_CROP			0x0700000e
+
 #define HFI_PROPERTY_PARAM_BUFFER_COUNT_ACTUAL				0x201001
 #define HFI_PROPERTY_PARAM_UNCOMPRESSED_PLANE_ACTUAL_CONSTRAINTS_INFO	0x201002
 #define HFI_PROPERTY_PARAM_BUFFER_ALLOC_MODE				0x201008
 #define HFI_PROPERTY_PARAM_BUFFER_SIZE_ACTUAL				0x20100c
 
+#define HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS		0x202001
+
 #define HFI_PROPERTY_CONFIG_VDEC_POST_LOOP_DEBLOCKER	0x1200001
+#define HFI_PROPERTY_PARAM_VDEC_DPB_COUNTS		0x120300e
+#define HFI_PROPERTY_CONFIG_VDEC_ENTROPY		0x1204004
 
 #define HFI_BUFFER_INPUT				0x1
 #define HFI_BUFFER_OUTPUT				0x2
@@ -69,11 +79,15 @@
 
 #define HFI_PROPERTY_PARAM_FRAME_SIZE			0x1001
 #define HFI_PROPERTY_PARAM_UNCOMPRESSED_FORMAT_SELECT	0x1003
+#define HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT	0x1005
 #define HFI_PROPERTY_PARAM_WORK_MODE			0x1015
 #define HFI_PROPERTY_PARAM_WORK_ROUTE			0x1017
 #define HFI_PROPERTY_CONFIG_VIDEOCORES_USAGE		0x2002
 
 #define HFI_PROPERTY_PARAM_VDEC_MULTI_STREAM		0x1003001
+#define HFI_PROPERTY_PARAM_VDEC_PIXEL_BITDEPTH		0x1003007
+#define HFI_PROPERTY_PARAM_VDEC_PIC_STRUCT		0x1003009
+#define HFI_PROPERTY_PARAM_VDEC_COLOUR_SPACE		0x100300a
 #define HFI_CORE_ID_1					1
 #define HFI_COLOR_FORMAT_NV12				0x02
 #define HFI_COLOR_FORMAT_NV12_UBWC			0x8002
@@ -249,6 +263,11 @@ struct hfi_enable {
 	u32 enable;
 };
 
+struct hfi_profile_level {
+	u32 profile;
+	u32 level;
+};
+
 struct hfi_framesize {
 	u32 buffer_type;
 	u32 width;
@@ -267,6 +286,37 @@ struct hfi_video_work_route {
 	u32 video_work_route;
 };
 
+struct hfi_bit_depth {
+	u32 buffer_type;
+	u32 bit_depth;
+};
+
+struct hfi_pic_struct {
+	u32 progressive_only;
+};
+
+struct hfi_colour_space {
+	u32 colour_space;
+};
+
+struct hfi_extradata_input_crop {
+	u32 size;
+	u32 version;
+	u32 port_index;
+	u32 left;
+	u32 top;
+	u32 width;
+	u32 height;
+};
+
+struct hfi_dpb_counts {
+	u32 max_dpb_count;
+	u32 max_ref_frames;
+	u32 max_dec_buffering;
+	u32 max_reorder_frames;
+	u32 fw_min_count;
+};
+
 struct hfi_uncompressed_format_select {
 	u32 buffer_type;
 	u32 format;
@@ -301,6 +351,38 @@ struct hfi_multi_stream {
 	u32 enable;
 };
 
+struct hfi_buffer_requirements {
+	u32 type;
+	u32 size;
+	u32 region_size;
+	u32 hold_count;
+	u32 count_min;
+	u32 count_actual;
+	u32 contiguous;
+	u32 alignment;
+};
+
+struct hfi_event_data {
+	u32 error;
+	u32 height;
+	u32 width;
+	u32 event_type;
+	u32 packet_buffer;
+	u32 extradata_buffer;
+	u32 tag;
+	u32 profile;
+	u32 level;
+	u32 bit_depth;
+	u32 pic_struct;
+	u32 colour_space;
+	u32 entropy_mode;
+	u32 buf_count;
+	struct {
+		u32 left, top;
+		u32 width, height;
+	} input_crop;
+};
+
 struct hfi_msg_session_empty_buffer_done_pkt {
 	struct hfi_msg_session_hdr_pkt shdr;
 	u32 offset;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index 32fb01616122..e3d9bfb8bef6 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -3,11 +3,212 @@
  * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <linux/bitfield.h>
 #include <media/v4l2-mem2mem.h>
 
 #include "iris_hfi_gen1.h"
 #include "iris_hfi_gen1_defines.h"
 #include "iris_instance.h"
+#include "iris_vdec.h"
+#include "iris_vpu_buffer.h"
+
+static void iris_hfi_gen1_read_changed_params(struct iris_inst *inst,
+					      struct hfi_msg_event_notify_pkt *pkt)
+{
+	struct v4l2_pix_format_mplane *pixmp_ip, *pixmp_op;
+	u32 primaries, matrix_coeff, transfer_char;
+	struct hfi_dpb_counts *iris_vpu_dpb_count;
+	struct hfi_profile_level *profile_level;
+	u32 colour_description_present_flag = 0;
+	struct hfi_buffer_requirements *bufreq;
+	u32 video_signal_type_present_flag = 0;
+	struct hfi_extradata_input_crop *crop;
+	struct hfi_colour_space *colour_info;
+	struct iris_core *core = inst->core;
+	struct hfi_event_data event = {0};
+	struct hfi_bit_depth *pixel_depth;
+	struct hfi_pic_struct *pic_struct;
+	struct hfi_framesize *frame_sz;
+	int num_properties_changed;
+	u32 full_range = 0;
+	u8 *data_ptr;
+	u32 ptype;
+
+	pixmp_ip = &inst->fmt_src->fmt.pix_mp;
+	pixmp_op = &inst->fmt_dst->fmt.pix_mp;
+	num_properties_changed = pkt->event_data2;
+
+	data_ptr = (u8 *)&pkt->ext_event_data[0];
+	do {
+		ptype = *((u32 *)data_ptr);
+		switch (ptype) {
+		case HFI_PROPERTY_PARAM_FRAME_SIZE:
+			data_ptr += sizeof(u32);
+			frame_sz = (struct hfi_framesize *)data_ptr;
+			event.width = frame_sz->width;
+			event.height = frame_sz->height;
+			data_ptr += sizeof(*frame_sz);
+			break;
+		case HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT:
+			data_ptr += sizeof(u32);
+			profile_level = (struct hfi_profile_level *)data_ptr;
+			event.profile = profile_level->profile;
+			event.level = profile_level->level;
+			data_ptr += sizeof(*profile_level);
+			break;
+		case HFI_PROPERTY_PARAM_VDEC_PIXEL_BITDEPTH:
+			data_ptr += sizeof(u32);
+			pixel_depth = (struct hfi_bit_depth *)data_ptr;
+			event.bit_depth = pixel_depth->bit_depth;
+			data_ptr += sizeof(*pixel_depth);
+			break;
+		case HFI_PROPERTY_PARAM_VDEC_PIC_STRUCT:
+			data_ptr += sizeof(u32);
+			pic_struct = (struct hfi_pic_struct *)data_ptr;
+			event.pic_struct = pic_struct->progressive_only;
+			data_ptr += sizeof(*pic_struct);
+			break;
+		case HFI_PROPERTY_PARAM_VDEC_COLOUR_SPACE:
+			data_ptr += sizeof(u32);
+			colour_info = (struct hfi_colour_space *)data_ptr;
+			event.colour_space = colour_info->colour_space;
+			data_ptr += sizeof(*colour_info);
+			break;
+		case HFI_PROPERTY_CONFIG_VDEC_ENTROPY:
+			data_ptr += sizeof(u32);
+			event.entropy_mode = *(u32 *)data_ptr;
+			data_ptr += sizeof(u32);
+			break;
+		case HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS:
+			data_ptr += sizeof(u32);
+			bufreq = (struct hfi_buffer_requirements *)data_ptr;
+			event.buf_count = bufreq->count_min;
+			data_ptr += sizeof(*bufreq);
+			break;
+		case HFI_INDEX_EXTRADATA_INPUT_CROP:
+			data_ptr += sizeof(u32);
+			crop = (struct hfi_extradata_input_crop *)data_ptr;
+			event.input_crop.left = crop->left;
+			event.input_crop.top = crop->top;
+			event.input_crop.width = crop->width;
+			event.input_crop.height = crop->height;
+			data_ptr += sizeof(*crop);
+			break;
+		case HFI_PROPERTY_PARAM_VDEC_DPB_COUNTS:
+			data_ptr += sizeof(u32);
+			iris_vpu_dpb_count = (struct hfi_dpb_counts *)data_ptr;
+			event.buf_count = iris_vpu_dpb_count->fw_min_count;
+			data_ptr += sizeof(*iris_vpu_dpb_count);
+			break;
+		default:
+			break;
+		}
+		num_properties_changed--;
+	} while (num_properties_changed > 0);
+
+	pixmp_ip->width = event.width;
+	pixmp_ip->height = event.height;
+
+	pixmp_op->width = ALIGN(event.width, 128);
+	pixmp_op->height = ALIGN(event.height, 32);
+	pixmp_op->plane_fmt[0].bytesperline = ALIGN(event.width, 128);
+	pixmp_op->plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_OUTPUT);
+
+	matrix_coeff =  FIELD_GET(GENMASK(7, 0), event.colour_space);
+	transfer_char = FIELD_GET(GENMASK(15, 8), event.colour_space);
+	primaries = FIELD_GET(GENMASK(23, 16), event.colour_space);
+	colour_description_present_flag = FIELD_GET(GENMASK(24, 24), event.colour_space);
+	full_range = FIELD_GET(GENMASK(25, 25), event.colour_space);
+	video_signal_type_present_flag = FIELD_GET(GENMASK(29, 29), event.colour_space);
+
+	pixmp_op->colorspace = V4L2_COLORSPACE_DEFAULT;
+	pixmp_op->xfer_func = V4L2_XFER_FUNC_DEFAULT;
+	pixmp_op->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	pixmp_op->quantization = V4L2_QUANTIZATION_DEFAULT;
+
+	if (video_signal_type_present_flag) {
+		pixmp_op->quantization =
+			full_range ?
+			V4L2_QUANTIZATION_FULL_RANGE :
+			V4L2_QUANTIZATION_LIM_RANGE;
+		if (colour_description_present_flag) {
+			pixmp_op->colorspace =
+				iris_hfi_get_v4l2_color_primaries(primaries);
+			pixmp_op->xfer_func =
+				iris_hfi_get_v4l2_transfer_char(transfer_char);
+			pixmp_op->ycbcr_enc =
+				iris_hfi_get_v4l2_matrix_coefficients(matrix_coeff);
+		}
+	}
+
+	pixmp_ip->colorspace = pixmp_op->colorspace;
+	pixmp_ip->xfer_func = pixmp_op->xfer_func;
+	pixmp_ip->ycbcr_enc = pixmp_op->ycbcr_enc;
+	pixmp_ip->quantization = pixmp_op->quantization;
+
+	if (event.input_crop.width > 0 && event.input_crop.height > 0) {
+		inst->crop.left = event.input_crop.left;
+		inst->crop.top = event.input_crop.top;
+		inst->crop.width = event.input_crop.width;
+		inst->crop.height = event.input_crop.height;
+	} else {
+		inst->crop.left = 0;
+		inst->crop.top = 0;
+		inst->crop.width = event.width;
+		inst->crop.height = event.height;
+	}
+
+	inst->fw_min_count = event.buf_count;
+	inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
+
+	if (event.bit_depth || !event.pic_struct) {
+		dev_err(core->dev, "unsupported content, bit depth: %x, pic_struct = %x\n",
+			event.bit_depth, event.pic_struct);
+		iris_inst_change_state(inst, IRIS_INST_ERROR);
+	}
+}
+
+static void iris_hfi_gen1_event_seq_changed(struct iris_inst *inst,
+					    struct hfi_msg_event_notify_pkt *pkt)
+{
+	struct hfi_session_flush_pkt flush_pkt;
+	int num_properties_changed;
+	int ret;
+
+	ret = iris_inst_sub_state_change_drc(inst);
+	if (ret)
+		return;
+
+	switch (pkt->event_data1) {
+	case HFI_EVENT_DATA_SEQUENCE_CHANGED_SUFFICIENT_BUF_RESOURCES:
+	case HFI_EVENT_DATA_SEQUENCE_CHANGED_INSUFFICIENT_BUF_RESOURCES:
+		break;
+	default:
+		iris_inst_change_state(inst, IRIS_INST_ERROR);
+		return;
+	}
+
+	num_properties_changed = pkt->event_data2;
+	if (!num_properties_changed) {
+		iris_inst_change_state(inst, IRIS_INST_ERROR);
+		return;
+	}
+
+	iris_hfi_gen1_read_changed_params(inst, pkt);
+
+	if (inst->state != IRIS_INST_ERROR) {
+		reinit_completion(&inst->flush_completion);
+
+		flush_pkt.shdr.hdr.size = sizeof(struct hfi_session_flush_pkt);
+		flush_pkt.shdr.hdr.pkt_type = HFI_CMD_SESSION_FLUSH;
+		flush_pkt.shdr.session_id = inst->session_id;
+		flush_pkt.flush_type = HFI_FLUSH_OUTPUT;
+		iris_hfi_queue_cmd_write(inst->core, &flush_pkt, flush_pkt.shdr.hdr.size);
+	}
+
+	iris_vdec_src_change(inst);
+	iris_inst_sub_state_change_drc_last(inst);
+}
 
 static void
 iris_hfi_gen1_sys_event_notify(struct iris_core *core, void *packet)
@@ -59,6 +260,9 @@ static void iris_hfi_gen1_session_event_notify(struct iris_inst *inst, void *pac
 	case HFI_EVENT_SESSION_ERROR:
 		iris_hfi_gen1_event_session_error(inst, pkt);
 		break;
+	case HFI_EVENT_SESSION_SEQUENCE_CHANGED:
+		iris_hfi_gen1_event_seq_changed(inst, pkt);
+		break;
 	default:
 		break;
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index 69e383a99d84..66ffce02ae57 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -19,8 +19,11 @@
 #define HFI_CMD_STOP				0x01000006
 #define HFI_CMD_BUFFER				0x01000009
 #define HFI_CMD_SUBSCRIBE_MODE			0x0100000B
+#define HFI_CMD_SETTINGS_CHANGE			0x0100000C
 #define HFI_CMD_END				0x01FFFFFF
 
+#define HFI_BITMASK_BITSTREAM_WIDTH		0xffff0000
+#define HFI_BITMASK_BITSTREAM_HEIGHT		0x0000ffff
 #define HFI_BITMASK_FRAME_MBS_ONLY_FLAG		0x00000001
 
 #define HFI_PROP_BEGIN				0x03000000
@@ -74,6 +77,7 @@
 #define HFI_INFO_UNSUPPORTED			0x06000001
 #define HFI_INFO_DATA_CORRUPT			0x06000002
 #define HFI_INFO_BUFFER_OVERFLOW		0x06000004
+#define HFI_INFO_HFI_FLAG_PSC_LAST		0x06000007
 #define HFI_INFORMATION_END			0x06FFFFFF
 
 enum hfi_property_mode_type {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index 1b1dfbd56704..626a858e803c 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -8,6 +8,8 @@
 #include "iris_hfi_gen2.h"
 #include "iris_hfi_gen2_defines.h"
 #include "iris_hfi_gen2_packet.h"
+#include "iris_vdec.h"
+#include "iris_vpu_buffer.h"
 #include "iris_vpu_common.h"
 
 struct iris_hfi_gen2_core_hfi_range {
@@ -200,6 +202,10 @@ static int iris_hfi_gen2_handle_session_info(struct iris_inst *inst,
 		info = "buffer overflow";
 		inst_hfi_gen2->hfi_frame_info.overflow = 1;
 		break;
+	case HFI_INFO_HFI_FLAG_PSC_LAST:
+		info = "drc last flag";
+		ret = iris_inst_sub_state_change_drc_last(inst);
+		break;
 	default:
 		info = "unknown";
 		break;
@@ -323,6 +329,12 @@ static int iris_hfi_gen2_handle_output_buffer(struct iris_inst *inst,
 	int ret = 0;
 	bool found = false;
 
+	if (hfi_buffer->flags & HFI_BUF_FW_FLAG_PSC_LAST) {
+		ret = iris_inst_sub_state_change_drc_last(inst);
+		if (ret)
+			return ret;
+	}
+
 	v4l2_m2m_for_each_dst_buf_safe(m2m_ctx, m2m_buffer, n) {
 		buf = to_iris_buffer(&m2m_buffer->vb);
 		if (buf->index == hfi_buffer->index &&
@@ -445,6 +457,108 @@ static int iris_hfi_gen2_handle_session_buffer(struct iris_inst *inst,
 		return iris_hfi_gen2_handle_release_internal_buffer(inst, buffer);
 }
 
+static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
+{
+	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
+	struct v4l2_pix_format_mplane *pixmp_ip, *pixmp_op;
+	u32 primaries, matrix_coeff, transfer_char;
+	struct hfi_subscription_params subsc_params;
+	u32 colour_description_present_flag = 0;
+	u32 video_signal_type_present_flag = 0;
+	struct iris_core *core = inst->core;
+	u32 full_range = 0;
+	u32 width, height;
+
+	subsc_params = inst_hfi_gen2->src_subcr_params;
+	pixmp_ip = &inst->fmt_src->fmt.pix_mp;
+	pixmp_op = &inst->fmt_dst->fmt.pix_mp;
+	width = (subsc_params.bitstream_resolution &
+		HFI_BITMASK_BITSTREAM_WIDTH) >> 16;
+	height = subsc_params.bitstream_resolution &
+		HFI_BITMASK_BITSTREAM_HEIGHT;
+
+	pixmp_ip->width = width;
+	pixmp_ip->height = height;
+
+	pixmp_op->width = ALIGN(width, 128);
+	pixmp_op->height = ALIGN(height, 32);
+	pixmp_op->plane_fmt[0].bytesperline = ALIGN(width, 128);
+	pixmp_op->plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_OUTPUT);
+
+	matrix_coeff = subsc_params.color_info & 0xFF;
+	transfer_char = (subsc_params.color_info & 0xFF00) >> 8;
+	primaries = (subsc_params.color_info & 0xFF0000) >> 16;
+	colour_description_present_flag =
+		(subsc_params.color_info & 0x1000000) >> 24;
+	full_range = (subsc_params.color_info & 0x2000000) >> 25;
+	video_signal_type_present_flag =
+		(subsc_params.color_info & 0x20000000) >> 29;
+
+	pixmp_op->colorspace = V4L2_COLORSPACE_DEFAULT;
+	pixmp_op->xfer_func = V4L2_XFER_FUNC_DEFAULT;
+	pixmp_op->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	pixmp_op->quantization = V4L2_QUANTIZATION_DEFAULT;
+
+	if (video_signal_type_present_flag) {
+		pixmp_op->quantization =
+			full_range ?
+			V4L2_QUANTIZATION_FULL_RANGE :
+			V4L2_QUANTIZATION_LIM_RANGE;
+		if (colour_description_present_flag) {
+			pixmp_op->colorspace =
+				iris_hfi_get_v4l2_color_primaries(primaries);
+			pixmp_op->xfer_func =
+				iris_hfi_get_v4l2_transfer_char(transfer_char);
+			pixmp_op->ycbcr_enc =
+				iris_hfi_get_v4l2_matrix_coefficients(matrix_coeff);
+		}
+	}
+
+	pixmp_ip->colorspace = pixmp_op->colorspace;
+	pixmp_ip->xfer_func = pixmp_op->xfer_func;
+	pixmp_ip->ycbcr_enc = pixmp_op->ycbcr_enc;
+	pixmp_ip->quantization = pixmp_op->quantization;
+
+	inst->crop.top = subsc_params.crop_offsets[0] & 0xFFFF;
+	inst->crop.left = (subsc_params.crop_offsets[0] >> 16) & 0xFFFF;
+	inst->crop.height = pixmp_ip->height -
+		(subsc_params.crop_offsets[1] & 0xFFFF) - inst->crop.top;
+	inst->crop.width = pixmp_ip->width -
+		((subsc_params.crop_offsets[1] >> 16) & 0xFFFF) - inst->crop.left;
+
+	inst->fw_cap[PROFILE].value = subsc_params.profile;
+	inst->fw_cap[LEVEL].value = subsc_params.level;
+	inst->fw_cap[POC].value = subsc_params.pic_order_cnt;
+
+	if (subsc_params.bit_depth != BIT_DEPTH_8 ||
+	    !(subsc_params.coded_frames & HFI_BITMASK_FRAME_MBS_ONLY_FLAG)) {
+		dev_err(core->dev, "unsupported content, bit depth: %x, pic_struct = %x\n",
+			subsc_params.bit_depth, subsc_params.coded_frames);
+		iris_inst_change_state(inst, IRIS_INST_ERROR);
+	}
+
+	inst->fw_min_count = subsc_params.fw_min_count;
+	inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
+}
+
+static int iris_hfi_gen2_handle_src_change(struct iris_inst *inst,
+					   struct iris_hfi_packet *pkt)
+{
+	int ret;
+
+	if (pkt->port != HFI_PORT_BITSTREAM)
+		return 0;
+
+	ret = iris_inst_sub_state_change_drc(inst);
+	if (ret)
+		return ret;
+
+	iris_hfi_gen2_read_input_subcr_params(inst);
+	iris_vdec_src_change(inst);
+
+	return 0;
+}
+
 static int iris_hfi_gen2_handle_session_command(struct iris_inst *inst,
 						struct iris_hfi_packet *pkt)
 {
@@ -460,6 +574,9 @@ static int iris_hfi_gen2_handle_session_command(struct iris_inst *inst,
 	case HFI_CMD_BUFFER:
 		ret = iris_hfi_gen2_handle_session_buffer(inst, pkt);
 		break;
+	case HFI_CMD_SETTINGS_CHANGE:
+		ret = iris_hfi_gen2_handle_src_change(inst, pkt);
+		break;
 	default:
 		break;
 	}
@@ -603,6 +720,56 @@ static int iris_hfi_gen2_handle_system_response(struct iris_core *core,
 	return ret;
 }
 
+static void iris_hfi_gen2_init_src_change_param(struct iris_inst *inst)
+{
+	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
+	u32 left_offset, top_offset, right_offset, bottom_offset;
+	struct v4l2_pix_format_mplane *pixmp_ip, *pixmp_op;
+	u32 primaries, matrix_coeff, transfer_char;
+	struct hfi_subscription_params *subsc_params;
+	u32 colour_description_present_flag = 0;
+	u32 video_signal_type_present_flag = 0;
+	u32 full_range = 0, video_format = 0;
+
+	subsc_params = &inst_hfi_gen2->src_subcr_params;
+	pixmp_ip = &inst->fmt_src->fmt.pix_mp;
+	pixmp_op = &inst->fmt_dst->fmt.pix_mp;
+
+	subsc_params->bitstream_resolution =
+		pixmp_ip->width << 16 | pixmp_ip->height;
+
+	left_offset = inst->crop.left;
+	top_offset = inst->crop.top;
+	right_offset = (pixmp_ip->width - inst->crop.width);
+	bottom_offset = (pixmp_ip->height - inst->crop.height);
+	subsc_params->crop_offsets[0] =
+			left_offset << 16 | top_offset;
+	subsc_params->crop_offsets[1] =
+			right_offset << 16 | bottom_offset;
+
+	subsc_params->fw_min_count = inst->buffers[BUF_OUTPUT].min_count;
+
+	primaries = iris_hfi_gen2_get_color_primaries(pixmp_op->colorspace);
+	matrix_coeff = iris_hfi_gen2_get_matrix_coefficients(pixmp_op->ycbcr_enc);
+	transfer_char = iris_hfi_gen2_get_transfer_char(pixmp_op->xfer_func);
+	full_range = pixmp_op->quantization == V4L2_QUANTIZATION_FULL_RANGE ? 1 : 0;
+	subsc_params->color_info =
+		iris_hfi_gen2_get_color_info(matrix_coeff, transfer_char, primaries,
+					     colour_description_present_flag,
+					     full_range, video_format,
+					     video_signal_type_present_flag);
+
+	subsc_params->profile = inst->fw_cap[PROFILE].value;
+	subsc_params->level = inst->fw_cap[LEVEL].value;
+	subsc_params->pic_order_cnt = inst->fw_cap[POC].value;
+	subsc_params->bit_depth = inst->fw_cap[BIT_DEPTH].value;
+	if (inst->fw_cap[CODED_FRAMES].value ==
+			CODED_FRAMES_PROGRESSIVE)
+		subsc_params->coded_frames = HFI_BITMASK_FRAME_MBS_ONLY_FLAG;
+	else
+		subsc_params->coded_frames = 0;
+}
+
 static int iris_hfi_gen2_handle_session_response(struct iris_core *core,
 						 struct iris_hfi_header *hdr)
 {
@@ -632,6 +799,18 @@ static int iris_hfi_gen2_handle_session_response(struct iris_core *core,
 	inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
 	memset(&inst_hfi_gen2->hfi_frame_info, 0, sizeof(struct iris_hfi_frame_info));
 
+	pkt = (u8 *)((u8 *)hdr + sizeof(*hdr));
+	for (i = 0; i < hdr->num_packets; i++) {
+		packet = (struct iris_hfi_packet *)pkt;
+		if (packet->type == HFI_CMD_SETTINGS_CHANGE) {
+			if (packet->port == HFI_PORT_BITSTREAM) {
+				iris_hfi_gen2_init_src_change_param(inst);
+				break;
+			}
+		}
+		pkt += packet->size;
+	}
+
 	start_pkt = (u8 *)((u8 *)hdr + sizeof(*hdr));
 	for (i = 0; i < ARRAY_SIZE(range); i++) {
 		pkt = start_pkt;
diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index c225466b4e48..dd1dad586a69 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -32,6 +32,7 @@
  * @buffers: array of different iris buffers
  * @fw_min_count: minimnum count of buffers needed by fw
  * @state: instance state
+ * @sub_state: instance sub state
  * @once_per_session_set: boolean to set once per session property
  * @m2m_dev:	a reference to m2m device structure
  * @m2m_ctx:	a reference to m2m context structure
@@ -56,6 +57,7 @@ struct iris_inst {
 	struct iris_buffers		buffers[BUF_TYPE_MAX];
 	u32				fw_min_count;
 	enum iris_inst_state		state;
+	enum iris_inst_sub_state	sub_state;
 	bool				once_per_session_set;
 	struct v4l2_m2m_dev		*m2m_dev;
 	struct v4l2_m2m_ctx		*m2m_ctx;
diff --git a/drivers/media/platform/qcom/iris/iris_state.c b/drivers/media/platform/qcom/iris/iris_state.c
index 14a7f03a012c..e39c110b75e0 100644
--- a/drivers/media/platform/qcom/iris/iris_state.c
+++ b/drivers/media/platform/qcom/iris/iris_state.c
@@ -114,3 +114,67 @@ int iris_inst_state_change_streamoff(struct iris_inst *inst, u32 plane)
 
 	return iris_inst_change_state(inst, new_state);
 }
+
+int iris_inst_change_sub_state(struct iris_inst *inst,
+			       enum iris_inst_sub_state clear_sub_state,
+			       enum iris_inst_sub_state set_sub_state)
+{
+	enum iris_inst_sub_state prev_sub_state;
+
+	if (inst->state == IRIS_INST_ERROR)
+		return 0;
+
+	if (!clear_sub_state && !set_sub_state)
+		return 0;
+
+	if ((clear_sub_state & set_sub_state) ||
+	    set_sub_state > IRIS_INST_MAX_SUB_STATE_VALUE ||
+	    clear_sub_state > IRIS_INST_MAX_SUB_STATE_VALUE)
+		return -EINVAL;
+
+	prev_sub_state = inst->sub_state;
+
+	inst->sub_state |= set_sub_state;
+	inst->sub_state &= ~clear_sub_state;
+
+	if (inst->sub_state != prev_sub_state)
+		dev_dbg(inst->core->dev, "sub_state changed from %x to %x\n",
+			prev_sub_state, inst->sub_state);
+
+	return 0;
+}
+
+int iris_inst_sub_state_change_drc(struct iris_inst *inst)
+{
+	enum iris_inst_sub_state set_sub_state = 0;
+
+	if (inst->sub_state & IRIS_INST_SUB_DRC)
+		return -EINVAL;
+
+	if (inst->state == IRIS_INST_INPUT_STREAMING ||
+	    inst->state == IRIS_INST_INIT)
+		set_sub_state = IRIS_INST_SUB_FIRST_IPSC | IRIS_INST_SUB_INPUT_PAUSE;
+	else
+		set_sub_state = IRIS_INST_SUB_DRC | IRIS_INST_SUB_INPUT_PAUSE;
+
+	return iris_inst_change_sub_state(inst, 0, set_sub_state);
+}
+
+int iris_inst_sub_state_change_drc_last(struct iris_inst *inst)
+{
+	enum iris_inst_sub_state set_sub_state = IRIS_INST_SUB_NONE;
+
+	if (inst->sub_state & IRIS_INST_SUB_DRC_LAST)
+		return -EINVAL;
+
+	if (!(inst->sub_state & IRIS_INST_SUB_DRC) ||
+	    !(inst->sub_state & IRIS_INST_SUB_INPUT_PAUSE))
+		return -EINVAL;
+
+	if (inst->sub_state & IRIS_INST_SUB_FIRST_IPSC)
+		return 0;
+
+	set_sub_state = IRIS_INST_SUB_DRC_LAST | IRIS_INST_SUB_OUTPUT_PAUSE;
+
+	return iris_inst_change_sub_state(inst, 0, set_sub_state);
+}
diff --git a/drivers/media/platform/qcom/iris/iris_state.h b/drivers/media/platform/qcom/iris/iris_state.h
index d6613970a24e..786b82ca0307 100644
--- a/drivers/media/platform/qcom/iris/iris_state.h
+++ b/drivers/media/platform/qcom/iris/iris_state.h
@@ -91,10 +91,45 @@ enum iris_inst_state {
 	IRIS_INST_STREAMING,
 	IRIS_INST_ERROR,
 };
+
+#define IRIS_INST_SUB_NONE		0
+#define IRIS_INST_SUB_STATES		8
+#define IRIS_INST_MAX_SUB_STATE_VALUE	((1 << IRIS_INST_SUB_STATES) - 1)
+
+/**
+ * enum iris_inst_sub_state
+ *
+ * IRIS_INST_SUB_FIRST_IPSC: indicates source change is received from firmware
+ *			     when output port is not yet streaming.
+ * IRIS_INST_SUB_DRC: indicates source change is received from firmware
+ *		      when output port is streaming and source change event is
+ *		      sent to client.
+ * IRIS_INST_SUB_DRC_LAST: indicates last buffer is received from firmware
+ *                         as part of source change.
+ * IRIS_INST_SUB_INPUT_PAUSE: source change is received form firmware. This
+ *                            indicates that firmware is paused to process
+ *                            any further input frames.
+ * IRIS_INST_SUB_OUTPUT_PAUSE: last buffer is received form firmware as part
+ *                             of drc sequence. This indicates that
+ *                             firmware is paused to process any further output frames.
+ */
+enum iris_inst_sub_state {
+	IRIS_INST_SUB_FIRST_IPSC	= BIT(0),
+	IRIS_INST_SUB_DRC		= BIT(1),
+	IRIS_INST_SUB_DRC_LAST		= BIT(2),
+	IRIS_INST_SUB_INPUT_PAUSE	= BIT(3),
+	IRIS_INST_SUB_OUTPUT_PAUSE	= BIT(4),
+};
+
 void iris_change_core_state(struct iris_core *core,
 			    enum iris_core_state request_state);
 int iris_inst_change_state(struct iris_inst *inst,
 			   enum iris_inst_state request_state);
+int iris_inst_change_sub_state(struct iris_inst *inst,
+			       enum iris_inst_sub_state clear_sub_state,
+			       enum iris_inst_sub_state set_sub_state);
 int iris_inst_state_change_streamon(struct iris_inst *inst, u32 plane);
 int iris_inst_state_change_streamoff(struct iris_inst *inst, u32 plane);
+int iris_inst_sub_state_change_drc(struct iris_inst *inst);
+int iris_inst_sub_state_change_drc_last(struct iris_inst *inst);
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
index 391c8225923d..cc9d5f14d125 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -4,6 +4,7 @@
  */
 
 #include <media/videobuf2-dma-contig.h>
+#include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
 
 #include "iris_buffer.h"
@@ -204,6 +205,7 @@ void iris_vb2_stop_streaming(struct vb2_queue *q)
 
 void iris_vb2_buf_queue(struct vb2_buffer *vb2)
 {
+	static const struct v4l2_event eos = { .type = V4L2_EVENT_EOS };
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb2);
 	struct v4l2_m2m_ctx *m2m_ctx;
 	struct iris_inst *inst;
@@ -226,6 +228,19 @@ void iris_vb2_buf_queue(struct vb2_buffer *vb2)
 		goto exit;
 	}
 
+	if (V4L2_TYPE_IS_CAPTURE(vb2->vb2_queue->type)) {
+		if (inst->sub_state & IRIS_INST_SUB_DRC &&
+		    inst->sub_state & IRIS_INST_SUB_DRC_LAST) {
+			vbuf->flags |= V4L2_BUF_FLAG_LAST;
+			vbuf->field = V4L2_FIELD_NONE;
+			vb2_set_plane_payload(vb2, 0, 0);
+			v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
+			if (inst->subscriptions & V4L2_EVENT_EOS)
+				v4l2_event_queue_fh(&inst->fh, &eos);
+			goto exit;
+		}
+	}
+
 	v4l2_m2m_buf_queue(m2m_ctx, vbuf);
 
 	ret = iris_vdec_qbuf(inst, vbuf);
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 17afb3c123c9..2ac17688da0f 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -256,6 +256,21 @@ int iris_vdec_subscribe_event(struct iris_inst *inst, const struct v4l2_event_su
 	return ret;
 }
 
+void iris_vdec_src_change(struct iris_inst *inst)
+{
+	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
+	struct v4l2_event event = {0};
+	struct vb2_queue *src_q;
+
+	src_q = v4l2_m2m_get_src_vq(m2m_ctx);
+	if (!vb2_is_streaming(src_q))
+		return;
+
+	event.type = V4L2_EVENT_SOURCE_CHANGE;
+	event.u.src_change.changes = V4L2_EVENT_SRC_CH_RESOLUTION;
+	v4l2_event_queue_fh(&inst->fh, &event);
+}
+
 static int iris_vdec_get_num_queued_buffers(struct iris_inst *inst,
 					    enum iris_buffer_type type)
 {
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.h b/drivers/media/platform/qcom/iris/iris_vdec.h
index 51bf0b96d9f0..a5d63d6f7723 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.h
+++ b/drivers/media/platform/qcom/iris/iris_vdec.h
@@ -14,6 +14,7 @@ int iris_vdec_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f);
 int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f);
 int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f);
 int iris_vdec_subscribe_event(struct iris_inst *inst, const struct v4l2_event_subscription *sub);
+void iris_vdec_src_change(struct iris_inst *inst);
 int iris_vdec_streamon_input(struct iris_inst *inst);
 int iris_vdec_streamon_output(struct iris_inst *inst);
 int iris_vdec_qbuf(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf);

-- 
2.34.1



