Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D7E0223C85
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 15:26:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726775AbgGQNZ6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 09:25:58 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:46879 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726734AbgGQNZ6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 09:25:58 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 51DC01C0012;
        Fri, 17 Jul 2020 13:25:54 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, slongerbeam@gmail.com,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32
        ARCHITECTURE)
Subject: [PATCH 08/13] dt-bindings: media: ov5640: Remove data-shift
Date:   Fri, 17 Jul 2020 15:28:54 +0200
Message-Id: <20200717132859.237120-9-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717132859.237120-1-jacopo+renesas@jmondi.org>
References: <20200717132859.237120-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The value of the data-shift property solely depend on the selected
bus width and it's not freely configurable.

Remove it from the bindings document and update its users accordingly.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 Documentation/devicetree/bindings/media/i2c/ov5640.yaml | 9 ---------
 arch/arm/boot/dts/stm32mp157c-ev1.dts                   | 1 -
 2 files changed, 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ov5640.yaml b/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
index 5e1662e848bd..ab700a1830aa 100644
--- a/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
@@ -92,12 +92,6 @@ properties:
               parallel bus.
             enum: [8, 10]

-          data-shift:
-            description: |
-              Shall be set to <2> for 8 bits parallel bus (lines 9:2 are used) or
-              <0> for 10 bits parallel bus.
-            enum: [0, 2]
-
           hsync-active:
             enum: [0, 1]

@@ -115,7 +109,6 @@ properties:
             then:
                 properties:
                   bus-width: false
-                  data-shift: false
                   hsync-active: false
                   vsync-active: false
                   pclk-sample: false
@@ -135,7 +128,6 @@ properties:
                 - remote-endpoint
                 - bus-type
                 - bus-width
-                - data-shift
                 - hsync-active
                 - vsync-active
                 - pclk-sample
@@ -204,7 +196,6 @@ examples:
                     remote-endpoint = <&parallel_from_ov5640>;
                     bus-type = <5>;
                     bus-width = <10>;
-                    data-shift = <0>;
                     hsync-active = <1>;
                     vsync-active = <1>;
                     pclk-sample = <1>;
diff --git a/arch/arm/boot/dts/stm32mp157c-ev1.dts b/arch/arm/boot/dts/stm32mp157c-ev1.dts
index 613ede73b65b..96f96202ca63 100644
--- a/arch/arm/boot/dts/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ev1.dts
@@ -192,7 +192,6 @@ ov5640_0: endpoint {
 				remote-endpoint = <&dcmi_0>;
 				bus-type = <5>;
 				bus-width = <8>;
-				data-shift = <2>; /* lines 9:2 are used */
 				hsync-active = <0>;
 				vsync-active = <0>;
 				pclk-sample = <1>;
--
2.27.0

