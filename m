Return-Path: <linux-media+bounces-44585-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E5257BDEB0B
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 15:14:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E282F19A3AAD
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 13:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57F9032E733;
	Wed, 15 Oct 2025 13:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Yujg7Kvj"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21ACF32C338;
	Wed, 15 Oct 2025 13:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760534020; cv=none; b=PGCBFI+XNnNJUMtBMnUEdrLNwcueI4UCcnPV4GPOvj2krN2sVPxl7Cwr3L0bUV6BO/Bm3rm62GX34NMvyVNEd4aJfsNZNEO5V+KKglDLPjqPTeYBBsK0s//RpQ2JIr5hRwBXKitj3lvdIkUCwmxUQayaqzOCoorjHC7fzSdpxZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760534020; c=relaxed/simple;
	bh=K2/Rl6EyhvBs5FE2PMgmH1gSpPtY4HnbTJEEkqXpqis=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DuzNG4jven9i5GZtSfHDFz4gBcKbKoP57E4q+zrqhp3XOdFFLzktRli22dF5R/HGbqVAXXbshdHWVbvHTY7eaPbgZywtUU1vr6+lUwBrlCn/yVbeu6oIT7b+T8YM6zGAIGLNVtJ9zzXQy2+WujdtLZrSEAzmwtlE0hBIXxt3XIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Yujg7Kvj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FBBZcQ015803;
	Wed, 15 Oct 2025 13:13:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CI/090gSC0NTuHfVAhb5eoKhHpV1yacyXpcBOsxYpDU=; b=Yujg7KvjQ4xiwLt5
	yJ7V/lTxREtrahXxLZuTdxm1/SPHILfuGOv91UbJUQUVlPRsyqBdNuwLqk9s7bRW
	4L/lYbfX8C+EVuSY8jnn+2HEmJdPUbu3sJde7V7vcwZ3NMYy0fasxBdoqYZeHAwu
	fCZbc7cwqBR2nCJzg9Q899OyhvdAGuS5ukhn2xWVv5Invqy90YDxr9/8T80XH3Wh
	KsV+qZQTtai+vu6qYdNZjo2joy+iP0L5Kk5TJfAhH6KeQiI1lW//o7TcIDnPkKiX
	AHHOdtN1+KQRZEzTdv4FaS7WXZ0538G61uxGWwAZYYdJBmbH7pKxh/bEuB0oh9Va
	GCBOKw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfm5mkem-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Oct 2025 13:13:29 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 59FDDSfk013166
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Oct 2025 13:13:28 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Wed, 15 Oct 2025 06:13:23 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <bryan.odonoghue@linaro.org>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_svankada@quicinc.com>,
        <quic_vikramsa@quicinc.com>, <quic_nihalkum@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 1/3] dt-bindings: i2c: qcom-cci: Document qcs8300 compatible
Date: Wed, 15 Oct 2025 18:43:01 +0530
Message-ID: <20251015131303.2797800-2-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251015131303.2797800-1-quic_vikramsa@quicinc.com>
References: <20251015131303.2797800-1-quic_vikramsa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Beugbd9VNU_hfIPFlVYPEdGT4Sev8iww
X-Proofpoint-ORIG-GUID: Beugbd9VNU_hfIPFlVYPEdGT4Sev8iww
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMCBTYWx0ZWRfXwKbz+oxJDidY
 AohjJlfZmKvx4NrrTbWYaE2uIJO0cJA9mAv2JGqbObq7JoHkMQzJbEgHZdbaFxqN7PKUs3eiM+e
 durjp7/eXBNjZ9TpXsXBjJjhZG0bjHoFm/jt2COYiwzygbtWWpFoT6E0rPW0pGzmxDdeTViH2nO
 Cih8TduD5A1IMGiZPDzwxLMEGhH0k5GB+IY15MR0VeNml32+IiPlc3A7t5JSuGGYwFSIrGBkpwH
 awqKvC/NHmAcz48jZ3roUMpyjA+ySaIRJPAwcYKby8TblcWOZxQavwpPo4Dmi9ehR8e5Oc1Qe6G
 iB1LeVBUsK4fmZDjhA6XkdkCdTDBQjgsfgCyyRLX6PSbnppuwUhbWWS0MloLu70WrMKydvg6RbO
 J82EWZh9v3QpRsVG5+pMwti0PVXN6g==
X-Authority-Analysis: v=2.4 cv=V71wEOni c=1 sm=1 tr=0 ts=68ef9df9 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=phzA4CzYhpZqrDFsW3YA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110020

From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>

The three instances of CCI found on the QCS8300 are functionally the same
as on a number of existing Qualcomm SoCs.

Introduce a new SoC-specific compatible string "qcom,qcs8300-cci" with a
common fallback.

Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 9bc99d736343..ef6af05f7585 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -26,6 +26,7 @@ properties:
       - items:
           - enum:
               - qcom,qcm2290-cci
+              - qcom,qcs8300-cci
               - qcom,sa8775p-cci
               - qcom,sc7280-cci
               - qcom,sc8280xp-cci
@@ -129,6 +130,7 @@ allOf:
           contains:
             enum:
               - qcom,qcm2290-cci
+              - qcom,qcs8300-cci
     then:
       properties:
         clocks:
-- 
2.34.1


