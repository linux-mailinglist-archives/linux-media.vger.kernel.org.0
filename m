Return-Path: <linux-media+bounces-39767-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F94B245CD
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 11:44:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DAB21BC514E
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 09:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61E3F2FA0EC;
	Wed, 13 Aug 2025 09:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="n5yUF9ka"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6A22FAC1B;
	Wed, 13 Aug 2025 09:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755077946; cv=none; b=UvCqnuttboWHYHQAhTfafQW6DIL8BShdFN2oyKJqLuT+v//aUYXhapYocLl8G+4ASAhzduady6FhvTFFiA3qt7cYuZWCmeRazsh9G83R/MXyjrJCGr0tPcfpKrn6gBnzUFAJTX0gsVzq1e1oeiMdAfP3PTFAY8L5XGP3GK1WG4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755077946; c=relaxed/simple;
	bh=O7YAz85oofRY4cJVin8WxLxNkB2T+aMvTsSgEtQ5Zj0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=QhpNwWUQQuVOa10pgwin3ocGp2jqRWA9jS66OifWvPoAHhvzXq7KQ6qhu7HO/iod4z4Dc68yfgO3qAQSamqxPercd8VN3VEezckCOOueR8LBJLSJEwqxooh+p7OQBX8naLb2xFc2YXmOp91UlB4tvWzJxYVF0qFiW0TdBzCjvSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=n5yUF9ka; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D6mL0B015759;
	Wed, 13 Aug 2025 09:39:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3MG6u6mEWjT1gZ0JHKq6arltOlVW3lATXuxdUuOz1fc=; b=n5yUF9kaVaryziEC
	VZXk7rEPe1oL3z+X7E1wE3OsdURtbZlBBY51aXrT+Y+2NNC7pHZ8ekocjf1N4p2k
	ddoiMQbCK7BbvqRSR6Wkdk6gLwLOFkYwk5t8gkZpDXe1+aBSL9H1MUsti34OvgP8
	HWNnadXlF39Pi3gnbn5uCgsAl93SBW1n5xHS5gkKrzLItAzIItUqejEqJtTlCrdg
	ogxRVUsrLIXAjFSru+D8alGEHHlnobHXCdLiC5UNLTJccXd5VHi7POGfewKd9I01
	pfPcWc7n8m4bZjAW22HhqCS137JnJiUWfzVBa3TICDJpTjkrYR3+jT3oRNP354gX
	KFOCAw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fjxbefkm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 09:39:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57D9d0fE028747
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 09:39:00 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 13 Aug 2025 02:38:56 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 13 Aug 2025 15:08:00 +0530
Subject: [PATCH v2 10/24] media: iris: Fix missing LAST flag handling
 during drain
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250813-iris-video-encoder-v2-10-c725ff673078@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755077896; l=3403;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=O7YAz85oofRY4cJVin8WxLxNkB2T+aMvTsSgEtQ5Zj0=;
 b=xk155xeqCJpw2GgpRiezPpKOmUbhERKqr1IXaRQcrcdIXlqKR+SJzehEmVCDiz/SSkVvzg/6V
 dmSz6fIChovA9n/UMgu6/hJeZitPveVcr+0SB0bykKJFpiO0spgLB3Z
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=G6EcE8k5 c=1 sm=1 tr=0 ts=689c5d35 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=0wdjZXPW0me86wH4VXQA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA5NyBTYWx0ZWRfXyFHPoskaeqxM
 VS/pZb64FGsNbrygmk+qMr9d7A6G+Sln/mTEriGs+1HakXj5ljLcX7wPW5Ec7Z0P4qF0LDeRiOC
 poJMY17Z6cbE8DNl9NzB054WNCe0f5kowtk6lbopfmYUGb+K/5qvMvHOi9fpSaBRJa9aR3X1eWs
 V6xrtfOUgFm3WAmjggljjnE7l9/jXsg6DFr9xib8VSqoH3c5dlR0HNjX9XTlz1LdD+oj8ZkP17B
 j72CDFPTB+xAh/pKB05k6aT6xBvxg5hwfMPUEGc1zGeGkqUPh9uSeAIWgcXTh+YskDTMpzPJNPU
 CjyYTHh1HrMQMOvquMOw+OOg/Kqkw/Y8u6HhuFomlGi49Yz74RiNv8NWHBZancxno0OeBzq0633
 MyyZcD7i
X-Proofpoint-ORIG-GUID: gTV8a5ebtQZSpMwNg9m9-uHVUCuvT4e4
X-Proofpoint-GUID: gTV8a5ebtQZSpMwNg9m9-uHVUCuvT4e4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110097

Improve drain handling by ensuring the LAST flag is attached to final
capture buffer when drain response is received from the firmware.

Previously, the driver failed to attach the V4L2_BUF_FLAG_LAST flag when
a drain response was received from the firmware, relying on userspace to
mark the next queued buffer as LAST. This update fixes the issue by
checking the pending drain status, attaching the LAST flag to the
capture buffer received from the firmware (with EOS attached), and
returning it to the V4L2 layer correctly.

Fixes: d09100763bed ("media: iris: add support for drain sequence")
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c | 4 +---
 drivers/media/platform/qcom/iris/iris_state.c             | 2 +-
 drivers/media/platform/qcom/iris/iris_state.h             | 1 +
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index 8d1ce8a19a45ebb2b29457e0fef7d72c1c0d9785..2a96458833835422d30c9386d15cc1e4fb226e3d 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -416,8 +416,6 @@ static void iris_hfi_gen1_session_ftb_done(struct iris_inst *inst, void *packet)
 			inst->flush_responses_pending++;
 
 		iris_inst_sub_state_change_drain_last(inst);
-
-		return;
 	}
 
 	if (iris_split_mode_enabled(inst) && pkt->stream_id == 0) {
@@ -462,7 +460,7 @@ static void iris_hfi_gen1_session_ftb_done(struct iris_inst *inst, void *packet)
 		timestamp_us = (timestamp_us << 32) | timestamp_lo;
 	} else {
 		if (pkt->stream_id == 1 && !inst->last_buffer_dequeued) {
-			if (iris_drc_pending(inst)) {
+			if (iris_drc_pending(inst) || iris_drain_pending(inst)) {
 				flags |= V4L2_BUF_FLAG_LAST;
 				inst->last_buffer_dequeued = true;
 			}
diff --git a/drivers/media/platform/qcom/iris/iris_state.c b/drivers/media/platform/qcom/iris/iris_state.c
index a21238d2818f9606871953bd0bee25382cca0474..d1dc1a863da0b0b1af60974e9ed2ef68ea225cdd 100644
--- a/drivers/media/platform/qcom/iris/iris_state.c
+++ b/drivers/media/platform/qcom/iris/iris_state.c
@@ -252,7 +252,7 @@ bool iris_drc_pending(struct iris_inst *inst)
 		inst->sub_state & IRIS_INST_SUB_DRC_LAST;
 }
 
-static inline bool iris_drain_pending(struct iris_inst *inst)
+bool iris_drain_pending(struct iris_inst *inst)
 {
 	return inst->sub_state & IRIS_INST_SUB_DRAIN &&
 		inst->sub_state & IRIS_INST_SUB_DRAIN_LAST;
diff --git a/drivers/media/platform/qcom/iris/iris_state.h b/drivers/media/platform/qcom/iris/iris_state.h
index e718386dbe0402417f408d8fc696a33e5c7f23b3..b09fa54cf17eeee0c9ae254588964ad959c82c80 100644
--- a/drivers/media/platform/qcom/iris/iris_state.h
+++ b/drivers/media/platform/qcom/iris/iris_state.h
@@ -141,5 +141,6 @@ int iris_inst_sub_state_change_drc_last(struct iris_inst *inst);
 int iris_inst_sub_state_change_pause(struct iris_inst *inst, u32 plane);
 bool iris_allow_cmd(struct iris_inst *inst, u32 cmd);
 bool iris_drc_pending(struct iris_inst *inst);
+bool iris_drain_pending(struct iris_inst *inst);
 
 #endif

-- 
2.34.1


