Return-Path: <linux-media+bounces-32700-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCD6ABAE2D
	for <lists+linux-media@lfdr.de>; Sun, 18 May 2025 08:33:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E46D1775A3
	for <lists+linux-media@lfdr.de>; Sun, 18 May 2025 06:33:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C9B11FF1C8;
	Sun, 18 May 2025 06:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="n5TfWFpi"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E241F8AF8;
	Sun, 18 May 2025 06:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747550013; cv=none; b=W1IFXP6o2svwQ8ZWPMvPwSp63+1WmR+NwOnAGaShG7M097YnfHnGcQjFH6ziQ1JGkv4sU6YykU6FVHFdg/7DDKn46FPY7L7ciQ27q5HimwskFy6QQKEFPlPt5cNLArafIl3HI/5pwDGS17pEUfN8p1CavqC8k0FCJX8tNhHYsl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747550013; c=relaxed/simple;
	bh=vifoSAbNyZFcqohH0mGp5O6Gve6RQ93AlyKtqRLl/xA=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=Dkz+o6F/xeXqgDdJYfARBILSyHH6MRT3BuQTsdkc6KDaRbLrR7AwIEUodfoifb8DtMFhPYO4YHNtAqj8NqAGUPyzn4wF0+5QN33dvOose307izyr5LPN7lnxp1mOQFDHPXoqlzIkLj0/7BCTZS0SKMrplRQ05tQA5QLLx+Eh1Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=n5TfWFpi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I4CfnF022425;
	Sun, 18 May 2025 06:33:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=25NeiK13uE2l8LiXYkZhuI
	AFwk5P6Avfvk3FMLDnzro=; b=n5TfWFpiuoBckozJvOYJqzN0N/qqk+p95H1J6w
	+3uaRy09AqzK6H5cKeRkNMzK3bxUJxw8G+5Q4RI2C9pvgPuaJRM0qbXkPDFJsBZb
	l+qJwhuB/SxNF+A1hHUUrXuqIQ3EBsqnUQtoO3uXKg3RRcnln45taHmdktOjHhRs
	oh7/HIf4vY93bhUwp3lnvDed5LsTjlxDfRl8+eR2cQB+iNLtW1aNxfU08M3E5xMN
	NrSn0zt8FK3274rE4ATCVyMUs7zqeQMzDujomeri6OWcl+5cXf3lwzaLr1dcUDRT
	02UPEa4654fVKI9xuilGuT1dEsgtH9ibKQyUqrr+hKLZ0QkA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjmeskt1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 06:33:27 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54I6XPQx006531
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 06:33:25 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sat, 17 May 2025 23:33:22 -0700
From: Wenmeng Liu <quic_wenmliu@quicinc.com>
Subject: [PATCH 0/3] media: qcom: camss: Add qcs615 support
Date: Sun, 18 May 2025 14:33:06 +0800
Message-ID: <20250518-qcs615_camss-v1-0-12723e26ea3e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACN/KWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDU0ML3cLkYjND0/jkxNziYt00Y+MUC9M0I8tUszQloJaCotS0zAqwcdG
 xtbUAuAykSF4AAAA=
X-Change-ID: 20250518-qcs615_camss-f33d85f29e6f
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wenmeng Liu
	<quic_wenmliu@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747550001; l=1686;
 i=quic_wenmliu@quicinc.com; s=20250211; h=from:subject:message-id;
 bh=vifoSAbNyZFcqohH0mGp5O6Gve6RQ93AlyKtqRLl/xA=;
 b=Pz55cir5Me1mDPgMt0R00yjOwhFdcEN21KKmyZVgpmL38MJyMQA8YGq+NyvlzAE0+q43Col2t
 PoPyeCnrAQTBlmvjYiKgGAoI5x7Bu+LylNDJP0Y9erutd2Bum/fWjMY
X-Developer-Key: i=quic_wenmliu@quicinc.com; a=ed25519;
 pk=PTegr3w0f1C9dOSL6CUdJR5+u+X/4vsW7VMfwIMeMXQ=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=RoDFLDmK c=1 sm=1 tr=0 ts=68297f37 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=WuS4yPkh8SfIzpwGxFYA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: m5gJJM-rZ4A_J0jSY9dY2dStQv6QJ7dy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA1OCBTYWx0ZWRfX/ZitIibwKj9K
 3FZH/iSqkF0qsFxHPJYvZSKU0kDuXha6jG64RDQ7aysTyIzeLVYReQ1mK5lEPtIz5AlVRTdwiNT
 mEBWuDSLs8xRxlSBQPwZFdqonLHEOzBCUTLWOKuE+3jygsc5a2cSmD+vFlwZeWW0635zozyszHh
 o0fEiWQabl9Nw0+cDPEial4ufwcumNjlNuNEItbapeHzAlRlq5+LnwLP+OHyl1uXluU4qYnu6E5
 eA/e4cuBXlILQixFLcx9k9/8iPpNwwDaeKmqWI2aC75UTiXIyX5GD5FrJ2L1D9j/sq+JjyOcD4F
 zynQO//i3MM4oWWvqWxZeORqPqMmQGXBYi/6vVBzyEgqJNGnCpDV/KOIzDHIGGdRzV0VkLhuiva
 ESmPvC35WUHHcPsyr71kYH266cpvUv9yf+5TX+fChARmZe1Pr7zgtjWBwEicaMDgAtrgf2v6
X-Proofpoint-GUID: m5gJJM-rZ4A_J0jSY9dY2dStQv6QJ7dy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_03,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=999
 phishscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180058

QCS615 is a Qualcomm flagship SoC. This series adds support to
bring up the CSIPHY, CSID, VFE/RDI interfaces in QCS615.

QCS615 provides

- 2 x VFE, 3 RDI per VFE
- 1 x VFE Lite, 4 RDI per VFE
- 2 x CSID
- 1 x CSID Lite
- 3 x CSI PHY

Tested this on QCS615 ADP AIR board with CSID TPG.

Tested with following commands:
media-ctl --reset
v4l2-ctl -d /dev/v4l-subdev3 -c test_pattern=0
media-ctl -V '"msm_csid0":0[fmt:SRGGB10/1920x1080 field:none]'
media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/1920x1080 field:none]'
media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
v4l2-ctl -d /dev/v4l-subdev3 -c test_pattern=9
yavta -B capture-mplane -n 5 -f SRGGB10P -s 1920x1080 /dev/video0 --capture=7

---
This patch series depends on patch series:
https://lore.kernel.org/all/20250424-qcs615-mm-v7-clock-controllers-v8-0-bacad5b3659a@quicinc.com
---

Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>

---
Wenmeng Liu (3):
      dt-bindings: media: Add qcom,qcs615-camss binding
      media: qcom: camss: csiphy: Add 14nm CSIPHY 2ph DPHY v2.0.0 init sequence
      media: qcom: camss: Add qcs615 camss support

 .../bindings/media/qcom,qcs615-camss.yaml          | 356 +++++++++++++++++++++
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |  85 +++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 196 ++++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 5 files changed, 640 insertions(+)
---
base-commit: 3e324f3a60a8b7c484c46275be0897a0f5d7fc31
change-id: 20250518-qcs615_camss-f33d85f29e6f

Best regards,
-- 
Wenmeng Liu <quic_wenmliu@quicinc.com>


