Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C90934D58
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 18:30:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727957AbfFDQaV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 12:30:21 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:34931 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727917AbfFDQaV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 12:30:21 -0400
Received: by mail-wr1-f68.google.com with SMTP id m3so698594wrv.2;
        Tue, 04 Jun 2019 09:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=njnjG6a7jdrYLSKYX++HVTkLLSLz4gvoHp7YU4YYSHc=;
        b=hjRO/5G+35x3CtsnItSo0oEhpihExukJxRz38P34BJFVsCWjmfCgVq669GLHPmTu63
         +Td9MCqpm903OMRnobhlEySB4BaoYn/pKaVbrcdroRrnkYZrLRCAyY47rQVzMYSG9hS4
         tOP9cLOBdwkRdKWwDOy1QJnqcfasCZI5Epx0VXQd+n4JmaV0Rm76h3n0gpap544V5EX6
         towlwcb5mD0TBfKcT+WgfSjE4SnSNz7gzXMEVuV8p8RUTl3Px2Bf8MmR3+ApI7w9rM8u
         btAHqLoxcVEPNCnB0NWPMHpvzPVOSZYm8PFdlL6m7EZZl7kMLDqxsFepS7c4afXfenRj
         QJxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=njnjG6a7jdrYLSKYX++HVTkLLSLz4gvoHp7YU4YYSHc=;
        b=G8Kr2L1IhgHBo8SCIFxZMjE82i6PC6P2NNT864xP7PnAIrgzFEfAm8qbcsjROh9Dju
         dVgQaqJqqzImmBJNHnmD7Jn1znnanQ3R+0YkyFUgTCg41+S+uiA1o2dVrRkNWY1i7OfI
         fDk1LwzRxY6cz6Uq0nj0zOmMIAqHkrg/+vVO94xBnpF3cDP4VfEE/+SGYfAl4q/zhC+0
         gQZ4UKTMLrM4jPpYh+G7fyX1u7xMRvmV8ydfMXcYp3+qq5vDJ9Zk93W3X+nbupFtNCaq
         B2KAGnCfL+V3+7rA1WuElMuy2dX1r1uZoK7QjGSbnvlHuLxWXsHiO4pQsLURYso8IQdA
         b+Sg==
X-Gm-Message-State: APjAAAXl7W5uSvuPVullTyEWIN9hzjLKT80BRsq9sQEXvtE5AOW2LJNY
        On+NmGQ6IV2D5Z7d5cgnTak=
X-Google-Smtp-Source: APXvYqysS9M3ppquDw2c5HMbHi5hNJ8JqiIA9np0vOWzotvcTepc7ZINfKGMWQ1aLcdglS57gxLIuA==
X-Received: by 2002:a05:6000:124b:: with SMTP id j11mr901402wrx.157.1559665818860;
        Tue, 04 Jun 2019 09:30:18 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
        by smtp.gmail.com with ESMTPSA id y12sm15108176wrh.40.2019.06.04.09.30.17
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 04 Jun 2019 09:30:18 -0700 (PDT)
From:   =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com,
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
        Sean Young <sean@mess.org>
Subject: [PATCH v4 11/13] arm64: dts: allwinner: h6: Add IR receiver node
Date:   Tue,  4 Jun 2019 18:29:57 +0200
Message-Id: <20190604162959.29199-12-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190604162959.29199-1-peron.clem@gmail.com>
References: <20190604162959.29199-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Allwinner H6 IR is similar to A31 and can use same driver.

Add support for it.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
Acked-by: Sean Young <sean@mess.org>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
index 16c5c3d0fd81..649cbdfe452e 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
@@ -647,6 +647,25 @@
 				pins = "PL0", "PL1";
 				function = "s_i2c";
 			};
+
+			r_ir_rx_pin: r-ir-rx-pin {
+				pins = "PL9";
+				function = "s_cir_rx";
+			};
+		};
+
+		r_ir: ir@7040000 {
+				compatible = "allwinner,sun50i-h6-ir",
+					     "allwinner,sun6i-a31-ir";
+				reg = <0x07040000 0x400>;
+				interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&r_ccu CLK_R_APB1_IR>,
+					 <&r_ccu CLK_IR>;
+				clock-names = "apb", "ir";
+				resets = <&r_ccu RST_R_APB1_IR>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&r_ir_rx_pin>;
+				status = "disabled";
 		};
 
 		r_i2c: i2c@7081400 {
-- 
2.20.1

