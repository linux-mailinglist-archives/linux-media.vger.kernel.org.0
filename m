Return-Path: <linux-media+bounces-47736-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 169D1C88931
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 09:11:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4B66134A060
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 08:11:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3C832E265A;
	Wed, 26 Nov 2025 08:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JZXAH2o0"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C468F50F;
	Wed, 26 Nov 2025 08:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764144690; cv=none; b=O5SGGDdTf3FGabzmgCGaUHdjeZjMQLk4C1lydzvCZMK8lhj1MRYuJW60T9ZpmVIuVUpD9T+V2/ZWJfBiqdIG3qxnDViO/uuOs0ilgu4e2AQ+NUMYo1v8tjSG+JUW1TvxCk8voRsO7PAo3EDvK5XRNK/kfh6QdEbNO82U1INbI5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764144690; c=relaxed/simple;
	bh=RPq8Rcw9ZCUJYjvJ3nYrLY6oIjMz85AYnchAPtjNOmE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WvkpHeER0yH4qmFBETWdGg+tNckC18y4AP185GerV2/jthQnvbSyDYp4IRpqjCTqE1+UgGooPvLzNjs+d+TXUNW6Mn0ZAdtsy+YetU8mYs48TPVAh601zyjv/ZEeb0B1AP0l8e6dTw1w6RfvL+8fNfA166Bixl68NnmfJRhsvO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JZXAH2o0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APNMNfE4048890;
	Wed, 26 Nov 2025 08:11:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bxvJU3M7yfBM675A6OeO3t
	sXcZWDMUEwc23VP4Gj3FM=; b=JZXAH2o00memDZ3yPOND8vPOk5VlB/G4DRGg/W
	y7y3NqOk9CrCW7sO+mnw7fRMXLI1PYN5K1HkLanaalp8e+WNLVogB9p/FURiS0Po
	+F4uxAAKkRhbnzFrucJtFBmiera7mrx/rzfdcv+2KFQkTQxxV8Q1ZYZkObJ6MWrx
	bExakEl7iZCdPUratKGZPrdKk3vbFVo6m4OxD9QblA2tiiyAc7HzceR4V7z3j+nD
	y1QZ1qNmCwIMFIW2ApYwfQOMDA/Fjr7YirD9Gb+rOY7updErh9Pv+JyXuJzrCUot
	0yVuFS7+ocyvDXqRG5Y82Bao0oHp5w4SWAAODFheRptvekOg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anp2nh5wy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Nov 2025 08:11:16 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5AQ8BFE8031821
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Nov 2025 08:11:15 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 26 Nov 2025 00:11:10 -0800
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_vikramsa@quicinc.com>,
        <nihalkum@qti.qualcomm.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 0/3] Add CCI and imx577 sensor support for monaco evk
Date: Wed, 26 Nov 2025 13:40:54 +0530
Message-ID: <20251126081057.4191122-1-quic_vikramsa@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=KerfcAYD c=1 sm=1 tr=0 ts=6926b624 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=yYjbjCPdd4sGEI68VPkA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: URqIpivV5NYTEw0zw9P72GT3S7os3yY6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA2NiBTYWx0ZWRfXzxmfTC1ubTJg
 ec0Ql9M2KmlAcxDmFvNHuhj4QkDD5YOCaEA1c/LaWZdjW3U5NqaQjJbBK7aYrVO/w2JmQO6pOv9
 ZRMTcXB/jQKyVV1tpMF7HeWQToo+7OgWoP0WliYP5A+GjWLxtMxlcs8Io6pvtIWFqBpW2WuOOPq
 0va1rtJ4oYI7sQPNMUfSpgc8bfhKelE8gzfOc6TvrstAWD2fBnrEdMsIF6CMquT0Pvg/p36cSdD
 Juxy6g49iBmg0JX6PN5WJoEez52F0wkqhpWyOTfyoGSd7wDChUjUgpUG1QBMEOqMqioAGWWDEvE
 DpTQTST9ZNvugchZuGeRlSsd60R8eh6eQUfW1NjQcYhavaUUSvTB3eIDni6eA7qtote6LGQDaBl
 aPTpXAKqtC/M/YJ3nzFY4tam5+LS0w==
X-Proofpoint-ORIG-GUID: URqIpivV5NYTEw0zw9P72GT3S7os3yY6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260066

From: Nihal Kumar Gupta <nihalkum@qti.qualcomm.com>

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

Nihal Kumar Gupta (3):
  dt-bindings: i2c: qcom-cci: Document qcs8300 compatible
  arm64: dts: qcom: qcs8300: Add CCI definitions
  arm64: dts: qcom: monaco-evk-camera: Add DT overlay

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml |   2 +
 arch/arm64/boot/dts/qcom/Makefile             |   4 +
 .../dts/qcom/monaco-evk-camera-imx577.dtso    |  67 ++++
 arch/arm64/boot/dts/qcom/monaco-evk.dts       |  10 +
 arch/arm64/boot/dts/qcom/monaco.dtsi          | 345 ++++++++++++++++++
 5 files changed, 428 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-camera-imx577.dtso

-- 
2.34.1


