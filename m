Return-Path: <linux-media+bounces-35462-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B501AE13AF
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 08:22:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 226E27AC369
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 06:20:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E970221FCC;
	Fri, 20 Jun 2025 06:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="O+P+8Zpi"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719C4221549;
	Fri, 20 Jun 2025 06:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750400497; cv=none; b=C/3wC12fFnrljzlTSz5Bn/CGmdnZSN1Pfsg3bq/7EIqEVYGZPyfOj0T5GZK0kuA+n72w4EunanNajFGjfKk2P4Ipt8/1Heu7/A90AV+6Zf0mgF010HiIkqhBbqesEv90fIJBg+peeiya+bZs/YeRKPCwPgPi1dgiUHxqtKUlJUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750400497; c=relaxed/simple;
	bh=KrCdVUddh2AvMUhY6PXXGl8Ace245bF48j0lvnH351c=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=VhPSC3x33Gx6ppfPBd5cSwrrgNVjBKbsLojGsZJOREcQ51vDqMo1J9hT7Btmeuw7UVGysoqzDWtt16pWiDY6QtJoj5vFCm5BtQ8HEYBhbFwB/6GRn9ddRnQgzbXS+TqcaZTdp/APONUTnO7kzKzqbCLs3svGj9aVusEC+UxjVC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=O+P+8Zpi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JHLTnc024421;
	Fri, 20 Jun 2025 06:21:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2n0ZC64D663skUuAxioyAZ
	SFVw9PoOoTv/Hfj1cHjRA=; b=O+P+8ZpiTpRqPyhQO92E8kUzdJfdgbxN/ZUuzh
	n4c/Uy7wweVi+p2atgmCRUE20TFYgUlJJPpAztks4Rf6/oAJJ3HwdA2UY0O2FYkI
	jjp4kjYKsHL9P7/Va8CKJYSkJwJw8Z5LWl9794nUBEpKQA/D07QcAFurvXelkRTK
	B/NMudvjsc4zNjUR//T7KtQttzWs3bMthlgy0Up0Mtz9C/YJDQSoEk0HyVJAZSyh
	CLAA8k9jw/Ib5iijsx88xv0HD5iCNJS4yoUNGaZSM68hkYGdRKKvsqUZOLsX82rL
	SPrV6+G9uG6ACiTRdb81vYsSCA4Mc/X67lbigNKDrAPraj9A==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47bw13e90b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jun 2025 06:21:24 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55K6LNiE016632
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jun 2025 06:21:23 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 19 Jun 2025 23:21:20 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Subject: [PATCH 0/5] Introduce "non_pixel" sub node within iris video node
Date: Fri, 20 Jun 2025 11:50:50 +0530
Message-ID: <20250620-video_cb-v1-0-9bcac1c8800c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAML9VGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDM0NL3bLMlNT8+OQk3dREC3OjFLNUMzMjcyWg8oKi1LTMCrBR0bG1tQD
 Fr93dWgAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750400480; l=2205;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=KrCdVUddh2AvMUhY6PXXGl8Ace245bF48j0lvnH351c=;
 b=levgnC3Vk8pse30cOwI2nkuFsC5sQHhcgtQCmYqURwNnRmlIzSOaBw1IhFU0spLSJ8lfjRJrS
 2r7g2dhMdLPAuQmcn8dtHAoKkwca0E+OAQg+dMqlS4xBBjXFF+tYRzq
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=QbBmvtbv c=1 sm=1 tr=0 ts=6854fde4 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=QI9hDrH-V8nGY5GeCGUA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: KjlzHcQZ1e_4Z8zK-eu3JwlsKT5zVI_K
X-Proofpoint-GUID: KjlzHcQZ1e_4Z8zK-eu3JwlsKT5zVI_K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDA0NiBTYWx0ZWRfX0aVnTFLfI6R5
 KAD5bGCiQg8CM13em9mYiN2AA42dbTdzv2kNO9/Lr85W5sLtc8tvrgijcs6FH+L+j+m012/p4Hd
 SAJG842FHyFoB91KACsrrtQPKqsL5SBNsQU9Wy0CF+viaddD18UD+Aw3PEEnHxXMMwGmZ59FW5H
 ZVARnrF70mwceRnsEutWYYiMGqThO5KDm6gy1qPHtyVxeAfbt0qEx6QuPmrjmyMwEvgfqsdmCdP
 LSla6j018+1Ns+7diK7QEnDhm4VqEiY6Pp8RtUtAOZm0hB2VciLIf2ROZtkZwfn2a3cQVWJwyap
 Gpl07GPWLaWvJyaJWYwsna8JEOMzRCB3KPltSNN2eOTxulH9SppZepH+pa+mmHL4Z6pbygf+bEI
 tNlwNkRZgmVKQx/o98JkfpEL+XYQGEQxvH1MmzTP8KxVAKlPTgrJaBe2W51ksEXbiAH6gi8/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_02,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 mlxlogscore=941 bulkscore=0
 adultscore=0 phishscore=0 clxscore=1011 suspectscore=0 lowpriorityscore=0
 mlxscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200046

This series introduces a sub node "non_pixel" within iris video node.
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
non_pixel buffers, thereby introduce a non_pixel sub node to handle 
non_pixel stream-ID into a separate platform device.
With this, both iris and non_pixel device can have IOVA range of 
approximately 0-4GiB individually for each device, thereby doubling the 
range of addressable IOVA.

Tested on SM8550 and SA8775p hardwares.

Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
Vikash Garodia (5):
      dt-bindings: media: qcom,sm8550-iris: add non_pixel and resv_region properties
      media: iris: register and configure non-pixel node as platform device
      media: iris: use np_dev as preferred DMA device in HFI queue management
      media: iris: select appropriate DMA device for internal buffers
      media: iris: configure DMA device for vb2 queue on OUTPUT plane

 .../bindings/media/qcom,sm8550-iris.yaml           | 35 +++++++++++++++
 drivers/media/platform/qcom/iris/iris_buffer.c     | 15 ++++++-
 drivers/media/platform/qcom/iris/iris_core.h       |  2 +
 drivers/media/platform/qcom/iris/iris_hfi_queue.c  | 20 ++++++---
 drivers/media/platform/qcom/iris/iris_probe.c      | 50 +++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vb2.c        |  4 ++
 6 files changed, 116 insertions(+), 10 deletions(-)
---
base-commit: 8d2b7fde56597ca912f5daaf3ab58915458ba1fc
change-id: 20250619-video_cb-ea872d6e6627

Best regards,
-- 
Vikash Garodia <quic_vgarodia@quicinc.com>


