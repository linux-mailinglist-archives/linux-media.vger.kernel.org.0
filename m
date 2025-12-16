Return-Path: <linux-media+bounces-48845-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 654C6CC1209
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 07:36:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5142130818D9
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 06:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ADEF3358BE;
	Tue, 16 Dec 2025 06:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fJ/7WZOM"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0293358CF;
	Tue, 16 Dec 2025 06:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765866192; cv=none; b=o3k7NcEpK5J/PerSvBPYCdI6CC4I2Ko60XK3ziqrRm6IOanOax3pKK+4OTAoWS5FUZU5gz9xP3+DUEbpjh+ISiJKP0Pw8oxbYLlUNC0vNeWOUycVabj0C8AlpquO2Jxp5tA6pxZFseT9GodDvbR3G9C2B1ZdU/kfhYfM4ycTvis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765866192; c=relaxed/simple;
	bh=byqQdkECqUsBNdDd2tkVFPXBMf3Uck104mxVKGDm08M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BpdtGiO75Edz15CzxEPE22cSaQSxlRhtrv8CeeUDalpJgWI6i9AKHhwLwZzitXMenFABzZAT35oIiItxzZ3bVKYdHQwCEPeDuCyr/vm9vxG835hqIgsAvmGtFPohL/xahmW40+JJmZ3ML6eGptDuW94ZPziXHtbA66RP+L1O/zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fJ/7WZOM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG5Ip2N175730;
	Tue, 16 Dec 2025 06:22:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	puwrNkeefsGsVdj92cwnxJqsErXN0jD9MjSzI5I3bKc=; b=fJ/7WZOMOqgE6s7I
	p4+Bulv+aU6KLdAj7Oyfl1d+B/bj7tBDE3M+eL2AO/0XlErBDaiGl59O5meBG2nj
	zCcU0M9H7Lrr1Z1sPpTYVbqTjvKf8BUUgRvT8nk49RXDe507MgS2GRLcWrStnBO7
	+DR/0E9Aglq3N2OIhsXYWo4wYLcs+MY4mxzeu1OyGjCob2tViDUrgXjCRgf3kA4K
	3h1hDqqxPfpl/kFjR4FyAwakFmgul29HAFPh58A0zciQ3S0yHTD/DnEKoFIcmZjn
	qpinRWAEaGkhwz8adTfr5IBsjiOYanOKDwG4YSHiKo2dFOAf5TM2rhNhfdM5hj7U
	C7Pu0g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2kmm35xk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 06:22:49 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5BG6Mnso000841
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 06:22:49 GMT
Received: from hu-nihalkum-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Dec 2025 22:22:43 -0800
From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
To: <bryan.odonoghue@linaro.org>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_svankada@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Vladimir
 Zapolskiy" <vladimir.zapolskiy@linaro.org>
Subject: [PATCH v7 1/5] dt-bindings: i2c: qcom-cci: Document qcs8300 compatible
Date: Tue, 16 Dec 2025 11:52:19 +0530
Message-ID: <20251216062223.2474216-2-quic_nihalkum@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251216062223.2474216-1-quic_nihalkum@quicinc.com>
References: <20251216062223.2474216-1-quic_nihalkum@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDA1MCBTYWx0ZWRfX7sUMFXc26J0I
 wJMyWJy7yZrLUM9LjzSKTtEKDcO2+eLSMJ5HJ5ZgzNXmC0LipctABUn2npuHTqN/HdliTWzbcbj
 oVp22sbrUFfK+u+UrDtJB8g3XiMOpjkhOvFBiV6ZUNtusyroMKyKa0H/Wm7iOmLcFFkfi9A9Cms
 ax+dkDYtnVMqGW/56JzoLbsiUlbvqeTDGqVFsT3iAXUO026G7LB1tGExLLWLknFLd3C5GD1goRr
 dEilO9+BhnRPOtfJFkcixUANoBM/WOQmxCfXV9laV3XpQLvEwYIqfizn9hRiPDBYiZ0t7xHFYlc
 CWMse5whSJvh295Zu3MVoEc2XxwLRVCKhc7KjXPrNo+XEPpoIrgcGafmGT1GxteZv3sH4SIbj4j
 7HOuBkplZalgVHCaeRXWotZQIUngCw==
X-Proofpoint-GUID: k7S8TqrLBDFd9RaVRjD5hFD2LP7fcie8
X-Proofpoint-ORIG-GUID: k7S8TqrLBDFd9RaVRjD5hFD2LP7fcie8
X-Authority-Analysis: v=2.4 cv=EcTFgfmC c=1 sm=1 tr=0 ts=6940fab9 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=s_BFhqDHtHiVpoTEQLAA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_01,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1011 phishscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160050

The three instances of CCI found on the QCS8300 are functionally the same
as on a number of existing Qualcomm SoCs.

Introduce a new SoC-specific compatible string "qcom,qcs8300-cci" with a
common fallback.

Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index a3fe1eea6aec..399a09409e07 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -28,6 +28,7 @@ properties:
           - enum:
               - qcom,kaanapali-cci
               - qcom,qcm2290-cci
+              - qcom,qcs8300-cci
               - qcom,sa8775p-cci
               - qcom,sc7280-cci
               - qcom,sc8280xp-cci
@@ -133,6 +134,7 @@ allOf:
             enum:
               - qcom,kaanapali-cci
               - qcom,qcm2290-cci
+              - qcom,qcs8300-cci
               - qcom,sm8750-cci
     then:
       properties:
-- 
2.34.1


