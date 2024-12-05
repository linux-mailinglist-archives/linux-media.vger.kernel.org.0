Return-Path: <linux-media+bounces-22724-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 030F79E5A57
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 16:57:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B832166914
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 15:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D5D0222574;
	Thu,  5 Dec 2024 15:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mguHypWe"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2224F22144F;
	Thu,  5 Dec 2024 15:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733414184; cv=none; b=JdOdSjeYYL38rgeGS6DeqWw02wYhDu9KIOLQdjMVllkc8ewHx0VqRg+MYczxDHHP9nYxTC0ow4my1B+20ZsQqhYkabkU2ZCVC7zJi1y+rgzvNfyZatnD3bELzxMeItyVUrhusYXNJQFPMLI6i/+Di4PFCOXq2qoYx/QRRIKLlF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733414184; c=relaxed/simple;
	bh=RLgT4e5wAamC8d84JtqcpmId9+59ELKjt3IwV8D6emk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JjwCeoqQjmAf/OTJnwbHJjuMGxkAG8uUDzMpicQJqTrWl8b7bHblg2hEULQicWKQFeCfFZpUgBWUdkrHUL/incmiUg64JP++bRS0ULGirYHvpapKq4/7i0hKMtvhFIBCesW1u+x2f7cAyTgjQ4g/QJCfMwCWT6LnwLW3wp/Tllc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mguHypWe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5Bop1e029401;
	Thu, 5 Dec 2024 15:56:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YWd3JpuLdWpTqW+ue1A4Jy
	sZtn0I6UxI/TBxCC/vvVU=; b=mguHypWeS46290UbM2z5SnIeXWmHNZJl6VTrzo
	Qp6UVooZGo4PucRfqPvWDseUGurxuq0bWneDJb1hj7QmuBuHDfc78auLjTsvA2L5
	8A7QEG7rXnCLBdXsLXrrdGMWM9b+viE21wz02JXvVzyXTodADBfendhYDMf+XS0i
	WkolIx1HjV4p4bPqoVaisAnBXgFfKzi6l/cqvM109SiOuqoUJFlSPbRvu8ZUtLbd
	3UmZ2KWHhhYO1vNZWMtDoFvPWCmDKk8KhEkeY6kNz/myBlveopiior9r0xoH8wij
	7kITr9Y/Um16qi0zjFiw8jg0Jkc+xO2l6xc36aKkamTy8qYg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43bbnj0p0a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 15:56:18 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B5Fu3vj011660
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Dec 2024 15:56:03 GMT
Received: from hu-depengs-sha.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Dec 2024 07:55:56 -0800
From: Depeng Shao <quic_depengs@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vladimir.zapolskiy@linaro.org>
CC: <quic_eberman@quicinc.com>, <quic_depengs@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: [PATCH v5 00/16] media: qcom: camss: Add sm8550 support
Date: Thu, 5 Dec 2024 21:25:22 +0530
Message-ID: <20241205155538.250743-1-quic_depengs@quicinc.com>
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
X-Proofpoint-GUID: _jvKBXv1SJs1KNBJMJa9BuLd7-dFBf7G
X-Proofpoint-ORIG-GUID: _jvKBXv1SJs1KNBJMJa9BuLd7-dFBf7G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 mlxscore=0 phishscore=0 impostorscore=0
 malwarescore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412050116

v5:
- Update dt-bindings required items order - Krzysztof
- Sort the reg order based on the comments in sc7280 dt-binding - Vladimir
- Change the irq type to IRQ_TYPE_EDGE_RISING - Vladimir
- Remove the Krzysztof's RB tag from dt-binding patch due to above
  updates in dt-binding patch
- Move regulator from csid resource to csiphy resource - Bryan, Vladimir
- Move the change to add default case in vfe_src_pad_code to a
  standalone patch. - Bryan
- Rename csid-gen3 as csid-780 - Bryan
- use macros() to bury bit shifts - Bryan
- Sort the macros by register offset order  -  Vladimir
- Redefine a macro for rup_aup in csid driver - Vladimir
- Remove the unused macros in vfe 780 driver - Vladimir
- Add dummy function for unsupported hw_ops in vfe 780
  driver - Vladimir, Bryan
- Use a standalone patch for the callback API of RUP and buf done update
- Use a standalone patch to make CSID TPG optional - Vladimir
- Link to v4: https://lore.kernel.org/all/20240812144131.369378-1-quic_depengs@quicinc.com/

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

Bryan O'Donoghue (7):
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
  media: qcom: camss: csid: Make TPG optional

Depeng Shao (9):
  media: qcom: camss: csid: Move common code into csid core
  media: qcom: camss: vfe: Move common code into vfe core
  media: qcom: camss: Add callback API for RUP update and buf done
  dt-bindings: media: camss: Add qcom,sm8550-camss binding
  media: qcom: camss: Add default case in vfe_src_pad_code
  media: qcom: camss: Add sm8550 compatible
  media: qcom: camss: csiphy-3ph: Add Gen2 v2.1.2 two-phase MIPI CSI-2
    DPHY support
  media: qcom: camss: Add CSID 780 support for sm8550
  media: qcom: camss: Add support for VFE hardware version Titan 780

 .../bindings/media/qcom,sm8550-camss.yaml     | 564 +++++++++++++
 drivers/media/platform/qcom/camss/Makefile    |   2 +
 .../platform/qcom/camss/camss-csid-4-1.c      |  19 -
 .../platform/qcom/camss/camss-csid-4-7.c      |  42 -
 .../platform/qcom/camss/camss-csid-780.c      | 333 ++++++++
 .../platform/qcom/camss/camss-csid-780.h      |  25 +
 .../platform/qcom/camss/camss-csid-gen2.c     |  60 --
 .../media/platform/qcom/camss/camss-csid.c    | 110 ++-
 .../media/platform/qcom/camss/camss-csid.h    |  31 +
 .../qcom/camss/camss-csiphy-2ph-1-0.c         |   6 +
 .../qcom/camss/camss-csiphy-3ph-1-0.c         | 789 ++++++++++--------
 .../media/platform/qcom/camss/camss-csiphy.c  |   4 +
 .../media/platform/qcom/camss/camss-csiphy.h  |   8 +
 .../media/platform/qcom/camss/camss-vfe-17x.c | 112 +--
 .../media/platform/qcom/camss/camss-vfe-4-1.c |   9 -
 .../media/platform/qcom/camss/camss-vfe-4-7.c |  11 -
 .../media/platform/qcom/camss/camss-vfe-4-8.c |  11 -
 .../media/platform/qcom/camss/camss-vfe-480.c | 301 +------
 .../media/platform/qcom/camss/camss-vfe-780.c | 159 ++++
 drivers/media/platform/qcom/camss/camss-vfe.c | 282 ++++++-
 drivers/media/platform/qcom/camss/camss-vfe.h |  58 +-
 drivers/media/platform/qcom/camss/camss.c     | 369 ++++++++
 drivers/media/platform/qcom/camss/camss.h     |   4 +
 23 files changed, 2437 insertions(+), 872 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml
 create mode 100644 drivers/media/platform/qcom/camss/camss-csid-780.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-csid-780.h
 create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-780.c


base-commit: bcf2acd8f64b0a5783deeeb5fd70c6163ec5acd7
-- 
2.34.1


