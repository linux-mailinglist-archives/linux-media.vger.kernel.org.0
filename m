Return-Path: <linux-media+bounces-42105-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D89B4AC82
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 13:44:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB2B81C22079
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 11:44:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5D9D326D67;
	Tue,  9 Sep 2025 11:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ge5LXh1f"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8250432274D;
	Tue,  9 Sep 2025 11:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757418209; cv=none; b=D5eh4ETHuPCLU1x/3l+go7p7Fr5w2J1lrAaMEmowoRiFGRMJa47d3yFxLN4Yg5NSNvyuSBGbrPP9hoAD89QKoihocMOciN/z1voSmlIY1Tvr2igPa6GJ5NVnkX9QKztNy0uZen868hyBZUshVLXcGFzJm9elMtetP/iZASYoCn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757418209; c=relaxed/simple;
	bh=3OvZGRzQXTYxm0FiR4CEOwXA5mG46udlgwkkmFJriPU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X1EayXbQv8wYk0YHe5+4t44Ebav7wbvEYLXv5LeYMKgNVV5YKYUOWbAPQN6ZRAywlTGVNltmbnFcuqsUJbjdDG3Ef47PZuVibBkHdZqQ+ier1QM9ZNkkgO6VvUwWVrwXEm/HYJdPB1xCPki1Ie9bwlgwPkP7TifjTogK7EsGFdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ge5LXh1f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LiBS024839;
	Tue, 9 Sep 2025 11:43:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bhU78asEdy/SGbxMJ5SzbM2fna+A9Qx2RM+dqaIqbew=; b=ge5LXh1fwvu6rX8+
	0HHxXh+CC74kR7TOdVArSXcWzBWVWDxgG2oQjl0EitqVBwxNQReD5WybgZrw+sT6
	eC/EpjQT9uTK/VT3zv2VPq3jW4PgMN/RsWOEklGA84sHy5PWpisZmzVNGT9eZU/J
	rYVNnYNS6B5eV3sBLpJuKH9IaYosdG4MdHe2xI/mIQ9hexJMSIcfCuu89iJUzSaW
	VLC4pBPRgP0vGIBfE7UwCIJVB3SY/SI4lB4NAZZEuDWqRsMFbBxeBoOkJQQhrCVs
	isj7eJnFHNBZEBwqugUC24SwsdaPJkRvOtv46gxuLQDtyH8aVLXzigQDo5SaiX2I
	nGzibw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490by9041b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 11:43:17 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 589BhGMG006750
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Sep 2025 11:43:16 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Tue, 9 Sep 2025 04:43:10 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <bryan.odonoghue@linaro.org>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_svankada@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Ravi Shankar
	<quic_rshankar@quicinc.com>,
        Vishal Verma <quic_vishverm@quicinc.com>
Subject: [PATCH 3/4] arm64: dts: qcom: monaco-evk-camera: Add DT overlay
Date: Tue, 9 Sep 2025 17:12:40 +0530
Message-ID: <20250909114241.840842-4-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250909114241.840842-1-quic_vikramsa@quicinc.com>
References: <20250909114241.840842-1-quic_vikramsa@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=Yv8PR5YX c=1 sm=1 tr=0 ts=68c012d5 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=NLwFWGH_UQBbXVxK50EA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: KTPPvG-bW2KZrGgmLM8zYQFb5HGiEuNo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX2NF2dj71Tj+k
 wAyYiAoHAQLX9OLCkk4FsEAbA1y9Phdm6ls5gmRFSQyFQZBKoICwAHahKv0GNYARkyXq2sG0msM
 fHPspDh/WVfuME5EWxPdU9CPkr1ynnQbDPhEOyFet5szgXBPRpBOBpaoH/l7cmG981W0WVG9+ca
 OEwDEHR4TJM+Q0Yw7L6ZDiHsBHCrGtEyL95A5RHT5LUTcWopShkoo78ZB7q5kgxXuMLrN3c2FRS
 V/FL2YFuMv7q8Ng1FKmdvAFQxB6MpMvv1DCImB6tuoga0fGoihWQ3/vl49zDWWTu2nsqnwtX3P2
 ++YX4l3yMKBuNzUTWTsor8gBbZL+vy9VLAbFmrtEDHLsQoSAsP7iZgwXLDXIiqOlpjVEpqFgoM8
 oYtD3a1Y
X-Proofpoint-ORIG-GUID: KTPPvG-bW2KZrGgmLM8zYQFb5HGiEuNo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_01,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018

From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>

Enable IMX577 sensor using the CCI1 interface on Monaco EVK.
Camera reset is controlled through an I2C expander,
and power supply is managed via tlmm GPIO74.

Co-developed-by: Ravi Shankar <quic_rshankar@quicinc.com>
Signed-off-by: Ravi Shankar <quic_rshankar@quicinc.com>
Co-developed-by: Vishal Verma <quic_vishverm@quicinc.com>
Signed-off-by: Vishal Verma <quic_vishverm@quicinc.com>
Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |  4 +
 .../boot/dts/qcom/monaco-evk-camera.dtso      | 98 +++++++++++++++++++
 2 files changed, 102 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-camera.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 0e4e0e0b833b..714eb4badf5a 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -31,6 +31,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp453.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
+
+monaco-evk-camera-dtbs	:= monaco-evk.dtb monaco-evk-camera.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM) += monaco-evk-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-camera.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-camera.dtso
new file mode 100644
index 000000000000..5831b4de6eca
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-evk-camera.dtso
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+/* Camera Sensor overlay on top of Monaco EVK Core Kit */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/qcom,sa8775p-camcc.h>
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	vreg_cam1_2p8: vreg_cam1_2p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_cam1_2p8";
+		startup-delay-us = <10000>;
+		enable-active-high;
+		gpio = <&tlmm 74 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&camss {
+	vdda-pll-supply = <&vreg_l5a>;
+	vdda-phy-supply = <&vreg_l4a>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			csiphy1_ep: endpoint {
+				clock-lanes = <7>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&imx577_ep1>;
+			};
+		};
+	};
+};
+
+&cci1 {
+	pinctrl-0 = <&cci1_i2c0_default>;
+	pinctrl-1 = <&cci1_i2c0_sleep>;
+
+	status = "okay";
+};
+
+&cci1_i2c0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	camera@1a {
+		compatible = "sony,imx577";
+		reg = <0x1a>;
+
+		reset-gpios = <&expander2 1 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam1_default>;
+		pinctrl-names = "default";
+
+		clocks = <&camcc CAM_CC_MCLK1_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK1_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		avdd-supply = <&vreg_cam1_2p8>;
+
+		port {
+			imx577_ep1: endpoint {
+				clock-lanes = <7>;
+				link-frequencies = /bits/ 64 <600000000>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&csiphy1_ep>;
+			};
+		};
+	};
+};
+
+&tlmm {
+	cam1_default: cam1-default-state {
+		mclk-pins {
+			pins = "gpio68";
+			function = "cam_mclk";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		ldo-avdd-pins {
+			pins = "gpio74";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+};
-- 
2.25.1


