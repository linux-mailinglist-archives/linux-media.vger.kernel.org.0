Return-Path: <linux-media+bounces-31516-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D52D6AA63B5
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 21:15:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BA3F3B7C42
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 19:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 602E922B8D4;
	Thu,  1 May 2025 19:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KCpFG44u"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD4F226D18;
	Thu,  1 May 2025 19:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746126865; cv=none; b=uEniw/nJZa6KT3M5OWCYQRXLrSGrMyyvCNw+kVaqUGba8O1ebsO705umv1yJ2QnsnfytbAcLuURtZ4J1bEHRAgPQEdJDcLTksWwe30V7MCQx1eS6rbaf1I/n5si0gnECg65ZUNFBuWCojbHo2XhI3o7H45/6Cl052QFtJZdkuBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746126865; c=relaxed/simple;
	bh=MJqOUT2NCqaHx4vt4VRbB3zmPGKpkBOWWTvCB+lmWS0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=O5x8Dof21N9jFmODElvYafDgbEsujCS9cRay35VhQ97mi/0Wflk6QA2Ul2vEvLTlrSOpQyfo+g1RvDRz7JcF4f+fK7cb2/yCsrsFPgO9ksqowIMLCsE1UrJJ6aAD14FVaLpjIGTdjblDYLVpSIayccK0nP1PU8AdBnS1HsrjE1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KCpFG44u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 541D2JeC014577;
	Thu, 1 May 2025 19:14:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4BzsiLusKe/lIcIxKfBjFx65JEzxE/O2njjYVmR1a9E=; b=KCpFG44uw5WE27YB
	Gn287R60ONZXm8sIk3zz1AChm9gIC8nlq3nd7KxO/YzzddTaBPjkT5mxxULc5w1Y
	Yo1H4PpanH6ZSxrZKTTUKPeodqj11TDHqMHWhVtLTnGk60uO0Bq9QelwuIe8ttcF
	of4xB7nQZhzDXrSZhdF8BNdryfR3E7f4Mbj2ZXo0z+2cNAN1fbFHVi+2ZBHj/Ty/
	DHM0kElPRPsUllKnus+qSjWqcSRX483dv5Otw1RptVC6WFFR1dKMC/lPbdyl9Qsz
	Ar4Ib50GGIc5XALUu8ass+GEE1rZL07ekWIIlJ+eJLRXdK2hhV9F6eLbC33igjKo
	E9NWzQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u766rb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 May 2025 19:14:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 541JEJLq002298
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 1 May 2025 19:14:19 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 1 May 2025 12:14:13 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 2 May 2025 00:43:34 +0530
Subject: [PATCH v3 04/23] media: iris: Drop port check for session property
 response
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250502-qcom-iris-hevc-vp9-v3-4-552158a10a7d@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746126827; l=1232;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=MJqOUT2NCqaHx4vt4VRbB3zmPGKpkBOWWTvCB+lmWS0=;
 b=nXxoOwt2dGT4jTE5Ufn2uk+QQyGjSVffzYiV0Eg7smnqTSGZSHp/Pm8KxhHN7zumwczRje6a9
 DdPv/WoPWILAZMzWdjy+6Xal8qVQFLFhAPD7Sy+5s9NlXR9UqUVpouZ
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDE0NyBTYWx0ZWRfXyqLMezsDpTPB 1RYfY3PhYBlDGkm9F4JjBTtFT0Iw/GaqiGkafjb4DlCVCFnQVeu+iD6QP7S0IxcJ/03JmemPG8V UCZLA4dj2mjfFNcGy2eEM1lxV1T9GMulQHDvqiZHwrRsEfZN+pddvgM0UqTvu53BgIEvnFhJZRa
 YX5GV+x3CY73O6doEAXcX7Up9Kr55sXnMZnBCh+rDZ2CjO5tGRkEkDOBWTYU/wTnRDdwP1gVQ0y vmLjvSGOK1jBpicsF8Ewk3QMvD1d8itXFTx1Hhk2F4bjtPru5cPG/ntbRNoDDKkwLMSB/7oVmYr 1GK7U11g3poQcP+cWq0K02+sUeTMwXMOVLbuYP1LfP7bZ2tb1gLVaVfdqJrhn4CCBUlygBXCYtt
 vW8bP5+OdgXzxc18QMutSKhbDvpcvToz/OmCD61f8sL9jS6gqN/+rfQ+x92Wr7sJcIHN8QNm
X-Proofpoint-GUID: WEWThY8o-9TIeGQ6LgR_4332ecsD1ZwS
X-Proofpoint-ORIG-GUID: WEWThY8o-9TIeGQ6LgR_4332ecsD1ZwS
X-Authority-Analysis: v=2.4 cv=b6Wy4sGx c=1 sm=1 tr=0 ts=6813c80c cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=cpaLyVTj-7XRyRbX6gwA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=687 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505010147

Currently, port check enforces that session property response must
arrive only on the BITSTREAM port. However, firmware can send some
responses on other port as well.

Remove the strict port validation to correctly handle session property
responses from the firmware.

Cc: stable@vger.kernel.org
Fixes: 3a19d7b9e08b ("media: iris: implement set properties to firmware during streamon")
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index b75a01641d5d..d1a2a497a7b2 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -636,9 +636,6 @@ static int iris_hfi_gen2_handle_session_property(struct iris_inst *inst,
 {
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
 
-	if (pkt->port != HFI_PORT_BITSTREAM)
-		return 0;
-
 	if (pkt->flags & HFI_FW_FLAGS_INFORMATION)
 		return 0;
 

-- 
2.34.1


