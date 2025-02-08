Return-Path: <linux-media+bounces-25839-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFF2A2D962
	for <lists+linux-media@lfdr.de>; Sat,  8 Feb 2025 23:52:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DD323A2BC0
	for <lists+linux-media@lfdr.de>; Sat,  8 Feb 2025 22:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B89AC241C97;
	Sat,  8 Feb 2025 22:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="V7f/mfIN"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754961F2BA4;
	Sat,  8 Feb 2025 22:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739055139; cv=none; b=OR/znim/ZBR9zuzPX2tO2reQQ3oIr4L1tgs03/WIqXP6G/zCpkwT1xUDafVaCaMK0JYO0ilzqeX8stolxhHbnYIFlxl3DCOju91SABKOSf0yyfqT4iFh4FIiedVZSNBMS6bFiEV5aB89P+kktGQvpz+Kfz8eewaGnso/h+4nkV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739055139; c=relaxed/simple;
	bh=MlgId0leXS+5AjA+yhEPUiE0AYUyEZpLXsgN95T+CCs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ILCmVYsxGYIbKaUIbKIIPO2n0MpOHz3ySM86SnivWsxC6ZGO9r66K5WD6l4lwHm2vvxc0eLnc/cqyJnw0rfYFLZGXY3r+LGDg3vAVQbzH4w/AxhzMDTlcOFFV4uZ+fVawTlY3zVlnon8pwEQJtz+HBTA4g2i3GM4iG/EKN+PJfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=V7f/mfIN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 518ImPdb014553;
	Sat, 8 Feb 2025 22:52:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LcXqDi6InTeTV70mo/mJK9
	cImN6n1+Nfsus4uaK5U2s=; b=V7f/mfINzMbI0Omt7g+SaQt1b3nk0pgZwRol2V
	gOrZ5BFQod/MHBpAHuZPcCkCCIHy0yK8gTqpIyZ3Hc5I3CgdH/jUBmLeNvOukBAV
	iKHyKX2mRGa4y5lUJggcTALYv7YEVPPa8Mn6dXJK5OajWjqTRlry9CCgdkNZbQSZ
	GtAL+rcocg9do09UU7ExXkG1jabqHKVXBcYJe6zjmB9YD/Um0jIn0l4VVm5ttvaP
	DHmVYPWQRNyVwYJ3GMBSK30TulzAlJdojAzlDedmbLhcjnPqURTu3PygNzepB9ku
	XHy4jIu0MisDhTOhiF4zAdf0fiJEnWdCYAu1L2CpMPOcZjnQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0dq992v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Feb 2025 22:52:05 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 518Mq4Dk019828
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 8 Feb 2025 22:52:04 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sat, 8 Feb 2025 14:51:58 -0800
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_vikramsa@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v14 0/2] media: qcom: camss: Add sc7280 support
Date: Sun, 9 Feb 2025 04:21:41 +0530
Message-ID: <20250208225143.2868279-1-quic_vikramsa@quicinc.com>
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
X-Proofpoint-GUID: 4_N7cdBWC7b02otkzqT7CDyrGDwtaJn_
X-Proofpoint-ORIG-GUID: 4_N7cdBWC7b02otkzqT7CDyrGDwtaJn_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-08_10,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 phishscore=0 spamscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502080196

SC7280 is a Qualcomm SoC. This series adds support to bring up the CSIPHY,
CSID, VFE/RDI interfaces in SC7280.

SC7280 provides
- 3 x VFE, 3 RDI per VFE
- 2 x VFE Lite, 4 RDI per VFE
- 3 x CSID
- 2 x CSID Lite
- 5 x CSI PHY

We have tested this on qcs6490-rb3gen2-vision-mezzanine board having IMX577
sensor.

Used following tools for the sanity check of these changes.

- make CHECK_DTBS=y W=1 DT_SCHEMA_FILES=media/qcom,sc7280-camss.yaml
qcom/qcs6490-rb3gen2-vision-mezzanine.dtb
- make DT_CHECKER_FLAGS=-m W=1
DT_SCHEMA_FILES=media/qcom,sc7280-camss.yaml dt_binding_check
- make -j32 W=1
- ./scripts/checkpatch.pl
 
Changes in V14:
- Updated commit text for [PATCH v13 2/2] - Dmitry
- Removed duplicate Reviewed-by tag for [PATCH v13 1/2] - Dmitry
- Link to v13:
  https://lore.kernel.org/linux-arm-msm/20250208165232.2371889-1-quic_vikramsa@quicinc.com/

Changes in V13:
- Updated commit text for [PATCH v12 2/2] - Dmitry
- Updated Copyright to add 2025 for [PATCH v12 2/2] - Jie
- Link to v12:
  https://lore.kernel.org/linux-arm-msm/20250207090422.1609260-1-quic_vikramsa@quicinc.com/

Changes in V12:
- droped mclk-pins{} and put the properties directly under the
  cam2-default-state and cam2-suspend-state node - Konrad.
- Link to v11:
  https://lore.kernel.org/linux-arm-msm/20250121125010.1853269-1-quic_vikramsa@quicinc.com/

Changes in V11:
- Moved [PATCH v10 1/4] and [PATCH v10 2/4] as a separate series.
- Marked dependency on
  https://lore.kernel.org/linux-arm-msm/20250121120901.1841142-1-quic_vikramsa@quicinc.com/
- Sorted the header files alphabetically in dtso.
- Removed invalid property for sensor.
- Removed rst-pin from default and suspend states of pinctrl. We have verified
  that for imx412 sensor there are no SET_SYSTEM_SLEEP_PM_OPS added.
  So removing rst-pin does not make any difference in power management. 
- Link to v10: https://lore.kernel.org/linux-arm-msm/20241217140656.965235-1-quic_vikramsa@quicinc.com/

Changes in V10:
- Updated cover letter to add link for v8 under changes in v9.
- No change in the patches w.r.t V9
- Link to v9: https://lore.kernel.org/linux-arm-msm/20241217133955.946426-1-quic_vikramsa@quicinc.com/

Changes in V9:
- Removed GCC_CAMERA_AHB_CLK as its always enabled.
- Added GCC_CAMERA_SF_AXI_CLK.
- Renamed gcc_cam_hf_axi to gcc_axi_hf.
- V8 had 5 patches and V9 have 4 patches.
- First 3 patches of V8 are already promoted to linux-next
i.e  
  media: dt-bindings: Add qcom,sc7280-camss
  media: qcom: camss: Sort camss version enums and compatible strings
  media: qcom: camss: Add support for camss driver on sc7280
- 2 new patches are added to handle new comments from Konrad on
  "Patch v8 4/5 arm64: dts: qcom: sc7280: Add support for camss" 
  1 of the 2 new patches make changes in yaml and other one is making
  change in camss driver to handle new comments in dtsi.
- for "Patch v8 4/5 arm64: dts: qcom: sc7280: Add support for camss" I got
  comments from Konrad to make changes for clock names so I had to make
  respective changes in "bindings/media/qcom,sc7280-camss.yaml". As dtsi
  changes are not merged yet, so there is no issues with backward
  compatibility and I am assuming this should be acceptable.
- Link to v8: https://lore.kernel.org/linux-arm-msm/20241206191900.2545069-1-quic_vikramsa@quicinc.com/
  
Changes in V8:
- Changed node name from camss to isp.
- Added QCOM_ICC_TAG_ACTIVE_ONLY and QCOM_ICC_TAG_ALWAYS tags for
  interconnects. 
- Added blank lines when required.
- Modified power-domain-names from horizontal to vertical list.
- Sorted pinctrl nodes based on gpio index.
- Link to v7: https://lore.kernel.org/linux-arm-msm/20241204100003.300123-1-quic_vikramsa@quicinc.com/

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

Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>

Vikram Sharma (2):
  arm64: dts: qcom: sc7280: Add support for camss
  arm64: dts: qcom: qcs6490-rb3gen2-vision-mezzanine: Add vision
    mezzanine

 arch/arm64/boot/dts/qcom/Makefile             |   4 +
 .../qcs6490-rb3gen2-vision-mezzanine.dtso     |  89 +++++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi          | 178 ++++++++++++++++++
 3 files changed, 271 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso

-- 
2.25.1


