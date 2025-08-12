Return-Path: <linux-media+bounces-39706-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 164F8B23B39
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 23:51:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F3F918964E5
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 21:50:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 539292D0C75;
	Tue, 12 Aug 2025 21:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uQkn29Wr"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9902E0928;
	Tue, 12 Aug 2025 21:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755035318; cv=none; b=hEpSXniViNHBm47iM7bFELzoNiCtmW/dD7yM7MMObm5Se8S/uHEh9l+QQS98OK8l28P8eOTuxR3nSKWVfQDtuB9zcQ9PsnlN7ICgt5B+wKRWVCLnlsVU1bWJCV5CmtA+XjP0zaynCZnM/ILP5ia0F7DAiknZc4aHNiot6W5K/GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755035318; c=relaxed/simple;
	bh=0OlaEea1lG0aXrKFQ1HpJxMDx/BmsqbsHAOsGw3c/AA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=guv6rUHxtzMySrqMcy8lVGTMxhy67EBwgDaODgdBjC1vBvw4D4MWwVnccr6owrJPmrrtGnYUhMgxc0hApY1dgTwhiHtJq9abqrsUflooHsCPLI5vA8IqRJAjVtpvHcQvr61uSXyXqN9NXeU2IqFPif5acun+TsalwYqF51ApotM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uQkn29Wr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E025D4A4;
	Tue, 12 Aug 2025 23:47:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755035261;
	bh=0OlaEea1lG0aXrKFQ1HpJxMDx/BmsqbsHAOsGw3c/AA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uQkn29WrJRVhFueRdwJrlUMGpo84xHYfqGjWPf5HQWai0GSk8WNcs8jWEnTtDb2+4
	 kufuS1BI6b2UljF7cpTkswIX87D9oNLqSzLTu5hvHyMcRDHO/eSTla7coK8Kl0HnP1
	 4lq3tHYsmhb46wK1VPXxg52HovzrERCXPR0+Mi5c=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 69/72] ARM: dts: nxp: imx6qdl-wandboard: Replace clock-frequency in camera sensor node
Date: Wed, 13 Aug 2025 00:46:17 +0300
Message-ID: <20250812214620.30425-70-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250812214620.30425-1-laurent.pinchart@ideasonboard.com>
References: <20250812214620.30425-1-laurent.pinchart@ideasonboard.com>
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
This patch depends on "media: i2c: ov5645: Use V4L2 legacy sensor clock
helper", which we tentatively plan to merge for v6.18. It should
therefore be postponed to v6.19.

Changes since v1:

- Drop added blank line
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi
index 26489eccd5fb..f3aaca039953 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi
@@ -137,7 +137,9 @@ camera@3c {
 		pinctrl-0 = <&pinctrl_ov5645>;
 		reg = <0x3c>;
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


