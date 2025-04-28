Return-Path: <linux-media+bounces-31162-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 776DCA9ECDB
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 11:43:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C315B3A31B8
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 09:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDA4C26C3A7;
	Mon, 28 Apr 2025 09:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XEe8AIQ0"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068AC262FE5;
	Mon, 28 Apr 2025 09:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745832639; cv=none; b=LEGIOEmFS4dfQDH4gcXU6hjlSwx1A7r4dpLRFKjbkKC9t728qVgZyYjxk59q54pXXb3j7rSq87BIKvMOCTyNbuj/rGYGMNS/6Go8Ri2xWQ0/lDn08VHjQ71BIjpIoCDdFzmQTQn32KKYA5k0QZEmKd1kkAIDyNyLsq96GJSQ/DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745832639; c=relaxed/simple;
	bh=kLBER01Qlx+dNoS9e/2UemlgkmnR3JGS4ktGQdZcyWU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=MAxSinEODPksYsZwr/eboSidwMDcw4hFhiK1rQXNDnPIEyuDSMEp+rsKl+/wf1sHL3vi2jx4xUCiefemJqjc9Jb6myGFU9F0n4NOn6oVLXena00EZbS+dEaUr2zZaSm1g5tVdQD74zCNRF8l5m7J1iSoomMvUxiH5EqU/+Kgj/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XEe8AIQ0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S8DLNG010057;
	Mon, 28 Apr 2025 09:30:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QdX3xGu2C9JbCf4DuFnaz+/4FSQ/8jGKc0Bc1ZtyDuI=; b=XEe8AIQ00aYmr56g
	PHYS69VsYVDH0zIUAIGP6rmR45xDWkOGu8FE5QLsZ0ccTCsy9EJdnA7xZQ4c18SF
	s++qsRsc+4OLQotrFUc/7RMJRVg3gd2+vCQeOy7pLRlpLdj0rJ8eUcVbkiBLiUbW
	75SyMCQCkKpjaHQiV72XHJUOq01xCpLkebdzBFix2SlZv+ujrsu6YMIS0bBVwKoO
	L68yrmu3x69OcigG104cFRRh2bF+gH1gIK4yByLp5r1YTnnggJo+2Dzfvpb3wvrb
	uwzyzkwqiWLwvadUngoS8yXmrPf5g3+iKwmOSM+0i/pk+mUz2Mo+1B3CPfZx1u4j
	GGVqqw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rnmyfjw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 09:30:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53S9UWTd021726
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 09:30:32 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 28 Apr 2025 02:30:26 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Mon, 28 Apr 2025 14:58:57 +0530
Subject: [PATCH v2 09/23] media: iris: Skip flush on first sequence change
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250428-qcom-iris-hevc-vp9-v2-9-3a6013ecb8a5@quicinc.com>
References: <20250428-qcom-iris-hevc-vp9-v2-0-3a6013ecb8a5@quicinc.com>
In-Reply-To: <20250428-qcom-iris-hevc-vp9-v2-0-3a6013ecb8a5@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745832570; l=1297;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=kLBER01Qlx+dNoS9e/2UemlgkmnR3JGS4ktGQdZcyWU=;
 b=tN8iFbOkc6dBEL+6K0mpa3r0I3pK7jP3+FMW0BOgQ8ARlBI6S750QNOETB7XQc+1WAx2xy0hI
 vYS57z2Ek9mCLhHw0WMKwPXl067fkpE1rK7at449y2cDQgCEQO0Cgpy
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: O5esRSE0Jzp-X1ZzZowW7yxnnI8pdxsC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA3OCBTYWx0ZWRfX5Q/h5KV5x4Iu 6aHI669apGYeK7b5ZwkywOk8s6aHYw02gsvxroJdaOoS6oMNH6i1GNYHR6EBkTF8bhLfv+lRyA9 qttAAG0/85Mo2k7+MZeM1t9dxHpite4fEFpM/Zx01yb2QYJUh3UEOfJ/P4aMFTkIWrZ0wJnsHNx
 PFncdMQn+WmCV/jnFsDvQ9L3DuFvQznxLRo2yRxevaum4Q3XDXIwXm26z50UX7OQ6Hq6/QZrPkZ upBtoa9NX+XJ0+gdYkvXpHU9gBptTOPQfW4s/H+m0NbKxpKEiuJZvlMuEuGEjw3GrK4X5lgzW6K ty21LsEHKgeSEmkOOkGBj5GJ5HVd7qcWskJb4L8IAynG8sy7pzLZd51oJroDjDEjHvAMNrRpwgD
 comLTn6C2cr0fHgm4ZfbAa3ApxZiqYhn0omLLakTatv0LKef6aN1d4d951AC86+u/OgF6wVG
X-Proofpoint-GUID: O5esRSE0Jzp-X1ZzZowW7yxnnI8pdxsC
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=680f4aba cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=bTiEC21CLpSyVAFLm5UA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 adultscore=0 mlxlogscore=946 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 mlxscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280078

Add a condition to skip the flush operation during the first sequence
change event. At this point, the capture queue is not streaming, making
the flush unnecessary.

Additionally, remove the reinit_completion call for the flush completion
signal, as it is not needed. This simplifies the code and avoids
unnecessary reinitialization.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index ba858abab336..dfca45d85759 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -201,8 +201,7 @@ static void iris_hfi_gen1_event_seq_changed(struct iris_inst *inst,
 
 	iris_hfi_gen1_read_changed_params(inst, pkt);
 
-	if (inst->state != IRIS_INST_ERROR) {
-		reinit_completion(&inst->flush_completion);
+	if (inst->state != IRIS_INST_ERROR && !(inst->sub_state & IRIS_INST_SUB_FIRST_IPSC)) {
 
 		flush_pkt.shdr.hdr.size = sizeof(struct hfi_session_flush_pkt);
 		flush_pkt.shdr.hdr.pkt_type = HFI_CMD_SESSION_FLUSH;

-- 
2.34.1


