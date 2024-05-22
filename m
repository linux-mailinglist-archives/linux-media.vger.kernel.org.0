Return-Path: <linux-media+bounces-11737-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2298CC460
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 17:47:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D2AE1C21F6F
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 15:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C95413D63A;
	Wed, 22 May 2024 15:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="F4CHmBRK"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6380E28EA;
	Wed, 22 May 2024 15:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716392866; cv=none; b=aaQrglhmvLovKDI3c+cJSivaVKBgiAwZ9TMq7GFVuWmRnO/xu2gSn8KAGIcwjBBWGuoxnh6Hg9AmfHDL9XSkwtgunjEsRMa3xSyW0w2TPlVvZxZ2dB7D5m+C6t4nkQrTQ2boOcmtBIrXPoRg5gzhfm/XavNB7FwsSAzZgYLEkzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716392866; c=relaxed/simple;
	bh=Z4b6yAOm419MX7wPDVaKyHdQeVieRDgxocrRUfc/tls=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kkDFTlzoXl6J/IYT8DOCGSDU1nq9WeO90S8o9PRUoHy/AVmJ+hbWoa4FmyEzd2FCuhfAPZHMvz298/av0JPO3DT7Cski8TKKrUr3xB7kSo3uIr2zJax2Qxzmb6C2KoyUlOUBNN9pbhF9iXqMReJ9bx0D34dheCp5hgHxZu96JEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=F4CHmBRK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44MDXFES009063;
	Wed, 22 May 2024 15:47:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=f9u+nCP
	C+UHzz1WIorUWxk8YUqmznhU63Uts/ePUqj4=; b=F4CHmBRKbYqf17etxOLagm4
	iUsLc10bE3VB5M1NUgCD7Iz9P6SWuE7NCglcWKY3h+ReoB+uj2FvA6hIYjKY/bK7
	FzfSYRvS2S4rC31qaNSNwjRsvIhEPI16Oo6i251LonMgXKAv5u4v+/fLXgNp7iI2
	JY3zJfzmNWWhtNWpKKKgW7dZ+TNpDUpab/xj9mDL0vHMWjmtq5RBClP2TNNeyoqm
	0/n8s1Yj/hyQKNW0ugt/o/M3cnRdIAGgqCSovkZqtc+2/3Mqu+IJkGizw8N3/JQX
	l7GOxFod1FXm8wA87P3xXrvB39iPSjeR3MLX/ugLf+DhkYHjV1CKYMsxZBhrOMw=
	=
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6pqc9jm8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 15:47:32 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44MFlUFn010548
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 15:47:30 GMT
Received: from grosikop.eu.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 22 May 2024 08:47:27 -0700
From: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <laurent.pinchart@ideasonboard.com>,
        <hverkuil-cisco@xs4all.nl>, <quic_hariramp@quicinc.com>
Subject: [PATCH v4 0/8] Move camss version related defs in to resources
Date: Wed, 22 May 2024 18:46:51 +0300
Message-ID: <20240522154659.510-1-quic_grosikop@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: McuxGJK1IvhHIB9GhJxPAIBF1XoesGTT
X-Proofpoint-GUID: McuxGJK1IvhHIB9GhJxPAIBF1XoesGTT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-22_08,2024-05-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 spamscore=0 clxscore=1011 lowpriorityscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405220107

The different resources required for different camss soc versions are
split in to two groups:

1. Camss device related. In this group are all resources described
in the device tree, clocks, regulators etc.

2. Sub-device specific resources. In the initialization
of the each sub-device, the version of camss is passed.
Based on this version the sub-device adds: hw layer support,
per pad formats, number of dma's etc.

The code for "1" group lives in camss.c. However the "2" group
is spread across all sub-device implementations including video device.

This kind of separation is not very convenient when adding new camss soc
version. The reason is that you need to add support in all sub-device
implementations.

There were some improvements in this direction where some of the
hw version related definitions were moved in to the "1". One
example is attaching of the hw operations.

This series aim to improve the things more and add additional definitions
in to the "1".

What is included:

- Remove all format definitions from camss video. The will be passed
  by the parent sub-device

- Make camss generic format definition mapping, containing mbus to
  v4l2 mapping, mbus bpp and other required fields used by the
  sub-device and video node.

- Add per sub-device type union in the resources, different
  sub-devices are using different resources, as an example: is_lite flag.

- Move camss link operation in to the resources. Currently one
  function supports different topologies depending of the number
  of devices. As hw version support increases this is not good
  way of supporting different topologies.

- Add parent device ops in to the resources. This resolves
  inter-dependencies of vfe and csid. Csid requests the clocks
  regulators etc from parent device instead calling directly vfe
  functions.

- Some cleanups in csid code for split the configuration of
  RX and testgen and RDI.

Changes in V4:
- Updated first patch with once posted by Bryan O'Donoghue <bryan.odonoghue@linaro.org>
  for adding missing csiphy types in 8280xp resources.
- Incorporate only cosmetic changes pointed by Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
  as agreed.
- Add Reviewed-by and Tested-by tags form Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Changes in V3:
- Incorporate missing changes in resources reported and fixed by
  Bryan O'Donoghue <bryan.odonoghue@linaro.org> taken from the branch:
  https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/sc8280xp-6.9-rc1-camss-resource-change-verification?ref_type=heads
- Added missing signed-off to the changes submitted by me.

Changes in V2:
- Rebased on top of sc8280xp v6.
- The change "Designate lite subdevices in resources" was dropped,
  it was already merged in previous series.

Atanas Filipov (1):
  media: qcom: camss: Decompose register and link operations

Milen Mitkov (2):
  media: qcom: camss: Split testgen, RDI and RX for CSID 170
  media: qcom: camss: Decouple VFE from CSID

Radoslav Tsvetkov (5):
  media: qcom: camss: Add per sub-device type resources
  media: qcom: camss: Attach formats to VFE resources
  media: qcom: camss: Attach formats to CSID resources
  media: qcom: camss: Attach formats to CSIPHY resources
  media: qcom: camss: Move format related functions

 drivers/media/platform/qcom/camss/Makefile    |   1 +
 .../platform/qcom/camss/camss-csid-4-1.c      | 132 +---
 .../platform/qcom/camss/camss-csid-4-7.c      | 160 +----
 .../platform/qcom/camss/camss-csid-gen2.c     | 410 ++++-------
 .../media/platform/qcom/camss/camss-csid.c    | 512 ++++++++++++-
 .../media/platform/qcom/camss/camss-csid.h    |  32 +-
 .../media/platform/qcom/camss/camss-csiphy.c  |  74 +-
 .../media/platform/qcom/camss/camss-csiphy.h  |  23 +-
 .../media/platform/qcom/camss/camss-format.c  |  91 +++
 .../media/platform/qcom/camss/camss-format.h  |  62 ++
 .../media/platform/qcom/camss/camss-vfe-17x.c |  10 +-
 .../media/platform/qcom/camss/camss-vfe-4-1.c |   4 +-
 .../media/platform/qcom/camss/camss-vfe-4-7.c |   6 +-
 .../media/platform/qcom/camss/camss-vfe-4-8.c |   6 +-
 .../platform/qcom/camss/camss-vfe-gen1.c      |   8 +-
 drivers/media/platform/qcom/camss/camss-vfe.c | 483 ++++++++-----
 drivers/media/platform/qcom/camss/camss-vfe.h |  22 +-
 .../media/platform/qcom/camss/camss-video.c   | 294 +-------
 .../media/platform/qcom/camss/camss-video.h   |   4 +-
 drivers/media/platform/qcom/camss/camss.c     | 678 +++++++++++++-----
 drivers/media/platform/qcom/camss/camss.h     |  20 +-
 21 files changed, 1696 insertions(+), 1336 deletions(-)
 create mode 100644 drivers/media/platform/qcom/camss/camss-format.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-format.h

-- 
2.17.1


