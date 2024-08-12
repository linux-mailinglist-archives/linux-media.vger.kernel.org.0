Return-Path: <linux-media+bounces-16141-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 367D494EFDA
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 16:42:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBDC328485B
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 14:42:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37307183CAD;
	Mon, 12 Aug 2024 14:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YyMXLI8c"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA316153BF6;
	Mon, 12 Aug 2024 14:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723473719; cv=none; b=hlEwU7NTIlUmpkYpkDZ1DmividLDb0DjtpE5BHXOWWqrW0Do+qwlOI1AuMEZUleEociSvgu68ns4MAg6UcK0QtQsXZSmzRm75/CHOXcC1tA9VSjxFdHKlQ/0M1xEj8dd9tqutrDNxW9rpTzZ0iyxsIEgosyguG8Ggvmc0/hfbew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723473719; c=relaxed/simple;
	bh=Rxk0JemXBcDYNJv7+6e+dLXJY3M+IfoeWCRugwCIijg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=F18YhcCBGN+ar/lAMjjHbtO5+lcnF4drO7Gb/Xy/4pvcgr/QeVnPEw1yjQhmzgFCVdzcGP5b8N5CSiXWc0m014fhG2kHkXJALdCwiFnlba4DN8mw8jqF4FQSoysPGdULG3navczB/QelEK4/9Tjhd+GaM7RcGzu1ZpOeUNo7fKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YyMXLI8c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47CDSfOK017593;
	Mon, 12 Aug 2024 14:41:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PznSfg8G5Zl3dKjBGewZSK
	RCZczsR7cBsxyEfY+nzhw=; b=YyMXLI8c9dKvKeCVgB/uASK28H/x6II3/1Gv4R
	pthKtV1FkO3+QBXCLwnz+iiXv2aOjqtply31b9wLabbYL8Pq3s76rWTDD2D2gAnm
	sGY6ZGYyI1IhjXHmXPLaGyDWftJ1ED+OV53KGN1w7v4zP/FLea9cfdwSKKbj7vnm
	iwYZ40cCmJpJJtdNqBeVGTN6pcvxtDMWh53Ccy/Mu44M0VvUiz/2YhBh2IWSjn0T
	KmUfqHRX9VWsuaZr49Ni9okSyYskhZGIN2vmxwdMtZxNzrXvDVpemAA1/B+Edj9M
	wY4h3xokOjrEvVNYnX4wVAPow5P3lyILT0R1ZzrEEWigiOnQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40x1d4cf3d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 14:41:52 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47CEfpd7002563
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 14:41:51 GMT
Received: from hu-depengs-sha.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 12 Aug 2024 07:41:46 -0700
From: Depeng Shao <quic_depengs@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, <quic_depengs@quicinc.com>
Subject: [PATCH v4 00/13] media: qcom: camss: Add sm8550 support
Date: Mon, 12 Aug 2024 20:11:18 +0530
Message-ID: <20240812144131.369378-1-quic_depengs@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: xDLE2TrfLFBygQ4T4SYGflcYWYAYxoyS
X-Proofpoint-GUID: xDLE2TrfLFBygQ4T4SYGflcYWYAYxoyS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-12_04,2024-08-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408120109

v4:
- Update dt-bindings based on comments - Krzysztof, bod, Vladimir
- Move common code into csid core and vfe core driver - bod
- Remove *_relaxed in the csid and vfe drivers - Krzysztof
- Reorganize patches in logical junks, make sure that new added
structures have users in current patch - Krzysztof
- Remove notify function  and add new functions in camss for buf done
and reg update - bod
- Remove custom code to get csid base - bod
- Remove ISR function in vfe780 driver since it is never fired - bod
- Move csid_top_base to camss structure since we only have one csid
top block, and just need to get base once for csid top
- Add Vladimir's RB
- Remove prerequisite-patch-id in the cover letter since the changes
have been merged
- Add dtsi patch link for reference - Krzysztof
https://lore.kernel.org/all/20240807123333.2056518-1-quic_depengs@quicinc.com/
- Link to v3: https://lore.kernel.org/all/20240709160656.31146-1-quic_depengs@quicinc.com/

v3:
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

v2:
- Update some commit messages
Link to V1: https://lore.kernel.org/all/20240320134227.16587-1-quic_depengs@quicinc.com/

v1:
SM8550 is a Qualcomm flagship SoC. This series adds support to
bring up the CSIPHY, CSID, VFE/RDI interfaces in SM8550.

SM8550 provides

- 3 x VFE, 3 RDI per VFE
- 2 x VFE Lite, 4 RDI per VFE
- 3 x CSID
- 2 x CSID Lite
- 8 x CSI PHY

---
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
  media: qcom: camss: csid: Move common code into csid core
  media: qcom: camss: vfe: Move common code into vfe core
  media: qcom: camss: Add sm8550 compatible
  media: qcom: camss: csiphy-3ph: Add Gen2 v2.1.2 two-phase MIPI CSI-2
    DPHY support
  media: qcom: camss: Add CSID Gen3 support for sm8550
  media: qcom: camss: Add support for VFE hardware version Titan 780

 .../bindings/media/qcom,sm8550-camss.yaml     | 517 ++++++++++++
 drivers/media/platform/qcom/camss/Makefile    |   2 +
 .../platform/qcom/camss/camss-csid-4-1.c      |  19 -
 .../platform/qcom/camss/camss-csid-4-7.c      |  42 -
 .../platform/qcom/camss/camss-csid-gen2.c     |  60 --
 .../platform/qcom/camss/camss-csid-gen3.c     | 339 ++++++++
 .../platform/qcom/camss/camss-csid-gen3.h     |  26 +
 .../media/platform/qcom/camss/camss-csid.c    | 123 ++-
 .../media/platform/qcom/camss/camss-csid.h    |  31 +
 .../qcom/camss/camss-csiphy-2ph-1-0.c         |   6 +
 .../qcom/camss/camss-csiphy-3ph-1-0.c         | 796 ++++++++++--------
 .../media/platform/qcom/camss/camss-csiphy.c  |   4 +
 .../media/platform/qcom/camss/camss-csiphy.h  |   2 +
 .../media/platform/qcom/camss/camss-vfe-17x.c | 112 +--
 .../media/platform/qcom/camss/camss-vfe-4-1.c |   9 -
 .../media/platform/qcom/camss/camss-vfe-4-7.c |  11 -
 .../media/platform/qcom/camss/camss-vfe-4-8.c |  11 -
 .../media/platform/qcom/camss/camss-vfe-480.c | 258 +-----
 .../media/platform/qcom/camss/camss-vfe-780.c | 148 ++++
 drivers/media/platform/qcom/camss/camss-vfe.c | 301 ++++++-
 drivers/media/platform/qcom/camss/camss-vfe.h |  59 +-
 drivers/media/platform/qcom/camss/camss.c     | 365 ++++++++
 drivers/media/platform/qcom/camss/camss.h     |   5 +
 23 files changed, 2379 insertions(+), 867 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml
 create mode 100644 drivers/media/platform/qcom/camss/camss-csid-gen3.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-csid-gen3.h
 create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-780.c


base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
-- 
2.34.1


