Return-Path: <linux-media+bounces-22919-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7815D9E956B
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 14:02:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB314165482
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 13:02:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67FB122B590;
	Mon,  9 Dec 2024 12:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gZXBL3UV"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4206F22A1EF;
	Mon,  9 Dec 2024 12:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733748915; cv=none; b=N82vBn1DTmWxQ+9OGlHOEF51oKUKHXyoQmQ5SHHa9u64tLh38jfsmULK8WicFWDpw0euebjwDbQwyxTNCn0dJvslSqKb23nokc3bhNVMNj8TrUhWlcsbk/iNfE61AA/gA1wrpE4Pa6q/EqYo7aW573VZDtYtq1o2h1PswYJvShs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733748915; c=relaxed/simple;
	bh=x28STAYFolWfEoZ22/KnQCtaHiStAuNaFgZEgFxEUwU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=IckC1mO5TNKVuMheGG2ZgrNrg9maY2T6Bh4t9n0zU7w/HdYyU4YPoB0J/4om7RTDRbbTn8Iwu42RCgIRWQIcVxytZgmzIwwqqnLM06vflP8Gqa0q5kHy6BabxvUGBC0HlCX909/WpISpa4969yGbzCxsQYG1SfBKApL3qQ2xl7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gZXBL3UV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9AJLpV026537;
	Mon, 9 Dec 2024 12:55:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B2yagOTuat//51o0fk/IwmqkCygqht3psurGMbuF0eI=; b=gZXBL3UVcA1cHfLk
	R00kAxNpNE6aGd+AOwZv7uC8bbTZu8aFhbiMn6/ftGhtQ5sdMPp+/G5ryjKStKaz
	Vba9jqCdbywDBnTX9Xm4YURE64ZrkC9uiqe1cLfQMDdXkQ8m6uc0g7plMpZtP2J3
	42opGmbubQb2v9OfcO5kW1YMk63Z4kqcNCWEqbFDCn2ursGA9j2nHBw/9tx3fJ1K
	VPFF0tFQ/rSC2kQLbbiiQPs1F9t0MVJC+2tL4AjOxLrxIWFwzwfBxox1V3HgEvst
	C6dFl8uxPBjzXJ1uFehoxuuvYQPG0Mrt4w3PTMjQqfczgxRvYrYNwFWUUVRZz+lO
	ci6g9w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43cfn8vqy8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 12:55:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B9Ct4qP011527
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Dec 2024 12:55:04 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Dec 2024 04:54:59 -0800
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Mon, 9 Dec 2024 18:22:11 +0530
Subject: [PATCH v7 26/28] media: iris: add check to allow sub states
 transitions
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241209-qcom-video-iris-v7-26-05c6bdead47b@quicinc.com>
References: <20241209-qcom-video-iris-v7-0-05c6bdead47b@quicinc.com>
In-Reply-To: <20241209-qcom-video-iris-v7-0-05c6bdead47b@quicinc.com>
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
        Jianhua Lu <lujianhua000@gmail.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        "Dikshita
 Agarwal" <quic_dikshita@quicinc.com>,
        Vedang Nagar <quic_vnagar@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733748748; l=5132;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=pH2n+gEdApaTchQwHQ0q0A+CBGKgbQ24Pvt9VdnZh4o=;
 b=bETHMmlMMCZrzqRvPA5eLqKz31N25ZwaHjuSexx4221Ci6MyT8ziBBw1NtiDpat2GPqYDnfCv
 caoVlI9EbKZDrCvO9cpfi0Essc3C7iRaHUqqXCIwiJcZO3BkjTIGBxB
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: yYrQ7LdMlGC0bWbulLK2syU9q1wWx2_4
X-Proofpoint-ORIG-GUID: yYrQ7LdMlGC0bWbulLK2syU9q1wWx2_4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 spamscore=0 impostorscore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 bulkscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412090101

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
index bf645f6f879c..4bb37423ed05 100644
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


