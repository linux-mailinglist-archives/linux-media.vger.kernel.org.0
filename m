Return-Path: <linux-media+bounces-40508-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5269EB2E953
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 02:11:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37B0C5E31AD
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 00:10:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9462E1E260C;
	Thu, 21 Aug 2025 00:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="T2XwGjKY"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A9F155A30;
	Thu, 21 Aug 2025 00:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755735031; cv=none; b=rgGDznHzTV1ByIqeGw2iCY7BEH7kSwZoDyMrshWkw9QiUnDzF6dunC3aMu1IWhl/rg1R+Rnxu32hO5qa0myBlvtDmgBIHRoljDACWVPP00wiY5bKrJnyQ6ltMmBR4xogmtHBBfL1xb3VoP8BQb4K3OQp5/+LJPdcbcakpQXMKM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755735031; c=relaxed/simple;
	bh=0nzu8oC3ffmv9rpSEMOZQJ9N9DYkxzrSgeJVZpSNZ2k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KMaQf6pEsGvUdC+wTXC0J7uI9mwi75/tYz2F+WPnEc4+MmnoVQoTfShXVosbyPKKYUQIXWvL+iZ39wbgYgumdHmDIhGI2aL9FgD8OV7Dp6P/wRnhE5/x5RDfxnk/2Bt6SduU6bXniLNKCuX5Jr1r6zFfvf5aOJ8ciOeUkASL178=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=T2XwGjKY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 3ADE719E7;
	Thu, 21 Aug 2025 02:09:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755734968;
	bh=0nzu8oC3ffmv9rpSEMOZQJ9N9DYkxzrSgeJVZpSNZ2k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T2XwGjKY1G8EOe/98cekbYAiP7GM1P46xs9cuYTWxSO0nCW7AtJK51sGPNevOfihi
	 NJfDCBj1FN1ADZbDePxnigZ0/x12cbG95OuXLiEdBDU0MdZwL74UBaWcPihA981dvk
	 PwV+oZdzz1AQFR1OoxrbT9rEfU2pebkQWbagzOj4=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Isaac Scott <isaac.scott@ideasonboard.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 12/12] arm64: dts: imx8mp: Specify the number of channels for CSI-2 receivers
Date: Thu, 21 Aug 2025 03:09:44 +0300
Message-ID: <20250821000944.27849-13-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250821000944.27849-1-laurent.pinchart@ideasonboard.com>
References: <20250821000944.27849-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CSI-2 receivers in the i.MX8MP have 3 output channels. Specify this
in the device tree, to enable support for more than one channel in
drivers.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index bb24dba7338e..1e52840078df 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1764,6 +1764,7 @@ mipi_csi_0: csi@32e40000 {
 				assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_250M>,
 							 <&clk IMX8MP_CLK_24M>;
 				power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_MIPI_CSI2_1>;
+				fsl,num-channels = <3>;
 				status = "disabled";
 
 				ports {
@@ -1799,6 +1800,7 @@ mipi_csi_1: csi@32e50000 {
 				assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_250M>,
 							 <&clk IMX8MP_CLK_24M>;
 				power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_MIPI_CSI2_2>;
+				fsl,num-channels = <3>;
 				status = "disabled";
 
 				ports {
-- 
Regards,

Laurent Pinchart


