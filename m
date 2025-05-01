Return-Path: <linux-media+bounces-31535-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34550AA640A
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 21:20:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9F139A03FE
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 19:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FF8F248F72;
	Thu,  1 May 2025 19:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Mj2yzFLl"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626FE246797;
	Thu,  1 May 2025 19:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746126980; cv=none; b=V1erhhmwSPCJwKG7IaB/P6iHuA5y2Tfv2h1HOov0Y8Xv896OIZFXs9BLeVXlo/795eGtgSa0VLvc8lyEIADRFpzMbfX1nGUqNRCzxJYYFS3+q7ffXQtUFSiu7GtZFG4UfFpPEjtF/51haMGdisTkH+6mnGpZY65MvXPIoFlPt4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746126980; c=relaxed/simple;
	bh=60M44TZIwClnUTUDihi4SshvBo9j85IcEo1nAiBt94c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Z8abwCQYSHHLOT8w6JqUYslw6XU+TT1AYPtslw/CiJEnv1IXSQiupy7++xkIDHqMwd7eXvSRC5M/HaH9aCM1ohzAlOus5Rs/hzVfOI7vLxLQeZ+co9D+WXRsTMKVV8yyX/RcvrMUegg9ve1+toSS0sTzlx753naXpt0xHYK1uuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Mj2yzFLl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 541D2KpF001325;
	Thu, 1 May 2025 19:16:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SJVs2XjanrYoZoC1xIZccaCOp4+UbVh7rzOdnjJKaUY=; b=Mj2yzFLlC4dlHH5o
	SoBYn2tbiGnNrr7eRdRjZDQ/MeqvOBonHe3dH0cXwAMuAZLgD2lfGn15fVWGTKMG
	VieoLW6bZKkAyHfLzEPMoq6cWpvxa5raB1P1pgRhr9v5pPkF2Fy9ySCzMh30Zprl
	Xci5ixJLhDiZe7MdRak3lEgYmh5pKjV1mReqYoGKpotpcMb3EbTDQ64/JrzUj6MC
	63GuEp04d0KUpaWNKso8zjdHL6XbK3i6pVyeEgZs7iMucd2zWQmi8WhpgUBNMFhY
	/kdwwcwaS6u0LxOGTZOrLJVMI+FrFUBKb0eTQTJTf6vb+CAXH2y4SlnkuiWgO1ge
	2stAMg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u768r1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 May 2025 19:16:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 541JGEOU005620
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 1 May 2025 19:16:14 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 1 May 2025 12:16:09 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 2 May 2025 00:43:53 +0530
Subject: [PATCH v3 23/23] media: iris: Add codec specific check for VP9
 decoder drain handling
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250502-qcom-iris-hevc-vp9-v3-23-552158a10a7d@quicinc.com>
References: <20250502-qcom-iris-hevc-vp9-v3-0-552158a10a7d@quicinc.com>
In-Reply-To: <20250502-qcom-iris-hevc-vp9-v3-0-552158a10a7d@quicinc.com>
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
        <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746126827; l=2136;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=60M44TZIwClnUTUDihi4SshvBo9j85IcEo1nAiBt94c=;
 b=PZ5N2tPsYKYfRRCInMIWjJrxIMmyDYh+92A4q6WmN/RGCFOpKl/H7oLq0lEJpJXmjy26EVZqz
 6POtoHosg3nCvNP1/+EjLMa+tY6JlPC5+T95ZZNJEiLZvTnxURkbc8J
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDE0NyBTYWx0ZWRfXzZMGfEHdvQA9 o/b3DbZJWOSEW6/HldcgvJJmbwWdwRleHIFt7C/l1BcUTrkiFhWTUiCuVNNoIRhsEwyXjKbV+k3 GhYNqRwrWbKP8U3oHoG89hUVlAzyRGdjgez+I8fF0ndnn6V9J4Y7J4dzrSp4DgQpDGIjgpIWhHU
 jQZBxOCQFlRUoyuU8le+eZIV8ER+uq72qgNDKopxvpecql8i4BaqvjGJzlEMEvdeQzkNonPU0Dy foS01UdpAlrC3dzTDeXM76GFhh9srQtt6eye6Us3H9Hu3EiMmDuqZgUjXFaiI/G0vc6GjJfnkjV Mf4cGwrIlFYKh4dZAsFSXG1E5YBF0PtHQetXiYcNfm9qb4RyOBrOntvLKtKO3bUvHNs42me+Cbq
 JobvWIY+Zi4F3u3oM6MD1aR5XPOzsys5KomWVqgVCStvHcGXEzrPb9bU7N6CTrOQjrnqflTS
X-Proofpoint-GUID: Z500UtmgUbI_oVszFJIMcxMuHQHMbKo5
X-Authority-Analysis: v=2.4 cv=W404VQWk c=1 sm=1 tr=0 ts=6813c880 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=uk1rlkFWm520LKNewhEA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Z500UtmgUbI_oVszFJIMcxMuHQHMbKo5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 spamscore=0
 clxscore=1015 phishscore=0 impostorscore=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505010147

Add a codec specific for the VP9 decoder to ensure that a non-null
buffer is sent to the firmware during drain. The firmware enforces a
check for VP9 decoder that the number of buffers queued and dequeued on
the output plane should match. When a null buffer is sent, the firmware
does not return a response for it, leading to a count mismatch and an
assertion failure from the firmware.

Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c  | 2 ++
 drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 2e3f5a6b2ff1..5fc30d54af4d 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -401,6 +401,8 @@ static int iris_hfi_gen1_session_drain(struct iris_inst *inst, u32 plane)
 	ip_pkt.shdr.hdr.pkt_type = HFI_CMD_SESSION_EMPTY_BUFFER;
 	ip_pkt.shdr.session_id = inst->session_id;
 	ip_pkt.flags = HFI_BUFFERFLAG_EOS;
+	if (inst->codec == V4L2_PIX_FMT_VP9)
+		ip_pkt.packet_buffer = 0xdeadb000;
 
 	return iris_hfi_queue_cmd_write(inst->core, &ip_pkt, ip_pkt.shdr.hdr.size);
 }
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index 926acee1f48c..8d1ce8a19a45 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -348,6 +348,10 @@ static void iris_hfi_gen1_session_etb_done(struct iris_inst *inst, void *packet)
 	struct iris_buffer *buf = NULL;
 	bool found = false;
 
+	/* EOS buffer sent via drain won't be in v4l2 buffer list */
+	if (pkt->packet_buffer == 0xdeadb000)
+		return;
+
 	v4l2_m2m_for_each_src_buf_safe(m2m_ctx, m2m_buffer, n) {
 		buf = to_iris_buffer(&m2m_buffer->vb);
 		if (buf->index == pkt->input_tag) {

-- 
2.34.1


