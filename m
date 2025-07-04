Return-Path: <linux-media+bounces-36771-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C639CAF8B35
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 10:22:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 484386E82CC
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 08:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 597EE288512;
	Fri,  4 Jul 2025 07:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Kz9L+s6E"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0502853EB;
	Fri,  4 Jul 2025 07:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615632; cv=none; b=P6NVJW2afX+EA9eP1652Ilh4N1xsk5baWobLwDHzflt/jcd7PqMfkxtFYTuLaNGkG1hMWE5IBr92xFmE4tNw/7I/jwROu+NkDVdhcT3Gqw9Rwlk1GaSRaJjS1U66cjbG6UqBf/BNE3zR/TMJodW+fE+FtWK791vWTLJhgWM4+tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615632; c=relaxed/simple;
	bh=0Pf75v5OaEW2TsnHb7bM1RCGbkIAWKJpnd+MVuR3y7U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=g0xumO3nCCKeZUDrEYBvDMNgGZJoexRQUFxrQBwdIOdJSBoNJ3R5IgSEQ/KF7uoYOh2wQULtVVIdgKwvk+sqxE66fw3rRkU0b08hni5n15ZRut2uzRohF9TwUfiN0JU960aQvCOCsKHxcpJtKecZ9UnURxGny2YAwLfWz8GWN6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Kz9L+s6E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56475L0K002484;
	Fri, 4 Jul 2025 07:53:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8ALehUfaAI4IY27cRjx8dzUmqW2nXmDiXJKkuDzIEok=; b=Kz9L+s6EhcwDnwCD
	2ZF3DRiFMeBF29cJfmPMc8Dn+76WnFH+995xpk+35Cct057ogyr/W61nlmBqsxyH
	T7EMLu1c9TNvNKRaZKWO6/nsJJbzwuMruPXarS9gxyLbOzVOysXNHhlqDUn7mOsr
	jfQVtxZERdUl6efmDAb35SUXuqcMsY/A+IsOS2R7F0tVa/bcaHKTyOPpdatqo17M
	enj4RjKYevXh5jZeqgJLQxIMLMW9T90kWDZoJt42ttBH7zzRakipnOjWAXPbMtCQ
	V+l1AfhSXrN31sCGaeuOgnkP9hyHFerlzKQD+wWd+Xmdp6tWy0LJ9n4/EH5rfky2
	e5fEwA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63kka0q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 07:53:44 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5647rhNJ024888
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Jul 2025 07:53:43 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 4 Jul 2025 00:53:40 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 4 Jul 2025 13:23:06 +0530
Subject: [PATCH 06/25] media: iris: Allow substate transition to load
 resources during output streaming
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250704-iris-video-encoder-v1-6-b6ce24e273cf@quicinc.com>
References: <20250704-iris-video-encoder-v1-0-b6ce24e273cf@quicinc.com>
In-Reply-To: <20250704-iris-video-encoder-v1-0-b6ce24e273cf@quicinc.com>
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
        Dikshita Agarwal <quic_dikshita@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751615599; l=1376;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=0Pf75v5OaEW2TsnHb7bM1RCGbkIAWKJpnd+MVuR3y7U=;
 b=n2OrgbwrbNHXFcbApRIZtWSmycWSWRdC4OnyzEyMF0q7b9aJjhGrFIQmWCa0hOzUYsp17vMXY
 RBXYjIduI2pDFE0r2wEplWYWRrGEdEoTT2st0ylglTC7VvIUCFdnR7L
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=68678888 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=lu2khcAHcSyz6XcsDAYA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA2MCBTYWx0ZWRfX444EkOhyCnms
 zvEcMXTeZZVWG8nWDW5yrQvSVHVqRLVR652s90ykOgorz/6CzeyVBxHixGBlmacmAGKw3+03H2U
 Kj2wLjP8ctV/bu6AqEQSD3Lr3RF3K8qTvZwhRJjrnj1leJXMmT0yaaovgg5zjQg3babKXeh9yj3
 8h/qblAvjIG7jNcB5GyyC5LPSxahRtTKeJAa1zbwL3IBFmb5Wcq1E6xKYOb9uKjKo4xm+LLk2vU
 y3ZdPHR4YxJLXyEWnAnfcEIMKHzDoC2KjTCoeIZw2QLaSjNSkHhvMYqDlg6XkIqa5KN1h38tGHx
 kY6WF7WWLp6hcarXu9NC14Djsbb0KghjQxgtY+31jEntJtYA7ZSYgSqLAzgqt8wh00ZMCiQqX5g
 jEK3krVerf2a8+Frv4Gda7kSevJ5i1GxNqu9GQ4tk0YRZyMgbJOXzLx+pYyEAHwQwXOLFmvE
X-Proofpoint-ORIG-GUID: krqnVjy-GtfpvbwQ_Qtlf-n9QiupH2HI
X-Proofpoint-GUID: krqnVjy-GtfpvbwQ_Qtlf-n9QiupH2HI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040060

Previously, the transition to load resources substate was only allowed
when instance state was INIT, since capture port streaming was not
permitted before output port streaming in the driver.
However, now after removing that restriction, the instance state can be
OUTPUT_STREAMING when firmware start is triggered and substate needs to
be moved to LOAD_RESOURCES.

Fixes: 547f7b8c5090 ("media: iris: add check to allow sub states transitions")
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


