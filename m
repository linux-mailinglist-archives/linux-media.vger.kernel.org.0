Return-Path: <linux-media+bounces-23589-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE24F9F4CAB
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 14:45:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8EBD2188DB79
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 13:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 582F01F63E8;
	Tue, 17 Dec 2024 13:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JWp/5IqV"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7B61F63C5;
	Tue, 17 Dec 2024 13:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734442856; cv=none; b=YQ8KI7OfIgbtWoF63i0mkhriLftNAwE25XodTJVS6PkK96aEw3t/OP+7OjF0Ueijz9mCaz0oKRz6C8Fak651eOb/V2RtKLmXkj0D+kGv5nJdPPpuN2mBtImFj4cz35FQ6LaMAJE/uhL25QWp+qXdDEN5vsQa2YG2fD2uELnDFzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734442856; c=relaxed/simple;
	bh=kBImaKDjJZkGm4eskNoqbCanWY/xP3Twh4nsX8ZGNGM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uu8cohelllh/uoNd4SpUTqwQQZX4pnwfYGfKZoPJ9RsfmRdjf8ZRm4QseTXcHTtWUtWrCy+i9m5mifvg6qLQoi7iB1YCG7ZbEtqMiTYKDaj2UbHughsnnbR29C5WA2ErO2IxOJ0LZWSxLgDy5rzzAM9OQ91OaEdlpLqZRRbb6P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JWp/5IqV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHB2VGQ002932;
	Tue, 17 Dec 2024 13:40:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O+99q9XjXls973Ka0DVdg9XXw6YYWSF0HictcG73wjk=; b=JWp/5IqV9v4fG/Gg
	CKPfFAP4epDMmbDMRv/ECm7y/fyASBo3tqCPrNjazoCU3y6h8KCN7NPNnPvTj5Jq
	BkdS98fGydDxz+F01lqzvkQw2kur5pi92QJw6V1H4rOhwd4UuP0/rwdVXFkvKe/N
	rf3AcxvylzAzV9me3DuVF7kcYXvMTcISdaMbufcVR664eqol6Goc7yhApoTjNJJG
	7o49ntzpFlscMN4pKPHEM/5EZ3F/r5X0he/l8HdzcK9WvlDJppvQ4sEOeGPDtSSs
	JlxI0pohN6CewJANtYB8qDsJWt/4sVB9uqJgKHKd7ooi8Ef7QZBi7bctaxAQvLcf
	/EjNyg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43k8310d6g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 13:40:44 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BHDeibT029443
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 13:40:44 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 17 Dec 2024 05:40:35 -0800
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
        <kernel@quicinc.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v9 4/4] arm64: dts: qcom: qcs6490-rb3gen2-vision-mezzanine: Add vision mezzanine
Date: Tue, 17 Dec 2024 19:09:55 +0530
Message-ID: <20241217133955.946426-5-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241217133955.946426-1-quic_vikramsa@quicinc.com>
References: <20241217133955.946426-1-quic_vikramsa@quicinc.com>
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
X-Proofpoint-GUID: IfMNLodiVYElQG-_CkP5B8EV6ymyY3Vp
X-Proofpoint-ORIG-GUID: IfMNLodiVYElQG-_CkP5B8EV6ymyY3Vp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 spamscore=0 bulkscore=0
 clxscore=1015 adultscore=0 malwarescore=0 impostorscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170109

The Vision Mezzanine for the RB3 ships with an imx577 camera sensor.
Enable the IMX577 on the vision mezzanine.

An example media-ctl pipeline for the imx577 is:

media-ctl --reset
media-ctl -v -V '"imx577 '19-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
media-ctl -V '"msm_csiphy3":0[fmt:SRGGB10/4056x3040]'
media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
media-ctl -l '"msm_csiphy3":1->"msm_csid0":0[1]'
media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'

yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0

Signed-off-by: Hariram Purushothaman <quic_hariramp@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   4 +
 .../qcs6490-rb3gen2-vision-mezzanine.dtso     | 109 ++++++++++++++++++
 2 files changed, 113 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 4686f2a8ddd8..a7e88fcabded 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -115,6 +115,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs615-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
+
+qcs6490-rb3gen2-vision-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-vision-mezzanine.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-vision-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
new file mode 100644
index 000000000000..7782c4aee576
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+/*
+ * Camera Sensor overlay on top of rb3gen2 core kit.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/clock/qcom,camcc-sc7280.h>
+
+/dts-v1/;
+/plugin/;
+
+&camss {
+	vdda-phy-supply = <&vreg_l10c_0p88>;
+	vdda-pll-supply = <&vreg_l6b_1p2>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* The port index denotes CSIPHY id i.e. csiphy3 */
+		port@3 {
+			reg = <3>;
+
+			csiphy3_ep: endpoint {
+				clock-lanes = <7>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&imx577_ep>;
+			};
+		};
+	};
+};
+
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	camera@1a {
+		compatible = "sony,imx577";
+
+		reg = <0x1a>;
+
+		reset-gpios = <&tlmm 78 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default", "suspend";
+		pinctrl-0 = <&cam2_default>;
+		pinctrl-1 = <&cam2_suspend>;
+
+		clocks = <&camcc CAM_CC_MCLK3_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK3_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		dovdd-supply  = <&vreg_l18b_1p8>;
+		avdd-supply = <&vph_pwr>;
+		dvdd-supply = <&vph_pwr>;
+
+		port {
+			imx577_ep: endpoint {
+				clock-lanes = <7>;
+				link-frequencies = /bits/ 64 <600000000>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&csiphy3_ep>;
+			};
+		};
+	};
+};
+
+&tlmm {
+	cam2_default: cam2-default-state {
+		mclk-pins {
+			pins = "gpio67";
+			function = "cam_mclk";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		rst-pins {
+			pins = "gpio78";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	cam2_suspend: cam2-suspend-state {
+		mclk-pins {
+			pins = "gpio67";
+			function = "cam_mclk";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+
+		rst-pins {
+			pins = "gpio78";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-down;
+			output-low;
+		};
+	};
+};
-- 
2.25.1


