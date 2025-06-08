Return-Path: <linux-media+bounces-34324-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90EDBAD162B
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 01:59:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC488169F23
	for <lists+linux-media@lfdr.de>; Sun,  8 Jun 2025 23:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAC9D2686AF;
	Sun,  8 Jun 2025 23:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CG0YQsTX"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18642676EC;
	Sun,  8 Jun 2025 23:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749427154; cv=none; b=L9kaLpt+iYeXEivZNzhQal48i0enxsPwRoTV2T5JMdHD8Axlmstz2D6cyI1XgSZ/Ua+GN7lHI4ZGc1HzEfr4q/QfsxLixRD5yFV6VqlBjVsoRWPWBAwcbKctJpvWz+ZB1wBRw4UiMGjeN9SkjXKnnxwU9PcoxZQodQ+zTper/gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749427154; c=relaxed/simple;
	bh=E95ExV+bpvvCIVTb6egsIEPSANnfBl29NVknNLvK4gc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cY4yFvjCz9J5+8JKqc93f3/LHuVns4HJNuE4LNCQi3Y8Gg7DofIYX+I7IzSxdqnCvJinghy1fDzsQJ15UdkPBU2JAlnvc32gL/qqCAG0RfcyU5nGZF2ZxUFLCr+2C5ZTTRyBEMGS/6u43pkTnT0RhuDNouXhBmqWyUNZVqFpFO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CG0YQsTX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C62461B24;
	Mon,  9 Jun 2025 01:58:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749427137;
	bh=E95ExV+bpvvCIVTb6egsIEPSANnfBl29NVknNLvK4gc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CG0YQsTXefyUzwPXyotM0vRPUKwDs0gs5gBcn+58wOs3QoyjO7+lUlNWzL06D08ZZ
	 4gZYzGpoVR4V/Xl3upkqB8T0mYT74tc6xlcrRBcIpfj7bJjrt1b2PCJwqo5Ppknexl
	 IUD6F6Rz4UcoHt/q6jZbHTdEzkZSn9FxMyok61C4=
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
Subject: [PATCH 7/8] arm64: dts: imx8mp: Specify the number of channels for CSI-2 receivers
Date: Mon,  9 Jun 2025 02:58:39 +0300
Message-ID: <20250608235840.23871-8-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250608235840.23871-1-laurent.pinchart@ideasonboard.com>
References: <20250608235840.23871-1-laurent.pinchart@ideasonboard.com>
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
index 95b3f250d363..c409a1d1e851 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1767,6 +1767,7 @@ mipi_csi_0: csi@32e40000 {
 				assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_250M>,
 							 <&clk IMX8MP_CLK_24M>;
 				power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_MIPI_CSI2_1>;
+				fsl,num-channels = <3>;
 				status = "disabled";
 
 				ports {
@@ -1802,6 +1803,7 @@ mipi_csi_1: csi@32e50000 {
 				assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_250M>,
 							 <&clk IMX8MP_CLK_24M>;
 				power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_MIPI_CSI2_2>;
+				fsl,num-channels = <3>;
 				status = "disabled";
 
 				ports {
-- 
Regards,

Laurent Pinchart


