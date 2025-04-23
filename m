Return-Path: <linux-media+bounces-30826-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E76A99451
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 18:12:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E01089A6C5D
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 15:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B380E2957DA;
	Wed, 23 Apr 2025 15:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ROjN6WY7"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657C22857EE;
	Wed, 23 Apr 2025 15:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745422781; cv=none; b=QKj+5L0bo4NHrjwLVic/8exv5ZoL1/AWTqpwSviyQAoawmiMmO+RXJGmtRXOrKtBDALEJeWKAoU106bXRJZNPKe0HAvl4AhqsqQ/AopfGGOOR7BlXcb1gVF1Y9I1AfrvJ2iVqutlff3j8Z3t95Adv3kE9T9bY2qn+jqnfrJlerM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745422781; c=relaxed/simple;
	bh=kNGB5YXtXAqmpxK7vK0SlqiLzqIf6I/6at0+ZyvkoIc=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=oqBCyjhoYJpgJhWGDVUngPyKPbSD2vmAbTBxVcv3dkXmpSMd8GOv2JMjy05xsxUypnfrqRf8xgFhXHmq0EQzg406lu99E214qze1ee0u3lLT2Jkn2M8anVODpzuZBf8Ce8WnkvQMcpH05pH0zlnfneUBmlT4+bWYomn+P7cVi44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ROjN6WY7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NB6aov024113;
	Wed, 23 Apr 2025 15:39:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5rX2doOTGlZS+AQZvnUt6v
	A25O41tf6+UN7tFNd1frs=; b=ROjN6WY77SzBMK+HzKT6eakJ8O12EkhS1wnXmM
	doGm3BaNYP92XN2rs7WGkr4B6iLnU2aI21/bhiJ0J29vMdLw/urcmEbIfd+jqo3D
	XCGuwQX9ylM9OZPzbzwJP0tV1oVYZHhCqGRBK0iOGEDz5XPdN5lD+zdktalWyUA4
	KpRfcgKlg6vE/H1DVq2ebY17EIbUG/WVti8kyYb3cFpbngY0zTyXcyYuECvXD6aY
	qJGzt8/60P+f+cWiearIxptjwRkUT40an/vp//YQBnLGPwGdo5tfCQAYdGqJCQmD
	Cv0laYHWzvMvGzMPCewT5noNekBgFMY6adiFzBNMNZmDUoUA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3akjv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 15:39:35 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53NFdYWn029582
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 15:39:34 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 23 Apr 2025 08:39:31 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Subject: [PATCH v3 0/4] media: qcom: iris: add support for QCS8300
Date: Wed, 23 Apr 2025 21:09:08 +0530
Message-ID: <20250423-qcs8300_iris-v3-0-d7e90606e458@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJwJCWgC/32PQW7EIAxFrxKxLpXBkEBWvUdVVUCcDoskM5Ciq
 Ua5exlmUVWquvyW3/P3jWVKkTIbuxtLVGKO21oDPnUsnNz6QTxONTMJUoMShl9CNgjwHlPMfHC
 WqAeFQjlWkXOiOV6b7vXtkRNdPqt1fwx/pGPXlFJqvm/nGHhezFUDb94igDsprDfOeDUMYxnue
 u8y8bAtS9zHTiglcQ7oVN2cvcJ+mpzRSgOipSD9LKzw2LN7kVPM+5a+2ptFtCZ/f1QEB94Pg5U
 era/ml1o/xDU817tNVeR/uKy4IBBotLdA9jd+HMc339pW3HIBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745422770; l=2150;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=kNGB5YXtXAqmpxK7vK0SlqiLzqIf6I/6at0+ZyvkoIc=;
 b=Gv0X7rBXf/0nNz6q4DPVVfagUD3o28vGc2a3rVQn060EiwL3eOh/TDNEYbULZnBDYt9YbEVIS
 l8nqWaZSybrBlRQhoCoNXM5D9ydq7C+xrrurSrwTNN7ix3rrSxw9aS9
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: cSACoGWWHzA1uPMoK56oTQKR763OlqPk
X-Proofpoint-GUID: cSACoGWWHzA1uPMoK56oTQKR763OlqPk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDExMCBTYWx0ZWRfX4RDU5aVTMdJn GYYTj3EUIJBf5/fS3pGZJKIrDxVI+6GWjYDfv7MYk7XuvCa8ygXbVIeuwPV+lFQlSOvZ6ouz4bE wf/0cj5KsBt8CktSQdWXUEuV3zlGOKJhlJCIiynd+dmycIRYtCas2uru8OGVv0aZK+J4vyAHXPM
 7JbevaBidLqr5+IEeKRVYakHkYA3aCH6uhPXBdzP+2ExoWAvT8gytcPBGbyKaOuyKSWuOpH6wRs SpaReMb9hBupUtkIK0t87rUlikCRQo2CgVIfcowj7V71xJM6NX1by2n4DKLQw93oDBef6UV4Tre 20HjH2QZNJGddX4DMp1NInk+ZyoTSExhfWEBEV+mXZ2kmnAPgDdAHJRTPtotI6zBsiU4ZGrLUjw
 4jg0lvUgXLDhxtmRziIKwbgC3ft606t9YSPhjS/QEHul4pa8m5Hzj7Teyq+ebZ5hsuh7OCh0
X-Authority-Analysis: v=2.4 cv=Mepsu4/f c=1 sm=1 tr=0 ts=680909b7 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=h97imd1RtcNJs7uGSNUA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_09,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230110

add support for video hardware acceleration on QCS8300 platform.

This series depends on
https://lore.kernel.org/all/20250417-topic-sm8x50-iris-v10-v7-1-f020cb1d0e98@linaro.org/

Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
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
Vikash Garodia (4):
      dt-bindings: media: qcom,sm8550-iris: document QCS8300 IRIS accelerator
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


