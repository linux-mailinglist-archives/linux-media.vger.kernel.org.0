Return-Path: <linux-media+bounces-2089-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E342380CA5E
	for <lists+linux-media@lfdr.de>; Mon, 11 Dec 2023 14:00:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CCD51C21280
	for <lists+linux-media@lfdr.de>; Mon, 11 Dec 2023 13:00:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E49263D3AC;
	Mon, 11 Dec 2023 13:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LfM0MBLh"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55EFCD1;
	Mon, 11 Dec 2023 05:00:13 -0800 (PST)
Received: from umang.jain (unknown [103.251.226.68])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 67275C58;
	Mon, 11 Dec 2023 13:59:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1702299565;
	bh=z/kiy682Dt+Hkip6mn8zt4qO+eGw8bGSkyh8qcwql68=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LfM0MBLhxg3j2w3rYKk5q/H2G70LXzKtypbsgoo/NCdpovsNsjZMfuFdvzbabrXyG
	 bacs4rFE+JjgBMyG3h9hE4gi7Z3PUIgtXGYzAB29vIkGV3nZ9t1La82Jub5p55wwab
	 MDbeMjwqQpLAJaF5/7BUiI2B1ZkTlOhtujrNpPpA=
From: Umang Jain <umang.jain@ideasonboard.com>
To: devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: "Paul J . Murphy" <paul.j.murphy@intel.com>,
	Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Wolfram Sang <wsa@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 1/7] media: dt-bindings: media: imx335: Add supply bindings
Date: Mon, 11 Dec 2023 18:29:43 +0530
Message-ID: <20231211125950.108092-2-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231211125950.108092-1-umang.jain@ideasonboard.com>
References: <20231211125950.108092-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kieran Bingham <kieran.bingham@ideasonboard.com>

Add the bindings for the supply references used on the IMX335.

Reviewed-by: Umang Jain <umang.jain@ideasonboard.com>
Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/media/i2c/sony,imx335.yaml  | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
index a167dcdb3a32..106c36ee966d 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
@@ -32,6 +32,15 @@ properties:
     description: Clock frequency from 6 to 27 MHz, 37.125MHz, 74.25MHz
     maxItems: 1
 
+  avdd-supply:
+    description: Analog power supply (2.9V)
+
+  ovdd-supply:
+    description: Interface power supply (1.8V)
+
+  dvdd-supply:
+    description: Digital power supply (1.2V)
+
   reset-gpios:
     description: Reference to the GPIO connected to the XCLR pin, if any.
     maxItems: 1
@@ -79,6 +88,10 @@ examples:
             assigned-clock-parents = <&imx335_clk_parent>;
             assigned-clock-rates = <24000000>;
 
+            avdd-supply = <&camera_vdda_2v9>;
+            ovdd-supply = <&camera_vddo_1v8>;
+            dvdd-supply = <&camera_vddd_1v2>;
+
             port {
                 imx335: endpoint {
                     remote-endpoint = <&cam>;
-- 
2.41.0


