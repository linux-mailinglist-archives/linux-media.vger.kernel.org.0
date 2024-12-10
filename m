Return-Path: <linux-media+bounces-23049-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9F59EAF70
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 12:13:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE4A3160660
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 11:13:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8551E239792;
	Tue, 10 Dec 2024 11:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iiQyoBsv"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B36223E66;
	Tue, 10 Dec 2024 11:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733828906; cv=none; b=WKotDyqTpiHRQhJLV9+YmSOeV53Gaz40smmI5em7yXWn2wesDlRG/4po+1c9xFwUaoYUVV8FHrq5co+dzbJrLteSSy8op/+quJrtv+pfbAeT9tK7VD7SfCyb2feC1eM9ISVnJsBy5fPEUaKcYJWsUF6wGsbAq26BHggU440E2sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733828906; c=relaxed/simple;
	bh=FLZGXbJ33jtPeO+1F5gow5FHY55Q4GaXIxco9IkiHKo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=QQfcQs8NVUzCqSYqHgIq2dyUXJp3uGh+HDM0c6LCoWRN5rOysst3as1F8z4eG2CB9oRRMQgP1/ykAfx0XalXgEnR4XT/mu24kGIYHvAMrfTU+usUwQ5Wx2NMuSsySBqhYmRcg1ohvakzVgKHQYXTrWFoQHnDKoD/MI+55iArHMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iiQyoBsv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BAAgX98017548;
	Tue, 10 Dec 2024 11:08:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nFVyIsWQ7eDYReRMM6saQSIWXu+5mshJqPCre6HrSro=; b=iiQyoBsvj2oFFLNY
	H4NEbY5YbkYY+fiaG+b2WZhV2OUpt7VlgFQdWT+c+GB8hlEDusJC8aPkkYQBskZx
	yXNL65QxZsUPiYpmMPP/oQfH3iP9vakmhwPaj58cc9T2dCziKwM8kBVZAPLT+gO+
	PBo8tXLHekzQNmGCHEWpafIr2UHl1agPMnJuhRhnK1CVYFVPn1v9bdI6Tz+CXnrb
	8fWfbmT+l5mk2sSr4P8WROEId0kWLC72dlTLUyEHCbbtqoQTwzup+aHWzXz3OW95
	RRXuadtyVod/6nQCrda7hovzUu/Tnn6YnzZI+HmmtIAnLCHv+v0IknL0NOJ+zWSd
	cabu0w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43eak39kra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 11:08:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BAB8Fo8024836
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 11:08:15 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 10 Dec 2024 03:08:09 -0800
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Tue, 10 Dec 2024 16:35:30 +0530
Subject: [PATCH v8 26/28] media: iris: add check to allow sub states
 transitions
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241210-qcom-video-iris-v8-26-42c5403cb1a3@quicinc.com>
References: <20241210-qcom-video-iris-v8-0-42c5403cb1a3@quicinc.com>
In-Reply-To: <20241210-qcom-video-iris-v8-0-42c5403cb1a3@quicinc.com>
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
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Nicolas Dufresne
	<nicolas@ndufresne.ca>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>,
        Jianhua Lu <lujianhua000@gmail.com>,
        "Stefan
 Schmidt" <stefan.schmidt@linaro.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Vedang Nagar <quic_vnagar@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733828732; l=5134;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=03px0IaiWqMdA4GS4rgdFKNHkGGDtzNmZ5A/e/n0bgI=;
 b=vQ1Hvt+t0M8fbffdT3QNW5DHvnEJIcCktDRRZ7Dxt/URQ2E9mg8GTZqcVpSV5NuckX+ZBAV1b
 Ujstw26V+GMDnWovIRoxKp60wGo0E4wuH7OkGGaRxm1slQCxxa+Jkbd
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: spl9Bq9m8u6bxtczNk1rdIw607ITTo2D
X-Proofpoint-GUID: spl9Bq9m8u6bxtczNk1rdIw607ITTo2D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 spamscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412100083

From: Vedang Nagar <quic_vnagar@quicinc.com>

Based on state machine design, add allow checks to transition from one
sub-state to another sub-states.

Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 .../platform/qcom/iris/iris_hfi_gen1_command.c     | 12 ++++++-
 drivers/media/platform/qcom/iris/iris_state.c      | 40 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_state.h      |  3 ++
 3 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index e1fbbb3c196d..64f887d9a17d 100644
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
index a5c0cad4a78c..78c61aac5e7e 100644
--- a/drivers/media/platform/qcom/iris/iris_state.h
+++ b/drivers/media/platform/qcom/iris/iris_state.h
@@ -113,6 +113,8 @@ enum iris_inst_state {
  * @IRIS_INST_SUB_OUTPUT_PAUSE: last buffer is received form firmware as part
  *                             of drc sequence. This indicates that
  *                             firmware is paused to process any further output frames.
+ * @IRIS_INST_SUB_LOAD_RESOURCES: indicates all the resources have been loaded by the
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


