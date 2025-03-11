Return-Path: <linux-media+bounces-28028-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D8734A5C070
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 13:16:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0468618920FF
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 12:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B93082580C2;
	Tue, 11 Mar 2025 12:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZUSprxPw"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783A6254851;
	Tue, 11 Mar 2025 12:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741694677; cv=none; b=YahteRqifP+2kuFHneYUeuaDwr2g1XDdc5qV+XQSBLgbE9hr7JL09GPUlR+MPFouCaQ4kwd0CpMoMX8cb9dpenJxAV3MvbqyNqvlVsnpC9PELBA23Xx4JsFkmWC6DGVGX4hOGCOyMBDPAAfk8gvkSKltJfBE6AY3RNXh2SAEEHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741694677; c=relaxed/simple;
	bh=/hyzRqo/EjFJuD5hBfmi4j0cxnnXEkdhQnXX5f/LBJU=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=JuAX8J1O2I5io/sXp3F2JqWsqZowK4XMyh4VZRQlfedIuKdJJRiJxazauUhZqvdlsHHD9Gl699KKBI/CgLOWt7bHaZEqS9yM5PRNCChvJx6ZtysseDRGJhdyJrr3O/pRCOH/xuRrPg3NI7ierjVaFJcdHdE0lM8KIh/+k/XTz94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZUSprxPw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52B7jSLk022356;
	Tue, 11 Mar 2025 12:04:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=u1zZXPIOwRSCiN1Kdwzg+S
	DIi46E0QuCFvXHLpK7FNs=; b=ZUSprxPwy66DB2qAs481kYe7dinYPClm5gP8gz
	+BIgbOaTq2v0W9xnxFvHz2rndZcZIQxx9W1IDAJy1kysJ3WbQDwyBMJAnUkga/kw
	/uNNoZacQrwQzVr62jGxYBrGSf4kKy83/1esg2+cdrCUlK0sVEMGz3webDu5VTeE
	fgP1WKpgIpQlvE5Yz5U0u8EOUqaiF/smymIuwPLu1aqO7eyykK1PpMzGcObhgrnx
	31kUU1sIirFcwEwrVRysKFKEuDVtThcYtZyZmE7lciaWHeH0VPev5UV+epTQ8wTv
	WknzVQurUaUOVMnpYnbVJFvqY8jtjggzlVx8djrTq4G2HPZA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458eyugemq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 12:04:31 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52BC4UGR028138
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 12:04:30 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 11 Mar 2025 05:04:26 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Subject: [PATCH 0/4] media: qcom: iris: add support for SA8775P
Date: Tue, 11 Mar 2025 17:33:52 +0530
Message-ID: <20250311-dtbinding-v1-0-5c807d33f7ae@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKgm0GcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDY0MD3ZSSpMy8lMy8dF0LSyPDpLRkQ1PDVEsloPqCotS0zAqwWdGxtbU
 A/QbDiVsAAAA=
X-Change-ID: 20250310-dtbinding-8921bfc151e9
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
        "Konrad Dybcio" <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741694666; l=950;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=/hyzRqo/EjFJuD5hBfmi4j0cxnnXEkdhQnXX5f/LBJU=;
 b=K2Xu7VLeH4EeGlWKFzsHkK15lwSPLIt8w0mcBsBPEyk7QJ41qKr9ia/aCzEnmeasaY7Pi3R07
 4pHAZ2frnt/Ds6t73eu2bv5FkBcGMNvBgTsim+FhzyfDeJxjDkZxor6
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=cbIormDM c=1 sm=1 tr=0 ts=67d026cf cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=mjDvK4EOspKsfaktqpsA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: CFjwq3hK7aHI7wPGgBYwCDurq2nGrLG1
X-Proofpoint-GUID: CFjwq3hK7aHI7wPGgBYwCDurq2nGrLG1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_01,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 mlxlogscore=945
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503110078

Add support for video hardware acceleration on SA8775P platform. SA8775P 
is a similar video IP as that in SM8550, except the input to hardware 
being a collapsible MX.

Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
Vikash Garodia (4):
      dt-bindings: media: qcom,sm8550-iris: update power domain name
      dt-bindings: media: qcom,sm8550-iris: document SA8775p IRIS accelerator
      arm64: dts: qcom: sa8775p: add support for video node
      media: iris: add compatible string for sa8775p

 .../bindings/media/qcom,sm8550-iris.yaml           |  6 +-
 arch/arm64/boot/dts/qcom/sa8775p.dtsi              | 67 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  4 ++
 3 files changed, 75 insertions(+), 2 deletions(-)
---
base-commit: f2151613e040973c868d28c8b00885dfab69eb75
change-id: 20250310-dtbinding-8921bfc151e9

Best regards,
-- 
Vikash Garodia <quic_vgarodia@quicinc.com>


