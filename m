Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0C2B134ACD
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2020 19:47:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730253AbgAHSqg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jan 2020 13:46:36 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59870 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730250AbgAHSqc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jan 2020 13:46:32 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 0022F2912EF
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-rockchip@lists.infradead.org
Cc:     mark.rutland@arm.com, devicetree@vger.kernel.org,
        eddie.cai.linux@gmail.com, mchehab@kernel.org, heiko@sntech.de,
        gregkh@linuxfoundation.org, andrey.konovalov@linaro.org,
        linux-kernel@vger.kernel.org, tfiga@chromium.org,
        robh+dt@kernel.org, hans.verkuil@cisco.com,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        joacim.zetterling@gmail.com, kernel@collabora.com,
        ezequiel@collabora.com, linux-media@vger.kernel.org,
        jacob-chen@iotwrt.com, linux-arm-kernel@lists.infradead.org,
        Helen Koike <helen.koike@collabora.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v13 09/11] media: staging: dt-bindings: add Rockchip MIPI RX D-PHY RX0 yaml bindings
Date:   Wed,  8 Jan 2020 15:44:52 -0300
Message-Id: <20200108184454.825725-10-helen.koike@collabora.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200108184454.825725-1-helen.koike@collabora.com>
References: <20200108184454.825725-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add yaml DT bindings for Rockchip MIPI D-PHY RX

This was tested and verified with:
mv drivers/staging/media/phy-rockchip-dphy-rx0/Documentation/devicetree/bindings/phy/rockchip-mipi-dphy-rx0.yaml  Documentation/devicetree/bindings/phy/
make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/phy/rockchip-mipi-dphy-rx0.yaml
make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/phy/rockchip-mipi-dphy-rx0.yaml

Signed-off-by: Helen Koike <helen.koike@collabora.com>
Reviewed-by: Rob Herring <robh@kernel.org>

---

Changes in v13:
- renamed with rx0 suffix
- improved clock description

Changes in v12:
- The commit replaces the following commit in previous series named
media: staging: dt-bindings: Document the Rockchip MIPI RX D-PHY bindings
This new patch adds yaml binding and was verified with
make dtbs_check and make dt_binding_check

Changes in v11: None
Changes in v10:
- unsquash

Changes in v9:
- fix title division style
- squash
- move to staging

Changes in v8: None
Changes in v7:
- updated doc with new design and tested example

 .../bindings/phy/rockchip-mipi-dphy-rx0.yaml  | 76 +++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 drivers/staging/media/phy-rockchip-dphy-rx0/Documentation/devicetree/bindings/phy/rockchip-mipi-dphy-rx0.yaml

diff --git a/drivers/staging/media/phy-rockchip-dphy-rx0/Documentation/devicetree/bindings/phy/rockchip-mipi-dphy-rx0.yaml b/drivers/staging/media/phy-rockchip-dphy-rx0/Documentation/devicetree/bindings/phy/rockchip-mipi-dphy-rx0.yaml
new file mode 100644
index 000000000000..5dacece35702
--- /dev/null
+++ b/drivers/staging/media/phy-rockchip-dphy-rx0/Documentation/devicetree/bindings/phy/rockchip-mipi-dphy-rx0.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/rockchip-mipi-dphy-rx0.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip SoC MIPI RX0 D-PHY Device Tree Bindings
+
+maintainers:
+  - Helen Koike <helen.koike@collabora.com>
+  - Ezequiel Garcia <ezequiel@collabora.com>
+
+description: |
+  The Rockchip SoC has a MIPI D-PHY bus with an RX0 entry which connects to
+  the ISP1 (Image Signal Processing unit v1.0) for CSI cameras.
+
+properties:
+  compatible:
+    const: rockchip,rk3399-mipi-dphy-rx0
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: MIPI D-PHY ref clock
+      - description: MIPI D-PHY RX0 cfg clock
+      - description: Video in/out general register file clock
+
+  clock-names:
+    items:
+      - const: dphy-ref
+      - const: dphy-cfg
+      - const: grf
+
+  '#phy-cells':
+    const: 0
+
+  power-domains:
+    description: Video in/out power domain.
+    maxItems: 1
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - '#phy-cells'
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+
+    /*
+     * MIPI D-PHY RX0 use registers in "general register files", it
+     * should be a child of the GRF.
+     *
+     * grf: syscon@ff770000 {
+     *  compatible = "rockchip,rk3399-grf", "syscon", "simple-mfd";
+     *  ...
+     * };
+     */
+
+    #include <dt-bindings/clock/rk3399-cru.h>
+    #include <dt-bindings/power/rk3399-power.h>
+
+    mipi_dphy_rx0: mipi-dphy-rx0 {
+        compatible = "rockchip,rk3399-mipi-dphy-rx0";
+        clocks = <&cru SCLK_MIPIDPHY_REF>,
+                 <&cru SCLK_DPHY_RX0_CFG>,
+                 <&cru PCLK_VIO_GRF>;
+        clock-names = "dphy-ref", "dphy-cfg", "grf";
+        power-domains = <&power RK3399_PD_VIO>;
+        #phy-cells = <0>;
+    };
-- 
2.24.0

