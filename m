Return-Path: <linux-media+bounces-28511-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF4CA69E7D
	for <lists+linux-media@lfdr.de>; Thu, 20 Mar 2025 03:55:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A7DB179A3C
	for <lists+linux-media@lfdr.de>; Thu, 20 Mar 2025 02:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8E631EB5E7;
	Thu, 20 Mar 2025 02:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XNEcXFdG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7789C78F20;
	Thu, 20 Mar 2025 02:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742439292; cv=none; b=Q4/g0tZnbeWph6RuMzbDjwGrjRCxUbjpjVejRJtTDBkXETNTw0UVSi6vv6JF7vAPzSY2rp1qYyRfBaMz9RsRMCTTGxGJhvCM+BZ9a+R7XYC5nfdS/hQjv5gHZzbK21ehlCvCnCV3LVu3QCRw9wk+aMGAMR+IKBzzKOp8IPjW5s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742439292; c=relaxed/simple;
	bh=6YGR3xxLuAy6VPfLwDGnb2gK4KW1VwGjWv8ZU9DH4fI=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=QWoMPgCxCE3juVEpZdtVJf12z3CYO82iy1b3/LNbeEaXM1ZcAjiyatFb9E8RqHFiNn+caZYmS35Dz8Qg6Vo4hvRsPIqw1Wg9rxstMgT/IwDCNDUOYVplyHSZA0wfwILu8YUuHx6/JHNgD06jjbxtVtZEMIf0SloUEWTW5di7NgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XNEcXFdG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52K2Kl5L002204;
	Thu, 20 Mar 2025 02:54:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=daihNcU+Ha8PKd8G9F6EL5
	pPpaAxQoRbQZQCKlEHeqw=; b=XNEcXFdGD2vS0361MBXmRanOEMOE0Tng7O9+q6
	JN4ou7uYrVWqbFcGhqXrlZBwa8/1SYbcWOTr09aZD4FauZUI7/QnKmwL9x2kfCb2
	D2si8/VNQGNoha4htyG8DsDRiMwwcrIu0Qar59dopQWTwPS8gsN3182gRwZIPSOU
	VmznCWlyQTQluXiW2484AMGAwmyf/aw1WLiosnIojRugM0EFy6TLV5fZkbKVPsUm
	m5kYTjGdoDNqXdJW7DtrZbElOHFfcM37kZz/6Cdaua2kzsY+TboCJjieOwWYflq8
	0hAzm/Qa8WeObLboeSftaO/OIfzrP3aguNDkwjSCIRmlzkNg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45etmc019e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 02:54:46 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52K2sjKO010788
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 02:54:45 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 19 Mar 2025 19:54:41 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Subject: [PATCH v2 0/3] media: qcom: iris: add support for SA8775P
Date: Thu, 20 Mar 2025 08:24:28 +0530
Message-ID: <20250320-dtbinding-v2-0-8d8eaa4e76cc@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGSD22cC/03MQQ6CMBCF4auQWVvTadMArrwHYQHtFGZhqy0SD
 eHuVhITl//Ly7dBpsSU4VJtkGjlzDGUUKcK7DyEiQS70qCkMlKjFG4ZOTgOk2hahaO3aJBaKP9
 7Is+vw+r60jPnJab3Qa/4XX8K/ikrCimMbWTttPb1QNfHky0He7bxBv2+7x+WE0rypAAAAA==
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
        "Konrad Dybcio" <konradybcio@kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sumit.garg@oss.qualcomm.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742439281; l=1017;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=6YGR3xxLuAy6VPfLwDGnb2gK4KW1VwGjWv8ZU9DH4fI=;
 b=V6xDM4J49VxD6ly4oFvd/bJ7jWDXaJRw/3LLtY6o35DPvvEN+gcc97RIbZGmDC/MzfJvqkCi0
 53Xn8QUkxvQBBzCusuv4HzSnrbBaWDfxTHU/zktlMKxnQw8pWC21KWO
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: WHVkEwfbKMD6pRzfXlcCFIfJJ2ERivqA
X-Proofpoint-GUID: WHVkEwfbKMD6pRzfXlcCFIfJJ2ERivqA
X-Authority-Analysis: v=2.4 cv=aMLwqa9m c=1 sm=1 tr=0 ts=67db8376 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=H251FuTyKS9KxEcm2wcA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_01,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=904 bulkscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503200018

add support for video hardware acceleration on SA8775P platform.

Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
Changes in v2:
- Drop 01/04 patch as it was not needed.
- Introduce sa8775p as fallback compatible to sm8550.
- Move firmware files to board DT
- Link to v1: https://lore.kernel.org/r/20250311-dtbinding-v1-0-5c807d33f7ae@quicinc.com

---
Vikash Garodia (3):
      dt-bindings: media: qcom,sm8550-iris: document SA8775p IRIS accelerator
      arm64: dts: qcom: sa8775p: add support for video node
      arm64: dts: qcom: sa8775p-ride: enable video

 .../bindings/media/qcom,sm8550-iris.yaml           |  7 ++-
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi         |  5 ++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi              | 71 ++++++++++++++++++++++
 3 files changed, 82 insertions(+), 1 deletion(-)
---
base-commit: f2151613e040973c868d28c8b00885dfab69eb75
change-id: 20250310-dtbinding-8921bfc151e9

Best regards,
-- 
Vikash Garodia <quic_vgarodia@quicinc.com>


