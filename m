Return-Path: <linux-media+bounces-39761-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB688B245A1
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 11:40:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 543385A02AB
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 09:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 755BC2F5482;
	Wed, 13 Aug 2025 09:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JWdGWY26"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A072F1FDF;
	Wed, 13 Aug 2025 09:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755077926; cv=none; b=bnPCMJ7hUlbUDIgdUtHUzgsMLbN29sEO/8cVVjtezt6rs4RGZo58d+SyFuyPdw+eYoJRauEqYO1GWzxWcJWjdUgtHhuCWB3GmjAO0cG2ndPemtpTs1+uBXX8KZXxjTQdl6a2vR2Lzkcw3UoA1h4Wt9ZrKKZyQRq7K1lx+1cuzvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755077926; c=relaxed/simple;
	bh=30Flek7SCdoj8nzGDVWXIe6uWk0SEz2oCWLQMaM2FjA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=IcsPvZ/Ox93Q48b/b7TaB/39WCn5aR/VyM2FMxo/4/qEBqx3uyzwYuicbc3TMGU3k34dhEvfB46X2zO9xl7NLfXkx1cRFZ/bLf1PQ5w6ORwYXv60HI8JnLdDDygqCzSJsJaayh5/ijsx0a+o+ka6bBcCKXyVJwnL2puRJpmfNiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JWdGWY26; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D6mSSR015791;
	Wed, 13 Aug 2025 09:38:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Crpp5tiCyirFldu6HZLlle0w91DHZ3pwgKRp0KA8oxU=; b=JWdGWY260+9/MNXe
	nmI9IC537l3138RsrWxjUxqZkz9mvamdLCsdt2oomxBMEvxcSxF6RjSaPXhtPRUD
	tqj/Z4937Dzuwqw4smnWwyM3ReDhP+auCvmwJyE658VkqIM6cnL9aOaeXWDIpZar
	dl065hsPRsGXzNXCilBPfn/k3Ec85tR6CkPwOyXFqmJ4mJLXjFgNrDTqFJK/GoAL
	T/aVvnoq53CKLwyuv/pO2sArOsNVv0kdZ6CUz6mDw3wp0B0FJbvPrxzinJwhk0M0
	IsVm5WbjQQ/+4j/7eoeymoLqE7nanLXidnz86r3JH4wJPOORVbb9WuoBcOq4HEuc
	UmPY9A==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fjxbefjd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 09:38:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57D9cbZF003250
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 09:38:37 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 13 Aug 2025 02:38:33 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 13 Aug 2025 15:07:54 +0530
Subject: [PATCH v2 04/24] media: iris: Fix port streaming handling
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250813-iris-video-encoder-v2-4-c725ff673078@quicinc.com>
References: <20250813-iris-video-encoder-v2-0-c725ff673078@quicinc.com>
In-Reply-To: <20250813-iris-video-encoder-v2-0-c725ff673078@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        "Vedang
 Nagar" <quic_vnagar@quicinc.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Wangao Wang <quic_wangaow@quicinc.com>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755077896; l=4576;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=30Flek7SCdoj8nzGDVWXIe6uWk0SEz2oCWLQMaM2FjA=;
 b=ak8dryJuiwvymgVsvih6pUyUGhcp8zhLhe2VNciYtcquxfS4ykNqYWd4KDGGvbuKlohcCQ7N6
 /rBsMswBdTaDAyzA7mF28ja9utTWuZAio30zp8hbXS0B4jUWnw4EQCY
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=G6EcE8k5 c=1 sm=1 tr=0 ts=689c5d1d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=KN8zqi05ybdC166h3CMA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA5NyBTYWx0ZWRfX4tCTSv3Lobz4
 DmwpD7E1fwAiIuOqsf8NLkZc583BFMD1SNsbF2sB6Lqe4qnn8YLxTaH5Zf9tLyyUj+gPSQ1RBTC
 drBn7kcsRjUwRk1DQH0DrX6ixC3qCYiCiPsABrekuD2CBy8eDg7WQ2L/gA46zKndR9RzTAqYNIX
 YRxPSqaYNEmR9WfMQRyF8HEHXw4DGhj+ovWvk2aRTKOgOJxPaPgd5NeskLTd2nkMM7m/ehFhARA
 k6rxdU9LUwg6i1iQnBx/+PfJkdEqYGqoKT5L8/fLVJ/xwkgwMUGohZ6ESWox6l3lVYdKj1e5XWV
 643JC6LJifgg74ZmPTOMQMjFQPXqgkhzaTxNd2jXqy4u8ucDsQVkKk6q/1MnaCzto5q57b14E4f
 mBdko4UQ
X-Proofpoint-ORIG-GUID: kukYCvQjQTmVHeCQTdGFJJXXASy7VSWt
X-Proofpoint-GUID: kukYCvQjQTmVHeCQTdGFJJXXASy7VSWt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110097

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


