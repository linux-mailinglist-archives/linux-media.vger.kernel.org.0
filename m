Return-Path: <linux-media+bounces-19233-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A136E9946B7
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 13:25:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 634A7285740
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 11:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7767E1D358F;
	Tue,  8 Oct 2024 11:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="i7yAk1Oa"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD0A1DFD81;
	Tue,  8 Oct 2024 11:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728386517; cv=none; b=jnRCLyXRqC2rTkPAiK0j5StPTK6xQC1q8cTRKNLeiLmHjYOC+UcLZ8aVJCIl24xjRxtjI35UC9eUKhJQku1t8RjelxOQJh6wTUzruHFbqETlgSKRWQIwrTqEoqi9iMdrxLUl1sP5KclwpcDpZEFt3q+YShlwWu4ruPajbrHR8r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728386517; c=relaxed/simple;
	bh=cgcJxZ/BnbqLOlYb484kEYrgr5+Q4Kj/e6xS+aF5RdI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=a9FD0INOAbiCVZhf8L6untCS07XrZdliP5BNaf+uD+RCUQgTxsxFWXTJIRVJvWTSiWkgzIMoaF3Hop9WSv6NdyViWXPBSVmtTgPaAuvFvYsuRC1Q01NQgAUDFJ6BwemiNqEicSdFXt8NM0Co8uohnH7ZkRFeVYkL8f6gfjOyQHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=i7yAk1Oa; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 498AG3GM021588;
	Tue, 8 Oct 2024 13:21:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	vgLEjAYfZVpFx+ZWcrg5cjH4WW3cKZZYI4R0NRcJctg=; b=i7yAk1OaSEv6FGgk
	YGbsy98LqvCujmHKggJx8dH3mNby4QxARdK42btyOngOH8kY5fE0RVfHmpMswNAG
	ccBfv11bafpf7BcfqJVebWQ9nTpcWxEgZtNl64OSxx0LQX9eJVosV+XnPEsaPhYt
	hJ8+yZYwUte/YNTUdXbflKMDFFZ7/XoWb6Pr9Mr0dpmTGsM67GQkQcmylsND77EB
	f7dn13aP1l/S5h0wHOaJediZpDGyXpytdOgJcOcpP9N14orP0w3uGEq9Kz+JMasc
	k7YFo2uWbJz4QZFKFlQsnZirfWHPWHqiwzo2KRWZeRfIdqen+NCNiwdbbK+XOrkU
	olK7fg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 422xv760rx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Oct 2024 13:21:40 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 529124005B;
	Tue,  8 Oct 2024 13:20:20 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BC4CA285A1C;
	Tue,  8 Oct 2024 13:18:22 +0200 (CEST)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 8 Oct
 2024 13:18:22 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 8 Oct 2024 13:18:17 +0200
Subject: [PATCH 15/15] arm64: dts: st: enable imx335/csi/dcmipp pipeline on
 stm32mp257f-ev1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241008-csi_dcmipp_mp25-v1-15-e3fd0ed54b31@foss.st.com>
References: <20241008-csi_dcmipp_mp25-v1-0-e3fd0ed54b31@foss.st.com>
In-Reply-To: <20241008-csi_dcmipp_mp25-v1-0-e3fd0ed54b31@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Hans Verkuil
	<hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Alain Volmat <alain.volmat@foss.st.com>
X-Mailer: b4 0.14.0
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Enable the camera pipeline with a imx335 sensor connected to the
dcmipp via the csi interface.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 87 ++++++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
index 214191a8322b..599af4801d82 100644
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
+	imx335_2v9: imx335-2v9 {
+		compatible = "regulator-fixed";
+		regulator-name = "imx335-avdd";
+		regulator-min-microvolt = <2900000>;
+		regulator-max-microvolt = <2900000>;
+		regulator-always-on;
+	};
+
+	imx335_1v8: imx335-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "imx335-ovdd";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	imx335_1v2: imx335-1v2 {
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
+				data-lanes = <0 1>;
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
@@ -81,6 +147,27 @@ &i2c2 {
 	i2c-scl-falling-time-ns = <13>;
 	clock-frequency = <400000>;
 	status = "okay";
+
+	imx335: imx335@1a {
+		compatible = "sony,imx335";
+		reg = <0x1a>;
+		clocks = <&clk_ext_camera>;
+		avdd-supply = <&imx335_2v9>;
+		ovdd-supply = <&imx335_1v8>;
+		dvdd-supply = <&imx335_1v2>;
+		reset-gpios = <&gpioi 7 (GPIO_ACTIVE_HIGH | GPIO_PUSH_PULL)>;
+		powerdown-gpios = <&gpioi 0 (GPIO_ACTIVE_HIGH | GPIO_PUSH_PULL)>;
+		status = "okay";
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
2.25.1


