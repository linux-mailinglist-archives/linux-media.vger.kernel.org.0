Return-Path: <linux-media+bounces-37152-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C98DAFD5B0
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 19:50:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E63017A4706
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 17:48:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEB392E7169;
	Tue,  8 Jul 2025 17:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KHhCoH00"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA922E5B11;
	Tue,  8 Jul 2025 17:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751996968; cv=none; b=QJp7qFrFdlSAGvcojDZYoEqiTkVVWLnEudyReQWhNc6d0Bqth1/BDL19v1vPyjDLjJLc2UZs3E12Q+52gXEpQKZLIcj+uOVdTr9LjuWliJA/uEYhN6AqnysW6e1Fn39A0XAzpyYcP9SIxZlEechg/ayaywTXkqyBdV3YpiWkda4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751996968; c=relaxed/simple;
	bh=HRR4zvG5SHpZnZ0aVbAilDa59MY8R7C1UOVkNz94BOI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BHaLMk+qSunOqnSr3Lh7pNY8JaxjipLPwARPAh+ND2V5//gF7ap0tH3Mx8YdY8YYBquaWtvnwbTDQGoZgvb1c6QYVJOkZJtsPsARHTauxkjVqmUXMOqcyAJ1NdI7PPh6LeFXQEAZhxKB5EvJHjXuKs+YG6H2eNIx89YHyT9zqZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KHhCoH00; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7A7C0C4CEFA;
	Tue,  8 Jul 2025 17:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751996967;
	bh=HRR4zvG5SHpZnZ0aVbAilDa59MY8R7C1UOVkNz94BOI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KHhCoH00jG0jbUPxmCWtC4svk9czMKVcwm3Mfol4HYlmQmZu6dQkb2497xREnbQyt
	 UR24qg/BEdYo7RExAbQoJf0q2ECTztFU6X4cYQJGL7lqoQBYMyip0CyCawpYNrX5tr
	 4JphmH96bMGlMykciTfy1bHQdw1QBaNQiZPWjqQb9QXnzIORTFJnrcZQE5Ugl76RSh
	 Ing+orOxJEidEpru1E/qODQCP7ZMjSqdMyUhqnPPUErIwVdvIKGLjfqUcH2+XbENQ0
	 CnezZSTG3NDN/397nre/By95aVOi2YhhQLSNPBfliG6kVOKO2vjzE8w/o5+55IIQtl
	 Dqcb5b47ko6uw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FB2AC83F09;
	Tue,  8 Jul 2025 17:49:27 +0000 (UTC)
From: Frank Li via B4 Relay <devnull+Frank.Li.nxp.com@kernel.org>
Date: Tue, 08 Jul 2025 13:48:44 -0400
Subject: [PATCH v3 3/4] arm64: dts: imx8: add camera parallel interface
 (CPI) node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-imx8qxp_pcam-v3-3-c8533e405df1@nxp.com>
References: <20250708-imx8qxp_pcam-v3-0-c8533e405df1@nxp.com>
In-Reply-To: <20250708-imx8qxp_pcam-v3-0-c8533e405df1@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751996966; l=2289;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=aH/tc3d4PpbdiPiq2EGQoCOvk2OgXV2HvNEasyEGlz0=;
 b=BI2lpu1ZlrcW1DUr2FJk1YuXoevdo4ljXtckwpQTo7KWeIAdlKo4I3+Q37917t3rbOzdSEONX
 xBUBZtbGbefBNaVAFAJC+nAv8gSOkazIEuw8/mvOmHOb+apVhSTno1P
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-Endpoint-Received: by B4 Relay for Frank.Li@nxp.com/20240130 with
 auth_id=121
X-Original-From: Frank Li <Frank.Li@nxp.com>
Reply-To: Frank.Li@nxp.com

From: Frank Li <Frank.Li@nxp.com>

Add camera parallel interface (CPI) node.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
changes in v4
- replace csi with cpi.

changes in v2
- update compatible string to match binding's change
---
 arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi    | 13 +++++++++++
 arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi | 27 +++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
index 2cf0f7208350a416d77b11140279d2f66f41498f..e321b0d62cce13ef999085fce7aff9ea2fd7fc21 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
@@ -224,6 +224,19 @@ irqsteer_parallel: irqsteer@58260000 {
 		status = "disabled";
 	};
 
+	parallel_cpi: cpi@58261000 {
+		compatible = "fsl,imx8qxp-pcif";
+		reg = <0x58261000 0x1000>;
+		clocks = <&pi0_pxl_lpcg IMX_LPCG_CLK_0>,
+			 <&pi0_ipg_lpcg IMX_LPCG_CLK_4>;
+		clock-names = "pixel", "ipg";
+		assigned-clocks = <&clk IMX_SC_R_PI_0 IMX_SC_PM_CLK_PER>;
+		assigned-clock-parents = <&clk IMX_SC_R_PI_0_PLL IMX_SC_PM_CLK_PLL>;
+		assigned-clock-rates = <160000000>;
+		power-domains = <&pd IMX_SC_R_PI_0>;
+		status = "disabled";
+	};
+
 	pi0_ipg_lpcg: clock-controller@58263004 {
 		compatible = "fsl,imx8qxp-lpcg";
 		reg = <0x58263004 0x4>;
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
index 50015f8dd4e43b507c879479e7320cb58ec8bf74..5b5efaedd403c040f1231ead02834bb3d16a9dd2 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
@@ -62,6 +62,14 @@ isi_in_2: endpoint {
 				remote-endpoint = <&mipi_csi0_out>;
 			};
 		};
+
+		port@4 {
+			reg = <4>;
+
+			isi_in_4: endpoint {
+				remote-endpoint = <&parallel_cpi_out>;
+			};
+		};
 	};
 };
 
@@ -94,3 +102,22 @@ &jpegenc {
 &mipi_csi_1 {
 	status = "disabled";
 };
+
+&parallel_cpi {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+		};
+
+		port@1 {
+			reg = <1>;
+
+			parallel_cpi_out: endpoint {
+				remote-endpoint = <&isi_in_4>;
+			};
+		};
+	};
+};

-- 
2.34.1



