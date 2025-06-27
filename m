Return-Path: <linux-media+bounces-36117-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A88D4AEBC4E
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 17:48:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A036C1C60975
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 15:48:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBE652E9EB8;
	Fri, 27 Jun 2025 15:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cl22qoL9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2C32E8E05;
	Fri, 27 Jun 2025 15:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751039309; cv=none; b=AvMtmie4oaWm8qdrcuiNjWuauOoBa/6DjnxR5k8chj1hl1+7/dMUPTNuXnw4V/H/kntNnp3YedYcoAyanu582nKBL6Ae4yvS+N4Urh00ccv9vQkrIixkFloF8p+etMISYJIzF8OSI/q4nXm6B7AfI0ak5R40qeNGdOyTmzxEcH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751039309; c=relaxed/simple;
	bh=BeiQ89PQfTbEIHtTdQKq5JMrvtmhh5yqI8mdGU5Ym3Y=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=s0cvHHbO97vrF+lMPwaXiYQBuZTedkDk6CE+zYLSnFjG2HJza4XBs+PieiP8i0DEgHzpLnYIDLP/2PmsqTx6m2GDnEnJ9RhteuAZdEmBawi+uQYDm9bRIc529fj05Gd7NA1N3zxDdfE8PLJFBlpVR1ih/eHa7WVTTJ0qkXO0jzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cl22qoL9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCsmqC009899;
	Fri, 27 Jun 2025 15:48:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HQz8cVOhmxGEEYAb1xzBVC
	55eBfist8aJcgmzQAGgrk=; b=cl22qoL94CTLkq/Oz9ePVzqbJbHs5urZrsTO82
	MQaYn7qt7l52s047ejOQ6kkuVrLxtBbkrLleM1Gnw+dXl6qbJBuh5KsJD2X250sv
	KZekiVop17yiPZ6ujiQwB7Bj41Ba8lNW/ToE2eH8i+Rnj51VKunFhPyE43HFgTPX
	A/9sTW1qaBfY/xwOmREKSPEWIg4Bf0YjUoFDxAh6HhK0YNEAvmpjWxNQ5VzjQU2A
	scA/tNFNOWKQgi9mm7N/HPhiPeRDQdpr9iMds2sRWSlzIfcL8ZiLQaflzxeZBW9d
	/2LhTStFTfGo+eG3IBkkviOS0eVjVX+mNQ50rUPfT4OpPh6Q==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g88fh2d5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 15:48:21 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55RFmKdK022489
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 15:48:20 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 27 Jun 2025 08:48:17 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Subject: [PATCH v3 0/5] Introduce "non-pixel" sub node within iris video
 node
Date: Fri, 27 Jun 2025 21:18:06 +0530
Message-ID: <20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADa9XmgC/1WMQQ6CMBBFr2K6tqadaqGuvIcxBoZBZiHVVhsN4
 e4WYiIu389/bxCRAlMU+9UgAiWO7PsMZr0S2FX9hSQ3mQUo2CmrnUzckD9jLakqC2gsWQuFyPd
 boJZfc+p4ytxxfPjwnstJT+s3AuoXSVoq6WqsUGNZKoWH+5ORe9ygv4opk2CpFgsVsmqc0Wjar
 TNW/6vjOH4ADyRagt0AAAA=
X-Change-ID: 20250619-video_cb-ea872d6e6627
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar
	<abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751039297; l=2643;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=BeiQ89PQfTbEIHtTdQKq5JMrvtmhh5yqI8mdGU5Ym3Y=;
 b=2boNhXDnMxcFAWK3/4kgAzB0xOR8ionTisNbjnH1tD8O/eMiRom4F2mzKV+3c3VaewqD1c1Nz
 AAVmK9mQ7qfBvTRTI+yC8iri2iL7T2N+WrKECo0lCRbr2iVeqSO/9Yv
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyOCBTYWx0ZWRfXybz2OBr8488Q
 so+QZ30ISvraeCk3h2MPhAJiDnqpOzCT4fcqmRFuy4enoSBJ1q+AiPSg8qk31OYBhUEtcSlWaoG
 /T9NxN8nUe3Y8Ilx0MuUu97zqi1AgvjrNz6vjhl7Yfa4HOr7ue4niHVknQ66wlyW08hUOIoLlZN
 N710SxCzcVMkHOVo4xh7++muxPqGqGS+kHEfLLMI9x7mokQGmQtCN9uyJ9XyfsZlVT8WZt1zyzq
 gawTESS8obarrVAL02DM8ycLkJ39OQy0nSX3Wd5GfdmCcr+K1x4UGMVO/141vKALmwmC0ef+zRS
 INMEG41Pa7sMXYm9J/OD4IjTeQT2JaTECNbL2EuuS/vzfgdTaYtAP2OPo37UO5MCQJRTGaLwaEz
 eKEnDwylr2gf8Wj9E9bOSKLTUP8muIVFBUNQlePtQkQORAL3nK4JLYgteHVqVyAsppZpIo1B
X-Proofpoint-ORIG-GUID: X2Rpjocd3F5EZcg8yuBo4_yiSLkA_P5y
X-Proofpoint-GUID: X2Rpjocd3F5EZcg8yuBo4_yiSLkA_P5y
X-Authority-Analysis: v=2.4 cv=LNNmQIW9 c=1 sm=1 tr=0 ts=685ebd45 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=-uV1lah22-dM7An3ZVQA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=937
 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270128

This series introduces a sub node "non-pixel" within iris video node.
Video driver registers this sub node as a platform device and configure 
it for DMA operations. All non pixel buffers, i.e bitstream, HFI queues 
and internal buffers related to bitstream processing, would be managed 
by this non_pixel device.

Purpose to add this sub-node:
Iris device limits the IOVA to an addressable range of 4GiB, and even 
within that range, some of the space is used by IO registers, thereby 
limiting the available IOVA to even lesser. For certain video usecase, 
this limited range in not sufficient enough, hence it brings the need to 
extend the possibility of higher IOVA range.

Video hardware is designed to emit different stream-ID for pixel and 
non-pixel buffers, thereby introduce a non-pixel sub node to handle 
non-pixel stream-ID into a separate platform device.
With this, both iris and non-pixel device can have IOVA range of 
approximately 0-4GiB individually for each device, thereby doubling the 
range of addressable IOVA.

Tested on SM8550 and SA8775p hardwares.

Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
Changes in v3:
- Add info about change in iommus binding (Thanks Krzysztof)
- Link to v2: https://lore.kernel.org/r/20250627-video_cb-v2-0-3931c3f49361@quicinc.com

Changes in v2:
- Add ref to reserve-memory schema and drop it from redefining it in 
iris schema (Thanks Krzysztof)
- Drop underscores and add info about non pixel buffers (Thanks Dmitry)
- Link to v1: https://lore.kernel.org/r/20250620-video_cb-v1-0-9bcac1c8800c@quicinc.com

---
Vikash Garodia (5):
      media: dt-bindings: add non-pixel property in iris schema
      media: iris: register and configure non-pixel node as platform device
      media: iris: use np_dev as preferred DMA device in HFI queue management
      media: iris: select appropriate DMA device for internal buffers
      media: iris: configure DMA device for vb2 queue on OUTPUT plane

 .../bindings/media/qcom,sm8550-iris.yaml           | 40 ++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_buffer.c     | 15 ++++++-
 drivers/media/platform/qcom/iris/iris_core.h       |  2 +
 drivers/media/platform/qcom/iris/iris_hfi_queue.c  | 20 ++++++---
 drivers/media/platform/qcom/iris/iris_probe.c      | 50 +++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vb2.c        |  4 ++
 6 files changed, 119 insertions(+), 12 deletions(-)
---
base-commit: 8d2b7fde56597ca912f5daaf3ab58915458ba1fc
change-id: 20250619-video_cb-ea872d6e6627

Best regards,
-- 
Vikash Garodia <quic_vgarodia@quicinc.com>


