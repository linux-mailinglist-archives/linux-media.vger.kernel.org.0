Return-Path: <linux-media+bounces-39704-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04613B23B4C
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 23:52:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63ADA6E7CF0
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 21:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B316A2E8DEC;
	Tue, 12 Aug 2025 21:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Wj6/L0GO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF90C2E8899;
	Tue, 12 Aug 2025 21:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755035315; cv=none; b=c+PJ9PMflSjhoGejzky9lrKKAE+yX7OzW/T5ehBYvA3i87Z6cRkjRwZz/7s7Ah0LcEElsBanaSUU05BsAOH9DJI22kdWBF0WlPbabKsfr52dAr0q1HiYdRPlmLm8U6PNsSAXz6Bi+OoPY5mBg2pMj6+XOjDJUdHnkaQD3nYe3J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755035315; c=relaxed/simple;
	bh=AtdXIKua/INaYV+49Ae7n8dhujiaT3BXrg7Ye9V+l9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l1b+ivJ0YHZVbDIU5gvI4gKCT3CmopWUZ5X1fXwzDd0oFmMbDvP767UbLP305f0VN5j8LX/2wLiDeaUcQKcjJOKxf4R7rARLrZnJU+7uDfYreOc2Gr9WxDXyonVJpP0psiBnkHYZn0amvs+J5aojnCyux/MRPeGZ3I38oVsrVW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Wj6/L0GO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 5FD151123;
	Tue, 12 Aug 2025 23:47:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755035259;
	bh=AtdXIKua/INaYV+49Ae7n8dhujiaT3BXrg7Ye9V+l9Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Wj6/L0GOkEIwXWXI0wmTY8NIJjxz5Tan2wtm2luLZ6o7ottttzZRdK0/NBVLkwaeQ
	 N1cWJAYfEIiHx78ySSplpTrA9fC9W4UXOXc7FFX/6VyDyc3sqNZLzh2BbrVzFyu5Al
	 2l5LmBqFQXwrW3nYTUUp+wJwUFqRqLrIyjFKv85s=
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
Subject: [PATCH v2 68/72] ARM: dts: nxp: imx6qdl-pico: Replace clock-frequency in camera sensor node
Date: Wed, 13 Aug 2025 00:46:16 +0300
Message-ID: <20250812214620.30425-69-laurent.pinchart@ideasonboard.com>
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
 arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi
index c39a9ebdaba1..2ad1c030f51b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi
@@ -233,7 +233,9 @@ camera@3c {
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


