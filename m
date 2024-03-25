Return-Path: <linux-media+bounces-7769-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CC388AA36
	for <lists+linux-media@lfdr.de>; Mon, 25 Mar 2024 17:53:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9D301C2487F
	for <lists+linux-media@lfdr.de>; Mon, 25 Mar 2024 16:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E4A61BC3C;
	Mon, 25 Mar 2024 15:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="i3uvpi9f"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD8D101D5;
	Mon, 25 Mar 2024 15:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711379630; cv=none; b=o/ZDbxsO43mYK8AXUJHBXhQSFmiu0WnPEJ4F5t6gsfNBOxzl8ZBSBE6yafEEe0MMbdRvH0KQf7CU64MG0TTEyrmCaBsumYZTW5RvPgt9FtQfDef3MnrYOuhKB7AziV9GF0xncXY4kGBWHCcS3xVQwjOAxCp0x50N/IDr6lfOnP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711379630; c=relaxed/simple;
	bh=3uPvbNRHAhs17uFcvUHw7IKbBmJj9QupzcwrE+nbTX4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JGCwCkhksO5vKjSvp8YMfF3Fz9q32yRhfG9tak2/8mIcVd+sY+uH/RoLM2t+11Z+hS1rzFuBFRrlYrDKM/7thAIHbpRvnRo09zJj3w6O4rarLdlm/Y4WdR/+2J0IWYrBR2mTVUQhHfzNhLQs1dRG/uMXWSjlVDtwKzfegduztX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=i3uvpi9f; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B81747E4;
	Mon, 25 Mar 2024 16:13:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711379594;
	bh=3uPvbNRHAhs17uFcvUHw7IKbBmJj9QupzcwrE+nbTX4=;
	h=From:To:Cc:Subject:Date:From;
	b=i3uvpi9ff78eMsxQHbznCESvJI2E2jeIIc8OepKQH8uUTRDvHXPjmDwimNAiBJe8B
	 6QFhznAcQNF/ey+wHnzwaGxqe6J6419/ZpFgc3XS1w1EGnuESfKcacHh2MNJ2yTTYq
	 QhoJlAwhJ4gNyyLZWXfyB00AtouSBnj9Ixj0uUmw=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Paul Elder <paul.elder@ideasonboard.com>,
	Adam Ford <aford173@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Marek Vasut <marex@denx.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v2] arm64: dts: imx8mp: Add DT nodes for the two ISPs
Date: Mon, 25 Mar 2024 17:13:39 +0200
Message-ID: <20240325151339.19041-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Elder <paul.elder@ideasonboard.com>

The ISP supports both CSI and parallel interfaces, where port 0
corresponds to the former and port 1 corresponds to the latter. Since
the i.MX8MP's ISPs are connected by the parallel interface to the CSI
receiver, set them both to port 1.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v1:

- Fix clock ordering
- Add #address-cells and #size-cells to ports nodes
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 50 +++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index bfc5c81a5bd4..1d2670b91b53 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1616,6 +1616,56 @@ isi_in_1: endpoint {
 				};
 			};
 
+			isp_0: isp@32e10000 {
+				compatible = "fsl,imx8mp-isp";
+				reg = <0x32e10000 0x10000>;
+				interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk IMX8MP_CLK_MEDIA_ISP_ROOT>,
+					 <&clk IMX8MP_CLK_MEDIA_AXI_ROOT>,
+					 <&clk IMX8MP_CLK_MEDIA_APB_ROOT>;
+				clock-names = "isp", "aclk", "hclk";
+				assigned-clocks = <&clk IMX8MP_CLK_MEDIA_ISP>;
+				assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_500M>;
+				assigned-clock-rates = <500000000>;
+				power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_ISP>;
+				fsl,blk-ctrl = <&media_blk_ctrl 0>;
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@1 {
+						reg = <1>;
+					};
+				};
+			};
+
+			isp_1: isp@32e20000 {
+				compatible = "fsl,imx8mp-isp";
+				reg = <0x32e20000 0x10000>;
+				interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk IMX8MP_CLK_MEDIA_ISP_ROOT>,
+					 <&clk IMX8MP_CLK_MEDIA_AXI_ROOT>,
+					 <&clk IMX8MP_CLK_MEDIA_APB_ROOT>;
+				clock-names = "isp", "aclk", "hclk";
+				assigned-clocks = <&clk IMX8MP_CLK_MEDIA_ISP>;
+				assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_500M>;
+				assigned-clock-rates = <500000000>;
+				power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_ISP>;
+				fsl,blk-ctrl = <&media_blk_ctrl 1>;
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@1 {
+						reg = <1>;
+					};
+				};
+			};
+
 			dewarp: dwe@32e30000 {
 				compatible = "nxp,imx8mp-dw100";
 				reg = <0x32e30000 0x10000>;

base-commit: 4cece764965020c22cff7665b18a012006359095
-- 
Regards,

Laurent Pinchart


