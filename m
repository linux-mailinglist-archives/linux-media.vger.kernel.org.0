Return-Path: <linux-media+bounces-19422-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A6399A5D5
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 16:10:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25365283031
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 14:10:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD73C2194BC;
	Fri, 11 Oct 2024 14:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JF1Wvf3d"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925E1D517;
	Fri, 11 Oct 2024 14:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728655813; cv=none; b=HhgKe2X6iHQ9LBiOTSvCuhb9qYJBmEyHrn4wAuHdrAqX06h/DCxuv3TwqnDpNfoVBLd99zK5beSoisCGu6HA5Ozd6zwtaI+ooYLl0OQ9NxAMUQJ5Hcr820VK6cqjKvMUjQi3277Ew/gNp5ZBKMLjMR539o/w3IwJDSPyJYrciqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728655813; c=relaxed/simple;
	bh=VV1h7HHHvWu3db0HbftD9hEhDOzV3Mbiqya+RjbBx44=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tjEjkQbRI8Epj4SSnQnGbwltfHs7Uy9yjaa3u2Vac/V8ip0cxHRLY+ve+mxsNReQuA63NFgGRA7fkBqyIFxvWMSVcNtgppIgAVs2neCnepn8jtWgZDp6pZLYsPk7H4wWY/07mbrlCcgCeVVgF7eHkDBi33CWLGQykjjLTptL+9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JF1Wvf3d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49B6stph022951;
	Fri, 11 Oct 2024 14:09:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=c3keaOZtgzjRprvw65OEY3
	t/Ef0rB/oRk1nO5MEavf0=; b=JF1Wvf3dW6jbIrc+IObXPevn3w/WJ1FpR1sPAY
	WSoiel0hLkkDH1AflHgT04wKo1QYIwb1QWQvX59zwLbTcauQ5YPqnGsYQFkxtSi2
	M6GU/rxKjd7AT1jGwlSiovZcfw7XmxtR4xkyDHyNwnx+6r2OhSHdBFoU7Z8WL+9U
	EYJczXz3vN17dAZ7/7Wb4vS83awyqHpPo8FyJuBCTvFhFYTdv08YSRw+AEQLDJRP
	darGwnWnwZ6phdoFEtbLsOxqg7pETluNLgGGXjDFyWchb2bWh8NZ27mU5NH1OlKF
	apeeCY/0TrZ8pb7+gdyyIsMTijF59fMEfdYW2xTIzw1l+zBg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 426y5q9b54-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 14:09:57 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49BE9unH006518
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 14:09:56 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 11 Oct 2024 07:09:47 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <akapatra@quicinc.com>, <hariramp@quicinc.com>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <hverkuil-cisco@xs4all.nl>, <cros-qcom-dts-watchers@chromium.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_vikramsa@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: [PATCH v3 0/8] media: qcom: camss: Add sc7280 support
Date: Fri, 11 Oct 2024 19:39:24 +0530
Message-ID: <20241011140932.1744124-1-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
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
X-Proofpoint-GUID: xsNn4oXOTp_wSjWln35hQpdV2bxMRC4j
X-Proofpoint-ORIG-GUID: xsNn4oXOTp_wSjWln35hQpdV2bxMRC4j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501 clxscore=1011
 impostorscore=0 adultscore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410110097

SC7280 is a Qualcomm SoC. This series adds support to bring up the CSIPHY, CSID, VFE/RDI interfaces in SC7280.

SC7280 provides

- 3 x VFE, 3 RDI per VFE
- 2 x VFE Lite, 4 RDI per VFE
- 3 x CSID
- 2 x CSID Lite
- 5 x CSI PHY

The changes are verified on SC7280 qcs6490-rb3gen2-vision board, the base dts for qcs6490-rb3gen2 is:
https://lore.kernel.org/all/20231103184655.23555-1-quic_kbajaj@quicinc.com/

Changes in V3:
- Added missed subject line for cover letter of V2.
- Updated Alignment, indentation and properties order.
- edit commit text for [PATCH 02/10] and [PATCH 03/10].
- Refactor camss_link_entities.
- Removed camcc enablement changes as it already done.
- Link to v2: https://lore.kernel.org/linux-arm-msm/20240904-camss_on_sc7280_rb3gen2_vision_v2_patches-v1-0-b18ddcd7d9df@quicinc.com/

Changes in V2:
- Improved indentation/formatting.
- Removed _src clocks and misleading code comments.
- Added name fields for power domains and csid register offset in DTSI.
- Dropped minItems field from YAML file.
- Listed changes in alphabetical order.
- Updated description and commit text to reflect changes
- Changed the compatible string from imx412 to imx577.
- Added board-specific enablement changes in the newly created vision
  board DTSI file.
- Fixed bug encountered during testing.
- Moved logically independent changes to a new/seprate patch.
- Removed cci0 as no sensor is on this port and MCLK2, which was a
  copy-paste error from the RB5 board reference.
- Added power rails, referencing the RB5 board.
- Discarded Patch 5/6 completely (not required).
- Removed unused enums.
- Link to v1: https://lore.kernel.org/linux-arm-msm/20240629-camss_first_post_linux_next-v1-0-bc798edabc3a@quicinc.com/

  To: Robert Foss <rfoss@kernel.org>
  To: Todor Tomov <todor.too@gmail.com>
  To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
  To: Mauro Carvalho Chehab <mchehab@kernel.org>
  To: Rob Herring <robh@kernel.org>
  To: Krzysztof Kozlowski <krzk+dt@kernel.org>
  To: Conor Dooley <conor+dt@kernel.org>
  To: Kapatrala Syed <akapatra@quicinc.com>
  To: Hariram Purushothaman <hariramp@quicinc.com>
  To: Bjorn Andersson <andersson@kernel.org>
  To: Konrad Dybcio <konradybcio@kernel.org>
  To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
  To: cros-qcom-dts-watchers@chromium.org
  To: Catalin Marinas <catalin.marinas@arm.com>
  To: Will Deacon <will@kernel.org>
  Cc: linux-arm-msm@vger.kernel.org
  Cc: linux-media@vger.kernel.org
  Cc: devicetree@vger.kernel.org
  Cc: linux-kernel@vger.kernel.org
  Cc: linux-arm-kernel@lists.infradead.org
---
Test-by: Vikram Sharma <quic_vikramsa@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>

Suresh Vankadara (1):
  media: qcom: camss: Add support for camss driver on SC7280

Vikram Sharma (7):
  media: dt-bindings: media: camss: Add qcom,sc7280-camss binding
  media: dt-bindings: Add qcs6490-rb3gen2-vision-mezzanine
  media: qcom: camss: Fix potential crash if domain attach fails
  media: qcom: camss: Sort CAMSS version enums and compatible strings
  media: qcom: camss: Restructure camss_link_entities
  arm64: dts: qcom: sc7280: Add support for camss
  arm64: dts: qcom: qcs6490-rb3gen2-vision-mezzanine: Add vision
    mezzanine

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 .../bindings/media/qcom,sc7280-camss.yaml     | 440 +++++++++++++++
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../qcom/qcs6490-rb3gen2-vision-mezzanine.dts |  61 +++
 arch/arm64/boot/dts/qcom/sc7280.dtsi          | 208 ++++++++
 .../media/platform/qcom/camss/camss-csid.c    |   1 -
 .../qcom/camss/camss-csiphy-3ph-1-0.c         |  13 +-
 .../media/platform/qcom/camss/camss-csiphy.c  |   5 +
 .../media/platform/qcom/camss/camss-csiphy.h  |   1 +
 drivers/media/platform/qcom/camss/camss-vfe.c |   8 +-
 drivers/media/platform/qcom/camss/camss.c     | 505 ++++++++++++++++--
 drivers/media/platform/qcom/camss/camss.h     |   1 +
 12 files changed, 1179 insertions(+), 66 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
 create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dts
---
Best regards,
Vikram Sharma <quic_vikramsa@quicinc.com>

-- 
2.25.1


