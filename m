Return-Path: <linux-media+bounces-42437-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE3DB5509A
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 16:13:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 49C4F1D6473C
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 14:14:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BACB7317708;
	Fri, 12 Sep 2025 14:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IYJpBUJ9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607473164CA;
	Fri, 12 Sep 2025 14:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757686347; cv=none; b=kEAmpO0/aKivHS8LrALj8B9k3i+YeYGd65A6lifR8+EKi+pwtIz0nekwIYwTtPi0cRfCUxlezRkb6TnV/U1Au5QobA8fAedh3bAhJtSDZbRwOeDPfIcJ6jYamz9RdlJTG0r2kMR3O2fNVumvx18AdwfVV24UAsUj8TQ3qsBrBJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757686347; c=relaxed/simple;
	bh=7KR6HrHJU7oRu+YQt01RqrfJssPhbl8TlOcX5J3670s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GeLUriYZEFtDd1QzBIA+LihPMzixiBbvOtstF+kW+1SrljlxSFhtMKVesZnm3dH++xJbQeTis+732KMTIefvP1aGXPMVNwZX6GA9HGbQuUn4BT+TO8EbQux7WAiBb4ClaaZ1xtxprruq4dvFT8ES19waQKjpInXzs+oL9/BE4r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IYJpBUJ9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fEJ3001295;
	Fri, 12 Sep 2025 14:12:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nwMW5r0Tc8149DtyycM8Duh/W1fGQFMGOMvWssNqYbM=; b=IYJpBUJ93mIn5eDK
	AL3TnpKJnp2DWvGL+d/7i4S7AgiKDeHuC+t3gQ3FG04+Me/I8CEGUFX/y+i6dE5F
	LRrCWHv7KAGN0n4cXnvOtN3EmLEvWw6UYHeiIcpygyEk4dsqLw7VkCYHeOlTxcQd
	dDCRyOBE09UiV+PdmOEQ2oed3PWSXv4pvIcl7iNkQph5WsiQkx/3KwNHP4XRozLB
	AdMpncUQz3y2YVBcb18USlJnfw3bj4kMo5/VKYnh2xdX8IgWlP+6MI6MU1c7FtLS
	Rrc0BNi/dRI/srk6R0E1uIxf1MN8A/gc7ZM/K05ytTAPWbAb1Ndao2VLvamoK1UD
	xTa//Q==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493f6h6uyn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 14:12:15 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58CECE2C007617
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 14:12:15 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Fri, 12 Sep 2025 07:12:08 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <vladimir.zapolskiy@linaro.org>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_vikramsa@quicinc.com>,
        <quic_nihalkum@quicinc.com>, <quic_svankada@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Ravi Shankar
	<quic_rshankar@quicinc.com>,
        Vishal Verma <quic_vishverm@quicinc.com>
Subject: [PATCH v2 3/3] arm64: dts: qcom: monaco-evk-camera: Add DT overlay
Date: Fri, 12 Sep 2025 19:41:34 +0530
Message-ID: <20250912141134.2799078-4-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250912141134.2799078-1-quic_vikramsa@quicinc.com>
References: <20250912141134.2799078-1-quic_vikramsa@quicinc.com>
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
X-Proofpoint-ORIG-GUID: YbmGek3WeGiFp1kwTX83FEhngAgsMIjT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEwMDE3NyBTYWx0ZWRfXxjh8Xb1u1UX2
 u5F76h39jfZRFRnRBs8RcyNUH/psNStCpWODtoK1aDm7nENl7CReC2AfvmbkD3PP0hGcXZMCDsX
 cjlKlGj3ypEUP+C/FSbmyUaJARBvSknDIYDnrlMQu/hnzoP1Ft0fbjLglqEl8pzbeXBsKKiCYA5
 NC912eOeMe4sF5MJg2LNT58PDZRlKD1AlCPQx6yOWcfYJdo4qoNHIK/m1WjY1TJmbBQpw65b9+G
 f3BsN89nvqBX9qjXyZxGqhZ//MrByf78lAUDW0YzWoEgh60eNnpd7jUTcK7OfCZstXBTN2MycpI
 qcByKVVipmbHA1B67dOCzIChRaIExoMtq9/7Fm3rA6JdWGucyVvSreCwqiRgU+lEPcoHYqJ5z/k
 +mg4D+9K
X-Authority-Analysis: v=2.4 cv=WPB/XmsR c=1 sm=1 tr=0 ts=68c42a3f cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=1o0OAiIl6arAuPHRMUsA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: YbmGek3WeGiFp1kwTX83FEhngAgsMIjT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_05,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1011 priorityscore=1501 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509100177

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

Co-developed-by: Ravi Shankar <quic_rshankar@quicinc.com>
Signed-off-by: Ravi Shankar <quic_rshankar@quicinc.com>
Co-developed-by: Vishal Verma <quic_vishverm@quicinc.com>
Signed-off-by: Vishal Verma <quic_vishverm@quicinc.com>
Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |  4 +
 .../dts/qcom/monaco-evk-camera-imx577.dtso    | 96 +++++++++++++++++++
 2 files changed, 100 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-camera-imx577.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 5b52f9e4e5f3..1c32c54ed841 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -31,6 +31,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp453.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
+
+monaco-evk-camera-imx577-dtbs	:= monaco-evk.dtb monaco-evk-camera-imx577.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-camera-imx577.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-camera-imx577.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-camera-imx577.dtso
new file mode 100644
index 000000000000..2237f0fc4a14
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-evk-camera-imx577.dtso
@@ -0,0 +1,96 @@
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


