Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BE8739979
	for <lists+linux-media@lfdr.de>; Sat,  8 Jun 2019 01:12:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731522AbfFGXLQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jun 2019 19:11:16 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42172 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731454AbfFGXLP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Jun 2019 19:11:15 -0400
Received: by mail-wr1-f65.google.com with SMTP id x17so3614647wrl.9;
        Fri, 07 Jun 2019 16:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E4E30xpqxw1cyUThhqcs8LcBlilNIoX4BY+l8x9uJrk=;
        b=nS21om+sxmgQhlX01Uzu3VcogD22hZ1kHhzDLmgBxs0AswjQws9aI3nyYVsa+trWaj
         LTimR/IkxY73JBSpn1aE21GzZneJv0mp0uCeLh/Zy+51tc6xkWmUXNtqxlxKp1lbhS+a
         1Zt0xuip8BIrCtufL1kMLDesoB/OM1g0yj8JpJqRpzuezZOr0/TJNIIlTMUMc2+NRW6W
         C1yhY3acXuSv1RhNg87OREdA6FILarBltHh+S0FbvQUYxiDEgHPuKMQHrRSfUwzx7fI/
         ZGkXhoLcGX/7zqrSCxKpJsagbXNVYQQgfArtSuvdPGRYtlW02QzG8MD8oaY8GgF8NJzm
         fItQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E4E30xpqxw1cyUThhqcs8LcBlilNIoX4BY+l8x9uJrk=;
        b=sTvpqGlhHPLy/EyUNxHhOt/3+XQVNOu0yWQNTm6lQFkdTfeCO7P9YniqQuNtc8IfXZ
         7W4zsJr7kDAhjvddcMx0kaJCFceEquCdD28Mi/ZJZ8OHazGBElb1k4nF6CjhuH8TA0JS
         xAveFQJKbtaCuJSC+0Xf0n/X/IWLqlT1VjeE70XKjBQTo8Xr23DuDZJHTX8Bd+b8Xkxz
         rZSpx/npk1UI7VEMAUGe92k1HKQXnisT2dABLXud6CuyruBemkVL+x49JcTXveMVGBPp
         P+Srz/Me6ByJL8h3qrdTvBC/da2+bon97HSuwBXysXfvZVy8UNxReebh2HeI50sTWdUz
         FOjw==
X-Gm-Message-State: APjAAAULqQeKRtVU/LY1kIjsvw0w8fyzPKQ937MzmpJiVifgx+wXLGE1
        ERlEEPo6neSFDLnHj1YNPhs=
X-Google-Smtp-Source: APXvYqzVT3Th7VqkSyB0yRD4rbflOI8dOw1Wivvjx5R6t+uE5NXQaKKRFZa88frNgIUrvmk5iiRhfg==
X-Received: by 2002:a5d:4087:: with SMTP id o7mr21805064wrp.277.1559949074312;
        Fri, 07 Jun 2019 16:11:14 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
        by smtp.gmail.com with ESMTPSA id h84sm4108559wmf.43.2019.06.07.16.11.13
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 07 Jun 2019 16:11:13 -0700 (PDT)
From:   =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com, linux-arm-kernel@lists.infradead.org,
        linux-media@vger.kernel.org,
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
        Sean Young <sean@mess.org>
Subject: [PATCH v5 05/13] ARM: dts: sunxi: Prefer A31 bindings for IR
Date:   Sat,  8 Jun 2019 01:10:52 +0200
Message-Id: <20190607231100.5894-6-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190607231100.5894-1-peron.clem@gmail.com>
References: <20190607231100.5894-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since A31, memory mapping of the IR driver has changed.

Prefer the A31 bindings instead of A13.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
Acked-by: Sean Young <sean@mess.org>
---
 arch/arm/boot/dts/sun6i-a31.dtsi  | 2 +-
 arch/arm/boot/dts/sun8i-a83t.dtsi | 2 +-
 arch/arm/boot/dts/sun9i-a80.dtsi  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

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
-- 
2.20.1

