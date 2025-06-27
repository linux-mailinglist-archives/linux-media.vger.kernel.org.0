Return-Path: <linux-media+bounces-36110-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CBAAEBBDF
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 17:33:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 249C4165D68
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 15:33:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E36F2E9732;
	Fri, 27 Jun 2025 15:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ov/iGtN1"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4632F1FF0;
	Fri, 27 Jun 2025 15:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751038383; cv=none; b=tkPaUnyOF8z8Yi51pjbQBpBQA086zqPFAoF5yT5Ku36sU8YD3fR4jOkyAcdaaSTNE8U6vNueHGagxM3GeOVduGO4v7xpt26yJLsvH78yM5a3qRpG1NE9bUhF3PqOsvFkptCLHsulDgQLnTpaCYiVnlmy17EvI0Spw4p8VqQHqpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751038383; c=relaxed/simple;
	bh=pzYxv4fRKqPPY1Dmsyi5vG3fczHwbCwnYZqbhu1XeNs=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=ABt0o5ltq2lQj5GS1jeDdGkiruwxMn18EBdunOhzRUyh+jhidzUm1SzPImQzUUexq45o2OLC9qfDzxay+R3J6iUFcP6VfYOR4VkA5xl1+K6syvEXHvvpHZ1vKxjAWADchjebptczPPpQGFzlFc2VY0qslWsLFG6C6dGKmvq9caQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ov/iGtN1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCxDmA009881;
	Fri, 27 Jun 2025 15:32:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=70V53j8qvunocRKnJOI7TU
	DvWYGaHsTp/0KtFktly+c=; b=Ov/iGtN1ShMBNhHFfg2ShejGwKxdB3A+6b5O94
	d8NlYr/WUaqfitlCBGIdfTQhTO9fODRPU1ryY1Ys/cUAq9m6xtSjt4+6CSjWyMO4
	TXQ0vNG9vLLGxC6j4B9lQUfR0e57sTB4YjxfD3GdciJwo1TuI7EfbO6JRkelnsut
	1QoAnGxaQIjf9ctP2zBZZ2i1ivWCTFaiJcCvEaoP9hyQZuNmZ4zR3+lpomsDOFUl
	mAaqcmB7Cgc5c8EKfUIfWGZL3sH3fZPkAI4aCJ1JinIvqehukBijB1Zg9+FLBBew
	4Vvh4/WjJ3COPtruSLUoOlcTCr+dyNTLidWt0wKNhfHippXQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g88fh1a5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 15:32:55 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55RFWsUK023596
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 15:32:54 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 27 Jun 2025 08:32:50 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Subject: [PATCH v2 0/5] Introduce "non-pixel" sub node within iris video
 node
Date: Fri, 27 Jun 2025 21:02:37 +0530
Message-ID: <20250627-video_cb-v2-0-3931c3f49361@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJa5XmgC/0XMQQrCMBCF4auUWRtJAqapK+8hRdLJaGdhookGp
 eTuxiK4/B+Pb4FMiSnDvlsgUeHMMbTQmw5wduFCgn1r0FLvpFGDKOwpnnAS5GyvvSFjdA/tfkt
 05tdKHcfWM+dHTO9VLuq7/hAt/0hRQophQocKrZUSD/cnIwfcYrzCWGv9AJ3TuuSiAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751038370; l=2474;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=pzYxv4fRKqPPY1Dmsyi5vG3fczHwbCwnYZqbhu1XeNs=;
 b=YAEsEAzL0P4GqLjnaRz8ObpsDqES2aPLz74d4TNarLAJ6HsFvL79qgoUf4VKhUAb41S9MVJ0/
 +LYp9DxJwtzCVHO0GkNbCi4m+zqiGL+i47h6qAGT5PWJ2vSSqQ554m0
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyNiBTYWx0ZWRfX0tjrv2O2e6x6
 PTaaOIrVtT+tAPp1rlpxyKRSbHw78NzO6amIqgDDRZw//d8Dsrb6ffxOJDlJ0LWVjmVu4yem9yx
 /rj5NrGdOxFYZTNLFndi+fnWse3a5p6+flCnr/OmJcf5p+icUWz2B1V+ckwM7HXaqT9DvBd/pQj
 muLlkXeJKCdNsTLFVhVcPuIkgjBHxF7wLP7ygpdqPmt9b9SDAFYBQ9EjXjPAsTBIhBEk2+hBV7g
 1pUk8MriBFQXg6L2QDsUAXQRdLWjgHePEtKzqj4dj/twerh4kc6izkWvSOJtTuj4eHSccu9DjDM
 uod6enGEQv9T0qq1APj7dZFCwueD4tP0DYm3czthsXOfx2328vBHlSdtegCnKvaphfgZh5Yj8dF
 /ekTWiFHYBUfgeG/qsi/Vf0AdGT5ecLJDljwmw89akPoVj2hVQLBfJQv1VlNvbwTcYEY8Pbj
X-Proofpoint-ORIG-GUID: FzlD9inFEztSW6ANPLrcn8bQugFFDutL
X-Proofpoint-GUID: FzlD9inFEztSW6ANPLrcn8bQugFFDutL
X-Authority-Analysis: v=2.4 cv=LNNmQIW9 c=1 sm=1 tr=0 ts=685eb9a7 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=-uV1lah22-dM7An3ZVQA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=929
 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270126

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


