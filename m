Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD7515307E8
	for <lists+linux-media@lfdr.de>; Mon, 23 May 2022 05:04:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346526AbiEWDEe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 22 May 2022 23:04:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348655AbiEWDE3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 22 May 2022 23:04:29 -0400
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com [211.20.114.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCE2F37BDC;
        Sun, 22 May 2022 20:04:28 -0700 (PDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 24N2lhji078067;
        Mon, 23 May 2022 10:47:43 +0800 (GMT-8)
        (envelope-from neal_liu@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 23 May
 2022 11:01:39 +0800
From:   Neal Liu <neal_liu@aspeedtech.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Joel Stanley <joel@jms.id.au>,
        "Andrew Jeffery" <andrew@aj.id.au>,
        Felipe Balbi <balbi@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "Li Yang" <leoyang.li@nxp.com>
CC:     Neal Liu <neal_liu@aspeedtech.com>,
        <linux-aspeed@lists.ozlabs.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 3/3] dt-bindings: usb: add documentation for aspeed udc
Date:   Mon, 23 May 2022 11:01:34 +0800
Message-ID: <20220523030134.2977116-4-neal_liu@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220523030134.2977116-1-neal_liu@aspeedtech.com>
References: <20220523030134.2977116-1-neal_liu@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.10.10]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 24N2lhji078067
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add device tree binding documentation for the Aspeed USB2.0 Device
Controller.

Signed-off-by: Neal Liu <neal_liu@aspeedtech.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/usb/aspeed,ast2600-udc.yaml      | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/aspeed,ast2600-udc.yaml

diff --git a/Documentation/devicetree/bindings/usb/aspeed,ast2600-udc.yaml b/Documentation/devicetree/bindings/usb/aspeed,ast2600-udc.yaml
new file mode 100644
index 000000000000..c3b6be3d8002
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/aspeed,ast2600-udc.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2020 Facebook Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/aspeed,ast2600-udc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED USB 2.0 Device Controller
+
+maintainers:
+  - Neal Liu <neal_liu@aspeedtech.com>
+
+description: |+
+  The ASPEED USB 2.0 Device Controller implements 1 control endpoint and
+  4 generic endpoints for AST260x.
+
+  Supports independent DMA channel for each generic endpoint.
+  Supports 32/256 stages descriptor mode for all generic endpoints.
+
+properties:
+  compatible:
+    enum:
+      - aspeed,ast2600-udc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/aspeed-clock.h>
+    udc: usb@1e6a2000 {
+        compatible = "aspeed,ast2600-udc";
+        reg = <0x1e6a2000 0x300>;
+        interrupts = <9>;
+        clocks = <&syscon ASPEED_CLK_GATE_USBPORT2CLK>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_usb2bd_default>;
+    };
-- 
2.25.1

