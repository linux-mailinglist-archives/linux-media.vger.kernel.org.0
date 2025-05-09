Return-Path: <linux-media+bounces-32085-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 37813AB0D41
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 10:39:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F00C1BC8211
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 08:39:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4A6B27466E;
	Fri,  9 May 2025 08:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bqbDWuyS"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED7F22D9EF;
	Fri,  9 May 2025 08:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746779956; cv=none; b=pkwyoqEx6/ONhQ9t8xHeJuOHiy3FrDyx0LwM/2GgL/rZp1TEyWEj605UtYehw3II8HLUpvDEV6/VSmWg5TD77J7GcZDN/kOMrgduG5FZU291jQ2WStO8OIjr03i7oHHChC13h9DFybhWx5hGlUAgE5tvFP8XbSAADylT9Dgr4HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746779956; c=relaxed/simple;
	bh=qfaRMo2wtMzgLQqZfUWtuPe8LcZPsu987gHfKOZv9As=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=atTOUXNpBxJdUTuchJ2kRh5gWsZ2WiHC4B6E2LZwF830ulgyYsa5ty9bZnaNYdjBJJejDH0dk6+dMYyIMcE8phZ8WVtpL8V4YzW2X94wGhHRuMFZb/mKY3GOtrP0qzI/sZjq8+kQVcyAjct1K6MPQvCqBhmTn/g1gNBq4yAZdUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bqbDWuyS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5492Qh2j014090;
	Fri, 9 May 2025 08:39:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9IEj+eT4/GgN/tMNrVIEzHLK7m88TuE6VDWHVwUzUHo=; b=bqbDWuySL5hc5Pkd
	OCPxO5hA+mgZ7fFPC7fantH3S+Rl2WZJi8pBflJiahfKjzWP4K52LPurAI2P3zRc
	BuOs5LjG2VquToT43eMmg+SfwbJMJBhb5ylJtK2ekcb5BI6WLvuniYtjvBRblLE8
	K85EMx3/YHLdIYtmm8BMVxPZx/QbXyRDUDPVN6VzTcry1TZiiMJW4P6JZwiFBZzq
	E1PlQ/Zkwt7Qjn8UvUX+VIY8d8XfEwbTFr/cxtfMc6hL2D13/vb8MDUxICiJ4WNK
	aLTAQL8sGOi2faWZdoM8IONKjQvIrmnbhLnurvrlSGftBCIlAWOfCPR1JK9tTdcQ
	OThQFg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp4m016-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 08:39:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5498d7gP020223
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 May 2025 08:39:07 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 9 May 2025 01:39:02 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 9 May 2025 14:08:47 +0530
Subject: [PATCH v5 01/26] media: iris: Skip destroying internal buffer if
 not dequeued
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250509-video-iris-hevc-vp9-v5-1-59b4ff7d331c@quicinc.com>
References: <20250509-video-iris-hevc-vp9-v5-0-59b4ff7d331c@quicinc.com>
In-Reply-To: <20250509-video-iris-hevc-vp9-v5-0-59b4ff7d331c@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt
	<stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746779937; l=5761;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=qfaRMo2wtMzgLQqZfUWtuPe8LcZPsu987gHfKOZv9As=;
 b=HYwqvOXukmjYiKsLVvus2Eea6LY17eb/NzGFKFfvAIzDdr6og/H+t/ozhyOmouQ7Q/iGQ2Q5N
 u4j5dw8kgU2A06vhsT9AS5seBDTDIooj6+m0ZRQ7VDQNE9pulc1MNqo
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: krGrW_6vJ_BqK0SxaSggs7gXc5PVjp91
X-Authority-Analysis: v=2.4 cv=E5XNpbdl c=1 sm=1 tr=0 ts=681dbf2c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=mad7JUWUjgOo6fFp8yoA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA4MyBTYWx0ZWRfX+mDVR7qgDmWZ
 nqWn+nkYpZrubhk6jFdyK4BWBPaZ24OXzBGeuLwQiIRyMZbbcR2hMfmUZAw3lh4WTSOQOcU8LY7
 7FMKpOjRS/uRxFqjjV503EzoPBSgDrZRSNkW7hELyzesiLl06iC2fcI4sq91RqckWvrkkxE3cf6
 6fgC82A8W6FBHqT5Anq5nMmE4BLCA+5/wSgr5ZlqIIvVXrxoqUJiDKdhUERgtc4QRGMU1JyZw+9
 D2p2qVBbTryMCjeEz8oH9fN90c/Yuf8d0bN+fDrukW95H+Nhjcg1uD5evMRRTOb12WTtDMAa5Vs
 9xq+xQ8+6lfliRRwLckK18oAl+ztZuW/2dnFZ3J/bBr9oJYXXLH0Mmxja/3r0jx/PhtWXSTSDsl
 dM/2y7eRaGQm3QyumaDd4o87WqpfIgJbfCQXQ1RXZRR+vg+YxQ8SUDQNb8YnsmV6iYPZLutl
X-Proofpoint-ORIG-GUID: krGrW_6vJ_BqK0SxaSggs7gXc5PVjp91
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_03,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090083

Firmware might hold the DPB buffers for reference in case of sequence
change, so skip destroying buffers for which QUEUED flag is not removed.

Cc: stable@vger.kernel.org
Fixes: 73702f45db81 ("media: iris: allocate, initialize and queue internal buffers")
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c | 20 +++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_buffer.h |  3 ++-
 drivers/media/platform/qcom/iris/iris_vdec.c   |  4 ++--
 drivers/media/platform/qcom/iris/iris_vidc.c   |  4 ++--
 4 files changed, 25 insertions(+), 6 deletions(-)

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
index ca0f4e310f77f98193554caa9eea2a8c1eec2524..663f5602b5ad29f273f01b59328da104b79e1d84 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -233,8 +233,8 @@ int iris_close(struct file *filp)
 	iris_session_close(inst);
 	iris_inst_change_state(inst, IRIS_INST_DEINIT);
 	iris_v4l2_fh_deinit(inst);
-	iris_destroy_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
-	iris_destroy_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	iris_destroy_all_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+	iris_destroy_all_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
 	iris_remove_session(inst);
 	mutex_unlock(&inst->lock);
 	mutex_destroy(&inst->ctx_q_lock);

-- 
2.34.1


