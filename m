Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D04B31B4CE
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:39:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229931AbhBOEjU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:39:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229865AbhBOEjR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:39:17 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5E89C061574;
        Sun, 14 Feb 2021 20:38:36 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7E678B23;
        Mon, 15 Feb 2021 05:28:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363339;
        bh=dkUcbSASE8kKdW5tAslf11E3bkk57qh8CaJdS74b7O4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=r+o1xIm3ddW1R80UgkY2F5hv9ViV5b57W2KbM8TqROz8pjr0K5HUZzjM0jNqLETSe
         W5rHsAVpK1KI4eXvZG6AsK4VqY958FXW2FyrfZzVlW7bYSlQniGGImjURZSlzm2w/r
         YBfRPH+m8jg2eCIMTJ+rAh7gLoWdRZ+NZGVicYG0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v2 61/77] dt-bindings: media: nxp,imx7-mipi-csi2: Expand descriptions
Date:   Mon, 15 Feb 2021 06:27:25 +0200
Message-Id: <20210215042741.28850-62-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Expand the description of the binding itself and of individual
properties to include additional information that may not be immediately
appartent from reading the reference manual. Drop the last sentence of
the phy-supply description that refers to the driver's implementation.

While at it, fix the capitalization of MIPI CSI-2 in the title.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../bindings/media/nxp,imx7-mipi-csi2.yaml    | 29 +++++++++++--------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
index 76fcc8d80ee3..471a5bf7eb76 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
@@ -4,14 +4,19 @@
 $id: http://devicetree.org/schemas/media/nxp,imx7-mipi-csi2.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: NXP i.MX7 Mipi CSI2
+title: NXP i.MX7 MIPI CSI-2 receiver
 
 maintainers:
   - Rui Miguel Silva <rmfrfs@gmail.com>
 
-description: |
-  This is the device node for the MIPI CSI-2 receiver core in i.MX7 soc. It is
-  compatible with previous version of samsung d-phy.
+description: |-
+  The NXP i.MX7 SoC family includes a MIPI CSI-2 receiver IP core, documented
+  as "CSIS V3.3". The IP core seems to originate from Samsung, and may be
+  compatible with some of the Exynos4 ad S5P SoCs.
+
+  While the CSI-2 receiver is separate from the MIPI D-PHY IP core, the PHY is
+  completely wrapped by the CSIS and doesn't expose a control interface of its
+  own. This binding thus covers both IP cores.
 
 properties:
   compatible:
@@ -24,8 +29,10 @@ properties:
     maxItems: 1
 
   clocks:
-    minItems: 3
-    maxItems: 3
+    items:
+      - description: The peripheral clock (a.k.a. APB clock)
+      - description: The external clock (optionally used as the pixel clock)
+      - description: The MIPI D-PHY clock
 
   clock-names:
     items:
@@ -37,16 +44,14 @@ properties:
     maxItems: 1
 
   phy-supply:
-    description:
-      Phandle to a regulator that provides power to the PHY. This
-      regulator will be managed during the PHY power on/off sequence.
+    description: The MIPI D-PHY digital power supply
 
   resets:
-    maxItems: 1
+    items:
+      - description: MIPI D-PHY slave reset
 
   clock-frequency:
-    description:
-      The IP main (system bus) clock frequency in Hertz
+    description: The desired external clock ("wrap") frequency, in Hz
     default: 166000000
 
   ports:
-- 
Regards,

Laurent Pinchart

