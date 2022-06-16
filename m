Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6B3F54D464
	for <lists+linux-media@lfdr.de>; Thu, 16 Jun 2022 00:14:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350520AbiFOWOg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 18:14:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243581AbiFOWOf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 18:14:35 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26DB015FE4;
        Wed, 15 Jun 2022 15:14:35 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B9B281536;
        Thu, 16 Jun 2022 00:14:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655331273;
        bh=V7keF6pU0jUq8EnyWXp07yw1MdtBpVEvVzp0Y4GC/AM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EaVN9fgpjbexDh51WkOfQQ4XH+sGWDHzbQe92EEEQvOPIFzL184FUSSBg1eyyHycZ
         Yh6vaFnqmpFcr/XeR5QQ8CPKvKys1iy9so+fQuCPF1L1tFUkbHUPpJDZOHlnwkpY1Q
         bnI1pcGi68n6EUdXUKZzbMO4k/foAr4nZyfhE+bg=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH v3 6/6] ARM: dts: stm32: Use new media bus type macros
Date:   Thu, 16 Jun 2022 01:14:10 +0300
Message-Id: <20220615221410.27459-7-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220615221410.27459-1-laurent.pinchart@ideasonboard.com>
References: <20220615221410.27459-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that a header exists with macros for the media interface bus-type
values, replace hardcoding numerical constants with the corresponding
macros in the DT sources.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 arch/arm/boot/dts/stm32429i-eval.dts  | 3 ++-
 arch/arm/boot/dts/stm32mp157c-ev1.dts | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/stm32429i-eval.dts b/arch/arm/boot/dts/stm32429i-eval.dts
index 0d98aca01736..5fae11e6607b 100644
--- a/arch/arm/boot/dts/stm32429i-eval.dts
+++ b/arch/arm/boot/dts/stm32429i-eval.dts
@@ -50,6 +50,7 @@
 #include "stm32f429-pinctrl.dtsi"
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/media/video-interfaces.h>
 
 / {
 	model = "STMicroelectronics STM32429i-EVAL board";
@@ -186,7 +187,7 @@ &dcmi {
 	port {
 		dcmi_0: endpoint {
 			remote-endpoint = <&ov2640_0>;
-			bus-type = <5>;
+			bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
 			bus-width = <8>;
 			hsync-active = <0>;
 			vsync-active = <0>;
diff --git a/arch/arm/boot/dts/stm32mp157c-ev1.dts b/arch/arm/boot/dts/stm32mp157c-ev1.dts
index d142dd30e16b..306d41a6138f 100644
--- a/arch/arm/boot/dts/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ev1.dts
@@ -8,6 +8,7 @@
 #include "stm32mp157c-ed1.dts"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/media/video-interfaces.h>
 
 / {
 	model = "STMicroelectronics STM32MP157C eval daughter on eval mother";
@@ -90,7 +91,7 @@ &dcmi {
 	port {
 		dcmi_0: endpoint {
 			remote-endpoint = <&ov5640_0>;
-			bus-type = <5>;
+			bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
 			bus-width = <8>;
 			hsync-active = <0>;
 			vsync-active = <0>;
-- 
Regards,

Laurent Pinchart

