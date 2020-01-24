Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 200521491C7
	for <lists+linux-media@lfdr.de>; Sat, 25 Jan 2020 00:21:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387584AbgAXXUo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jan 2020 18:20:44 -0500
Received: from mailoutvs4.siol.net ([185.57.226.195]:37390 "EHLO mail.siol.net"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387425AbgAXXUk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jan 2020 18:20:40 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Zimbra) with ESMTP id D4B425228E7;
        Sat, 25 Jan 2020 00:20:37 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta12.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta12.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id ZwZR8UCKFtR8; Sat, 25 Jan 2020 00:20:37 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Zimbra) with ESMTPS id 7B09F5228CF;
        Sat, 25 Jan 2020 00:20:37 +0100 (CET)
Received: from localhost.localdomain (cpe-194-152-20-232.static.triera.net [194.152.20.232])
        (Authenticated sender: 031275009)
        by mail.siol.net (Zimbra) with ESMTPSA id 250595228E7;
        Sat, 25 Jan 2020 00:20:35 +0100 (CET)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mripard@kernel.org, wens@csie.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        mturquette@baylibre.com, sboyd@kernel.org,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: [PATCH 5/8] media: dt-bindings: media: Add Allwinner A83T Rotate driver
Date:   Sat, 25 Jan 2020 00:20:11 +0100
Message-Id: <20200124232014.574989-6-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200124232014.574989-1-jernej.skrabec@siol.net>
References: <20200124232014.574989-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some Allwinner SoCs like A83T and A64 contain rotate core which can
rotate and flip images.

Add a binding for it.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 .../allwinner,sun8i-a83t-de2-rotate.yaml      | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun=
8i-a83t-de2-rotate.yaml

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun8i-a83t=
-de2-rotate.yaml b/Documentation/devicetree/bindings/media/allwinner,sun8=
i-a83t-de2-rotate.yaml
new file mode 100644
index 000000000000..75196d11da58
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/allwinner,sun8i-a83t-de2-ro=
tate.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/allwinner,sun8i-a83t-de2-rotate=
.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A83T DE2 Rotate Device Tree Bindings
+
+maintainers:
+  - Jernej Skrabec <jernej.skrabec@siol.net>
+  - Chen-Yu Tsai <wens@csie.org>
+  - Maxime Ripard <mripard@kernel.org>
+
+description: |-
+  The Allwinner A83T and A64 have a rotation core used for
+  rotating and flipping images.
+
+properties:
+  compatible:
+    oneOf:
+      - const: allwinner,sun8i-a83t-de2-rotate
+      - items:
+        - const: allwinner,sun50i-a64-de2-rotate
+        - const: allwinner,sun8i-a83t-de2-rotate
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Rotate interface clock
+      - description: Rotate module clock
+
+  clock-names:
+    items:
+      - const: bus
+      - const: mod
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/sun8i-de2.h>
+    #include <dt-bindings/reset/sun8i-de2.h>
+
+    rotate: rotate@1020000 {
+        compatible =3D "allwinner,sun8i-a83t-de2-rotate";
+        reg =3D <0x1020000 0x10000>;
+        interrupts =3D <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
+        clocks =3D <&display_clocks CLK_BUS_ROT>,
+                 <&display_clocks CLK_ROT>;
+        clock-names =3D "bus",
+                      "mod";
+        resets =3D <&display_clocks RST_ROT>;
+    };
+
+...
--=20
2.25.0

