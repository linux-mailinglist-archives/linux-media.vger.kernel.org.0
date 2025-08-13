Return-Path: <linux-media+bounces-39762-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 960E9B245A3
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 11:40:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 734C556771E
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 09:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 850732F656B;
	Wed, 13 Aug 2025 09:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dvB0VBFG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FE22F1FDE;
	Wed, 13 Aug 2025 09:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755077928; cv=none; b=ZzShBqPRi0Ehy/MazWfFSpnBSlVTSsAwasEdN/R0y80tMwwffMsScg3miyLehFejw8oTWEEtsjO8kn4czzVhaqxSngfQi+K6d/V1LC4Ms9bkrg9+Y8kwiT/fbtxrn/KdJhgDJes+AqDQls6qxJTnh9DD3Zs1cl6ofSG1mzHBerw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755077928; c=relaxed/simple;
	bh=VqQusYQwVQqLTeLPImdjn7tLxXo2SHML2/mqCy9a4Ag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=a2KdB36625aH8yyFnesTEZgaKdmEOAHWdid0Pb1hpAVxqNVaXVTNXpN6pgayYf+/Q7uXxm5SYwoZYTMusr1AEuHlzQfAfT3+BnyS+bHIbiDZa+3YAvubvVfosD3Ga7dVllChEUC0Z192xk5UvPgO8mqHgnmHCv23kO1mFPZXo/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dvB0VBFG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D6mLMD026036;
	Wed, 13 Aug 2025 09:38:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fdq17yz8npaW0M0r+OVho34oDfPlyWS12re7Sw7p+98=; b=dvB0VBFGIQFTcGWx
	FQoa5HbAR5TyxKmwN5OF0hwiCzonUtM7FRdeRQMF2yvjqZ2XloukIQ1OfUZSy0ox
	TS2n/mqL228X91i7+dVla8D/9HmrlL6J44RRk03M1EVlHPgJ/6f3yHy6gmuV9Wp2
	ZMDADyTq+LFmRGyBttSMhmg17ZW7NlaIVgFp9RjtfO5uvmceawSw4iYR040aXO79
	mVgHGM+ChDiZ5lioeqIFwecHKPnNvPPJDKEKGu9HGrzqk84phPxUpDfqYb5QYA80
	xQgNyFoxb+yoi5rK/5zyxAbGPwUHIFvr/wslYw9lJoIGqO0pJQQwto8ua/MtTGEf
	VHnyHA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9sugkv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 09:38:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57D9ceK6003396
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 09:38:40 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 13 Aug 2025 02:38:37 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 13 Aug 2025 15:07:55 +0530
Subject: [PATCH v2 05/24] media: iris: Allow substate transition to load
 resources during output streaming
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250813-iris-video-encoder-v2-5-c725ff673078@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755077896; l=1499;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=VqQusYQwVQqLTeLPImdjn7tLxXo2SHML2/mqCy9a4Ag=;
 b=rLpO2opy0L0uQ8aYxXJlnvnpu+dkKeTLQNytroWObaC/9KOBJ9LlJKjYiRNYGoixjTaK8Gv22
 /IDN1lv9umFCorwHsj3RWsrv80X926t7z8uLrHuAPMnzUX3tuunn3sO
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=689c5d21 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=lu2khcAHcSyz6XcsDAYA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: otiCwOOfpsL3xrw6BWmKzdVNvhe08swa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfX1Xxhjv6e3b2z
 8SxKxPjtuPGTxGsE09mdTH3bzMUi0jh5X3keHMayVycLoZGRFFiE3b9iUwHn/YsydOjTDi4DeCZ
 +msGBpQY+NkQs2dKwLM1zpA7/JgzMsZDKTNvNdboGSvFhylbykhkNViJso1ba5EYG2RRUejKrbA
 WEyufCAnhVejMrywYw9/VVWeZM+ysdcbN7lDim3rh4YYkZqzmg/6FcGN5X6kOf8kw3WTyZWJxtd
 HH+5L9sx+0x50uU0c9ZGqQ+X/jPcmSCAhj1N8nvhlzBJ8S2YS2rT677DuxKtIWEHcAaERWJYS/u
 Y8/iwBdX/93iJpOUZY38aoVK5XlHlWc7UEjswMMfqQziQUPAq/Mm1Wum7D0LK388NbXjR644Bg5
 zCRdtDfK
X-Proofpoint-GUID: otiCwOOfpsL3xrw6BWmKzdVNvhe08swa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015

Previously, the transition to load resources substate was only allowed
when instance state was INIT, since capture port streaming was not
permitted before output port streaming in the driver.
However, now after removing that restriction, the instance state can be
OUTPUT_STREAMING when firmware start is triggered and substate needs to
be moved to LOAD_RESOURCES.

Fixes: 547f7b8c5090 ("media: iris: add check to allow sub states transitions")
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_state.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_state.c b/drivers/media/platform/qcom/iris/iris_state.c
index 104e1687ad39dab93ff66450ba3a97c309b1e1e1..a21238d2818f9606871953bd0bee25382cca0474 100644
--- a/drivers/media/platform/qcom/iris/iris_state.c
+++ b/drivers/media/platform/qcom/iris/iris_state.c
@@ -122,7 +122,8 @@ static bool iris_inst_allow_sub_state(struct iris_inst *inst, enum iris_inst_sub
 		return false;
 	case IRIS_INST_OUTPUT_STREAMING:
 		if (sub_state & (IRIS_INST_SUB_DRC_LAST |
-			IRIS_INST_SUB_DRAIN_LAST | IRIS_INST_SUB_OUTPUT_PAUSE))
+			IRIS_INST_SUB_DRAIN_LAST | IRIS_INST_SUB_OUTPUT_PAUSE |
+			IRIS_INST_SUB_LOAD_RESOURCES))
 			return true;
 		return false;
 	case IRIS_INST_STREAMING:

-- 
2.34.1


