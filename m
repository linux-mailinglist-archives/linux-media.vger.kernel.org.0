Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FA4032823B
	for <lists+linux-media@lfdr.de>; Mon,  1 Mar 2021 16:19:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237140AbhCAPTO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Mar 2021 10:19:14 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60448 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237153AbhCAPSu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Mar 2021 10:18:50 -0500
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:4cb:a870:39a1:f0e7:a696:18c8])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B26DD1F44E72;
        Mon,  1 Mar 2021 15:18:07 +0000 (GMT)
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com, ezequiel@collabora.com,
        mchehab@kernel.org, gregkh@linuxfoundation.org
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, devel@driverdev.osuosl.org,
        kernel@collabora.com, benjamin.gaignard@collabora.com
Subject: [PATCH v3 2/5] dt-bindings: media: IMX8MQ VPU: document reset usage
Date:   Mon,  1 Mar 2021 16:17:51 +0100
Message-Id: <20210301151754.104749-3-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210301151754.104749-1-benjamin.gaignard@collabora.com>
References: <20210301151754.104749-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document IMX8MQ VPU bindings to add the phandle to the reset driver.

Provide an independent reset driver allow to the both VPUs to share
their control/reset hardware block. The reset driver replace what
was previously done be using the 'ctrl' registers inside the driver.

This breaks the compatibility between DTB and kernel but the driver
is still in staging directory and limited to IMX8MQ SoC.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
version 3:
- Fix error in VPU example node

 .../devicetree/bindings/media/nxp,imx8mq-vpu.yaml  | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
index 762be3f96ce9..fd53a4e43572 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
@@ -18,13 +18,12 @@ properties:
     const: nxp,imx8mq-vpu
 
   reg:
-    maxItems: 3
+    maxItems: 2
 
   reg-names:
     items:
       - const: g1
       - const: g2
-      - const: ctrl
 
   interrupts:
     maxItems: 2
@@ -46,6 +45,9 @@ properties:
   power-domains:
     maxItems: 1
 
+  resets:
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -54,6 +56,7 @@ required:
   - interrupt-names
   - clocks
   - clock-names
+  - resets
 
 additionalProperties: false
 
@@ -61,13 +64,13 @@ examples:
   - |
         #include <dt-bindings/clock/imx8mq-clock.h>
         #include <dt-bindings/interrupt-controller/arm-gic.h>
+        #include <dt-bindings/reset/imx8mq-vpu-reset.h>
 
         vpu: video-codec@38300000 {
                 compatible = "nxp,imx8mq-vpu";
                 reg = <0x38300000 0x10000>,
-                      <0x38310000 0x10000>,
-                      <0x38320000 0x10000>;
-                reg-names = "g1", "g2", "ctrl";
+                      <0x38310000 0x10000>;
+                reg-names = "g1", "g2";
                 interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
                              <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
                 interrupt-names = "g1", "g2";
@@ -76,4 +79,5 @@ examples:
                          <&clk IMX8MQ_CLK_VPU_DEC_ROOT>;
                 clock-names = "g1", "g2", "bus";
                 power-domains = <&pgc_vpu>;
+                resets = <&vpu_reset IMX8MQ_RESET_VPU_RESET_G1>;
         };
-- 
2.25.1

