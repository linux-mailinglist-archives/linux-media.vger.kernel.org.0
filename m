Return-Path: <linux-media+bounces-48844-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 578D9CC11C1
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 07:31:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E766B301CC57
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 06:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D5643375D3;
	Tue, 16 Dec 2025 06:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XjLjq8jV"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05475335BCC;
	Tue, 16 Dec 2025 06:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765866187; cv=none; b=Pdd5B8CihNLMDd7Gs3WAf0PelZ6x3cjskpkfedbXCKEpl+HItgWp2yReC7Otu0qoOC4lbBH6WIp6k1EVZQ+/8o+pFm/yMNYDO1w+pvnHgtmjBa29PyElZ0rMrDpSd3hlfxJZzTjD5k08zLILBBz5wQ6cOFjBy6F2JuQtdfJl1b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765866187; c=relaxed/simple;
	bh=QAphHMbDpNPv3Br717L5zULaKEOTo+K8m5qzBOmz2cc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Myvr29ZsXQBsZ9kfPDiwhV3XX9vqbhmV21jfS6xqgkrGZ9+OKDkSvOs7EeGivK4tUdhYtsYIZ7BSipdFhs6pV49JinQ4EBL4uaiVqIht8MwiBxSdypgTGCO5CIOUMXhZLn3g3xwDSAO4sCDedGoKYxllowsFZp2vZMWltFlJx3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XjLjq8jV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG4F9x1366858;
	Tue, 16 Dec 2025 06:22:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=l61JFv+MfI0WE1da1fbXOG
	rJamZBh/AIvGNfa1343js=; b=XjLjq8jVBxMybhCq0uVELXRsgEr9xkcJfja/+u
	SKilc7gWqIAvRSUS9CMNNqLSBSQVGpjMHpO8eJLsbUywxJ79rumtvAjqNkbUurR4
	wFap2R0/bBKRxKbVxJNhS+5Is8C5Wx2qY3haFmy+niDfQcdEfKFBpkBTJ/rvz2g3
	jf49epotsp6aYrVAhdUNnlc/f8SY4O4i9pG7ncdOAwyndt44zCI5UVfBRMOMsA7O
	DTVc9HmGV4Cci4Gro/bdN6ObZ0hlk75KE361xUOHMp/ZiIZvNS1aXhO8n58btASL
	jtVTpjOfDUJURJHbvu4jf6K8TQGgRClMn2uUfm635RxU9A8w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2j1c3d56-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 06:22:44 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5BG6MhwT000815
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 06:22:43 GMT
Received: from hu-nihalkum-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Dec 2025 22:22:38 -0800
From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
To: <bryan.odonoghue@linaro.org>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_svankada@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 0/5] Add CCI and imx577 sensor support for monaco evk
Date: Tue, 16 Dec 2025 11:52:18 +0530
Message-ID: <20251216062223.2474216-1-quic_nihalkum@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDA1MCBTYWx0ZWRfX64A40uEaAWAl
 57RLu4mVwEXeZpFunmjxlcJo9hmu/euAUuhxw6EZdrQgxC/q76KfmPMtn36f9TJN4IGTpfS1EEQ
 FQrFUR4YCg4pOJ5Pc0Zvse86Hkr7YOhAwvyiNMrybBg2p0cNROU4evECv3043sRmdfQN7h53Vsf
 T+CeTEyJ0XPrm1aEFh8r5RmvOE7yBuEz2AUcnE9fNCydWF57wAS4QmuoCFoAAHO7Uo/QQPgB/YT
 UjqexihoYKfmjqk0ub8Tx5eElGsrlQRKDOkYgRF2WZl0ndg8p+QhFBoZTHYZwIiL/RPMQ4s3whb
 f7pleUXOyiPVo/KNfUI/isvwfETqzkiMY4rNQfJLTyT6RA4Q/IOBFnvzcoE4GDlZSu0P8ID6JqA
 e3MAJFZXBhK1mcWNiMS6Q81I4vUjoQ==
X-Proofpoint-GUID: gEkY0mgEOhTR-tWbl-H2CsIFBbZ-iR4x
X-Authority-Analysis: v=2.4 cv=ceLfb3DM c=1 sm=1 tr=0 ts=6940fab4 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=yYjbjCPdd4sGEI68VPkA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: gEkY0mgEOhTR-tWbl-H2CsIFBbZ-iR4x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_01,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160050

From: nihalkum <nihalkum@qti.qualcomm.com>

Monaco EVK is a single-board computer based on the Qualcomm QCS8300 SoC.
It lacks a camera sensor in its default configuration.
This series adds CCI support and enables the IMX577 sensor via CSIPHY1
through device tree overlay.

We have tested IMX577 Sensor on CCI1 with following commands:
- media-ctl --reset
- media-ctl -V '"imx577 3-001a":0[fmt:SRGGB10/4056x3040 field:none]'
- media-ctl -V '"msm_csiphy1":0[fmt:SRGGB10/4056x3040]'
- media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -l '"msm_csiphy1":1->"msm_csid0":0[1]'
- media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video1
---

This patch series depends on patch series:
https://lore.kernel.org/all/20251107162521.511536-1-quic_vikramsa@quicinc.com

Bindings for Supplies are added by below patch:
https://lore.kernel.org/all/20251107162521.511536-1-quic_vikramsa@quicinc.com

Changes in v7:
- Define MCLK pinctrl definitions in monaco.dtsi - Konrad and Vladimir
- Define fixed regulators for camera AVDD rails in monaco-evk.dts - Konrad
- Link to v6:
  https://lore.kernel.org/all/20251126081057.4191122-1-quic_vikramsa@quicinc.com

Changes in v6:
- Fixed ordering of property-n and property-names in vreg_cam1_2p8 - Konrad 
- Moved vreg_cam1_2p8 defintion to monaco-evk.dts - Konrad
- Removed description of pins with MCLK and Regulators function - Konrad
- Added pin hardware description for MCLK, regulators in monaco.dtsi - Konrad
- Link to v5:
  https://lore.kernel.org/all/20251114064541.446276-1-quic_vikramsa@quicinc.com

Changes in v5:
- Rename cciX_i2cY_* to cciX_Y_* to shorten the labels - Vladimir 
- Added description of pins with MCLK function - Vladimir 
- Link to v4:
  https://lore.kernel.org/all/20251015131303.2797800-1-quic_vikramsa@quicinc.com

Changes in v4:
- Remove the AXI source clock from the CCI node - Konrad
- Updated the qcs8300-camss device tree binding.
- Link to v3:
  https://lore.kernel.org/all/20250917130647.1701883-1-quic_vikramsa@quicinc.com

Changes in v3:
- Updated and Wrapped commit messages for [PATCH v2 1/3] and [PATCH v2 2/3] - Rob
- Link to v2:
  https://lore.kernel.org/all/20250912141134.2799078-1-quic_vikramsa@quicinc.com

Changes in v2:
- Remove the patch that adds PHY supply documentation in the qcs8300 CAMSS. 
  bindings. This change should be submitted together with the qcs8300 bindings patch.
- Fix indentation and regulator node name - Krzysztof.
- Update commit message as suggested - Dmitry.
- Link to v1:
  https://lore.kernel.org/lkml/20250909114241.840842-1-quic_vikramsa@quicinc.com

Used following tools for the sanity check of these changes.
- make -j32 W=1
- checkpatch.pl
- make DT_CHECKER_FLAGS=-m W=1 DT_SCHEMA_FILES=i2c/qcom,i2c-cci.yaml dt_binding_check
- make CHECK_DTBS=y W=1 DT_SCHEMA_FILES=i2c/qcom,i2c-cci.yaml
- make DT_CHECKER_FLAGS=-m W=1 DT_SCHEMA_FILES=media/qcom,qcs8300-camss.yaml dt_binding_check
- make CHECK_DTBS=y W=1 DT_SCHEMA_FILES=media/qcom,qcs8300-camss.yaml

Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>

Nihal Kumar Gupta (5):
  dt-bindings: i2c: qcom-cci: Document qcs8300 compatible
  arm64: dts: qcom: monaco: Add CCI definitions
  arm64: dts: qcom: monaco: Add camera MCLK pinctrl
  arm64: dts: qcom: monaco-evk: Add camera AVDD regulators
  arm64: dts: qcom: monaco-evk-camera: Add DT overlay

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml |   2 +
 arch/arm64/boot/dts/qcom/Makefile             |   4 +
 .../dts/qcom/monaco-evk-camera-imx577.dtso    |  67 ++++
 arch/arm64/boot/dts/qcom/monaco-evk.dts       |  51 +++
 arch/arm64/boot/dts/qcom/monaco.dtsi          | 324 ++++++++++++++++++
 5 files changed, 448 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-camera-imx577.dtso

-- 
2.34.1


