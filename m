Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D1E5766E1F
	for <lists+linux-media@lfdr.de>; Fri, 28 Jul 2023 15:25:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236714AbjG1NZl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jul 2023 09:25:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236713AbjG1NZi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jul 2023 09:25:38 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A43A3ABD;
        Fri, 28 Jul 2023 06:25:32 -0700 (PDT)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36S8v0Qb001161;
        Fri, 28 Jul 2023 13:25:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=RXxSbb1po9KEOK21uuwHvNLiGOLOvf6Gp9gYXfdMDUI=;
 b=DWQQ4ctPVhwgMC/WsdpJcd/Ogyva2q+51uX4gypSro7Q2xNsR3y/s/Nscqi/yVx/Jo4/
 A8M4hCLTRIxSMBHctUUZ8AVk4XJFKaHvLjQDfUYxYjg26ljpC2GAbi/npfqa5mZNq/Lm
 uwLC+kZbRJRl91iV0EumWMOn2O216d4JO5silPiwro/p6E6Q5CUYsEpgCVx++G5aSUW+
 RrmCRfa/EHYHUOT6WemqgTJsQImqPENTBzr1hAwHCSFC08KznPfuZ12RWaNUUuoOBegY
 5M7atfZ7iVsZukEcveH/9/g27F5M0tQN36VwDJeW4SiE5TVJtDLVjMAjeq/mxnCeVlpQ rA== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s3n2kbcmv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 28 Jul 2023 13:25:26 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
        by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36SDPPsO025554
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 28 Jul 2023 13:25:25 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Fri, 28 Jul 2023 06:25:21 -0700
From:   Vikash Garodia <quic_vgarodia@quicinc.com>
To:     <stanimir.k.varbanov@gmail.com>, <agross@kernel.org>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <mchehab@kernel.org>, <hans.verkuil@cisco.com>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
CC:     <quic_dikshita@quicinc.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>
Subject: [PATCH 04/33] iris: add vidc wrapper file
Date:   Fri, 28 Jul 2023 18:53:15 +0530
Message-ID: <1690550624-14642-5-git-send-email-quic_vgarodia@quicinc.com>
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
X-Proofpoint-GUID: _A8VWtD7wEHHQjf1GDneDiOPEiBpGKvo
X-Proofpoint-ORIG-GUID: _A8VWtD7wEHHQjf1GDneDiOPEiBpGKvo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 impostorscore=0 mlxscore=0 suspectscore=0
 spamscore=0 clxscore=1015 bulkscore=0 mlxlogscore=999 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307280123
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dikshita Agarwal <quic_dikshita@quicinc.com>

This implements vidc wrapper functions for all v4l2 IOCTLs.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
 .../media/platform/qcom/iris/vidc/inc/msm_vidc.h   |  60 ++
 .../media/platform/qcom/iris/vidc/src/msm_vidc.c   | 841 +++++++++++++++++++++
 2 files changed, 901 insertions(+)
 create mode 100644 drivers/media/platform/qcom/iris/vidc/inc/msm_vidc.h
 create mode 100644 drivers/media/platform/qcom/iris/vidc/src/msm_vidc.c

diff --git a/drivers/media/platform/qcom/iris/vidc/inc/msm_vidc.h b/drivers/media/platform/qcom/iris/vidc/inc/msm_vidc.h
new file mode 100644
index 0000000..6cd5fad
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/vidc/inc/msm_vidc.h
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _MSM_VIDC_H_
+#define _MSM_VIDC_H_
+
+#include <linux/videodev2.h>
+#include <media/media-device.h>
+
+struct msm_vidc_core;
+struct msm_vidc_inst;
+
+union msm_v4l2_cmd {
+	struct v4l2_decoder_cmd dec;
+	struct v4l2_encoder_cmd enc;
+};
+
+void *msm_vidc_open(struct msm_vidc_core *core, u32 session_type);
+int msm_vidc_close(struct msm_vidc_inst *inst);
+int msm_vidc_querycap(struct msm_vidc_inst *inst, struct v4l2_capability *cap);
+int msm_vidc_enum_fmt(struct msm_vidc_inst *inst, struct v4l2_fmtdesc *f);
+int msm_vidc_try_fmt(struct msm_vidc_inst *inst, struct v4l2_format *f);
+int msm_vidc_s_fmt(struct msm_vidc_inst *inst, struct v4l2_format *f);
+int msm_vidc_g_fmt(struct msm_vidc_inst *inst, struct v4l2_format *f);
+int msm_vidc_s_selection(struct msm_vidc_inst *inst, struct v4l2_selection *s);
+int msm_vidc_g_selection(struct msm_vidc_inst *inst, struct v4l2_selection *s);
+int msm_vidc_s_param(struct msm_vidc_inst *inst, struct v4l2_streamparm *sp);
+int msm_vidc_g_param(struct msm_vidc_inst *inst, struct v4l2_streamparm *sp);
+int msm_vidc_reqbufs(struct msm_vidc_inst *inst, struct v4l2_requestbuffers *b);
+int msm_vidc_querybuf(struct msm_vidc_inst *inst, struct v4l2_buffer *b);
+int msm_vidc_create_bufs(struct msm_vidc_inst *inst, struct v4l2_create_buffers *b);
+int msm_vidc_prepare_buf(struct msm_vidc_inst *inst, struct media_device *mdev,
+			 struct v4l2_buffer *b);
+int msm_vidc_release_buffer(struct msm_vidc_inst *inst, int buffer_type,
+			    unsigned int buffer_index);
+int msm_vidc_qbuf(struct msm_vidc_inst *inst, struct media_device *mdev,
+		  struct v4l2_buffer *b);
+int msm_vidc_dqbuf(struct msm_vidc_inst *inste, struct v4l2_buffer *b);
+int msm_vidc_streamon(struct msm_vidc_inst *inst, enum v4l2_buf_type i);
+int msm_vidc_query_ctrl(struct msm_vidc_inst *inst, struct v4l2_queryctrl *ctrl);
+int msm_vidc_query_menu(struct msm_vidc_inst *inst, struct v4l2_querymenu *qmenu);
+int msm_vidc_streamoff(struct msm_vidc_inst *inst, enum v4l2_buf_type i);
+int msm_vidc_try_cmd(struct msm_vidc_inst *inst, union msm_v4l2_cmd *cmd);
+int msm_vidc_start_cmd(struct msm_vidc_inst *inst);
+int msm_vidc_stop_cmd(struct msm_vidc_inst *inst);
+int msm_vidc_poll(struct msm_vidc_inst *inst, struct file *filp,
+		  struct poll_table_struct *pt);
+int msm_vidc_subscribe_event(struct msm_vidc_inst *inst,
+			     const struct v4l2_event_subscription *sub);
+int msm_vidc_unsubscribe_event(struct msm_vidc_inst *inst,
+			       const struct v4l2_event_subscription *sub);
+int msm_vidc_dqevent(struct msm_vidc_inst *inst, struct v4l2_event *event);
+int msm_vidc_g_crop(struct msm_vidc_inst *inst, struct v4l2_crop *a);
+int msm_vidc_enum_framesizes(struct msm_vidc_inst *inst, struct v4l2_frmsizeenum *fsize);
+int msm_vidc_enum_frameintervals(struct msm_vidc_inst *inst, struct v4l2_frmivalenum *fival);
+
+#endif
diff --git a/drivers/media/platform/qcom/iris/vidc/src/msm_vidc.c b/drivers/media/platform/qcom/iris/vidc/src/msm_vidc.c
new file mode 100644
index 0000000..c9848c7
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/vidc/src/msm_vidc.c
@@ -0,0 +1,841 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/hash.h>
+#include <linux/types.h>
+
+#include "msm_vdec.h"
+#include "msm_venc.h"
+#include "msm_vidc.h"
+#include "msm_vidc_control.h"
+#include "msm_vidc_core.h"
+#include "msm_vidc_debug.h"
+#include "msm_vidc_driver.h"
+#include "msm_vidc_inst.h"
+#include "msm_vidc_internal.h"
+#include "msm_vidc_memory.h"
+#include "msm_vidc_power.h"
+#include "msm_vidc_v4l2.h"
+#include "msm_vidc_vb2.h"
+#include "venus_hfi_response.h"
+
+#define MSM_VIDC_DRV_NAME "msm_vidc_driver"
+#define MSM_VIDC_BUS_NAME "platform:msm_vidc_bus"
+
+static inline bool valid_v4l2_buffer(struct v4l2_buffer *b,
+				     struct msm_vidc_inst *inst)
+{
+	if (b->type == INPUT_MPLANE || b->type == OUTPUT_MPLANE)
+		return b->length > 0;
+
+	return false;
+}
+
+static int get_poll_flags(struct msm_vidc_inst *inst, u32 port)
+{
+	int poll = 0;
+	struct vb2_queue *q = NULL;
+	struct vb2_buffer *vb = NULL;
+	unsigned long flags = 0;
+
+	if (port >= MAX_PORT) {
+		d_vpr_e("%s: invalid params, inst %pK, port %d\n",
+			__func__, inst, port);
+		return poll;
+	}
+	q = inst->bufq[port].vb2q;
+
+	spin_lock_irqsave(&q->done_lock, flags);
+	if (!list_empty(&q->done_list))
+		vb = list_first_entry(&q->done_list, struct vb2_buffer,
+				      done_entry);
+	if (vb && (vb->state == VB2_BUF_STATE_DONE ||
+		   vb->state == VB2_BUF_STATE_ERROR)) {
+		if (port == OUTPUT_PORT)
+			poll |= POLLIN | POLLRDNORM;
+		else if (port == INPUT_PORT)
+			poll |= POLLOUT | POLLWRNORM;
+	}
+	spin_unlock_irqrestore(&q->done_lock, flags);
+
+	return poll;
+}
+
+int msm_vidc_poll(struct msm_vidc_inst *inst, struct file *filp,
+		  struct poll_table_struct *wait)
+{
+	int poll = 0;
+
+	poll_wait(filp, &inst->fh.wait, wait);
+	poll_wait(filp, &inst->bufq[INPUT_PORT].vb2q->done_wq, wait);
+	poll_wait(filp, &inst->bufq[OUTPUT_PORT].vb2q->done_wq, wait);
+
+	if (v4l2_event_pending(&inst->fh))
+		poll |= POLLPRI;
+
+	poll |= get_poll_flags(inst, INPUT_PORT);
+	poll |= get_poll_flags(inst, OUTPUT_PORT);
+
+	return poll;
+}
+
+int msm_vidc_querycap(struct msm_vidc_inst *inst, struct v4l2_capability *cap)
+{
+	strscpy(cap->driver, MSM_VIDC_DRV_NAME, sizeof(cap->driver));
+	strscpy(cap->bus_info, MSM_VIDC_BUS_NAME, sizeof(cap->bus_info));
+
+	memset(cap->reserved, 0, sizeof(cap->reserved));
+
+	if (is_decode_session(inst))
+		strscpy(cap->card, "msm_vidc_decoder", sizeof(cap->card));
+	else if (is_encode_session(inst))
+		strscpy(cap->card, "msm_vidc_encoder", sizeof(cap->card));
+	else
+		return -EINVAL;
+
+	return 0;
+}
+
+int msm_vidc_enum_fmt(struct msm_vidc_inst *inst, struct v4l2_fmtdesc *f)
+{
+	if (is_decode_session(inst))
+		return msm_vdec_enum_fmt(inst, f);
+	if (is_encode_session(inst))
+		return msm_venc_enum_fmt(inst, f);
+
+	return -EINVAL;
+}
+
+int msm_vidc_query_ctrl(struct msm_vidc_inst *inst, struct v4l2_queryctrl *q_ctrl)
+{
+	int rc = 0;
+	struct v4l2_ctrl *ctrl;
+
+	ctrl = v4l2_ctrl_find(&inst->ctrl_handler, q_ctrl->id);
+	if (!ctrl) {
+		i_vpr_e(inst, "%s: get_ctrl failed for id %d\n",
+			__func__, q_ctrl->id);
+		return -EINVAL;
+	}
+	q_ctrl->minimum = ctrl->minimum;
+	q_ctrl->maximum = ctrl->maximum;
+	q_ctrl->default_value = ctrl->default_value;
+	q_ctrl->flags = 0;
+	q_ctrl->step = ctrl->step;
+	i_vpr_h(inst,
+		"query ctrl: %s: min %d, max %d, default %d step %d flags %#x\n",
+		ctrl->name, q_ctrl->minimum, q_ctrl->maximum,
+		q_ctrl->default_value, q_ctrl->step, q_ctrl->flags);
+	return rc;
+}
+
+int msm_vidc_query_menu(struct msm_vidc_inst *inst, struct v4l2_querymenu *qmenu)
+{
+	int rc = 0;
+	struct v4l2_ctrl *ctrl;
+
+	ctrl = v4l2_ctrl_find(&inst->ctrl_handler, qmenu->id);
+	if (!ctrl) {
+		i_vpr_e(inst, "%s: get_ctrl failed for id %d\n",
+			__func__, qmenu->id);
+		return -EINVAL;
+	}
+	if (ctrl->type != V4L2_CTRL_TYPE_MENU) {
+		i_vpr_e(inst, "%s: ctrl: %s: type (%d) is not MENU type\n",
+			__func__, ctrl->name, ctrl->type);
+		return -EINVAL;
+	}
+	if (qmenu->index < ctrl->minimum || qmenu->index > ctrl->maximum)
+		return -EINVAL;
+
+	if (ctrl->menu_skip_mask & (1 << qmenu->index))
+		rc = -EINVAL;
+
+	i_vpr_h(inst,
+		"%s: ctrl: %s: min %lld, max %lld, menu_skip_mask %lld, qmenu: id %u, index %d, %s\n",
+		__func__, ctrl->name, ctrl->minimum, ctrl->maximum,
+		ctrl->menu_skip_mask, qmenu->id, qmenu->index,
+		rc ? "not supported" : "supported");
+	return rc;
+}
+
+int msm_vidc_try_fmt(struct msm_vidc_inst *inst, struct v4l2_format *f)
+{
+	int rc = 0;
+
+	if (is_decode_session(inst))
+		rc = msm_vdec_try_fmt(inst, f);
+	if (is_encode_session(inst))
+		rc = msm_venc_try_fmt(inst, f);
+
+	if (rc)
+		i_vpr_e(inst, "%s: try_fmt(%d) failed %d\n",
+			__func__, f->type, rc);
+	return rc;
+}
+
+int msm_vidc_s_fmt(struct msm_vidc_inst *inst, struct v4l2_format *f)
+{
+	int rc = 0;
+
+	if (is_decode_session(inst))
+		rc = msm_vdec_s_fmt(inst, f);
+	if (is_encode_session(inst))
+		rc = msm_venc_s_fmt(inst, f);
+
+	if (rc)
+		i_vpr_e(inst, "%s: s_fmt(%d) failed %d\n",
+			__func__, f->type, rc);
+	return rc;
+}
+
+int msm_vidc_g_fmt(struct msm_vidc_inst *inst, struct v4l2_format *f)
+{
+	int rc = 0;
+
+	if (is_decode_session(inst))
+		rc = msm_vdec_g_fmt(inst, f);
+	if (is_encode_session(inst))
+		rc = msm_venc_g_fmt(inst, f);
+	if (rc)
+		return rc;
+
+	i_vpr_h(inst, "%s: type %s format %s width %d height %d size %d\n",
+		__func__, v4l2_type_name(f->type),
+		v4l2_pixelfmt_name(inst, f->fmt.pix_mp.pixelformat),
+		f->fmt.pix_mp.width, f->fmt.pix_mp.height,
+		f->fmt.pix_mp.plane_fmt[0].sizeimage);
+
+	return 0;
+}
+
+int msm_vidc_s_selection(struct msm_vidc_inst *inst, struct v4l2_selection *s)
+{
+	int rc = 0;
+
+	if (is_decode_session(inst))
+		rc = msm_vdec_s_selection(inst, s);
+	if (is_encode_session(inst))
+		rc = msm_venc_s_selection(inst, s);
+
+	return rc;
+}
+
+int msm_vidc_g_selection(struct msm_vidc_inst *inst, struct v4l2_selection *s)
+{
+	int rc = 0;
+
+	if (is_decode_session(inst))
+		rc = msm_vdec_g_selection(inst, s);
+	if (is_encode_session(inst))
+		rc = msm_venc_g_selection(inst, s);
+
+	return rc;
+}
+
+int msm_vidc_s_param(struct msm_vidc_inst *inst, struct v4l2_streamparm *param)
+{
+	int rc = 0;
+
+	if (param->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
+	    param->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+		return -EINVAL;
+
+	if (is_encode_session(inst)) {
+		rc = msm_venc_s_param(inst, param);
+	} else {
+		i_vpr_e(inst, "%s: invalid domain %#x\n",
+			__func__, inst->domain);
+		return -EINVAL;
+	}
+
+	return rc;
+}
+
+int msm_vidc_g_param(struct msm_vidc_inst *inst, struct v4l2_streamparm *param)
+{
+	int rc = 0;
+
+	if (param->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
+	    param->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+		return -EINVAL;
+
+	if (is_encode_session(inst)) {
+		rc = msm_venc_g_param(inst, param);
+	} else {
+		i_vpr_e(inst, "%s: invalid domain %#x\n",
+			__func__, inst->domain);
+		return -EINVAL;
+	}
+
+	return rc;
+}
+
+int msm_vidc_reqbufs(struct msm_vidc_inst *inst, struct v4l2_requestbuffers *b)
+{
+	int rc = 0;
+	int port;
+
+	port = v4l2_type_to_driver_port(inst, b->type, __func__);
+	if (port < 0) {
+		rc = -EINVAL;
+		goto exit;
+	}
+
+	rc = vb2_reqbufs(inst->bufq[port].vb2q, b);
+	if (rc) {
+		i_vpr_e(inst, "%s: vb2_reqbufs(%d) failed, %d\n",
+			__func__, b->type, rc);
+		goto exit;
+	}
+
+exit:
+	return rc;
+}
+
+int msm_vidc_querybuf(struct msm_vidc_inst *inst, struct v4l2_buffer *b)
+{
+	int rc = 0;
+	int port;
+
+	port = v4l2_type_to_driver_port(inst, b->type, __func__);
+	if (port < 0) {
+		rc = -EINVAL;
+		goto exit;
+	}
+
+	rc = vb2_querybuf(inst->bufq[port].vb2q, b);
+	if (rc) {
+		i_vpr_e(inst, "%s: vb2_querybuf(%d) failed, %d\n",
+			__func__, b->type, rc);
+		goto exit;
+	}
+
+exit:
+	return rc;
+}
+
+int msm_vidc_create_bufs(struct msm_vidc_inst *inst, struct v4l2_create_buffers *b)
+{
+	int rc = 0;
+	int port;
+	struct v4l2_format *f;
+
+	f = &b->format;
+	port = v4l2_type_to_driver_port(inst, f->type, __func__);
+	if (port < 0) {
+		rc = -EINVAL;
+		goto exit;
+	}
+
+	rc = vb2_create_bufs(inst->bufq[port].vb2q, b);
+	if (rc) {
+		i_vpr_e(inst, "%s: vb2_create_bufs(%d) failed, %d\n",
+			__func__, f->type, rc);
+		goto exit;
+	}
+
+exit:
+	return rc;
+}
+
+int msm_vidc_prepare_buf(struct msm_vidc_inst *inst, struct media_device *mdev,
+			 struct v4l2_buffer *b)
+{
+	int rc = 0;
+	struct vb2_queue *q;
+
+	if (!valid_v4l2_buffer(b, inst)) {
+		d_vpr_e("%s: invalid params %pK %pK\n", __func__, inst, b);
+		return -EINVAL;
+	}
+
+	q = msm_vidc_get_vb2q(inst, b->type, __func__);
+	if (!q) {
+		rc = -EINVAL;
+		goto exit;
+	}
+
+	rc = vb2_prepare_buf(q, mdev, b);
+	if (rc) {
+		i_vpr_e(inst, "%s: failed with %d\n", __func__, rc);
+		goto exit;
+	}
+
+exit:
+	return rc;
+}
+
+int msm_vidc_qbuf(struct msm_vidc_inst *inst, struct media_device *mdev,
+		  struct v4l2_buffer *b)
+{
+	int rc = 0;
+	struct vb2_queue *q;
+
+	if (!valid_v4l2_buffer(b, inst)) {
+		d_vpr_e("%s: invalid params %pK %pK\n", __func__, inst, b);
+		return -EINVAL;
+	}
+
+	q = msm_vidc_get_vb2q(inst, b->type, __func__);
+	if (!q) {
+		rc = -EINVAL;
+		goto exit;
+	}
+
+	rc = vb2_qbuf(q, mdev, b);
+	if (rc)
+		i_vpr_e(inst, "%s: failed with %d\n", __func__, rc);
+
+exit:
+	return rc;
+}
+
+int msm_vidc_dqbuf(struct msm_vidc_inst *inst, struct v4l2_buffer *b)
+{
+	int rc = 0;
+	struct vb2_queue *q;
+
+	if (!valid_v4l2_buffer(b, inst)) {
+		d_vpr_e("%s: invalid params %pK %pK\n", __func__, inst, b);
+		return -EINVAL;
+	}
+
+	q = msm_vidc_get_vb2q(inst, b->type, __func__);
+	if (!q) {
+		rc = -EINVAL;
+		goto exit;
+	}
+
+	rc = vb2_dqbuf(q, b, true);
+	if (rc == -EAGAIN) {
+		goto exit;
+	} else if (rc) {
+		i_vpr_l(inst, "%s: failed with %d\n", __func__, rc);
+		goto exit;
+	}
+
+exit:
+	return rc;
+}
+
+int msm_vidc_streamon(struct msm_vidc_inst *inst, enum v4l2_buf_type type)
+{
+	int rc = 0;
+	int port;
+
+	port = v4l2_type_to_driver_port(inst, type, __func__);
+	if (port < 0) {
+		rc = -EINVAL;
+		goto exit;
+	}
+
+	rc = vb2_streamon(inst->bufq[port].vb2q, type);
+	if (rc) {
+		i_vpr_e(inst, "%s: vb2_streamon(%d) failed, %d\n",
+			__func__, type, rc);
+		goto exit;
+	}
+
+exit:
+	return rc;
+}
+EXPORT_SYMBOL(msm_vidc_streamon);
+
+int msm_vidc_streamoff(struct msm_vidc_inst *inst, enum v4l2_buf_type type)
+{
+	int rc = 0;
+	int port;
+
+	port = v4l2_type_to_driver_port(inst, type, __func__);
+	if (port < 0) {
+		rc = -EINVAL;
+		goto exit;
+	}
+
+	rc = vb2_streamoff(inst->bufq[port].vb2q, type);
+	if (rc) {
+		i_vpr_e(inst, "%s: vb2_streamoff(%d) failed, %d\n",
+			__func__, type, rc);
+		goto exit;
+	}
+
+exit:
+	return rc;
+}
+
+int msm_vidc_try_cmd(struct msm_vidc_inst *inst, union msm_v4l2_cmd *cmd)
+{
+	int rc = 0;
+	struct v4l2_decoder_cmd *dec = NULL;
+	struct v4l2_encoder_cmd *enc = NULL;
+
+	if (is_decode_session(inst)) {
+		dec = (struct v4l2_decoder_cmd *)cmd;
+		i_vpr_h(inst, "%s: cmd %d\n", __func__, dec->cmd);
+		if (dec->cmd != V4L2_DEC_CMD_STOP && dec->cmd != V4L2_DEC_CMD_START)
+			return -EINVAL;
+		dec->flags = 0;
+		if (dec->cmd == V4L2_DEC_CMD_STOP) {
+			dec->stop.pts = 0;
+		} else if (dec->cmd == V4L2_DEC_CMD_START) {
+			dec->start.speed = 0;
+			dec->start.format = V4L2_DEC_START_FMT_NONE;
+		}
+	} else if (is_encode_session(inst)) {
+		enc = (struct v4l2_encoder_cmd *)cmd;
+		i_vpr_h(inst, "%s: cmd %d\n", __func__, enc->cmd);
+		if (enc->cmd != V4L2_ENC_CMD_STOP && enc->cmd != V4L2_ENC_CMD_START)
+			return -EINVAL;
+		enc->flags = 0;
+	}
+
+	return rc;
+}
+
+int msm_vidc_start_cmd(struct msm_vidc_inst *inst)
+{
+	int rc = 0;
+
+	if (!is_decode_session(inst) && !is_encode_session(inst)) {
+		i_vpr_e(inst, "%s: invalid session %d\n", __func__, inst->domain);
+		return -EINVAL;
+	}
+
+	if (is_decode_session(inst)) {
+		rc = msm_vdec_start_cmd(inst);
+		if (rc)
+			return rc;
+	} else if (is_encode_session(inst)) {
+		rc = msm_venc_start_cmd(inst);
+		if (rc)
+			return rc;
+	}
+
+	return rc;
+}
+
+int msm_vidc_stop_cmd(struct msm_vidc_inst *inst)
+{
+	int rc = 0;
+
+	if (!is_decode_session(inst) && !is_encode_session(inst)) {
+		i_vpr_e(inst, "%s: invalid session %d\n", __func__, inst->domain);
+		return -EINVAL;
+	}
+
+	if (is_decode_session(inst)) {
+		rc = msm_vdec_stop_cmd(inst);
+		if (rc)
+			return rc;
+	} else if (is_encode_session(inst)) {
+		rc = msm_venc_stop_cmd(inst);
+		if (rc)
+			return rc;
+	}
+
+	return rc;
+}
+
+int msm_vidc_enum_framesizes(struct msm_vidc_inst *inst, struct v4l2_frmsizeenum *fsize)
+{
+	enum msm_vidc_colorformat_type colorfmt;
+	enum msm_vidc_codec_type codec;
+
+	/* only index 0 allowed as per v4l2 spec */
+	if (fsize->index)
+		return -EINVAL;
+
+	/* validate pixel format */
+	codec = v4l2_codec_to_driver(inst, fsize->pixel_format, __func__);
+	if (!codec) {
+		colorfmt = v4l2_colorformat_to_driver(inst, fsize->pixel_format,
+						      __func__);
+		if (colorfmt == MSM_VIDC_FMT_NONE) {
+			i_vpr_e(inst, "%s: unsupported pix fmt %#x\n",
+				__func__, fsize->pixel_format);
+			return -EINVAL;
+		}
+	}
+
+	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
+	fsize->stepwise.min_width = inst->capabilities[FRAME_WIDTH].min;
+	fsize->stepwise.max_width = inst->capabilities[FRAME_WIDTH].max;
+	fsize->stepwise.step_width =
+		inst->capabilities[FRAME_WIDTH].step_or_mask;
+	fsize->stepwise.min_height = inst->capabilities[FRAME_HEIGHT].min;
+	fsize->stepwise.max_height = inst->capabilities[FRAME_HEIGHT].max;
+	fsize->stepwise.step_height =
+		inst->capabilities[FRAME_HEIGHT].step_or_mask;
+
+	return 0;
+}
+
+int msm_vidc_enum_frameintervals(struct msm_vidc_inst *inst, struct v4l2_frmivalenum *fival)
+{
+	struct msm_vidc_core *core;
+	enum msm_vidc_colorformat_type colorfmt;
+	u32 fps, mbpf;
+
+	if (is_decode_session(inst)) {
+		i_vpr_e(inst, "%s: not supported by decoder\n", __func__);
+		return -ENOTTY;
+	}
+
+	core = inst->core;
+
+	/* only index 0 allowed as per v4l2 spec */
+	if (fival->index)
+		return -EINVAL;
+
+	/* validate pixel format */
+	colorfmt = v4l2_colorformat_to_driver(inst, fival->pixel_format, __func__);
+	if (colorfmt == MSM_VIDC_FMT_NONE) {
+		i_vpr_e(inst, "%s: unsupported pix fmt %#x\n",
+			__func__, fival->pixel_format);
+		return -EINVAL;
+	}
+
+	/* validate resolution */
+	if (fival->width > inst->capabilities[FRAME_WIDTH].max ||
+	    fival->width < inst->capabilities[FRAME_WIDTH].min ||
+	    fival->height > inst->capabilities[FRAME_HEIGHT].max ||
+	    fival->height < inst->capabilities[FRAME_HEIGHT].min) {
+		i_vpr_e(inst, "%s: unsupported resolution %u x %u\n", __func__,
+			fival->width, fival->height);
+		return -EINVAL;
+	}
+
+	/* calculate max supported fps for a given resolution */
+	mbpf = NUM_MBS_PER_FRAME(fival->height, fival->width);
+	fps = core->capabilities[MAX_MBPS].value / mbpf;
+
+	fival->type = V4L2_FRMIVAL_TYPE_STEPWISE;
+	fival->stepwise.min.numerator = 1;
+	fival->stepwise.min.denominator =
+			min_t(u32, fps, inst->capabilities[FRAME_RATE].max);
+	fival->stepwise.max.numerator = 1;
+	fival->stepwise.max.denominator = 1;
+	fival->stepwise.step.numerator = 1;
+	fival->stepwise.step.denominator = inst->capabilities[FRAME_RATE].max;
+
+	return 0;
+}
+
+int msm_vidc_subscribe_event(struct msm_vidc_inst *inst,
+			     const struct v4l2_event_subscription *sub)
+{
+	int rc = 0;
+
+	i_vpr_h(inst, "%s: type %d id %d\n", __func__, sub->type, sub->id);
+
+	if (is_decode_session(inst))
+		rc = msm_vdec_subscribe_event(inst, sub);
+	if (is_encode_session(inst))
+		rc = msm_venc_subscribe_event(inst, sub);
+
+	return rc;
+}
+
+int msm_vidc_unsubscribe_event(struct msm_vidc_inst *inst,
+			       const struct v4l2_event_subscription *sub)
+{
+	int rc = 0;
+
+	i_vpr_h(inst, "%s: type %d id %d\n", __func__, sub->type, sub->id);
+	rc = v4l2_event_unsubscribe(&inst->fh, sub);
+	if (rc)
+		i_vpr_e(inst, "%s: failed, type %d id %d\n",
+			__func__, sub->type, sub->id);
+	return rc;
+}
+
+int msm_vidc_dqevent(struct msm_vidc_inst *inst, struct v4l2_event *event)
+{
+	int rc = 0;
+
+	rc = v4l2_event_dequeue(&inst->fh, event, false);
+	if (rc)
+		i_vpr_e(inst, "%s: fialed\n", __func__);
+	return rc;
+}
+
+void *msm_vidc_open(struct msm_vidc_core *core, u32 session_type)
+{
+	int rc = 0;
+	struct msm_vidc_inst *inst = NULL;
+	int i = 0;
+
+	d_vpr_h("%s: %s\n", __func__, video_banner);
+
+	if (session_type != MSM_VIDC_DECODER &&
+	    session_type != MSM_VIDC_ENCODER) {
+		d_vpr_e("%s: invalid session_type %d\n",
+			__func__, session_type);
+		return NULL;
+	}
+
+	rc = msm_vidc_core_init(core);
+	if (rc)
+		return NULL;
+
+	rc = msm_vidc_core_init_wait(core);
+	if (rc)
+		return NULL;
+
+	inst = vzalloc(sizeof(*inst));
+	if (!inst) {
+		d_vpr_e("%s: allocation failed\n", __func__);
+		return NULL;
+	}
+
+	inst->core = core;
+	inst->domain = session_type;
+	inst->session_id = hash32_ptr(inst);
+	msm_vidc_update_state(inst, MSM_VIDC_OPEN, __func__);
+	inst->sub_state = MSM_VIDC_SUB_STATE_NONE;
+	strscpy(inst->sub_state_name, "SUB_STATE_NONE", sizeof(inst->sub_state_name));
+	inst->active = true;
+	inst->ipsc_properties_set = false;
+	inst->opsc_properties_set = false;
+	inst->caps_list_prepared = false;
+	inst->has_bframe = false;
+	inst->iframe = false;
+	inst->initial_time_us = ktime_get_ns() / 1000;
+	kref_init(&inst->kref);
+	mutex_init(&inst->lock);
+	mutex_init(&inst->ctx_q_lock);
+	mutex_init(&inst->client_lock);
+	msm_vidc_update_debug_str(inst);
+	i_vpr_h(inst, "Opening video instance: %d\n", session_type);
+
+	rc = msm_vidc_add_session(inst);
+	if (rc) {
+		i_vpr_e(inst, "%s: failed to add session\n", __func__);
+		goto fail_add_session;
+	}
+
+	rc = msm_vidc_pools_init(inst);
+	if (rc) {
+		i_vpr_e(inst, "%s: failed to init pool buffers\n", __func__);
+		goto fail_pools_init;
+	}
+	INIT_LIST_HEAD(&inst->caps_list);
+	INIT_LIST_HEAD(&inst->timestamps.list);
+	INIT_LIST_HEAD(&inst->buffers.input.list);
+	INIT_LIST_HEAD(&inst->buffers.output.list);
+	INIT_LIST_HEAD(&inst->buffers.read_only.list);
+	INIT_LIST_HEAD(&inst->buffers.bin.list);
+	INIT_LIST_HEAD(&inst->buffers.arp.list);
+	INIT_LIST_HEAD(&inst->buffers.comv.list);
+	INIT_LIST_HEAD(&inst->buffers.non_comv.list);
+	INIT_LIST_HEAD(&inst->buffers.line.list);
+	INIT_LIST_HEAD(&inst->buffers.dpb.list);
+	INIT_LIST_HEAD(&inst->buffers.persist.list);
+	INIT_LIST_HEAD(&inst->buffers.vpss.list);
+	INIT_LIST_HEAD(&inst->mem_info.bin.list);
+	INIT_LIST_HEAD(&inst->mem_info.arp.list);
+	INIT_LIST_HEAD(&inst->mem_info.comv.list);
+	INIT_LIST_HEAD(&inst->mem_info.non_comv.list);
+	INIT_LIST_HEAD(&inst->mem_info.line.list);
+	INIT_LIST_HEAD(&inst->mem_info.dpb.list);
+	INIT_LIST_HEAD(&inst->mem_info.persist.list);
+	INIT_LIST_HEAD(&inst->mem_info.vpss.list);
+	INIT_LIST_HEAD(&inst->children_list);
+	INIT_LIST_HEAD(&inst->firmware_list);
+	INIT_LIST_HEAD(&inst->enc_input_crs);
+	INIT_LIST_HEAD(&inst->dmabuf_tracker);
+	INIT_LIST_HEAD(&inst->input_timer_list);
+	INIT_LIST_HEAD(&inst->buffer_stats_list);
+	for (i = 0; i < MAX_SIGNAL; i++)
+		init_completion(&inst->completions[i]);
+
+	inst->workq = create_singlethread_workqueue("workq");
+	if (!inst->workq) {
+		i_vpr_e(inst, "%s: create workq failed\n", __func__);
+		goto fail_create_workq;
+	}
+
+	INIT_DELAYED_WORK(&inst->stats_work, msm_vidc_stats_handler);
+
+	rc = msm_vidc_v4l2_fh_init(inst);
+	if (rc)
+		goto fail_eventq_init;
+
+	rc = msm_vidc_vb2_queue_init(inst);
+	if (rc)
+		goto fail_vb2q_init;
+
+	if (is_decode_session(inst))
+		rc = msm_vdec_inst_init(inst);
+	else if (is_encode_session(inst))
+		rc = msm_venc_inst_init(inst);
+	if (rc)
+		goto fail_inst_init;
+
+	msm_vidc_scale_power(inst, true);
+
+	rc = msm_vidc_session_open(inst);
+	if (rc) {
+		msm_vidc_core_deinit(core, true);
+		goto fail_session_open;
+	}
+
+	inst->debugfs_root =
+		msm_vidc_debugfs_init_inst(inst, core->debugfs_root);
+	if (!inst->debugfs_root)
+		i_vpr_h(inst, "%s: debugfs not available\n", __func__);
+
+	return inst;
+
+fail_session_open:
+	if (is_decode_session(inst))
+		msm_vdec_inst_deinit(inst);
+	else if (is_encode_session(inst))
+		msm_venc_inst_deinit(inst);
+fail_inst_init:
+	msm_vidc_vb2_queue_deinit(inst);
+fail_vb2q_init:
+	msm_vidc_v4l2_fh_deinit(inst);
+fail_eventq_init:
+	destroy_workqueue(inst->workq);
+fail_create_workq:
+	msm_vidc_pools_deinit(inst);
+fail_pools_init:
+	msm_vidc_remove_session(inst);
+	msm_vidc_remove_dangling_session(inst);
+fail_add_session:
+	mutex_destroy(&inst->client_lock);
+	mutex_destroy(&inst->ctx_q_lock);
+	mutex_destroy(&inst->lock);
+	vfree(inst);
+	return NULL;
+}
+
+int msm_vidc_close(struct msm_vidc_inst *inst)
+{
+	struct msm_vidc_core *core;
+
+	core = inst->core;
+
+	client_lock(inst, __func__);
+	inst_lock(inst, __func__);
+	/* print final stats */
+	msm_vidc_print_stats(inst);
+	/* print internal buffer memory usage stats */
+	msm_vidc_print_memory_stats(inst);
+	msm_vidc_session_close(inst);
+	msm_vidc_change_state(inst, MSM_VIDC_CLOSE, __func__);
+	inst->sub_state = MSM_VIDC_SUB_STATE_NONE;
+	strscpy(inst->sub_state_name, "SUB_STATE_NONE", sizeof(inst->sub_state_name));
+	inst_unlock(inst, __func__);
+	client_unlock(inst, __func__);
+	cancel_stats_work_sync(inst);
+	put_inst(inst);
+	msm_vidc_schedule_core_deinit(core);
+
+	return 0;
+}
-- 
2.7.4

