Return-Path: <linux-media+bounces-23271-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E1D9EE2B4
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 10:22:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE1221606E0
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 09:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD599212FA3;
	Thu, 12 Dec 2024 09:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="k57Lu+Nk"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5060C2116ED;
	Thu, 12 Dec 2024 09:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733995238; cv=none; b=dXw25CpeDpAwTMvuQslrXy6J7i1YdGgUhqFh4DpRTxGAOBmWwiwYkFZApyzPM8R26yCQ0hQf0qua9Wd04i56N/2W2F93YWN9wHJgYq722iB8MCLfS86KPWiFv3mZzU4AH+OqrMYw63OUiWK9/BfexboyrWzCMLHOoMjotZyKRmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733995238; c=relaxed/simple;
	bh=IVKavr+K48iqxiFhfFBMeYJJlpEf7vHMlZR9ODob5i8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=awBGC12tS/PIrdFUe7kU0rNRa6gU9qxSI3+112v3UMic3w+yR0J3aXxmIq33vphwk18MW0Yp0pBZgh6HnmP49RxYaMsHP7fiG8WlbC7aO2ZxJfzakBEOUOLWyfYFxtOnt6+xIem98RlEQynemhq1fBH8xYDdwOXaS77JwzPt3Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=k57Lu+Nk; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC6PcM0025503;
	Thu, 12 Dec 2024 10:20:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	HjDi2PEX6tMG3AujQ/N2jgctUN3yYamP6j1mFZotwQA=; b=k57Lu+Nkn4AQpLR7
	W12vax/Wj7Ht3/SwpzZX2+QYUOqePP5ge5u2tr9QQOAHRZi8F93fon321x7tdVJ4
	cNE37EIz/MlN9CLwNCKUa4YyFgigJicxUXZBlPqgThqoF7cZAxkdv1wzMsPy8j1M
	rYbm6rkw0YIPAhXxkikbWjdDpXWKqgVB346Qrrt06jfXL5iVnqUb6FNvdsIcH7c4
	zb9MAB0sjoxPhR5HShKdHHtYX7K+jo4OBSgqMbWuEn1jieYgxgNi4tUrsHJ0NNpt
	yGGgEb3tijcqEY4fb69LNl+ZsRXwKFf61VCbfLq7OzrkmdlOzJmfBUMicF//nrqR
	bHeuzQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43ftj70qp0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 10:20:09 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8D07F40051;
	Thu, 12 Dec 2024 10:19:02 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5D3DE24FC03;
	Thu, 12 Dec 2024 10:18:12 +0100 (CET)
Received: from localhost (10.129.178.65) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 12 Dec
 2024 10:18:12 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Thu, 12 Dec 2024 10:17:39 +0100
Subject: [PATCH v4 15/15] arm64: dts: st: enable imx335/csi/dcmipp pipeline
 on stm32mp257f-ev1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241212-csi_dcmipp_mp25-v4-15-fbeb55a05ed7@foss.st.com>
References: <20241212-csi_dcmipp_mp25-v4-0-fbeb55a05ed7@foss.st.com>
In-Reply-To: <20241212-csi_dcmipp_mp25-v4-0-fbeb55a05ed7@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Sakari Ailus
	<sakari.ailus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp
 Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>, Hans
 Verkuil <hverkuil@xs4all.nl>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Alain Volmat <alain.volmat@foss.st.com>
X-Mailer: b4 0.14.1
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Enable the camera pipeline with a imx335 sensor connected to the
dcmipp via the csi interface.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

---

v2:
  - correct regulators & camera node names
  - removal of powerdown property within imx335 node
  - removal of useless status property within imx335 node
  - correct imx335 reset-gpio polarity
---
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 85 ++++++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
index 6f393b082789..a6a57cbcf730 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
@@ -27,6 +27,38 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	clocks {
+		clk_ext_camera: clk-ext-camera {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <24000000>;
+		};
+	};
+
+	imx335_2v9: regulator-2v9 {
+		compatible = "regulator-fixed";
+		regulator-name = "imx335-avdd";
+		regulator-min-microvolt = <2900000>;
+		regulator-max-microvolt = <2900000>;
+		regulator-always-on;
+	};
+
+	imx335_1v8: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "imx335-ovdd";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	imx335_1v2: regulator-1v2 {
+		compatible = "regulator-fixed";
+		regulator-name = "imx335-dvdd";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-always-on;
+	};
+
 	memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x1 0x0>;
@@ -50,6 +82,40 @@ &arm_wdt {
 	status = "okay";
 };
 
+&csi {
+	vdd-supply =  <&scmi_vddcore>;
+	vdda18-supply = <&scmi_v1v8>;
+	status = "okay";
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		port@0 {
+			reg = <0>;
+			csi_sink: endpoint {
+				remote-endpoint = <&imx335_ep>;
+				data-lanes = <1 2>;
+				bus-type = <4>;
+			};
+		};
+		port@1 {
+			reg = <1>;
+			csi_source: endpoint {
+				remote-endpoint = <&dcmipp_0>;
+			};
+		};
+	};
+};
+
+&dcmipp {
+	status = "okay";
+	port {
+		dcmipp_0: endpoint {
+			remote-endpoint = <&csi_source>;
+			bus-type = <4>;
+		};
+	};
+};
+
 &ethernet2 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&eth2_rgmii_pins_a>;
@@ -81,6 +147,25 @@ &i2c2 {
 	i2c-scl-falling-time-ns = <13>;
 	clock-frequency = <400000>;
 	status = "okay";
+
+	imx335: camera@1a {
+		compatible = "sony,imx335";
+		reg = <0x1a>;
+		clocks = <&clk_ext_camera>;
+		avdd-supply = <&imx335_2v9>;
+		ovdd-supply = <&imx335_1v8>;
+		dvdd-supply = <&imx335_1v2>;
+		reset-gpios = <&gpioi 7 (GPIO_ACTIVE_LOW | GPIO_PUSH_PULL)>;
+
+		port {
+			imx335_ep: endpoint {
+				remote-endpoint = <&csi_sink>;
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <594000000>;
+			};
+		};
+	};
 };
 
 &i2c8 {

-- 
2.34.1


