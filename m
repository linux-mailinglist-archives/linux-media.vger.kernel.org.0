Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22464766E2D
	for <lists+linux-media@lfdr.de>; Fri, 28 Jul 2023 15:26:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236748AbjG1N0P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jul 2023 09:26:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236755AbjG1N0C (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jul 2023 09:26:02 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22F154217;
        Fri, 28 Jul 2023 06:25:47 -0700 (PDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36S6sxYe013477;
        Fri, 28 Jul 2023 13:25:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=hSzVg+ovAm3QNuBLt8y/SoqBD2ilpNPN3GdQG5PzeIA=;
 b=LrJvpNJPD9AVBbhYleGH15/jilTcOhZN7sIvSG/060jKNrTkwGzWDJmASR316d47HvTf
 ouQDU8Mh9JoTu+8HwASkbXDTSCv2oXbmejjP02saGoVEXd8QbyG4BortQkfVALMVh3Ca
 X5r1b5+jJhacK90jBk+JUOpWiC8WLFALUEYwOtOEh1ipXuf61wkpsptf3NCv1sWmuCeF
 RpJNd945faeMpnVF4vWxAkdAls4rT9zTy0Ns3yayyQuySzydVIe/2gQ5bAm6gaAWni6U
 r+NXoRF2PFiijmkBSvJWQ75sEsUIv40J34Bhd2R+fMRy8Tvf39pnJk5UKDGiuFtle0Fc 3g== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s447kh7t7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 28 Jul 2023 13:25:35 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
        by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36SDPZ6f025638
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 28 Jul 2023 13:25:35 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Fri, 28 Jul 2023 06:25:31 -0700
From:   Vikash Garodia <quic_vgarodia@quicinc.com>
To:     <stanimir.k.varbanov@gmail.com>, <agross@kernel.org>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <mchehab@kernel.org>, <hans.verkuil@cisco.com>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
CC:     <quic_dikshita@quicinc.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>
Subject: [PATCH 07/33] iris: iris: add video encoder files
Date:   Fri, 28 Jul 2023 18:53:18 +0530
Message-ID: <1690550624-14642-8-git-send-email-quic_vgarodia@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1690550624-14642-1-git-send-email-quic_vgarodia@quicinc.com>
References: <1690550624-14642-1-git-send-email-quic_vgarodia@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: BXbbYEQV5DXc9IPMd0Fve2pJVYZNmuYN
X-Proofpoint-GUID: BXbbYEQV5DXc9IPMd0Fve2pJVYZNmuYN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307280124
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PDS_OTHER_BAD_TLD,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This implements video encoder functionalities of the driver.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
 .../media/platform/qcom/iris/vidc/inc/msm_venc.h   |   34 +
 .../media/platform/qcom/iris/vidc/src/msm_venc.c   | 1484 ++++++++++++++++++++
 2 files changed, 1518 insertions(+)
 create mode 100644 drivers/media/platform/qcom/iris/vidc/inc/msm_venc.h
 create mode 100644 drivers/media/platform/qcom/iris/vidc/src/msm_venc.c

diff --git a/drivers/media/platform/qcom/iris/vidc/inc/msm_venc.h b/drivers/media/platform/qcom/iris/vidc/inc/msm_venc.h
new file mode 100644
index 0000000..bb0a395
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/vidc/inc/msm_venc.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _MSM_VENC_H_
+#define _MSM_VENC_H_
+
+#include "msm_vidc_core.h"
+#include "msm_vidc_inst.h"
+
+int msm_venc_streamoff_input(struct msm_vidc_inst *inst);
+int msm_venc_streamon_input(struct msm_vidc_inst *inst);
+int msm_venc_streamoff_output(struct msm_vidc_inst *inst);
+int msm_venc_streamon_output(struct msm_vidc_inst *inst);
+int msm_venc_qbuf(struct msm_vidc_inst *inst, struct vb2_buffer *vb2);
+int msm_venc_stop_cmd(struct msm_vidc_inst *inst);
+int msm_venc_start_cmd(struct msm_vidc_inst *inst);
+int msm_venc_try_fmt(struct msm_vidc_inst *inst, struct v4l2_format *f);
+int msm_venc_s_fmt(struct msm_vidc_inst *inst, struct v4l2_format *f);
+int msm_venc_s_fmt_output(struct msm_vidc_inst *inst, struct v4l2_format *f);
+int msm_venc_g_fmt(struct msm_vidc_inst *inst, struct v4l2_format *f);
+int msm_venc_s_selection(struct msm_vidc_inst *inst, struct v4l2_selection *s);
+int msm_venc_g_selection(struct msm_vidc_inst *inst, struct v4l2_selection *s);
+int msm_venc_s_param(struct msm_vidc_inst *inst, struct v4l2_streamparm *s_parm);
+int msm_venc_g_param(struct msm_vidc_inst *inst, struct v4l2_streamparm *s_parm);
+int msm_venc_subscribe_event(struct msm_vidc_inst *inst,
+			     const struct v4l2_event_subscription *sub);
+int msm_venc_enum_fmt(struct msm_vidc_inst *inst, struct v4l2_fmtdesc *f);
+int msm_venc_inst_init(struct msm_vidc_inst *inst);
+int msm_venc_inst_deinit(struct msm_vidc_inst *inst);
+
+#endif // _MSM_VENC_H_
diff --git a/drivers/media/platform/qcom/iris/vidc/src/msm_venc.c b/drivers/media/platform/qcom/iris/vidc/src/msm_venc.c
new file mode 100644
index 0000000..4962716
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/vidc/src/msm_venc.c
@@ -0,0 +1,1484 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include "hfi_packet.h"
+#include "msm_media_info.h"
+#include "msm_venc.h"
+#include "msm_vidc_control.h"
+#include "msm_vidc_core.h"
+#include "msm_vidc_debug.h"
+#include "msm_vidc_driver.h"
+#include "msm_vidc_inst.h"
+#include "msm_vidc_internal.h"
+#include "msm_vidc_platform.h"
+#include "msm_vidc_power.h"
+#include "venus_hfi.h"
+
+static const u32 msm_venc_input_set_prop[] = {
+	HFI_PROP_COLOR_FORMAT,
+	HFI_PROP_RAW_RESOLUTION,
+	HFI_PROP_CROP_OFFSETS,
+	HFI_PROP_LINEAR_STRIDE_SCANLINE,
+	HFI_PROP_SIGNAL_COLOR_INFO,
+};
+
+static const u32 msm_venc_output_set_prop[] = {
+	HFI_PROP_BITSTREAM_RESOLUTION,
+	HFI_PROP_CROP_OFFSETS,
+};
+
+static const u32 msm_venc_input_subscribe_for_properties[] = {
+	HFI_PROP_NO_OUTPUT,
+};
+
+static const u32 msm_venc_output_subscribe_for_properties[] = {
+	HFI_PROP_PICTURE_TYPE,
+	HFI_PROP_BUFFER_MARK,
+	HFI_PROP_WORST_COMPRESSION_RATIO,
+};
+
+static const u32 msm_venc_output_internal_buffer_type[] = {
+	MSM_VIDC_BUF_BIN,
+	MSM_VIDC_BUF_COMV,
+	MSM_VIDC_BUF_NON_COMV,
+	MSM_VIDC_BUF_LINE,
+	MSM_VIDC_BUF_DPB,
+};
+
+static const u32 msm_venc_input_internal_buffer_type[] = {
+	MSM_VIDC_BUF_VPSS,
+};
+
+struct msm_venc_prop_type_handle {
+	u32 type;
+	int (*handle)(struct msm_vidc_inst *inst, enum msm_vidc_port_type port);
+};
+
+static int msm_venc_codec_change(struct msm_vidc_inst *inst, u32 v4l2_codec)
+{
+	int rc = 0;
+	bool session_init = false;
+
+	if (!inst->codec)
+		session_init = true;
+
+	if (inst->codec && inst->fmts[OUTPUT_PORT].fmt.pix_mp.pixelformat == v4l2_codec)
+		return 0;
+
+	i_vpr_h(inst, "%s: codec changed from %s to %s\n",
+		__func__, v4l2_pixelfmt_name(inst, inst->fmts[OUTPUT_PORT].fmt.pix_mp.pixelformat),
+		v4l2_pixelfmt_name(inst, v4l2_codec));
+
+	inst->codec = v4l2_codec_to_driver(inst, v4l2_codec, __func__);
+	if (!inst->codec) {
+		i_vpr_e(inst, "%s: invalid codec %#x\n", __func__, v4l2_codec);
+		rc = -EINVAL;
+		goto exit;
+	}
+
+	inst->fmts[OUTPUT_PORT].fmt.pix_mp.pixelformat = v4l2_codec;
+	rc = msm_vidc_update_debug_str(inst);
+	if (rc)
+		goto exit;
+
+	rc = msm_vidc_get_inst_capability(inst);
+	if (rc)
+		goto exit;
+
+	rc = msm_vidc_ctrl_handler_init(inst, session_init);
+	if (rc)
+		goto exit;
+
+	rc = msm_vidc_update_buffer_count(inst, INPUT_PORT);
+	if (rc)
+		goto exit;
+
+	rc = msm_vidc_update_buffer_count(inst, OUTPUT_PORT);
+	if (rc)
+		goto exit;
+
+exit:
+	return rc;
+}
+
+/* todo: add logs for each property once finalised */
+static int msm_venc_set_colorformat(struct msm_vidc_inst *inst,
+				    enum msm_vidc_port_type port)
+{
+	int rc = 0;
+	u32 pixelformat;
+	enum msm_vidc_colorformat_type colorformat;
+	u32 hfi_colorformat;
+
+	if (port != INPUT_PORT) {
+		i_vpr_e(inst, "%s: invalid port %d\n", __func__, port);
+		return -EINVAL;
+	}
+
+	pixelformat = inst->fmts[INPUT_PORT].fmt.pix_mp.pixelformat;
+	colorformat = v4l2_colorformat_to_driver(inst, pixelformat, __func__);
+	if (!(colorformat & inst->capabilities[PIX_FMTS].step_or_mask)) {
+		i_vpr_e(inst, "%s: invalid pixelformat %s\n",
+			__func__, v4l2_pixelfmt_name(inst, pixelformat));
+		return -EINVAL;
+	}
+
+	hfi_colorformat = get_hfi_colorformat(inst, colorformat);
+	i_vpr_h(inst, "%s: hfi colorformat: %#x", __func__,
+		hfi_colorformat);
+	rc = venus_hfi_session_property(inst,
+					HFI_PROP_COLOR_FORMAT,
+					HFI_HOST_FLAGS_NONE,
+					get_hfi_port(inst, port),
+					HFI_PAYLOAD_U32_ENUM,
+					&hfi_colorformat,
+					sizeof(u32));
+	if (rc)
+		return rc;
+	return 0;
+}
+
+static int msm_venc_set_stride_scanline(struct msm_vidc_inst *inst,
+					enum msm_vidc_port_type port)
+{
+	int rc = 0;
+	u32 color_format, stride_y, scanline_y;
+	u32 stride_uv = 0, scanline_uv = 0;
+	u32 payload[2];
+
+	if (port != INPUT_PORT) {
+		i_vpr_e(inst, "%s: invalid port %d\n", __func__, port);
+		return -EINVAL;
+	}
+
+	color_format = inst->capabilities[PIX_FMTS].value;
+	if (!is_linear_colorformat(color_format)) {
+		i_vpr_h(inst,
+			"%s: not a linear color fmt, property is not set\n",
+			__func__);
+		return 0;
+	}
+
+	if (is_rgba_colorformat(color_format)) {
+		stride_y = video_rgb_stride_pix(color_format,
+						inst->fmts[INPUT_PORT].fmt.pix_mp.width);
+		scanline_y = video_rgb_scanlines(color_format,
+						 inst->fmts[INPUT_PORT].fmt.pix_mp.height);
+	} else {
+		stride_y = video_y_stride_pix(color_format,
+					      inst->fmts[INPUT_PORT].fmt.pix_mp.width);
+		scanline_y = video_y_scanlines(color_format,
+					       inst->fmts[INPUT_PORT].fmt.pix_mp.height);
+	}
+	if (color_format == MSM_VIDC_FMT_NV12 ||
+	    color_format == MSM_VIDC_FMT_P010 ||
+	    color_format == MSM_VIDC_FMT_NV21) {
+		stride_uv = stride_y;
+		scanline_uv = scanline_y / 2;
+	}
+
+	payload[0] = stride_y << 16 | scanline_y;
+	payload[1] = stride_uv << 16 | scanline_uv;
+	i_vpr_h(inst,
+		"%s: y: stride %d scanline, %d uv: stride %d scanline_uv %d",
+		__func__,
+		stride_y, scanline_y, stride_uv, scanline_uv);
+	rc = venus_hfi_session_property(inst,
+					HFI_PROP_LINEAR_STRIDE_SCANLINE,
+					HFI_HOST_FLAGS_NONE,
+					get_hfi_port(inst, port),
+					HFI_PAYLOAD_64_PACKED,
+					&payload,
+					sizeof(u64));
+	if (rc)
+		return rc;
+
+	return 0;
+}
+
+static int msm_venc_set_raw_resolution(struct msm_vidc_inst *inst,
+				       enum msm_vidc_port_type port)
+{
+	int rc = 0;
+	u32 resolution;
+
+	if (port != INPUT_PORT) {
+		i_vpr_e(inst, "%s: invalid port %d\n", __func__, port);
+		return -EINVAL;
+	}
+
+	resolution = (inst->fmts[port].fmt.pix_mp.width << 16) |
+		inst->fmts[port].fmt.pix_mp.height;
+	i_vpr_h(inst, "%s: width: %d height: %d\n", __func__,
+		inst->fmts[port].fmt.pix_mp.width, inst->fmts[port].fmt.pix_mp.height);
+	rc = venus_hfi_session_property(inst,
+					HFI_PROP_RAW_RESOLUTION,
+					HFI_HOST_FLAGS_NONE,
+					get_hfi_port(inst, port),
+					HFI_PAYLOAD_32_PACKED,
+					&resolution,
+					sizeof(u32));
+	if (rc)
+		return rc;
+	return 0;
+}
+
+static int msm_venc_set_bitstream_resolution(struct msm_vidc_inst *inst,
+					     enum msm_vidc_port_type port)
+{
+	int rc = 0;
+	u32 resolution;
+
+	if (port != OUTPUT_PORT) {
+		i_vpr_e(inst, "%s: invalid port %d\n", __func__, port);
+		return -EINVAL;
+	}
+
+	resolution = (inst->fmts[port].fmt.pix_mp.width << 16) |
+		inst->fmts[port].fmt.pix_mp.height;
+	i_vpr_h(inst, "%s: width: %d height: %d\n", __func__,
+		inst->fmts[port].fmt.pix_mp.width,
+		inst->fmts[port].fmt.pix_mp.height);
+	rc = venus_hfi_session_property(inst,
+					HFI_PROP_BITSTREAM_RESOLUTION,
+					HFI_HOST_FLAGS_NONE,
+					get_hfi_port(inst, port),
+					HFI_PAYLOAD_32_PACKED,
+					&resolution,
+					sizeof(u32));
+	if (rc)
+		return rc;
+	return 0;
+}
+
+static int msm_venc_set_crop_offsets(struct msm_vidc_inst *inst,
+				     enum msm_vidc_port_type port)
+{
+	int rc = 0;
+	u32 left_offset, top_offset, right_offset, bottom_offset;
+	u32 crop[2] = {0};
+	u32 width, height;
+
+	if (port != OUTPUT_PORT && port != INPUT_PORT) {
+		i_vpr_e(inst, "%s: invalid port %d\n", __func__, port);
+		return -EINVAL;
+	}
+
+	if (port == INPUT_PORT) {
+		left_offset = inst->crop.left;
+		top_offset = inst->crop.top;
+		width = inst->crop.width;
+		height = inst->crop.height;
+	} else {
+		left_offset = inst->compose.left;
+		top_offset = inst->compose.top;
+		width = inst->compose.width;
+		height = inst->compose.height;
+		if (is_rotation_90_or_270(inst)) {
+			width = inst->compose.height;
+			height = inst->compose.width;
+		}
+	}
+
+	right_offset = (inst->fmts[port].fmt.pix_mp.width - width);
+	bottom_offset = (inst->fmts[port].fmt.pix_mp.height - height);
+
+	crop[0] = left_offset << 16 | top_offset;
+	crop[1] = right_offset << 16 | bottom_offset;
+	i_vpr_h(inst,
+		"%s: l_off: %d t_off: %d r_off: %d b_off: %d",
+		__func__,
+		left_offset, top_offset, right_offset, bottom_offset);
+
+	rc = venus_hfi_session_property(inst,
+					HFI_PROP_CROP_OFFSETS,
+					HFI_HOST_FLAGS_NONE,
+					get_hfi_port(inst, port),
+					HFI_PAYLOAD_64_PACKED,
+					&crop,
+					sizeof(u64));
+	if (rc)
+		return rc;
+	return 0;
+}
+
+static int msm_venc_set_colorspace(struct msm_vidc_inst *inst,
+				   enum msm_vidc_port_type port)
+{
+	int rc = 0;
+	u32 primaries = MSM_VIDC_PRIMARIES_RESERVED;
+	u32 matrix_coeff = MSM_VIDC_MATRIX_COEFF_RESERVED;
+	u32 transfer_char = MSM_VIDC_TRANSFER_RESERVED;
+	u32 full_range = 0;
+	u32 colour_description_present_flag = 0;
+	u32 video_signal_type_present_flag = 0, payload = 0;
+	/* Unspecified video format */
+	u32 video_format = 5;
+	struct v4l2_format *input_fmt;
+	u32 pix_fmt;
+	struct v4l2_pix_format_mplane *pixmp = NULL;
+
+	if (port != INPUT_PORT) {
+		i_vpr_e(inst, "%s: invalid port %d\n", __func__, port);
+		return -EINVAL;
+	}
+
+	if (inst->capabilities[SIGNAL_COLOR_INFO].flags & CAP_FLAG_CLIENT_SET) {
+		i_vpr_h(inst, "%s: client configured colorspace via control\n", __func__);
+		return 0;
+	}
+
+	input_fmt = &inst->fmts[INPUT_PORT];
+	pixmp = &inst->fmts[port].fmt.pix_mp;
+	pix_fmt = v4l2_colorformat_to_driver(inst,
+					     input_fmt->fmt.pix_mp.pixelformat, __func__);
+	if (pixmp->colorspace != V4L2_COLORSPACE_DEFAULT ||
+	    pixmp->ycbcr_enc != V4L2_YCBCR_ENC_DEFAULT ||
+	    pixmp->xfer_func != V4L2_XFER_FUNC_DEFAULT) {
+		colour_description_present_flag = 1;
+		video_signal_type_present_flag = 1;
+		primaries = v4l2_color_primaries_to_driver(inst,
+							   pixmp->colorspace, __func__);
+		matrix_coeff = v4l2_matrix_coeff_to_driver(inst,
+							   pixmp->ycbcr_enc, __func__);
+		transfer_char = v4l2_transfer_char_to_driver(inst,
+							     pixmp->xfer_func, __func__);
+	} else if (is_rgba_colorformat(pix_fmt)) {
+		colour_description_present_flag = 1;
+		video_signal_type_present_flag = 1;
+		primaries = MSM_VIDC_PRIMARIES_BT709;
+		matrix_coeff = MSM_VIDC_MATRIX_COEFF_BT709;
+		transfer_char = MSM_VIDC_TRANSFER_BT709;
+		full_range = 0;
+	}
+
+	if (pixmp->quantization !=
+	    V4L2_QUANTIZATION_DEFAULT) {
+		video_signal_type_present_flag = 1;
+		full_range = pixmp->quantization ==
+			V4L2_QUANTIZATION_FULL_RANGE ? 1 : 0;
+	}
+
+	payload = (matrix_coeff & 0xFF) |
+		((transfer_char << 8) & 0xFF00) |
+		((primaries << 16) & 0xFF0000) |
+		((colour_description_present_flag << 24) & 0x1000000) |
+		((full_range << 25) & 0x2000000) |
+		((video_format << 26) & 0x1C000000) |
+		((video_signal_type_present_flag << 29) & 0x20000000);
+	i_vpr_h(inst, "%s: color info: %#x\n", __func__, payload);
+	rc = venus_hfi_session_property(inst,
+					HFI_PROP_SIGNAL_COLOR_INFO,
+					HFI_HOST_FLAGS_NONE,
+					get_hfi_port(inst, port),
+					HFI_PAYLOAD_32_PACKED,
+					&payload,
+					sizeof(u32));
+	if (rc)
+		return rc;
+	return 0;
+}
+
+static int msm_venc_set_quality_mode(struct msm_vidc_inst *inst)
+{
+	int rc = 0;
+	struct msm_vidc_core *core = inst->core;
+	u32 mode;
+
+	rc = call_session_op(core, decide_quality_mode, inst);
+	if (rc) {
+		i_vpr_e(inst, "%s: decide_work_route failed\n",
+			__func__);
+		return -EINVAL;
+	}
+
+	mode = inst->capabilities[QUALITY_MODE].value;
+	i_vpr_h(inst, "%s: quality_mode: %u\n", __func__, mode);
+	rc = venus_hfi_session_property(inst,
+					HFI_PROP_QUALITY_MODE,
+					HFI_HOST_FLAGS_NONE,
+					HFI_PORT_BITSTREAM,
+					HFI_PAYLOAD_U32_ENUM,
+					&mode,
+					sizeof(u32));
+	if (rc)
+		return rc;
+	return 0;
+}
+
+static int msm_venc_set_ring_buffer_count(struct msm_vidc_inst *inst)
+{
+	int rc = 0;
+	struct msm_vidc_inst_cap *cap;
+
+	cap = &inst->capabilities[ENC_RING_BUFFER_COUNT];
+
+	if (!cap->set)
+		return 0;
+
+	rc = cap->set(inst, ENC_RING_BUFFER_COUNT);
+	if (rc) {
+		i_vpr_e(inst, "%s: set cap failed\n", __func__);
+		return rc;
+	}
+
+	return 0;
+}
+
+static int msm_venc_set_input_properties(struct msm_vidc_inst *inst)
+{
+	int i, j, rc = 0;
+	static const struct msm_venc_prop_type_handle prop_type_handle_arr[] = {
+		{HFI_PROP_COLOR_FORMAT,               msm_venc_set_colorformat                 },
+		{HFI_PROP_RAW_RESOLUTION,             msm_venc_set_raw_resolution              },
+		{HFI_PROP_CROP_OFFSETS,               msm_venc_set_crop_offsets                },
+		{HFI_PROP_LINEAR_STRIDE_SCANLINE,     msm_venc_set_stride_scanline             },
+		{HFI_PROP_SIGNAL_COLOR_INFO,          msm_venc_set_colorspace                  },
+	};
+
+	for (i = 0; i < ARRAY_SIZE(msm_venc_input_set_prop); i++) {
+		/* set session input properties */
+		for (j = 0; j < ARRAY_SIZE(prop_type_handle_arr); j++) {
+			if (prop_type_handle_arr[j].type == msm_venc_input_set_prop[i]) {
+				rc = prop_type_handle_arr[j].handle(inst, INPUT_PORT);
+				if (rc)
+					goto exit;
+				break;
+			}
+		}
+
+		/* is property type unknown ? */
+		if (j == ARRAY_SIZE(prop_type_handle_arr))
+			i_vpr_e(inst, "%s: unknown property %#x\n", __func__,
+				msm_venc_input_set_prop[i]);
+	}
+
+exit:
+	return rc;
+}
+
+static int msm_venc_set_output_properties(struct msm_vidc_inst *inst)
+{
+	int i, j, rc = 0;
+	static const struct msm_venc_prop_type_handle prop_type_handle_arr[] = {
+		{HFI_PROP_BITSTREAM_RESOLUTION,       msm_venc_set_bitstream_resolution    },
+		{HFI_PROP_CROP_OFFSETS,               msm_venc_set_crop_offsets            },
+	};
+
+	for (i = 0; i < ARRAY_SIZE(msm_venc_output_set_prop); i++) {
+		/* set session output properties */
+		for (j = 0; j < ARRAY_SIZE(prop_type_handle_arr); j++) {
+			if (prop_type_handle_arr[j].type == msm_venc_output_set_prop[i]) {
+				rc = prop_type_handle_arr[j].handle(inst, OUTPUT_PORT);
+				if (rc)
+					goto exit;
+				break;
+			}
+		}
+
+		/* is property type unknown ? */
+		if (j == ARRAY_SIZE(prop_type_handle_arr))
+			i_vpr_e(inst, "%s: unknown property %#x\n", __func__,
+				msm_venc_output_set_prop[i]);
+	}
+
+exit:
+	return rc;
+}
+
+static int msm_venc_set_internal_properties(struct msm_vidc_inst *inst)
+{
+	int rc = 0;
+
+	rc = msm_venc_set_quality_mode(inst);
+	if (rc)
+		return rc;
+
+	rc = msm_venc_set_ring_buffer_count(inst);
+
+	return rc;
+}
+
+static int msm_venc_get_input_internal_buffers(struct msm_vidc_inst *inst)
+{
+	int i, rc = 0;
+
+	for (i = 0; i < ARRAY_SIZE(msm_venc_input_internal_buffer_type); i++) {
+		rc = msm_vidc_get_internal_buffers(inst, msm_venc_input_internal_buffer_type[i]);
+		if (rc)
+			return rc;
+	}
+
+	return rc;
+}
+
+static int msm_venc_destroy_internal_buffers(struct msm_vidc_inst *inst,
+					     enum msm_vidc_port_type port)
+{
+	int rc = 0;
+	struct msm_vidc_buffers *buffers;
+	struct msm_vidc_buffer *buf, *dummy;
+	const u32 *internal_buf_type;
+	u32 i, len;
+
+	if (port == INPUT_PORT) {
+		internal_buf_type = msm_venc_input_internal_buffer_type;
+		len = ARRAY_SIZE(msm_venc_input_internal_buffer_type);
+	} else {
+		internal_buf_type = msm_venc_output_internal_buffer_type;
+		len = ARRAY_SIZE(msm_venc_output_internal_buffer_type);
+	}
+
+	for (i = 0; i < len; i++) {
+		buffers = msm_vidc_get_buffers(inst, internal_buf_type[i], __func__);
+		if (!buffers)
+			return -EINVAL;
+
+		if (buffers->reuse) {
+			i_vpr_l(inst, "%s: reuse enabled for %s\n", __func__,
+				buf_name(internal_buf_type[i]));
+			continue;
+		}
+
+		list_for_each_entry_safe(buf, dummy, &buffers->list, list) {
+			i_vpr_h(inst,
+				"%s: destroying internal buffer: type %d idx %d fd %d addr %#llx size %d\n",
+				__func__, buf->type, buf->index, buf->fd,
+				buf->device_addr, buf->buffer_size);
+
+			rc = msm_vidc_destroy_internal_buffer(inst, buf);
+			if (rc)
+				return rc;
+		}
+	}
+
+	return 0;
+}
+
+static int msm_venc_create_input_internal_buffers(struct msm_vidc_inst *inst)
+{
+	int i, rc = 0;
+
+	for (i = 0; i < ARRAY_SIZE(msm_venc_input_internal_buffer_type); i++) {
+		rc = msm_vidc_create_internal_buffers(inst, msm_venc_input_internal_buffer_type[i]);
+		if (rc)
+			return rc;
+	}
+
+	return rc;
+}
+
+static int msm_venc_queue_input_internal_buffers(struct msm_vidc_inst *inst)
+{
+	int i, rc = 0;
+
+	for (i = 0; i < ARRAY_SIZE(msm_venc_input_internal_buffer_type); i++) {
+		rc = msm_vidc_queue_internal_buffers(inst, msm_venc_input_internal_buffer_type[i]);
+		if (rc)
+			return rc;
+	}
+
+	return rc;
+}
+
+static int msm_venc_get_output_internal_buffers(struct msm_vidc_inst *inst)
+{
+	int i, rc = 0;
+
+	for (i = 0; i < ARRAY_SIZE(msm_venc_output_internal_buffer_type); i++) {
+		rc = msm_vidc_get_internal_buffers(inst, msm_venc_output_internal_buffer_type[i]);
+		if (rc)
+			return rc;
+	}
+
+	return rc;
+}
+
+static int msm_venc_create_output_internal_buffers(struct msm_vidc_inst *inst)
+{
+	int i, rc = 0;
+
+	for (i = 0; i < ARRAY_SIZE(msm_venc_output_internal_buffer_type); i++) {
+		rc = msm_vidc_create_internal_buffers(inst,
+						      msm_venc_output_internal_buffer_type[i]);
+		if (rc)
+			return rc;
+	}
+
+	return 0;
+}
+
+static int msm_venc_queue_output_internal_buffers(struct msm_vidc_inst *inst)
+{
+	int i, rc = 0;
+
+	for (i = 0; i < ARRAY_SIZE(msm_venc_output_internal_buffer_type); i++) {
+		rc = msm_vidc_queue_internal_buffers(inst, msm_venc_output_internal_buffer_type[i]);
+		if (rc)
+			return rc;
+	}
+
+	return 0;
+}
+
+static int msm_venc_property_subscription(struct msm_vidc_inst *inst,
+					  enum msm_vidc_port_type port)
+{
+	u32 payload[32] = {0};
+	u32 i;
+	u32 payload_size = 0;
+
+	payload[0] = HFI_MODE_PROPERTY;
+	if (port == INPUT_PORT) {
+		for (i = 0; i < ARRAY_SIZE(msm_venc_input_subscribe_for_properties); i++)
+			payload[i + 1] = msm_venc_input_subscribe_for_properties[i];
+		payload_size = (ARRAY_SIZE(msm_venc_input_subscribe_for_properties) + 1) *
+				sizeof(u32);
+	} else if (port == OUTPUT_PORT) {
+		for (i = 0; i < ARRAY_SIZE(msm_venc_output_subscribe_for_properties); i++)
+			payload[i + 1] = msm_venc_output_subscribe_for_properties[i];
+		payload_size = (ARRAY_SIZE(msm_venc_output_subscribe_for_properties) + 1) *
+				sizeof(u32);
+	} else {
+		i_vpr_e(inst, "%s: invalid port: %d\n", __func__, port);
+		return -EINVAL;
+	}
+
+	return venus_hfi_session_command(inst,
+				       HFI_CMD_SUBSCRIBE_MODE,
+				       port,
+				       HFI_PAYLOAD_U32_ARRAY,
+				       &payload[0],
+				       payload_size);
+}
+
+int msm_venc_streamoff_input(struct msm_vidc_inst *inst)
+{
+	return msm_vidc_session_streamoff(inst, INPUT_PORT);
+}
+
+int msm_venc_streamon_input(struct msm_vidc_inst *inst)
+{
+	int rc = 0;
+
+	rc = msm_vidc_check_session_supported(inst);
+	if (rc)
+		goto error;
+
+	rc = msm_vidc_check_scaling_supported(inst);
+	if (rc)
+		goto error;
+
+	rc = msm_venc_set_input_properties(inst);
+	if (rc)
+		goto error;
+
+	rc = msm_venc_get_input_internal_buffers(inst);
+	if (rc)
+		goto error;
+
+	rc = msm_venc_destroy_internal_buffers(inst, INPUT_PORT);
+	if (rc)
+		goto error;
+
+	rc = msm_venc_create_input_internal_buffers(inst);
+	if (rc)
+		goto error;
+
+	rc = msm_venc_queue_input_internal_buffers(inst);
+	if (rc)
+		goto error;
+
+	rc = msm_venc_property_subscription(inst, INPUT_PORT);
+	if (rc)
+		goto error;
+
+	rc = msm_vidc_process_streamon_input(inst);
+	if (rc)
+		goto error;
+
+	return 0;
+
+error:
+	i_vpr_e(inst, "%s: failed\n", __func__);
+	return rc;
+}
+
+int msm_venc_qbuf(struct msm_vidc_inst *inst, struct vb2_buffer *vb2)
+{
+	return msm_vidc_queue_buffer_single(inst, vb2);
+}
+
+int msm_venc_stop_cmd(struct msm_vidc_inst *inst)
+{
+	i_vpr_h(inst, "received cmd: drain\n");
+	return msm_vidc_process_drain(inst);
+}
+
+int msm_venc_start_cmd(struct msm_vidc_inst *inst)
+{
+	i_vpr_h(inst, "received cmd: resume\n");
+
+	vb2_clear_last_buffer_dequeued(inst->bufq[OUTPUT_PORT].vb2q);
+
+	/* tune power features */
+	msm_vidc_allow_dcvs(inst);
+	msm_vidc_power_data_reset(inst);
+
+	/* print final buffer counts & size details */
+	msm_vidc_print_buffer_info(inst);
+
+	/* print internal buffer memory usage stats */
+	msm_vidc_print_memory_stats(inst);
+
+	return msm_vidc_process_resume(inst);
+}
+
+int msm_venc_streamoff_output(struct msm_vidc_inst *inst)
+{
+	int rc = 0;
+	struct msm_vidc_core *core;
+
+	core = inst->core;
+
+	/* restore LAYER_COUNT max allowed value */
+	inst->capabilities[ENH_LAYER_COUNT].max =
+		core->capabilities[MAX_ENH_LAYER_COUNT].value;
+
+	rc = msm_vidc_session_streamoff(inst, OUTPUT_PORT);
+	if (rc)
+		return rc;
+
+	return 0;
+}
+
+int msm_venc_streamon_output(struct msm_vidc_inst *inst)
+{
+	int rc = 0;
+
+	rc = msm_venc_set_output_properties(inst);
+	if (rc)
+		goto error;
+
+	rc = msm_vidc_set_v4l2_properties(inst);
+	if (rc)
+		goto error;
+
+	rc = msm_venc_set_internal_properties(inst);
+	if (rc)
+		goto error;
+
+	rc = msm_venc_get_output_internal_buffers(inst);
+	if (rc)
+		goto error;
+
+	rc = msm_venc_destroy_internal_buffers(inst, OUTPUT_PORT);
+	if (rc)
+		goto error;
+
+	rc = msm_venc_create_output_internal_buffers(inst);
+	if (rc)
+		goto error;
+
+	rc = msm_venc_queue_output_internal_buffers(inst);
+	if (rc)
+		goto error;
+
+	rc = msm_venc_property_subscription(inst, OUTPUT_PORT);
+	if (rc)
+		goto error;
+
+	rc = msm_vidc_process_streamon_output(inst);
+	if (rc)
+		goto error;
+
+	return 0;
+
+error:
+	i_vpr_e(inst, "%s: failed\n", __func__);
+	msm_venc_streamoff_output(inst);
+	return rc;
+}
+
+int msm_venc_try_fmt(struct msm_vidc_inst *inst, struct v4l2_format *f)
+{
+	int rc = 0;
+	struct v4l2_pix_format_mplane *pixmp = &f->fmt.pix_mp;
+	u32 pix_fmt;
+
+	memset(pixmp->reserved, 0, sizeof(pixmp->reserved));
+
+	if (f->type == INPUT_MPLANE) {
+		pix_fmt = v4l2_colorformat_to_driver(inst, f->fmt.pix_mp.pixelformat, __func__);
+		if (!pix_fmt) {
+			i_vpr_e(inst, "%s: unsupported format, set current params\n", __func__);
+			f->fmt.pix_mp.pixelformat = inst->fmts[INPUT_PORT].fmt.pix_mp.pixelformat;
+			f->fmt.pix_mp.width = inst->fmts[INPUT_PORT].fmt.pix_mp.width;
+			f->fmt.pix_mp.height = inst->fmts[INPUT_PORT].fmt.pix_mp.height;
+			pix_fmt = v4l2_colorformat_to_driver(inst, f->fmt.pix_mp.pixelformat,
+							     __func__);
+		}
+	} else if (f->type == OUTPUT_MPLANE) {
+		pix_fmt = v4l2_codec_to_driver(inst, f->fmt.pix_mp.pixelformat, __func__);
+		if (!pix_fmt) {
+			i_vpr_e(inst, "%s: unsupported codec, set current params\n", __func__);
+			f->fmt.pix_mp.width = inst->fmts[OUTPUT_PORT].fmt.pix_mp.width;
+			f->fmt.pix_mp.height = inst->fmts[OUTPUT_PORT].fmt.pix_mp.height;
+			f->fmt.pix_mp.pixelformat = inst->fmts[OUTPUT_PORT].fmt.pix_mp.pixelformat;
+		}
+	} else {
+		i_vpr_e(inst, "%s: invalid type %d\n", __func__, f->type);
+		return -EINVAL;
+	}
+
+	if (pixmp->field == V4L2_FIELD_ANY)
+		pixmp->field = V4L2_FIELD_NONE;
+	pixmp->num_planes = 1;
+
+	return rc;
+}
+
+int msm_venc_s_fmt_output(struct msm_vidc_inst *inst, struct v4l2_format *f)
+{
+	int rc = 0;
+	struct v4l2_format *fmt;
+	struct msm_vidc_core *core;
+	u32 codec_align;
+	u32 width, height;
+	enum msm_vidc_codec_type codec;
+
+	core = inst->core;
+	msm_venc_try_fmt(inst, f);
+
+	fmt = &inst->fmts[OUTPUT_PORT];
+	if (fmt->fmt.pix_mp.pixelformat != f->fmt.pix_mp.pixelformat) {
+		rc = msm_venc_codec_change(inst, f->fmt.pix_mp.pixelformat);
+		if (rc)
+			return rc;
+	}
+	fmt->type = OUTPUT_MPLANE;
+
+	codec = v4l2_codec_to_driver(inst, f->fmt.pix_mp.pixelformat, __func__);
+
+	codec_align = (codec == MSM_VIDC_HEVC) ? 32 : 16;
+	/* use rotated width height if rotation is enabled */
+	width = inst->compose.width;
+	height = inst->compose.height;
+	if (is_rotation_90_or_270(inst)) {
+		width = inst->compose.height;
+		height = inst->compose.width;
+	}
+	/* width, height is readonly for client */
+	fmt->fmt.pix_mp.width = ALIGN(width, codec_align);
+	fmt->fmt.pix_mp.height = ALIGN(height, codec_align);
+	fmt->fmt.pix_mp.num_planes = 1;
+	fmt->fmt.pix_mp.plane_fmt[0].bytesperline = 0;
+	fmt->fmt.pix_mp.plane_fmt[0].sizeimage =
+		call_session_op(core, buffer_size, inst, MSM_VIDC_BUF_OUTPUT);
+	/* video hw supports conversion to V4L2_COLORSPACE_REC709 only */
+	if (f->fmt.pix_mp.colorspace != V4L2_COLORSPACE_DEFAULT &&
+	    f->fmt.pix_mp.colorspace != V4L2_COLORSPACE_REC709)
+		f->fmt.pix_mp.colorspace = V4L2_COLORSPACE_DEFAULT;
+	fmt->fmt.pix_mp.colorspace = f->fmt.pix_mp.colorspace;
+	fmt->fmt.pix_mp.xfer_func = f->fmt.pix_mp.xfer_func;
+	fmt->fmt.pix_mp.ycbcr_enc = f->fmt.pix_mp.ycbcr_enc;
+	fmt->fmt.pix_mp.quantization = f->fmt.pix_mp.quantization;
+	inst->buffers.output.min_count =
+		call_session_op(core, min_count, inst, MSM_VIDC_BUF_OUTPUT);
+	inst->buffers.output.extra_count =
+		call_session_op(core, extra_count, inst, MSM_VIDC_BUF_OUTPUT);
+	if (inst->buffers.output.actual_count <
+		inst->buffers.output.min_count +
+		inst->buffers.output.extra_count) {
+		inst->buffers.output.actual_count =
+			inst->buffers.output.min_count +
+			inst->buffers.output.extra_count;
+	}
+	inst->buffers.output.size =
+		fmt->fmt.pix_mp.plane_fmt[0].sizeimage;
+
+	i_vpr_h(inst,
+		"%s: type: OUTPUT, codec %s width %d height %d size %u min_count %d extra_count %d\n",
+		__func__, v4l2_pixelfmt_name(inst, fmt->fmt.pix_mp.pixelformat),
+		fmt->fmt.pix_mp.width, fmt->fmt.pix_mp.height,
+		fmt->fmt.pix_mp.plane_fmt[0].sizeimage,
+		inst->buffers.output.min_count,
+		inst->buffers.output.extra_count);
+
+	/* finally update client format */
+	memcpy(f, fmt, sizeof(struct v4l2_format));
+	return rc;
+}
+
+static int msm_venc_s_fmt_input(struct msm_vidc_inst *inst, struct v4l2_format *f)
+{
+	int rc = 0;
+	struct v4l2_format *fmt, *output_fmt;
+	struct msm_vidc_core *core;
+	u32 pix_fmt, width, height, size, bytesperline;
+
+	core = inst->core;
+	msm_venc_try_fmt(inst, f);
+
+	pix_fmt = v4l2_colorformat_to_driver(inst, f->fmt.pix_mp.pixelformat, __func__);
+	msm_vidc_update_cap_value(inst, PIX_FMTS, pix_fmt, __func__);
+
+	width = f->fmt.pix_mp.width;
+	height = f->fmt.pix_mp.height;
+
+	if (is_rgba_colorformat(pix_fmt))
+		bytesperline = video_rgb_stride_bytes(pix_fmt, f->fmt.pix_mp.width);
+	else
+		bytesperline = video_y_stride_bytes(pix_fmt, f->fmt.pix_mp.width);
+
+	fmt = &inst->fmts[INPUT_PORT];
+	fmt->type = INPUT_MPLANE;
+	fmt->fmt.pix_mp.width = width;
+	fmt->fmt.pix_mp.height = height;
+	fmt->fmt.pix_mp.num_planes = 1;
+	fmt->fmt.pix_mp.pixelformat = f->fmt.pix_mp.pixelformat;
+	fmt->fmt.pix_mp.plane_fmt[0].bytesperline = bytesperline;
+	size = call_session_op(core, buffer_size, inst, MSM_VIDC_BUF_INPUT);
+	fmt->fmt.pix_mp.plane_fmt[0].sizeimage = size;
+	/* update input port colorspace info */
+	fmt->fmt.pix_mp.colorspace = f->fmt.pix_mp.colorspace;
+	fmt->fmt.pix_mp.xfer_func = f->fmt.pix_mp.xfer_func;
+	fmt->fmt.pix_mp.ycbcr_enc = f->fmt.pix_mp.ycbcr_enc;
+	fmt->fmt.pix_mp.quantization = f->fmt.pix_mp.quantization;
+	/*
+	 * Update output port colorspace info.
+	 */
+	output_fmt = &inst->fmts[OUTPUT_PORT];
+	output_fmt->fmt.pix_mp.colorspace = fmt->fmt.pix_mp.colorspace;
+	output_fmt->fmt.pix_mp.xfer_func = fmt->fmt.pix_mp.xfer_func;
+	output_fmt->fmt.pix_mp.ycbcr_enc = fmt->fmt.pix_mp.ycbcr_enc;
+	output_fmt->fmt.pix_mp.quantization = fmt->fmt.pix_mp.quantization;
+
+	inst->buffers.input.min_count =
+		call_session_op(core, min_count, inst, MSM_VIDC_BUF_INPUT);
+	inst->buffers.input.extra_count =
+		call_session_op(core, extra_count, inst, MSM_VIDC_BUF_INPUT);
+	if (inst->buffers.input.actual_count <
+	    inst->buffers.input.min_count +
+	    inst->buffers.input.extra_count) {
+		inst->buffers.input.actual_count =
+			inst->buffers.input.min_count +
+			inst->buffers.input.extra_count;
+	}
+	inst->buffers.input.size = size;
+
+	if (f->fmt.pix_mp.width != inst->crop.width ||
+	    f->fmt.pix_mp.height != inst->crop.height) {
+		/* reset crop dimensions with updated resolution */
+		inst->crop.top = 0;
+		inst->crop.left = 0;
+		inst->crop.width = f->fmt.pix_mp.width;
+		inst->crop.height = f->fmt.pix_mp.height;
+
+		/* reset compose dimensions with updated resolution */
+		inst->compose.top = 0;
+		inst->compose.left = 0;
+		inst->compose.width = f->fmt.pix_mp.width;
+		inst->compose.height = f->fmt.pix_mp.height;
+
+		/* update output format */
+		rc = msm_venc_s_fmt_output(inst, output_fmt);
+		if (rc)
+			return rc;
+	}
+
+	i_vpr_h(inst,
+		"%s: type: INPUT, format %s width %d height %d size %u min_count %d extra_count %d\n",
+		__func__, v4l2_pixelfmt_name(inst, fmt->fmt.pix_mp.pixelformat),
+		fmt->fmt.pix_mp.width, fmt->fmt.pix_mp.height,
+		fmt->fmt.pix_mp.plane_fmt[0].sizeimage,
+		inst->buffers.input.min_count,
+		inst->buffers.input.extra_count);
+
+	/* finally update client format */
+	memcpy(f, fmt, sizeof(struct v4l2_format));
+
+	return rc;
+}
+
+int msm_venc_s_fmt(struct msm_vidc_inst *inst, struct v4l2_format *f)
+{
+	int rc = 0;
+
+	if (f->type == INPUT_MPLANE) {
+		rc = msm_venc_s_fmt_input(inst, f);
+		if (rc)
+			goto exit;
+	} else if (f->type == OUTPUT_MPLANE) {
+		rc = msm_venc_s_fmt_output(inst, f);
+		if (rc)
+			goto exit;
+	} else {
+		i_vpr_e(inst, "%s: invalid type %d\n", __func__, f->type);
+		rc = -EINVAL;
+		goto exit;
+	}
+
+exit:
+	if (rc)
+		i_vpr_e(inst, "%s: failed\n", __func__);
+
+	return rc;
+}
+
+int msm_venc_g_fmt(struct msm_vidc_inst *inst, struct v4l2_format *f)
+{
+	int rc = 0;
+	int port;
+
+	port = v4l2_type_to_driver_port(inst, f->type, __func__);
+	if (port < 0)
+		return -EINVAL;
+
+	memcpy(f, &inst->fmts[port], sizeof(struct v4l2_format));
+
+	return rc;
+}
+
+int msm_venc_s_selection(struct msm_vidc_inst *inst, struct v4l2_selection *s)
+{
+	int rc = 0;
+	struct v4l2_format *output_fmt;
+
+	if (s->type != INPUT_MPLANE && s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT) {
+		i_vpr_e(inst, "%s: invalid type %d\n", __func__, s->type);
+		return -EINVAL;
+	}
+
+	switch (s->target) {
+	case V4L2_SEL_TGT_CROP:
+		if (s->r.left || s->r.top) {
+			i_vpr_h(inst, "%s: unsupported top %d or left %d\n",
+				__func__, s->r.left, s->r.top);
+			s->r.left = 0;
+			s->r.top = 0;
+		}
+		if (s->r.width > inst->fmts[INPUT_PORT].fmt.pix_mp.width) {
+			i_vpr_h(inst, "%s: unsupported width %d, fmt width %d\n",
+				__func__, s->r.width,
+				inst->fmts[INPUT_PORT].fmt.pix_mp.width);
+			s->r.width = inst->fmts[INPUT_PORT].fmt.pix_mp.width;
+		}
+		if (s->r.height > inst->fmts[INPUT_PORT].fmt.pix_mp.height) {
+			i_vpr_h(inst, "%s: unsupported height %d, fmt height %d\n",
+				__func__, s->r.height,
+				inst->fmts[INPUT_PORT].fmt.pix_mp.height);
+			s->r.height = inst->fmts[INPUT_PORT].fmt.pix_mp.height;
+		}
+
+		inst->crop.left = s->r.left;
+		inst->crop.top = s->r.top;
+		inst->crop.width = s->r.width;
+		inst->crop.height = s->r.height;
+		/* adjust compose such that it is within crop */
+		inst->compose.left = inst->crop.left;
+		inst->compose.top = inst->crop.top;
+		inst->compose.width = inst->crop.width;
+		inst->compose.height = inst->crop.height;
+		/* update output format based on new crop dimensions */
+		output_fmt = &inst->fmts[OUTPUT_PORT];
+		rc = msm_venc_s_fmt_output(inst, output_fmt);
+		if (rc)
+			return rc;
+		break;
+	case V4L2_SEL_TGT_COMPOSE:
+		if (s->r.left < inst->crop.left) {
+			i_vpr_e(inst,
+				"%s: compose left (%d) less than crop left (%d)\n",
+				__func__, s->r.left, inst->crop.left);
+			s->r.left = inst->crop.left;
+		}
+		if (s->r.top < inst->crop.top) {
+			i_vpr_e(inst,
+				"%s: compose top (%d) less than crop top (%d)\n",
+				__func__, s->r.top, inst->crop.top);
+			s->r.top = inst->crop.top;
+		}
+		if (s->r.width > inst->crop.width) {
+			i_vpr_e(inst,
+				"%s: compose width (%d) greate than crop width (%d)\n",
+				__func__, s->r.width, inst->crop.width);
+			s->r.width = inst->crop.width;
+		}
+		if (s->r.height > inst->crop.height) {
+			i_vpr_e(inst,
+				"%s: compose height (%d) greate than crop height (%d)\n",
+				__func__, s->r.height, inst->crop.height);
+			s->r.height = inst->crop.height;
+		}
+		inst->compose.left = s->r.left;
+		inst->compose.top = s->r.top;
+		inst->compose.width = s->r.width;
+		inst->compose.height = s->r.height;
+
+		if (is_scaling_enabled(inst)) {
+			i_vpr_h(inst,
+				"%s: scaling enabled, crop: l %d t %d w %d h %d compose: l %d t %d w %d h %d\n",
+				__func__, inst->crop.left, inst->crop.top,
+				inst->crop.width, inst->crop.height,
+				inst->compose.left, inst->compose.top,
+				inst->compose.width, inst->compose.height);
+		}
+
+		/* update output format based on new compose dimensions */
+		output_fmt = &inst->fmts[OUTPUT_PORT];
+		rc = msm_venc_s_fmt_output(inst, output_fmt);
+		if (rc)
+			return rc;
+		break;
+	default:
+		i_vpr_e(inst, "%s: invalid target %d\n",
+			__func__, s->target);
+		rc = -EINVAL;
+		break;
+	}
+	if (!rc)
+		i_vpr_h(inst, "%s: target %d, r [%d, %d, %d, %d]\n",
+			__func__, s->target, s->r.top, s->r.left,
+			s->r.width, s->r.height);
+	return rc;
+}
+
+int msm_venc_g_selection(struct msm_vidc_inst *inst, struct v4l2_selection *s)
+{
+	int rc = 0;
+
+	if (s->type != INPUT_MPLANE && s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT) {
+		i_vpr_e(inst, "%s: invalid type %d\n", __func__, s->type);
+		return -EINVAL;
+	}
+
+	switch (s->target) {
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_CROP:
+		s->r.left = inst->crop.left;
+		s->r.top = inst->crop.top;
+		s->r.width = inst->crop.width;
+		s->r.height = inst->crop.height;
+		break;
+	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
+	case V4L2_SEL_TGT_COMPOSE_PADDED:
+	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
+	case V4L2_SEL_TGT_COMPOSE:
+		s->r.left = inst->compose.left;
+		s->r.top = inst->compose.top;
+		s->r.width = inst->compose.width;
+		s->r.height = inst->compose.height;
+		break;
+	default:
+		i_vpr_e(inst, "%s: invalid target %d\n",
+			__func__, s->target);
+		rc = -EINVAL;
+		break;
+	}
+	if (!rc)
+		i_vpr_h(inst, "%s: target %d, r [%d, %d, %d, %d]\n",
+			__func__, s->target, s->r.top, s->r.left,
+			s->r.width, s->r.height);
+	return rc;
+}
+
+int msm_venc_s_param(struct msm_vidc_inst *inst,
+		     struct v4l2_streamparm *s_parm)
+{
+	int rc = 0;
+	struct v4l2_fract *timeperframe = NULL;
+	u32 q16_rate, max_rate, default_rate;
+	u64 us_per_frame = 0, input_rate = 0;
+	bool is_frame_rate = false;
+
+	if (s_parm->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		timeperframe = &s_parm->parm.output.timeperframe;
+		max_rate = inst->capabilities[OPERATING_RATE].max >> 16;
+		default_rate = inst->capabilities[OPERATING_RATE].value >> 16;
+		s_parm->parm.output.capability = V4L2_CAP_TIMEPERFRAME;
+	} else {
+		timeperframe = &s_parm->parm.capture.timeperframe;
+		is_frame_rate = true;
+		max_rate = inst->capabilities[FRAME_RATE].max >> 16;
+		default_rate = inst->capabilities[FRAME_RATE].value >> 16;
+		s_parm->parm.capture.capability = V4L2_CAP_TIMEPERFRAME;
+	}
+
+	if (!timeperframe->denominator || !timeperframe->numerator) {
+		i_vpr_e(inst, "%s: type %s, invalid rate, update with default\n",
+			__func__, v4l2_type_name(s_parm->type));
+		if (!timeperframe->numerator)
+			timeperframe->numerator = 1;
+		if (!timeperframe->denominator)
+			timeperframe->denominator = default_rate;
+	}
+
+	us_per_frame = timeperframe->numerator * (u64)USEC_PER_SEC;
+	do_div(us_per_frame, timeperframe->denominator);
+
+	if (!us_per_frame) {
+		i_vpr_e(inst, "%s: us_per_frame is zero\n", __func__);
+		rc = -EINVAL;
+		goto exit;
+	}
+
+	input_rate = (u64)USEC_PER_SEC;
+	do_div(input_rate, us_per_frame);
+
+	i_vpr_h(inst, "%s: type %s, %s value %llu\n",
+		__func__, v4l2_type_name(s_parm->type),
+		is_frame_rate ? "frame rate" : "operating rate", input_rate);
+
+	q16_rate = (u32)input_rate << 16;
+	msm_vidc_update_cap_value(inst, is_frame_rate ? FRAME_RATE : OPERATING_RATE,
+				  q16_rate, __func__);
+	if ((s_parm->type == INPUT_MPLANE && inst->bufq[INPUT_PORT].vb2q->streaming) ||
+	    (s_parm->type == OUTPUT_MPLANE && inst->bufq[OUTPUT_PORT].vb2q->streaming)) {
+		rc = msm_vidc_check_core_mbps(inst);
+		if (rc) {
+			i_vpr_e(inst, "%s: unsupported load\n", __func__);
+			goto reset_rate;
+		}
+		rc = input_rate > max_rate;
+		if (rc) {
+			i_vpr_e(inst, "%s: unsupported rate %llu, max %u\n", __func__,
+				input_rate, max_rate);
+			rc = -ENOMEM;
+			goto reset_rate;
+		}
+	}
+
+	if (is_frame_rate)
+		inst->capabilities[FRAME_RATE].flags |= CAP_FLAG_CLIENT_SET;
+	else
+		inst->capabilities[OPERATING_RATE].flags |= CAP_FLAG_CLIENT_SET;
+	/*
+	 * In static case, frame rate is set via
+	 * inst database set function mentioned in
+	 * FRAME_RATE cap id.
+	 * In dynamic case, frame rate is set like below.
+	 */
+	if (inst->bufq[OUTPUT_PORT].vb2q->streaming) {
+		rc = venus_hfi_session_property(inst,
+						HFI_PROP_FRAME_RATE,
+						HFI_HOST_FLAGS_NONE,
+						HFI_PORT_BITSTREAM,
+						HFI_PAYLOAD_Q16,
+						&q16_rate,
+						sizeof(u32));
+		if (rc) {
+			i_vpr_e(inst,
+				"%s: failed to set frame rate to fw\n", __func__);
+			goto exit;
+		}
+	}
+
+	return 0;
+
+reset_rate:
+	if (rc) {
+		i_vpr_e(inst, "%s: setting rate %llu failed, reset to %u\n", __func__,
+			input_rate, default_rate);
+		msm_vidc_update_cap_value(inst, is_frame_rate ? FRAME_RATE : OPERATING_RATE,
+					  default_rate << 16, __func__);
+	}
+exit:
+	return rc;
+}
+
+int msm_venc_g_param(struct msm_vidc_inst *inst,
+		     struct v4l2_streamparm *s_parm)
+{
+	struct v4l2_fract *timeperframe = NULL;
+
+	if (s_parm->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		timeperframe = &s_parm->parm.output.timeperframe;
+		timeperframe->numerator = 1;
+		timeperframe->denominator =
+			inst->capabilities[OPERATING_RATE].value >> 16;
+		s_parm->parm.output.capability = V4L2_CAP_TIMEPERFRAME;
+	} else {
+		timeperframe = &s_parm->parm.capture.timeperframe;
+		timeperframe->numerator = 1;
+		timeperframe->denominator =
+			inst->capabilities[FRAME_RATE].value >> 16;
+		s_parm->parm.capture.capability = V4L2_CAP_TIMEPERFRAME;
+	}
+
+	i_vpr_h(inst, "%s: type %s, num %u denom %u\n",
+		__func__, v4l2_type_name(s_parm->type), timeperframe->numerator,
+		timeperframe->denominator);
+	return 0;
+}
+
+int msm_venc_subscribe_event(struct msm_vidc_inst *inst,
+			     const struct v4l2_event_subscription *sub)
+{
+	int rc = 0;
+
+	switch (sub->type) {
+	case V4L2_EVENT_EOS:
+		rc = v4l2_event_subscribe(&inst->fh, sub, MAX_EVENTS, NULL);
+		break;
+	case V4L2_EVENT_CTRL:
+		rc = v4l2_ctrl_subscribe_event(&inst->fh, sub);
+		break;
+	default:
+		i_vpr_e(inst, "%s: invalid type %d id %d\n", __func__, sub->type, sub->id);
+		return -EINVAL;
+	}
+
+	if (rc)
+		i_vpr_e(inst, "%s: failed, type %d id %d\n",
+			__func__, sub->type, sub->id);
+	return rc;
+}
+
+int msm_venc_enum_fmt(struct msm_vidc_inst *inst, struct v4l2_fmtdesc *f)
+{
+	int rc = 0;
+	struct msm_vidc_core *core;
+	u32 array[32] = {0};
+	u32 i = 0;
+
+	core = inst->core;
+
+	if (f->type == OUTPUT_MPLANE) {
+		u32 codecs = core->capabilities[ENC_CODECS].value;
+		u32 idx = 0;
+
+		for (i = 0; i <= 31; i++) {
+			if (codecs & BIT(i)) {
+				if (idx >= ARRAY_SIZE(array))
+					break;
+				array[idx] = codecs & BIT(i);
+				idx++;
+			}
+		}
+		if (!array[f->index])
+			return -EINVAL;
+		f->pixelformat = v4l2_codec_from_driver(inst, array[f->index],
+							__func__);
+		if (!f->pixelformat)
+			return -EINVAL;
+		f->flags = V4L2_FMT_FLAG_COMPRESSED;
+		strscpy(f->description, "codec", sizeof(f->description));
+	} else if (f->type == INPUT_MPLANE) {
+		u32 formats = inst->capabilities[PIX_FMTS].step_or_mask;
+		u32 idx = 0;
+
+		for (i = 0; i <= 31; i++) {
+			if (formats & BIT(i)) {
+				if (idx >= ARRAY_SIZE(array))
+					break;
+				array[idx] = formats & BIT(i);
+				idx++;
+			}
+		}
+		if (!array[f->index])
+			return -EINVAL;
+		f->pixelformat = v4l2_colorformat_from_driver(inst, array[f->index],
+							      __func__);
+		if (!f->pixelformat)
+			return -EINVAL;
+		strscpy(f->description, "colorformat", sizeof(f->description));
+	}
+
+	memset(f->reserved, 0, sizeof(f->reserved));
+
+	i_vpr_h(inst, "%s: index %d, %s: %s, flags %#x\n",
+		__func__, f->index, f->description,
+		v4l2_pixelfmt_name(inst, f->pixelformat), f->flags);
+	return rc;
+}
+
+int msm_venc_inst_init(struct msm_vidc_inst *inst)
+{
+	int rc = 0;
+	struct msm_vidc_core *core;
+	struct v4l2_format *f;
+	enum msm_vidc_colorformat_type colorformat;
+
+	core = inst->core;
+
+	if (core->capabilities[DCVS].value)
+		inst->power.dcvs_mode = true;
+
+	f = &inst->fmts[OUTPUT_PORT];
+	f->type = OUTPUT_MPLANE;
+	f->fmt.pix_mp.width = DEFAULT_WIDTH;
+	f->fmt.pix_mp.height = DEFAULT_HEIGHT;
+	f->fmt.pix_mp.pixelformat = V4L2_PIX_FMT_H264;
+	f->fmt.pix_mp.num_planes = 1;
+	f->fmt.pix_mp.plane_fmt[0].bytesperline = 0;
+	f->fmt.pix_mp.plane_fmt[0].sizeimage =
+		call_session_op(core, buffer_size, inst, MSM_VIDC_BUF_OUTPUT);
+	f->fmt.pix_mp.field = V4L2_FIELD_NONE;
+	f->fmt.pix_mp.colorspace = V4L2_COLORSPACE_DEFAULT;
+	f->fmt.pix_mp.xfer_func = V4L2_XFER_FUNC_DEFAULT;
+	f->fmt.pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	f->fmt.pix_mp.quantization = V4L2_QUANTIZATION_DEFAULT;
+	inst->buffers.output.min_count =
+		call_session_op(core, min_count, inst, MSM_VIDC_BUF_OUTPUT);
+	inst->buffers.output.extra_count =
+		call_session_op(core, extra_count, inst, MSM_VIDC_BUF_OUTPUT);
+	inst->buffers.output.actual_count =
+			inst->buffers.output.min_count +
+			inst->buffers.output.extra_count;
+	inst->buffers.output.size = f->fmt.pix_mp.plane_fmt[0].sizeimage;
+
+	inst->crop.left = 0;
+	inst->crop.top = 0;
+	inst->crop.width = f->fmt.pix_mp.width;
+	inst->crop.height = f->fmt.pix_mp.height;
+
+	inst->compose.left = 0;
+	inst->compose.top = 0;
+	inst->compose.width = f->fmt.pix_mp.width;
+	inst->compose.height = f->fmt.pix_mp.height;
+
+	f = &inst->fmts[INPUT_PORT];
+	f->type = INPUT_MPLANE;
+	f->fmt.pix_mp.pixelformat =
+		v4l2_colorformat_from_driver(inst, MSM_VIDC_FMT_NV12C, __func__);
+	f->fmt.pix_mp.width = DEFAULT_WIDTH;
+	f->fmt.pix_mp.height = DEFAULT_HEIGHT;
+	f->fmt.pix_mp.num_planes = 1;
+	colorformat = v4l2_colorformat_to_driver(inst, f->fmt.pix_mp.pixelformat,
+						 __func__);
+	f->fmt.pix_mp.plane_fmt[0].bytesperline =
+		video_y_stride_bytes(colorformat, DEFAULT_WIDTH);
+	f->fmt.pix_mp.plane_fmt[0].sizeimage =
+		call_session_op(core, buffer_size, inst, MSM_VIDC_BUF_INPUT);
+	f->fmt.pix_mp.field = V4L2_FIELD_NONE;
+	f->fmt.pix_mp.colorspace = V4L2_COLORSPACE_DEFAULT;
+	f->fmt.pix_mp.xfer_func = V4L2_XFER_FUNC_DEFAULT;
+	f->fmt.pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	f->fmt.pix_mp.quantization = V4L2_QUANTIZATION_DEFAULT;
+	inst->buffers.input.min_count =
+		call_session_op(core, min_count, inst, MSM_VIDC_BUF_INPUT);
+	inst->buffers.input.extra_count =
+		call_session_op(core, extra_count, inst, MSM_VIDC_BUF_INPUT);
+	inst->buffers.input.actual_count =
+			inst->buffers.input.min_count +
+			inst->buffers.input.extra_count;
+	inst->buffers.input.size = f->fmt.pix_mp.plane_fmt[0].sizeimage;
+
+	inst->hfi_rc_type = HFI_RC_VBR_CFR;
+	inst->hfi_layer_type = HFI_HIER_P_SLIDING_WINDOW;
+
+	rc = msm_venc_codec_change(inst,
+				   inst->fmts[OUTPUT_PORT].fmt.pix_mp.pixelformat);
+
+	return rc;
+}
+
+int msm_venc_inst_deinit(struct msm_vidc_inst *inst)
+{
+	return msm_vidc_ctrl_handler_deinit(inst);
+}
-- 
2.7.4

