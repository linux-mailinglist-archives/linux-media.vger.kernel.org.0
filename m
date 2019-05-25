Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 109D02A61A
	for <lists+linux-media@lfdr.de>; Sat, 25 May 2019 20:10:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727551AbfEYSK0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 May 2019 14:10:26 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:56061 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727278AbfEYSJe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 May 2019 14:09:34 -0400
Received: by mail-wm1-f67.google.com with SMTP id x64so12309005wmb.5;
        Sat, 25 May 2019 11:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Txw4I/nlIjGWNbpamPSvup0QUY5nkiK5clorHOj/5is=;
        b=tNLwJOqNzTRUVhwemZqWMHv7UdnenD9nBAsVH4I2TGf+dETUCKkmXYw4R4RQ0ViNJD
         gHq/PRSFoIDKh6ytEpURv20hL2r5y8xOZHrRLZJSQTPfIARLWr/3HatRriSL8CHdHt7H
         dFWJScNTQb4lD7zUDpb5slmoGy1PG6vWqKl1ptNzrsTTKFM974kA8hQ77G0EihDmVfA0
         y4GFjCjF8uPqq2BSTxL3VlWkHLSFe14SeD6ZK9oxrcv9aOge7P6sIBLNJwNXwhj0JZ/0
         cJ6OeS1Y+XYIQlgAHhQ5yQJMlst2A/6pXS0h3yzG3XqqMfxfprY2ulzvczOa+WH/ybuE
         viEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Txw4I/nlIjGWNbpamPSvup0QUY5nkiK5clorHOj/5is=;
        b=ihg6U815f9/O4Z6FtmBqOXIPYh7ydyRPGglMm3RX0EZfAs5/xgiBrzlGtns9643bkM
         QyfkKpbB0Nug5BzvEEL347QyuRjBQTGdk1Sl2f77ofpeFlrpCc5DucnzZcvAPTIPREiF
         XikzRiZJfkNZ/HHjdRJAlgU/OHaopxY5rMxIjqyNDRNTlFRK/kH9XeSED+7c1p/z2FNg
         pcqaGzJyl14HnE+jW+hadq0hxG2P/tKHx+9S/w1l9y8Ug0qEY/QK8e983xZVrshTo2S/
         bug7lDIEtxAq6MUGFeBi7KaLvQo8E90J9lCepiDds3dTg53vx4M4Qb14Gn+YHpgQyMVH
         ScsQ==
X-Gm-Message-State: APjAAAUQfL8uspOgXIfEw3cHcyzHtvyJg5Z96/vh4hLGwgyGzLyagNTZ
        l9MdLUQHipLLymiiZZMFrZ8=
X-Google-Smtp-Source: APXvYqwOkJuokQudRPmhh1EXSAWRSV25N8yYzUEBr4S3uGDF0zOlWBxTHcZs4RO7MzoAPcW3AhKQqg==
X-Received: by 2002:a1c:1ad6:: with SMTP id a205mr20050587wma.80.1558807772772;
        Sat, 25 May 2019 11:09:32 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
        by smtp.gmail.com with ESMTPSA id s127sm5656914wmf.48.2019.05.25.11.09.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 25 May 2019 11:09:32 -0700 (PDT)
From:   =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH 03/10] ARM: dts: sunxi: prefer A31 instead of A13 for ir
Date:   Sat, 25 May 2019 20:09:16 +0200
Message-Id: <20190525180923.6105-4-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190525180923.6105-1-peron.clem@gmail.com>
References: <20190525180923.6105-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since A31 memory mapping of the IR driver has changed.

Prefer the A31 bindings instead of A13.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 arch/arm/boot/dts/sun6i-a31.dtsi   | 2 +-
 arch/arm/boot/dts/sun8i-a83t.dtsi  | 2 +-
 arch/arm/boot/dts/sun9i-a80.dtsi   | 2 +-
 arch/arm/boot/dts/sunxi-h3-h5.dtsi | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/sun6i-a31.dtsi b/arch/arm/boot/dts/sun6i-a31.dtsi
index c04efad81bbc..110622b30796 100644
--- a/arch/arm/boot/dts/sun6i-a31.dtsi
+++ b/arch/arm/boot/dts/sun6i-a31.dtsi
@@ -1351,7 +1351,7 @@
 		};
 
 		ir: ir@1f02000 {
-			compatible = "allwinner,sun5i-a13-ir";
+			compatible = "allwinner,sun6i-a31-ir";
 			clocks = <&apb0_gates 1>, <&ir_clk>;
 			clock-names = "apb", "ir";
 			resets = <&apb0_rst 1>;
diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
index 392b0cabbf0d..8d603f3309f2 100644
--- a/arch/arm/boot/dts/sun8i-a83t.dtsi
+++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
@@ -1067,7 +1067,7 @@
 
 		r_cir: ir@1f02000 {
 			compatible = "allwinner,sun8i-a83t-ir",
-				"allwinner,sun5i-a13-ir";
+				"allwinner,sun6i-a31-ir";
 			clocks = <&r_ccu CLK_APB0_IR>, <&r_ccu CLK_IR>;
 			clock-names = "apb", "ir";
 			resets = <&r_ccu RST_APB0_IR>;
diff --git a/arch/arm/boot/dts/sun9i-a80.dtsi b/arch/arm/boot/dts/sun9i-a80.dtsi
index 0c1eec9000e3..310cd972ee5b 100644
--- a/arch/arm/boot/dts/sun9i-a80.dtsi
+++ b/arch/arm/boot/dts/sun9i-a80.dtsi
@@ -1167,7 +1167,7 @@
 		};
 
 		r_ir: ir@8002000 {
-			compatible = "allwinner,sun5i-a13-ir";
+			compatible = "allwinner,sun6i-a31-ir";
 			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&r_ir_pins>;
diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
index 84977d4eb97a..f0f5ba349c1b 100644
--- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
+++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
@@ -822,7 +822,7 @@
 		};
 
 		ir: ir@1f02000 {
-			compatible = "allwinner,sun5i-a13-ir";
+			compatible = "allwinner,sun6i-a31-ir";
 			clocks = <&r_ccu CLK_APB0_IR>, <&r_ccu CLK_IR>;
 			clock-names = "apb", "ir";
 			resets = <&r_ccu RST_APB0_IR>;
-- 
2.20.1

