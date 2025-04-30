Return-Path: <linux-media+bounces-31481-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C414AA5600
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 22:47:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8731117203E
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 20:47:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BDD52983E9;
	Wed, 30 Apr 2025 20:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Y2klBdci"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF8B20E718;
	Wed, 30 Apr 2025 20:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746046033; cv=none; b=ux+fv3ITjYyawStvE0OA277qSNHhDdRd6N8M8IrkFK9bDXizC1P5/9ZAA804T9PX8scFaRJLy8FItLXAqo7PBlW6btfpsSdZ8sWo+BVPdUm3I9YWtJCMnKbYpz2T9V3GFQg5kJEjfCk0YOhuuf7kJRhjA92fe6TIEfea0jn312o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746046033; c=relaxed/simple;
	bh=npzUvgCq6J5Uc+G4nZ82LxxHvjyLO5RR5lEPUS1jOc4=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=Mw8tCUg0vaaHowm5Lg1Cf4vOjSt6heBkJJzHQ4AftVYzzjeiUtXgC+E96SzOTs8XnXX6JBrn0GTEgsgu31wi236B3DLZ22qvtZIaer45jldekeC2ryomMeMvYL9HwfRBB3ohLzHmJBIy6ygkR7jkYd7AMQgcXJt+g174Fgz2lIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Y2klBdci; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53UGpZnr016952;
	Wed, 30 Apr 2025 20:47:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UOCXB+K1u3MbVXD2qF/vOr
	NCRP0e2g/X6jxL/1SKlS0=; b=Y2klBdciQlt59qafVaPvAWC5GenTXQrq4XHrJf
	6t744UziAyrJkPIrVgoE73khlpUmi3IDlRMdqfZcrYHF++NUixJAVjcCFylgqUPE
	Py/RHxnnwGKmxyNC4G/ic+EV1fYSrhEn8CUGbtCWoFaZ/oNbuQKRhQfJRbu+ObWg
	s+Fuw8wS+n8BTVZDKls3Vgsmks6aw9CBctUJ5a4NStzzxWfU7F5XI2gdOJho8wbD
	4cvWnGlRzq53zKfmSeUx0kPCTXhe8uUgayo7kNOULVkbw+E4h0WpACpeCtKMGIqQ
	wYR/54fiPEpvxOWz4hhVpRE8Gxz5F63STvHXG/VKGZChN/eg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6uabhkp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 20:47:07 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53UKl6li015101
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 20:47:06 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 30 Apr 2025 13:47:02 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Subject: [PATCH v7 0/5] media: qcom: iris: add support for QCS8300
Date: Thu, 1 May 2025 02:16:46 +0530
Message-ID: <20250501-qcs8300_iris-v7-0-b229d5347990@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADaMEmgC/33RTW7DIBAF4KtYXpdqgOHPq96jqirAQ8MicWJcK
 1WUuxc7i6ZJlOUgvscbcWoLjZlK2zWndqQ5lzzs6mBemjZu/O6LWO7r3AoQCpBbdojFSoDPPOb
 CjHdEGlBy9G0l+5FSPq5x7x+XeaTDd02dLod/oV2zRgqh2DTsc2Rla48K2Jo7c2BecBestwGN6
 WazxAdfiMVhu81T13BEIVOUHuvNFFDqvvdWoQIpHUUREnc8SN0uRTa5TMP4s64587XJ441mzoB
 pY5wI0oWa/Fbrx7yLr/XdNWoWz7ionBNwaVVwQO6eyysu5A2XlfeGHGjQhMrec7zmeMNxKU9aU
 49JB/OgvHrGVeWJc5sUqFiP77m+4hJuuGbLryVfv8JaI8R/fj6ffwF/TLjJbgIAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746046022; l=2887;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=npzUvgCq6J5Uc+G4nZ82LxxHvjyLO5RR5lEPUS1jOc4=;
 b=tubdaf76r7A/PbsYiAKrnUp6tXUzsSkrAIdFMA60oUxmAAIj3TAjpIFwj+gMpIGvnPIDXDNtI
 7kwa1920b1vAoX3a2wT49da0FjF3CYXL8pQnZJJkiXpXfENmPs82yfe
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=BNizrEQG c=1 sm=1 tr=0 ts=68128c4b cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=h97imd1RtcNJs7uGSNUA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDE1MSBTYWx0ZWRfX3CYbpdZlwFP0 7l9ujnmolwMqW5iF5mw2xzPl8QVqnjYh2m6p/6OCg0OW1aouYJAeu4ASsEJ6CMAzY3RUOUIZugA IvhUAq3SFmUJpM8eZTb8YyGaIxO6AMcaVLlc8i3fGSC6FoWniPz3EONYiTenpmrNrY6nuveXmjU
 JPjR9MVl5TAdH9P9SkDTokTJX97R8RvxCQtbCKVGZ667lQ35H3KHPcvcznYCeOfe2ni7tLlbJgx dodlUsz0ybEG8Q1PbtAlpU0eva1VUgpWR5yekmvyXlmTuXys0GpiD/Zdyg56JV42J+goZHALd0a bpycKF0MLBB8POoDjZMfUI6GcffvHgHkKqS5Rv8JlDtIIup+GnmDyvdUhBWMtMPmp5reu0iTOKn
 Q9Mc4oZc/lQrsz7FIEt92HNfGe53v98VTRMFncF3iekXE1BaVme1O72lXrfqnuZnVH2iLl+6
X-Proofpoint-GUID: FK_sVxtzks8xmjBrOTUcxoIXUrhrZRFK
X-Proofpoint-ORIG-GUID: FK_sVxtzks8xmjBrOTUcxoIXUrhrZRFK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0
 phishscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300151

add support for video hardware acceleration on QCS8300 platform.

This series depends on
https://lore.kernel.org/all/20250417-topic-sm8x50-iris-v10-v7-1-f020cb1d0e98@linaro.org/

Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
Changes in v7:
- Fix clock corner.
- Link to v6: https://lore.kernel.org/r/20250430-qcs8300_iris-v6-0-a2fa43688722@quicinc.com

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


