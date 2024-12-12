Return-Path: <linux-media+bounces-23314-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B5B9EE5FB
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 13:00:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22BFB284C55
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 12:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFACD226557;
	Thu, 12 Dec 2024 11:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SMgB6lSQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2290226539;
	Thu, 12 Dec 2024 11:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734004470; cv=none; b=AuuI++dmmpyeJ9sTNKqJv2Hph4gGtD+xJC15O/utaR2ZjXCDA13O3ObZ38ue5psjWzt8r1cwUPEmz3eJjAFvJOKIzsFHEBrHgNPklKTvqvowDEzEO2W9fb0SLvIAvHQLoE/QIvmlLBLZDKMEuuYPSt8hbTeNUNfaRTMCZaDfovs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734004470; c=relaxed/simple;
	bh=+7Q9OZlkoF4c2JKIba2hsXFzMzbwW/Tw5mwZspB3XPc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=mu58ZXifhzCuHbdp/PbLzVI2tg9K2H73esxsOh9Ssn50whXIjWjhbsjlT/kZYuDEVoCrgRbyr10rAeXrVlmW0eokm3gjEqpzlDZ0IaKCbywRB1CX1BSW1y9SBr6ugRoQRorwB8ekEFAxqP87dYzpg6iPmDnQu+mhq17oPnGTjfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SMgB6lSQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC7cSfl032708;
	Thu, 12 Dec 2024 11:54:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eZ9qvQfu1fCVN+lMiqrmcDN3tm2BRtvz9AZ+6n3Kd2Y=; b=SMgB6lSQK1RFHILJ
	gi7COH9efqNCWCvgjBh6CgJja/f8cnVZn0z8tTTFdxAir86HyEidIZxHL3J07AZj
	ZY9lvqZoy48RE8CEG3Tzi8UtYkuocesCIFF1HQA35tC2hWUUrqQtP/5E/9wqYF8B
	mWUtNz1BNw/sB8i4nqGHXKKZewcrf3gvbfGav5BQmpdeoimZf9gcAfOxNBJAWypX
	fFnAoSpBkCS8ZM1uegZEtQUmZ4ilTcMgDw+O5mhRa3fGODyv5ft3F/dc66mfZg6w
	bNAvgODqi1e7uU0miOw1LTpRDnuN6+t2v6p2N0NLVDHmcblrWdfZmssUv0xWGv7u
	LComYQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43f6tfc1qn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 11:54:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BCBsJdJ005459
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 11:54:19 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 12 Dec 2024 03:54:13 -0800
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Thu, 12 Dec 2024 17:21:48 +0530
Subject: [PATCH v9 26/28] media: iris: add check to allow sub states
 transitions
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241212-qcom-video-iris-v9-26-e8c2c6bd4041@quicinc.com>
References: <20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com>
In-Reply-To: <20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734004294; l=5263;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=7MyFk3WYqOhG3vgB35FidV5KQvG9n9PytQ76OJ/iSj4=;
 b=POPVhw4CoTsL+zw4RFOWBG5OObTMjN64zS0abOEWj5XHJZAkKC9x6tyP+cS2UKRTo84bLJ3Gg
 Df71wK8ZyPpA3L9Yl6E5lq3i42vzhOhygd1fZ7GOV23sNjZuxN1id2P
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: NR9_u9DoVo5xyE4950KtJje-R3t4vG4e
X-Proofpoint-ORIG-GUID: NR9_u9DoVo5xyE4950KtJje-R3t4vG4e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120085

From: Vedang Nagar <quic_vnagar@quicinc.com>

Based on state machine design, add allow checks to transition from one
sub-state to another sub-states.

Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
Tested-by: Stefan Schmidt <stefan.schmidt@linaro.org> # x1e80100 (Dell
Reviewed-by: Stefan Schmidt <stefan.schmidt@linaro.org>
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


