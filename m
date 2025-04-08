Return-Path: <linux-media+bounces-29646-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF16A81139
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 18:04:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21A2C3BA329
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 15:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3474C23E35E;
	Tue,  8 Apr 2025 15:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PauRh3f4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1332E23E34F;
	Tue,  8 Apr 2025 15:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744127738; cv=none; b=VYzKrWVj/i+Fx3y0HCXU7KfCEFkzH8cGeODsc3Y0rzmbd5oKTXvtAVeMo9tRxqg0SKzzQ/HKf1QZaly+zuIAWZk9i9yG2Wr0HNvEWvd3WoAvtTclkb2a4zWybxW1jA4dA2U/FvE8FzKmcw4swNnOK1KDQ3vlfpZzM7QqMukhQZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744127738; c=relaxed/simple;
	bh=KVuvYX62+cimMpA+aoGXMHXJeDk8Hsx9c5dnJrYxg4Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=eoJnNKxTm39OITPXBSTxRuMu9Zt8ffKKQuUZKnoUAuHSkx1+Qr6KK7sd356yqKh+qPpI3o+s3PvIarvkslUNXgyIBtDK6KG46k8n9ALXWkCWYo3QGc8tvYlKz/2q6BlePTOYJDTmikyqKkgeQ99kk4QcwfNwJtP4/tu6VvfEfnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PauRh3f4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538AsvSv019579;
	Tue, 8 Apr 2025 15:55:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9AjMBkValIeT1MIElgyZHTzsj4P6mNuX5gbBpaNqBkM=; b=PauRh3f4ngy5pkCu
	DrfLy7AX3D8sdkwpnCTXnbAaprjCEp3N2eeIUB3+xMDqQKoS1p7CrEWfHIYEDrKJ
	tZt0WCKXpeaHJijck3v4lCAWdeHzHmy1kjDW4I0BREEODuJ3sbR86wFQStWADvsI
	H1crPtzfWkZFYrNJ4cclo5DcUrvwDKBORqxrsz87RFO+Zol2+xT6+N9TaIwgUEpS
	VjPvCqPR46M2BYNhTb8rXYBUUZXkGEDTkSHVrN48Z+W3CEs1PE9JNQ5ta6Rw1acM
	4pTADS3CyDNwqC+F/A59/zg0fi+C2GYhc0SrBEbGRWmalRYooZXsYKBQi/vOdu/E
	v2qlBw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twg3g9gc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Apr 2025 15:55:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 538FtWDK017777
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Apr 2025 15:55:32 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 8 Apr 2025 08:55:27 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Tue, 8 Apr 2025 21:24:24 +0530
Subject: [PATCH 10/20] media: iris: Remove redundant buffer count check in
 stream off
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250408-iris-dec-hevc-vp9-v1-10-acd258778bd6@quicinc.com>
References: <20250408-iris-dec-hevc-vp9-v1-0-acd258778bd6@quicinc.com>
In-Reply-To: <20250408-iris-dec-hevc-vp9-v1-0-acd258778bd6@quicinc.com>
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
	<dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Dikshita
 Agarwal" <quic_dikshita@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744127674; l=2446;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=KVuvYX62+cimMpA+aoGXMHXJeDk8Hsx9c5dnJrYxg4Y=;
 b=Xk9wsEkLxrm/UvB8cQituGL1FmrL3q5/TPYm0yUD8wqDsDL61NTXa8vNIwRnr0rZAO7QbN/9o
 Uu9WCL7Dy8OCR0fnxF6izmAi7WKWgwlPag8vDLeLjCbB/zSlGGg/5Cw
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: FJd1JH1vdRFCvh60L-Ti6VCjI7nuUpYm
X-Proofpoint-ORIG-GUID: FJd1JH1vdRFCvh60L-Ti6VCjI7nuUpYm
X-Authority-Analysis: v=2.4 cv=I/9lRMgg c=1 sm=1 tr=0 ts=67f546f5 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=-qshO7OKkG8J2I8e95wA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_06,2025-04-08_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080110

Currently, the stream off process checks the count of buffers in
v4l2_m2m_queues using v4l2_m2m_for_each_src_buf_safe and
v4l2_m2m_for_each_dst_buf_safe APIs. If the count is non-zero, it
returns an error. This check is redundant as the V4L2 framework already
handles buffer management internally.

Remove the unnecessary buffer count check in stream off, simplifying the
process and relying on V4L2's internal mechanisms for buffer management.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_vdec.c | 36 ----------------------------
 1 file changed, 36 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 7058f2d789bd..1305b981a72d 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -244,35 +244,6 @@ void iris_vdec_src_change(struct iris_inst *inst)
 	v4l2_event_queue_fh(&inst->fh, &event);
 }
 
-static int iris_vdec_get_num_queued_buffers(struct iris_inst *inst,
-					    enum iris_buffer_type type)
-{
-	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
-	struct v4l2_m2m_buffer *buffer, *n;
-	struct iris_buffer *buf;
-	u32 count = 0;
-
-	switch (type) {
-	case BUF_INPUT:
-		v4l2_m2m_for_each_src_buf_safe(m2m_ctx, buffer, n) {
-			buf = to_iris_buffer(&buffer->vb);
-			if (!(buf->attr & BUF_ATTR_QUEUED))
-				continue;
-			count++;
-		}
-		return count;
-	case BUF_OUTPUT:
-		v4l2_m2m_for_each_dst_buf_safe(m2m_ctx, buffer, n) {
-			buf = to_iris_buffer(&buffer->vb);
-			if (!(buf->attr & BUF_ATTR_QUEUED))
-				continue;
-			count++;
-		}
-		return count;
-	default:
-		return count;
-	}
-}
 
 static void iris_vdec_flush_deferred_buffers(struct iris_inst *inst,
 					     enum iris_buffer_type type)
@@ -321,7 +292,6 @@ int iris_vdec_session_streamoff(struct iris_inst *inst, u32 plane)
 {
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
 	enum iris_buffer_type buffer_type;
-	u32 count;
 	int ret;
 
 	switch (plane) {
@@ -339,12 +309,6 @@ int iris_vdec_session_streamoff(struct iris_inst *inst, u32 plane)
 	if (ret)
 		goto error;
 
-	count = iris_vdec_get_num_queued_buffers(inst, buffer_type);
-	if (count) {
-		ret = -EINVAL;
-		goto error;
-	}
-
 	ret = iris_inst_state_change_streamoff(inst, plane);
 	if (ret)
 		goto error;

-- 
2.34.1


