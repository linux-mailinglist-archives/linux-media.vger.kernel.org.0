Return-Path: <linux-media+bounces-40065-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8417EB2984B
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 06:38:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 401B117DE51
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 04:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43D4E26A088;
	Mon, 18 Aug 2025 04:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Q0iR8iwY"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE74267F59
	for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 04:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755491871; cv=none; b=R94litU2cACt/SntKghMh3a5Q27Cu7pd+/fI71Vpfg8uDFPkb69UCBCHpa8emUKXbsODruh0LVg/nP8E3lIebpp2oeKUWDCZ2KmyZSl9DqWzvT+9qQNN7Ck+mQusOOa2AsJdgaodZ9UsMrlmW1gYnsiORvmsMZaetVtp0eYznm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755491871; c=relaxed/simple;
	bh=VGhnVLUVJc54GbFJKIbhRHJ5HA3DtK2j7iDhq6aLMcE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=HfTHpXhrR8/DIhxHI1/nZSuK5sax6KyltYJTv8yQaxFpClMe+409Y7LSzlDnhM0mJn4ca9Y1E3Vb4+7xnSnV+XhndL2t0eBTX7FJOiaLagwHUaWIlhJHt8pDX8roRZR6URsYQcSrFbruC87uazdMcmIExqR/Y/pMuip6Ox2wJOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Q0iR8iwY; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250818043746epoutp03afde8357ec3231633a74afe7db0f0ea4~cwo1NOEGw0819808198epoutp03k
	for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 04:37:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250818043746epoutp03afde8357ec3231633a74afe7db0f0ea4~cwo1NOEGw0819808198epoutp03k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755491866;
	bh=GSkdw64CntSwfouYp0vv8j2CxJaW7ckqGcXdVod6U8A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q0iR8iwYce8fBOG17084t9hJ58rI24N8XhqsovM5aeEhrKl48QvMmknz2bYsKyavE
	 CXsRNQCzvpO9YqAcf+DTQ7MET8yAGrj4glX5i3C8V4jAUJbTcXyFSFyF7WR85PVAn1
	 n79h0R2QmDXSOSIogM169FtTuTjZPxm7Ss1JfXxM=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250818043745epcas5p3ff89beef59ab75859d7e613b32ba3a25~cwozm5PwJ0972809728epcas5p38;
	Mon, 18 Aug 2025 04:37:45 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.89]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4c50Lw1cvdz6B9m7; Mon, 18 Aug
	2025 04:37:44 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250814141019epcas5p2f957b934d5b60d4649cf9c6abd6969d5~bp3l3t3B70487304873epcas5p2e;
	Thu, 14 Aug 2025 14:10:19 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250814141015epsmtip213875c3a71a7740663108afc82388f23~bp3iBPqAy1817818178epsmtip2l;
	Thu, 14 Aug 2025 14:10:15 +0000 (GMT)
From: Inbaraj E <inbaraj.e@samsung.com>
To: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org,
	s.nawrocki@samsung.com, s.hauer@pengutronix.de, shawnguo@kernel.org,
	cw00.choi@samsung.com, rmfrfs@gmail.com, laurent.pinchart@ideasonboard.com,
	martink@posteo.de, mchehab@kernel.org, linux-fsd@tesla.com, will@kernel.org,
	catalin.marinas@arm.com, pankaj.dubey@samsung.com, shradha.t@samsung.com,
	ravi.patel@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, alim.akhtar@samsung.com,
	linux-samsung-soc@vger.kernel.org, kernel@puri.sm, kernel@pengutronix.de,
	festevam@gmail.com, linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Inbaraj E <inbaraj.e@samsung.com>
Subject: [PATCH v2 04/12] arm64: dts: fsd: Add CSI nodes
Date: Thu, 14 Aug 2025 19:39:35 +0530
Message-ID: <20250814140943.22531-5-inbaraj.e@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250814140943.22531-1-inbaraj.e@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250814141019epcas5p2f957b934d5b60d4649cf9c6abd6969d5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250814141019epcas5p2f957b934d5b60d4649cf9c6abd6969d5
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
	<CGME20250814141019epcas5p2f957b934d5b60d4649cf9c6abd6969d5@epcas5p2.samsung.com>

There is a csi dma and csis interface that bundles together to allow
csi2 capture.

Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
---
 arch/arm64/boot/dts/tesla/fsd-evb.dts |  96 +++++
 arch/arm64/boot/dts/tesla/fsd.dtsi    | 552 ++++++++++++++++++++++++++
 2 files changed, 648 insertions(+)

diff --git a/arch/arm64/boot/dts/tesla/fsd-evb.dts b/arch/arm64/boot/dts/tesla/fsd-evb.dts
index 9ff22e1c8723..dcc9a138cdb9 100644
--- a/arch/arm64/boot/dts/tesla/fsd-evb.dts
+++ b/arch/arm64/boot/dts/tesla/fsd-evb.dts
@@ -130,3 +130,99 @@ &serial_0 {
 &ufs {
 	status = "okay";
 };
+
+&mipicsis0 {
+	status = "okay";
+};
+
+&mipicsis1 {
+	status = "okay";
+};
+
+&mipicsis2 {
+	status = "okay";
+};
+
+&mipicsis3 {
+	status = "okay";
+};
+
+&mipicsis4 {
+	status = "okay";
+};
+
+&mipicsis5 {
+	status = "okay";
+};
+
+&mipicsis6 {
+	status = "okay";
+};
+
+&mipicsis7 {
+	status = "okay";
+};
+
+&mipicsis8 {
+	status = "okay";
+};
+
+&mipicsis9 {
+	status = "okay";
+};
+
+&mipicsis10 {
+	status = "okay";
+};
+
+&mipicsis11 {
+	status = "okay";
+};
+
+&csis0 {
+	status = "okay";
+};
+
+&csis1 {
+	status = "okay";
+};
+
+&csis2 {
+	status = "okay";
+};
+
+&csis3 {
+	status = "okay";
+};
+
+&csis4 {
+	status = "okay";
+};
+
+&csis5 {
+	status = "okay";
+};
+
+&csis6 {
+	status = "okay";
+};
+
+&csis7 {
+	status = "okay";
+};
+
+&csis8 {
+	status = "okay";
+};
+
+&csis9 {
+	status = "okay";
+};
+
+&csis10 {
+	status = "okay";
+};
+
+&csis11 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/tesla/fsd.dtsi b/arch/arm64/boot/dts/tesla/fsd.dtsi
index a5ebb3f9b18f..a83503e9c502 100644
--- a/arch/arm64/boot/dts/tesla/fsd.dtsi
+++ b/arch/arm64/boot/dts/tesla/fsd.dtsi
@@ -493,6 +493,558 @@ clock_mfc: clock-controller@12810000 {
 			clock-names = "fin_pll";
 		};
 
+		mipicsis0: mipi-csis@12640000 {
+			compatible = "tesla,fsd-mipi-csi2";
+			reg = <0x0 0x12640000 0x0 0x124>;
+			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI0_0_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI0_0_IPCLKPORT_I_PCLK>;
+			clock-names = "aclk", "pclk";
+			samsung,syscon-csis = <&sysreg_cam 0x40c>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+
+					mipi_csis_0_out: endpoint {
+						remote-endpoint = <&csis_in_0>;
+					};
+				};
+			};
+		};
+
+		csis0: csis@12641000 {
+			compatible = "tesla,fsd-csis-media";
+			reg = <0x0 0x12641000 0x0 0x44c>;
+			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI0_0_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI0_0_IPCLKPORT_I_PCLK>,
+				<&clock_csi CAM_CSI_PLL>;
+			clock-names = "aclk", "pclk", "pll";
+			iommus = <&smmu_isp 0x0 0x0>;
+			status = "disabled";
+
+			port {
+				csis_in_0: endpoint {
+					remote-endpoint = <&mipi_csis_0_out>;
+				};
+			};
+		};
+
+		mipicsis1: mipi-csis@12650000 {
+			compatible = "tesla,fsd-mipi-csi2";
+			reg = <0x0 0x12650000 0x0 0x124>;
+			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI0_1_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI0_1_IPCLKPORT_I_PCLK>;
+			clock-names = "aclk", "pclk";
+			samsung,syscon-csis = <&sysreg_cam 0x40c>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+
+					mipi_csis_1_out: endpoint {
+						remote-endpoint = <&csis_in_1>;
+					};
+				};
+			};
+		};
+
+		csis1: csis@12651000 {
+			compatible = "tesla,fsd-csis-media";
+			reg = <0x0 0x12651000 0x0 0x44c>;
+			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI0_1_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI0_1_IPCLKPORT_I_PCLK>,
+				<&clock_csi CAM_CSI_PLL>;
+			clock-names = "aclk", "pclk", "pll";
+			iommus = <&smmu_isp 0x0 0x0>;
+			status = "disabled";
+
+			port {
+				csis_in_1: endpoint {
+					remote-endpoint = <&mipi_csis_1_out>;
+				};
+			};
+		};
+
+		mipicsis2: mipi-csis@12660000 {
+			compatible = "tesla,fsd-mipi-csi2";
+			reg = <0x0 0x12660000 0x0 0x124>;
+			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI0_2_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI0_2_IPCLKPORT_I_PCLK>;
+			clock-names = "aclk", "pclk";
+			samsung,syscon-csis = <&sysreg_cam 0x40c>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+
+					mipi_csis_2_out: endpoint {
+						remote-endpoint = <&csis_in_2>;
+					};
+				};
+			};
+		};
+
+		csis2: csis@12661000 {
+			compatible = "tesla,fsd-csis-media";
+			reg = <0x0 0x12661000 0x0 0x44c>;
+			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI0_2_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI0_2_IPCLKPORT_I_PCLK>,
+				<&clock_csi CAM_CSI_PLL>;
+			clock-names = "aclk", "pclk", "pll";
+			iommus = <&smmu_isp 0x0 0x0>;
+			status = "disabled";
+
+			port {
+				csis_in_2: endpoint {
+					remote-endpoint = <&mipi_csis_2_out>;
+				};
+			};
+		};
+
+		mipicsis3: mipi-csis@12670000 {
+			compatible = "tesla,fsd-mipi-csi2";
+			reg = <0x0 0x12670000 0x0 0x124>;
+			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI0_3_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI0_3_IPCLKPORT_I_PCLK>;
+			clock-names = "aclk", "pclk";
+			samsung,syscon-csis = <&sysreg_cam 0x40c>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+
+					mipi_csis_3_out: endpoint {
+						remote-endpoint = <&csis_in_3>;
+					};
+				};
+			};
+		};
+
+		csis3: csis@12671000 {
+			compatible = "tesla,fsd-csis-media";
+			reg = <0x0 0x12671000 0x0 0x44c>;
+			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI0_3_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI0_3_IPCLKPORT_I_PCLK>,
+				<&clock_csi CAM_CSI_PLL>;
+			clock-names = "aclk", "pclk", "pll";
+			iommus = <&smmu_isp 0x0 0x0>;
+			status = "disabled";
+
+			port {
+				csis_in_3: endpoint {
+					remote-endpoint = <&mipi_csis_3_out>;
+				};
+			};
+		};
+
+		mipicsis4: mipi-csis@12680000 {
+			compatible = "tesla,fsd-mipi-csi2";
+			reg = <0x0 0x12680000 0x0 0x124>;
+			interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI1_0_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI1_0_IPCLKPORT_I_PCLK>;
+			clock-names = "aclk", "pclk";
+			samsung,syscon-csis = <&sysreg_cam 0x40c>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+
+					mipi_csis_4_out: endpoint {
+						remote-endpoint = <&csis_in_4>;
+					};
+				};
+			};
+		};
+
+		csis4: csis@12681000 {
+			compatible = "tesla,fsd-csis-media";
+			reg = <0x0 0x12681000 0x0 0x44c>;
+			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI1_0_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI1_0_IPCLKPORT_I_PCLK>,
+				<&clock_csi CAM_CSI_PLL>;
+			clock-names = "aclk", "pclk", "pll";
+			iommus = <&smmu_isp 0x0 0x0>;
+			status = "disabled";
+
+			port {
+				csis_in_4: endpoint {
+					remote-endpoint = <&mipi_csis_4_out>;
+				};
+			};
+		};
+
+		mipicsis5: mipi-csis@12690000 {
+			compatible = "tesla,fsd-mipi-csi2";
+			reg = <0x0 0x12690000 0x0 0x124>;
+			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI1_1_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI1_1_IPCLKPORT_I_PCLK>;
+			clock-names = "aclk", "pclk";
+			samsung,syscon-csis = <&sysreg_cam 0x40c>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+
+					mipi_csis_5_out: endpoint {
+						remote-endpoint = <&csis_in_5>;
+					};
+				};
+			};
+		};
+
+		csis5: csis@12691000 {
+			compatible = "tesla,fsd-csis-media";
+			reg = <0x0 0x12691000 0x0 0x44c>;
+			interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI1_1_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI1_1_IPCLKPORT_I_PCLK>,
+				<&clock_csi CAM_CSI_PLL>;
+			clock-names = "aclk", "pclk", "pll";
+			iommus = <&smmu_isp 0x0 0x0>;
+			status = "disabled";
+
+			port {
+				csis_in_5: endpoint {
+					remote-endpoint = <&mipi_csis_5_out>;
+				};
+			};
+		};
+
+		mipicsis6: mipi-csis@126a0000 {
+			compatible = "tesla,fsd-mipi-csi2";
+			reg = <0x0 0x126a0000 0x0 0x124>;
+			interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI1_2_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI1_2_IPCLKPORT_I_PCLK>;
+			clock-names = "aclk", "pclk";
+			samsung,syscon-csis = <&sysreg_cam 0x40c>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+
+					mipi_csis_6_out: endpoint {
+						remote-endpoint = <&csis_in_6>;
+					};
+				};
+			};
+		};
+
+		csis6: csis@126a1000 {
+			compatible = "tesla,fsd-csis-media";
+			reg = <0x0 0x126a1000 0x0 0x44c>;
+			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI1_2_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI1_2_IPCLKPORT_I_PCLK>,
+				<&clock_csi CAM_CSI_PLL>;
+			clock-names = "aclk", "pclk", "pll";
+			iommus = <&smmu_isp 0x0 0x0>;
+			status = "disabled";
+
+			port {
+				csis_in_6: endpoint {
+					remote-endpoint = <&mipi_csis_6_out>;
+				};
+			};
+		};
+
+		mipicsis7: mipi-csis@126b0000 {
+			compatible = "tesla,fsd-mipi-csi2";
+			reg = <0x0 0x126b0000 0x0 0x124>;
+			interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI1_3_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI1_3_IPCLKPORT_I_PCLK>;
+			clock-names = "aclk", "pclk";
+			samsung,syscon-csis = <&sysreg_cam 0x40c>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+
+					mipi_csis_7_out: endpoint {
+						remote-endpoint = <&csis_in_7>;
+					};
+				};
+			};
+		};
+
+		csis7: csis@126b1000 {
+			compatible = "tesla,fsd-csis-media";
+			reg = <0x0 0x126b1000 0x0 0x44c>;
+			interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI1_3_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI1_3_IPCLKPORT_I_PCLK>,
+				<&clock_csi CAM_CSI_PLL>;
+			clock-names = "aclk", "pclk", "pll";
+			iommus = <&smmu_isp 0x0 0x0>;
+			status = "disabled";
+
+			port {
+				csis_in_7: endpoint {
+					remote-endpoint = <&mipi_csis_7_out>;
+				};
+			};
+		};
+
+		mipicsis8: mipi-csis@126c0000 {
+			compatible = "tesla,fsd-mipi-csi2";
+			reg = <0x0 0x126c0000 0x0 0x124>;
+			interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI2_0_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI2_0_IPCLKPORT_I_PCLK>;
+			clock-names = "aclk", "pclk";
+			samsung,syscon-csis = <&sysreg_cam 0x40c>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+
+					mipi_csis_8_out: endpoint {
+						remote-endpoint = <&csis_in_8>;
+					};
+				};
+			};
+		};
+
+		csis8: csis@126c1000 {
+			compatible = "tesla,fsd-csis-media";
+			reg = <0x0 0x126c1000 0x0 0x44c>;
+			interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI2_0_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI2_0_IPCLKPORT_I_PCLK>,
+				<&clock_csi CAM_CSI_PLL>;
+			clock-names = "aclk", "pclk", "pll";
+			iommus = <&smmu_isp 0x0 0x0>;
+			status = "disabled";
+
+			port {
+				csis_in_8: endpoint {
+					remote-endpoint = <&mipi_csis_8_out>;
+				};
+			};
+		};
+
+		mipicsis9: mipi-csis@126d0000 {
+			compatible = "tesla,fsd-mipi-csi2";
+			reg = <0x0 0x126d0000 0x0 0x124>;
+			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI2_1_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI2_1_IPCLKPORT_I_PCLK>;
+			clock-names = "aclk", "pclk";
+			samsung,syscon-csis = <&sysreg_cam 0x40c>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+
+					mipi_csis_9_out: endpoint {
+						remote-endpoint = <&csis_in_9>;
+					};
+				};
+			};
+		};
+
+		csis9: csis@126d1000 {
+			compatible = "tesla,fsd-csis-media";
+			reg = <0x0 0x126d1000 0x0 0x44c>;
+			interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI2_1_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI2_1_IPCLKPORT_I_PCLK>,
+				<&clock_csi CAM_CSI_PLL>;
+			clock-names = "aclk", "pclk", "pll";
+			iommus = <&smmu_isp 0x0 0x0>;
+			status = "disabled";
+
+			port {
+				csis_in_9: endpoint {
+					remote-endpoint = <&mipi_csis_9_out>;
+				};
+			};
+		};
+
+		mipicsis10: mipi-csis@126e0000 {
+			compatible = "tesla,fsd-mipi-csi2";
+			reg = <0x0 0x126e0000 0x0 0x124>;
+			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI2_2_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI2_2_IPCLKPORT_I_PCLK>;
+			clock-names = "aclk", "pclk";
+			samsung,syscon-csis = <&sysreg_cam 0x40c>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+
+					mipi_csis_10_out: endpoint {
+						remote-endpoint = <&csis_in_10>;
+					};
+				};
+			};
+		};
+
+		csis10: csis@126e1000 {
+			compatible = "tesla,fsd-csis-media";
+			reg = <0x0 0x126e1000 0x0 0x44c>;
+			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI2_2_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI2_2_IPCLKPORT_I_PCLK>,
+				<&clock_csi CAM_CSI_PLL>;
+			clock-names = "aclk", "pclk", "pll";
+			iommus = <&smmu_isp 0x0 0x0>;
+			status = "disabled";
+
+			port {
+				csis_in_10: endpoint {
+					remote-endpoint = <&mipi_csis_10_out>;
+				};
+			};
+		};
+
+		mipicsis11: mipi-csis@126f0000 {
+			compatible = "tesla,fsd-mipi-csi2";
+			reg = <0x0 0x126f0000 0x0 0x124>;
+			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI2_3_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI2_3_IPCLKPORT_I_PCLK>;
+			clock-names = "aclk", "pclk";
+			samsung,syscon-csis = <&sysreg_cam 0x40c>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+
+					mipi_csis_11_out: endpoint {
+						remote-endpoint = <&csis_in_11>;
+					};
+				};
+			};
+		};
+
+		csis11: csis@126f1000 {
+			compatible = "tesla,fsd-csis-media";
+			reg = <0x0 0x126f1000 0x0 0x44c>;
+			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI2_3_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI2_3_IPCLKPORT_I_PCLK>,
+				<&clock_csi CAM_CSI_PLL>;
+			clock-names = "aclk", "pclk", "pll";
+			iommus = <&smmu_isp 0x0 0x0>;
+			status = "disabled";
+
+			port {
+				csis_in_11: endpoint {
+					remote-endpoint = <&mipi_csis_11_out>;
+				};
+			};
+		};
+
 		clock_peric: clock-controller@14010000 {
 			compatible = "tesla,fsd-clock-peric";
 			reg = <0x0 0x14010000 0x0 0x3000>;
-- 
2.49.0


