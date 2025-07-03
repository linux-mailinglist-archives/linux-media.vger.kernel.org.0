Return-Path: <linux-media+bounces-36706-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF50AF800F
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 20:33:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 960CD4A1E48
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 18:33:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE9112F3620;
	Thu,  3 Jul 2025 18:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qwwzqZjc"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3366228A3E2;
	Thu,  3 Jul 2025 18:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751567593; cv=none; b=ZSnCxJ5OuRLeq154Gur+yqeBBl0B3fDGzVj1DhWJIfP3VJ7vjf2/2wJVlT1F8Vrdd0Gzh2ovzunfT9eoJNOex6MyBt8mxnn+W0ScRXPKR6qPu21b5OxCyAwe+qO9sz28VDENV0c7NHRvtRN66xe87qDIR/JfsO4jxMo5CYk/vms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751567593; c=relaxed/simple;
	bh=lnATMb/XmCNNMy1igSdCLxsZP2Vd/a/i5coedasJ6Ec=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RiFznfOxZn+ZcrMocce+s2D9803ISFSvahxuJshF2ubWiAL5iRHbkiOhAR2vlGONqMgToDHCJNJbXNW56FuFudtVhfqJOL4HzW5Rl2B1/MvEIXQ7+iPdEN7ozh9IQIKtT1wxeZUjhNpxD1RtvqiJK1Q+VnlWJ91dgqMu02cL9/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qwwzqZjc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0AAAC4AF09;
	Thu,  3 Jul 2025 18:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751567592;
	bh=lnATMb/XmCNNMy1igSdCLxsZP2Vd/a/i5coedasJ6Ec=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qwwzqZjcKtOl8/553fhUXtGV5cSS+O56najS82u0rLCWI5zFaQwv7KxGgmdECxS3U
	 s2dkH5ydHtL1Xrb/O4ydhNxlIcwhLzhYLJEK75Yudxr95MZRHdFMyT/FH9aUq9OYtZ
	 Lj4Gc4ESm9tQ1RCKRSeY1bmk/iF/oZbLqowhr0TVgrcBPr3mO3xtn/yXtcB6Yhy3nX
	 y4mbGrRkH7p8JaNBQ/TAhSYiX5iVSecnD78N1MfwLRCfWx/CTGTRCiZG3+d05TPVlk
	 OhIMHdeNtrbFiHQBTfgXD3J1C3AYtEEohNsePKJiThhvWfLsAZoJn7yGtefFj2E0sR
	 /35+V/uFd7Edg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF646C83F0A;
	Thu,  3 Jul 2025 18:33:12 +0000 (UTC)
From: Frank Li via B4 Relay <devnull+Frank.Li.nxp.com@kernel.org>
Date: Thu, 03 Jul 2025 14:33:08 -0400
Subject: [PATCH v2 3/4] arm64: dts: imx8: add parallel CSI node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-imx8qxp_pcam-v2-3-188be85f06f1@nxp.com>
References: <20250703-imx8qxp_pcam-v2-0-188be85f06f1@nxp.com>
In-Reply-To: <20250703-imx8qxp_pcam-v2-0-188be85f06f1@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751567591; l=2229;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=egvyIYm9Ny7RwG4VqCUmjTBkLSU8NimkbRJ5GJUfMCg=;
 b=0DiK8tKXGe724gjHRzMZk45Ar6ghYBLBifnXK2kF2u5SRCj3q649yBEdL/Rg9kJnjnsrMYMyP
 KvscQ92k649AaIVhdfok6kql5Di1O3TLWV46TiUjkLyRHXO0YE1oDIc
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-Endpoint-Received: by B4 Relay for Frank.Li@nxp.com/20240130 with
 auth_id=121
X-Original-From: Frank Li <Frank.Li@nxp.com>
Reply-To: Frank.Li@nxp.com

From: Frank Li <Frank.Li@nxp.com>

Add parallel CSI nodes.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
changes in v2
- update compatible string to match binding's change
---
 arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi    | 13 +++++++++++
 arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi | 27 +++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
index 2cf0f7208350a416d77b11140279d2f66f41498f..1f7bf9efdbca266fbda82d2bc84acd9a27ed0bd1 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
@@ -224,6 +224,19 @@ irqsteer_parallel: irqsteer@58260000 {
 		status = "disabled";
 	};
 
+	parallel_csi: csi@58261000 {
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
index 50015f8dd4e43b507c879479e7320cb58ec8bf74..60aa43c45d15c8b0c2c425be52ed79458d8c96b9 100644
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
+				remote-endpoint = <&parallel_csi_out>;
+			};
+		};
 	};
 };
 
@@ -94,3 +102,22 @@ &jpegenc {
 &mipi_csi_1 {
 	status = "disabled";
 };
+
+&parallel_csi {
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
+			parallel_csi_out: endpoint {
+				remote-endpoint = <&isi_in_4>;
+			};
+		};
+	};
+};

-- 
2.34.1



