Return-Path: <linux-media+bounces-47737-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A6AC88940
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 09:12:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90BB13A2AEA
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 08:11:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ED9A314D3B;
	Wed, 26 Nov 2025 08:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="a9uvVb3T"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3430C30CDA4;
	Wed, 26 Nov 2025 08:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764144694; cv=none; b=BTYd51Fvy+S+xGOUdNEBnmevvhzN+0qN5GzyclO5oQQVWYfl2Q1T9+MndnlV1GrOjRYBdi73uMueKnnys21ArvfTGFJUtkFQzerrImBRz23JNeHkFOGNV3CaTCaKqmSVxGoyvpBYKQfXJXRcu3BvfqTKoEiv7oZUdz4CdxA5rhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764144694; c=relaxed/simple;
	bh=amQZqa+mHgBYM7A6u2J/4Q92N4K1Az7IVRuFftdyQBY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nr61fyRdE2+bma9pLOlWpcRe1nUYcebl8wik1P3zXq42xonMkaODRRkEJTTf6r+dxlSUx57Yo8QtfR/pkrb2FSOf23HRmTMHMtW5RUgejLb4RqY3sAYTLY/5DzlQgoIhH+PCqQ1gpgmIgZXwiRZCEOj272lHJsjCcV7aRiThbTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=a9uvVb3T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ6w6RW3738456;
	Wed, 26 Nov 2025 08:11:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oNx2ZEXv0ji489u+ERIBVDdlTPKxz8k9d3dCqv0kHAA=; b=a9uvVb3TX6pFhEDh
	2+Js9jcdDQeOtxaA+VqTZI5JWPDO5g4BoeR6K6XdW2QV36SxyoBzsiLMudDQVq2J
	BsVGIqc9AQvlvBdxJ+dP6oITeupuIw2VJC0ulSz4jeZ6S6+cxcWdF+f08Maukbue
	c/cdq9oNW0VtPPiCeW1/J2b35LJHHN43hxTdNeVXccJWo1X0aYadlka+Un7ronkl
	MbU9h6ArDTdE75xAiXbrb5xzlNv60r/tM9C9RLL98YBX5QWCOmRLuuTiOV12/trD
	en87FoScLOEFTnY7Pj8sJAERU9Y8j2n3hBUDbTlYClIGvXxFFjCdcQpdw0OxDs0p
	fbxs+g==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anggyj24d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Nov 2025 08:11:22 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5AQ8BLi2017488
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Nov 2025 08:11:21 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 26 Nov 2025 00:11:15 -0800
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_vikramsa@quicinc.com>,
        <nihalkum@qti.qualcomm.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>
Subject: [PATCH v6 1/3] dt-bindings: i2c: qcom-cci: Document qcs8300 compatible
Date: Wed, 26 Nov 2025 13:40:55 +0530
Message-ID: <20251126081057.4191122-2-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251126081057.4191122-1-quic_vikramsa@quicinc.com>
References: <20251126081057.4191122-1-quic_vikramsa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 52veB63DvbHhwKltX8rAIkKl2m6xYNe7
X-Proofpoint-ORIG-GUID: 52veB63DvbHhwKltX8rAIkKl2m6xYNe7
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=6926b62a cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=s_BFhqDHtHiVpoTEQLAA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA2NiBTYWx0ZWRfX+aVFMb9Ji++i
 fKkz0C2tcShalCu9spZS4TFFF4iAVQ5w0Fl3zoti+wLz2GjlDswbHEY9hOPwyK+wkNUWxSBKV7O
 1NPoy/+9Dd0v8BvthtzUfGQf/y3THxpnkbd4wqJstztUDZ3IyQHp2aBuKQhwUM35M5ZFzpnofZr
 aG8H9Q0HqRSBxSITHYyyIm4j+eOr46OB2C5wJEk0hiFX9Bc3Gf+Ark4GxMFpUB6mH6vD5RGrF7C
 iAqDXFsoN7JIta65H/7xtkSsrtKLoO/4JZ/3qV+zuynrWLfVRd3/+iDpAgKGCrAYRvYQiR7n+Gr
 aun/eC987AzAVQVDN5yVrL3m0hpbIdK9b7C3P2fR74EZrpQ/KbJfQkHpxiNNaymM7IXCNQHqiGD
 IgtSwQA3F0kG4A0vQgtS2AqouUZYsA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1011 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260066

From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>

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
index 33852a5ffca8..f1919f59d521 100644
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
@@ -132,6 +133,7 @@ allOf:
             enum:
               - qcom,kaanapali-cci
               - qcom,qcm2290-cci
+              - qcom,qcs8300-cci
     then:
       properties:
         clocks:
-- 
2.34.1


