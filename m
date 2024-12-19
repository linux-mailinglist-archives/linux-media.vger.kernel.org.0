Return-Path: <linux-media+bounces-23763-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B89139F740D
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 06:42:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 193CA161193
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 05:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE263216E06;
	Thu, 19 Dec 2024 05:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LmDDPWZG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1FE2165E8;
	Thu, 19 Dec 2024 05:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734586944; cv=none; b=aYV+M0aK0PMCnHpwFNbv0/ZPsxEFRdfK41xBf065XdFJJJ0DeRZbG4Woz3jjON6WAw746VtyiCBFmjtHUMEYvGK37anoLZX2KgX3PademTbZtCpfxTnTWXG0pz+g3kQXyH1cL4ooA81vdZxidu7j9Lgfv5YfhngMsqJIsvi9nSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734586944; c=relaxed/simple;
	bh=401oRyKhkVAdNZCHfR00/dXgSqTVorIzFIEAVgh88BU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=jRFzg1Wl9t2himEKlO/kczpNG1g72qxvQ/Z8WpJlrOBx1QFxCzuS8/sWwaLCStgLXHcISA/fx1/0AoOSIXyrQCaiha3tgnX7amTStQxOw7wWD3tGX1GLrwof1uN5rK8mx+xKaqfhww2wxcjepd4n5OY9IsBVgCSY3/PMqAauudM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LmDDPWZG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BIMgtMV027788;
	Thu, 19 Dec 2024 05:42:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ut/d1jO5cPN35WUFGKw5ryrTjStnZ2vzkK2GpvwFc3w=; b=LmDDPWZGtNxC1O7Q
	jj2RBYLzXgOc5zDybnyr6DdyQYIkr8a4yq+tKci7FOQIp4fK9TFlWv1BQZy8tkfn
	2I4SrSzwgrzH2pBqjWFIXq9aI/1ZuoPd7um+9hLIeNw2LT9bNcT6ApHP6CODxqie
	D5uSWZBFsu54KfpAHk8MInQn095oi1/eU9imOSHtZkjAlEucZ4250fd+nHKwWOS1
	njNq/wx1TH9xsVYLkj43wFVy/KGw9Jwechg54gax+VLhThBRb+rVInUYxuIvdI4h
	ul7SjY/zi8NahB7Z65JuWXBeSWjvaALNmWkU/0ORprhXN8xzHPTDI4OEWjBWa73v
	9QE8bQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43m7eb0shh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 05:42:18 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BJ5gG2Z018429
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 05:42:17 GMT
Received: from hu-renjiang-sha.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 18 Dec 2024 21:42:13 -0800
From: Renjiang Han <quic_renjiang@quicinc.com>
Date: Thu, 19 Dec 2024 11:11:53 +0530
Subject: [PATCH v6 1/4] dt-bindings: media: add support for video hardware
 on QCS615 platform
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241219-add-venus-for-qcs615-v6-1-e9a74d3b003d@quicinc.com>
References: <20241219-add-venus-for-qcs615-v6-0-e9a74d3b003d@quicinc.com>
In-Reply-To: <20241219-add-venus-for-qcs615-v6-0-e9a74d3b003d@quicinc.com>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Renjiang Han
	<quic_renjiang@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734586930; l=1224;
 i=quic_renjiang@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=401oRyKhkVAdNZCHfR00/dXgSqTVorIzFIEAVgh88BU=;
 b=XnCNKA/ONwnMA3YwguapcQ6QvZr1oQbwYraREsqKS45BjWuoPsmt7HPrIDPS0OaKtYjwKSEgo
 NX0HpMZd5oABbugN+uWXp4bhkfSGQDT5/dQljkKjaThyjmFdK+0zJTx
X-Developer-Key: i=quic_renjiang@quicinc.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ivf6dZl3_tlFs8ghqi-U7hTwglfRj8M4
X-Proofpoint-ORIG-GUID: ivf6dZl3_tlFs8ghqi-U7hTwglfRj8M4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 mlxlogscore=999 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412190041

QCS615 uses the same video core as SC7180.

Therefore, add qcom,qcs615-venus compatible to qcom,sc7180-venus.yaml to
enable video hardware support on QCS615 platform. Make qcom,qcs615-venus
fallback to qcom,sc7180-venus to ensure compatibility with existing
configurations.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
---
 Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
index 83c4a5d95f020437bd160d6456850bc84a2cf5ff..bfd8b1ad473128c974bce84639cb0aff59d8c2cc 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
@@ -18,7 +18,12 @@ allOf:
 
 properties:
   compatible:
-    const: qcom,sc7180-venus
+    oneOf:
+      - items:
+          - enum:
+              - qcom,qcs615-venus
+          - const: qcom,sc7180-venus
+      - const: qcom,sc7180-venus
 
   power-domains:
     minItems: 2

-- 
2.34.1


