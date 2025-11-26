Return-Path: <linux-media+bounces-47739-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F1118C88955
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 09:12:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E013034C1C9
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 08:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23EC13191D8;
	Wed, 26 Nov 2025 08:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ejs2Lh5B"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05200318136;
	Wed, 26 Nov 2025 08:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764144706; cv=none; b=Fw/PVh9iO7EY9hxRW1WaNrpnAo1qQjsbRf/QhXSaag51LgLKxHfIC9Y19i1acMoaQei/+5U82/2/7Rm3Q0Ibw36yuC7VG9PZosHa5NtRdRecALcetP7QWqjp9ffE9kcDHd81TI8P9Gv1uz0r9bMKxmIfb+AnipNq3dIDfWISWAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764144706; c=relaxed/simple;
	bh=I9EcG0sAwFkS3pWJpQ36oEevnzgXurgJ1oYAHnD/nDI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZiJP8LvVqi4MkvjNx9+Hiaiv7Cg3DLNiJjntxNYGG5wpVl41rA6+lfpYpSPjHPZgreMv5exCggE5SK0RSYC6ZDEfSIR/hRVwdaK8b9u3J1QyPo+BmEU1qmZnp9Q50qYR8Hj1HtbJnKWMPfzKh5MXeGwSObefJ/uCY6564HcqV3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ejs2Lh5B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ5tak72655532;
	Wed, 26 Nov 2025 08:11:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L18TXH1N1Sa2VLPNphOpl1AmhAR02/DRmr4yXBbFJEE=; b=ejs2Lh5Bq80NPkA0
	9Q90t4C8+weg1ZHjQDuN6KFJD+k3XtDO3v0cQZpEiJUWkmXJpKn2yVnrVZ7CqeJt
	T4ZewQnQpJB7k2McqlN4qGOmesdTH0+/uLwDXPbr1nBrV6KO72jkgFQiElzVDnT3
	4/Wkcc+8zHBVP8bcH2dsnOl2u7ehrV1EnmrWWJdnGif14WqzMOmwi2jAacsiJyXk
	py0+KdREEtwmH6bfztKLbxt7oGzrx86bIVciTJHrNozOYrQWM7dLjBHsrL8DsOjk
	CW9ivKDKaZ0aYo78axYSwTalhy1Kl91WLkf8FNAyQLEZKiHv0m6cJXt3EKCGHxjK
	mS/cng==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4an9fxujdx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Nov 2025 08:11:35 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5AQ8BYcc017762
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Nov 2025 08:11:34 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 26 Nov 2025 00:11:28 -0800
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
        <linux-kernel@vger.kernel.org>,
        Ravi Shankar <quic_rshankar@quicinc.com>,
        Vishal Verma <quic_vishverm@quicinc.com>,
        Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>
Subject: [PATCH v6 3/3] arm64: dts: qcom: monaco-evk-camera: Add DT overlay
Date: Wed, 26 Nov 2025 13:40:57 +0530
Message-ID: <20251126081057.4191122-4-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251126081057.4191122-1-quic_vikramsa@quicinc.com>
References: <20251126081057.4191122-1-quic_vikramsa@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=I6tohdgg c=1 sm=1 tr=0 ts=6926b637 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=UCIxLOB1EF4ELhZYz8wA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA2NiBTYWx0ZWRfX1UtjZUewWrXB
 7XZRz4jCFZTuwf8J7IPJqouYG9wFCXwWlP0xRDRUOe3sWJxAmQvD8KhE3oVFX0+tgIEKBTSAycM
 fLnu5w8PWFhGFajusPaZtM4SUsk/19lalIFIm1FupjXh6tbVp9ifflSzkOtFWaAc2EOqqGaNBeY
 5xNOVpf8FaaCFBPMMpr2eICCWOoUeqTa+QSM17sYfFazD0STGKTJ3thqy/Tn12NeD2MwOUdRMgj
 n88G6vW+QqXTx/toASyWbfh0YXslnzBp8Je9ht2j9ymqfmsYFgGXPZCUSbKGlGLeE3oT/w7RF/H
 FFs6gLGsgVjnqZQlpQxoMDcnLj+QVFipI0k2S6Srw==
X-Proofpoint-ORIG-GUID: csKmrBvp-eZZsnAHyu9G3XUS47bT2dVf
X-Proofpoint-GUID: csKmrBvp-eZZsnAHyu9G3XUS47bT2dVf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 malwarescore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260066

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
 arch/arm64/boot/dts/qcom/Makefile             |  4 ++
 .../dts/qcom/monaco-evk-camera-imx577.dtso    | 67 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco-evk.dts       | 10 +++
 3 files changed, 81 insertions(+)
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
index 000000000000..351eb5ee70ba
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-evk-camera-imx577.dtso
@@ -0,0 +1,67 @@
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
diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index bb35893da73d..b1d34c1248d3 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -76,6 +76,16 @@ platform {
 			};
 		};
 	};
+
+	vreg_cam1_2p8: vreg-cam1-2p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_cam1_2p8";
+		startup-delay-us = <10000>;
+		enable-active-high;
+		gpio = <&tlmm 74 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&cam1_avdd_2v8_en_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &apps_rsc {
-- 
2.34.1


