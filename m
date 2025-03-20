Return-Path: <linux-media+bounces-28512-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4FBA69E84
	for <lists+linux-media@lfdr.de>; Thu, 20 Mar 2025 03:56:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13356981547
	for <lists+linux-media@lfdr.de>; Thu, 20 Mar 2025 02:55:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB4531EE035;
	Thu, 20 Mar 2025 02:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nCzJIQ25"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F011EC01C;
	Thu, 20 Mar 2025 02:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742439296; cv=none; b=iy3w1/9ed2Jkmd5bJ2RKmXAR/m8HYyFgKjontABRcjyvNvwzX6UHSkAZTkOqZnU4vXWeHok/OMivij8UZb0AeJwXHHbNEIgxSFgoiXZWZWvIwfJ9FTKg5R3U0GvhGUpMwPE1CjVDhyeDSGu3QM1Sls+4CLiyhsrj9/l9UBOiLDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742439296; c=relaxed/simple;
	bh=YuKp41PiaV7UjWUQGDVErqymdh8so88izpTE3l3/52I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=JK0lt21XHyPfjujeKpTZbmr+ZlFdKlb36OW2NmuKGkLbqJt4itlo8wDLTTBlDlrdh8WQh45hKwd7SVkifbR4WrGQWFrQBGW5JlirZKnwzTwNb5TTozwqYWisZPAeI48ok4bbod2qk9Y2UDEqS9JIz09tvggNGoDaN/T4hIRd5TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nCzJIQ25; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52JG7Ytw031266;
	Thu, 20 Mar 2025 02:54:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O+Xo2B+CnwQAsf4zeV70naJS2n7mNHB1B7j9ibGQrv0=; b=nCzJIQ25DTwaMz7s
	+EP1bmI8lTUH+YrY/uSTExeDqgEgtBqthZnCu8lLOaVclVkfhg/YW01hydIop2f6
	/vZGz1YOiDSczuCh1mtCkYY2k1ZXu/Am6i8DNoYkM6j6eHbWbCtuvWK5Wo2IVdZ7
	W3LYj0m5pbgTziAoztjr5jbQd6fhFT0Um2cmk4TpU4tPjNXpGQzd+/QRWhvyAQHD
	TofPxoVXpt5TXpbeRBroZX6mspAhySoR13w40Y6rHoYNdgTlpPPvN9BVe1H0OceX
	8BVPkGCUuMteRdx0/lkaF0wCsF+RBVW+8QT9dJnijG5raVZscbX/ThU2RRSAnFJK
	G5YUZA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45g15y1dfw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 02:54:50 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52K2snBP010874
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 02:54:49 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 19 Mar 2025 19:54:45 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Thu, 20 Mar 2025 08:24:29 +0530
Subject: [PATCH v2 1/3] dt-bindings: media: qcom,sm8550-iris: document
 SA8775p IRIS accelerator
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250320-dtbinding-v2-1-8d8eaa4e76cc@quicinc.com>
References: <20250320-dtbinding-v2-0-8d8eaa4e76cc@quicinc.com>
In-Reply-To: <20250320-dtbinding-v2-0-8d8eaa4e76cc@quicinc.com>
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
        Vikash Garodia <quic_vgarodia@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742439281; l=1394;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=YuKp41PiaV7UjWUQGDVErqymdh8so88izpTE3l3/52I=;
 b=utU9WhNltntWdnbhezyqEMauuSPQwJOqdjqDsRQzAvGBpYeQEWpMezmuATBqNbUYpZBGODWAC
 OwDJQ6MRS8sCK0qVXDaVHK+nBnCLCBxFtQb1GIDhPwX4D6dJwz2cVnt
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: IltRB7Xxw_IjqMtrTQE33wOLrQRmkn75
X-Proofpoint-ORIG-GUID: IltRB7Xxw_IjqMtrTQE33wOLrQRmkn75
X-Authority-Analysis: v=2.4 cv=VaD3PEp9 c=1 sm=1 tr=0 ts=67db837b cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=i1nYMNVYX3OX3IzhRwkA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_01,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503200016

Document the IRIS video decoder and encoder accelerator found in the
SA8775p platform. SA8775p and SM8550 are irisv3 with same core and
bindings, hence SA8775p is made fallback to SM8550.
QCS8300 is a downscaled version of irisv3 and have different hardware
capabilities. SM8650 is an irisv3 with different (higher) number of
reset lines compared to SM8550. QCS8300 is yet to come in future
posting, while SM8650 is posted as
https://lore.kernel.org/all/20250305-topic-sm8x50-iris-v10-v2-1-bd65a3fc099e@linaro.org/

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


