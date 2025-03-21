Return-Path: <linux-media+bounces-28548-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6119DA6B337
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 04:20:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2398B4A0EB3
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 03:20:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DEE71E98E1;
	Fri, 21 Mar 2025 03:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QxCIdrc3"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C67B1E5B78;
	Fri, 21 Mar 2025 03:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742527187; cv=none; b=sy4FjxxLWiiL318HCiupoTTtcVzgSZ9Lkl5WMVm17ZyfYpjKO+KMQD3GQJl3RJqCpQ6/JKKXem3ilamtEFeZ8kdGllWHn/CvxF9YGyvHTsiPRLT+33DrHm05vuDCCjcS7Al7DaGB3MYZkA88IV3D7//qyRVfpfFGvvZfE+uWuV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742527187; c=relaxed/simple;
	bh=4VygN9yBcWPpdRyVDpEsKL6kBnDsV4uFOyCXXYpW1yA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=s0Z/tVBpRFpwO7WBXcrgNUcjbM/2XqBZmQLjEL+eQ/XKfJbq3+tG3M2XUs938+vjVSgrsuAUV1Ae2bkiGgTZ5NRxvMqTb8U20H90sRrEuKWdIt7v190jDHjbBUZagsQCn8k9nAsXLObpfBXk4GcenBaGyOMB1Gv40cEsE+bpXZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QxCIdrc3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52L1WQUu023942;
	Fri, 21 Mar 2025 03:19:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TtouGTqPkErpfGjNDCnKVVCJzIDF9e3L6hnp2+xXm2U=; b=QxCIdrc39umGhxI7
	J1MqMX8sVis0e4JbGnAJnOsqdzsEMZIlgELdCPFbK9wQ3pGpZzH/gXLkIbRL02w5
	SfeMstzWu5rwGSnHfxltmQdDE3P+7UNL1aAZIqlHX6wX91VYiIDIAan17l00aR2v
	Ejkewpp9hoFtkr01ExrWioHrXP/B+OmatiltIDfqU4kMGqbfEHYQWYMfIIG2Kl9a
	v8G7eNKGpuXlDYKNVLLj2S3LHIw0B4A+8gXZpEd/kZOr7bFtNp0rxjY3vxOeMAgT
	jhUQgP8rRF8oxiPVLZncO5cDB/9jSQUbxyK7rDOVr7b7/8jXRxDnjGSpB8Ry8zbf
	ZbGYnQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45g15y51x8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Mar 2025 03:19:39 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52L3JcHX016155
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Mar 2025 03:19:38 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 20 Mar 2025 20:19:33 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Fri, 21 Mar 2025 08:49:00 +0530
Subject: [PATCH v4 1/3] dt-bindings: media: qcom,sm8550-iris: document
 SA8775p IRIS accelerator
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250321-dtbinding-v4-1-6abd4575bff4@quicinc.com>
References: <20250321-dtbinding-v4-0-6abd4575bff4@quicinc.com>
In-Reply-To: <20250321-dtbinding-v4-0-6abd4575bff4@quicinc.com>
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
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742527168; l=1521;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=4VygN9yBcWPpdRyVDpEsKL6kBnDsV4uFOyCXXYpW1yA=;
 b=WreKKzM13CXc4tKLf6U+CrDGRkg0CeoZs317IDKJRd4RrwZ3AYpUggkVbZsZt8ISYOjWGP8m1
 JA0+EgcHUc8AC4PMjh7TpLvwBdcKDXzYpCN3hetys7ew7tRb3K6JvLP
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ke5I6eUaKuUognbwAMh0cld5fhs-c_b_
X-Proofpoint-ORIG-GUID: ke5I6eUaKuUognbwAMh0cld5fhs-c_b_
X-Authority-Analysis: v=2.4 cv=VaD3PEp9 c=1 sm=1 tr=0 ts=67dcdacb cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=i1nYMNVYX3OX3IzhRwkA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_01,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210021

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


