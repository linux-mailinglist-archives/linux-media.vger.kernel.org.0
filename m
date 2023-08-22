Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D49A0783C9C
	for <lists+linux-media@lfdr.de>; Tue, 22 Aug 2023 11:12:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234209AbjHVJMw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Aug 2023 05:12:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234206AbjHVJMv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Aug 2023 05:12:51 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F3F9CC8;
        Tue, 22 Aug 2023 02:12:47 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 924E41000D0; Tue, 22 Aug 2023 10:12:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
        t=1692695565; bh=BUmGKmwVDkl59Py5WPWkUtSv0IME8BSyfdCe/26EDGM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=imhndTHfTxaj9g9WGf4BTxt+QL86cdprWBBNbxcdirtdUgXvd2Bk3PrVIcfOExitz
         zruvMzLHadXasne0Geh0Hd6ISXwAgHZNUjlfu+F4L/N4VvfJH0FjyWR0XM+2aDvwjs
         4wyzRlx2uEeJEbMKlcly1Bfk+8hG/H06qrf4e5cQpfLyoRisJYUbZqOToV03xXapN9
         gdozE0n/Z4a0R3QyA1uCvyCIkagjoCt4355ZiJw4s2qOGu41sudmGbmLILRJ2JVI1u
         oWPdvS4jBxRPCXVZ1hyUDhramZISp2/Ki9eA9ryWTXA00rJa5kLxKUNhHLqTuOf2s3
         ICRgKrx063Lhw==
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
Subject: [PATCH v2 2/2] media: dt-bindings: media: remove nokia,n900-ir as pwm-ir-tx is compatible
Date:   Tue, 22 Aug 2023 10:12:45 +0100
Message-Id: <20230822091245.209539-3-sean@mess.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230822091245.209539-1-sean@mess.org>
References: <20230822091245.209539-1-sean@mess.org>
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
index f2a6fa140f38..05d8e3bb1ef3 100644
--- a/Documentation/devicetree/bindings/leds/irled/pwm-ir-tx.yaml
+++ b/Documentation/devicetree/bindings/leds/irled/pwm-ir-tx.yaml
@@ -15,7 +15,9 @@ description:
 
 properties:
   compatible:
-    const: pwm-ir-tx
+    items:
+     - const: pwm-ir-tx
+     - const: nokia,n900-ir
 
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

