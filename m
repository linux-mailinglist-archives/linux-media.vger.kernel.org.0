Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46D87E262D
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2019 00:14:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436776AbfJWWN6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Oct 2019 18:13:58 -0400
Received: from mailoutvs31.siol.net ([185.57.226.222]:47625 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2436758AbfJWWNz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Oct 2019 18:13:55 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 2CF1E523303;
        Thu, 24 Oct 2019 00:13:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta09.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta09.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id 3cria4v5i2w4; Thu, 24 Oct 2019 00:13:51 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id C9DD8523102;
        Thu, 24 Oct 2019 00:13:51 +0200 (CEST)
Received: from localhost.localdomain (cpe-86-58-59-25.static.triera.net [86.58.59.25])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id 81ABC523303;
        Thu, 24 Oct 2019 00:13:49 +0200 (CEST)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mripard@kernel.org, wens@csie.org
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, mchehab@kernel.org,
        hverkuil@xs4all.nl, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-sunxi@googlegroups.com,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v5 4/6] dt-bindings: media: Add Allwinner H3 Deinterlace binding
Date:   Thu, 24 Oct 2019 00:13:30 +0200
Message-Id: <20191023221332.3674175-5-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191023221332.3674175-1-jernej.skrabec@siol.net>
References: <20191023221332.3674175-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Allwinner H3 Deinterlace core is used for deinterlacing interlaced video
content. Core can also be found on some later SoCs, like H5 and R40.

Acked-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 .../media/allwinner,sun8i-h3-deinterlace.yaml | 76 +++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun=
8i-h3-deinterlace.yaml

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun8i-h3-d=
einterlace.yaml b/Documentation/devicetree/bindings/media/allwinner,sun8i=
-h3-deinterlace.yaml
new file mode 100644
index 000000000000..2e40f700e84f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/allwinner,sun8i-h3-deinterl=
ace.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/allwinner,sun8i-h3-deinterlace.=
yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner H3 Deinterlace Device Tree Bindings
+
+maintainers:
+  - Jernej Skrabec <jernej.skrabec@siol.net>
+  - Chen-Yu Tsai <wens@csie.org>
+  - Maxime Ripard <mripard@kernel.org>
+
+description: |-
+  The Allwinner H3 and later has a deinterlace core used for
+  deinterlacing interlaced video content.
+
+properties:
+  compatible:
+    const: allwinner,sun8i-h3-deinterlace
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Deinterlace interface clock
+      - description: Deinterlace module clock
+      - description: Deinterlace DRAM clock
+
+  clock-names:
+    items:
+      - const: bus
+      - const: mod
+      - const: ram
+
+  resets:
+    maxItems: 1
+
+  interconnects:
+    maxItems: 1
+
+  interconnect-names:
+    const: dma-mem
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
+    #include <dt-bindings/clock/sun8i-h3-ccu.h>
+    #include <dt-bindings/reset/sun8i-h3-ccu.h>
+
+    deinterlace: deinterlace@1400000 {
+        compatible =3D "allwinner,sun8i-h3-deinterlace";
+        reg =3D <0x01400000 0x20000>;
+        clocks =3D <&ccu CLK_BUS_DEINTERLACE>,
+                 <&ccu CLK_DEINTERLACE>,
+                 <&ccu CLK_DRAM_DEINTERLACE>;
+        clock-names =3D "bus", "mod", "ram";
+        resets =3D <&ccu RST_BUS_DEINTERLACE>;
+        interrupts =3D <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
+        interconnects =3D <&mbus 9>;
+        interconnect-names =3D "dma-mem";
+    };
+
+...
--=20
2.23.0

