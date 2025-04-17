Return-Path: <linux-media+bounces-30491-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B1AA92B58
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 21:01:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7ACFF1895537
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 18:59:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2E5A25D1E7;
	Thu, 17 Apr 2025 18:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AQqPdT5i"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662D91D5CCD;
	Thu, 17 Apr 2025 18:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744916281; cv=none; b=Fj17JEaC+JJIUaGMY/q2DwAZY928uxHtj0LnDBepnzcbwcv8By7xx/eJsIe78xvQgIfORU0vm9+SuktkE89mOcXKQ4bSEYHVqphhtuqHVpDeyvX9dZC0U3sUImV/CDyeUCqnefNQZvbBoEX4jKSgPJhs5rPhq+4BvXobOIrODd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744916281; c=relaxed/simple;
	bh=GPBMti6d1eSxgbQ8ztbQA0OHM3kaeJTJ/wvTbSk+gUg=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=d4ZAKYYs9hbB6+zf6NlUplKS33swYQEUIhfyNuUmiyhNIxcEU77TgBZEMibIAekLea/alZj4WM7Ejn45ALo5eQqDBZfuhJA2nw908yxvur0mYdi/6wIYRE81uVD3NhdlDWudlRwhcWEZGXDbgL1ft9I5n2rQosO8tH55GV4vutw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AQqPdT5i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HClbql032076;
	Thu, 17 Apr 2025 18:57:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OBfeZV99OcZGZ91PDlA/RN
	KVq2HYA5a7cy8i2TvYJsE=; b=AQqPdT5iHWRJceMlyC5Sbm8qDVNeqVOvAPJxnl
	93jevP10+ubxkOKdFdZhwtkqGSm2QhY2Xz7mF+IGv+JB+8dYGlYOOv0D8d3k/GFT
	pO2wKxDjMwIan3H3JA1H+XwmeUWKn8dzYlIHLuquPrNOtgf4OMTGeHSaNKGRA1C8
	lhBHWVAiGjjCHWZGS+7OC0udy5Y7Pkl45nn7EZkeNyyTNmnI74gbgQFQ01BRHLvz
	66SyTzW8sreCN8aAwaJc4H2fW4VGjQiNNpa7qgqaGBViuJM03jqZ68zMRZ8Fa2GR
	5+8tvQy4ddZU8TbON334+7v8GKDblNIYbz5Y5zqXe/b6oHfg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yg8wr04w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 18:57:55 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53HIvstZ026641
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 18:57:54 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 17 Apr 2025 11:57:49 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Subject: [PATCH 0/4] media: qcom: iris: add support for QCS8300
Date: Fri, 18 Apr 2025 00:27:30 +0530
Message-ID: <20250418-qcs8300_iris-v1-0-67792b39ba21@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABpPAWgC/0XOzQqDMAzA8VeRnlfoR6rVVxky2hq3HNTZOhHEd
 1+nhx3/IfmRnSWMhIk1xc4irpRoGnPIW8HCy41P5NTlZkooI0BaPodktRAPipR45WrEUoCW4Fg
 +eUfsaTu5e3t1xPmT1eUa/tGmOEmlDF+mNwWeBrsZwU93lYI7JWtvnfVQVc1a/XjvEvIwDQMt+
 UUApfugHeTN3oMuu85ZA0ZoXWNQvpe19Lpk7XF8AUEoPLjnAAAA
X-Change-ID: 20250418-qcs8300_iris-7a9ee604314a
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744916269; l=1713;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=GPBMti6d1eSxgbQ8ztbQA0OHM3kaeJTJ/wvTbSk+gUg=;
 b=JxvPIIpXzVobX6XWCUpH7zkvmajQDjhSQD6SX5Kd3DO7mVHUOd6tMSdtrlFZcG0lqmoofYaPy
 4xTPorS2x+vD7zwjKSnmWcJp9HqdndH46yNZS1XHNZx5JL798SLlFYr
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=E9TNpbdl c=1 sm=1 tr=0 ts=68014f33 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=5mqJRpXAQT99iV-CYE4A:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: FOljNYk_acLNy_8B4W7xz36lQ7QKZQoE
X-Proofpoint-GUID: FOljNYk_acLNy_8B4W7xz36lQ7QKZQoE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_06,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=892 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170139

add support for video hardware acceleration on QCS8300 platform.

This series depends on
https://lore.kernel.org/all/20250417-topic-sm8x50-iris-v10-v7-1-f020cb1d0e98@linaro.org/

Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
Vikash Garodia (4):
      dt-bindings: media: qcom,sm8550-iris: document QCS8300 IRIS accelerator
      arm64: dts: qcom: qcs8300: add support for video node
      arm64: dts: qcom: qcs8300-ride: enable video
      media: iris: add qcs8300 platform data

 .../bindings/media/qcom,sm8550-iris.yaml           |   1 +
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts          |   4 +
 arch/arm64/boot/dts/qcom/qcs8300.dtsi              |  71 ++++++++++++
 .../platform/qcom/iris/iris_platform_common.h      |   1 +
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  57 ++++++++++
 .../platform/qcom/iris/iris_platform_qcs8300.h     | 124 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
 7 files changed, 262 insertions(+)
---
base-commit: 14423fc3a4a21fb436dda85450339ec2bf191b36
change-id: 20250418-qcs8300_iris-7a9ee604314a
prerequisite-change-id: 20250225-topic-sm8x50-iris-v10-a219b8a8b477:v7
prerequisite-patch-id: afffe7096c8e110a8da08c987983bc4441d39578
prerequisite-patch-id: b93c37dc7e09d1631b75387dc1ca90e3066dce17
prerequisite-patch-id: b7b50aa1657be59fd51c3e53d73382a1ee75a08e
prerequisite-patch-id: 30960743105a36f20b3ec4a9ff19e7bca04d6add
prerequisite-patch-id: 2bba98151ca103aa62a513a0fbd0df7ae64d9868
prerequisite-patch-id: 0e43a6d758b5fa5ab921c6aa3c19859e312b47d0
prerequisite-patch-id: 35f8dae1416977e88c2db7c767800c01822e266e

Best regards,
-- 
Vikash Garodia <quic_vgarodia@quicinc.com>


