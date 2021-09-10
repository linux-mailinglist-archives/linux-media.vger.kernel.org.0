Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 829EC40711A
	for <lists+linux-media@lfdr.de>; Fri, 10 Sep 2021 20:42:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232565AbhIJSnj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Sep 2021 14:43:39 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:46671 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232414AbhIJSnb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Sep 2021 14:43:31 -0400
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 6887624000A;
        Fri, 10 Sep 2021 18:42:17 +0000 (UTC)
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-staging@lists.linux.dev
Cc:     Yong Deng <yong.deng@magewell.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Helen Koike <helen.koike@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH 03/22] dt-bindings: sun6i-a31-mipi-dphy: Add optional direction property
Date:   Fri, 10 Sep 2021 20:41:28 +0200
Message-Id: <20210910184147.336618-4-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210910184147.336618-1-paul.kocialkowski@bootlin.com>
References: <20210910184147.336618-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Allwinner A31 MIPI D-PHY block supports both tx and rx directions,
although each instance of the block is meant to be used in one
direction only. There will typically be one instance for MIPI DSI and
one for MIPI CSI-2 (it seems unlikely to ever see a shared instance).

Describe the direction with a new allwinner,direction property.
For backwards compatibility, the property is optional and tx mode
should be assumed by default.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 .../bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml  | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml b/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml
index d0b541a461f3..303bbaf3b915 100644
--- a/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml
+++ b/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml
@@ -37,6 +37,18 @@ properties:
   resets:
     maxItems: 1
 
+  allwinner,direction:
+    $ref: '/schemas/types.yaml#/definitions/string'
+    description: |
+      Direction of the D-PHY:
+      - "rx" for receiving (e.g. when used with MIPI CSI-2);
+      - "tx" for transmitting (e.g. when used with MIPI DSI).
+
+      When the property is missing, "tx" direction is assumed.
+    oneOf:
+      - const: tx
+      - const: rx
+
 required:
   - "#phy-cells"
   - compatible
-- 
2.32.0

