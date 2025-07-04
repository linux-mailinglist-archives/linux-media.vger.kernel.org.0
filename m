Return-Path: <linux-media+bounces-36789-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEDEAF8AB2
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 10:08:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC21A7BE1B6
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 08:06:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 017662F235D;
	Fri,  4 Jul 2025 07:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ipDLcSR5"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BF52EAD11;
	Fri,  4 Jul 2025 07:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615696; cv=none; b=vCmrxev8B+w6AUm/vrZHUmXIJ8t2ltH1HLBEajgljhLkJYa+5Ud+xHx3FuCseALnoyUnJ6VvLz6uctBM2lFazvDUGNc7BUlw/c5d5HQ8f6uhUUp9UUibLghgK7do6EtKWp7Qjy4jVSfQF8oDks7dpN6o6yjkp45iKNsQxwjBzNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615696; c=relaxed/simple;
	bh=1L6y4Ocz3+WlWF8tQYsHqB7CyoVvEiErHhVjSOGPCso=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=tBLteaxPLqiR2lu9c+GtWwZVE55lt1whjimRP7SmAxRtB3+DYrKn/cHTx5GT3AC2bgQpEnD6NrKeF17h99lN9x9ENkT8RF5q18jttpqgOb1jzPsyPRIqKFYqHNEXRkAZBP+caLViDH8e2e92JXhxV7dDtQji4IGG58T8+UkvCRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ipDLcSR5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5645U6TU007345;
	Fri, 4 Jul 2025 07:54:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g2u9Xa04qZrJPPyTmA4nzd88fd5y/ShONYZXR6QUK3o=; b=ipDLcSR5Ubd8EtKp
	QjlSKrnB9+ZFr0GZj4lc6nVDV5hjBrgY+ZxTW/2mciHjV0cl7P7zWOGd4XD1V0A8
	njbB75nDCxX98YojLxVeaPoDAGnFJj0y2EpFDCMNy6s/EHtGblpZ5Oorb3affVWg
	dyPWErvl4w85X5iht+tA+D+ULZBJr7/LoBvVF7ZzxSWITJKeKXp2x0prDiwcbH8G
	FqY11MMZH/6Oo4LGititRd0rKp+J9odnh2ra6+/7dVzrQrYy7nK5f4boNJJwU8hX
	lE3xBP6Fw8X6+WKfPuSoVm7hOTWR7cX5SuWCC8R9weJcbs58tWoCpz+nDqUzwzMP
	Pmw3/Q==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kn5jqgvx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 07:54:41 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5647sffq026542
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Jul 2025 07:54:41 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 4 Jul 2025 00:54:37 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 4 Jul 2025 13:23:23 +0530
Subject: [PATCH 23/25] media: iris: Allocate and queue internal buffers for
 encoder video device
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250704-iris-video-encoder-v1-23-b6ce24e273cf@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751615599; l=56204;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=1L6y4Ocz3+WlWF8tQYsHqB7CyoVvEiErHhVjSOGPCso=;
 b=4nFaIX2DnnzNrmsJQP0AZtB5tx2x+5Bnz6OxkgDn/jiQV0aUXXAw5KX2ggzyGV3h9pUR3biFk
 stjds4OFiUsAlzv605UYwvswOTiz6aUdqEIbDwvSZVAm59lOC0Lrw6d
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=KtJN2XWN c=1 sm=1 tr=0 ts=686788c2 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=w1rVzjzx0pa-1t0gukAA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 0P9hm87nCDexFaDjgOQ58D3IxN7pqxdZ
X-Proofpoint-GUID: 0P9hm87nCDexFaDjgOQ58D3IxN7pqxdZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA2MCBTYWx0ZWRfX9HMKqzWv8iTe
 vNgA9VisdTXA2u7dz2NdgMg/lepG9CYRjT+1M2td7Wx/6Wh3MoYFknJop5/ZbCg8E/UDm5CEI1a
 ccuTPhzdQ7YcuimeXRFvCC8sG3RIid36OhexoEuTmR0IS7nGRbKkh/LMlw7YFjK/VvKHBENisW4
 iHldGEcjVEjtpHJ/SzaqhAQgKrCzstLYMkvHIWTKPbsMUd7TfjO4C6p6xHOPyLQGNTgqjmzTUuj
 0HwUlptG1OcpSTBmM7Q3pH6AVbtCjJochAmPFzwlkba1F1fbfDgrauu7gAnEiUy16TpUS+6JRyD
 q8hEAM5ydF0k41nJlojdtqzIoipZDlRUzF2k2YN6BTynGqoV2WzuMQ6MiVEEMfY8R2xhmeeNp+a
 iNie7h/b52Xwj9MxSMGFgIg8v72vHBVogjIFIEh5tb8H1oOUW45xoOumLBenkj6H4YGM0qW+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 mlxscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040060

Add support for allocating and queuing internal buffers required by the
encoder. The sizes of these buffers are derived from hardware
specifications and are essential to meet the encoder's functional and
performance requirements.

These buffers are not exposed to userspace; they are allocated and
managed internally to ensure correct and efficient hardware operation.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c     | 114 ++-
 drivers/media/platform/qcom/iris/iris_buffer.h     |   4 +-
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |   6 +
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |   2 +
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |  56 +-
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  10 +-
 .../platform/qcom/iris/iris_platform_common.h      |   4 +
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  17 +
 .../platform/qcom/iris/iris_platform_sm8250.c      |   9 +
 drivers/media/platform/qcom/iris/iris_vdec.c       |   2 +-
 drivers/media/platform/qcom/iris/iris_venc.c       |  36 +
 drivers/media/platform/qcom/iris/iris_vidc.c       |   7 +-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 841 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  20 +
 14 files changed, 1071 insertions(+), 57 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index 8ec10e6058f2b66c923a9925048f90537603004b..9df6788cefda72352ebe79013c78d0b57d29ed9f 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -294,16 +294,30 @@ void iris_get_internal_buffers(struct iris_inst *inst, u32 plane)
 	const u32 *internal_buf_type;
 	u32 internal_buffer_count, i;
 
-	if (V4L2_TYPE_IS_OUTPUT(plane)) {
-		internal_buf_type = platform_data->dec_ip_int_buf_tbl;
-		internal_buffer_count = platform_data->dec_ip_int_buf_tbl_size;
-		for (i = 0; i < internal_buffer_count; i++)
-			iris_fill_internal_buf_info(inst, internal_buf_type[i]);
+	if (inst->domain == DECODER) {
+		if (V4L2_TYPE_IS_OUTPUT(plane)) {
+			internal_buf_type = platform_data->dec_ip_int_buf_tbl;
+			internal_buffer_count = platform_data->dec_ip_int_buf_tbl_size;
+			for (i = 0; i < internal_buffer_count; i++)
+				iris_fill_internal_buf_info(inst, internal_buf_type[i]);
+		} else {
+			internal_buf_type = platform_data->dec_op_int_buf_tbl;
+			internal_buffer_count = platform_data->dec_op_int_buf_tbl_size;
+			for (i = 0; i < internal_buffer_count; i++)
+				iris_fill_internal_buf_info(inst, internal_buf_type[i]);
+		}
 	} else {
-		internal_buf_type = platform_data->dec_op_int_buf_tbl;
-		internal_buffer_count = platform_data->dec_op_int_buf_tbl_size;
-		for (i = 0; i < internal_buffer_count; i++)
-			iris_fill_internal_buf_info(inst, internal_buf_type[i]);
+		if (V4L2_TYPE_IS_OUTPUT(plane)) {
+			internal_buf_type = platform_data->enc_ip_int_buf_tbl;
+			internal_buffer_count = platform_data->enc_ip_int_buf_tbl_size;
+			for (i = 0; i < internal_buffer_count; i++)
+				iris_fill_internal_buf_info(inst, internal_buf_type[i]);
+		} else {
+			internal_buf_type = platform_data->enc_op_int_buf_tbl;
+			internal_buffer_count = platform_data->enc_op_int_buf_tbl_size;
+			for (i = 0; i < internal_buffer_count; i++)
+				iris_fill_internal_buf_info(inst, internal_buf_type[i]);
+		}
 	}
 }
 
@@ -344,12 +358,22 @@ int iris_create_internal_buffers(struct iris_inst *inst, u32 plane)
 	const u32 *internal_buf_type;
 	int ret;
 
-	if (V4L2_TYPE_IS_OUTPUT(plane)) {
-		internal_buf_type = platform_data->dec_ip_int_buf_tbl;
-		internal_buffer_count = platform_data->dec_ip_int_buf_tbl_size;
+	if (inst->domain == DECODER) {
+		if (V4L2_TYPE_IS_OUTPUT(plane)) {
+			internal_buf_type = platform_data->dec_ip_int_buf_tbl;
+			internal_buffer_count = platform_data->dec_ip_int_buf_tbl_size;
+		} else {
+			internal_buf_type = platform_data->dec_op_int_buf_tbl;
+			internal_buffer_count = platform_data->dec_op_int_buf_tbl_size;
+		}
 	} else {
-		internal_buf_type = platform_data->dec_op_int_buf_tbl;
-		internal_buffer_count = platform_data->dec_op_int_buf_tbl_size;
+		if (V4L2_TYPE_IS_OUTPUT(plane)) {
+			internal_buf_type = platform_data->enc_ip_int_buf_tbl;
+			internal_buffer_count = platform_data->enc_ip_int_buf_tbl_size;
+		} else {
+			internal_buf_type = platform_data->enc_op_int_buf_tbl;
+			internal_buffer_count = platform_data->enc_op_int_buf_tbl_size;
+		}
 	}
 
 	for (i = 0; i < internal_buffer_count; i++) {
@@ -411,12 +435,22 @@ int iris_queue_internal_buffers(struct iris_inst *inst, u32 plane)
 	u32 internal_buffer_count, i;
 	int ret;
 
-	if (V4L2_TYPE_IS_OUTPUT(plane)) {
-		internal_buf_type = platform_data->dec_ip_int_buf_tbl;
-		internal_buffer_count = platform_data->dec_ip_int_buf_tbl_size;
+	if (inst->domain == DECODER) {
+		if (V4L2_TYPE_IS_OUTPUT(plane)) {
+			internal_buf_type = platform_data->dec_ip_int_buf_tbl;
+			internal_buffer_count = platform_data->dec_ip_int_buf_tbl_size;
+		} else {
+			internal_buf_type = platform_data->dec_op_int_buf_tbl;
+			internal_buffer_count = platform_data->dec_op_int_buf_tbl_size;
+		}
 	} else {
-		internal_buf_type = platform_data->dec_op_int_buf_tbl;
-		internal_buffer_count = platform_data->dec_op_int_buf_tbl_size;
+		if (V4L2_TYPE_IS_OUTPUT(plane)) {
+			internal_buf_type = platform_data->enc_ip_int_buf_tbl;
+			internal_buffer_count = platform_data->enc_ip_int_buf_tbl_size;
+		} else {
+			internal_buf_type = platform_data->enc_op_int_buf_tbl;
+			internal_buffer_count = platform_data->enc_op_int_buf_tbl_size;
+		}
 	}
 
 	for (i = 0; i < internal_buffer_count; i++) {
@@ -460,12 +494,22 @@ static int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane, bool
 	u32 i, len;
 	int ret;
 
-	if (V4L2_TYPE_IS_OUTPUT(plane)) {
-		internal_buf_type = platform_data->dec_ip_int_buf_tbl;
-		len = platform_data->dec_ip_int_buf_tbl_size;
+	if (inst->domain == DECODER) {
+		if (V4L2_TYPE_IS_OUTPUT(plane)) {
+			internal_buf_type = platform_data->dec_ip_int_buf_tbl;
+			len = platform_data->dec_ip_int_buf_tbl_size;
+		} else {
+			internal_buf_type = platform_data->dec_op_int_buf_tbl;
+			len = platform_data->dec_op_int_buf_tbl_size;
+		}
 	} else {
-		internal_buf_type = platform_data->dec_op_int_buf_tbl;
-		len = platform_data->dec_op_int_buf_tbl_size;
+		if (V4L2_TYPE_IS_OUTPUT(plane)) {
+			internal_buf_type = platform_data->enc_ip_int_buf_tbl;
+			len = platform_data->enc_ip_int_buf_tbl_size;
+		} else {
+			internal_buf_type = platform_data->enc_op_int_buf_tbl;
+			len = platform_data->enc_op_int_buf_tbl_size;
+		}
 	}
 
 	for (i = 0; i < len; i++) {
@@ -486,7 +530,10 @@ static int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane, bool
 	}
 
 	if (force) {
-		buffers = &inst->buffers[BUF_PERSIST];
+		if (inst->domain == DECODER)
+			buffers = &inst->buffers[BUF_PERSIST];
+		else
+			buffers = &inst->buffers[BUF_ARP];
 
 		list_for_each_entry_safe(buf, next, &buffers->list, list) {
 			ret = iris_destroy_internal_buffer(inst, buf);
@@ -537,8 +584,13 @@ static int iris_release_input_internal_buffers(struct iris_inst *inst)
 	u32 internal_buffer_count, i;
 	int ret;
 
-	internal_buf_type = platform_data->dec_ip_int_buf_tbl;
-	internal_buffer_count = platform_data->dec_ip_int_buf_tbl_size;
+	if (inst->domain == DECODER) {
+		internal_buf_type = platform_data->dec_ip_int_buf_tbl;
+		internal_buffer_count = platform_data->dec_ip_int_buf_tbl_size;
+	} else {
+		internal_buf_type = platform_data->enc_ip_int_buf_tbl;
+		internal_buffer_count = platform_data->enc_ip_int_buf_tbl_size;
+	}
 
 	for (i = 0; i < internal_buffer_count; i++) {
 		ret = iris_release_internal_buffers(inst, internal_buf_type[i]);
@@ -549,9 +601,9 @@ static int iris_release_input_internal_buffers(struct iris_inst *inst)
 	return 0;
 }
 
-int iris_alloc_and_queue_persist_bufs(struct iris_inst *inst)
+int iris_alloc_and_queue_persist_bufs(struct iris_inst *inst, enum iris_buffer_type buffer_type)
 {
-	struct iris_buffers *buffers = &inst->buffers[BUF_PERSIST];
+	struct iris_buffers *buffers = &inst->buffers[buffer_type];
 	struct iris_buffer *buffer, *next;
 	int ret;
 	u32 i;
@@ -559,10 +611,10 @@ int iris_alloc_and_queue_persist_bufs(struct iris_inst *inst)
 	if (!list_empty(&buffers->list))
 		return 0;
 
-	iris_fill_internal_buf_info(inst, BUF_PERSIST);
+	iris_fill_internal_buf_info(inst, buffer_type);
 
 	for (i = 0; i < buffers->min_count; i++) {
-		ret = iris_create_internal_buffer(inst, BUF_PERSIST, i);
+		ret = iris_create_internal_buffer(inst, buffer_type, i);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_buffer.h b/drivers/media/platform/qcom/iris/iris_buffer.h
index b9b011faa13ae72e08545c191cdcc2f1bcaf9e0a..0f7a16597dfa68827d5ed25150f9082052d08fb0 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.h
+++ b/drivers/media/platform/qcom/iris/iris_buffer.h
@@ -38,6 +38,8 @@ enum iris_buffer_type {
 	BUF_DPB,
 	BUF_PERSIST,
 	BUF_SCRATCH_1,
+	BUF_SCRATCH_2,
+	BUF_VPSS,
 	BUF_TYPE_MAX,
 };
 
@@ -109,7 +111,7 @@ int iris_queue_internal_deferred_buffers(struct iris_inst *inst, enum iris_buffe
 int iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buffer);
 int iris_destroy_all_internal_buffers(struct iris_inst *inst, u32 plane);
 int iris_destroy_dequeued_internal_buffers(struct iris_inst *inst, u32 plane);
-int iris_alloc_and_queue_persist_bufs(struct iris_inst *inst);
+int iris_alloc_and_queue_persist_bufs(struct iris_inst *inst, enum iris_buffer_type buf_type);
 int iris_alloc_and_queue_input_int_bufs(struct iris_inst *inst);
 int iris_queue_buffer(struct iris_inst *inst, struct iris_buffer *buf);
 int iris_queue_deferred_buffers(struct iris_inst *inst, enum iris_buffer_type buf_type);
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index a575d618a341cceb5b06257466994544a5e61862..e4c9694e29a2a6c5ab4d31184c5e000ffc417390 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -21,6 +21,10 @@ static u32 iris_hfi_gen1_buf_type_from_driver(enum iris_buffer_type buffer_type)
 		return HFI_BUFFER_INTERNAL_SCRATCH;
 	case BUF_SCRATCH_1:
 		return HFI_BUFFER_INTERNAL_SCRATCH_1;
+	case BUF_SCRATCH_2:
+		return HFI_BUFFER_INTERNAL_SCRATCH_2;
+	case BUF_ARP:
+		return HFI_BUFFER_INTERNAL_PERSIST;
 	default:
 		return -EINVAL;
 	}
@@ -363,6 +367,8 @@ static int iris_hfi_gen1_session_queue_buffer(struct iris_inst *inst, struct iri
 	case BUF_PERSIST:
 	case BUF_BIN:
 	case BUF_SCRATCH_1:
+	case BUF_SCRATCH_2:
+	case BUF_ARP:
 		return iris_hfi_gen1_queue_internal_buffer(inst, buf);
 	default:
 		return -EINVAL;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index 6ce166fb42c7ae4823f88d7303d651752018ea2d..e96e09f08e62bd56ab639b94d2b9a469554c544c 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -74,9 +74,11 @@
 #define HFI_BUFFER_INPUT				0x1
 #define HFI_BUFFER_OUTPUT				0x2
 #define HFI_BUFFER_OUTPUT2				0x3
+#define HFI_BUFFER_INTERNAL_PERSIST			0x4
 #define HFI_BUFFER_INTERNAL_PERSIST_1			0x5
 #define HFI_BUFFER_INTERNAL_SCRATCH			0x6
 #define HFI_BUFFER_INTERNAL_SCRATCH_1			0x7
+#define HFI_BUFFER_INTERNAL_SCRATCH_2			0x8
 
 #define HFI_PROPERTY_SYS_CODEC_POWER_PLANE_CTRL		0x5
 #define HFI_PROPERTY_SYS_IMAGE_VERSION			0x6
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 4cdceca3f8a05a6ec9ad76e7cbaa138daba0e958..c71be09211bdc41fdb38551a6c416d1d252bec56 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -111,21 +111,40 @@ static u32 iris_hfi_gen2_get_port(struct iris_inst *inst, u32 plane)
 	}
 }
 
-static u32 iris_hfi_gen2_get_port_from_buf_type(enum iris_buffer_type buffer_type)
+static u32 iris_hfi_gen2_get_port_from_buf_type(struct iris_inst *inst,
+						enum iris_buffer_type buffer_type)
 {
-	switch (buffer_type) {
-	case BUF_INPUT:
-	case BUF_BIN:
-	case BUF_COMV:
-	case BUF_NON_COMV:
-	case BUF_LINE:
-		return HFI_PORT_BITSTREAM;
-	case BUF_OUTPUT:
-	case BUF_DPB:
-		return HFI_PORT_RAW;
-	case BUF_PERSIST:
-	default:
-		return HFI_PORT_NONE;
+	if (inst->domain == DECODER) {
+		switch (buffer_type) {
+		case BUF_INPUT:
+		case BUF_BIN:
+		case BUF_COMV:
+		case BUF_NON_COMV:
+		case BUF_LINE:
+			return HFI_PORT_BITSTREAM;
+		case BUF_OUTPUT:
+		case BUF_DPB:
+			return HFI_PORT_RAW;
+		case BUF_PERSIST:
+		default:
+			return HFI_PORT_NONE;
+		}
+	} else {
+		switch (buffer_type) {
+		case BUF_INPUT:
+		case BUF_VPSS:
+			return HFI_PORT_RAW;
+		case BUF_OUTPUT:
+		case BUF_BIN:
+		case BUF_COMV:
+		case BUF_NON_COMV:
+		case BUF_LINE:
+		case BUF_SCRATCH_2:
+			return HFI_PORT_BITSTREAM;
+		case BUF_ARP:
+		default:
+			return HFI_PORT_NONE;
+		}
 	}
 }
 
@@ -1040,9 +1059,14 @@ static u32 iris_hfi_gen2_buf_type_from_driver(enum iris_buffer_type buffer_type)
 	case BUF_LINE:
 		return HFI_BUFFER_LINE;
 	case BUF_DPB:
+	case BUF_SCRATCH_2:
 		return HFI_BUFFER_DPB;
 	case BUF_PERSIST:
 		return HFI_BUFFER_PERSIST;
+	case BUF_ARP:
+		return HFI_BUFFER_ARP;
+	case BUF_VPSS:
+		return HFI_BUFFER_VPSS;
 	default:
 		return 0;
 	}
@@ -1098,7 +1122,7 @@ static int iris_hfi_gen2_session_queue_buffer(struct iris_inst *inst, struct iri
 			return ret;
 	}
 
-	port = iris_hfi_gen2_get_port_from_buf_type(buffer->type);
+	port = iris_hfi_gen2_get_port_from_buf_type(inst, buffer->type);
 	iris_hfi_gen2_packet_session_command(inst,
 					     HFI_CMD_BUFFER,
 					     HFI_HOST_FLAGS_INTR_REQUIRED,
@@ -1120,7 +1144,7 @@ static int iris_hfi_gen2_session_release_buffer(struct iris_inst *inst, struct i
 
 	iris_hfi_gen2_get_buffer(buffer, &hfi_buffer);
 	hfi_buffer.flags |= HFI_BUF_HOST_FLAG_RELEASE;
-	port = iris_hfi_gen2_get_port_from_buf_type(buffer->type);
+	port = iris_hfi_gen2_get_port_from_buf_type(inst, buffer->type);
 
 	iris_hfi_gen2_packet_session_command(inst,
 					     HFI_CMD_BUFFER,
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index 4e4fae2359ccf210186397a417049208728b5d53..6b8e637ac6d82aee8699db59ee2f04de9e715275 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -29,7 +29,8 @@ struct iris_hfi_gen2_packet_handle {
 	int (*handle)(struct iris_inst *inst, struct iris_hfi_packet *pkt);
 };
 
-static u32 iris_hfi_gen2_buf_type_to_driver(enum hfi_buffer_type buf_type)
+static u32 iris_hfi_gen2_buf_type_to_driver(struct iris_inst *inst,
+					    enum hfi_buffer_type buf_type)
 {
 	switch (buf_type) {
 	case HFI_BUFFER_BITSTREAM:
@@ -47,7 +48,10 @@ static u32 iris_hfi_gen2_buf_type_to_driver(enum hfi_buffer_type buf_type)
 	case HFI_BUFFER_LINE:
 		return BUF_LINE;
 	case HFI_BUFFER_DPB:
-		return BUF_DPB;
+		if (inst->domain == DECODER)
+			return BUF_DPB;
+		else
+			return BUF_SCRATCH_2;
 	case HFI_BUFFER_PERSIST:
 		return BUF_PERSIST;
 	default:
@@ -421,7 +425,7 @@ static void iris_hfi_gen2_handle_dequeue_buffers(struct iris_inst *inst)
 static int iris_hfi_gen2_handle_release_internal_buffer(struct iris_inst *inst,
 							struct iris_hfi_buffer *buffer)
 {
-	u32 buf_type = iris_hfi_gen2_buf_type_to_driver(buffer->type);
+	u32 buf_type = iris_hfi_gen2_buf_type_to_driver(inst, buffer->type);
 	struct iris_buffers *buffers = &inst->buffers[buf_type];
 	struct iris_buffer *buf, *iter;
 	bool found = false;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index f89dcd3347d8c95c14cee6192dfa91389da69d37..65cee5711b98538c14f15d3db9d47b402d2e9562 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -246,6 +246,10 @@ struct iris_platform_data {
 	unsigned int dec_ip_int_buf_tbl_size;
 	const u32 *dec_op_int_buf_tbl;
 	unsigned int dec_op_int_buf_tbl_size;
+	const u32 *enc_ip_int_buf_tbl;
+	unsigned int enc_ip_int_buf_tbl_size;
+	const u32 *enc_op_int_buf_tbl;
+	unsigned int enc_op_int_buf_tbl_size;
 };
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 8c0dd09c592df1c679e3e98590ba1b430c6d21c9..03ffc9abadba6b8ba2016e59d638f1c98bca1f6a 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -706,6 +706,14 @@ static const u32 sm8550_dec_op_int_buf_tbl[] = {
 	BUF_DPB,
 };
 
+static const u32 sm8550_enc_op_int_buf_tbl[] = {
+	BUF_BIN,
+	BUF_COMV,
+	BUF_NON_COMV,
+	BUF_LINE,
+	BUF_SCRATCH_2,
+};
+
 struct iris_platform_data sm8550_data = {
 	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
@@ -783,6 +791,9 @@ struct iris_platform_data sm8550_data = {
 	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
 	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
 	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
+
+	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
+	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
 };
 
 /*
@@ -871,6 +882,9 @@ struct iris_platform_data sm8650_data = {
 	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
 	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
 	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
+
+	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
+	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
 };
 
 /*
@@ -955,4 +969,7 @@ struct iris_platform_data qcs8300_data = {
 	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
 	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
 	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
+
+	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
+	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
 };
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
index cd09442be9675af9674f74679932285d3c0197c1..a3dc74f299e3eab88175ebfca95b31a03efda250 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
@@ -318,6 +318,12 @@ static const u32 sm8250_dec_op_int_buf_tbl[] = {
 	BUF_DPB,
 };
 
+static const u32 sm8250_enc_ip_int_buf_tbl[] = {
+	BUF_BIN,
+	BUF_SCRATCH_1,
+	BUF_SCRATCH_2,
+};
+
 struct iris_platform_data sm8250_data = {
 	.get_instance = iris_hfi_gen1_get_instance,
 	.init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
@@ -363,4 +369,7 @@ struct iris_platform_data sm8250_data = {
 	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_ip_int_buf_tbl),
 	.dec_op_int_buf_tbl = sm8250_dec_op_int_buf_tbl,
 	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_op_int_buf_tbl),
+
+	.enc_ip_int_buf_tbl = sm8250_enc_ip_int_buf_tbl,
+	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index f091ef45d2a5f93db066dd13afff42b26e8b0155..86b5364651f587f92abcbef7b2f2a2c73f21b6b8 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -321,7 +321,7 @@ int iris_vdec_streamon_input(struct iris_inst *inst)
 	if (ret)
 		return ret;
 
-	ret = iris_alloc_and_queue_persist_bufs(inst);
+	ret = iris_alloc_and_queue_persist_bufs(inst, BUF_PERSIST);
 	if (ret)
 		return ret;
 
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index 4b0da51e0477ab00019396242be9fd585c11ded3..bd5e8fc2d48882c4fd57607a0ce5183c65272cf9 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -435,6 +435,24 @@ int iris_venc_streamon_input(struct iris_inst *inst)
 	if (ret)
 		return ret;
 
+	ret = iris_alloc_and_queue_persist_bufs(inst, BUF_ARP);
+	if (ret)
+		return ret;
+
+	iris_get_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+
+	ret = iris_destroy_dequeued_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+	if (ret)
+		return ret;
+
+	ret = iris_create_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+	if (ret)
+		return ret;
+
+	ret = iris_queue_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+	if (ret)
+		return ret;
+
 	return iris_process_streamon_input(inst);
 }
 
@@ -446,6 +464,24 @@ int iris_venc_streamon_output(struct iris_inst *inst)
 	if (ret)
 		goto error;
 
+	ret = iris_alloc_and_queue_persist_bufs(inst, BUF_ARP);
+	if (ret)
+		return ret;
+
+	iris_get_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+
+	ret = iris_destroy_dequeued_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	if (ret)
+		goto error;
+
+	ret = iris_create_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	if (ret)
+		goto error;
+
+	ret = iris_queue_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	if (ret)
+		goto error;
+
 	ret = iris_process_streamon_output(inst);
 	if (ret)
 		goto error;
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index be8688140fd22ffd02e8c286bfc5f62e050ceb5b..c2b86bb4c7d42aee8ecf2f8b9ef0015d06e82b04 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -176,6 +176,8 @@ int iris_open(struct file *filp)
 	INIT_LIST_HEAD(&inst->buffers[BUF_DPB].list);
 	INIT_LIST_HEAD(&inst->buffers[BUF_PERSIST].list);
 	INIT_LIST_HEAD(&inst->buffers[BUF_SCRATCH_1].list);
+	INIT_LIST_HEAD(&inst->buffers[BUF_SCRATCH_2].list);
+	INIT_LIST_HEAD(&inst->buffers[BUF_VPSS].list);
 	init_completion(&inst->completion);
 	init_completion(&inst->flush_completion);
 
@@ -266,7 +268,10 @@ static void iris_check_num_queued_internal_buffers(struct iris_inst *inst, u32 p
 				count, internal_buf_type[i]);
 	}
 
-	buffers = &inst->buffers[BUF_PERSIST];
+	if (inst->domain == DECODER)
+		buffers = &inst->buffers[BUF_PERSIST];
+	else
+		buffers = &inst->buffers[BUF_ARP];
 
 	count = 0;
 	list_for_each_entry_safe(buf, next, &buffers->list, list)
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index 06d5afc3c641f0dfca3967e55273c4fa2614fdff..25974cb3870336e68cd18e472af54ab5fb348dd5 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -5,6 +5,14 @@
 
 #include "iris_instance.h"
 #include "iris_vpu_buffer.h"
+#include "iris_hfi_gen1_defines.h"
+#include "iris_hfi_gen2_defines.h"
+
+#define HFI_MAX_COL_FRAME 6
+
+#ifndef SYSTEM_LAL_TILE10
+#define SYSTEM_LAL_TILE10 192
+#endif
 
 static u32 size_h264d_hw_bin_buffer(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
 {
@@ -548,6 +556,812 @@ static u32 iris_vpu_dec_scratch1_size(struct iris_inst *inst)
 		iris_vpu_dec_line_size(inst);
 }
 
+static inline
+u32 size_enc_single_pipe(u32 rc_type, u32 bitbin_size, u32 num_vpp_pipes,
+			 u32 frame_width, u32 frame_height, u32 lcu_size)
+{
+	u32 size_aligned_height = ALIGN((frame_height), lcu_size);
+	u32 size_aligned_width = ALIGN((frame_width), lcu_size);
+	u32 size_single_pipe_eval = 0, sao_bin_buffer_size = 0;
+	u32 padded_bin_sz;
+
+	if ((size_aligned_width * size_aligned_height) > (3840 * 2160))
+		size_single_pipe_eval = (bitbin_size / num_vpp_pipes);
+	else if (num_vpp_pipes > 2)
+		size_single_pipe_eval = bitbin_size / 2;
+	else
+		size_single_pipe_eval = bitbin_size;
+
+	sao_bin_buffer_size = (64 * ((((frame_width) + 32) * ((frame_height) + 32)) >> 10)) + 384;
+	padded_bin_sz = ALIGN(size_single_pipe_eval, 256);
+	size_single_pipe_eval = sao_bin_buffer_size + padded_bin_sz;
+
+	return ALIGN(size_single_pipe_eval, 256);
+}
+
+static inline u32 size_bin_bitstream_enc(u32 width, u32 height,
+					 u32 rc_type)
+{
+	u32 aligned_height = ALIGN(height, 32);
+	u32 aligned_width = ALIGN(width, 32);
+	u32 frame_size = width * height * 3;
+	u32 mbs_per_frame;
+
+	/*
+	 * Encoder output size calculation: 32 Align width/height
+	 * For resolution < 720p : YUVsize * 4
+	 * For resolution > 720p & <= 4K : YUVsize / 2
+	 * For resolution > 4k : YUVsize / 4
+	 * Initially frame_size = YUVsize * 2;
+	 */
+
+	mbs_per_frame = (ALIGN(aligned_height, 16) * ALIGN(aligned_width, 16)) / 256;
+
+	if (mbs_per_frame < NUM_MBS_720P)
+		frame_size = frame_size << 1;
+	else if (mbs_per_frame <= NUM_MBS_4K)
+		frame_size = frame_size >> 2;
+	else
+		frame_size = frame_size >> 3;
+
+	if (rc_type == HFI_RATE_CONTROL_OFF || rc_type == HFI_RATE_CONTROL_CQ)
+		frame_size = frame_size << 1;
+
+	/*
+	 * In case of opaque color format bitdepth will be known
+	 * with first ETB, buffers allocated already with 8 bit
+	 * won't be sufficient for 10 bit
+	 * calculate size considering 10-bit by default
+	 * For 10-bit cases size = size * 1.25
+	 */
+	frame_size *= 5;
+	frame_size /= 4;
+
+	return ALIGN(frame_size, SZ_4K);
+}
+
+static inline u32 hfi_buffer_bin_enc(u32 width, u32 height,
+				     u32 work_mode, u32 lcu_size,
+				     u32 num_vpp_pipes, u32 rc_type)
+{
+	u32 sao_bin_buffer_size, padded_bin_size, bitstream_size;
+	u32 total_bitbin_buffers, size_single_pipe, bitbin_size;
+	u32 aligned_height = ALIGN(height, lcu_size);
+	u32 aligned_width = ALIGN(width, lcu_size);
+
+	bitstream_size = size_bin_bitstream_enc(width, height, rc_type);
+	bitstream_size = ALIGN(bitstream_size, 256);
+
+	if (work_mode == STAGE_2) {
+		total_bitbin_buffers = 3;
+		bitbin_size = bitstream_size * 17 / 10;
+		bitbin_size = ALIGN(bitbin_size, 256);
+	} else {
+		total_bitbin_buffers = 1;
+		bitstream_size = aligned_width * aligned_height * 3;
+		bitbin_size = ALIGN(bitstream_size, 256);
+	}
+
+	if (num_vpp_pipes > 2)
+		size_single_pipe = bitbin_size / 2;
+	else
+		size_single_pipe = bitbin_size;
+
+	size_single_pipe = ALIGN(size_single_pipe, 256);
+	sao_bin_buffer_size = (64 * (((width + 32) * (height + 32)) >> 10)) + 384;
+	padded_bin_size = ALIGN(size_single_pipe, 256);
+	size_single_pipe = sao_bin_buffer_size + padded_bin_size;
+	size_single_pipe = ALIGN(size_single_pipe, 256);
+	bitbin_size = size_single_pipe * num_vpp_pipes;
+
+	return ALIGN(bitbin_size, 256) * total_bitbin_buffers + 512;
+}
+
+static u32 iris_vpu_enc_bin_size(struct iris_inst *inst)
+{
+	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
+	u32 stage = inst->fw_caps[STAGE].value;
+	struct v4l2_format *f = inst->fmt_dst;
+	u32 height = f->fmt.pix_mp.height;
+	u32 width = f->fmt.pix_mp.width;
+	u32 lcu_size;
+
+	if (inst->codec == V4L2_PIX_FMT_HEVC)
+		lcu_size = 32;
+	else
+		lcu_size = 16;
+
+	return hfi_buffer_bin_enc(width, height, stage, lcu_size,
+				  num_vpp_pipes, inst->hfi_rc_type);
+}
+
+static inline
+u32 hfi_buffer_comv_enc(u32 frame_width, u32 frame_height, u32 lcu_size,
+			u32 num_recon, u32 standard)
+{
+	u32 height_in_lcus = ((frame_height) + (lcu_size) - 1) / (lcu_size);
+	u32 width_in_lcus = ((frame_width) + (lcu_size) - 1) / (lcu_size);
+	u32 num_lcu_in_frame = width_in_lcus * height_in_lcus;
+	u32 mb_height = ((frame_height) + 15) >> 4;
+	u32 mb_width = ((frame_width) + 15) >> 4;
+	u32 size_colloc_mv, size_colloc_rc;
+
+	size_colloc_mv = (standard == HFI_CODEC_ENCODE_HEVC) ?
+		(16 * ((num_lcu_in_frame << 2) + 32)) :
+		(3 * 16 * (width_in_lcus * height_in_lcus + 32));
+	size_colloc_mv = ALIGN(size_colloc_mv, 256) * num_recon;
+	size_colloc_rc = (((mb_width + 7) >> 3) * 16 * 2 * mb_height);
+	size_colloc_rc = ALIGN(size_colloc_rc, 256) * HFI_MAX_COL_FRAME;
+
+	return size_colloc_mv + size_colloc_rc;
+}
+
+static u32 iris_vpu_enc_comv_size(struct iris_inst *inst)
+{
+	struct v4l2_format *f = inst->fmt_dst;
+	u32 height = f->fmt.pix_mp.height;
+	u32 width = f->fmt.pix_mp.width;
+	u32 num_recon = 1;
+	u32 lcu_size = 16;
+
+	if (inst->codec == V4L2_PIX_FMT_HEVC) {
+		lcu_size = 32;
+		return hfi_buffer_comv_enc(width, height, lcu_size,
+					   num_recon + 1, HFI_CODEC_ENCODE_HEVC);
+	}
+
+	return hfi_buffer_comv_enc(width, height, lcu_size,
+				   num_recon + 1, HFI_CODEC_ENCODE_AVC);
+}
+
+static inline
+u32 size_frame_rc_buf_size(u32 standard, u32 frame_height_coded,
+			   u32 num_vpp_pipes_enc)
+{
+	u32 size = 0;
+
+	size = (standard == HFI_CODEC_ENCODE_HEVC) ?
+		(256 + 16 * (14 + ((((frame_height_coded) >> 5) + 7) >> 3))) :
+		(256 + 16 * (14 + ((((frame_height_coded) >> 4) + 7) >> 3)));
+	size *= 11;
+
+	if (num_vpp_pipes_enc > 1)
+		size = ALIGN(size, 256) * num_vpp_pipes_enc;
+
+	return ALIGN(size, 512) * HFI_MAX_COL_FRAME;
+}
+
+static inline
+u32 size_enc_slice_info_buf(u32 num_lcu_in_frame)
+{
+	return ALIGN((256 + (num_lcu_in_frame << 4)), 256);
+}
+
+static inline u32 enc_bitcnt_buf_size(u32 num_lcu_in_frame)
+{
+	return ALIGN((256 + (4 * (num_lcu_in_frame))), 256);
+}
+
+static inline u32 enc_bitmap_buf_size(u32 num_lcu_in_frame)
+{
+	return ALIGN((256 + ((num_lcu_in_frame) >> 3)), 256);
+}
+
+static inline u32 size_override_buf(u32 num_lcumb)
+{
+	return ALIGN(((16 * (((num_lcumb) + 7) >> 3))), 256) * 2;
+}
+
+static inline u32 size_ir_buf(u32 num_lcu_in_frame)
+{
+	return ALIGN((((((num_lcu_in_frame) << 1) + 7) & (~7)) * 3), 256);
+}
+
+static inline
+u32 size_linebuff_data(bool is_ten_bit, u32 frame_width_coded)
+{
+	return is_ten_bit ?
+		(((((10 * (frame_width_coded) + 1024) + (256 - 1)) &
+		   (~(256 - 1))) * 1) +
+		 (((((10 * (frame_width_coded) + 1024) >> 1) + (256 - 1)) &
+		   (~(256 - 1))) * 2)) :
+		(((((8 * (frame_width_coded) + 1024) + (256 - 1)) &
+		   (~(256 - 1))) * 1) +
+		 (((((8 * (frame_width_coded) + 1024) >> 1) + (256 - 1)) &
+		   (~(256 - 1))) * 2));
+}
+
+static inline
+u32 size_left_linebuff_ctrl(u32 standard, u32 frame_height_coded,
+			    u32 num_vpp_pipes_enc)
+{
+	u32 size = 0;
+
+	size = standard == HFI_CODEC_ENCODE_HEVC ?
+		(((frame_height_coded) +
+		 (32)) / 32 * 4 * 16) :
+		(((frame_height_coded) + 15) / 16 * 5 * 16);
+
+	if ((num_vpp_pipes_enc) > 1) {
+		size += 512;
+		size = ALIGN(size, 512) *
+			num_vpp_pipes_enc;
+	}
+
+	return ALIGN(size, 256);
+}
+
+static inline
+u32 size_left_linebuff_recon_pix(bool is_ten_bit, u32 frame_height_coded,
+				 u32 num_vpp_pipes_enc)
+{
+	return (((is_ten_bit + 1) * 2 * (frame_height_coded) + 256) +
+		(256 << (num_vpp_pipes_enc - 1)) - 1) &
+		(~((256 << (num_vpp_pipes_enc - 1)) - 1)) * 1;
+}
+
+static inline
+u32 size_top_linebuff_ctrl_fe(u32 frame_width_coded, u32 standard)
+{
+	return standard == HFI_CODEC_ENCODE_HEVC ?
+		ALIGN((64 * ((frame_width_coded) >> 5)), 256) :
+		ALIGN((256 + 16 * ((frame_width_coded) >> 4)), 256);
+}
+
+static inline
+u32 size_left_linebuff_ctrl_fe(u32 frame_height_coded, u32 num_vpp_pipes_enc)
+{
+	return (((256 + 64 * ((frame_height_coded) >> 4)) +
+		 (256 << (num_vpp_pipes_enc - 1)) - 1) &
+		 (~((256 << (num_vpp_pipes_enc - 1)) - 1)) * 1) *
+		num_vpp_pipes_enc;
+}
+
+static inline
+u32 size_left_linebuff_metadata_recon_y(u32 frame_height_coded,
+					bool is_ten_bit,
+					u32 num_vpp_pipes_enc)
+{
+	return ALIGN(((256 + 64 * ((frame_height_coded) /
+		  (8 * (is_ten_bit ? 4 : 8))))), 256) * num_vpp_pipes_enc;
+}
+
+static inline
+u32 size_left_linebuff_metadata_recon_uv(u32 frame_height_coded,
+					 bool is_ten_bit,
+					 u32 num_vpp_pipes_enc)
+{
+	return ALIGN(((256 + 64 * ((frame_height_coded) /
+		  (4 * (is_ten_bit ? 4 : 8))))), 256) * num_vpp_pipes_enc;
+}
+
+static inline
+u32 size_linebuff_recon_pix(bool is_ten_bit, u32 frame_width_coded)
+{
+	return ALIGN(((is_ten_bit ? 3 : 2) * (frame_width_coded)), 256);
+}
+
+static inline
+u32 size_line_buf_ctrl(u32 frame_width_coded)
+{
+	return ALIGN(frame_width_coded, 256);
+}
+
+static inline
+u32 size_line_buf_ctrl_id2(u32 frame_width_coded)
+{
+	return ALIGN(frame_width_coded, 256);
+}
+
+static inline u32 size_line_buf_sde(u32 frame_width_coded)
+{
+	return ALIGN((256 + (16 * ((frame_width_coded) >> 4))), 256);
+}
+
+static inline
+u32 size_vpss_line_buf(u32 num_vpp_pipes_enc, u32 frame_height_coded,
+		       u32 frame_width_coded)
+{
+	return ALIGN(((((((8192) >> 2) << 5) * (num_vpp_pipes_enc)) + 64) +
+		      (((((max_t(u32, (frame_width_coded),
+				 (frame_height_coded)) + 3) >> 2) << 5) + 256) * 16)), 256);
+}
+
+static inline
+u32 size_top_line_buf_first_stg_sao(u32 frame_width_coded)
+{
+	return ALIGN((16 * ((frame_width_coded) >> 5)), 256);
+}
+
+static inline
+u32 size_enc_ref_buffer(u32 frame_width, u32 frame_height)
+{
+	u32 u_chroma_buffer_height = ALIGN(frame_height >> 1, 32);
+	u32 u_buffer_height = ALIGN(frame_height, 32);
+	u32 u_buffer_width = ALIGN(frame_width, 32);
+
+	return (u_buffer_height + u_chroma_buffer_height) * u_buffer_width;
+}
+
+static inline
+u32 size_enc_ten_bit_ref_buffer(u32 frame_width, u32 frame_height)
+{
+	u32 ref_luma_stride_in_bytes = ((frame_width + SYSTEM_LAL_TILE10 - 1) / SYSTEM_LAL_TILE10) *
+		SYSTEM_LAL_TILE10;
+	u32 ref_buf_height = (frame_height + (32 - 1)) & (~(32 - 1));
+	u32 u_ref_stride, luma_size;
+	u32 ref_chrm_height_in_bytes;
+	u32 chroma_size;
+
+	u_ref_stride = 4 * (ref_luma_stride_in_bytes / 3);
+	u_ref_stride = (u_ref_stride + (128 - 1)) & (~(128 - 1));
+	luma_size = ref_buf_height * u_ref_stride;
+	luma_size = (luma_size + (4096 - 1)) & (~(4096 - 1));
+
+	ref_chrm_height_in_bytes = (((frame_height + 1) >> 1) + (32 - 1)) & (~(32 - 1));
+	chroma_size = u_ref_stride * ref_chrm_height_in_bytes;
+	chroma_size = (chroma_size + (4096 - 1)) & (~(4096 - 1));
+
+	return luma_size + chroma_size;
+}
+
+static inline
+u32 hfi_ubwc_calc_metadata_plane_stride(u32 frame_width,
+					u32 metadata_stride_multiple,
+					u32 tile_width_in_pels)
+{
+	return ALIGN(((frame_width + (tile_width_in_pels - 1)) / tile_width_in_pels),
+		     metadata_stride_multiple);
+}
+
+static inline
+u32 hfi_ubwc_metadata_plane_bufheight(u32 frame_height,
+				      u32 metadata_height_multiple,
+				      u32 tile_height_in_pels)
+{
+	return ALIGN(((frame_height + (tile_height_in_pels - 1)) / tile_height_in_pels),
+		     metadata_height_multiple);
+}
+
+static inline
+u32 hfi_ubwc_metadata_plane_buffer_size(u32 _metadata_tride, u32 _metadata_buf_height)
+{
+	return ALIGN(_metadata_tride * _metadata_buf_height, 4096);
+}
+
+static inline
+u32 hfi_buffer_non_comv_enc(u32 frame_width, u32 frame_height,
+			    u32 num_vpp_pipes_enc, u32 lcu_size, u32 standard)
+{
+	u32 height_in_lcus = ((frame_height) + (lcu_size) - 1) / (lcu_size);
+	u32 width_in_lcus = ((frame_width) + (lcu_size) - 1) / (lcu_size);
+	u32 num_lcu_in_frame = width_in_lcus * height_in_lcus;
+	u32 frame_height_coded = height_in_lcus * (lcu_size);
+	u32 frame_width_coded = width_in_lcus * (lcu_size);
+	u32 num_lcumb, frame_rc_buf_size;
+
+	num_lcumb = (frame_height_coded / lcu_size) *
+		((frame_width_coded + lcu_size * 8) / lcu_size);
+	frame_rc_buf_size = size_frame_rc_buf_size(standard, frame_height_coded,
+						   num_vpp_pipes_enc);
+	return size_enc_slice_info_buf(num_lcu_in_frame) +
+		SIZE_SLICE_CMD_BUFFER +
+		SIZE_SPS_PPS_SLICE_HDR +
+		frame_rc_buf_size +
+		enc_bitcnt_buf_size(num_lcu_in_frame) +
+		enc_bitmap_buf_size(num_lcu_in_frame) +
+		SIZE_BSE_SLICE_CMD_BUF +
+		SIZE_LAMBDA_LUT +
+		size_override_buf(num_lcumb) +
+		size_ir_buf(num_lcu_in_frame);
+}
+
+static u32 iris_vpu_enc_non_comv_size(struct iris_inst *inst)
+{
+	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
+	struct v4l2_format *f = inst->fmt_dst;
+	u32 height = f->fmt.pix_mp.height;
+	u32 width = f->fmt.pix_mp.width;
+	u32 lcu_size = 16;
+
+	if (inst->codec == V4L2_PIX_FMT_HEVC) {
+		lcu_size = 32;
+		return hfi_buffer_non_comv_enc(width, height, num_vpp_pipes,
+					       lcu_size, HFI_CODEC_ENCODE_HEVC);
+	}
+
+	return hfi_buffer_non_comv_enc(width, height, num_vpp_pipes,
+				       lcu_size, HFI_CODEC_ENCODE_AVC);
+}
+
+static inline
+u32 hfi_buffer_line_enc(u32 frame_width, u32 frame_height, bool is_ten_bit,
+			u32 num_vpp_pipes_enc, u32 lcu_size, u32 standard)
+{
+	u32 width_in_lcus = ((frame_width) + (lcu_size) - 1) / (lcu_size);
+	u32 height_in_lcus = ((frame_height) + (lcu_size) - 1) / (lcu_size);
+	u32 frame_height_coded = height_in_lcus * (lcu_size);
+	u32 frame_width_coded = width_in_lcus * (lcu_size);
+	u32 line_buff_data_size, left_line_buff_ctrl_size;
+	u32 left_line_buff_metadata_recon__uv__size;
+	u32 left_line_buff_metadata_recon__y__size;
+	u32 left_line_buff_recon_pix_size;
+	u32 top_line_buff_ctrl_fe_size;
+	u32 line_buff_recon_pix_size;
+
+	line_buff_data_size = size_linebuff_data(is_ten_bit, frame_width_coded);
+	left_line_buff_ctrl_size =
+		size_left_linebuff_ctrl(standard, frame_height_coded, num_vpp_pipes_enc);
+	left_line_buff_recon_pix_size =
+		size_left_linebuff_recon_pix(is_ten_bit, frame_height_coded,
+					     num_vpp_pipes_enc);
+	top_line_buff_ctrl_fe_size =
+		size_top_linebuff_ctrl_fe(frame_width_coded, standard);
+	left_line_buff_metadata_recon__y__size =
+		size_left_linebuff_metadata_recon_y(frame_height_coded, is_ten_bit,
+						    num_vpp_pipes_enc);
+	left_line_buff_metadata_recon__uv__size =
+		size_left_linebuff_metadata_recon_uv(frame_height_coded, is_ten_bit,
+						     num_vpp_pipes_enc);
+	line_buff_recon_pix_size = size_linebuff_recon_pix(is_ten_bit, frame_width_coded);
+
+	return size_line_buf_ctrl(frame_width_coded) +
+		size_line_buf_ctrl_id2(frame_width_coded) +
+		line_buff_data_size +
+		left_line_buff_ctrl_size +
+		left_line_buff_recon_pix_size +
+		top_line_buff_ctrl_fe_size +
+		left_line_buff_metadata_recon__y__size +
+		left_line_buff_metadata_recon__uv__size +
+		line_buff_recon_pix_size +
+		size_left_linebuff_ctrl_fe(frame_height_coded, num_vpp_pipes_enc) +
+		size_line_buf_sde(frame_width_coded) +
+		size_vpss_line_buf(num_vpp_pipes_enc, frame_height_coded, frame_width_coded) +
+		size_top_line_buf_first_stg_sao(frame_width_coded);
+}
+
+static u32 iris_vpu_enc_line_size(struct iris_inst *inst)
+{
+	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
+	struct v4l2_format *f = inst->fmt_dst;
+	u32 height = f->fmt.pix_mp.height;
+	u32 width = f->fmt.pix_mp.width;
+	u32 lcu_size = 16;
+
+	if (inst->codec == V4L2_PIX_FMT_HEVC) {
+		lcu_size = 32;
+		return hfi_buffer_line_enc(width, height, 0, num_vpp_pipes,
+					   lcu_size, HFI_CODEC_ENCODE_HEVC);
+	}
+
+	return hfi_buffer_line_enc(width, height, 0, num_vpp_pipes,
+				   lcu_size, HFI_CODEC_ENCODE_AVC);
+}
+
+static inline
+u32 hfi_buffer_dpb_enc(u32 frame_width, u32 frame_height, bool is_ten_bit)
+{
+	u32 metadata_stride, metadata_buf_height, meta_size_y, meta_size_c;
+	u32 ten_bit_ref_buf_size = 0, ref_buf_size = 0;
+	u32 size;
+
+	if (!is_ten_bit) {
+		ref_buf_size = size_enc_ref_buffer(frame_width, frame_height);
+		metadata_stride =
+			hfi_ubwc_calc_metadata_plane_stride(frame_width, 64,
+							    HFI_COL_FMT_NV12C_Y_TILE_WIDTH);
+		metadata_buf_height =
+			hfi_ubwc_metadata_plane_bufheight(frame_height, 16,
+							  HFI_COL_FMT_NV12C_Y_TILE_HEIGHT);
+		meta_size_y =
+			hfi_ubwc_metadata_plane_buffer_size(metadata_stride, metadata_buf_height);
+		meta_size_c =
+			hfi_ubwc_metadata_plane_buffer_size(metadata_stride, metadata_buf_height);
+		size = ref_buf_size + meta_size_y + meta_size_c;
+	} else {
+		ten_bit_ref_buf_size = size_enc_ten_bit_ref_buffer(frame_width, frame_height);
+		metadata_stride =
+			hfi_ubwc_calc_metadata_plane_stride(frame_width,
+							    IRIS_METADATA_STRIDE_MULTIPLE,
+							    HFI_COL_FMT_TP10C_Y_TILE_WIDTH);
+		metadata_buf_height =
+			hfi_ubwc_metadata_plane_bufheight(frame_height,
+							  IRIS_METADATA_HEIGHT_MULTIPLE,
+							  HFI_COL_FMT_TP10C_Y_TILE_HEIGHT);
+		meta_size_y =
+			hfi_ubwc_metadata_plane_buffer_size(metadata_stride, metadata_buf_height);
+		meta_size_c =
+			hfi_ubwc_metadata_plane_buffer_size(metadata_stride, metadata_buf_height);
+		size = ten_bit_ref_buf_size + meta_size_y + meta_size_c;
+	}
+
+	return size;
+}
+
+static u32 iris_vpu_enc_arp_size(struct iris_inst *inst)
+{
+	return HFI_BUFFER_ARP_ENC;
+}
+
+inline bool is_scaling_enabled(struct iris_inst *inst)
+{
+	return inst->crop.left != inst->compose.left ||
+		inst->crop.top != inst->compose.top ||
+		inst->crop.width != inst->compose.width ||
+		inst->crop.height != inst->compose.height;
+}
+
+static inline
+u32 hfi_buffer_vpss_enc(u32 dswidth, u32 dsheight, bool ds_enable,
+			u32 blur, bool is_ten_bit)
+{
+	if (ds_enable || blur)
+		return hfi_buffer_dpb_enc(dswidth, dsheight, is_ten_bit);
+
+	return 0;
+}
+
+static inline u32 hfi_buffer_scratch1_enc(u32 frame_width, u32 frame_height,
+					  u32 lcu_size, u32 num_ref,
+					  bool ten_bit, u32 num_vpp_pipes,
+					  bool is_h265)
+{
+	u32 line_buf_ctrl_size, line_buf_data_size, leftline_buf_ctrl_size;
+	u32 line_buf_sde_size, sps_pps_slice_hdr, topline_buf_ctrl_size_FE;
+	u32 leftline_buf_ctrl_size_FE, line_buf_recon_pix_size;
+	u32 leftline_buf_recon_pix_size, lambda_lut_size, override_buffer_size;
+	u32 col_mv_buf_size, vpp_reg_buffer_size, ir_buffer_size;
+	u32 vpss_line_buf, leftline_buf_meta_recony, h265e_colrcbuf_size;
+	u32 h265e_framerc_bufsize, h265e_lcubitcnt_bufsize;
+	u32 h265e_lcubitmap_bufsize, se_stats_bufsize;
+	u32 bse_reg_buffer_size, bse_slice_cmd_buffer_size, slice_info_bufsize;
+	u32 line_buf_ctrl_size_buffid2, slice_cmd_buffer_size;
+	u32 width_lcu_num, height_lcu_num, width_coded, height_coded;
+	u32 frame_num_lcu, linebuf_meta_recon_uv, topline_bufsize_fe_1stg_sao;
+	u32 vpss_line_buffer_size_1;
+	u32 bit_depth, num_lcu_mb;
+
+	width_lcu_num = (frame_width + lcu_size - 1) / lcu_size;
+	height_lcu_num = (frame_height + lcu_size - 1) / lcu_size;
+	frame_num_lcu = width_lcu_num * height_lcu_num;
+	width_coded = width_lcu_num * lcu_size;
+	height_coded = height_lcu_num * lcu_size;
+	num_lcu_mb = (height_coded / lcu_size) *
+		     ((width_coded + lcu_size * 8) / lcu_size);
+	slice_info_bufsize = 256 + (frame_num_lcu << 4);
+	slice_info_bufsize = ALIGN(slice_info_bufsize, 256);
+	line_buf_ctrl_size = ALIGN(width_coded, 256);
+	line_buf_ctrl_size_buffid2 = ALIGN(width_coded, 256);
+
+	bit_depth = ten_bit ? 10 : 8;
+	line_buf_data_size =
+		(((((bit_depth * width_coded + 1024) + (256 - 1)) &
+		   (~(256 - 1))) * 1) +
+		 (((((bit_depth * width_coded + 1024) >> 1) + (256 - 1)) &
+		   (~(256 - 1))) * 2));
+
+	leftline_buf_ctrl_size = is_h265 ? ((height_coded + 32) / 32 * 4 * 16) :
+					   ((height_coded + 15) / 16 * 5 * 16);
+
+	if (num_vpp_pipes > 1) {
+		leftline_buf_ctrl_size += 512;
+		leftline_buf_ctrl_size =
+			ALIGN(leftline_buf_ctrl_size, 512) * num_vpp_pipes;
+	}
+
+	leftline_buf_ctrl_size = ALIGN(leftline_buf_ctrl_size, 256);
+	leftline_buf_recon_pix_size =
+		(((ten_bit + 1) * 2 * (height_coded) + 256) +
+		 (256 << (num_vpp_pipes - 1)) - 1) &
+		(~((256 << (num_vpp_pipes - 1)) - 1)) * 1;
+
+	topline_buf_ctrl_size_FE = is_h265 ? (64 * (width_coded >> 5)) :
+					     (256 + 16 * (width_coded >> 4));
+	topline_buf_ctrl_size_FE = ALIGN(topline_buf_ctrl_size_FE, 256);
+	leftline_buf_ctrl_size_FE =
+		(((256 + 64 * (height_coded >> 4)) +
+		  (256 << (num_vpp_pipes - 1)) - 1) &
+		 (~((256 << (num_vpp_pipes - 1)) - 1)) * 1) *
+		num_vpp_pipes;
+	leftline_buf_meta_recony =
+		(256 + 64 * ((height_coded) / (8 * (ten_bit ? 4 : 8))));
+	leftline_buf_meta_recony = ALIGN(leftline_buf_meta_recony, 256);
+	leftline_buf_meta_recony = leftline_buf_meta_recony * num_vpp_pipes;
+	linebuf_meta_recon_uv =
+		(256 + 64 * ((height_coded) / (4 * (ten_bit ? 4 : 8))));
+	linebuf_meta_recon_uv = ALIGN(linebuf_meta_recon_uv, 256);
+	linebuf_meta_recon_uv = linebuf_meta_recon_uv * num_vpp_pipes;
+	line_buf_recon_pix_size = ((ten_bit ? 3 : 2) * width_coded);
+	line_buf_recon_pix_size = ALIGN(line_buf_recon_pix_size, 256);
+	slice_cmd_buffer_size = ALIGN(20480, 256);
+	sps_pps_slice_hdr = 2048 + 4096;
+	col_mv_buf_size =
+		is_h265 ? (16 * ((frame_num_lcu << 2) + 32)) :
+			  (3 * 16 * (width_lcu_num * height_lcu_num + 32));
+	col_mv_buf_size = ALIGN(col_mv_buf_size, 256) * (num_ref + 1);
+	h265e_colrcbuf_size =
+		(((width_lcu_num + 7) >> 3) * 16 * 2 * height_lcu_num);
+	if (num_vpp_pipes > 1)
+		h265e_colrcbuf_size =
+			ALIGN(h265e_colrcbuf_size, 256) * num_vpp_pipes;
+
+	h265e_colrcbuf_size =
+		ALIGN(h265e_colrcbuf_size, 256) * HFI_MAX_COL_FRAME;
+	h265e_framerc_bufsize =
+		(is_h265) ?
+			(256 + 16 * (14 + (((height_coded >> 5) + 7) >> 3))) :
+			(256 + 16 * (14 + (((height_coded >> 4) + 7) >> 3)));
+	h265e_framerc_bufsize *= 6;
+	if (num_vpp_pipes > 1)
+		h265e_framerc_bufsize =
+			ALIGN(h265e_framerc_bufsize, 256) * num_vpp_pipes;
+
+	h265e_framerc_bufsize =
+		ALIGN(h265e_framerc_bufsize, 512) * HFI_MAX_COL_FRAME;
+	h265e_lcubitcnt_bufsize = 256 + 4 * frame_num_lcu;
+	h265e_lcubitcnt_bufsize = ALIGN(h265e_lcubitcnt_bufsize, 256);
+	h265e_lcubitmap_bufsize = 256 + (frame_num_lcu >> 3);
+	h265e_lcubitmap_bufsize = ALIGN(h265e_lcubitmap_bufsize, 256);
+	line_buf_sde_size = 256 + 16 * (width_coded >> 4);
+	line_buf_sde_size = ALIGN(line_buf_sde_size, 256);
+	if ((width_coded * height_coded) > (4096 * 2160))
+		se_stats_bufsize = 0;
+	else if ((width_coded * height_coded) > (1920 * 1088))
+		se_stats_bufsize = (40 * 4 * frame_num_lcu + 256 + 256);
+	else
+		se_stats_bufsize = (1024 * frame_num_lcu + 256 + 256);
+
+	se_stats_bufsize = ALIGN(se_stats_bufsize, 256) * 2;
+	bse_slice_cmd_buffer_size = (((8192 << 2) + 7) & (~7)) * 6;
+	bse_reg_buffer_size = (((512 << 3) + 7) & (~7)) * 4;
+	vpp_reg_buffer_size = (((2048 << 3) + 31) & (~31)) * 10;
+	lambda_lut_size = 256 * 11;
+	override_buffer_size = 16 * ((num_lcu_mb + 7) >> 3);
+	override_buffer_size = ALIGN(override_buffer_size, 256) * 2;
+	ir_buffer_size = (((frame_num_lcu << 1) + 7) & (~7)) * 3;
+	vpss_line_buffer_size_1 = (((8192 >> 2) << 5) * num_vpp_pipes) + 64;
+	vpss_line_buf =
+		(((((max(width_coded, height_coded) + 3) >> 2) << 5) + 256) *
+		 16) +
+		vpss_line_buffer_size_1;
+	topline_bufsize_fe_1stg_sao = 16 * (width_coded >> 5);
+	topline_bufsize_fe_1stg_sao = ALIGN(topline_bufsize_fe_1stg_sao, 256);
+
+	return line_buf_ctrl_size + line_buf_data_size +
+	       line_buf_ctrl_size_buffid2 + leftline_buf_ctrl_size +
+	       vpss_line_buf + col_mv_buf_size + topline_buf_ctrl_size_FE +
+	       leftline_buf_ctrl_size_FE + line_buf_recon_pix_size +
+	       leftline_buf_recon_pix_size + leftline_buf_meta_recony +
+	       linebuf_meta_recon_uv + h265e_colrcbuf_size +
+	       h265e_framerc_bufsize + h265e_lcubitcnt_bufsize +
+	       h265e_lcubitmap_bufsize + line_buf_sde_size +
+	       topline_bufsize_fe_1stg_sao + override_buffer_size +
+	       bse_reg_buffer_size + vpp_reg_buffer_size + sps_pps_slice_hdr +
+	       slice_cmd_buffer_size + bse_slice_cmd_buffer_size +
+	       ir_buffer_size + slice_info_bufsize + lambda_lut_size +
+	       se_stats_bufsize + 1024;
+}
+
+static u32 iris_vpu_enc_scratch1_size(struct iris_inst *inst)
+{
+	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
+	struct v4l2_format *f = inst->fmt_dst;
+	u32 frame_height = f->fmt.pix_mp.height;
+	u32 frame_width = f->fmt.pix_mp.width;
+	u32 num_ref = 1;
+	u32 lcu_size;
+	bool is_h265;
+
+	if (inst->codec == V4L2_PIX_FMT_H264) {
+		lcu_size = 16;
+		is_h265 = false;
+	} else if (inst->codec == V4L2_PIX_FMT_HEVC) {
+		lcu_size = 32;
+		is_h265 = true;
+	} else {
+		return 0;
+	}
+
+	return hfi_buffer_scratch1_enc(frame_width, frame_height, lcu_size,
+				       num_ref, false, num_vpp_pipes, is_h265);
+}
+
+static inline u32 ubwc_metadata_plane_stride(u32 width,
+					     u32 metadata_stride_multi,
+					     u32 tile_width_pels)
+{
+	return ALIGN(((width + (tile_width_pels - 1)) / tile_width_pels),
+		     metadata_stride_multi);
+}
+
+static inline u32 ubwc_metadata_plane_bufheight(u32 height,
+						u32 metadata_height_multi,
+						u32 tile_height_pels)
+{
+	return ALIGN(((height + (tile_height_pels - 1)) / tile_height_pels),
+		     metadata_height_multi);
+}
+
+static inline u32 ubwc_metadata_plane_buffer_size(u32 metadata_stride,
+						  u32 metadata_buf_height)
+{
+	return ALIGN(metadata_stride * metadata_buf_height, SZ_4K);
+}
+
+static inline u32 hfi_buffer_scratch2_enc(u32 frame_width, u32 frame_height,
+					  u32 num_ref, bool ten_bit)
+{
+	u32 aligned_width, aligned_height, chroma_height, ref_buf_height;
+	u32 metadata_stride, meta_buf_height, meta_size_y, meta_size_c;
+	u32 ref_luma_stride_bytes, ref_chroma_height_bytes;
+	u32 ref_buf_size, ref_stride;
+	u32 luma_size, chroma_size;
+	u32 size;
+
+	if (!ten_bit) {
+		aligned_height = ALIGN(frame_height, 32);
+		chroma_height = frame_height >> 1;
+		chroma_height = ALIGN(chroma_height, 32);
+		aligned_width = ALIGN(frame_width, 128);
+		metadata_stride =
+			ubwc_metadata_plane_stride(frame_width, 64, 32);
+		meta_buf_height =
+			ubwc_metadata_plane_bufheight(frame_height, 16, 8);
+		meta_size_y = ubwc_metadata_plane_buffer_size(metadata_stride,
+							      meta_buf_height);
+		meta_size_c = ubwc_metadata_plane_buffer_size(metadata_stride,
+							      meta_buf_height);
+		size = (aligned_height + chroma_height) * aligned_width +
+		       meta_size_y + meta_size_c;
+		size = (size * (num_ref + 3)) + 4096;
+	} else {
+		ref_buf_height = (frame_height + (32 - 1)) & (~(32 - 1));
+		ref_luma_stride_bytes = ((frame_width + 192 - 1) / 192) * 192;
+		ref_stride = 4 * (ref_luma_stride_bytes / 3);
+		ref_stride = (ref_stride + (128 - 1)) & (~(128 - 1));
+		luma_size = ref_buf_height * ref_stride;
+		ref_chroma_height_bytes =
+			(((frame_height + 1) >> 1) + (32 - 1)) & (~(32 - 1));
+		chroma_size = ref_stride * ref_chroma_height_bytes;
+		luma_size = (luma_size + (SZ_4K - 1)) & (~(SZ_4K - 1));
+		chroma_size = (chroma_size + (SZ_4K - 1)) & (~(SZ_4K - 1));
+		ref_buf_size = luma_size + chroma_size;
+		metadata_stride =
+			ubwc_metadata_plane_stride(frame_width, 64, 48);
+		meta_buf_height =
+			ubwc_metadata_plane_bufheight(frame_height, 16, 4);
+		meta_size_y = ubwc_metadata_plane_buffer_size(metadata_stride,
+							      meta_buf_height);
+		meta_size_c = ubwc_metadata_plane_buffer_size(metadata_stride,
+							      meta_buf_height);
+		size = ref_buf_size + meta_size_y + meta_size_c;
+		size = (size * (num_ref + 3)) + 4096;
+	}
+
+	return size;
+}
+
+static u32 iris_vpu_enc_scratch2_size(struct iris_inst *inst)
+{
+	struct v4l2_format *f = inst->fmt_dst;
+	u32 frame_width = f->fmt.pix_mp.width;
+	u32 frame_height = f->fmt.pix_mp.height;
+	u32 num_ref = 1;
+
+	return hfi_buffer_scratch2_enc(frame_width, frame_height, num_ref,
+				       false);
+}
+
+static u32 iris_vpu_enc_vpss_size(struct iris_inst *inst)
+{
+	u32 ds_enable = is_scaling_enabled(inst);
+	struct v4l2_format *f = inst->fmt_dst;
+	u32 height = f->fmt.pix_mp.height;
+	u32 width = f->fmt.pix_mp.width;
+
+	return hfi_buffer_vpss_enc(width, height, ds_enable, 0, 0);
+}
+
 static int output_min_count(struct iris_inst *inst)
 {
 	int output_min_count = 4;
@@ -573,8 +1387,8 @@ struct iris_vpu_buf_type_handle {
 
 int iris_vpu_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type)
 {
-	const struct iris_vpu_buf_type_handle *buf_type_handle_arr;
-	u32 size = 0, buf_type_handle_size, i;
+	const struct iris_vpu_buf_type_handle *buf_type_handle_arr = NULL;
+	u32 size = 0, buf_type_handle_size = 0, i;
 
 	static const struct iris_vpu_buf_type_handle dec_internal_buf_type_handle[] = {
 		{BUF_BIN,         iris_vpu_dec_bin_size             },
@@ -586,8 +1400,24 @@ int iris_vpu_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type)
 		{BUF_SCRATCH_1,   iris_vpu_dec_scratch1_size        },
 	};
 
-	buf_type_handle_size = ARRAY_SIZE(dec_internal_buf_type_handle);
-	buf_type_handle_arr = dec_internal_buf_type_handle;
+	static const struct iris_vpu_buf_type_handle enc_internal_buf_type_handle[] = {
+		{BUF_BIN,         iris_vpu_enc_bin_size             },
+		{BUF_COMV,        iris_vpu_enc_comv_size            },
+		{BUF_NON_COMV,    iris_vpu_enc_non_comv_size        },
+		{BUF_LINE,        iris_vpu_enc_line_size            },
+		{BUF_ARP,         iris_vpu_enc_arp_size             },
+		{BUF_VPSS,        iris_vpu_enc_vpss_size            },
+		{BUF_SCRATCH_1,   iris_vpu_enc_scratch1_size        },
+		{BUF_SCRATCH_2,   iris_vpu_enc_scratch2_size        },
+	};
+
+	if (inst->domain == DECODER) {
+		buf_type_handle_size = ARRAY_SIZE(dec_internal_buf_type_handle);
+		buf_type_handle_arr = dec_internal_buf_type_handle;
+	} else if (inst->domain == ENCODER) {
+		buf_type_handle_size = ARRAY_SIZE(enc_internal_buf_type_handle);
+		buf_type_handle_arr = enc_internal_buf_type_handle;
+	}
 
 	for (i = 0; i < buf_type_handle_size; i++) {
 		if (buf_type_handle_arr[i].type == buffer_type) {
@@ -639,6 +1469,9 @@ int iris_vpu_buf_count(struct iris_inst *inst, enum iris_buffer_type buffer_type
 	case BUF_PERSIST:
 		return internal_buffer_count(inst, buffer_type);
 	case BUF_SCRATCH_1:
+	case BUF_SCRATCH_2:
+	case BUF_VPSS:
+	case BUF_ARP:
 		return 1; /* internal buffer count needed by firmware is 1 */
 	case BUF_DPB:
 		return iris_vpu_dpb_count(inst);
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
index ee95fd20b794c52d0070c93224bd4ee5e4e180d5..1ff1b07ecbaa85345ca948affeb1c4a1c55e36b0 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
@@ -80,6 +80,26 @@ struct iris_inst;
 #define MAX_PE_NBR_DATA_LCU64_LINE_BUFFER_SIZE	384
 #define MAX_FE_NBR_DATA_LUMA_LINE_BUFFER_SIZE	640
 
+#define SIZE_SLICE_CMD_BUFFER (ALIGN(20480, 256))
+#define SIZE_SPS_PPS_SLICE_HDR (2048 + 4096)
+#define SIZE_BSE_SLICE_CMD_BUF ((((8192 << 2) + 7) & (~7)) * 3)
+#define SIZE_LAMBDA_LUT (256 * 11)
+
+#define HFI_COL_FMT_NV12C_Y_TILE_HEIGHT (8)
+#define HFI_COL_FMT_NV12C_Y_TILE_WIDTH (32)
+#define HFI_COL_FMT_TP10C_Y_TILE_HEIGHT (4)
+#define HFI_COL_FMT_TP10C_Y_TILE_WIDTH (48)
+
+#define IRIS_METADATA_STRIDE_MULTIPLE 64
+#define IRIS_METADATA_HEIGHT_MULTIPLE 16
+
+#define HFI_BUFFER_ARP_ENC 204800
+
+#define MAX_WIDTH 4096
+#define MAX_HEIGHT 2304
+#define NUM_MBS_4K (DIV_ROUND_UP(MAX_WIDTH, 16) * DIV_ROUND_UP(MAX_HEIGHT, 16))
+#define NUM_MBS_720P	(((ALIGN(1280, 16)) >> 4) * ((ALIGN(736, 16)) >> 4))
+
 static inline u32 size_h264d_lb_fe_top_data(u32 frame_width)
 {
 	return MAX_FE_NBR_DATA_LUMA_LINE_BUFFER_SIZE * ALIGN(frame_width, 16) * 3;

-- 
2.34.1


