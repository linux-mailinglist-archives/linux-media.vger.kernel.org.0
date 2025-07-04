Return-Path: <linux-media+bounces-36770-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A53AF8B33
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 10:22:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E03A4189FB5D
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 08:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CCBA2882CE;
	Fri,  4 Jul 2025 07:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dpdiGQBG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105E92877F4;
	Fri,  4 Jul 2025 07:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615629; cv=none; b=mPwIs4xyrDFvit3i2JPS/I3dxg6D4SzSNOiCrck3UaEFn6wy+GbC38+8QOKLGeqAROWMMv7BFyeWg4uuQ6w6EYqAeiUK9QDkaXwRTQPskn7sp0QegO1l1KgSG86/12futCXMUHiBYAE37Yjy3FZkWeztaf7IqLmprW3933ptqis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615629; c=relaxed/simple;
	bh=RNJbZWkTYQTBMx2fNSRet7xZLfc5sRQK7bocJ7lsJ3w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=G4lFz/rAiwtajkwDWwcGd+BTHLShIGWz0EXCHcQc458xBJQE8oqLq3MWyzlnNuZRuZOmRVsXVdUIxbdSnLKXpg0rJMbO95rjrBgymeU6KIjLR4Gofgksmw4+iKdgGvje8AGpcPoIDIafZEsj48xoHyXEpedlVWL2L1Azg3ovOd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dpdiGQBG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563IctQE029572;
	Fri, 4 Jul 2025 07:53:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tGAV81va0ndjiQQ/lBves87DuWtGn+AsjOR6jDsOz9Q=; b=dpdiGQBGew6S5T0s
	bNuuVifg6rK+K6t5E+PfzWQIU460CKzvHpiGFAzqDrs5yMuvoB/NYjMYkRjv0dky
	UTzsf0ssPRpXo1k0lhtQzUQIJ+gVElcQf+1eLzf0rV5tZUo8V/LLsaCYYIXx9VmZ
	U2kk5d1ymGS+Zu1Lu20vtrzNFdmu2NOpatzBJ+m8OZ6vPg0rQI4Mz/6TTJ2Zbbe6
	3MLWNHaMM9ra+CPA7XVfDQ2Wq1JZMk1Co848X5OE5+kJEfAMFAZ9cPRg0+jsPb7d
	67T+0xfbDWhPO8qiODjKMiswNL6g4sZX2c4t1Q3RObVk4FlZnzbvG04/nmC4pbks
	96bWAQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47nh9s4bpw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 07:53:40 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5647rews000550
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Jul 2025 07:53:40 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 4 Jul 2025 00:53:36 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 4 Jul 2025 13:23:05 +0530
Subject: [PATCH 05/25] media: iris: Fix port streaming handling
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250704-iris-video-encoder-v1-5-b6ce24e273cf@quicinc.com>
References: <20250704-iris-video-encoder-v1-0-b6ce24e273cf@quicinc.com>
In-Reply-To: <20250704-iris-video-encoder-v1-0-b6ce24e273cf@quicinc.com>
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
        Dikshita Agarwal <quic_dikshita@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751615599; l=4453;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=RNJbZWkTYQTBMx2fNSRet7xZLfc5sRQK7bocJ7lsJ3w=;
 b=exKh17bLknbyicH220AJYHJdERtOj554xuiwD+4C42BnAXbuyCAt/H882RBrz/EvvZtojWe3n
 Li8gk7Nx0XgBd0i173B8kQ0kOSQwjsCnm+lTZOTrBqcJoT+b+uFWr4d
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=frrcZE4f c=1 sm=1 tr=0 ts=68678884 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=KN8zqi05ybdC166h3CMA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA2MCBTYWx0ZWRfX5AEyi0O4AHyh
 oNfOx9tqNNpZ/7f0v26Jwj9tOKX9r9mYHOrZJiql7A9UUBfHpAiyc1ATtjLJR5Ne45h7Z8ahqgS
 N7GnVJvDGx6fMVTY6dTgicjqzpjM16ANl0mBZgmFI9iRuIfKF0s7FQIEX4eJs6qzS5TG1VVRLST
 a8b08i+Par/U60vgbjvzp66i7HzTkdGJvUwRnmlH4x45LGCBTO0twZmTc1N5/EP+1ZID9V+EDLA
 ATMtC6gveicWgkwgVR6BGfV4pXlfE95b/1HKMsDNMaTZ6sIUlAt6jYLaXBn2gKD6l9qEW2Nn2r0
 LFJK7d+FEk3sTxMY0oxR4NdtfW96yA2sTGE8AI4UQUXAkAqk8maiwyXXaRqa+PsHArWRZjJXMvL
 Axv5cGqWhie+CtIylcfwWOrhurbtq64A7ilJvINuePwK0eBBKb7bhHDxq03f5KBcjDkBweKW
X-Proofpoint-GUID: JL8K27BEaGUYecXmYC7HtD-qEtwe7MG3
X-Proofpoint-ORIG-GUID: JL8K27BEaGUYecXmYC7HtD-qEtwe7MG3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 adultscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040060

The previous check to block capture port streaming before output port
was incorrect and caused some valid usecase to fail. While removing that
check allows capture port to enter streaming independently, it also
introduced firmware errors due to premature queuing of DPB buffers
before the firmware session was fully started which happens only when
streamon is called on output port.

Fix this by deferring DPB buffer queuing to the firmware until both
capture and output are streaming and state is 'STREAMING'.

Fixes: 11712ce70f8e ("media: iris: implement vb2 streaming ops")
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c | 27 ++++++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_buffer.h |  1 +
 drivers/media/platform/qcom/iris/iris_vb2.c    |  8 ++++----
 3 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index 809ce77744f996c23dc07ef9ecb3e8e92b709850..320ebfb833331294ba5ddda8e9cd243c80633408 100644
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


