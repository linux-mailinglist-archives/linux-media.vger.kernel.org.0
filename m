Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D497A325FC2
	for <lists+linux-media@lfdr.de>; Fri, 26 Feb 2021 10:14:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230258AbhBZJNB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Feb 2021 04:13:01 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:54106 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230107AbhBZJMX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Feb 2021 04:12:23 -0500
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:4cb:a870:297a:447b:deb4:3f5c])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 21EB51F464CA;
        Fri, 26 Feb 2021 09:11:38 +0000 (GMT)
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com, ezequiel@collabora.com,
        mchehab@kernel.org, gregkh@linuxfoundation.org
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, devel@driverdev.osuosl.org,
        kernel@collabora.com, benjamin.gaignard@collabora.com
Subject: [PATCH v2 2/5] dt-bindings: media: IMX8MQ VPU: document reset usage
Date:   Fri, 26 Feb 2021 10:11:25 +0100
Message-Id: <20210226091128.14379-3-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210226091128.14379-1-benjamin.gaignard@collabora.com>
References: <20210226091128.14379-1-benjamin.gaignard@collabora.com>
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
 .../devicetree/bindings/media/nxp,imx8mq-vpu.yaml     | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
index 762be3f96ce9..c860f6b201f9 100644
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
 
@@ -61,13 +64,14 @@ examples:
   - |
         #include <dt-bindings/clock/imx8mq-clock.h>
         #include <dt-bindings/interrupt-controller/arm-gic.h>
+        #include <dt-bindings/reset/imx8mq-vpu-reset.h>
 
         vpu: video-codec@38300000 {
                 compatible = "nxp,imx8mq-vpu";
                 reg = <0x38300000 0x10000>,
                       <0x38310000 0x10000>,
                       <0x38320000 0x10000>;
-                reg-names = "g1", "g2", "ctrl";
+                reg-names = "g1", "g2";
                 interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
                              <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
                 interrupt-names = "g1", "g2";
@@ -76,4 +80,5 @@ examples:
                          <&clk IMX8MQ_CLK_VPU_DEC_ROOT>;
                 clock-names = "g1", "g2", "bus";
                 power-domains = <&pgc_vpu>;
+                resets = <&vpu_reset IMX8MQ_RESET_VPU_RESET_G1>;
         };
-- 
2.25.1

