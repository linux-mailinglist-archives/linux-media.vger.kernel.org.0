Return-Path: <linux-media+bounces-17556-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A520296B9BE
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 13:12:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C94411C21FE4
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 11:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3BCD1D0148;
	Wed,  4 Sep 2024 11:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MJ1QmzGA"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968B2126C01;
	Wed,  4 Sep 2024 11:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725448321; cv=none; b=u3Sv7egb5OFbmtJ4ZIEn3EgCFGdK5oEspgbhECoxDWCmR/f9Yt7oIEfeFLTfGYxESOulKKaxqyUd6X0wE83nJ4L4mutXAxaOSSmNDdJweNpnvbGrBZCtqthVnYKLk5A1qwUwkrXayodhQV16zr8AHcBQDFvuMi3Vltyf6zz9fAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725448321; c=relaxed/simple;
	bh=hnPwq2YqRZBd3qfNZIXYzKhDgao4qCnvMfu4VjF6mK0=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=VId+UxUJHSGKud5G8i8axZIRjk1+Hl/J4SzPkUZfX+Dt9QVraR4wFQMLYT8NBdQO2tsnnHn0K20lTbem9rdTd4/jZBeicuYzd+KIoQKqAM6Txv2Xb4L6QBmuWcFoTrM8FEzxR1PqTFc+cJATfoGAVezNm1AhsubEQ+1mLrwEA6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MJ1QmzGA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4849xqON019989;
	Wed, 4 Sep 2024 11:11:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vkA2IuN2hnm5B0USq8B9De
	twSiR577ILEVRp55m0RgM=; b=MJ1QmzGAXz6m5nwDBjFnVH2S6SOG/mHr/AkIcj
	Qhaaci294iyXcGDv9xEOh5d9pPqaAgL5HaRJRFau1SDylTgeJ1gn11JykfTj3CtR
	7m0KuWyP3+jsN7Oq3qtZ9M/NDsqJzXwvTmfxD06tcuiSVfta0m7/yhUOdvHrZQnS
	n8SSWo/JFh+DS8+YLfzCh72oq8JUqMK9XYC3E+h6L5MfMzi540OzSdNT5SStg3Z1
	ig+/5anqc5o9QZAYyoU8JQMBXzLR7I57fiwVPaedZNpWWyBSB7/rhQxTCt95x/dG
	3Tj2wL3FYYk2aP+bB7GrUWBAIH7E3nP9Bw7leAax0JmdCNHQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41bud2tjdn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Sep 2024 11:11:37 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 484BBaLR029891
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Sep 2024 11:11:36 GMT
Received: from [169.254.0.1] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Sep 2024
 04:11:29 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
Subject: [PATCH 00/10] (no cover subject)
Date: Wed, 4 Sep 2024 16:40:06 +0530
Message-ID: <20240904-camss_on_sc7280_rb3gen2_vision_v2_patches-v1-0-b18ddcd7d9df@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA5A2GYC/yWNQQqDMBAAvyJ7biBZldZ+pZQlbje6h0bJihTEv
 ze0xznMzAEmRcXg3hxQZFfTJVcIlwZ4jnkSp6/KgB47P/jOcXyb0ZLJ+Io3T2VsJ8lIf5V2pDV
 uPIu50HMY+jS2KSDU3lok6ef3ejzP8wvdUdYoewAAAA==
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kapatrala Syed
	<akapatra@quicinc.com>,
        Hariram Purushothaman <hariramp@quicinc.com>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Vikram Sharma
	<quic_vikramsa@quicinc.com>,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>,
        <stable@vger.kernel.org>,
        Hariram Purushothaman <quic_hariramp@quicinc.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725448289; l=4165;
 i=quic_vikramsa@quicinc.com; s=20240628; h=from:subject:message-id;
 bh=hnPwq2YqRZBd3qfNZIXYzKhDgao4qCnvMfu4VjF6mK0=;
 b=U4Qmji6CzswLXWAEcJTzEScLYjdgEBzW7G5ihYZrL0x/Ca4Pnv0uQhnBO6Lcg+4vDss7uDRhx
 WBpHhQZEYrSAJ6dzDHcSJlWvuYwZSsYk1occwvgaKi0uzJ6Jr09Kr1M
X-Developer-Key: i=quic_vikramsa@quicinc.com; a=ed25519;
 pk=vQBkwZr1Hv+VXogAyTAu7AEx8/6bvkOmgrzYFbNGCDI=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: NFZmacsd59pUpI3-QUgarAth5j2dxKHh
X-Proofpoint-ORIG-GUID: NFZmacsd59pUpI3-QUgarAth5j2dxKHh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-04_09,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 clxscore=1011 spamscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409040084

SC7280 is a Qualcomm SoC. This series adds support to
bring up the CSIPHY, CSID, VFE/RDI interfaces in SC7280.

SC7280 provides

- 3 x VFE, 3 RDI per VFE
- 2 x VFE Lite, 4 RDI per VFE
- 3 x CSID
- 2 x CSID Lite
- 5 x CSI PHY

The changes are verified on SC7280 qcs6490-rb3gen2-vision board,
the base dts for qcs6490-rb3gen2 is:
https://lore.kernel.org/all/20231103184655.23555-1-quic_kbajaj@quicinc.com/

V1 for this series: https://lore.kernel.org/linux-arm-msm/20240629-camss_first_post_linux_next-v1-0-bc798edabc3a@quicinc.com/

Changes in V2:
1)  Improved indentation/formatting.
2)  Removed _src clocks and misleading code comments.
3)  Added name fields for power domains and csid register offset in DTSI.
4)  Dropped minItems field from YAML file.
5)  Listed changes in alphabetical order.
6)  Updated description and commit text to reflect changes
7)  Changed the compatible string from imx412 to imx577.
8)  Added board-specific enablement changes in the newly created vision
     board DTSI file.
9)  Fixed bug encountered during testing.
10) Moved logically independent changes to a new/seprate patch.
11) Removed cci0 as no sensor is on this port and MCLK2, which was a
    copy-paste error from the RB5 board reference.
12) Added power rails, referencing the RB5 board.
13) Discarded Patch 5/6 completely (not required).
14) Removed unused enums.

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

Test-by: Vikram Sharma <quic_vikramsa@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
Suresh Vankadara (1):
      media: qcom: camss: Add support for camss driver on SC7280

Vikram Sharma (9):
      media: dt-bindings: media: camss: Add qcom,sc7280-camss binding
      media: dt-bindings: media: qcs6490-rb3gen2-vision-mezzanine: Add dt bindings
      media: qcom: camss: Fix potential crash if domain attach fails
      media: qcom: camss: Sort CAMSS version enums and compatible strings
      media: qcom: camss: Add camss_link_entities_v2
      arm64: dts: qcom: sc7280: Add support for camss
      arm64: dts: qcom: qcs6490-rb3gen2-vision-mezzanine: Enable IMX577 sensor
      arm64: dts: qcom: sc7280: Add default and suspend states for GPIO
      arm64: defconfig: Enable camcc driver for SC7280

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 .../bindings/media/qcom,sc7280-camss.yaml          | 441 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dts  |  61 +++
 arch/arm64/boot/dts/qcom/sc7280.dtsi               | 208 ++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 drivers/media/platform/qcom/camss/camss-csid.c     |   1 -
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |  13 +-
 drivers/media/platform/qcom/camss/camss-csiphy.c   |   5 +
 drivers/media/platform/qcom/camss/camss-csiphy.h   |   1 +
 drivers/media/platform/qcom/camss/camss-vfe.c      |   8 +-
 drivers/media/platform/qcom/camss/camss.c          | 400 ++++++++++++++++++-
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 13 files changed, 1131 insertions(+), 11 deletions(-)
---
base-commit: fdadd93817f124fd0ea6ef251d4a1068b7feceba
change-id: 20240904-camss_on_sc7280_rb3gen2_vision_v2_patches-15c195fb3f12

Best regards,
-- 
Vikram Sharma <quic_vikramsa@quicinc.com>


