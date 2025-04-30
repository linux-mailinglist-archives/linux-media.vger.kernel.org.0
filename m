Return-Path: <linux-media+bounces-31449-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1D9AA4ADE
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 14:17:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D177168EB4
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 12:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3A8725A2D5;
	Wed, 30 Apr 2025 12:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Fi6ovw3e"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0142550B3;
	Wed, 30 Apr 2025 12:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746015452; cv=none; b=qyK+QP70ZV8wC8kgojoP/LRUYSQbZ59hsHt5v2XiSH3ovMmPigmGBb6DM5mL0gBZ9p/OAslMnHNpOzPuYwI22NMHDxRl/48YqCE0ZSbv9scm0wW+1iKCPtY/5JRFRaa0gWjjL5qtQhUDfQtpfwDBhJCkncV4V+K1jYK5Tq1WGKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746015452; c=relaxed/simple;
	bh=E1kEwPsLvdquGJddOJvX2EN9XwDc3z7/1YWDxE570N4=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=cx6FlgdOBbwvJ4/jNR39HhEod1n+NWncMbFR2N2PpEJ1IpG3mUR5dp3CWABwX5OF7tHUltYPRA4ak2YjvnyvpMTXBeBREzrbPy67tbctCMStbmDq7NmmHak4TNLfD5F7tMhCopQz4rIihAVedj/s6+VD0Lai75FtjgFmuPLrBz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Fi6ovw3e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U9p2fV011715;
	Wed, 30 Apr 2025 12:17:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=T2VVxXq80qNYSnlcmC+ZnU
	KDWd6u2DL1cLhNjntN/vk=; b=Fi6ovw3ezqy32fLqa6GSFgRZLFczbmkWlUM7HX
	GS456I2EI6HpGHLB/8bj6CVhcndDDI61KfLHuPD2FvrzCzwdrEGXoN8i4oxCW6Zp
	+tkiFDDTV+lYcd/uZq19e58tvLCq5QFl/qeA4a8XFD2PlFnHk2vZPgz9b2JgKnBK
	6HAe/YpRo/GjunWPn+1vbVOxhI4gsx3TYoX0lByCLl1Ae4TljgfSR2uKabIKum25
	0hDHiCmVFDj2NLeDMo4yFGnR4vFeYvEGIm3UPK+oEkJ3Xv0Gmc/cKg49V+2YDY1+
	IabvdClx33CCqlzQe0bQH0WIQOL3xG/yR/Lr47REdbqAJoGw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6uaa3ex-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 12:17:26 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53UCHPDQ024632
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 12:17:25 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 30 Apr 2025 05:17:21 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Subject: [PATCH v6 0/5] media: qcom: iris: add support for QCS8300
Date: Wed, 30 Apr 2025 17:47:06 +0530
Message-ID: <20250430-qcs8300_iris-v6-0-a2fa43688722@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMIUEmgC/32Py27CMBBFfyXKuq7G9viVVf+jqirbGRcvIBCnE
 RXKv9eERSkglnc058ydU1tozFTarjm1I8255GFXg35p2rjxuy9iua+5FSAUILfsEIuVAJ95zIU
 Z74g0oOTo24rsR0r5uOrePy55pMN3tU6X4Z+0a1alEIpNwz5HVrb2qICt3pkD84K7YL0NaEw3m
 7M++EIsDtttnrqGIwqZovRYN1NAqfveW4UKpHQURUjc8SB1ey6yyWUaxp/1zZmvTR5/NHMGTBv
 jRJAuVPNbrR/zLr7Wu6tqFs9wUXFOwKVVwQG5e1xe4ULe4LLivSEHGjShsvc4XuN4g+O5PGlNP
 SYdzIPy6hmuKp44t0mBinX8H1+W5RftgLOBLwIAAA==
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
	<konradybcio@kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746015441; l=2755;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=E1kEwPsLvdquGJddOJvX2EN9XwDc3z7/1YWDxE570N4=;
 b=7+1sH/1M4uRskjCxi3yUutLgEPlVe7PI9rTQgtXJnh4edPPJL4N6PYcbZRB6fd8ggjLQLg2pB
 IqWoXNhCXT2CJ3VN/1CziqnsPYYCbUIBHbwa7TyzJ0KClOxSZp43BD3
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=BNizrEQG c=1 sm=1 tr=0 ts=681214d6 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=h97imd1RtcNJs7uGSNUA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA4NyBTYWx0ZWRfX+N/YT/K4H5Lz a3Rxo2XI2R8pBk+I0EMGVY0H9SrnGqhLkMwcrDU4SwFL5efRxoVs42Anx52F8cbwfq91LWCC7Xy R04TQhgOeFVrS7J7Bje2aaKSUMIzS2YLmGHoGnEZ63GJ4aeYfREDuBTyRC0WsCB/b6czbOjbP19
 NEworwbdD15t98lAmvkQYnacTeNMPEkUN6Ih37inV0GaJKk6Ln/nrmc1kuzUIgg79pNQOL3epBY kXao1WEW6YQpN08H5uGSkYWj07jD8YJ3nqgWAUZSmWdvyZNyhbIND95Q27oI7EedSf7H0wxb2lF OivqCbTMfssSAF6VfYzz6CgeignJuYdRCIXFI/74lTyqIMWaL+FBdedYZrmsSe4vGL04lvWP1NX
 oqJEPk9g6VZ5tgQycZjiF52m9vw0DgV9IjEL2PxDkiNWyg1WRTPIlaKWsQrdb3eVILPacWpm
X-Proofpoint-GUID: PL-JjaOex6PhQYJ6AiMNUzbJ0xWvgtP1
X-Proofpoint-ORIG-GUID: PL-JjaOex6PhQYJ6AiMNUzbJ0xWvgtP1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0
 phishscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300087

add support for video hardware acceleration on QCS8300 platform.

This series depends on
https://lore.kernel.org/all/20250417-topic-sm8x50-iris-v10-v7-1-f020cb1d0e98@linaro.org/

Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
Changes in v6:
- Address a comment related the commit title.
- Link to v5: https://lore.kernel.org/r/20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com

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
      arm64: dts: qcom: qcs8300: add video node
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


