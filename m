Return-Path: <linux-media+bounces-30913-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 433B9A9A6EE
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 10:53:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04BC9440239
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 08:53:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86ECA221FB6;
	Thu, 24 Apr 2025 08:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DXMRx8OC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DA5221558;
	Thu, 24 Apr 2025 08:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745484670; cv=none; b=PQS87l2Zj2yUn4Ar83RThccalRF3GF4Oo+dxSFFMYs9H9irGWS4JQ8tUVJUjF6mgcFPJXpoOI/vTvV838SndEoaka8wTgy/YS6zJeMAVpX9kBFeu3kZ3j4vWNh0L9axsIFoiyDgWiGcZkr3TepSwDGyugGwCBPMDl4Mz0iSOIC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745484670; c=relaxed/simple;
	bh=mTMLc/grEsMk9tdWZaAjExvtqZMAqAYePZboVGY5WvU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=DwqtoHU5eNBukq0bjARVOyd9INC4PNH+cU1hcd8SzJopC14VahKh788QmEWHJWvGsIshO06QPydb1ySvDukHR8TTBfHx5OWnFU3VPkfbt68PA1xALwHChwelgStYGqF+svvIRrtJLb/k5FrV0azEzK7zf2DWWMMHxVHEEVudD0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DXMRx8OC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F6CY010222;
	Thu, 24 Apr 2025 08:51:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dR7JRev4UWJ18b/yknGbjv7JNxutNiQRsQw8n2kq/K0=; b=DXMRx8OCp3VgY5RZ
	aVKmRQPuSzia6i6OomeW9c0ieG0KsRBMcONyjy0i23SE0pvSUR0JmoLPEgfEGUIZ
	25BobBsk7ppiv1Ih8aKlLFIF6WW+kMhb7hB7qfC/1I6e+fHjFhhFr/OgvztYCjby
	mClbampUz38v70XhfVPsCZTS7JjM+XQaHW7POCWdZ9+txykEcCvcIQ8ajQfQn4+l
	6tW3mNekdMoZjG9OVw23fa+4zpR15sDKBLaey5/FZv5e6I+dgOsfX1YJhPvefjye
	+XNnezxhW95M/cS1O608DMHke7ya5okKbh4TrgN5+zftbU6fVBG2gkAoVCfkWKhy
	SodChQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3munm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 08:51:05 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53O8p4jE022337
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 08:51:04 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 24 Apr 2025 01:51:00 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Thu, 24 Apr 2025 14:20:45 +0530
Subject: [PATCH v5 1/5] dt-bindings: media: qcom,sm8550-iris: document
 QCS8300 IRIS accelerator
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250424-qcs8300_iris-v5-1-f118f505c300@quicinc.com>
References: <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>
In-Reply-To: <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745484655; l=1266;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=mTMLc/grEsMk9tdWZaAjExvtqZMAqAYePZboVGY5WvU=;
 b=C597rYyeRxGrLWF2+LYOa6vVfxAsbV9PRcyK7sU2zGsLEgF8S5Hpr+ncEc+FtW5udsiI6By77
 hX4T8saEFc0DFUKOQRqQy7aEYfpQhuCCUx4pPdVN1pm2GR3xtEfB2CW
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _siF29V9fg7SqQzkv3aPqG2kV9t4Qsse
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA1OCBTYWx0ZWRfX/3Vwrg+PGofd 8HosXFkp8B1foMPJFjpwjVhRb/Xsdx9APfDKiU+b8EI3xk572wRc1I58Dq5agfJYliEvTtYrn14 L6aj4VKbpCtEz4V014kdgqx0uslB8Ue5Q9ZUw3wiuBBTqzlyVd8xJaKcRjymCxQ0650LXOO1CpC
 7yfDqGOnKU1eiW8WL6dRmGnIe+VL8BdfmfzL6cbCXj9x0ZjuLpAys2f4i+SLqoqhNhBN0sGidJQ tpn3eUhsAjFiZmIpFjTY2kSdVSEB/5Fm5sZnS5divxAHskR0ILDQbxeuR8Jl+Oc7JJ2SQGJ6gTI cYbicSXxWj+i06iOqmrP/Hqcgddlq55FM6fa6Bmq8P1YPptbuJA85oGEZZuFzj1vCsh1uZINHnZ
 nwmO77O8hys7bufXgrnbPll1qkLVq3Q+KTkOmHjKK3cCPP+vhzMCNvn6StEZQZiVrK3M/CmN
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=6809fb79 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=vMvmzzE8Xnitjmo8DM4A:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: _siF29V9fg7SqQzkv3aPqG2kV9t4Qsse
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240058

Document the IRIS video decoder/encoder accelerator found in the QCS8300
platform. It belongs to same iris v3 family as that of SM8550 but is a
downscaled version of SM8550. It has 2 frame processing hardware blocks
while SM8550 has 4. Thereby QCS8300 have fewer capabilities than those
of SM8550.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
This patch depends on patch
https://lore.kernel.org/all/20250417-topic-sm8x50-iris-v10-v7-1-f020cb1d0e98@linaro.org/
---
 Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
index f567f84bd60d439b151bb1407855ba73582c3b83..c79bf2101812d83b99704f38b7348a9f728dff44 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
@@ -22,6 +22,7 @@ properties:
               - qcom,sa8775p-iris
           - const: qcom,sm8550-iris
       - enum:
+          - qcom,qcs8300-iris
           - qcom,sm8550-iris
           - qcom,sm8650-iris
 

-- 
2.34.1


