Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFB7D766E32
	for <lists+linux-media@lfdr.de>; Fri, 28 Jul 2023 15:26:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236746AbjG1N0d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jul 2023 09:26:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236367AbjG1N0M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jul 2023 09:26:12 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2204B448F;
        Fri, 28 Jul 2023 06:25:53 -0700 (PDT)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36SBHxmF007734;
        Fri, 28 Jul 2023 13:25:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=xZRekrZGwNLzUU7bpRSMzQm+qeahyTFbOymkr+M+6GQ=;
 b=p3VCLi82DP+NCy1sxdzUHEkvebwB91cqZKS1wjg+KsoEh3SmGaIIs5l2C9tKURZWRqnB
 0mcNpFw2SC7fYpPa1L0LjVNYqp+u/LbCdy7/gV091jRTd3jnM3PiyhOIjq3dKfhzQRaM
 tNq2YD6x1KT1nwASKnd+nefT3SI1kS8bn8hN8BVBx4H1+KCwRZvzeZ+jqgJ1lwSogcR9
 wsTiOWStV/Aci/fl2xmGfSgJgoOCygZMg4NfAXVtDBVp1ejMHqfUfZsXYJs6OtQyrYRv
 gGiC9yzru8QKC6OHOmHEQoo9hFcPqFmPYwH1poxg+zAa/45jtSrDDFOnGSczeRs8QnvD xQ== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s46ttgyxc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 28 Jul 2023 13:25:39 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
        by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36SDPceZ013570
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 28 Jul 2023 13:25:38 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Fri, 28 Jul 2023 06:25:35 -0700
From:   Vikash Garodia <quic_vgarodia@quicinc.com>
To:     <stanimir.k.varbanov@gmail.com>, <agross@kernel.org>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <mchehab@kernel.org>, <hans.verkuil@cisco.com>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
CC:     <quic_dikshita@quicinc.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>
Subject: [PATCH 08/33] iris: vidc: add video decoder files
Date:   Fri, 28 Jul 2023 18:53:19 +0530
Message-ID: <1690550624-14642-9-git-send-email-quic_vgarodia@quicinc.com>
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
X-Proofpoint-ORIG-GUID: R3jX60PZbBUttW2O1G6mbH7uLxygGPuA
X-Proofpoint-GUID: R3jX60PZbBUttW2O1G6mbH7uLxygGPuA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

This implements decoder functionalities of the driver.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
 .../media/platform/qcom/iris/vidc/inc/msm_vdec.h   |   40 +
 .../media/platform/qcom/iris/vidc/src/msm_vdec.c   | 2091 ++++++++++++++++++++
 2 files changed, 2131 insertions(+)
 create mode 100644 drivers/media/platform/qcom/iris/vidc/inc/msm_vdec.h
 create mode 100644 drivers/media/platform/qcom/iris/vidc/src/msm_vdec.c

diff --git a/drivers/media/platform/qcom/iris/vidc/inc/msm_vdec.h b/drivers/media/platform/qcom/iris/vidc/inc/msm_vdec.h
new file mode 100644
index 0000000..bece9a2
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/vidc/inc/msm_vdec.h
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _MSM_VDEC_H_
+#define _MSM_VDEC_H_
+
+#include "msm_vidc_core.h"
+#include "msm_vidc_inst.h"
+
+int msm_vdec_streamoff_input(struct msm_vidc_inst *inst);
+int msm_vdec_streamon_input(struct msm_vidc_inst *inst);
+int msm_vdec_streamoff_output(struct msm_vidc_inst *inst);
+int msm_vdec_streamon_output(struct msm_vidc_inst *inst);
+int msm_vdec_qbuf(struct msm_vidc_inst *inst, struct vb2_buffer *vb2);
+int msm_vdec_try_fmt(struct msm_vidc_inst *inst, struct v4l2_format *f);
+int msm_vdec_s_fmt(struct msm_vidc_inst *inst, struct v4l2_format *f);
+int msm_vdec_g_fmt(struct msm_vidc_inst *inst, struct v4l2_format *f);
+int msm_vdec_s_selection(struct msm_vidc_inst *inst, struct v4l2_selection *s);
+int msm_vdec_g_selection(struct msm_vidc_inst *inst, struct v4l2_selection *s);
+int msm_vdec_subscribe_event(struct msm_vidc_inst *inst,
+			     const struct v4l2_event_subscription *sub);
+int msm_vdec_enum_fmt(struct msm_vidc_inst *inst, struct v4l2_fmtdesc *f);
+int msm_vdec_inst_init(struct msm_vidc_inst *inst);
+int msm_vdec_inst_deinit(struct msm_vidc_inst *inst);
+int msm_vdec_init_input_subcr_params(struct msm_vidc_inst *inst);
+int msm_vdec_input_port_settings_change(struct msm_vidc_inst *inst);
+int msm_vdec_stop_cmd(struct msm_vidc_inst *inst);
+int msm_vdec_start_cmd(struct msm_vidc_inst *inst);
+int msm_vdec_handle_release_buffer(struct msm_vidc_inst *inst,
+				   struct msm_vidc_buffer *buf);
+int msm_vdec_set_num_comv(struct msm_vidc_inst *inst);
+int msm_vdec_get_input_internal_buffers(struct msm_vidc_inst *inst);
+int msm_vdec_create_input_internal_buffers(struct msm_vidc_inst *inst);
+int msm_vdec_queue_input_internal_buffers(struct msm_vidc_inst *inst);
+int msm_vdec_release_input_internal_buffers(struct msm_vidc_inst *inst);
+
+#endif // _MSM_VDEC_H_
diff --git a/drivers/media/platform/qcom/iris/vidc/src/msm_vdec.c b/drivers/media/platform/qcom/iris/vidc/src/msm_vdec.c
new file mode 100644
index 0000000..6f5bc29
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/vidc/src/msm_vdec.c
@@ -0,0 +1,2091 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/v4l2-common.h>
+
+#include "hfi_packet.h"
+#include "msm_media_info.h"
+#include "msm_vdec.h"
+#include "msm_vidc_control.h"
+#include "msm_vidc_core.h"
+#include "msm_vidc_debug.h"
+#include "msm_vidc_driver.h"
+#include "msm_vidc_inst.h"
+#include "msm_vidc_internal.h"
+#include "msm_vidc_memory.h"
+#include "msm_vidc_platform.h"
+#include "msm_vidc_power.h"
+#include "venus_hfi.h"
+
+/* TODO: update based on clips */
+#define MAX_DEC_BATCH_SIZE 6
+#define SKIP_BATCH_WINDOW 100
+
+static const u32 msm_vdec_internal_buffer_type[] = {
+	MSM_VIDC_BUF_BIN,
+	MSM_VIDC_BUF_COMV,
+	MSM_VIDC_BUF_NON_COMV,
+	MSM_VIDC_BUF_LINE,
+};
+
+static const u32 msm_vdec_output_internal_buffer_type[] = {
+	MSM_VIDC_BUF_DPB,
+};
+
+struct msm_vdec_prop_type_handle {
+	u32 type;
+	int (*handle)(struct msm_vidc_inst *inst, enum msm_vidc_port_type port);
+};
+
+static int msm_vdec_codec_change(struct msm_vidc_inst *inst, u32 v4l2_codec)
+{
+	int rc = 0;
+	bool session_init = false;
+
+	if (!inst->codec)
+		session_init = true;
+
+	if (inst->codec && inst->fmts[INPUT_PORT].fmt.pix_mp.pixelformat == v4l2_codec)
+		return 0;
+
+	i_vpr_h(inst, "%s: codec changed from %s to %s\n",
+		__func__, v4l2_pixelfmt_name(inst, inst->fmts[INPUT_PORT].fmt.pix_mp.pixelformat),
+		v4l2_pixelfmt_name(inst, v4l2_codec));
+
+	inst->codec = v4l2_codec_to_driver(inst, v4l2_codec, __func__);
+	if (!inst->codec) {
+		i_vpr_e(inst, "%s: invalid codec %#x\n", __func__, v4l2_codec);
+		rc = -EINVAL;
+		goto exit;
+	}
+
+	inst->fmts[INPUT_PORT].fmt.pix_mp.pixelformat = v4l2_codec;
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
+static int msm_vdec_set_bitstream_resolution(struct msm_vidc_inst *inst,
+					     enum msm_vidc_port_type port)
+{
+	int rc = 0;
+	u32 resolution;
+
+	resolution = inst->fmts[INPUT_PORT].fmt.pix_mp.width << 16 |
+		inst->fmts[INPUT_PORT].fmt.pix_mp.height;
+	i_vpr_h(inst, "%s: width: %d height: %d\n", __func__,
+		inst->fmts[INPUT_PORT].fmt.pix_mp.width,
+		inst->fmts[INPUT_PORT].fmt.pix_mp.height);
+	inst->subcr_params[port].bitstream_resolution = resolution;
+	rc = venus_hfi_session_property(inst,
+					HFI_PROP_BITSTREAM_RESOLUTION,
+					HFI_HOST_FLAGS_NONE,
+					get_hfi_port(inst, port),
+					HFI_PAYLOAD_U32,
+					&resolution,
+					sizeof(u32));
+	if (rc) {
+		i_vpr_e(inst, "%s: set property failed\n", __func__);
+		return rc;
+	}
+
+	return rc;
+}
+
+static int msm_vdec_set_linear_stride_scanline(struct msm_vidc_inst *inst)
+{
+	int rc = 0;
+	u32 stride_y, scanline_y, stride_uv, scanline_uv;
+	u32 payload[2];
+	enum msm_vidc_colorformat_type colorformat;
+
+	colorformat = v4l2_colorformat_to_driver(inst,
+						 inst->fmts[OUTPUT_PORT].fmt.pix_mp.pixelformat,
+						 __func__);
+
+	if (!is_linear_yuv_colorformat(colorformat))
+		return 0;
+
+	stride_y = inst->fmts[OUTPUT_PORT].fmt.pix_mp.width;
+	scanline_y = inst->fmts[OUTPUT_PORT].fmt.pix_mp.height;
+	stride_uv = stride_y;
+	scanline_uv = scanline_y / 2;
+
+	payload[0] = stride_y << 16 | scanline_y;
+	payload[1] = stride_uv << 16 | scanline_uv;
+	i_vpr_h(inst, "%s: stride_y: %d scanline_y: %d stride_uv: %d, scanline_uv: %d",
+		__func__, stride_y, scanline_y, stride_uv, scanline_uv);
+	rc = venus_hfi_session_property(inst,
+					HFI_PROP_LINEAR_STRIDE_SCANLINE,
+					HFI_HOST_FLAGS_NONE,
+					get_hfi_port(inst, OUTPUT_PORT),
+					HFI_PAYLOAD_U64,
+					&payload,
+					sizeof(u64));
+	if (rc) {
+		i_vpr_e(inst, "%s: set property failed\n", __func__);
+		return rc;
+	}
+
+	return rc;
+}
+
+static int msm_vdec_set_ubwc_stride_scanline(struct msm_vidc_inst *inst)
+{
+	int rc = 0;
+	u32 stride_y, scanline_y, stride_uv, scanline_uv;
+	u32 meta_stride_y, meta_scanline_y, meta_stride_uv, meta_scanline_uv;
+	u32 payload[4];
+	struct v4l2_format *f;
+	u32 pix_fmt, width, height, colorformat;
+
+	f = &inst->fmts[OUTPUT_PORT];
+	pix_fmt = f->fmt.pix_mp.pixelformat;
+	width = f->fmt.pix_mp.width;
+	height = f->fmt.pix_mp.height;
+
+	colorformat = v4l2_colorformat_to_driver(inst, pix_fmt, __func__);
+
+	if (!is_ubwc_colorformat(colorformat))
+		return 0;
+
+	stride_y = video_y_stride_bytes(colorformat, width);
+	scanline_y = video_y_scanlines(colorformat, height);
+	stride_uv = video_uv_stride_bytes(colorformat, width);
+	scanline_uv = video_uv_scanlines(colorformat, height);
+
+	meta_stride_y = video_y_meta_stride(colorformat, width);
+	meta_scanline_y = video_y_meta_scanlines(colorformat, height);
+	meta_stride_uv = video_uv_meta_stride(colorformat, width);
+	meta_scanline_uv = video_uv_meta_scanlines(colorformat, height);
+
+	payload[0] = stride_y << 16 | scanline_y;
+	payload[1] = stride_uv << 16 | scanline_uv;
+	payload[2] = meta_stride_y << 16 | meta_scanline_y;
+	payload[3] = meta_stride_uv << 16 | meta_scanline_uv;
+
+	i_vpr_h(inst,
+		"%s: y: stride %d scanline %d, uv: stride %d scanline %d, y_meta: stride %d scaline %d, uv_meta: stride %d scanline %d",
+		__func__,
+		stride_y, scanline_y, stride_uv, scanline_uv,
+		meta_stride_y, meta_scanline_y,
+		meta_stride_uv, meta_scanline_uv);
+	rc = venus_hfi_session_property(inst,
+					HFI_PROP_UBWC_STRIDE_SCANLINE,
+					HFI_HOST_FLAGS_NONE,
+					get_hfi_port(inst, OUTPUT_PORT),
+					HFI_PAYLOAD_U32_ARRAY,
+					&payload[0],
+					sizeof(u32) * 4);
+	if (rc) {
+		i_vpr_e(inst, "%s: set property failed\n", __func__);
+		return rc;
+	}
+
+	return rc;
+}
+
+static int msm_vdec_set_crop_offsets(struct msm_vidc_inst *inst,
+				     enum msm_vidc_port_type port)
+{
+	int rc = 0;
+	u32 left_offset, top_offset, right_offset, bottom_offset;
+	u32 payload[2] = {0};
+
+	left_offset = inst->crop.left;
+	top_offset = inst->crop.top;
+	right_offset = (inst->fmts[INPUT_PORT].fmt.pix_mp.width -
+		inst->crop.width);
+	bottom_offset = (inst->fmts[INPUT_PORT].fmt.pix_mp.height -
+		inst->crop.height);
+
+	payload[0] = left_offset << 16 | top_offset;
+	payload[1] = right_offset << 16 | bottom_offset;
+	i_vpr_h(inst,
+		"%s: l_off: %d t_off: %d r_off: %d b_offs: %d",
+		__func__,
+		left_offset, top_offset, right_offset, bottom_offset);
+	inst->subcr_params[port].crop_offsets[0] = payload[0];
+	inst->subcr_params[port].crop_offsets[1] = payload[1];
+	rc = venus_hfi_session_property(inst,
+					HFI_PROP_CROP_OFFSETS,
+					HFI_HOST_FLAGS_NONE,
+					get_hfi_port(inst, port),
+					HFI_PAYLOAD_64_PACKED,
+					&payload,
+					sizeof(u64));
+	if (rc) {
+		i_vpr_e(inst, "%s: set property failed\n", __func__);
+		return rc;
+	}
+
+	return rc;
+}
+
+static int msm_vdec_set_bit_depth(struct msm_vidc_inst *inst,
+				  enum msm_vidc_port_type port)
+{
+	int rc = 0;
+	u32 pix_fmt;
+	u32 bitdepth = 8 << 16 | 8;
+	enum msm_vidc_colorformat_type colorformat;
+
+	if (port != INPUT_PORT && port != OUTPUT_PORT) {
+		i_vpr_e(inst, "%s: invalid port %d\n", __func__, port);
+		return -EINVAL;
+	}
+
+	pix_fmt = inst->fmts[OUTPUT_PORT].fmt.pix_mp.pixelformat;
+	colorformat = v4l2_colorformat_to_driver(inst, pix_fmt, __func__);
+	if (is_10bit_colorformat(colorformat))
+		bitdepth = 10 << 16 | 10;
+
+	inst->subcr_params[port].bit_depth = bitdepth;
+	msm_vidc_update_cap_value(inst, BIT_DEPTH, bitdepth, __func__);
+	i_vpr_h(inst, "%s: bit depth: %#x", __func__, bitdepth);
+	rc = venus_hfi_session_property(inst,
+					HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
+					HFI_HOST_FLAGS_NONE,
+					get_hfi_port(inst, port),
+					HFI_PAYLOAD_U32,
+					&bitdepth,
+					sizeof(u32));
+	if (rc) {
+		i_vpr_e(inst, "%s: set property failed\n", __func__);
+		return rc;
+	}
+
+	return rc;
+}
+
+static int msm_vdec_set_coded_frames(struct msm_vidc_inst *inst,
+				     enum msm_vidc_port_type port)
+{
+	int rc = 0;
+	u32 coded_frames = 0;
+
+	if (port != INPUT_PORT && port != OUTPUT_PORT) {
+		i_vpr_e(inst, "%s: invalid port %d\n", __func__, port);
+		return -EINVAL;
+	}
+
+	if (inst->capabilities[CODED_FRAMES].value ==
+			CODED_FRAMES_PROGRESSIVE)
+		coded_frames = HFI_BITMASK_FRAME_MBS_ONLY_FLAG;
+	inst->subcr_params[port].coded_frames = coded_frames;
+	i_vpr_h(inst, "%s: coded frames: %d", __func__, coded_frames);
+	rc = venus_hfi_session_property(inst,
+					HFI_PROP_CODED_FRAMES,
+					HFI_HOST_FLAGS_NONE,
+					get_hfi_port(inst, port),
+					HFI_PAYLOAD_U32,
+					&coded_frames,
+					sizeof(u32));
+	if (rc) {
+		i_vpr_e(inst, "%s: set property failed\n", __func__);
+		return rc;
+	}
+
+	return rc;
+}
+
+static int msm_vdec_set_min_output_count(struct msm_vidc_inst *inst,
+					 enum msm_vidc_port_type port)
+{
+	int rc = 0;
+	u32 min_output;
+
+	if (port != INPUT_PORT && port != OUTPUT_PORT) {
+		i_vpr_e(inst, "%s: invalid port %d\n", __func__, port);
+		return -EINVAL;
+	}
+
+	min_output = inst->buffers.output.min_count;
+	inst->subcr_params[port].fw_min_count = min_output;
+	i_vpr_h(inst, "%s: firmware min output count: %d",
+		__func__, min_output);
+	rc = venus_hfi_session_property(inst,
+					HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT,
+					HFI_HOST_FLAGS_NONE,
+					get_hfi_port(inst, port),
+					HFI_PAYLOAD_U32,
+					&min_output,
+					sizeof(u32));
+	if (rc) {
+		i_vpr_e(inst, "%s: set property failed\n", __func__);
+		return rc;
+	}
+	return rc;
+}
+
+static int msm_vdec_set_picture_order_count(struct msm_vidc_inst *inst,
+					    enum msm_vidc_port_type port)
+{
+	int rc = 0;
+	u32 poc = 0;
+
+	if (port != INPUT_PORT && port != OUTPUT_PORT) {
+		i_vpr_e(inst, "%s: invalid port %d\n", __func__, port);
+		return -EINVAL;
+	}
+
+	inst->subcr_params[port].pic_order_cnt = poc;
+	i_vpr_h(inst, "%s: picture order count: %d", __func__, poc);
+	rc = venus_hfi_session_property(inst,
+					HFI_PROP_PIC_ORDER_CNT_TYPE,
+					HFI_HOST_FLAGS_NONE,
+					get_hfi_port(inst, port),
+					HFI_PAYLOAD_U32,
+					&poc,
+					sizeof(u32));
+	if (rc) {
+		i_vpr_e(inst, "%s: set property failed\n", __func__);
+		return rc;
+	}
+
+	return rc;
+}
+
+static int msm_vdec_set_colorspace(struct msm_vidc_inst *inst,
+				   enum msm_vidc_port_type port)
+{
+	int rc = 0;
+	u32 primaries = MSM_VIDC_PRIMARIES_RESERVED;
+	u32 matrix_coeff = MSM_VIDC_MATRIX_COEFF_RESERVED;
+	u32 transfer_char = MSM_VIDC_TRANSFER_RESERVED;
+	u32 full_range = V4L2_QUANTIZATION_DEFAULT;
+	u32 colour_description_present_flag = 0;
+	u32 video_signal_type_present_flag = 0, color_info = 0;
+	/* Unspecified video format */
+	u32 video_format = 5;
+	struct v4l2_pix_format_mplane *pixmp = NULL;
+
+	if (port != INPUT_PORT && port != OUTPUT_PORT) {
+		i_vpr_e(inst, "%s: invalid port %d\n", __func__, port);
+		return -EINVAL;
+	}
+
+	if (inst->codec == MSM_VIDC_VP9)
+		return 0;
+
+	pixmp = &inst->fmts[port].fmt.pix_mp;
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
+	}
+
+	if (pixmp->quantization != V4L2_QUANTIZATION_DEFAULT) {
+		video_signal_type_present_flag = 1;
+		full_range = pixmp->quantization ==
+			V4L2_QUANTIZATION_FULL_RANGE ? 1 : 0;
+	}
+
+	color_info = (matrix_coeff & 0xFF) |
+		((transfer_char << 8) & 0xFF00) |
+		((primaries << 16) & 0xFF0000) |
+		((colour_description_present_flag << 24) & 0x1000000) |
+		((full_range << 25) & 0x2000000) |
+		((video_format << 26) & 0x1C000000) |
+		((video_signal_type_present_flag << 29) & 0x20000000);
+
+	inst->subcr_params[port].color_info = color_info;
+	i_vpr_h(inst, "%s: color info: %#x\n", __func__, color_info);
+	rc = venus_hfi_session_property(inst,
+					HFI_PROP_SIGNAL_COLOR_INFO,
+					HFI_HOST_FLAGS_NONE,
+					get_hfi_port(inst, port),
+					HFI_PAYLOAD_32_PACKED,
+					&color_info,
+					sizeof(u32));
+	if (rc) {
+		i_vpr_e(inst, "%s: set property failed\n", __func__);
+		return rc;
+	}
+
+	return rc;
+}
+
+static int msm_vdec_set_profile(struct msm_vidc_inst *inst,
+				enum msm_vidc_port_type port)
+{
+	int rc = 0;
+	u32 profile;
+
+	if (port != INPUT_PORT && port != OUTPUT_PORT) {
+		i_vpr_e(inst, "%s: invalid port %d\n", __func__, port);
+		return -EINVAL;
+	}
+
+	profile = inst->capabilities[PROFILE].value;
+	inst->subcr_params[port].profile = profile;
+	i_vpr_h(inst, "%s: profile: %d", __func__, profile);
+	rc = venus_hfi_session_property(inst,
+					HFI_PROP_PROFILE,
+					HFI_HOST_FLAGS_NONE,
+					get_hfi_port(inst, port),
+					HFI_PAYLOAD_U32_ENUM,
+					&profile,
+					sizeof(u32));
+	if (rc) {
+		i_vpr_e(inst, "%s: set property failed\n", __func__);
+		return rc;
+	}
+
+	return rc;
+}
+
+static int msm_vdec_set_level(struct msm_vidc_inst *inst,
+			      enum msm_vidc_port_type port)
+{
+	int rc = 0;
+	u32 level;
+
+	if (port != INPUT_PORT && port != OUTPUT_PORT) {
+		i_vpr_e(inst, "%s: invalid port %d\n", __func__, port);
+		return -EINVAL;
+	}
+
+	level = inst->capabilities[LEVEL].value;
+	inst->subcr_params[port].level = level;
+	i_vpr_h(inst, "%s: level: %d", __func__, level);
+	rc = venus_hfi_session_property(inst,
+					HFI_PROP_LEVEL,
+					HFI_HOST_FLAGS_NONE,
+					get_hfi_port(inst, port),
+					HFI_PAYLOAD_U32_ENUM,
+					&level,
+					sizeof(u32));
+	if (rc) {
+		i_vpr_e(inst, "%s: set property failed\n", __func__);
+		return rc;
+	}
+
+	return rc;
+}
+
+static int msm_vdec_set_tier(struct msm_vidc_inst *inst,
+			     enum msm_vidc_port_type port)
+{
+	int rc = 0;
+	u32 tier;
+
+	if (port != INPUT_PORT && port != OUTPUT_PORT) {
+		i_vpr_e(inst, "%s: invalid port %d\n", __func__, port);
+		return -EINVAL;
+	}
+
+	tier = inst->capabilities[HEVC_TIER].value;
+	inst->subcr_params[port].tier = tier;
+	i_vpr_h(inst, "%s: tier: %d", __func__, tier);
+	rc = venus_hfi_session_property(inst,
+					HFI_PROP_TIER,
+					HFI_HOST_FLAGS_NONE,
+					get_hfi_port(inst, port),
+					HFI_PAYLOAD_U32_ENUM,
+					&tier,
+					sizeof(u32));
+	if (rc) {
+		i_vpr_e(inst, "%s: set property failed\n", __func__);
+		return rc;
+	}
+
+	return rc;
+}
+
+static int msm_vdec_set_colorformat(struct msm_vidc_inst *inst)
+{
+	int rc = 0;
+	u32 pixelformat;
+	enum msm_vidc_colorformat_type colorformat;
+	u32 hfi_colorformat;
+
+	pixelformat = inst->fmts[OUTPUT_PORT].fmt.pix_mp.pixelformat;
+	colorformat = v4l2_colorformat_to_driver(inst, pixelformat, __func__);
+	hfi_colorformat = get_hfi_colorformat(inst, colorformat);
+	i_vpr_h(inst, "%s: hfi colorformat: %d",
+		__func__, hfi_colorformat);
+	rc = venus_hfi_session_property(inst,
+					HFI_PROP_COLOR_FORMAT,
+					HFI_HOST_FLAGS_NONE,
+					get_hfi_port(inst, OUTPUT_PORT),
+					HFI_PAYLOAD_U32,
+					&hfi_colorformat,
+					sizeof(u32));
+	if (rc) {
+		i_vpr_e(inst, "%s: set property failed\n", __func__);
+		return rc;
+	}
+
+	return rc;
+}
+
+static int msm_vdec_set_output_properties(struct msm_vidc_inst *inst)
+{
+	int rc = 0;
+
+	rc = msm_vdec_set_colorformat(inst);
+	if (rc)
+		return rc;
+
+	rc = msm_vdec_set_linear_stride_scanline(inst);
+	if (rc)
+		return rc;
+
+	rc = msm_vdec_set_ubwc_stride_scanline(inst);
+
+	return rc;
+}
+
+int msm_vdec_get_input_internal_buffers(struct msm_vidc_inst *inst)
+{
+	int rc = 0;
+	u32 i = 0;
+
+	for (i = 0; i < ARRAY_SIZE(msm_vdec_internal_buffer_type); i++) {
+		rc = msm_vidc_get_internal_buffers(inst, msm_vdec_internal_buffer_type[i]);
+		if (rc)
+			return rc;
+	}
+
+	return rc;
+}
+
+static int msm_vdec_get_output_internal_buffers(struct msm_vidc_inst *inst)
+{
+	return msm_vidc_get_internal_buffers(inst, MSM_VIDC_BUF_DPB);
+}
+
+static int msm_vdec_destroy_internal_buffers(struct msm_vidc_inst *inst,
+					     enum msm_vidc_port_type port)
+{
+	int rc = 0;
+	struct msm_vidc_buffers *buffers;
+	struct msm_vidc_buffer *buf, *dummy;
+	const u32 *internal_buf_type;
+	u32 i, len;
+
+	if (port == INPUT_PORT) {
+		internal_buf_type = msm_vdec_internal_buffer_type;
+		len = ARRAY_SIZE(msm_vdec_internal_buffer_type);
+	} else {
+		internal_buf_type = msm_vdec_output_internal_buffer_type;
+		len = ARRAY_SIZE(msm_vdec_output_internal_buffer_type);
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
+int msm_vdec_create_input_internal_buffers(struct msm_vidc_inst *inst)
+{
+	int rc = 0;
+	u32 i = 0;
+
+	for (i = 0; i < ARRAY_SIZE(msm_vdec_internal_buffer_type); i++) {
+		rc = msm_vidc_create_internal_buffers(inst, msm_vdec_internal_buffer_type[i]);
+		if (rc)
+			return rc;
+	}
+
+	return 0;
+}
+
+static int msm_vdec_create_output_internal_buffers(struct msm_vidc_inst *inst)
+{
+	int rc = 0;
+
+	rc = msm_vidc_create_internal_buffers(inst, MSM_VIDC_BUF_DPB);
+	if (rc)
+		return rc;
+
+	return 0;
+}
+
+int msm_vdec_queue_input_internal_buffers(struct msm_vidc_inst *inst)
+{
+	int rc = 0;
+	u32 i = 0;
+
+	for (i = 0; i < ARRAY_SIZE(msm_vdec_internal_buffer_type); i++) {
+		rc = msm_vidc_queue_internal_buffers(inst, msm_vdec_internal_buffer_type[i]);
+		if (rc)
+			return rc;
+	}
+
+	return 0;
+}
+
+static int msm_vdec_queue_output_internal_buffers(struct msm_vidc_inst *inst)
+{
+	int rc = 0;
+
+	rc = msm_vidc_queue_internal_buffers(inst, MSM_VIDC_BUF_DPB);
+	if (rc)
+		return rc;
+
+	return 0;
+}
+
+int msm_vdec_release_input_internal_buffers(struct msm_vidc_inst *inst)
+{
+	int rc = 0;
+	u32 i = 0;
+
+	for (i = 0; i < ARRAY_SIZE(msm_vdec_internal_buffer_type); i++) {
+		rc = msm_vidc_release_internal_buffers(inst, msm_vdec_internal_buffer_type[i]);
+		if (rc)
+			return rc;
+	}
+
+	return 0;
+}
+
+static int msm_vdec_subscribe_input_port_settings_change(struct msm_vidc_inst *inst,
+							 enum msm_vidc_port_type port)
+{
+	int rc = 0;
+	struct msm_vidc_core *core;
+	u32 payload[32] = {0};
+	u32 i, j;
+	u32 subscribe_psc_size;
+	const u32 *psc;
+	static const struct msm_vdec_prop_type_handle prop_type_handle_arr[] = {
+		{HFI_PROP_BITSTREAM_RESOLUTION,          msm_vdec_set_bitstream_resolution   },
+		{HFI_PROP_CROP_OFFSETS,                  msm_vdec_set_crop_offsets           },
+		{HFI_PROP_LUMA_CHROMA_BIT_DEPTH,         msm_vdec_set_bit_depth              },
+		{HFI_PROP_CODED_FRAMES,                  msm_vdec_set_coded_frames           },
+		{HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT,    msm_vdec_set_min_output_count       },
+		{HFI_PROP_PIC_ORDER_CNT_TYPE,            msm_vdec_set_picture_order_count    },
+		{HFI_PROP_SIGNAL_COLOR_INFO,             msm_vdec_set_colorspace             },
+		{HFI_PROP_PROFILE,                       msm_vdec_set_profile                },
+		{HFI_PROP_LEVEL,                         msm_vdec_set_level                  },
+		{HFI_PROP_TIER,                          msm_vdec_set_tier                   },
+	};
+
+	core = inst->core;
+
+	payload[0] = HFI_MODE_PORT_SETTINGS_CHANGE;
+	if (inst->codec == MSM_VIDC_H264) {
+		subscribe_psc_size = core->platform->data.psc_avc_tbl_size;
+		psc = core->platform->data.psc_avc_tbl;
+	} else if (inst->codec == MSM_VIDC_HEVC) {
+		subscribe_psc_size = core->platform->data.psc_hevc_tbl_size;
+		psc = core->platform->data.psc_hevc_tbl;
+	} else if (inst->codec == MSM_VIDC_VP9) {
+		subscribe_psc_size = core->platform->data.psc_vp9_tbl_size;
+		psc = core->platform->data.psc_vp9_tbl;
+	} else {
+		i_vpr_e(inst, "%s: unsupported codec: %d\n", __func__, inst->codec);
+		psc = NULL;
+		return -EINVAL;
+	}
+
+	if (!psc || !subscribe_psc_size) {
+		i_vpr_e(inst, "%s: invalid params\n", __func__);
+		return -EINVAL;
+	}
+
+	payload[0] = HFI_MODE_PORT_SETTINGS_CHANGE;
+	for (i = 0; i < subscribe_psc_size; i++)
+		payload[i + 1] = psc[i];
+	rc = venus_hfi_session_command(inst,
+				       HFI_CMD_SUBSCRIBE_MODE,
+				       port,
+				       HFI_PAYLOAD_U32_ARRAY,
+				       &payload[0],
+				       ((subscribe_psc_size + 1) *
+				       sizeof(u32)));
+
+	for (i = 0; i < subscribe_psc_size; i++) {
+		/* set session properties */
+		for (j = 0; j < ARRAY_SIZE(prop_type_handle_arr); j++) {
+			if (prop_type_handle_arr[j].type == psc[i]) {
+				rc = prop_type_handle_arr[j].handle(inst, port);
+				if (rc)
+					goto exit;
+				break;
+			}
+		}
+
+		/* is property type unknown ? */
+		if (j == ARRAY_SIZE(prop_type_handle_arr))
+			i_vpr_e(inst, "%s: unknown property %#x\n", __func__, psc[i]);
+	}
+
+exit:
+	return rc;
+}
+
+static int msm_vdec_subscribe_property(struct msm_vidc_inst *inst,
+				       enum msm_vidc_port_type port)
+{
+	u32 payload[32] = {0};
+	u32 i, count = 0;
+	struct msm_vidc_core *core;
+	u32 subscribe_prop_size;
+	const u32 *subcribe_prop;
+
+	core = inst->core;
+
+	payload[0] = HFI_MODE_PROPERTY;
+
+	if (port == INPUT_PORT) {
+		if (inst->codec == MSM_VIDC_H264) {
+			subscribe_prop_size = core->platform->data.dec_input_prop_size_avc;
+			subcribe_prop = core->platform->data.dec_input_prop_avc;
+		} else if (inst->codec == MSM_VIDC_HEVC) {
+			subscribe_prop_size = core->platform->data.dec_input_prop_size_hevc;
+			subcribe_prop = core->platform->data.dec_input_prop_hevc;
+		} else if (inst->codec == MSM_VIDC_VP9) {
+			subscribe_prop_size = core->platform->data.dec_input_prop_size_vp9;
+			subcribe_prop = core->platform->data.dec_input_prop_vp9;
+		} else {
+			i_vpr_e(inst, "%s: unsupported codec: %d\n", __func__, inst->codec);
+			subcribe_prop = NULL;
+			return -EINVAL;
+		}
+
+		for (i = 0; i < subscribe_prop_size; i++) {
+			payload[count + 1] = subcribe_prop[i];
+			count++;
+
+			if (subcribe_prop[i] == HFI_PROP_DPB_LIST) {
+				inst->input_dpb_list_enabled = true;
+				i_vpr_h(inst, "%s: DPB_LIST suscribed on input port", __func__);
+			}
+		}
+	} else if (port == OUTPUT_PORT) {
+		if (inst->codec == MSM_VIDC_H264) {
+			subscribe_prop_size = core->platform->data.dec_output_prop_size_avc;
+			subcribe_prop = core->platform->data.dec_output_prop_avc;
+		} else if (inst->codec == MSM_VIDC_HEVC) {
+			subscribe_prop_size = core->platform->data.dec_output_prop_size_hevc;
+			subcribe_prop = core->platform->data.dec_output_prop_hevc;
+		} else if (inst->codec == MSM_VIDC_VP9) {
+			subscribe_prop_size = core->platform->data.dec_output_prop_size_vp9;
+			subcribe_prop = core->platform->data.dec_output_prop_vp9;
+		} else {
+			i_vpr_e(inst, "%s: unsupported codec: %d\n", __func__, inst->codec);
+			subcribe_prop = NULL;
+			return -EINVAL;
+		}
+		for (i = 0; i < subscribe_prop_size; i++) {
+			payload[count + 1] = subcribe_prop[i];
+			count++;
+
+			if (subcribe_prop[i] == HFI_PROP_DPB_LIST) {
+				inst->output_dpb_list_enabled = true;
+				i_vpr_h(inst, "%s: DPB_LIST suscribed on output port", __func__);
+			}
+		}
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
+				       (count + 1) * sizeof(u32));
+}
+
+int msm_vdec_init_input_subcr_params(struct msm_vidc_inst *inst)
+{
+	struct msm_vidc_subscription_params *subsc_params;
+	u32 left_offset, top_offset, right_offset, bottom_offset;
+	u32 primaries, matrix_coeff, transfer_char;
+	u32 full_range = 0, video_format = 0;
+	u32 colour_description_present_flag = 0;
+	u32 video_signal_type_present_flag = 0;
+	struct v4l2_pix_format_mplane *pixmp_ip, *pixmp_op;
+
+	subsc_params = &inst->subcr_params[INPUT_PORT];
+	pixmp_ip = &inst->fmts[INPUT_PORT].fmt.pix_mp;
+	pixmp_op = &inst->fmts[OUTPUT_PORT].fmt.pix_mp;
+
+	subsc_params->bitstream_resolution =
+		pixmp_ip->width << 16 |
+		pixmp_ip->height;
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
+	subsc_params->fw_min_count = inst->buffers.output.min_count;
+
+	primaries = v4l2_color_primaries_to_driver(inst,
+						   pixmp_op->colorspace, __func__);
+	matrix_coeff = v4l2_matrix_coeff_to_driver(inst,
+						   pixmp_op->ycbcr_enc, __func__);
+	transfer_char = v4l2_transfer_char_to_driver(inst,
+						     pixmp_op->xfer_func, __func__);
+	full_range = pixmp_op->quantization ==
+		V4L2_QUANTIZATION_FULL_RANGE ? 1 : 0;
+	subsc_params->color_info =
+		(matrix_coeff & 0xFF) |
+		((transfer_char << 8) & 0xFF00) |
+		((primaries << 16) & 0xFF0000) |
+		((colour_description_present_flag << 24) & 0x1000000) |
+		((full_range << 25) & 0x2000000) |
+		((video_format << 26) & 0x1C000000) |
+		((video_signal_type_present_flag << 29) & 0x20000000);
+
+	subsc_params->profile = inst->capabilities[PROFILE].value;
+	subsc_params->level = inst->capabilities[LEVEL].value;
+	subsc_params->tier = inst->capabilities[HEVC_TIER].value;
+	subsc_params->pic_order_cnt = inst->capabilities[POC].value;
+	subsc_params->bit_depth = inst->capabilities[BIT_DEPTH].value;
+	if (inst->capabilities[CODED_FRAMES].value ==
+			CODED_FRAMES_PROGRESSIVE)
+		subsc_params->coded_frames = HFI_BITMASK_FRAME_MBS_ONLY_FLAG;
+	else
+		subsc_params->coded_frames = 0;
+
+	return 0;
+}
+
+int msm_vdec_set_num_comv(struct msm_vidc_inst *inst)
+{
+	int rc = 0;
+	u32 num_comv = 0;
+
+	num_comv = inst->capabilities[NUM_COMV].value;
+	i_vpr_h(inst, "%s: num COMV: %d", __func__, num_comv);
+	rc = venus_hfi_session_property(inst,
+					HFI_PROP_COMV_BUFFER_COUNT,
+					HFI_HOST_FLAGS_NONE,
+					get_hfi_port(inst, INPUT_PORT),
+					HFI_PAYLOAD_U32,
+					&num_comv,
+					sizeof(u32));
+	if (rc) {
+		i_vpr_e(inst, "%s: set property failed\n", __func__);
+		return rc;
+	}
+
+	return rc;
+}
+
+static int msm_vdec_read_input_subcr_params(struct msm_vidc_inst *inst)
+{
+	struct msm_vidc_subscription_params subsc_params;
+	struct msm_vidc_core *core;
+	u32 width, height;
+	u32 primaries, matrix_coeff, transfer_char;
+	u32 full_range = 0;
+	u32 colour_description_present_flag = 0;
+	u32 video_signal_type_present_flag = 0;
+	enum msm_vidc_colorformat_type output_fmt;
+	struct v4l2_pix_format_mplane *pixmp_ip, *pixmp_op;
+
+	core = inst->core;
+
+	subsc_params = inst->subcr_params[INPUT_PORT];
+	pixmp_ip = &inst->fmts[INPUT_PORT].fmt.pix_mp;
+	pixmp_op = &inst->fmts[OUTPUT_PORT].fmt.pix_mp;
+	width = (subsc_params.bitstream_resolution &
+		HFI_BITMASK_BITSTREAM_WIDTH) >> 16;
+	height = subsc_params.bitstream_resolution &
+		HFI_BITMASK_BITSTREAM_HEIGHT;
+
+	pixmp_ip->width = width;
+	pixmp_ip->height = height;
+
+	output_fmt = v4l2_colorformat_to_driver(inst,
+						pixmp_op->pixelformat, __func__);
+
+	pixmp_op->width = video_y_stride_pix(output_fmt, width);
+	pixmp_op->height = video_y_scanlines(output_fmt, height);
+	pixmp_op->plane_fmt[0].bytesperline =
+		video_y_stride_bytes(output_fmt, width);
+	pixmp_op->plane_fmt[0].sizeimage =
+		call_session_op(core, buffer_size, inst, MSM_VIDC_BUF_OUTPUT);
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
+				v4l2_color_primaries_from_driver(inst, primaries, __func__);
+			pixmp_op->xfer_func =
+				v4l2_transfer_char_from_driver(inst, transfer_char, __func__);
+			pixmp_op->ycbcr_enc =
+				v4l2_matrix_coeff_from_driver(inst, matrix_coeff, __func__);
+		} else {
+			i_vpr_h(inst,
+				"%s: color description flag is not present\n",
+				__func__);
+		}
+	} else {
+		i_vpr_h(inst, "%s: video_signal type is not present\n",
+			__func__);
+	}
+
+	/* align input port color info with output port */
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
+	msm_vidc_update_cap_value(inst, PROFILE, subsc_params.profile, __func__);
+	msm_vidc_update_cap_value(inst, LEVEL, subsc_params.level, __func__);
+	msm_vidc_update_cap_value(inst, HEVC_TIER, subsc_params.tier, __func__);
+	msm_vidc_update_cap_value(inst, POC, subsc_params.pic_order_cnt, __func__);
+	if (subsc_params.bit_depth == BIT_DEPTH_8)
+		msm_vidc_update_cap_value(inst, BIT_DEPTH, BIT_DEPTH_8, __func__);
+	else
+		msm_vidc_update_cap_value(inst, BIT_DEPTH, BIT_DEPTH_10, __func__);
+	if (subsc_params.coded_frames & HFI_BITMASK_FRAME_MBS_ONLY_FLAG)
+		msm_vidc_update_cap_value(inst, CODED_FRAMES, CODED_FRAMES_PROGRESSIVE, __func__);
+	else
+		msm_vidc_update_cap_value(inst, CODED_FRAMES, CODED_FRAMES_INTERLACE, __func__);
+
+	inst->fw_min_count = subsc_params.fw_min_count;
+	inst->buffers.output.min_count =
+		call_session_op(core, min_count, inst, MSM_VIDC_BUF_OUTPUT);
+	inst->buffers.output.extra_count =
+		call_session_op(core, extra_count, inst, MSM_VIDC_BUF_OUTPUT);
+
+	return 0;
+}
+
+int msm_vdec_input_port_settings_change(struct msm_vidc_inst *inst)
+{
+	u32 rc = 0;
+	struct v4l2_event event = {0};
+
+	if (!inst->bufq[INPUT_PORT].vb2q->streaming) {
+		i_vpr_e(inst, "%s: input port not streaming\n",
+			__func__);
+		return 0;
+	}
+
+	rc = msm_vdec_read_input_subcr_params(inst);
+	if (rc)
+		return rc;
+
+	event.type = V4L2_EVENT_SOURCE_CHANGE;
+	event.u.src_change.changes = V4L2_EVENT_SRC_CH_RESOLUTION;
+	v4l2_event_queue_fh(&inst->fh, &event);
+
+	return rc;
+}
+
+int msm_vdec_streamoff_input(struct msm_vidc_inst *inst)
+{
+	int rc = 0;
+
+	rc = msm_vidc_session_streamoff(inst, INPUT_PORT);
+	if (rc)
+		return rc;
+
+	return 0;
+}
+
+int msm_vdec_streamon_input(struct msm_vidc_inst *inst)
+{
+	int rc = 0;
+
+	rc = msm_vidc_check_session_supported(inst);
+	if (rc)
+		goto error;
+
+	rc = msm_vidc_set_v4l2_properties(inst);
+	if (rc)
+		goto error;
+
+	rc = msm_vdec_get_input_internal_buffers(inst);
+	if (rc)
+		goto error;
+
+	rc = msm_vdec_destroy_internal_buffers(inst, INPUT_PORT);
+	if (rc)
+		goto error;
+
+	rc = msm_vdec_create_input_internal_buffers(inst);
+	if (rc)
+		goto error;
+
+	rc = msm_vdec_queue_input_internal_buffers(inst);
+	if (rc)
+		goto error;
+
+	if (!inst->ipsc_properties_set) {
+		rc = msm_vdec_subscribe_input_port_settings_change(inst, INPUT_PORT);
+		if (rc)
+			goto error;
+		inst->ipsc_properties_set = true;
+	}
+
+	rc = msm_vdec_subscribe_property(inst, INPUT_PORT);
+	if (rc)
+		goto error;
+
+	rc = msm_vidc_process_streamon_input(inst);
+	if (rc)
+		goto error;
+
+	rc = msm_vidc_flush_ts(inst);
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
+static int schedule_batch_work(struct msm_vidc_inst *inst)
+{
+	struct msm_vidc_core *core;
+
+	if (!inst || !inst->core) {
+		d_vpr_e("%s: invalid params\n", __func__);
+		return -EINVAL;
+	}
+	core = inst->core;
+	mod_delayed_work(core->batch_workq, &inst->decode_batch.work,
+			 msecs_to_jiffies(core->capabilities[DECODE_BATCH_TIMEOUT].value));
+
+	return 0;
+}
+
+static int cancel_batch_work(struct msm_vidc_inst *inst)
+{
+	if (!inst) {
+		d_vpr_e("%s: Invalid arguments\n", __func__);
+		return -EINVAL;
+	}
+	cancel_delayed_work(&inst->decode_batch.work);
+
+	return 0;
+}
+
+int msm_vdec_streamoff_output(struct msm_vidc_inst *inst)
+{
+	int rc = 0;
+
+	/* cancel pending batch work */
+	cancel_batch_work(inst);
+	rc = msm_vidc_session_streamoff(inst, OUTPUT_PORT);
+	if (rc)
+		return rc;
+
+	return 0;
+}
+
+static int msm_vdec_subscribe_output_port_settings_change(struct msm_vidc_inst *inst,
+							  enum msm_vidc_port_type port)
+{
+	int rc = 0;
+	struct msm_vidc_core *core;
+	u32 payload[32] = {0};
+	u32 prop_type, payload_size, payload_type;
+	u32 i;
+	struct msm_vidc_subscription_params subsc_params;
+	u32 subscribe_psc_size = 0;
+	const u32 *psc = NULL;
+
+	core = inst->core;
+
+	payload[0] = HFI_MODE_PORT_SETTINGS_CHANGE;
+	if (inst->codec == MSM_VIDC_H264) {
+		subscribe_psc_size = core->platform->data.psc_avc_tbl_size;
+		psc = core->platform->data.psc_avc_tbl;
+	} else if (inst->codec == MSM_VIDC_HEVC) {
+		subscribe_psc_size = core->platform->data.psc_hevc_tbl_size;
+		psc = core->platform->data.psc_hevc_tbl;
+	} else if (inst->codec == MSM_VIDC_VP9) {
+		subscribe_psc_size = core->platform->data.psc_vp9_tbl_size;
+		psc = core->platform->data.psc_vp9_tbl;
+	} else {
+		i_vpr_e(inst, "%s: unsupported codec: %d\n", __func__, inst->codec);
+		psc = NULL;
+		return -EINVAL;
+	}
+
+	if (!psc || !subscribe_psc_size) {
+		i_vpr_e(inst, "%s: invalid params\n", __func__);
+		return -EINVAL;
+	}
+
+	payload[0] = HFI_MODE_PORT_SETTINGS_CHANGE;
+	for (i = 0; i < subscribe_psc_size; i++)
+		payload[i + 1] = psc[i];
+
+	rc = venus_hfi_session_command(inst,
+				       HFI_CMD_SUBSCRIBE_MODE,
+				       port,
+				       HFI_PAYLOAD_U32_ARRAY,
+				       &payload[0],
+				       ((subscribe_psc_size + 1) *
+				       sizeof(u32)));
+
+	subsc_params = inst->subcr_params[port];
+	for (i = 0; i < subscribe_psc_size; i++) {
+		payload[0] = 0;
+		payload[1] = 0;
+		payload_size = 0;
+		payload_type = 0;
+		prop_type = psc[i];
+		switch (prop_type) {
+		case HFI_PROP_BITSTREAM_RESOLUTION:
+			payload[0] = subsc_params.bitstream_resolution;
+			payload_size = sizeof(u32);
+			payload_type = HFI_PAYLOAD_U32;
+			break;
+		case HFI_PROP_CROP_OFFSETS:
+			payload[0] = subsc_params.crop_offsets[0];
+			payload[1] = subsc_params.crop_offsets[1];
+			payload_size = sizeof(u64);
+			payload_type = HFI_PAYLOAD_64_PACKED;
+			break;
+		case HFI_PROP_LUMA_CHROMA_BIT_DEPTH:
+			payload[0] = subsc_params.bit_depth;
+			payload_size = sizeof(u32);
+			payload_type = HFI_PAYLOAD_U32;
+			break;
+		case HFI_PROP_CODED_FRAMES:
+			payload[0] = subsc_params.coded_frames;
+			payload_size = sizeof(u32);
+			payload_type = HFI_PAYLOAD_U32;
+			break;
+		case HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT:
+			payload[0] = subsc_params.fw_min_count;
+			payload_size = sizeof(u32);
+			payload_type = HFI_PAYLOAD_U32;
+			break;
+		case HFI_PROP_PIC_ORDER_CNT_TYPE:
+			payload[0] = subsc_params.pic_order_cnt;
+			payload_size = sizeof(u32);
+			payload_type = HFI_PAYLOAD_U32;
+			break;
+		case HFI_PROP_SIGNAL_COLOR_INFO:
+			payload[0] = subsc_params.color_info;
+			payload_size = sizeof(u32);
+			payload_type = HFI_PAYLOAD_U32;
+			break;
+		case HFI_PROP_PROFILE:
+			payload[0] = subsc_params.profile;
+			payload_size = sizeof(u32);
+			payload_type = HFI_PAYLOAD_U32;
+			break;
+		case HFI_PROP_LEVEL:
+			payload[0] = subsc_params.level;
+			payload_size = sizeof(u32);
+			payload_type = HFI_PAYLOAD_U32;
+			break;
+		case HFI_PROP_TIER:
+			payload[0] = subsc_params.tier;
+			payload_size = sizeof(u32);
+			payload_type = HFI_PAYLOAD_U32;
+			break;
+		default:
+			i_vpr_e(inst, "%s: unknown property %#x\n", __func__,
+				prop_type);
+			prop_type = 0;
+			rc = -EINVAL;
+			break;
+		}
+		if (prop_type) {
+			rc = venus_hfi_session_property(inst,
+							prop_type,
+							HFI_HOST_FLAGS_NONE,
+							get_hfi_port(inst, port),
+							payload_type,
+							&payload,
+							payload_size);
+			if (rc)
+				return rc;
+		}
+	}
+
+	return rc;
+}
+
+int msm_vdec_streamon_output(struct msm_vidc_inst *inst)
+{
+	int rc = 0;
+
+	if (inst->capabilities[CODED_FRAMES].value == CODED_FRAMES_INTERLACE &&
+	    !is_ubwc_colorformat(inst->capabilities[PIX_FMTS].value)) {
+		i_vpr_e(inst,
+			"%s: interlace with non-ubwc color format is unsupported\n",
+			__func__);
+		return -EINVAL;
+	}
+
+	rc = msm_vidc_check_session_supported(inst);
+	if (rc)
+		goto error;
+
+	rc = msm_vdec_set_output_properties(inst);
+	if (rc)
+		goto error;
+
+	if (!inst->opsc_properties_set) {
+		memcpy(&inst->subcr_params[OUTPUT_PORT],
+		       &inst->subcr_params[INPUT_PORT],
+		       sizeof(inst->subcr_params[INPUT_PORT]));
+		rc = msm_vdec_subscribe_output_port_settings_change(inst, OUTPUT_PORT);
+		if (rc)
+			goto error;
+		inst->opsc_properties_set = true;
+	}
+
+	rc = msm_vdec_subscribe_property(inst, OUTPUT_PORT);
+	if (rc)
+		goto error;
+
+	rc = msm_vdec_get_output_internal_buffers(inst);
+	if (rc)
+		goto error;
+
+	rc = msm_vdec_destroy_internal_buffers(inst, OUTPUT_PORT);
+	if (rc)
+		goto error;
+
+	rc = msm_vdec_create_output_internal_buffers(inst);
+	if (rc)
+		goto error;
+
+	rc = msm_vidc_process_streamon_output(inst);
+	if (rc)
+		goto error;
+
+	rc = msm_vdec_queue_output_internal_buffers(inst);
+	if (rc)
+		goto error;
+
+	return 0;
+
+error:
+	i_vpr_e(inst, "%s: failed\n", __func__);
+	msm_vdec_streamoff_output(inst);
+	return rc;
+}
+
+static inline
+enum msm_vidc_allow msm_vdec_allow_queue_deferred_buffers(struct msm_vidc_inst *inst)
+{
+	int count;
+
+	/* do not defer buffers initially to avoid latency issues */
+	if (inst->power.buffer_counter <= SKIP_BATCH_WINDOW)
+		return MSM_VIDC_ALLOW;
+
+	/* defer qbuf, if pending buffers count less than batch size */
+	count = msm_vidc_num_buffers(inst, MSM_VIDC_BUF_OUTPUT, MSM_VIDC_ATTR_DEFERRED);
+	if (count < inst->decode_batch.size)
+		return MSM_VIDC_DEFER;
+
+	return MSM_VIDC_ALLOW;
+}
+
+static int msm_vdec_qbuf_batch(struct msm_vidc_inst *inst,
+			       struct vb2_buffer *vb2)
+{
+	struct msm_vidc_buffer *buf = NULL;
+	enum msm_vidc_allow allow;
+
+	if (!inst->decode_batch.size) {
+		d_vpr_e("%s: invalid params\n", __func__);
+		return -EINVAL;
+	}
+
+	buf = msm_vidc_get_driver_buf(inst, vb2);
+	if (!buf)
+		return -EINVAL;
+
+	if (is_state(inst, MSM_VIDC_OPEN) ||
+	    is_state(inst, MSM_VIDC_INPUT_STREAMING)) {
+		print_vidc_buffer(VIDC_LOW, "low ", "qbuf deferred", inst, buf);
+		return 0;
+	}
+
+	allow = msm_vdec_allow_queue_deferred_buffers(inst);
+	if (allow == MSM_VIDC_DISALLOW) {
+		i_vpr_e(inst, "%s: queue deferred buffers not allowed\n", __func__);
+		return -EINVAL;
+	} else if (allow == MSM_VIDC_DEFER) {
+		print_vidc_buffer(VIDC_LOW, "low ", "batch-qbuf deferred", inst, buf);
+		schedule_batch_work(inst);
+		return 0;
+	}
+
+	cancel_batch_work(inst);
+	return msm_vidc_queue_deferred_buffers(inst, MSM_VIDC_BUF_OUTPUT);
+}
+
+static int msm_vdec_release_eligible_buffers(struct msm_vidc_inst *inst)
+{
+	int rc = 0;
+	struct msm_vidc_buffer *ro_buf;
+
+	list_for_each_entry(ro_buf, &inst->buffers.read_only.list, list) {
+		/* release only release eligible read-only buffers */
+		if (!(ro_buf->attr & MSM_VIDC_ATTR_RELEASE_ELIGIBLE))
+			continue;
+		/* skip releasing buffers for which release cmd was already sent */
+		if (ro_buf->attr & MSM_VIDC_ATTR_PENDING_RELEASE)
+			continue;
+		rc = venus_hfi_release_buffer(inst, ro_buf);
+		if (rc)
+			return rc;
+		ro_buf->attr |= MSM_VIDC_ATTR_PENDING_RELEASE;
+		ro_buf->attr &= ~MSM_VIDC_ATTR_RELEASE_ELIGIBLE;
+		print_vidc_buffer(VIDC_LOW, "low ", "release buf", inst, ro_buf);
+	}
+
+	return rc;
+}
+
+static int msm_vdec_release_nonref_buffers(struct msm_vidc_inst *inst)
+{
+	int rc = 0;
+	u32 fw_ro_count = 0, nonref_ro_count = 0;
+	struct msm_vidc_buffer *ro_buf;
+	int i = 0;
+	bool found = false;
+
+	/* count read_only buffers which are not pending release in read_only list */
+	list_for_each_entry(ro_buf, &inst->buffers.read_only.list, list) {
+		if (!(ro_buf->attr & MSM_VIDC_ATTR_READ_ONLY))
+			continue;
+		if (ro_buf->attr & MSM_VIDC_ATTR_PENDING_RELEASE)
+			continue;
+		fw_ro_count++;
+	}
+
+	if (fw_ro_count <= MAX_DPB_COUNT)
+		return 0;
+
+	/*
+	 * Mark those read only buffers present in read_only list as
+	 * non-reference if that buffer is not part of dpb_list_payload.
+	 * count such non-ref read only buffers as nonref_ro_count.
+	 * dpb_list_payload details:
+	 * payload[0-1]           : 64 bits base_address of DPB-1
+	 * payload[2]             : 32 bits addr_offset  of DPB-1
+	 * payload[3]             : 32 bits data_offset  of DPB-1
+	 */
+	list_for_each_entry(ro_buf, &inst->buffers.read_only.list, list) {
+		found = false;
+		if (!(ro_buf->attr & MSM_VIDC_ATTR_READ_ONLY))
+			continue;
+		if (ro_buf->attr & MSM_VIDC_ATTR_PENDING_RELEASE)
+			continue;
+		for (i = 0; (i + 3) < MAX_DPB_LIST_ARRAY_SIZE; i = i + 4) {
+			if (ro_buf->device_addr == inst->dpb_list_payload[i] &&
+			    ro_buf->data_offset == inst->dpb_list_payload[i + 3]) {
+				found = true;
+				break;
+			}
+		}
+		if (!found)
+			nonref_ro_count++;
+	}
+
+	if (nonref_ro_count <= inst->buffers.output.min_count)
+		return 0;
+
+	i_vpr_l(inst, "%s: fw ro buf count %d, non-ref ro count %d\n",
+		__func__, fw_ro_count, nonref_ro_count);
+
+	/* release the eligible buffers as per above condition */
+	list_for_each_entry(ro_buf, &inst->buffers.read_only.list, list) {
+		found = false;
+		if (!(ro_buf->attr & MSM_VIDC_ATTR_READ_ONLY))
+			continue;
+		if (ro_buf->attr & MSM_VIDC_ATTR_PENDING_RELEASE)
+			continue;
+		for (i = 0; (i + 3) < MAX_DPB_LIST_ARRAY_SIZE; i = i + 4) {
+			if (ro_buf->device_addr == inst->dpb_list_payload[i] &&
+			    ro_buf->data_offset == inst->dpb_list_payload[i + 3]) {
+				found = true;
+				break;
+			}
+		}
+		if (!found) {
+			ro_buf->attr |= MSM_VIDC_ATTR_PENDING_RELEASE;
+			print_vidc_buffer(VIDC_LOW, "low ", "release buf", inst, ro_buf);
+			rc = venus_hfi_release_buffer(inst, ro_buf);
+			if (rc)
+				return rc;
+		}
+	}
+
+	return rc;
+}
+
+int msm_vdec_qbuf(struct msm_vidc_inst *inst, struct vb2_buffer *vb2)
+{
+	int rc = 0;
+
+	/* batch decoder output & meta buffer only */
+	if (inst->decode_batch.enable && vb2->type == OUTPUT_MPLANE)
+		rc = msm_vdec_qbuf_batch(inst, vb2);
+	else
+		rc = msm_vidc_queue_buffer_single(inst, vb2);
+	if (rc)
+		return rc;
+
+	/*
+	 * if DPB_LIST property is subscribed on output port, then
+	 * driver needs to hold at least MAX_BPB_COUNT of read only
+	 * buffers. So call msm_vdec_release_nonref_buffers() to handle
+	 * the same.
+	 */
+	if (vb2->type == OUTPUT_MPLANE) {
+		if (inst->input_dpb_list_enabled)
+			rc = msm_vdec_release_eligible_buffers(inst);
+		else if (inst->output_dpb_list_enabled)
+			rc = msm_vdec_release_nonref_buffers(inst);
+		if (rc)
+			return rc;
+	}
+
+	return rc;
+}
+
+static int msm_vdec_alloc_and_queue_additional_dpb_buffers(struct msm_vidc_inst *inst)
+{
+	struct msm_vidc_buffers *buffers;
+	struct msm_vidc_buffer *buffer = NULL;
+	int i, cur_min_count = 0, rc = 0;
+
+	/* get latest min_count and size */
+	rc = msm_vidc_get_internal_buffers(inst, MSM_VIDC_BUF_DPB);
+	if (rc)
+		return rc;
+
+	buffers = msm_vidc_get_buffers(inst, MSM_VIDC_BUF_DPB, __func__);
+	if (!buffers)
+		return -EINVAL;
+
+	/* get current min_count */
+	list_for_each_entry(buffer, &buffers->list, list)
+		cur_min_count++;
+
+	/* skip alloc and queue */
+	if (cur_min_count >= buffers->min_count)
+		return 0;
+
+	i_vpr_h(inst, "%s: dpb buffer count increased from %u -> %u\n",
+		__func__, cur_min_count, buffers->min_count);
+
+	/* allocate additional DPB buffers */
+	for (i = cur_min_count; i < buffers->min_count; i++) {
+		rc = msm_vidc_create_internal_buffer(inst, MSM_VIDC_BUF_DPB, i);
+		if (rc)
+			return rc;
+	}
+
+	/* queue additional DPB buffers */
+	rc = msm_vidc_queue_internal_buffers(inst, MSM_VIDC_BUF_DPB);
+	if (rc)
+		return rc;
+
+	return 0;
+}
+
+int msm_vdec_stop_cmd(struct msm_vidc_inst *inst)
+{
+	i_vpr_h(inst, "received cmd: drain\n");
+	return msm_vidc_process_drain(inst);
+}
+
+int msm_vdec_start_cmd(struct msm_vidc_inst *inst)
+{
+	int rc = 0;
+
+	i_vpr_h(inst, "received cmd: resume\n");
+	vb2_clear_last_buffer_dequeued(inst->bufq[OUTPUT_PORT].vb2q);
+
+	if (inst->capabilities[CODED_FRAMES].value == CODED_FRAMES_INTERLACE &&
+	    !is_ubwc_colorformat(inst->capabilities[PIX_FMTS].value)) {
+		i_vpr_e(inst,
+			"%s: interlace with non-ubwc color format is unsupported\n",
+			__func__);
+		return -EINVAL;
+	}
+
+	/* tune power features */
+	inst->decode_batch.enable = msm_vidc_allow_decode_batch(inst);
+	msm_vidc_allow_dcvs(inst);
+	msm_vidc_power_data_reset(inst);
+
+	/*
+	 * client is completing partial port reconfiguration,
+	 * hence reallocate input internal buffers before input port
+	 * is resumed.
+	 */
+	if (is_sub_state(inst, MSM_VIDC_DRC) &&
+	    is_sub_state(inst, MSM_VIDC_DRC_LAST_BUFFER) &&
+	    is_sub_state(inst, MSM_VIDC_INPUT_PAUSE)) {
+		rc = msm_vidc_alloc_and_queue_input_internal_buffers(inst);
+		if (rc)
+			return rc;
+
+		rc = msm_vidc_set_stage(inst, STAGE);
+		if (rc)
+			return rc;
+
+		rc = msm_vidc_set_pipe(inst, PIPE);
+		if (rc)
+			return rc;
+	}
+
+	/* allocate and queue extra dpb buffers */
+	rc = msm_vdec_alloc_and_queue_additional_dpb_buffers(inst);
+	if (rc)
+		return rc;
+
+	/* queue pending deferred buffers */
+	rc = msm_vidc_queue_deferred_buffers(inst, MSM_VIDC_BUF_OUTPUT);
+	if (rc)
+		return rc;
+
+	/* print final buffer counts & size details */
+	msm_vidc_print_buffer_info(inst);
+
+	/* print internal buffer memory usage stats */
+	msm_vidc_print_memory_stats(inst);
+
+	rc = msm_vidc_process_resume(inst);
+
+	return rc;
+}
+
+int msm_vdec_try_fmt(struct msm_vidc_inst *inst, struct v4l2_format *f)
+{
+	int rc = 0;
+	struct v4l2_pix_format_mplane *pixmp = &f->fmt.pix_mp;
+	u32 pix_fmt;
+
+	memset(pixmp->reserved, 0, sizeof(pixmp->reserved));
+	if (f->type == INPUT_MPLANE) {
+		pix_fmt = v4l2_codec_to_driver(inst, f->fmt.pix_mp.pixelformat, __func__);
+		if (!pix_fmt) {
+			i_vpr_e(inst, "%s: unsupported codec, set current params\n", __func__);
+			f->fmt.pix_mp.width = inst->fmts[INPUT_PORT].fmt.pix_mp.width;
+			f->fmt.pix_mp.height = inst->fmts[INPUT_PORT].fmt.pix_mp.height;
+			f->fmt.pix_mp.pixelformat = inst->fmts[INPUT_PORT].fmt.pix_mp.pixelformat;
+			pix_fmt = v4l2_codec_to_driver(inst, f->fmt.pix_mp.pixelformat, __func__);
+		}
+	} else if (f->type == OUTPUT_MPLANE) {
+		pix_fmt = v4l2_colorformat_to_driver(inst, f->fmt.pix_mp.pixelformat, __func__);
+		if (!pix_fmt) {
+			i_vpr_e(inst, "%s: unsupported format, set current params\n", __func__);
+			f->fmt.pix_mp.pixelformat = inst->fmts[OUTPUT_PORT].fmt.pix_mp.pixelformat;
+			f->fmt.pix_mp.width = inst->fmts[OUTPUT_PORT].fmt.pix_mp.width;
+			f->fmt.pix_mp.height = inst->fmts[OUTPUT_PORT].fmt.pix_mp.height;
+		}
+		if (inst->bufq[INPUT_PORT].vb2q->streaming) {
+			f->fmt.pix_mp.height = inst->fmts[INPUT_PORT].fmt.pix_mp.height;
+			f->fmt.pix_mp.width = inst->fmts[INPUT_PORT].fmt.pix_mp.width;
+		}
+	} else {
+		i_vpr_e(inst, "%s: invalid type %d\n", __func__, f->type);
+		return -EINVAL;
+	}
+
+	if (pixmp->field == V4L2_FIELD_ANY)
+		pixmp->field = V4L2_FIELD_NONE;
+
+	pixmp->num_planes = 1;
+	return rc;
+}
+
+static bool msm_vidc_check_max_sessions_vp9d(struct msm_vidc_core *core)
+{
+	u32 vp9d_instance_count = 0;
+	struct msm_vidc_inst *inst = NULL;
+
+	core_lock(core, __func__);
+	list_for_each_entry(inst, &core->instances, list) {
+		if (is_decode_session(inst) &&
+		    inst->fmts[INPUT_PORT].fmt.pix_mp.pixelformat ==
+			V4L2_PIX_FMT_VP9)
+			vp9d_instance_count++;
+	}
+	core_unlock(core, __func__);
+
+	if (vp9d_instance_count > MAX_VP9D_INST_COUNT)
+		return true;
+	return false;
+}
+
+int msm_vdec_s_fmt(struct msm_vidc_inst *inst, struct v4l2_format *f)
+{
+	int rc = 0;
+	struct msm_vidc_core *core;
+	struct v4l2_format *fmt, *output_fmt;
+	u32 codec_align;
+	enum msm_vidc_colorformat_type colorformat;
+
+	core = inst->core;
+	msm_vdec_try_fmt(inst, f);
+
+	if (f->type == INPUT_MPLANE) {
+		if (inst->fmts[INPUT_PORT].fmt.pix_mp.pixelformat !=
+			f->fmt.pix_mp.pixelformat) {
+			rc = msm_vdec_codec_change(inst, f->fmt.pix_mp.pixelformat);
+			if (rc)
+				goto err_invalid_fmt;
+		}
+
+		if (f->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_VP9) {
+			if (msm_vidc_check_max_sessions_vp9d(inst->core)) {
+				i_vpr_e(inst,
+					"%s: vp9d sessions exceeded max limit %d\n",
+					__func__, MAX_VP9D_INST_COUNT);
+				rc = -ENOMEM;
+				goto err_invalid_fmt;
+			}
+		}
+
+		fmt = &inst->fmts[INPUT_PORT];
+		fmt->type = INPUT_MPLANE;
+
+		codec_align = inst->fmts[INPUT_PORT].fmt.pix_mp.pixelformat ==
+			V4L2_PIX_FMT_HEVC ? 32 : 16;
+		fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, codec_align);
+		fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, codec_align);
+		fmt->fmt.pix_mp.num_planes = 1;
+		fmt->fmt.pix_mp.plane_fmt[0].bytesperline = 0;
+		fmt->fmt.pix_mp.plane_fmt[0].sizeimage =
+			call_session_op(core, buffer_size, inst, MSM_VIDC_BUF_INPUT);
+		inst->buffers.input.min_count =
+			call_session_op(core, min_count, inst, MSM_VIDC_BUF_INPUT);
+		inst->buffers.input.extra_count =
+			call_session_op(core, extra_count, inst, MSM_VIDC_BUF_INPUT);
+		if (inst->buffers.input.actual_count <
+			inst->buffers.input.min_count +
+			inst->buffers.input.extra_count) {
+			inst->buffers.input.actual_count =
+				inst->buffers.input.min_count +
+				inst->buffers.input.extra_count;
+		}
+		inst->buffers.input.size =
+			fmt->fmt.pix_mp.plane_fmt[0].sizeimage;
+		/* update input port color info */
+		fmt->fmt.pix_mp.colorspace = f->fmt.pix_mp.colorspace;
+		fmt->fmt.pix_mp.xfer_func = f->fmt.pix_mp.xfer_func;
+		fmt->fmt.pix_mp.ycbcr_enc = f->fmt.pix_mp.ycbcr_enc;
+		fmt->fmt.pix_mp.quantization = f->fmt.pix_mp.quantization;
+		/* update output port color info */
+		output_fmt = &inst->fmts[OUTPUT_PORT];
+		output_fmt->fmt.pix_mp.colorspace = f->fmt.pix_mp.colorspace;
+		output_fmt->fmt.pix_mp.xfer_func = f->fmt.pix_mp.xfer_func;
+		output_fmt->fmt.pix_mp.ycbcr_enc = f->fmt.pix_mp.ycbcr_enc;
+		output_fmt->fmt.pix_mp.quantization = f->fmt.pix_mp.quantization;
+
+		/* update crop dimensions */
+		inst->crop.left = 0;
+		inst->crop.top = 0;
+		inst->crop.width = f->fmt.pix_mp.width;
+		inst->crop.height = f->fmt.pix_mp.height;
+		i_vpr_h(inst,
+			"%s: type: INPUT, codec %s width %d height %d size %u min_count %d extra_count %d\n",
+			__func__, v4l2_pixelfmt_name(inst, f->fmt.pix_mp.pixelformat),
+			f->fmt.pix_mp.width, f->fmt.pix_mp.height,
+			fmt->fmt.pix_mp.plane_fmt[0].sizeimage,
+			inst->buffers.input.min_count,
+			inst->buffers.input.extra_count);
+	} else if (f->type == OUTPUT_MPLANE) {
+		fmt = &inst->fmts[OUTPUT_PORT];
+		fmt->type = OUTPUT_MPLANE;
+		if (inst->bufq[INPUT_PORT].vb2q->streaming) {
+			f->fmt.pix_mp.height = inst->fmts[INPUT_PORT].fmt.pix_mp.height;
+			f->fmt.pix_mp.width = inst->fmts[INPUT_PORT].fmt.pix_mp.width;
+		}
+		fmt->fmt.pix_mp.pixelformat = f->fmt.pix_mp.pixelformat;
+		colorformat = v4l2_colorformat_to_driver(inst, fmt->fmt.pix_mp.pixelformat,
+							 __func__);
+		fmt->fmt.pix_mp.width = video_y_stride_pix(colorformat, f->fmt.pix_mp.width);
+		fmt->fmt.pix_mp.height = video_y_scanlines(colorformat, f->fmt.pix_mp.height);
+		fmt->fmt.pix_mp.num_planes = 1;
+		fmt->fmt.pix_mp.plane_fmt[0].bytesperline =
+			video_y_stride_bytes(colorformat, f->fmt.pix_mp.width);
+		fmt->fmt.pix_mp.plane_fmt[0].sizeimage =
+			call_session_op(core, buffer_size, inst, MSM_VIDC_BUF_OUTPUT);
+
+		if (!inst->bufq[INPUT_PORT].vb2q->streaming)
+			inst->buffers.output.min_count =
+				call_session_op(core, min_count, inst, MSM_VIDC_BUF_OUTPUT);
+		inst->buffers.output.extra_count =
+			call_session_op(core, extra_count, inst, MSM_VIDC_BUF_OUTPUT);
+		if (inst->buffers.output.actual_count <
+			inst->buffers.output.min_count +
+			inst->buffers.output.extra_count) {
+			inst->buffers.output.actual_count =
+				inst->buffers.output.min_count +
+				inst->buffers.output.extra_count;
+		}
+		inst->buffers.output.size =
+			fmt->fmt.pix_mp.plane_fmt[0].sizeimage;
+		msm_vidc_update_cap_value(inst, PIX_FMTS, colorformat, __func__);
+
+		/* update crop while input port is not streaming */
+		if (!inst->bufq[INPUT_PORT].vb2q->streaming) {
+			inst->crop.top = 0;
+			inst->crop.left = 0;
+			inst->crop.width = f->fmt.pix_mp.width;
+			inst->crop.height = f->fmt.pix_mp.height;
+		}
+		i_vpr_h(inst,
+			"%s: type: OUTPUT, format %s width %d height %d size %u min_count %d extra_count %d\n",
+			__func__, v4l2_pixelfmt_name(inst, fmt->fmt.pix_mp.pixelformat),
+			fmt->fmt.pix_mp.width, fmt->fmt.pix_mp.height,
+			fmt->fmt.pix_mp.plane_fmt[0].sizeimage,
+			inst->buffers.output.min_count,
+			inst->buffers.output.extra_count);
+	} else {
+		i_vpr_e(inst, "%s: invalid type %d\n", __func__, f->type);
+		goto err_invalid_fmt;
+	}
+	memcpy(f, fmt, sizeof(struct v4l2_format));
+
+err_invalid_fmt:
+	return rc;
+}
+
+int msm_vdec_g_fmt(struct msm_vidc_inst *inst, struct v4l2_format *f)
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
+int msm_vdec_s_selection(struct msm_vidc_inst *inst, struct v4l2_selection *s)
+{
+	i_vpr_e(inst, "%s: unsupported\n", __func__);
+	return -EINVAL;
+}
+
+int msm_vdec_g_selection(struct msm_vidc_inst *inst, struct v4l2_selection *s)
+{
+	if (s->type != OUTPUT_MPLANE && s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE) {
+		i_vpr_e(inst, "%s: invalid type %d\n", __func__, s->type);
+		return -EINVAL;
+	}
+
+	switch (s->target) {
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_CROP:
+	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
+	case V4L2_SEL_TGT_COMPOSE_PADDED:
+	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
+	case V4L2_SEL_TGT_COMPOSE:
+		s->r.left = inst->crop.left;
+		s->r.top = inst->crop.top;
+		s->r.width = inst->crop.width;
+		s->r.height = inst->crop.height;
+		break;
+	default:
+		i_vpr_e(inst, "%s: invalid target %d\n",
+			__func__, s->target);
+		return -EINVAL;
+	}
+	i_vpr_h(inst, "%s: target %d, r [%d, %d, %d, %d]\n",
+		__func__, s->target, s->r.top, s->r.left,
+		s->r.width, s->r.height);
+	return 0;
+}
+
+int msm_vdec_subscribe_event(struct msm_vidc_inst *inst,
+			     const struct v4l2_event_subscription *sub)
+{
+	int rc = 0;
+
+	switch (sub->type) {
+	case V4L2_EVENT_EOS:
+		rc = v4l2_event_subscribe(&inst->fh, sub, MAX_EVENTS, NULL);
+		break;
+	case V4L2_EVENT_SOURCE_CHANGE:
+		rc = v4l2_src_change_event_subscribe(&inst->fh, sub);
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
+static int msm_vdec_check_colorformat_supported(struct msm_vidc_inst *inst,
+						enum msm_vidc_colorformat_type colorformat)
+{
+	bool supported = true;
+
+	/* do not reject coloformats before streamon */
+	if (!inst->bufq[INPUT_PORT].vb2q->streaming)
+		return true;
+
+	/*
+	 * bit_depth 8 bit supports 8 bit colorformats only
+	 * bit_depth 10 bit supports 10 bit colorformats only
+	 * interlace supports ubwc colorformats only
+	 */
+	if (inst->capabilities[BIT_DEPTH].value == BIT_DEPTH_8 &&
+	    !is_8bit_colorformat(colorformat))
+		supported = false;
+	if (inst->capabilities[BIT_DEPTH].value == BIT_DEPTH_10 &&
+	    !is_10bit_colorformat(colorformat))
+		supported = false;
+	if (inst->capabilities[CODED_FRAMES].value ==
+	    CODED_FRAMES_INTERLACE &&
+	    !is_ubwc_colorformat(colorformat))
+		supported = false;
+
+	return supported;
+}
+
+int msm_vdec_enum_fmt(struct msm_vidc_inst *inst, struct v4l2_fmtdesc *f)
+{
+	int rc = 0;
+	struct msm_vidc_core *core;
+	u32 array[32] = {0};
+	u32 i = 0;
+
+	if (f->index >= ARRAY_SIZE(array)) {
+		d_vpr_e("%s: invalid params\n", __func__);
+		return -EINVAL;
+	}
+	core = inst->core;
+
+	if (f->type == INPUT_MPLANE) {
+		u32 codecs = core->capabilities[DEC_CODECS].value;
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
+	} else if (f->type == OUTPUT_MPLANE) {
+		u32 formats = inst->capabilities[PIX_FMTS].step_or_mask;
+		u32 idx = 0;
+
+		for (i = 0; i <= 31; i++) {
+			if (formats & BIT(i)) {
+				if (idx >= ARRAY_SIZE(array))
+					break;
+				if (msm_vdec_check_colorformat_supported(inst, formats & BIT(i))) {
+					array[idx] = formats & BIT(i);
+					idx++;
+				}
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
+int msm_vdec_inst_init(struct msm_vidc_inst *inst)
+{
+	int rc = 0;
+	struct msm_vidc_core *core;
+	struct v4l2_format *f;
+	enum msm_vidc_colorformat_type colorformat;
+
+	core = inst->core;
+
+	INIT_DELAYED_WORK(&inst->decode_batch.work, msm_vidc_batch_handler);
+	if (core->capabilities[DECODE_BATCH].value) {
+		inst->decode_batch.enable = true;
+		inst->decode_batch.size = MAX_DEC_BATCH_SIZE;
+	}
+	if (core->capabilities[DCVS].value)
+		inst->power.dcvs_mode = true;
+
+	f = &inst->fmts[INPUT_PORT];
+	f->type = INPUT_MPLANE;
+	f->fmt.pix_mp.width = DEFAULT_WIDTH;
+	f->fmt.pix_mp.height = DEFAULT_HEIGHT;
+	f->fmt.pix_mp.pixelformat = V4L2_PIX_FMT_H264;
+	f->fmt.pix_mp.num_planes = 1;
+	f->fmt.pix_mp.plane_fmt[0].bytesperline = 0;
+	f->fmt.pix_mp.plane_fmt[0].sizeimage =
+		call_session_op(core, buffer_size, inst, MSM_VIDC_BUF_INPUT);
+	f->fmt.pix_mp.field = V4L2_FIELD_NONE;
+	inst->buffers.input.min_count =
+		call_session_op(core, min_count, inst, MSM_VIDC_BUF_INPUT);
+	inst->buffers.input.extra_count =
+		call_session_op(core, extra_count, inst, MSM_VIDC_BUF_INPUT);
+	inst->buffers.input.actual_count =
+			inst->buffers.input.min_count +
+			inst->buffers.input.extra_count;
+	inst->buffers.input.size = f->fmt.pix_mp.plane_fmt[0].sizeimage;
+
+	inst->crop.left = 0;
+	inst->crop.top = 0;
+	inst->crop.width = f->fmt.pix_mp.width;
+	inst->crop.height = f->fmt.pix_mp.height;
+
+	f = &inst->fmts[OUTPUT_PORT];
+	f->type = OUTPUT_MPLANE;
+	f->fmt.pix_mp.pixelformat =
+		v4l2_colorformat_from_driver(inst, MSM_VIDC_FMT_NV12C, __func__);
+	colorformat = v4l2_colorformat_to_driver(inst, f->fmt.pix_mp.pixelformat, __func__);
+	f->fmt.pix_mp.width = video_y_stride_pix(colorformat, DEFAULT_WIDTH);
+	f->fmt.pix_mp.height = video_y_scanlines(colorformat, DEFAULT_HEIGHT);
+	f->fmt.pix_mp.num_planes = 1;
+	f->fmt.pix_mp.plane_fmt[0].bytesperline =
+		video_y_stride_bytes(colorformat, DEFAULT_WIDTH);
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
+	inst->fw_min_count = 0;
+
+	inst->input_dpb_list_enabled = false;
+	inst->output_dpb_list_enabled = false;
+
+	rc = msm_vdec_codec_change(inst, inst->fmts[INPUT_PORT].fmt.pix_mp.pixelformat);
+
+	return rc;
+}
+
+int msm_vdec_inst_deinit(struct msm_vidc_inst *inst)
+{
+	int rc = 0;
+
+	/* cancel pending batch work */
+	cancel_batch_work(inst);
+	rc = msm_vidc_ctrl_handler_deinit(inst);
+
+	return rc;
+}
-- 
2.7.4

