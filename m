Return-Path: <linux-media+bounces-28539-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3153FA6ACD6
	for <lists+linux-media@lfdr.de>; Thu, 20 Mar 2025 19:08:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C4FC189D0D4
	for <lists+linux-media@lfdr.de>; Thu, 20 Mar 2025 18:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F346229B00;
	Thu, 20 Mar 2025 18:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Qtfz0wYO"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06F022577D;
	Thu, 20 Mar 2025 18:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742494080; cv=none; b=qACyMe3NvXXvcByjBB01pQKl+xdY8lE0NPuJAI+gLC/V5jBPt6m/0ZuNACaXNVTqxoCjg9mv+a9e807xETnuAmjIMnD9RGw3nPGuyozJmyFrBDU1WotuyYZb/vDhIZXsRUbOfOZd4ulWCPGeyGdkikEMqCt9znz4E4tSIVNINLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742494080; c=relaxed/simple;
	bh=dh6zaLpdFBtJBswops0qnPkpADr7bAkURttouRlhVco=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=NVD2Cs3WN+avuzuvBgTmMc7rA9JIZc5PNP1sGYau/RfNzvHiUY9trpnq2nLf0fdGnXLl0fceHi7KStWkPAJDjoVdNflSnCD6XgR1IbPsFC6TvlWN/XPl+9tXpvr9yE0Kj4Tmyfyr+2FSxCYUu3l3tt2pSWeF8u7xzu6IM2audvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Qtfz0wYO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52KE4dMl005939;
	Thu, 20 Mar 2025 18:07:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zprVjLAYqEBQq37NGU8LtC1TpRCuD4vRmLbP02LGMbY=; b=Qtfz0wYOQOm0SfEM
	ZJezEwzdjVmDte/N2+6pod2Djfpcd2E70dVWJU+hhtqSfE6YDZaaTHdIlqY/9Bg/
	sb8xl402fXZ9BgcA66ElRq9m9izWHF/2Fbt040wSEusqMMQd08k2tLuGlm/58Y8Z
	/ML2vjDnj5NjgbpWX4MT/J01EewB0HS+8MSroYULy9XVv29CY0LOjSexQslSf4RH
	PTWPULJAucmTgbLc/2ILC/6Lh+0GtOGo3v6FT5/0oexp3orz0ifajyI0JOMpO1ld
	Tsx4xKa5vsGFGKl36OPtb95NOGA8Jc+yk7DhF3UIG0+6wTQ9ywHeJCYf86LV87gT
	mMXhOg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45etmc2kwc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 18:07:42 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52KI7fOp015045
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 18:07:41 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 20 Mar 2025 11:07:37 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Thu, 20 Mar 2025 23:36:50 +0530
Subject: [PATCH v3 1/3] dt-bindings: media: qcom,sm8550-iris: document
 SA8775p IRIS accelerator
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250320-dtbinding-v3-1-2a16fced51d5@quicinc.com>
References: <20250320-dtbinding-v3-0-2a16fced51d5@quicinc.com>
In-Reply-To: <20250320-dtbinding-v3-0-2a16fced51d5@quicinc.com>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konradybcio@kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sumit.garg@oss.qualcomm.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742494052; l=1461;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=dh6zaLpdFBtJBswops0qnPkpADr7bAkURttouRlhVco=;
 b=aUXBbu+fH78FQNlzdM/+f2Wnk/tIfPTGS+ovvm1qTLPX3+BOzdAltk2cQuG8CfkJixGGp+Kiu
 2y2rsGXAOQ6Bq4VK/rBeJhTPlR4FhVmVsxFMewGzzenYMsE2VikQHUb
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: QCIibWE1lUQdEwCxaSJZMZz9wcd1QrXD
X-Proofpoint-GUID: QCIibWE1lUQdEwCxaSJZMZz9wcd1QrXD
X-Authority-Analysis: v=2.4 cv=aMLwqa9m c=1 sm=1 tr=0 ts=67dc596f cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=i1nYMNVYX3OX3IzhRwkA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_05,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503200117

Document the IRIS video decoder and encoder accelerator found in the
SA8775p platform. SA8775p and SM8550 are irisv3 with same core and
bindings, hence SA8775p is made fallback to SM8550.
QCS8300 is a downscaled version of irisv3 and have different hardware
capabilities. SM8650 is an irisv3 with different (higher) number of
reset lines compared to SM8550. QCS8300 is yet to come in future
posting, while SM8650 is posted as
https://lore.kernel.org/all/20250305-topic-sm8x50-iris-v10-v2-1-bd65a3fc099e@linaro.org/

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
 Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
index e424ea84c211f473a799481fd5463a16580187ed..6a89e9e3808758cfdbf6a51dfb9fc6559864253a 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
@@ -19,7 +19,12 @@ allOf:
 
 properties:
   compatible:
-    const: qcom,sm8550-iris
+    oneOf:
+      - items:
+          - enum:
+              - qcom,sa8775p-iris
+          - const: qcom,sm8550-iris
+      - const: qcom,sm8550-iris
 
   power-domains:
     maxItems: 4

-- 
2.34.1


