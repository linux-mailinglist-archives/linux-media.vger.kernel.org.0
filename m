Return-Path: <linux-media+bounces-22585-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9CC9E3703
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 11:01:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40303287FB3
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 10:01:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 928921AF0B7;
	Wed,  4 Dec 2024 10:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="l3Zh0Lt2"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3F71946B1;
	Wed,  4 Dec 2024 10:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733306443; cv=none; b=jifsvbpSIZ6NoSgXpxX4rs9iAkZuswkkPTe+ffHeSIxcuDlvlbftjNjK3jwkJXJwC3y+V8ioapWiUeEawbhMP4ZgzvUkDzLC8Zkl2YZcb1gIxq5FPFSzo5ex6zyHH8LPha5HUqmdMyInbDnlznzM6mP6O4ajjeTlLf5AqgrA4As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733306443; c=relaxed/simple;
	bh=Yv5GKLduOrWu+WhJRLVImR8n2c+XRhxD/ae2ISiLxyk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KqkEt/JFGliej5aphreMXgh0VRUV7utLHZhHCkeentcyuBODmQTOLngn3mjetSKa1VDGWOqYlYNjJXLF3RWBfGD0qn9jee6r3y8+ee40mmISC4ncNcUZZPkwKcqkYlEHWWkZfZb0FrWQLcrtIlInWvZyM0IHse78JJ0NnH+DHOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=l3Zh0Lt2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B47NYEP024930;
	Wed, 4 Dec 2024 10:00:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lBBqGBJLHohEpzT+U1FwwU
	G2gW3aBlgOeo4o4LomNRU=; b=l3Zh0Lt20gYVPzw7Jm3bfnHMtHnwVp6objrLZJ
	Kcx28r6h2NKTwYh+IMWDAKEZUDYJ0WlpDFVLbghZGa+96CSHqKMc3RWlX4bh22uU
	+It/hBwLshDsihU9RmX/pnRzkydStFZp4b+LsYzGxMS240jFr4gqvsSvzv+7LdLu
	PQcjJH4L2IPfVNIW6PiDskjM0ibq4L6A4/5kK3Y3SBxfHmTN5pv0q/+sxDzo2pnP
	2qwpYX03mE5lmp2KyCLxVS/BxcAC6p7lA30je7zk7lyehM3pPm+SdgkKqmmMv1iL
	/s3GTufWi+EW3GKKSqFS/AYd+FOWibbgK9d2lp09hKhqpRog==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439vnyuu5v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 10:00:29 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B4A0Skv032380
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Dec 2024 10:00:28 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 4 Dec 2024 02:00:18 -0800
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
Subject: [PATCH v7 0/5] media: qcom: camss: Add sc7280 support
Date: Wed, 4 Dec 2024 15:29:58 +0530
Message-ID: <20241204100003.300123-1-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: jd4WG3UjoQWK1npN1UdffERvs9_jNovl
X-Proofpoint-GUID: jd4WG3UjoQWK1npN1UdffERvs9_jNovl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 mlxlogscore=999 bulkscore=0 impostorscore=0 mlxscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412040077

SC7280 is a Qualcomm SoC. This series adds support to bring up the CSIPHY,
CSID, VFE/RDI interfaces in SC7280.

SC7280 provides

- 3 x VFE, 3 RDI per VFE
- 2 x VFE Lite, 4 RDI per VFE
- 3 x CSID
- 2 x CSID Lite
- 5 x CSI PHY

The changes are verified on SC7280 qcs6490-rb3gen2 board, with attached vision mezzanine
TPG (mode 1-9) and IMX577 sensor.
The base dts for qcs6490-rb3gen2 is:
https://lore.kernel.org/all/20231103184655.23555-1-quic_kbajaj@quicinc.com/

This change is dependent on below series. As it is raised on top of
this. Please take both to validate.
https://lore.kernel.org/lkml/20241126100126.2743795-1-quic_vikramsa@quicinc.com/

Used following tools for the sanity check of these changes.

- make CHECK_DTBS=y W=1 DT_SCHEMA_FILES=media/qcom,sc7280-camss.yaml
qcom/qcs6490-rb3gen2-vision-mezzanine.dtb
- make DT_CHECKER_FLAGS=-m W=1
DT_SCHEMA_FILES=media/qcom,sc7280-camss.yaml dt_binding_check
- Smatch: make CHECK="smatch --full-path"
M=drivers/media/platform/qcom/camss/
- Sparse: make C=2 M=drivers/media/platform/qcom/camss/
- coccicheck : make coccicheck M=drivers/media/platform/qcom/camss/
- make -j32 W=1
- ./scripts/checkpatch.pl
 
Changes in V7:
- Changed unit address for camss in documention and dts.
- Added avdd-supply and dvdd-supply for sensor.
- Changed reg/clocks/interrupts name for vfe_lite and csid_lite.
- Link to v6: https://lore.kernel.org/linux-arm-msm/20241127100421.3447601-1-quic_vikramsa@quicinc.com/

Changes in V6:
- Changed order of properties in Documentation [PATCH 1/5].
- Updated description for ports in Documentaion [PATCH 1/5].
- Moved regulators from csid to csiphy [PATCH 3/5].
- Link to v5: https://lore.kernel.org/linux-arm-msm/20241112173032.2740119-1-quic_vikramsa@quicinc.com/ 

Changes in V5:
- Updated Commit text for [PATCH v5 1/6].
- Moved reg after compatible string.
- Renamed csi'x' clocks to vfe'x'_csid
- Removed [PATCH v4 4/6] and raised a seprate series for this one.
- Moved gpio states to mezzanine dtso.
- Added more clock levels to address TPG related issues.
- Renamed power-domains-names -> power-domain-names. 
- Link to v4: https://lore.kernel.org/linux-arm-msm/20241030105347.2117034-1-quic_vikramsa@quicinc.com/ 

Changes in V4:
- V3 had 8 patches and V4 is reduced to 6.
- Removed [Patch v3 2/8] as binding change is not required for dtso.
- Removed [Patch v3 3/8] as the fix is already taken care in latest
  kernel tip. 
- Updated alignment for dtsi and dt-bindings.
- Adding qcs6490-rb3gen2-vision-mezzanine as overlay. 
- Link to v3: https://lore.kernel.org/linux-arm-msm/20241011140932.1744124-1-quic_vikramsa@quicinc.com/

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

Suresh Vankadara (1):
  media: qcom: camss: Add support for camss driver on sc7280

Vikram Sharma (4):
  media: dt-bindings: Add qcom,sc7280-camss
  media: qcom: camss: Sort camss version enums and compatible strings
  arm64: dts: qcom: sc7280: Add support for camss
  arm64: dts: qcom: qcs6490-rb3gen2-vision-mezzanine: Add vision
    mezzanine

 .../bindings/media/qcom,sc7280-camss.yaml     | 418 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/Makefile             |   4 +
 .../qcs6490-rb3gen2-vision-mezzanine.dtso     | 110 +++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi          | 172 +++++++
 .../qcom/camss/camss-csiphy-3ph-1-0.c         |  13 +-
 .../media/platform/qcom/camss/camss-csiphy.c  |   5 +
 .../media/platform/qcom/camss/camss-csiphy.h  |   1 +
 drivers/media/platform/qcom/camss/camss-vfe.c |   8 +-
 drivers/media/platform/qcom/camss/camss.c     | 321 +++++++++++++-
 drivers/media/platform/qcom/camss/camss.h     |   5 +-
 10 files changed, 1047 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
 create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso

-- 
2.25.1


