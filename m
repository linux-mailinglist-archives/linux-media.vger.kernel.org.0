Return-Path: <linux-media+bounces-47053-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB75C5B9E4
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 07:51:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 303264F358B
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 06:47:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E8A72797AC;
	Fri, 14 Nov 2025 06:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SpovuHwf"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD7B2F60CC;
	Fri, 14 Nov 2025 06:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763102789; cv=none; b=McwSZHQPpOcPa7KPTC53NSpqWI6boLBTomtJ7N0R+OD2lbvT2vlMtFUuSElqpjicJ4fDfallIsM6TyPNiYWIsPUcGpcwQC0AzoYSUNBVcnXviGdIBHdValtZs9opN2L94gwXDb9DqK6EIlzohHcJEc3jhITssU3Smt7xkdzVsuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763102789; c=relaxed/simple;
	bh=+U/YljHZJiG3vYhsRhpcj4Jd8C5pgq1RaqWNEd9l3HE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UzEahuI2ntG0tjpza5hpMz2y+HkOdahzJwv9NdNz4c0UKNGD0opd1ydHCoL1h5hIznlZPIMaMsFm1vaCNtmjjEUwT4yWspccjtFfIP3xGpRkzbcgw2HUZhM/br+OxXa+tt8TTXn7YDw5wpjXTjdPFi9wMaib7fIbE8VDEM1kPO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SpovuHwf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMb2hs1630107;
	Fri, 14 Nov 2025 06:46:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k6pf4rXdw/I+1bYyE25RhrDtcT2wGO9rPCh2ZCJN6nI=; b=SpovuHwfe0UgRoiW
	QbRitvDRFyOJWjXQGBa0HhM1pzVx96yUdpn44E9Dd0vmx4ltRLIukV2Sihr0uWvM
	FV5xVLcK3yRNFjlLZzGwrXLgXTEQLwKgyWLA8c/gmH6Z1SuN2ImRC7uAoaqAIe76
	9yNYoum/q53rF7pLaUfa+RjxR1VrEhWtOetxzZwnID7y7Vj7bvW8Olh22My9tP4f
	LfkrlmmLhF0tHBHrcgrOSjB4Oz7Y66pRIy2jXygMTOyhBSLluIX8Sl6fX24mvwdT
	sEnKK51LXWMnMXC8zOyfvD26oTmG6JQesNTPb1QaGyQASqZy3W6p9uFjOcr2Xf/a
	eTTdcg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9d952y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Nov 2025 06:46:19 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5AE6kJfg004980
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Nov 2025 06:46:19 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Thu, 13 Nov 2025 22:46:12 -0800
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <bryan.odonoghue@linaro.org>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_svankada@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_nihalkum@quicinc.com>, <quic_vikramsa@quicinc.com>,
        Ravi Shankar
	<quic_rshankar@quicinc.com>,
        Vishal Verma <quic_vishverm@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: [PATCH v5 3/3] arm64: dts: qcom: monaco-evk-camera: Add DT overlay
Date: Fri, 14 Nov 2025 12:15:41 +0530
Message-ID: <20251114064541.446276-4-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251114064541.446276-1-quic_vikramsa@quicinc.com>
References: <20251114064541.446276-1-quic_vikramsa@quicinc.com>
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
X-Proofpoint-GUID: xi-Zz4nz3fTnFCwcfnl2tbT8k5w5D_vk
X-Authority-Analysis: v=2.4 cv=Rdidyltv c=1 sm=1 tr=0 ts=6916d03b cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=UCIxLOB1EF4ELhZYz8wA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: xi-Zz4nz3fTnFCwcfnl2tbT8k5w5D_vk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA1MiBTYWx0ZWRfXx5mHKY9Vt1i+
 GESdiyZ/uW3mDfxs/1wccZ3maxEicASXiS4UyN+q7+8o7Gxjw6ql8kq4pMpPkRHHb6Nmz90SWZ4
 Pk7Oxv0W9MZMkipBTZOQ4CRFHhusitPR0G7GmSOsczzjWy8DIFdUQLF6Axz68+BuwdyjX9TZIyt
 5B7wnSt8ibzivStItLGyLopMMAnNMwGVCW3TzE0QCJ7zE1a+GoADu6kXeT3qU+QuR4igiOO0S1D
 aOh293kBYczgTiLmVh5l1wA+i0i9apZ2FztHOIwu4rvwU2pHFsnp0LL5mPsifml0fAaDvZYdDWS
 939cw7RwAuEE/tuI+CNucp/8WtMIB9tP6NYooDgHfZwRfnGGUAMcm0hVGFsyyJSHv78zvNY7a2h
 JtWTksfKKcMbIacilKmAkN9IJ4F6Pw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_01,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140052

From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>

Monaco EVK board does not include a camera sensor in its default hardware
configuration. Introducing a device tree overlay to support optional
integration of the IMX577 sensor via CSIPHY1.

Camera reset is handled through an I2C expander, and power is enabled
via TLMM GPIO74.

An example media-ctl pipeline for the imx577 is:

media-ctl --reset
media-ctl -V '"imx577 3-001a":0[fmt:SRGGB10/4056x3040 field:none]'
media-ctl -V '"msm_csiphy1":0[fmt:SRGGB10/4056x3040]'
media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
media-ctl -l '"msm_csiphy1":1->"msm_csid0":0[1]'
media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video1

Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
Co-developed-by: Ravi Shankar <quic_rshankar@quicinc.com>
Signed-off-by: Ravi Shankar <quic_rshankar@quicinc.com>
Co-developed-by: Vishal Verma <quic_vishverm@quicinc.com>
Signed-off-by: Vishal Verma <quic_vishverm@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/Makefile             |   4 +
 .../dts/qcom/monaco-evk-camera-imx577.dtso    | 105 ++++++++++++++++++
 2 files changed, 109 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-camera-imx577.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6f34d5ed331c..b1ba182a0d8d 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -38,6 +38,10 @@ lemans-evk-camera-dtbs	:= lemans-evk.dtb lemans-evk-camera.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-camera-csi1-imx577.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
+
+monaco-evk-camera-imx577-dtbs	:= monaco-evk.dtb monaco-evk-camera-imx577.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-camera-imx577.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-camera-imx577.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-camera-imx577.dtso
new file mode 100644
index 000000000000..9bc8fdb9e743
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-evk-camera-imx577.dtso
@@ -0,0 +1,105 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/qcom,sa8775p-camcc.h>
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	vreg_cam1_2p8: vreg-cam1-2p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_cam1_2p8";
+		startup-delay-us = <10000>;
+		enable-active-high;
+		gpio = <&tlmm 74 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam1_avdd_2v8_en_default>;
+	};
+};
+
+&camss {
+	vdda-phy-supply = <&vreg_l4a>;
+	vdda-pll-supply = <&vreg_l5a>;
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
+	pinctrl-0 = <&cci1_0_default>;
+	pinctrl-1 = <&cci1_0_sleep>;
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
+				link-frequencies = /bits/ 64 <600000000>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&csiphy1_ep>;
+			};
+		};
+	};
+};
+
+&tlmm {
+	/*
+	 * gpio67, gpio68, gpio69 provide MCLK0, MCLK1, MCLK2 for
+	 * CAM0, CAM1 and CAM2 respectively via the "cam_mclk" function.
+	 * So, here it's MCLK1 pin for instance.
+	 */
+	cam1_default: cam1-default-state {
+		pins = "gpio68";
+		function = "cam_mclk";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	/*
+	 * gpio73, gpio74, gpio75 enable AVDD regulators for
+	 * CAM0, CAM1 and CAM2 respectively via the "gpio" function.
+	 * So, here it's AVDD1 pin for instance.
+	 */
+	cam1_avdd_2v8_en_default: cam1-avdd-2v8-en-state {
+		pins = "gpio74";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
-- 
2.34.1


