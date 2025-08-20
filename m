Return-Path: <linux-media+bounces-40357-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0C6B2D7A4
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 11:12:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9ED247B95B8
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 09:10:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1946A2E3390;
	Wed, 20 Aug 2025 09:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Qt7u4ZGB"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F992DC349;
	Wed, 20 Aug 2025 09:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755680894; cv=none; b=EbunVi+bH6FwKXjTnEBp+w1A9ud5NKjpPDda5zVS78NIsxCPiF5qeAvblrWHqHLbRb2wej7lSs18AAoingvymbpXnr1MpppsGSmvY7LTOqPuE0PFlozfmXmJBmSQ3nbohV1utTwbhvM1pp9Uh9fInWcPFzDHvRo3jLuozDrcSOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755680894; c=relaxed/simple;
	bh=30Flek7SCdoj8nzGDVWXIe6uWk0SEz2oCWLQMaM2FjA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=E0S2qlErsYNbH4Y6VJZQfPkdneazft5GHtbK82qPgh3cHb9CSIZzmnTPlWcJvbEOADc0R3T6Q9zQhMf5SReRy2u6siO580B9qP5tRCnTf4pabVUA8BrsBcnYHNLuHN6rquFTokA4ltaZ65Rl8Kzlui0BpV5SYhVhrL0xi/y6+U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Qt7u4ZGB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1p2dW028595;
	Wed, 20 Aug 2025 09:08:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Crpp5tiCyirFldu6HZLlle0w91DHZ3pwgKRp0KA8oxU=; b=Qt7u4ZGBMLiSs4Pa
	aiLxF0F6gr7VNOfZ+RlQ5cOMC8L5tQ005mcFIuaLhaLoHzHX5THbWgTLvvG8kD9K
	ym+FaH+9vsHH2fVjasJwhY/MjpS3EpvZPJ0Hxe+k6QE1D0FkGMUgTgHcXsSH8TeI
	TJKsgGdKss9+6lJ3fOPUZu/OPiNdt4zqSQX5jW8mkEA/xO73POC5Fu40weDMZbxH
	QGcq/N5PGYEXfHj0YkUmV28pjPdIrX6h9XM6W3k2zh9DaXlGPBgsquZ5cqcn4pKb
	zeapj8lHfnLchmvZigRzx5H9yKsAIAeoimNio4hn9WiGIaIIgMTpMREFcSCr0BN2
	2JmmGA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52as32s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 09:08:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57K987Mq021757
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 09:08:07 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 20 Aug 2025 02:08:03 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 20 Aug 2025 14:37:42 +0530
Subject: [PATCH v3 04/26] media: iris: Fix port streaming handling
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250820-iris-video-encoder-v3-4-80ab0ba58b3d@quicinc.com>
References: <20250820-iris-video-encoder-v3-0-80ab0ba58b3d@quicinc.com>
In-Reply-To: <20250820-iris-video-encoder-v3-0-80ab0ba58b3d@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt
	<stefan.schmidt@linaro.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        "Hans
 Verkuil" <hverkuil@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Wangao Wang <quic_wangaow@quicinc.com>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755680867; l=4576;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=30Flek7SCdoj8nzGDVWXIe6uWk0SEz2oCWLQMaM2FjA=;
 b=V0nO7+dvPd6UQpWKszMtOwXXWSmr6tkGi9M0zoqEfn6rA8O2qH/yuPqMfb7ME9Fox0xoxVa1M
 U8ClOA4YFO+B0HDDhU4ZdxOJqWxGckB0VZk1nxuEIsomswZTlxqb87D
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX/laLcumMhfrb
 13IKuXHVucuxZSPBB9lyUcj9r4+mwsnpohYDFTjJYguDniqUkBbs2FJ9q8C6iYui9L3DXrzCdt6
 YMorULh8tVdK3WZ9tXP5OAQdEqm7mmA5CwNA6Q4dCM9M9g2lfAjrtR8UWeo1bftKxYCa2YCJEIo
 gnAvmt2OTTGnRfpJqQNqETQ/mKuuVj/YLrTAf1tXp9KkyVGbkOfRGEI+5jerC4XsUEVLgiXJFrz
 PONdkfYonwlka4A4pU4CHqGIQnsLDO7HeVkTsXOpyTTbvwVRMct6rQkin037cUN+uTNbsxmYUbg
 pdb0B6g0TXXfacXRcCEVyjLIH90GbiAjxnjf9mb025MECh3ss+rMJWWp8Wjop630dbjmlHiBzKq
 VoAuQ8UukOPzu7GX1DLr1L1x2lv9RA==
X-Authority-Analysis: v=2.4 cv=TIIci1la c=1 sm=1 tr=0 ts=68a59078 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=KN8zqi05ybdC166h3CMA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: SS5i09ZR-cSfSw7ZYbzvcXgM7WozfcuK
X-Proofpoint-GUID: SS5i09ZR-cSfSw7ZYbzvcXgM7WozfcuK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

The previous check to block capture port streaming before output port
was incorrect and caused some valid usecase to fail. While removing that
check allows capture port to enter streaming independently, it also
introduced firmware errors due to premature queuing of DPB buffers
before the firmware session was fully started which happens only when
streamon is called on output port.

Fix this by deferring DPB buffer queuing to the firmware until both
capture and output are streaming and state is 'STREAMING'.

Fixes: 11712ce70f8e ("media: iris: implement vb2 streaming ops")
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c | 27 ++++++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_buffer.h |  1 +
 drivers/media/platform/qcom/iris/iris_vb2.c    |  8 ++++----
 3 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index 9f664c241149362d44d3a8fa65e2266f9c2e80e0..23cac5d1312913b8dac44347ae66cb80a6a15deb 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -334,6 +334,29 @@ int iris_queue_buffer(struct iris_inst *inst, struct iris_buffer *buf)
 	return 0;
 }
 
+int iris_queue_internal_deferred_buffers(struct iris_inst *inst, enum iris_buffer_type buffer_type)
+{
+	struct iris_buffer *buffer, *next;
+	struct iris_buffers *buffers;
+	int ret = 0;
+
+	buffers = &inst->buffers[buffer_type];
+	list_for_each_entry_safe(buffer, next, &buffers->list, list) {
+		if (buffer->attr & BUF_ATTR_PENDING_RELEASE)
+			continue;
+		if (buffer->attr & BUF_ATTR_QUEUED)
+			continue;
+
+		if (buffer->attr & BUF_ATTR_DEFERRED) {
+			ret = iris_queue_buffer(inst, buffer);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return ret;
+}
+
 int iris_queue_internal_buffers(struct iris_inst *inst, u32 plane)
 {
 	const struct iris_platform_data *platform_data = inst->core->iris_platform_data;
@@ -358,6 +381,10 @@ int iris_queue_internal_buffers(struct iris_inst *inst, u32 plane)
 				continue;
 			if (buffer->attr & BUF_ATTR_QUEUED)
 				continue;
+			if (buffer->type == BUF_DPB && inst->state != IRIS_INST_STREAMING) {
+				buffer->attr |= BUF_ATTR_DEFERRED;
+				continue;
+			}
 			ret = iris_queue_buffer(inst, buffer);
 			if (ret)
 				return ret;
diff --git a/drivers/media/platform/qcom/iris/iris_buffer.h b/drivers/media/platform/qcom/iris/iris_buffer.h
index 00825ad2dc3a4bd1ace32d7e95d15b95276315b0..b9b011faa13ae72e08545c191cdcc2f1bcaf9e0a 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.h
+++ b/drivers/media/platform/qcom/iris/iris_buffer.h
@@ -105,6 +105,7 @@ int iris_get_buffer_size(struct iris_inst *inst, enum iris_buffer_type buffer_ty
 void iris_get_internal_buffers(struct iris_inst *inst, u32 plane);
 int iris_create_internal_buffers(struct iris_inst *inst, u32 plane);
 int iris_queue_internal_buffers(struct iris_inst *inst, u32 plane);
+int iris_queue_internal_deferred_buffers(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 int iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buffer);
 int iris_destroy_all_internal_buffers(struct iris_inst *inst, u32 plane);
 int iris_destroy_dequeued_internal_buffers(struct iris_inst *inst, u32 plane);
diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
index 8b17c7c3948798326ed4732ca50ebd98b833401f..e62ed7a57df2debf0a930ad8307e6d945f589922 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -173,9 +173,6 @@ int iris_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
 
 	inst = vb2_get_drv_priv(q);
 
-	if (V4L2_TYPE_IS_CAPTURE(q->type) && inst->state == IRIS_INST_INIT)
-		return 0;
-
 	mutex_lock(&inst->lock);
 	if (inst->state == IRIS_INST_ERROR) {
 		ret = -EBUSY;
@@ -203,7 +200,10 @@ int iris_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
 
 	buf_type = iris_v4l2_type_to_driver(q->type);
 
-	ret = iris_queue_deferred_buffers(inst, buf_type);
+	if (inst->state == IRIS_INST_STREAMING)
+		ret = iris_queue_internal_deferred_buffers(inst, BUF_DPB);
+	if (!ret)
+		ret = iris_queue_deferred_buffers(inst, buf_type);
 	if (ret)
 		goto error;
 

-- 
2.34.1


