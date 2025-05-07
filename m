Return-Path: <linux-media+bounces-31896-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 10515AAD86A
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 09:40:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EEB9189FFA0
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 07:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36F5B17A2E3;
	Wed,  7 May 2025 07:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pJamBkGY"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B0F1C84D6;
	Wed,  7 May 2025 07:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746603629; cv=none; b=QkXlJp59sjNclsMYke6Cq4mR8sw9UCPS6ZFbJmNvM/ZiN44rcuYphjMvD8aIJ7ybyMqbDwFztlEizTcAn349ewiTizX+GQnlzQUz28Rnzq9Z6iIXqiGxrcuvXNIdDcnjwVYQZr9vsyn/45kqwtVZQZlY4xMuu4znuZTlqgDBHC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746603629; c=relaxed/simple;
	bh=rtJrpt674zv3hV5lnXuCNJAvPCqzJP42lRu3YS0O7fY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=CnpRzLfkObKAJMEZ0qFGjoztDpcrfB1+IdQCzIf4JnQ9o7dAyfGYppapXv+2omeCrGzz9BCfoLkQvuVMvVpq/BsVEqpS9dRISuMky/83kCi+mQ05mm1YZzZT/st3zCE8NYk24eC9K6sLMcY+NmUbHhOLV5/xiMsoIyTjlZUyUyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pJamBkGY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5471GYR7002379;
	Wed, 7 May 2025 07:40:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VlqS1G92fylEYFO2G92Xr+AcvGvg6Qt5d2NVnsppfHw=; b=pJamBkGYWv8SoIhk
	7DuBoP2hoAEmwtIsOFROYwmmYybkmAL+MvkVkEoXR4qcTq6WNEGE/Z0WIBQGvmf2
	dVMr55JqLItKdVlnJizm07NFNzDCkLaHgTKRDpFfQcUXDPMfZbDEBi9NAXhywlvl
	e0L/y1KORbqglyJnmHvDYeMclptbVvGnCWTTWDluMiaZUHIpZFRu9jrYdMh4MDg9
	tDTRIDDGoV7EaGIpsORXAQER1d+rEuLh+rn9LICwnm/2PKhYx5+EyGqrnzXV8jXY
	x3V95Jib7d+XiXb5xp7z4XJymeyBD8uOXLHF8ktTLWH4gGGOHlQ/2wH704VwNXZo
	ZYkT3g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46fsmt1bk7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 07:40:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5477eLt0030828
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 May 2025 07:40:21 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 7 May 2025 00:40:16 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 7 May 2025 13:09:32 +0530
Subject: [PATCH v4 01/25] media: iris: Skip destroying internal buffer if
 not dequeued
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250507-video-iris-hevc-vp9-v4-1-58db3660ac61@quicinc.com>
References: <20250507-video-iris-hevc-vp9-v4-0-58db3660ac61@quicinc.com>
In-Reply-To: <20250507-video-iris-hevc-vp9-v4-0-58db3660ac61@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Stefan Schmidt <stefan.schmidt@linaro.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Nicolas Dufresne
	<nicolas.dufresne@collabora.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>, <stable@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746603611; l=6907;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=rtJrpt674zv3hV5lnXuCNJAvPCqzJP42lRu3YS0O7fY=;
 b=W0rk5b2K4PtPU/OeQ3zsSEetoNyn2XHIdoip5l6YZiV/qgNzmYWxEozM5pxVHjUg2II5BwMC4
 i9/+PeyVS8kCNIWC2dxrS4ZJLFqeOpbKrJzeV2DlefOlCmBDHo7PV30
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=U9KSDfru c=1 sm=1 tr=0 ts=681b0e66 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=-Mf_WbVAuxIxhWHR-agA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: DafFfQBqCtTjOSirAqYHTokwoAsuXho9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDA3MCBTYWx0ZWRfX0wBpLXyIM/uG
 peK+6DQ7+U8F7vta9cM99xXqmKvLkUAWIGR7bl1co1nzV6YRtt5g19EqBDdE3v6G9f4+upJtEKh
 TvySFZnq9AItqXV9mKcqCeySs4lsNbROXKbGIcnDyu2IUqoHYEAIwpKOQmSyvIa/b/K2eqeDrTz
 wXKI04ELIfC6MV/Z4HAHUWc9DiKLVVRmY7i5qoh/U3B/uZIOCzgpL/owiOXmUYjIt1ngFKInG3Q
 7dYS2WiMWBXgCXbOAPwjONAY0faN0of+PT34ccm0y6UqBuOaLNBGnXA9RZH85gYjJEDJKyK7QoL
 pFqxEKg6rYYQccLvpoJTdfImoGFgZt+BUM1gg9PY/fJiMYEkWQVHqYMMb7bAtZA42Gm9byuDMQS
 LwFiLySPgu/KIAle4fMKPB3+UWv8q2CRZyM9sqOp34yljxt5WO+OoFLgQlGHLaYHdLmn18wD
X-Proofpoint-ORIG-GUID: DafFfQBqCtTjOSirAqYHTokwoAsuXho9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_02,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505070070

Firmware might hold the DPB buffers for reference in case of sequence
change, so skip destroying buffers for which QUEUED flag is not removed.
Also, make sure that all buffers are released during streamoff.

Cc: stable@vger.kernel.org
Fixes: 73702f45db81 ("media: iris: allocate, initialize and queue internal buffers")
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c | 20 +++++++++++++++-
 drivers/media/platform/qcom/iris/iris_buffer.h |  3 ++-
 drivers/media/platform/qcom/iris/iris_vdec.c   |  4 ++--
 drivers/media/platform/qcom/iris/iris_vidc.c   | 33 ++++++++++++++++++++++++--
 4 files changed, 54 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index e5c5a564fcb81e77746df8c4797a10a07f2ae946..981fedb000ed5bf7aa79d34b8b581a5b4ca378a5 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -376,7 +376,7 @@ int iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buf
 	return 0;
 }
 
-int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane)
+static int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane, bool force)
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
@@ -405,6 +413,16 @@ int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane)
 	return 0;
 }
 
+int iris_destroy_all_internal_buffers(struct iris_inst *inst, u32 plane)
+{
+	return iris_destroy_internal_buffers(inst, plane, true);
+}
+
+int iris_destroy_dequeued_internal_buffers(struct iris_inst *inst, u32 plane)
+{
+	return iris_destroy_internal_buffers(inst, plane, false);
+}
+
 static int iris_release_internal_buffers(struct iris_inst *inst,
 					 enum iris_buffer_type buffer_type)
 {
diff --git a/drivers/media/platform/qcom/iris/iris_buffer.h b/drivers/media/platform/qcom/iris/iris_buffer.h
index c36b6347b0770a5abd6d63c0c4e027560fbb2f64..00825ad2dc3a4bd1ace32d7e95d15b95276315b0 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.h
+++ b/drivers/media/platform/qcom/iris/iris_buffer.h
@@ -106,7 +106,8 @@ void iris_get_internal_buffers(struct iris_inst *inst, u32 plane);
 int iris_create_internal_buffers(struct iris_inst *inst, u32 plane);
 int iris_queue_internal_buffers(struct iris_inst *inst, u32 plane);
 int iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buffer);
-int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane);
+int iris_destroy_all_internal_buffers(struct iris_inst *inst, u32 plane);
+int iris_destroy_dequeued_internal_buffers(struct iris_inst *inst, u32 plane);
 int iris_alloc_and_queue_persist_bufs(struct iris_inst *inst);
 int iris_alloc_and_queue_input_int_bufs(struct iris_inst *inst);
 int iris_queue_buffer(struct iris_inst *inst, struct iris_buffer *buf);
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 4143acedfc5744f16f026ab662e2eb7f714580ac..9c049b9671ccc6bff6c3af37b77fbe73a8ae3f2b 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -408,7 +408,7 @@ int iris_vdec_streamon_input(struct iris_inst *inst)
 
 	iris_get_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 
-	ret = iris_destroy_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+	ret = iris_destroy_dequeued_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 	if (ret)
 		return ret;
 
@@ -496,7 +496,7 @@ int iris_vdec_streamon_output(struct iris_inst *inst)
 
 	iris_get_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
 
-	ret = iris_destroy_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	ret = iris_destroy_dequeued_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
 	if (ret)
 		return ret;
 
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index ca0f4e310f77f98193554caa9eea2a8c1eec2524..a8144595cc78e8fbe33ad5bfa9688f96f2ef8ea6 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -221,6 +221,33 @@ static void iris_session_close(struct iris_inst *inst)
 		iris_wait_for_session_response(inst, false);
 }
 
+static void iris_check_num_queued_internal_buffers(struct iris_inst *inst, u32 plane)
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
 int iris_close(struct file *filp)
 {
 	struct iris_inst *inst = iris_get_inst(filp, NULL);
@@ -233,8 +260,10 @@ int iris_close(struct file *filp)
 	iris_session_close(inst);
 	iris_inst_change_state(inst, IRIS_INST_DEINIT);
 	iris_v4l2_fh_deinit(inst);
-	iris_destroy_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
-	iris_destroy_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	iris_destroy_all_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+	iris_destroy_all_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	iris_check_num_queued_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+	iris_check_num_queued_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
 	iris_remove_session(inst);
 	mutex_unlock(&inst->lock);
 	mutex_destroy(&inst->ctx_q_lock);

-- 
2.34.1


