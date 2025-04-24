Return-Path: <linux-media+bounces-30912-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CFCA9A6F4
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 10:54:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 121FB1BA00F0
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 08:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDFD1221578;
	Thu, 24 Apr 2025 08:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="V9DQ4YGY"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A05221294;
	Thu, 24 Apr 2025 08:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745484669; cv=none; b=hRPVIuc3WDY7zbluP6g6KBb3fMQ6GB0PN+jYLRoSA6BZniokl4t2izke8xuWEXFRk4xBJ6sG2kQM2ueUzxP4E70HID88s03934oJBNdim7eUFGOELVemN5gntEXr+1t+X4DDPxVNsq1l316v6tTHE7c+dNzoKE9Jp/1j2RIWXXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745484669; c=relaxed/simple;
	bh=oE9t7xyjhlwlu2W5oKZzcUR0eXC9AHz4goaI+YpsRPs=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=c/Oz9cLn2M65xxJHfOTpnSQ+kmFmVcaBYQLWwZVQmhd4wzNGz48v8jcM/mHCMr91AbyF5fIsFLE3NNlXu5e9aounSAz/mINaJIObwqAUUTKfL/mXqpAN159NcSQuD92AtP0DXsULnEA38omc9Ggv1H45KLf9xQYnA7mCoj4cfc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=V9DQ4YGY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0G2ZU032238;
	Thu, 24 Apr 2025 08:51:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=InqgpKxvYRMB8Y7PmrHC9N
	kAFe4E+783xZZ0OoMtQuo=; b=V9DQ4YGYRfD8rSSLTONj+39JNnQI60tmfEmC1y
	IQcMjYpd7CwhFIWzop6gjtMKbUdmWEECF5S4+KmLkjSlJppafw63BCGvH46I4lPP
	fays3dGZTAS2GhcYkLF7iDNq4S9qvFZmm3DQFafjtb+/plaVLCIaitHluUnppMyM
	ez+7c4aE3t9dLHiQMqncl4mn+vLzsT16fqijGlX0mi0rh/vgHh8LZ+3KURKmA1Wv
	l8uE6jxdoPSfGnitmCzUxAqM5O6JfsaDtZF/BJZGq52nbAHRtrCDw1C2Nh1UOtMY
	O7A1sFTKXfMGBMP0NjHuXJe4ioWbHlwvw+3h7LgIaSZZixjg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh5cv2p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 08:51:01 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53O8p0cS019067
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 08:51:00 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 24 Apr 2025 01:50:55 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Subject: [PATCH v5 0/5] media: qcom: iris: add support for QCS8300
Date: Thu, 24 Apr 2025 14:20:44 +0530
Message-ID: <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGX7CWgC/32PS27DMAwFr2JoXRWSSP28yj2KopBkutHCcWK5R
 oogd6/sLBokRZeP4AwfL6zQlKmwtrmwiZZc8nioQb80LO3D4ZN47mpmSigtUDp+SsWBEB95yoX
 b4ImMQJAYWEWOE/X5vOne3m95otNXtc634a+0bTalUprP4zEnXgZ31oJv3kUKHpT00QUX0dp2s
 as+hkI8jcOQ57aRiAr6BAHrZh8RTNcFp1ELAE9JxV56GcGwtcg+l3mcvrc3F7k1+fujRXLBjbV
 eRfCxmne1fsqH9FrvbqpF/YeriksSEpyOXpB/xuEOV/CAQ8U7S14YYQi1e8bxHscHHNfyZAx12
 JtoH8pfr9cfe6EHy/ABAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745484655; l=2609;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=oE9t7xyjhlwlu2W5oKZzcUR0eXC9AHz4goaI+YpsRPs=;
 b=QJECamWFS57UMSLMcppogfIgLquEXWSt4sW/G7H372vX/GkkUQ+lWepjHWefLdGgoAPW+vNak
 xC340w5CLdwBAGH/qKB66jt7yUJyCp9AqE76iRXyUadC8zu1xFm0AvC
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA1OCBTYWx0ZWRfX9jrLd+sWz9Sc LWUhg1aj6PicSd69H6dzUfJzFwaVp/mYVZso4wogPICV2/ahJ0TYjEBaPCB8oOfGVr7RRgdhplz mP24MDlOHVN/JX3iWC+TymE9ssWUNmjbkWoRT9igP7nFTYkKYhqpPfHZ5IFgPMzr/h9jrRgJlYr
 Mb+biK18VEP3n6wYELf9koAreSGZ3Y+O//0/mOK+el1MMKSLOtRUDe0FXGPFeEYIlm76vmvpiqq X9MAq1bocKwN7np+iO1Im/EoQ9PWrHC/APzxIHbecxNEqiWEvuZMW1v4k5s1aAsdYoion/uUt9g C3NZ4hJGY1ekLfEoFLh05+/U7QJKr1QHlIVUf1JHsmt1Q8bQfnwT41WUy/G487g1Gi5GP97lJbO
 OTJiTAzxGtxTTt+igmSRPiN90i0YM8uAtfEgVjZJnXd5jsBu6CJdaZpBlFXL+DtRd2f9vmyg
X-Proofpoint-GUID: 3AARpL3jfRxwG6Kd8EtcBH0h2xHVAFs_
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=6809fb75 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=h97imd1RtcNJs7uGSNUA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 3AARpL3jfRxwG6Kd8EtcBH0h2xHVAFs_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240058

add support for video hardware acceleration on QCS8300 platform.

This series depends on
https://lore.kernel.org/all/20250417-topic-sm8x50-iris-v10-v7-1-f020cb1d0e98@linaro.org/

Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
Changes in v5:
- Fix order in dt bindings.
- Drop an unrelated sentence from commit description.
- Link to v4: https://lore.kernel.org/r/20250424-qcs8300_iris-v4-0-6e66ed4f6b71@quicinc.com

Changes in v4:
- Introduce a patch to fix existing order of compat strings.
- Fix the order of header inclusions.
- Link to v3: https://lore.kernel.org/r/20250423-qcs8300_iris-v3-0-d7e90606e458@quicinc.com

Changes in v3:
- Fix commit description to better describe about QCS8300.
- Fix the order of the patch.
- Collect the review tags.
- Link to v2: https://lore.kernel.org/r/20250418-qcs8300_iris-v2-0-1e01385b90e9@quicinc.com

Changes in v2:
- Added dependent info in binding patch as well.
- Fix a sparse error.
- Link to v1: https://lore.kernel.org/r/20250418-qcs8300_iris-v1-0-67792b39ba21@quicinc.com

---
Vikash Garodia (5):
      dt-bindings: media: qcom,sm8550-iris: document QCS8300 IRIS accelerator
      media: iris: fix the order of compat strings
      media: iris: add qcs8300 platform data
      arm64: dts: qcom: qcs8300: add support for video node
      arm64: dts: qcom: qcs8300-ride: enable video

 .../bindings/media/qcom,sm8550-iris.yaml           |   1 +
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts          |   4 +
 arch/arm64/boot/dts/qcom/qcs8300.dtsi              |  71 ++++++++++++
 .../platform/qcom/iris/iris_platform_common.h      |   1 +
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  57 ++++++++++
 .../platform/qcom/iris/iris_platform_qcs8300.h     | 124 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  16 ++-
 7 files changed, 268 insertions(+), 6 deletions(-)
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


