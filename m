Return-Path: <linux-media+bounces-40703-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 17587B30A63
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 02:29:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 71B53B62BE9
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 00:27:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC00928E0F;
	Fri, 22 Aug 2025 00:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KsZ4uM0E"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66D01B808;
	Fri, 22 Aug 2025 00:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755822504; cv=none; b=Am3nX4ogu8/unBwHq42EQvsPp0K4CrHlV+KzvOatLpyJk9A0voXGZtJrJof2g1VaE8qDfxUSWFd1Y50kzNSXewIvbCaRd5e3GhD8H+0Fn9QKYLLc673r/Z5aaABP4++0149osgicrg4uptHmqDw0AedIISDgBdc7J+cmVWYNKhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755822504; c=relaxed/simple;
	bh=YuNXzrNIPIFJModivjHon25HApCbkHH/knuo3W43MdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nQggykYwF4nXPcxt809Y0hbwVXa5kiyomeoiuUDmkQjuzblW3zYeUBZeLNim9F2FQxp73XQRY6YiVUDgPg5KqKOABxaqBJwgfdRMv9vwmq0gxxKQiJ4EBm47NCiyCvXzbpZKPux4gk+5YDOkiNUyMT8yzAUV/FN1kjpfLaKXccs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KsZ4uM0E; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 1133EE45;
	Fri, 22 Aug 2025 02:27:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755822439;
	bh=YuNXzrNIPIFJModivjHon25HApCbkHH/knuo3W43MdU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KsZ4uM0EesReoByhqcbUykBKxA6sLmkqVVULhPU0im5W5pDITA/K301sI/CRIuX2a
	 XVw8TezN+zz1cNQEC+ufaVnpjnWadoZYU5O9RpQ0PGhJhj7ouu3B7nTLQAu+DQR35B
	 4oRLYdXsGN5MGLV5HiYkKnr1SVw+ET+YbVbMuynM=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Inbaraj E <inbaraj.e@samsung.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Martin Kepplinger <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Purism Kernel Team <kernel@puri.sm>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 13/13] arm64: dts: imx8mp: Specify the number of channels for CSI-2 receivers
Date: Fri, 22 Aug 2025 03:27:33 +0300
Message-ID: <20250822002734.23516-14-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250822002734.23516-1-laurent.pinchart@ideasonboard.com>
References: <20250822002734.23516-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CSI-2 receivers in the i.MX8MP have 3 output channels. Specify this
in the device tree, to enable support for more than one channel.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
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


