Return-Path: <linux-media+bounces-30869-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1346A9988E
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 21:34:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 511505A00E9
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 19:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECBCC293B77;
	Wed, 23 Apr 2025 19:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ayeByuZW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8181229345A;
	Wed, 23 Apr 2025 19:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745436839; cv=none; b=J8pcpjsqwpnm/yDI6YiRa21OrWxjMNqVp9Ub1/iIw9sRgWl5jLx6DKONuZy8WAWxTrEa9COcR3nDAg/oYMdQ0as5tYobFe7gOtpxS1aziXLF+cI1Ylbr+gOLHE/k6F8uqKP+unqQ+hiYvRt2QDijkIBzVOn1pck7V94Li20xzT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745436839; c=relaxed/simple;
	bh=lGsfM0YE4fOa4De+TTZOodmd878I+2yJ1yZmukK3EEY=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=EZSoR6ZMNZ1lkOGCQpVr2UnyVyDwi6POs3gUbSr7645Flo4vtFkoQZIkiKetAUoxo5qn4eVDtx5OApuySt4iGXzw87PVNkNoaK/aFXsitzMf51Xg9ulU1L1qR6xD80+rWnKHifZnSMhIPFCtxGa33Aevzx0jYkkUxh7eHEzFL/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ayeByuZW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N9rKYT007637;
	Wed, 23 Apr 2025 19:33:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9O4XVfQFkJ04PlfOMtgBk5
	5vtD1zvpUJSZ0Z5uuCr9c=; b=ayeByuZW6lMp/lSjHG+ERSfgAPPrsfV9yetiKe
	MpjdGlckBdb0QOLWDnC5T/LKNxb7ZCYusWf0WfwywuFrz5O1R4S8AAlKR6NC9ltG
	yLpEQJM6w0NhU+V5DFbGpqSqXVWjHIXDLnx1KM2hlAYdCl4tIboZ55EJzXbToNaI
	ONBG2HGignGRSgZPP06BVCNPx2OPXBI9ku1dyYiZd6MvEIU9ekCRhFiIkbfPX+fB
	x2FueIoYTHogRzRieoKopJmVGvJDdkLDwhtoH2mwtchEy6mxJvOXi1wuaZyWCKny
	bn0sCu41Vhn5Y9FYVKH1FRmh0sFLYKNPzLRf2K0Us7N8YkNw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh5b7jj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 19:33:51 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53NJXkiV021749
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 19:33:46 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 23 Apr 2025 12:33:42 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Subject: [PATCH v4 0/5] media: qcom: iris: add support for QCS8300
Date: Thu, 24 Apr 2025 01:03:30 +0530
Message-ID: <20250424-qcs8300_iris-v4-0-6e66ed4f6b71@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAItACWgC/32Py27DIBBFf8ViXaqBAQNe5T+qqgI8bljYTsC1U
 kX+9xJn0ae6vKM5Z+5cWaGcqLCuubJMayppnmpQDw2LRz+9Ek99zUyC1KCE5edYLAK8pJwKN94
 RtaBQKM8qcso0pMuue3q+50znt2pd7sNPadfsSik1X+ZTiryM9qKB795VAPdSuGC9DcqYbjU3f
 fCFeJzHMS1dI5SSOET0qm4OQWHb995qpQHRUZRhEE4EbNmtyDGVZc7v+5ur2Jv8/dEqOPDWGCc
 DulDNh1o/pik+1ru7apX/4bLigkCg1cEBud84fsEl/sCx4r0hBy20pLT9jm/b9gFKQJXusQEAA
 A==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745436821; l=2414;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=lGsfM0YE4fOa4De+TTZOodmd878I+2yJ1yZmukK3EEY=;
 b=5hOT1gvXshaUidmdGCSkPzUM4IM+1adqbQAVGd+wmc6kqRUr6KeqppyKqupik8hE13EAFKojk
 HTRBuFjH2VmBDkRD3lavBRXhVocx8X92KM9otJQHq6PGWVPfEH34PdM
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDEzNSBTYWx0ZWRfX5omE4OwKoxrm Oqlg4zbZh9SBEaW9u4Yt3ZIWTv66fHTEX4rR0/CeWAklJIIeEsfUHni5i6yxgSj/pHimZoYKFWt qu12dblU8TEop+6psl/UQqAbophqnFM4OBcmj3Oe17j/ejufyqYmmOLDa4EylDiknsn2mZzQMnC
 XA+gty3uyio9pOFMsTu9WoKxknSM++oc8OpW+no1tGzohz2nx9xqTGsGPAc8jRpxF2/MiXkpLq3 ModoRi3Oguv9AStkIjGQLYaMZqoT3I0sxrwotiH2H3BraDj1v/11dBA7vmSN0K3M/tHaK4zGqn0 1rH+w4cr8F2JOui8bbONFoDjAIgBttDzLyzl1O8msvc90dZ8fGYH9u4tL3HktNz+pHZSZcFPp4R
 6zsWCAaUkwAWQ0nhBriWCkUZGGlwZ532k3efUu4J38/goChLc4kzs1jXX7Wyw1lTPLSGvjdA
X-Proofpoint-GUID: dzFrhIBmzRoPwSO7vcCR4U_Mt_BH8YIE
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=6809409f cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=h97imd1RtcNJs7uGSNUA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: dzFrhIBmzRoPwSO7vcCR4U_Mt_BH8YIE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230135

add support for video hardware acceleration on QCS8300 platform.

This series depends on
https://lore.kernel.org/all/20250417-topic-sm8x50-iris-v10-v7-1-f020cb1d0e98@linaro.org/

Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
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


