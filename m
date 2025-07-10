Return-Path: <linux-media+bounces-37349-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 30173B00A67
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 19:49:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E2DB5C1BA1
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 17:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 569452F0C73;
	Thu, 10 Jul 2025 17:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mWgoqNmI"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFD1199BC;
	Thu, 10 Jul 2025 17:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169733; cv=none; b=PKKUZYkmEwjJ0K5S75cZmtmp5yBULmiFlG9NLBD8iCd2XEzFZYK4hnM2GL1hwzIwTKlqOPczyA4S6P/aRQFUrw//H0wKV9PBWd6kkBtrSJy3BZwGgM4jgQEYqro4HbbwAArFUz7IZR5va0vBEjeHRk6JF6Nm4WU7BB5LVLcMBDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169733; c=relaxed/simple;
	bh=AdTSV5ozpv8o4/9bxI6p1gy4ekYAcxlG51qRbTSXMs0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LtVj6HkYK+lqszGd3BURxyqn8nD3ljEQsCoov06wQj4mAJzoQzabII8wHvKozeakReFRLc3WtHMeTwHpiTKowMqcMWXD11v7c4XCzdUWsEQRRA5ZXkM9QPrtuPdxRGsRRwW/mssS8bh2o9qmAnumVy3CsLhijNxxKCD3KbH2TO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mWgoqNmI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 76F4CC0B;
	Thu, 10 Jul 2025 19:48:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752169699;
	bh=AdTSV5ozpv8o4/9bxI6p1gy4ekYAcxlG51qRbTSXMs0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mWgoqNmI0uJYgJ1ThI7K3SBODLXEBApWlXxTY2OWqg0AcSRSnZIpAiGkyCo5rJEGH
	 83JBzeaGcx3ow+Td+YFbfTXTbcbqrjp/byTCFjWj/P+Ljy7aBNj8sVWNtLBp5cnSI9
	 /nleBVvo8bG/z/b6PZPKnqVjQOYhC4/GnZg2kUOU=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
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
Subject: [PATCH 06/72] ARM: dts: nxp: imx6qdl-wandboard: Replace clock-frequency in camera sensor node
Date: Thu, 10 Jul 2025 20:47:02 +0300
Message-ID: <20250710174808.5361-7-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
References: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clock-frequency for camera sensors has been deprecated in favour of
the assigned-clocks and assigned-clock-rates properties. Replace it in
the device tree.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi
index 26489eccd5fb..e5ac78ffb31c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi
@@ -136,8 +136,11 @@ camera@3c {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_ov5645>;
 		reg = <0x3c>;
+
 		clocks = <&clks IMX6QDL_CLK_CKO2>;
-		clock-frequency = <24000000>;
+		assigned-clocks = <&clks IMX6QDL_CLK_CKO2>;
+		assigned-clock-rates = <24000000>;
+
 		vdddo-supply = <&reg_1p8v>;
 		vdda-supply = <&reg_2p8v>;
 		vddd-supply = <&reg_1p5v>;
-- 
Regards,

Laurent Pinchart


