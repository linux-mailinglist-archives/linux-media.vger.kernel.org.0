Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31A377844D2
	for <lists+linux-media@lfdr.de>; Tue, 22 Aug 2023 16:56:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236993AbjHVO4s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Aug 2023 10:56:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233629AbjHVO4s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Aug 2023 10:56:48 -0400
X-Greylist: delayed 18014 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 22 Aug 2023 07:56:46 PDT
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90227137;
        Tue, 22 Aug 2023 07:56:46 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id AAB991000D0; Tue, 22 Aug 2023 15:56:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
        t=1692716204; bh=Snqk1wpg6yPAf11U5dGfhuPpr3hEjrkTgVixVBqscIc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ryhpdIuVV8LnneCETMnnCwdLuES5v5gEaobWP7P7sX8CV6h4lDjTEOohIRUp+LS1d
         Q0q1xuKJUhcPgnZTz7jGdH/hT74MThQdACj0YlIgqBiUsUrXtYi0tS2PXqSrmTNQg9
         FqtD8nex3vna+cTaZ08K/dIvWNXkKHHdRyXPdw01Fj6z7JLtecTyjy+IgrPmZIU5pM
         OsWU8UyMcH6UDv8N9A3dRMsaPlmfWXuiLJaUyHehsEVj3T1i94oUzHuE4BaiJAbpN5
         xjHgFQ/YS/RS+KSR2f+KNHJsIFVSFrSPBcJF7unW1sVn7+ojo7ygVMTEfF8tLeyL/l
         mRjXch01AYN5g==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Cc:     Sicelo <absicsz@gmail.com>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        Timo Kokkonen <timo.t.kokkonen@iki.fi>,
        Tony Lindgren <tony@atomide.com>
Subject: [PATCH v3 2/2] media: dt-bindings: media: remove nokia,n900-ir as pwm-ir-tx is compatible
Date:   Tue, 22 Aug 2023 15:56:44 +0100
Message-Id: <20230822145644.213589-3-sean@mess.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230822145644.213589-1-sean@mess.org>
References: <20230822145644.213589-1-sean@mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The generic pwm-ir-tx driver works for the Nokia n900, so nokia,n900-ir
can be removed.

Cc: Sicelo <absicsz@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Cc: Pali Rohár <pali.rohar@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Timo Kokkonen <timo.t.kokkonen@iki.fi>
Cc: Tony Lindgren <tony@atomide.com>
Signed-off-by: Sean Young <sean@mess.org>
---
 .../bindings/leds/irled/pwm-ir-tx.yaml        |  4 +++-
 .../devicetree/bindings/media/nokia,n900-ir   | 20 -------------------
 2 files changed, 3 insertions(+), 21 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/nokia,n900-ir

diff --git a/Documentation/devicetree/bindings/leds/irled/pwm-ir-tx.yaml b/Documentation/devicetree/bindings/leds/irled/pwm-ir-tx.yaml
index f2a6fa140f38..dc19b6475ba8 100644
--- a/Documentation/devicetree/bindings/leds/irled/pwm-ir-tx.yaml
+++ b/Documentation/devicetree/bindings/leds/irled/pwm-ir-tx.yaml
@@ -15,7 +15,9 @@ description:
 
 properties:
   compatible:
-    const: pwm-ir-tx
+    - const: pwm-ir-tx
+    - const: nokia,n900-ir
+      deprecated: true
 
   pwms:
     maxItems: 1
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
-- 
2.41.0

