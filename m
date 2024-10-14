Return-Path: <linux-media+bounces-19585-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A6699C53A
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 11:17:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB0BF1F26D00
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 09:17:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F029C1BDAB9;
	Mon, 14 Oct 2024 09:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QCNmcVO0"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C733E1B85F0;
	Mon, 14 Oct 2024 09:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728896983; cv=none; b=jYO691z3GThK1dw0U5wGsaau6xQbBoo4RXRhhMtQ+GwEM4Bb0Fsm9+7ty3pWQx1QI1am5Dh8T74vPq5BA08wH7LUzh+6d435R7Y1gaz3CWqpX+Ee1bFch+VpXwXz8YgMKGG/aQ43syfhMOpTChN1zKMQ3GHpJDFvXwxtDsFzIFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728896983; c=relaxed/simple;
	bh=7SB2h+DYNqGTLuveI2bTHta2W3h0cEdaFcNjfYuBCYQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=a1VD0XzdoLnOs+4pBQp7fmJiwxw6lru3OAHy+9cpPFjWqkzYqnkcRoGpCGDjCxdyxiekzBIS0LPcR60VhKWg+TecMJRfQehB2L0UzwOGz+WtoK2HrWIWjXorDNgPzwW9JVIw/LwO7oqAGliGVBmFchNCJNOWHftAPQ7c27du/Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QCNmcVO0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49DMx10W019570;
	Mon, 14 Oct 2024 09:09:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LF6EUZ4l7pTkyx4Rrr1AODxmaj3ctpSzX9J+QU8mCIk=; b=QCNmcVO0tR1EzFCX
	UFpoapu34J1sz3IkribkHyFcWsvOuBYtFEF97XomUSLMW13BRhKImsCa3rpwXsWC
	fQUmai6YDjPVXymJr9JcMaTyOroiAbtb6qt7lrIkgphLPZyPzGvu+kgSaLbbFaq6
	+1wyR8P5laPT/NXtEXbKDEHwMv58x6EZL49SF6FS6cDe1lKelnejEWvtdozwd+dC
	F3HpXKeqGZ3JkJODFv4TPysL9HFJhTDv2oghICucTRXlXffLOigQe0cC+N6SiE+k
	WkoAMzKoLF1kPpAztz+FO7WR9cTTMY8Tg3oa8fqG+nMAODVwjnZI0DxRAI86QGZM
	jlVZ7g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 427etec2ar-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 09:09:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49E99a3G020346
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 09:09:36 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 14 Oct 2024 02:09:31 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Mon, 14 Oct 2024 14:37:47 +0530
Subject: [PATCH v4 26/28] media: iris: add check to allow sub states
 transitions
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241014-qcom-video-iris-v4-v4-26-c5eaa4e9ab9e@quicinc.com>
References: <20241014-qcom-video-iris-v4-v4-0-c5eaa4e9ab9e@quicinc.com>
In-Reply-To: <20241014-qcom-video-iris-v4-v4-0-c5eaa4e9ab9e@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: Hans Verkuil <hverkuil@xs4all.nl>,
        Sebastian Fricke
	<sebastian.fricke@collabora.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Vedang Nagar <quic_vnagar@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728896854; l=5132;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=wVbesrtCYLXyMN3dIoe9SACGOL/nfsZSpxeNkJyV35U=;
 b=UdQSH6wJLNKQ0JkilZuYFXQXMdaKqzOVzgcTKJ7+Nt62CqbuhDugsQCGLh6ztfNUzFtriHj2U
 y5sNqlJUjjCCblO5VRkAckj5yQLgO6bhUBfgBsWERjIVLQ0PhdEHFSZ
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Ai_328U_zUvGNFxylwDrnt7EksI7T4s-
X-Proofpoint-GUID: Ai_328U_zUvGNFxylwDrnt7EksI7T4s-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 mlxscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410140066

From: Vedang Nagar <quic_vnagar@quicinc.com>

Based on state machine design, add allow checks to
transition from one sub-state to another sub-states.

Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 .../platform/qcom/iris/iris_hfi_gen1_command.c     | 12 ++++++-
 drivers/media/platform/qcom/iris/iris_state.c      | 40 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_state.h      |  3 ++
 3 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index ef65a1301a79..255fe152888e 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -135,6 +135,9 @@ static int iris_hfi_gen1_session_start(struct iris_inst *inst, u32 plane)
 	if (!V4L2_TYPE_IS_OUTPUT(plane))
 		return 0;
 
+	if (inst->sub_state & IRIS_INST_SUB_LOAD_RESOURCES)
+		return 0;
+
 	reinit_completion(&inst->completion);
 	iris_hfi_gen1_packet_session_cmd(inst, &packet, HFI_CMD_SESSION_LOAD_RESOURCES);
 
@@ -153,7 +156,11 @@ static int iris_hfi_gen1_session_start(struct iris_inst *inst, u32 plane)
 	if (ret)
 		return ret;
 
-	return iris_wait_for_session_response(inst, false);
+	ret = iris_wait_for_session_response(inst, false);
+	if (ret)
+		return ret;
+
+	return iris_inst_change_sub_state(inst, 0, IRIS_INST_SUB_LOAD_RESOURCES);
 }
 
 static int iris_hfi_gen1_session_stop(struct iris_inst *inst, u32 plane)
@@ -180,6 +187,9 @@ static int iris_hfi_gen1_session_stop(struct iris_inst *inst, u32 plane)
 		ret = iris_hfi_queue_cmd_write(core, &pkt, pkt.shdr.hdr.size);
 		if (!ret)
 			ret = iris_wait_for_session_response(inst, false);
+
+		iris_inst_change_sub_state(inst, IRIS_INST_SUB_LOAD_RESOURCES, 0);
+
 		iris_helper_buffers_done(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
 					 VB2_BUF_STATE_ERROR);
 		iris_helper_buffers_done(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
diff --git a/drivers/media/platform/qcom/iris/iris_state.c b/drivers/media/platform/qcom/iris/iris_state.c
index f12306e735ec..5976e926c83d 100644
--- a/drivers/media/platform/qcom/iris/iris_state.c
+++ b/drivers/media/platform/qcom/iris/iris_state.c
@@ -105,6 +105,43 @@ int iris_inst_state_change_streamoff(struct iris_inst *inst, u32 plane)
 	return iris_inst_change_state(inst, new_state);
 }
 
+static bool iris_inst_allow_sub_state(struct iris_inst *inst, enum iris_inst_sub_state sub_state)
+{
+	if (!sub_state)
+		return true;
+
+	switch (inst->state) {
+	case IRIS_INST_INIT:
+		if (sub_state & IRIS_INST_SUB_LOAD_RESOURCES)
+			return true;
+		return false;
+	case IRIS_INST_INPUT_STREAMING:
+		if (sub_state & (IRIS_INST_SUB_FIRST_IPSC | IRIS_INST_SUB_DRC |
+			IRIS_INST_SUB_DRAIN | IRIS_INST_SUB_INPUT_PAUSE))
+			return true;
+		return false;
+	case IRIS_INST_OUTPUT_STREAMING:
+		if (sub_state & (IRIS_INST_SUB_DRC_LAST |
+			IRIS_INST_SUB_DRAIN_LAST | IRIS_INST_SUB_OUTPUT_PAUSE))
+			return true;
+		return false;
+	case IRIS_INST_STREAMING:
+		if (sub_state & (IRIS_INST_SUB_DRC | IRIS_INST_SUB_DRAIN |
+			IRIS_INST_SUB_DRC_LAST | IRIS_INST_SUB_DRAIN_LAST |
+			IRIS_INST_SUB_INPUT_PAUSE | IRIS_INST_SUB_OUTPUT_PAUSE))
+			return true;
+		return false;
+	case IRIS_INST_DEINIT:
+		if (sub_state & (IRIS_INST_SUB_DRC | IRIS_INST_SUB_DRAIN |
+			IRIS_INST_SUB_DRC_LAST | IRIS_INST_SUB_DRAIN_LAST |
+			IRIS_INST_SUB_INPUT_PAUSE | IRIS_INST_SUB_OUTPUT_PAUSE))
+			return true;
+		return false;
+	default:
+		return false;
+	}
+}
+
 int iris_inst_change_sub_state(struct iris_inst *inst,
 			       enum iris_inst_sub_state clear_sub_state,
 			       enum iris_inst_sub_state set_sub_state)
@@ -124,6 +161,9 @@ int iris_inst_change_sub_state(struct iris_inst *inst,
 
 	prev_sub_state = inst->sub_state;
 
+	if (!iris_inst_allow_sub_state(inst, set_sub_state))
+		return -EINVAL;
+
 	inst->sub_state |= set_sub_state;
 	inst->sub_state &= ~clear_sub_state;
 
diff --git a/drivers/media/platform/qcom/iris/iris_state.h b/drivers/media/platform/qcom/iris/iris_state.h
index 4bdd55af4f30..77b344096618 100644
--- a/drivers/media/platform/qcom/iris/iris_state.h
+++ b/drivers/media/platform/qcom/iris/iris_state.h
@@ -113,6 +113,8 @@ enum iris_inst_state {
  * IRIS_INST_SUB_OUTPUT_PAUSE: last buffer is received form firmware as part
  *                             of drc sequence. This indicates that
  *                             firmware is paused to process any further output frames.
+ * IRIS_INST_SUB_LOAD_RESOURCES: indicates all the resources have been loaded by the
+ *                               firmware and it is ready for processing.
  */
 enum iris_inst_sub_state {
 	IRIS_INST_SUB_FIRST_IPSC	= BIT(0),
@@ -122,6 +124,7 @@ enum iris_inst_sub_state {
 	IRIS_INST_SUB_DRAIN_LAST	= BIT(4),
 	IRIS_INST_SUB_INPUT_PAUSE	= BIT(5),
 	IRIS_INST_SUB_OUTPUT_PAUSE	= BIT(6),
+	IRIS_INST_SUB_LOAD_RESOURCES	= BIT(7),
 };
 
 int iris_inst_change_state(struct iris_inst *inst,

-- 
2.34.1


