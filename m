Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05AED782D3B
	for <lists+linux-media@lfdr.de>; Mon, 21 Aug 2023 17:26:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236340AbjHUP03 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Aug 2023 11:26:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236273AbjHUP02 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Aug 2023 11:26:28 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB8ADE2
        for <linux-media@vger.kernel.org>; Mon, 21 Aug 2023 08:26:26 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 8F6AB1000D0; Mon, 21 Aug 2023 16:26:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
        t=1692631583; bh=X9kH2CKPVPD8DJDF9fb8GdW5nJK54N47JAuhg+unvko=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CrARIivcIFxUAC6/QOLQendaHMLnyaJKahE+QfdBHxFg3EmKduK0SpvKnNkWZieHI
         MPgkAPyRLLERNJUOjnwTHTcaZrAWWrY5LBpXt3l6Svbct/fzHDOYDfeyKzVRjDfCSI
         18dhKuq8lcoI2ovI9NLKJccd0MCFAKPdFt6dC4wL46750LGObI9mHZXXdigGcWcw79
         2Pdr+8lU3C/hkXGa+PW8AiuYh0s5DPxyYZHYvGlPqZXZUkXuJZGbucUs4d8WFQ3UpS
         RX7uGsIbZFPy88BpG5uxp3OR8nmWXNxsz1KQG5aJ8/9a3YYC3mkweEZwqlDSHNE54d
         Hza2pZ7/4URdA==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Cc:     Sicelo <absicsz@gmail.com>, Rob Herring <robh@kernel.org>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        Timo Kokkonen <timo.t.kokkonen@iki.fi>,
        Tony Lindgren <tony@atomide.com>
Subject: [PATCH 1/2] media: dt-bindings: nokia,n900-ir use generic pwm-ir-tx driver
Date:   Mon, 21 Aug 2023 16:26:22 +0100
Message-Id: <20230821152623.196541-2-sean@mess.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230821152623.196541-1-sean@mess.org>
References: <20230821152623.196541-1-sean@mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The generic pwm-ir-tx driver works for the Nokia n900, so nokia,n900-ir
can be removed.

Cc: Sicelo <absicsz@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Cc: Pali Rohár <pali.rohar@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Timo Kokkonen <timo.t.kokkonen@iki.fi>
Cc: Tony Lindgren <tony@atomide.com>
Signed-off-by: Sean Young <sean@mess.org>
---
 .../devicetree/bindings/media/nokia,n900-ir   | 20 -------------------
 arch/arm/boot/dts/ti/omap/omap3-n900.dts      |  2 +-
 2 files changed, 1 insertion(+), 21 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/nokia,n900-ir

diff --git a/Documentation/devicetree/bindings/media/nokia,n900-ir b/Documentation/devicetree/bindings/media/nokia,n900-ir
deleted file mode 100644
index 13a18ce37dd1..000000000000
--- a/Documentation/devicetree/bindings/media/nokia,n900-ir
+++ /dev/null
@@ -1,20 +0,0 @@
-Device-Tree bindings for LIRC TX driver for Nokia N900(RX51)
-
-Required properties:
-	- compatible: should be "nokia,n900-ir".
-	- pwms: specifies PWM used for IR signal transmission.
-
-Example node:
-
-	pwm9: dmtimer-pwm@9 {
-		compatible = "ti,omap-dmtimer-pwm";
-		ti,timers = <&timer9>;
-		ti,clock-source = <0x00>; /* timer_sys_ck */
-		#pwm-cells = <3>;
-	};
-
-	ir: n900-ir {
-		compatible = "nokia,n900-ir";
-
-		pwms = <&pwm9 0 26316 0>; /* 38000 Hz */
-	};
diff --git a/arch/arm/boot/dts/ti/omap/omap3-n900.dts b/arch/arm/boot/dts/ti/omap/omap3-n900.dts
index d33485341251..83ab2d6faee6 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-n900.dts
+++ b/arch/arm/boot/dts/ti/omap/omap3-n900.dts
@@ -165,7 +165,7 @@ pwm9: pwm-9 {
 	};
 
 	ir: n900-ir {
-		compatible = "nokia,n900-ir";
+		compatible = "pwm-ir-tx";
 		pwms = <&pwm9 0 26316 0>; /* 38000 Hz */
 	};
 
-- 
2.41.0

