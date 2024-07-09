Return-Path: <linux-media+bounces-14779-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C6392BF39
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 18:11:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A58521C22B09
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 16:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2DA81A2540;
	Tue,  9 Jul 2024 16:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hR291SzQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535A019E802;
	Tue,  9 Jul 2024 16:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720541252; cv=none; b=GnaxLg4D/DDvnFifVKKjBVWxZ8NiVWlGCoHErk0C11k1KcUNs1yk5Ze9LXfw0JMaCCE08c9SdFNCJ7/K+CmrUb90H7J7eO2gdR8rUbXPXHxKknUPSZ1qUIpLfBzflPo51/ZRCelWFpWUFVf8aI+gCLWzFDF/HrlWQSbljnSowLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720541252; c=relaxed/simple;
	bh=3wgHZ2WganwYBTQ+En/Dim9I90oCjZ8PSSzNBYwR2OQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=O1VZvIyL1ki/njOmXca4F2Qza3vyDMmIzuO/Uc/cH6VAXL4tcStoC+T4njr+zICDADjzYTg/gx/UencyNl3C4HpIS8Uz8rjP84xMa/w/QMEHOBk2HWO0hucaLtfobFoi3ihsX/Uq7G37POev51IJNaCwdQvWYkuvQGKKDM1glcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hR291SzQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469AcgbS020395;
	Tue, 9 Jul 2024 16:07:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=TPhRObdMPAjgaa6WNe+bBMwLZ3xrhyAoY77kR+qZhb0=; b=hR
	291SzQBes6xFJf6595bIxXse0ukhX/xLkGjQwmg8SYOdwGZAD232YmPJ0svW6Okt
	5sV2nTSBanOSok4bzkSA6LIslRgIcRCesC9xQAKXqEypwGuGUaFTxNnRZXZqTx5K
	mrC0xtfEA1URpRgQOSFPpY1h9W1NRn5ABjjoLK7EHNuV+VyJWSaOF7oy5jj9p+Ee
	YJ1oKhRM+XuGtH/iXCw1xTXrqBrJfCIo33EnoDUOoEAQ6QYOBeH0/i5p5Vo9so5N
	az61arsBmObQkkSnkeZJeig8T4bM+OGdMC7BhWZJHZLk7t3hNz6HLAvGzaNL7kWb
	EASOtYCfzZuLWz+zyJgg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406x0t7638-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 16:07:22 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469G7KVf011827
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 16:07:20 GMT
Received: from hu-depengs-sha.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 9 Jul 2024 09:07:13 -0700
From: Depeng Shao <quic_depengs@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <quic_eberman@quicinc.com>, <quic_depengs@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: [PATCH V3 00/13] media: qcom: camss: Add sm8550 support
Date: Tue, 9 Jul 2024 21:36:43 +0530
Message-ID: <20240709160656.31146-1-quic_depengs@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: eCeOHZGQ2nmcSarzIQddmM-RFZWkMVRd
X-Proofpoint-ORIG-GUID: eCeOHZGQ2nmcSarzIQddmM-RFZWkMVRd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_05,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 bulkscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090106

V3:
- Rebased the change based on below change which will be merged firstly.
  "Move camss version related defs in to resources"
Link: https://lore.kernel.org/all/20240522154659.510-1-quic_grosikop@quicinc.com/
- Rebased the change based on Bryan's csiphy optimization change and add
these changes into this series, so that the new csiphy-3ph driver don't
need to add duplicate code. This has got Bryan's permission to add his
patches into this series.
- Refactor some changes based on the comments to move the random code to
patches where they are used.
- Remove the vfe780 irq function since it isn't doing the actual work.
- Add dt-binding for sm8550 camss driver.
Link to V2: https://lore.kernel.org/all/20240320141136.26827-1-quic_depengs@quicinc.com/

V2:
- Update some commit messages
Link to V1: https://lore.kernel.org/all/20240320134227.16587-1-quic_depengs@quicinc.com/

V1:
SM8550 is a Qualcomm flagship SoC. This series adds support to
bring up the CSIPHY, CSID, VFE/RDI interfaces in SM8550.

SM8550 provides

- 3 x VFE, 3 RDI per VFE
- 2 x VFE Lite, 4 RDI per VFE
- 3 x CSID
- 2 x CSID Lite
- 8 x CSI PHY

This series is rebased based on: "Move camss version related defs in to resources"
Link: https://lore.kernel.org/all/20240522154659.510-1-quic_grosikop@quicinc.com/

Bryan O'Donoghue (6):
  media: qcom: camss: csiphy-3ph: Fix trivial indentation fault in
    defines
  media: qcom: camss: csiphy-3ph: Remove redundant PHY init sequence
    control loop
  media: qcom: camss: csiphy-3ph: Rename struct
  media: qcom: camss: csiphy: Add an init callback to CSI PHY devices
  media: qcom: camss: csiphy-3ph: Move CSIPHY variables to data field
    inside csiphy struct
  media: qcom: camss: csiphy-3ph: Use an offset variable to find common
    control regs

Depeng Shao (7):
  dt-bindings: media: camss: Add qcom,sm8550-camss binding
  media: qcom: camss: csiphy-3ph: Add Gen2 v1.2 two-phase MIPI CSI-2
    DPHY init
  media: qcom: camss: Add CSID Gen3 support for SM8550
  media: qcom: camss: Add support for VFE hardware version Titan 780
  media: qcom: camss: Add notify interface in camss driver
  media: qcom: camss: Add sm8550 support
  media: qcom: camss: Add sm8550 resources

 .../bindings/media/qcom,sm8550-camss.yaml     | 545 ++++++++++++
 drivers/media/platform/qcom/camss/Makefile    |   2 +
 .../platform/qcom/camss/camss-csid-gen3.c     | 483 +++++++++++
 .../platform/qcom/camss/camss-csid-gen3.h     |  26 +
 .../media/platform/qcom/camss/camss-csid.c    |  21 +
 .../media/platform/qcom/camss/camss-csid.h    |  11 +
 .../qcom/camss/camss-csiphy-2ph-1-0.c         |   6 +
 .../qcom/camss/camss-csiphy-3ph-1-0.c         | 796 ++++++++++--------
 .../media/platform/qcom/camss/camss-csiphy.c  |   4 +
 .../media/platform/qcom/camss/camss-csiphy.h  |   2 +
 .../media/platform/qcom/camss/camss-vfe-780.c | 429 ++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c |   6 +
 drivers/media/platform/qcom/camss/camss-vfe.h |   2 +
 drivers/media/platform/qcom/camss/camss.c     | 462 ++++++++++
 drivers/media/platform/qcom/camss/camss.h     |  10 +
 15 files changed, 2467 insertions(+), 338 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml
 create mode 100644 drivers/media/platform/qcom/camss/camss-csid-gen3.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-csid-gen3.h
 create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-780.c


base-commit: 0c52056d9f77508cb6d4d68d3fc91c6c08ec71af
prerequisite-patch-id: 74fabfbf51d650af74a1dc9f7e09fe03a1d85d93
prerequisite-patch-id: 3833c5eed2690679e5eca3551053e08350d2b070
prerequisite-patch-id: 0e433e0c5a9d2402da97c1a01194b1a9f6f7e6cb
prerequisite-patch-id: f876f5ed5605fcfebea7f1584888f494bfecd102
prerequisite-patch-id: 8bcb15b208a319a6e88ff4f9e5023097af92cc90
prerequisite-patch-id: dc4b5ddbbedd8773159694b3becad5c7dcbfcf77
prerequisite-patch-id: 75c1b00f4476ee6006041046ad5194b086db3358
prerequisite-patch-id: 0efc004cb8a844291ebe1f16ce192567f44218c7
-- 
2.34.1


