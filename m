Return-Path: <linux-media+bounces-31522-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A063DAA63D7
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 21:17:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 963B61898AA8
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 19:17:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E524C23506A;
	Thu,  1 May 2025 19:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ovxwVQM9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C449722A4DA;
	Thu,  1 May 2025 19:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746126904; cv=none; b=C2cY6lViTOjU18SEQDBA8ezXJkHoECEr6Huww/CtOdHCHwXLafjT/o7sfBm2+MtkyeBIEUQEkxErKhayaVBgeq9GEhPi+aLbgvdQ67t+mtHrPFcaXpX8Jj3ae2mx1Oc59ikZVm4NyskiIfOV7n0Y+6Pc37Z61UumjlQ6Fk6AT6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746126904; c=relaxed/simple;
	bh=VoABKDUhSz9goddYa0bk4pNtHGepuIvwO5AgQ2kF34Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Xuhys+khar0aAHU5RohU0yq0L2QBJXOgl5Pe/qdoHqcV42v88c04LYJX0t2uDVhEDHemKEz9s7bRtprF8wQxch42oDsq/2DnM/+A9hVuSxWjBvE31wVohPoHLDeiN3mWW8oxlAVTd6KP9BzowUw4+rLsKutLIdKBT/45bb9NlTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ovxwVQM9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 541D26Uw009601;
	Thu, 1 May 2025 19:14:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7vZzJ8O35YLm8ZKJo+eILXuOfMrTHf81S2skpTwLYMk=; b=ovxwVQM9QfWxDep7
	w5BbEnI32Ypcmv2wsdr3Fch7eg0omt/f8d6QvR5TiEG6vgn7asVcCRVpibN6VQlh
	0KBO6ZADd+VghsqqqaddWBWvEGGmEJYr1/pM7LQlkUAXV0uY9jEV63uxMEoBiFmv
	mI8NN3t5yXqm2yxlfSuIKYhfC5zgT8rvn0ACP0eKw+dWFkKxfEfbhJbbFS3f4zt3
	EdGxEANGgQAC5XtP6CNaLWm7tjGN6s4fA5T4Et4zyfikXtsbzTf00ucTjuQrxM6D
	/yKcqZM0C+zQh6j8S+lrQq/Rg2eg2+I0o8leA0GVI2lkXsZ5gB0NO54ITNwBIeDi
	AvJXsA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u4e74h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 May 2025 19:14:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 541JEufJ030016
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 1 May 2025 19:14:56 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 1 May 2025 12:14:50 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 2 May 2025 00:43:40 +0530
Subject: [PATCH v3 10/23] media: iris: Track flush responses to prevent
 premature completion
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250502-qcom-iris-hevc-vp9-v3-10-552158a10a7d@quicinc.com>
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
        <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>,
        <stable@vger.kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746126827; l=5033;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=VoABKDUhSz9goddYa0bk4pNtHGepuIvwO5AgQ2kF34Y=;
 b=Pn0lkzeOacPUBg2JxcMx1f6w6ybRVNgKw7M1BRBs9WtDodU6fYUfUXxL9urBDjrgPBRyKtWGA
 YblGDmCKa9vCJoAm3wBzLrW6LUy4IV121jbMEuDcUj143/K9Kfzu7EJ
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: oC2lFf9VMdnkLNjOOGzLOrgPdp8EaKPo
X-Authority-Analysis: v=2.4 cv=Yaq95xRf c=1 sm=1 tr=0 ts=6813c831 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=LJxFFEd629w47lnb3LgA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDE0NyBTYWx0ZWRfXx3B/R1qsPvem llL6jSrUULM0mf1NBRlPHcxjJZkFGDqFcByLqa6Kyu/ah0d+wdFyq9ieuoBlwXcw4OMDlJWHvu7 pyHrqxqiIzS6pNeEqZBnJh8wAKwZ/DfOPz3bRsweSkCGa2tlhOV0EriAbbXb8UV68Gyo+7rz412
 sWsVxHLmNRZZvxH/rAbBb5TEHUD4anpUxXnukD5j3rJFRyftoR5uT2Fy+58abEramHJJ8Xkb3Vi fZe/PtqVQR7unYVQlJNxZ7zkts0F97TIkVhAtkkqPqIg9dgM7RzYv90rG+WH2B/bGnL8+IBPwyu 7bbL8/RV5hp0OEyomG1ifFB/e4bKy+bW5MCGnecDXzm7EJBOBc/NFINDbUZdUZD27FXpAQc0jWQ
 xkmDSNDFB5A77jtRV2I+RXmfH59HhEvd85AnBJCD40B3dsNTPWELLC0Cezs7iu5CkhXdddGF
X-Proofpoint-GUID: oC2lFf9VMdnkLNjOOGzLOrgPdp8EaKPo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505010147

Currently, two types of flush commands are queued to the firmware,
the first flush queued as part of sequence change, does not wait for a
response, while the second flush queued as part of stop, expects a
completion response before proceeding further.

Due to timing issue, the flush response corresponding to the first
command could arrive after the second flush is issued. This casuses the
driver to incorrectly assume that the second flush has completed,
leading to the premature signaling of flush_completion.

To address this, introduce a counter to track the number of pending
flush responses and signal flush completion only when all expected
responses are received.

Cc: stable@vger.kernel.org
Fixes: 11712ce70f8e ("media: iris: implement vb2 streaming ops")
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 .../media/platform/qcom/iris/iris_hfi_gen1_command.c    |  4 +++-
 .../media/platform/qcom/iris/iris_hfi_gen1_response.c   | 17 +++++++++++------
 drivers/media/platform/qcom/iris/iris_instance.h        |  2 ++
 3 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index ce855a20ce4b..bd9d86220e61 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -208,8 +208,10 @@ static int iris_hfi_gen1_session_stop(struct iris_inst *inst, u32 plane)
 		flush_pkt.flush_type = flush_type;
 
 		ret = iris_hfi_queue_cmd_write(core, &flush_pkt, flush_pkt.shdr.hdr.size);
-		if (!ret)
+		if (!ret) {
+			inst->flush_responses_pending++;
 			ret = iris_wait_for_session_response(inst, true);
+		}
 	}
 
 	return ret;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index b72d503dd740..271e14469223 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -207,7 +207,8 @@ static void iris_hfi_gen1_event_seq_changed(struct iris_inst *inst,
 		flush_pkt.shdr.hdr.pkt_type = HFI_CMD_SESSION_FLUSH;
 		flush_pkt.shdr.session_id = inst->session_id;
 		flush_pkt.flush_type = HFI_FLUSH_OUTPUT;
-		iris_hfi_queue_cmd_write(inst->core, &flush_pkt, flush_pkt.shdr.hdr.size);
+		if (!iris_hfi_queue_cmd_write(inst->core, &flush_pkt, flush_pkt.shdr.hdr.size))
+			inst->flush_responses_pending++;
 	}
 
 	iris_vdec_src_change(inst);
@@ -408,7 +409,9 @@ static void iris_hfi_gen1_session_ftb_done(struct iris_inst *inst, void *packet)
 		flush_pkt.shdr.hdr.pkt_type = HFI_CMD_SESSION_FLUSH;
 		flush_pkt.shdr.session_id = inst->session_id;
 		flush_pkt.flush_type = HFI_FLUSH_OUTPUT;
-		iris_hfi_queue_cmd_write(core, &flush_pkt, flush_pkt.shdr.hdr.size);
+		if (!iris_hfi_queue_cmd_write(core, &flush_pkt, flush_pkt.shdr.hdr.size))
+			inst->flush_responses_pending++;
+
 		iris_inst_sub_state_change_drain_last(inst);
 
 		return;
@@ -558,7 +561,6 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
 	const struct iris_hfi_gen1_response_pkt_info *pkt_info;
 	struct device *dev = core->dev;
 	struct hfi_session_pkt *pkt;
-	struct completion *done;
 	struct iris_inst *inst;
 	bool found = false;
 	u32 i;
@@ -619,9 +621,12 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
 			if (shdr->error_type != HFI_ERR_NONE)
 				iris_inst_change_state(inst, IRIS_INST_ERROR);
 
-			done = pkt_info->pkt == HFI_MSG_SESSION_FLUSH ?
-				&inst->flush_completion : &inst->completion;
-			complete(done);
+			if (pkt_info->pkt == HFI_MSG_SESSION_FLUSH) {
+				if (!(--inst->flush_responses_pending))
+					complete(&inst->flush_completion);
+			} else {
+				complete(&inst->completion);
+			}
 		}
 		mutex_unlock(&inst->lock);
 
diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index caa3c6507006..06a7f1174ad5 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -27,6 +27,7 @@
  * @crop: structure of crop info
  * @completion: structure of signal completions
  * @flush_completion: structure of signal completions for flush cmd
+ * @flush_responses_pending: counter to track number of pending flush responses
  * @fw_caps: array of supported instance firmware capabilities
  * @buffers: array of different iris buffers
  * @fw_min_count: minimnum count of buffers needed by fw
@@ -57,6 +58,7 @@ struct iris_inst {
 	struct iris_hfi_rect_desc	crop;
 	struct completion		completion;
 	struct completion		flush_completion;
+	u32				flush_responses_pending;
 	struct platform_inst_fw_cap	fw_caps[INST_FW_CAP_MAX];
 	struct iris_buffers		buffers[BUF_TYPE_MAX];
 	u32				fw_min_count;

-- 
2.34.1


