Return-Path: <linux-media+bounces-30625-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6988DA952F4
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 16:47:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F24B16F69A
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 14:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD4F71C84C6;
	Mon, 21 Apr 2025 14:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jNInffsM"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDE71B4F0E;
	Mon, 21 Apr 2025 14:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745246848; cv=none; b=ijy8GMkB3pItlQHwCT8iz2fzM9mo/0q7+Xy/I2wud4YyMtM1DoqPfuH788e5xRZE7qlKW8j7QFMPMN4MdbgbuwXBXJg/YvsuRe4yNaStMUgX5UZs9Z6XkM77p63fqI9EOgO/8y58HQHoB56LYUwM4r1ADRzLkaxwgzc8gXiHKXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745246848; c=relaxed/simple;
	bh=4VygN9yBcWPpdRyVDpEsKL6kBnDsV4uFOyCXXYpW1yA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=tEY/gJWfDTkdFSGxV1IUdub7TFF0fex99RsmW4JRpxsxXhG9PuvMRzNXdWnlVnTqGZISck7P4yiEXfioTJiT+ZIpWHI6BZo+Y0IA49N0xny4j5pAwLPGVPni+SYjPdNelNajSWI/77mfN9IRvWlRWyoxnxrB4jSP+rDXfUUhYCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jNInffsM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53L9cA6p031155;
	Mon, 21 Apr 2025 14:47:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TtouGTqPkErpfGjNDCnKVVCJzIDF9e3L6hnp2+xXm2U=; b=jNInffsMzrxXlLbb
	YFnV+GdcVVpvtbD145FaBh56BYvVThe8S4zY4UcCcNzqGlgdris2GyaI9vXF/HTA
	/zjau+Hb2PfVewBANtb//u6vI0Ggdh02sG2NBvUkS2fzZSUKc3snuVWdfzxbfpmY
	9X4k4HbHsLGeGM7P+wyttEJrUOaxM+/rC0HInPyhajF/mYtRchXMCxQN23jVc2R6
	aZZdJb7zZ/DHMhjft3wIbWJnar1mmWuF/Cg1GF7TmeZekx7e+XT/3ju4hDKw5gQv
	jYC3AcBkaDTMteW1nA4B3rS35QRPe2o+V0Zvfs9IHkvB7arStLbah0HN+fhGwLI2
	ilazhg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 464478vh7d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 14:47:22 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53LElLov000719
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 14:47:21 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 21 Apr 2025 07:47:17 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Mon, 21 Apr 2025 20:16:55 +0530
Subject: [PATCH v5 1/3] dt-bindings: media: qcom,sm8550-iris: document
 SA8775p IRIS accelerator
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250421-dtbinding-v5-1-363c1c05bc80@quicinc.com>
References: <20250421-dtbinding-v5-0-363c1c05bc80@quicinc.com>
In-Reply-To: <20250421-dtbinding-v5-0-363c1c05bc80@quicinc.com>
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
        "Konrad Dybcio" <konradybcio@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745246832; l=1521;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=4VygN9yBcWPpdRyVDpEsKL6kBnDsV4uFOyCXXYpW1yA=;
 b=sp2fSjmUxyIHUWaDbCZ1+AteOr3GUO/5z2QdHhjj+TFTcjc0WetCB8eyTa5qDEPdyX9AvBUoj
 H9rVQWGr8o9DmOkHL79xHilL7KNUgp+aRfdwbkJhBtdHZggloEXrOCe
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gXugeTDSzdbUM-jRwdROYa1LGSgB3-YI
X-Authority-Analysis: v=2.4 cv=CYgI5Krl c=1 sm=1 tr=0 ts=68065a7a cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=i1nYMNVYX3OX3IzhRwkA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: gXugeTDSzdbUM-jRwdROYa1LGSgB3-YI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_07,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504210115

Document the IRIS video decoder and encoder accelerator found in the
SA8775p platform. SA8775p and SM8550 are irisv3 with same core and
bindings, hence SA8775p is made fallback to SM8550.
QCS8300 is a downscaled version of irisv3 and have different hardware
capabilities. SM8650 is an irisv3 with different (higher) number of
reset lines compared to SM8550. QCS8300 is yet to come in future
posting, while SM8650 is posted as
https://lore.kernel.org/all/20250305-topic-sm8x50-iris-v10-v2-1-bd65a3fc099e@linaro.org/

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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


