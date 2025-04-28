Return-Path: <linux-media+bounces-31155-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24155A9EC9C
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 11:38:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7263E162EF9
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 09:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56F55267F4D;
	Mon, 28 Apr 2025 09:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="U19MraLt"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DB2267B96;
	Mon, 28 Apr 2025 09:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745832591; cv=none; b=UfPribGyd6+xFOxR19LdRxejwWlvFb+fM2DjHEoIX2gUXRBURbG5+DHP1o56OT186QsQ4gNyal9NKt9T7bIsAx1n7q7CPuw3GkDhKI57R5bLsEcyTa/JL/zdegEFnoZp/pChcGORGIHTlsQ4y8l4leBuhboTDEJ5sRJPjEo7q98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745832591; c=relaxed/simple;
	bh=MFve5uCBWtR3E0MisONahdQgLtvf1sT7jRjDYhCoAug=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ccoN7FzPgTHXWhw1NresubsRaxIzYZ+kM526a+IY8mHVQex1IxCptNagTLXbKVGItbvEOId+Rb/n3cSQfQWtYp7AmEaZY4EFlIkYxCTuoqXGJiCremBPL1KDmf0KrX/lmv01tiOcM6kDciHpJ7EIX52KcQbAhVpgbx8nAwHSxKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=U19MraLt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S8lmsi023726;
	Mon, 28 Apr 2025 09:29:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M9oCwbuBrgk3zAcNjOtRlmhEhQhF7NKANhwTH61EcJU=; b=U19MraLtzN+VNttH
	KrbE/z9YfBmIiUMlwg07E5OnLShTuSnKVcjcuS97EInlgoqHSsUZqNFS1Nw02VWb
	lE76WB4deGeL5aKeKuUXWyAbzeXkHAjLGn7FNvxdZ764HNGLJBRKLwAGemG+OGS8
	DlOD7QQmQ0X96T9zDN3NZXoG6Cb/S1EeSNyJCWjw1wWAewXOlcV+WfrvMfaVloto
	9eqgo6V26qmPfc29ZX+0AynCirANmTx5a1uEzvL8AM+uUBJaGKmJidqUDopNY/3X
	siHes35SuzziOhJg7AbDYfLhiHbVKtNLyt+m8Up2fWqdfAL5HJwgDzSAa/5AzlVz
	OaXIiQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qq5fn7w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 09:29:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53S9Thtg022371
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 09:29:43 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 28 Apr 2025 02:29:37 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Mon, 28 Apr 2025 14:58:49 +0530
Subject: [PATCH v2 01/23] media: iris: Skip destroying internal buffer if
 not dequeued
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250428-qcom-iris-hevc-vp9-v2-1-3a6013ecb8a5@quicinc.com>
References: <20250428-qcom-iris-hevc-vp9-v2-0-3a6013ecb8a5@quicinc.com>
In-Reply-To: <20250428-qcom-iris-hevc-vp9-v2-0-3a6013ecb8a5@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Nicolas Dufresne
	<nicolas.dufresne@collabora.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        <20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org>,
        <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>,
        <stable@vger.kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745832570; l=6094;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=MFve5uCBWtR3E0MisONahdQgLtvf1sT7jRjDYhCoAug=;
 b=+MIshb+qTYAQry5F/yb39/F/Z0mXfJJr1hQc2y73ctBJDoOx1vVGzYg3GaM2HthtVWHZYqMWf
 b9FXpXfr+L3Ay1d4IlSmyl7UzYZmXBANohlqYaL+8f0C5JAWVPbUfJY
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 8ZgLy4hu1KdcB-acfWlLcO-2fqfmWCDl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA3OCBTYWx0ZWRfX1iT3IMr4Cr3/ hWmVeQxxEaTbZ93BhOHV9Xupf2guMb0KhP4l0pcytPa6iNQZZfAF1JVq64jGj1GwnDlef+7MekB huBmL9hkmopJXRUo0iElcQs7YduoY8iP1V0qvzPft2d/0f5EukWJZkVR7+zRl2xUvwsCc9Lzz/4
 KQHYFPVspvj/p07tMA8weY1HEjNKV1qf6I6/KeoZdAfgCln5x8ow02y/zgORNNU0mNmZkXJQuf9 oiXPwgGAPhvfkmGEpV4ELIEjIITI/ONCbFPrIW8MHlGlkktcfzEzK+xjLtgAepnY0QCP/AelkAq Xo0M0Kp71VZ5dEGh27AapYOS1Xk5G84927D4zUBc0uwD1nNyibuMC5z22olaeUuUc2oYCu6y6Hg
 rrVJtZ7omgTJMZy8wysRHUN2k18qDtqj+D1w/pOCiw6BGKOopxtQNXI8CMd7Pi9mKX5WYFYD
X-Authority-Analysis: v=2.4 cv=QP1oRhLL c=1 sm=1 tr=0 ts=680f4a88 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=MwNjREcQ8sCCmPrZ5hAA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 8ZgLy4hu1KdcB-acfWlLcO-2fqfmWCDl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 clxscore=1011 mlxlogscore=999 lowpriorityscore=0 adultscore=0 mlxscore=0
 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280078

Firmware might hold the DPB buffers for reference in case of sequence
change, so skip destroying buffers for which QUEUED flag is not removed.
Also, make sure that all buffers are released during streamoff.

Cc: stable@vger.kernel.org
Fixes: 73702f45db81 ("media: iris: allocate, initialize and queue internal buffers")
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c | 37 +++++++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_buffer.h |  3 ++-
 drivers/media/platform/qcom/iris/iris_vdec.c   |  4 +--
 drivers/media/platform/qcom/iris/iris_vidc.c   |  6 +++--
 4 files changed, 44 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index e5c5a564fcb8..606d76b10be2 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -376,7 +376,7 @@ int iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buf
 	return 0;
 }
 
-int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane)
+int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane, bool force)
 {
 	const struct iris_platform_data *platform_data = inst->core->iris_platform_data;
 	struct iris_buffer *buf, *next;
@@ -396,6 +396,14 @@ int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane)
 	for (i = 0; i < len; i++) {
 		buffers = &inst->buffers[internal_buf_type[i]];
 		list_for_each_entry_safe(buf, next, &buffers->list, list) {
+			/*
+			 * during stream on, skip destroying internal(DPB) buffer
+			 * if firmware did not return it.
+			 * during close, destroy all buffers irrespectively.
+			 */
+			if (!force && buf->attr & BUF_ATTR_QUEUED)
+				continue;
+
 			ret = iris_destroy_internal_buffer(inst, buf);
 			if (ret)
 				return ret;
@@ -446,6 +454,33 @@ static int iris_release_input_internal_buffers(struct iris_inst *inst)
 	return 0;
 }
 
+void iris_get_num_queued_internal_buffers(struct iris_inst *inst, u32 plane)
+{
+	const struct iris_platform_data *platform_data = inst->core->iris_platform_data;
+	struct iris_buffer *buf, *next;
+	struct iris_buffers *buffers;
+	const u32 *internal_buf_type;
+	u32 internal_buffer_count, i;
+	u32 count = 0;
+
+	if (V4L2_TYPE_IS_OUTPUT(plane)) {
+		internal_buf_type = platform_data->dec_ip_int_buf_tbl;
+		internal_buffer_count = platform_data->dec_ip_int_buf_tbl_size;
+	} else {
+		internal_buf_type = platform_data->dec_op_int_buf_tbl;
+		internal_buffer_count = platform_data->dec_op_int_buf_tbl_size;
+	}
+
+	for (i = 0; i < internal_buffer_count; i++) {
+		buffers = &inst->buffers[internal_buf_type[i]];
+		list_for_each_entry_safe(buf, next, &buffers->list, list)
+			count++;
+		if (count)
+			dev_err(inst->core->dev, "%d buffer of type %d not released",
+				count, internal_buf_type[i]);
+	}
+}
+
 int iris_alloc_and_queue_persist_bufs(struct iris_inst *inst)
 {
 	struct iris_buffers *buffers = &inst->buffers[BUF_PERSIST];
diff --git a/drivers/media/platform/qcom/iris/iris_buffer.h b/drivers/media/platform/qcom/iris/iris_buffer.h
index c36b6347b077..03a32b91cf21 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.h
+++ b/drivers/media/platform/qcom/iris/iris_buffer.h
@@ -106,7 +106,8 @@ void iris_get_internal_buffers(struct iris_inst *inst, u32 plane);
 int iris_create_internal_buffers(struct iris_inst *inst, u32 plane);
 int iris_queue_internal_buffers(struct iris_inst *inst, u32 plane);
 int iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buffer);
-int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane);
+int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane, bool force);
+void iris_get_num_queued_internal_buffers(struct iris_inst *inst, u32 plane);
 int iris_alloc_and_queue_persist_bufs(struct iris_inst *inst);
 int iris_alloc_and_queue_input_int_bufs(struct iris_inst *inst);
 int iris_queue_buffer(struct iris_inst *inst, struct iris_buffer *buf);
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 4143acedfc57..2c1a7162d2da 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -408,7 +408,7 @@ int iris_vdec_streamon_input(struct iris_inst *inst)
 
 	iris_get_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 
-	ret = iris_destroy_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+	ret = iris_destroy_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE, false);
 	if (ret)
 		return ret;
 
@@ -496,7 +496,7 @@ int iris_vdec_streamon_output(struct iris_inst *inst)
 
 	iris_get_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
 
-	ret = iris_destroy_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	ret = iris_destroy_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE, false);
 	if (ret)
 		return ret;
 
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index ca0f4e310f77..56531a7f0dfe 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -233,8 +233,10 @@ int iris_close(struct file *filp)
 	iris_session_close(inst);
 	iris_inst_change_state(inst, IRIS_INST_DEINIT);
 	iris_v4l2_fh_deinit(inst);
-	iris_destroy_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
-	iris_destroy_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	iris_destroy_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE, true);
+	iris_destroy_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE, true);
+	iris_get_num_queued_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+	iris_get_num_queued_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
 	iris_remove_session(inst);
 	mutex_unlock(&inst->lock);
 	mutex_destroy(&inst->ctx_q_lock);

-- 
2.34.1


