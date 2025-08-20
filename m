Return-Path: <linux-media+bounces-40362-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A96CDB2D7BC
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 11:15:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C5C5721D9C
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 09:13:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7BA62E5B17;
	Wed, 20 Aug 2025 09:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IPxXb47E"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE0B2DCF53;
	Wed, 20 Aug 2025 09:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755680910; cv=none; b=dKxpsV4/h5p0gl5Q/W5BWBIQCsFCBmNja+x7YwrGMNp0Oel+L0N+R+WzTBYntz3iZIn6VHhEmTTzSKb+GeZsrlvK2FBq8ZnFfuRgVbJvqNyOTFj/uej1U2l+pLy3EAh103zCotIkrlXOV3Icl7IjA/m3QLASXvNIc674KgKqTBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755680910; c=relaxed/simple;
	bh=J8IHnOYoDZxGthGgwNyus6Y/0MKQD/BCbIWGu4N7kjc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=XgQy2C0enVnc7weIu8JBgu7rbtUfk0FlXeeFU+Y1CRGDqG3kFEtNvfLorpaxcD9hZPwEQe7l3dv9ufAal/mbva96aVi24fF7A35qtFuGipkexQSxa5sqyP54yLxkDjIw0AV6ojBzEC8pq52IyMtl3uYBTVmDX3h3Wsi/Hf8iUHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IPxXb47E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1odFR006141;
	Wed, 20 Aug 2025 09:08:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	anwjv2KzNbLL2NVaR7U0he0K/jgGo6daVPno7kyq4UM=; b=IPxXb47EEiXS8oCp
	l281irxQCvZELkRZpN4jFZfxFs0GITjhELVXVgpGJ1uYsKvSMtueC+E3UsMyMi0W
	GRKhFMqWRnSLXsNeVI/YX58UaFpcdo96jGI9Gc84WkE5HYL4ZkFYH8KWQvzvMcXl
	foFgQDEdgudAJzfJe19biu3tRZe+Mae7tl/pqsU3AlJ6wTSGEaEMSf76O1p7qGX9
	LxMdnhI7ZI3WJSdbyG7bQGgpUxuJjyEZooko5jNYHecoXNNmy8XTtPYEwLRzKNhm
	CBHLM7bzqgFyBW+iTfm2Tt8kGrJfinBMpBBEG6rgyF6WawG5bNsZpoXyiWbP6BTv
	TC67/Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52913xs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 09:08:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57K98MUt026952
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 09:08:22 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 20 Aug 2025 02:08:18 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 20 Aug 2025 14:37:46 +0530
Subject: [PATCH v3 08/26] media: iris: Simplify session stop logic by
 relying on vb2 checks
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250820-iris-video-encoder-v3-8-80ab0ba58b3d@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755680867; l=3085;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=J8IHnOYoDZxGthGgwNyus6Y/0MKQD/BCbIWGu4N7kjc=;
 b=vyX239sMsDUCfVovBuIRQF+tvf20iIlnUw3sgc3kfiJ0idsSnjcDa0PJosUSwn4Al2GK2K7wF
 1AOPTBcIJ6ODBmJ1Zi3s0BS+GZfOpO5hQM9SD3XPpHWAk+vFnw4J52q
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Aui3HO9P c=1 sm=1 tr=0 ts=68a59087 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=IcaLs1R6myz3_H0jQrwA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: QPKpNCllHw9Lum9gbnyS_zepcLuTFGBg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXxzDPxeIKBaGb
 fs0LiMHeRaHEXT6ZnsNnqmu+C0odKXhGVcYBiJRd62E3DSFRTtCyl51OMoPyF2K4pYlGFzeJn2S
 4l25JFcgc59bW5nAYGkU3SbEZA1JHZ6Ew3rbtu6Ng2OjMj294cy1tqE0vf4f7cJnxpy28njEcuN
 etq3EiWFlo7JydTKdPqC2Dee93g1L3368ptKIRm4yG+vLZvJNJ2StshAPOF2YaFrc5HiIgQ/2tn
 6wvPJqvCxp2unwayCaMwn41qE8Fadi8WInS3ksFbJMqUL39Yxw10MYf705tZn4klGcAvBin70rV
 WdmzH/lDabUv3j3mW1FxGHEj7i4nKYYFbA0GyESek0iqSavyI03yaqlHsRjL4PXsJU3CkjTnsTN
 tRF2kna2YI+UNdzLN13zys7ge7EHnw==
X-Proofpoint-GUID: QPKpNCllHw9Lum9gbnyS_zepcLuTFGBg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2508110000
 definitions=main-2508200013

Remove earlier complex conditional checks in the non-streaming path that
attempted to verify if stop was called on a plane that was previously
started. These explicit checks are redundant, as vb2 already ensures
that stop is only called on ports that have been started, maintaining
correct buffer state management.

Fixes: 11712ce70f8e ("media: iris: implement vb2 streaming ops")
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 .../platform/qcom/iris/iris_hfi_gen1_command.c     | 42 ++++++++++------------
 1 file changed, 19 insertions(+), 23 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 5fc30d54af4dc34616cfd08813940aa0b7044a20..3e41c8cb620ebe51636a4cc5202909bb043ed4ab 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -184,11 +184,25 @@ static int iris_hfi_gen1_session_stop(struct iris_inst *inst, u32 plane)
 	u32 flush_type = 0;
 	int ret = 0;
 
-	if ((V4L2_TYPE_IS_OUTPUT(plane) &&
-	     inst->state == IRIS_INST_INPUT_STREAMING) ||
-	    (V4L2_TYPE_IS_CAPTURE(plane) &&
-	     inst->state == IRIS_INST_OUTPUT_STREAMING) ||
-	    inst->state == IRIS_INST_ERROR) {
+	if (inst->state == IRIS_INST_STREAMING) {
+		if (V4L2_TYPE_IS_OUTPUT(plane))
+			flush_type = HFI_FLUSH_ALL;
+		else if (V4L2_TYPE_IS_CAPTURE(plane))
+			flush_type = HFI_FLUSH_OUTPUT;
+
+		reinit_completion(&inst->flush_completion);
+
+		flush_pkt.shdr.hdr.size = sizeof(struct hfi_session_flush_pkt);
+		flush_pkt.shdr.hdr.pkt_type = HFI_CMD_SESSION_FLUSH;
+		flush_pkt.shdr.session_id = inst->session_id;
+		flush_pkt.flush_type = flush_type;
+
+		ret = iris_hfi_queue_cmd_write(core, &flush_pkt, flush_pkt.shdr.hdr.size);
+		if (!ret) {
+			inst->flush_responses_pending++;
+			ret = iris_wait_for_session_response(inst, true);
+		}
+	} else {
 		reinit_completion(&inst->completion);
 		iris_hfi_gen1_packet_session_cmd(inst, &pkt, HFI_CMD_SESSION_STOP);
 		ret = iris_hfi_queue_cmd_write(core, &pkt, pkt.shdr.hdr.size);
@@ -207,24 +221,6 @@ static int iris_hfi_gen1_session_stop(struct iris_inst *inst, u32 plane)
 					 VB2_BUF_STATE_ERROR);
 		iris_helper_buffers_done(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
 					 VB2_BUF_STATE_ERROR);
-	} else if (inst->state == IRIS_INST_STREAMING) {
-		if (V4L2_TYPE_IS_OUTPUT(plane))
-			flush_type = HFI_FLUSH_ALL;
-		else if (V4L2_TYPE_IS_CAPTURE(plane))
-			flush_type = HFI_FLUSH_OUTPUT;
-
-		reinit_completion(&inst->flush_completion);
-
-		flush_pkt.shdr.hdr.size = sizeof(struct hfi_session_flush_pkt);
-		flush_pkt.shdr.hdr.pkt_type = HFI_CMD_SESSION_FLUSH;
-		flush_pkt.shdr.session_id = inst->session_id;
-		flush_pkt.flush_type = flush_type;
-
-		ret = iris_hfi_queue_cmd_write(core, &flush_pkt, flush_pkt.shdr.hdr.size);
-		if (!ret) {
-			inst->flush_responses_pending++;
-			ret = iris_wait_for_session_response(inst, true);
-		}
 	}
 
 	return ret;

-- 
2.34.1


