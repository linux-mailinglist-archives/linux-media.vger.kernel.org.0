Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 695BD2A5FD
	for <lists+linux-media@lfdr.de>; Sat, 25 May 2019 20:09:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727433AbfEYSJk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 May 2019 14:09:40 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:52257 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727405AbfEYSJj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 May 2019 14:09:39 -0400
Received: by mail-wm1-f67.google.com with SMTP id y3so12351271wmm.2;
        Sat, 25 May 2019 11:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C9g/LoE0ZpkZVP3pL23ne066/SyPh+9LNI5RSIoN1oM=;
        b=AS/eNOcuOWZrNY5F73b3tRw6W1rm1ShvuCJ8NsyV7sck53nwFFQ1NJ9XWjtd2qbvRy
         m8zszAG1jKyqoOhnyYeycFtOik1jC+/ZIAL1Vlk9aL19WbQmZ7LXySmsTPOyW2NE1muh
         LwUEz7Iem3belCk3GnAdfIO3IMhtH5iOwUsFq09HucZJGaDkxDQElmfi0b+rTgjLEbx4
         2qu14WLti9k6TSToja1a5V6lViC87Oi6jOzLFVViOq7z/zKh6FyDgUxyxLtBBDjYMMYU
         NYfgmw8oHTK5lTxZKq0Ucz7m9THTm4wMFRoivjCsMZ8vwREWcFvWqb9UAMXlrbPeXzz6
         V2IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C9g/LoE0ZpkZVP3pL23ne066/SyPh+9LNI5RSIoN1oM=;
        b=bJvbwEnr1ruaPsII8pM46vBNk2yM6vJi1+fiXRbs7YAfMP1HcgOYKGNKNi2KB6J9a1
         qF75ao9RlAk1OoXGoggwfTtQAe6742NPIjxeF/7Zc0UV5FG4Tk/y78YuuOWGSNJHkhjh
         oUKGlMJ+ESDIQvGckn7SkWxEowoviqMA5Z/ExygTVy4WlX4AUbH+FBRvuekN61D5wDmF
         dGW5J90yO/hYE09u2omKtymhBx0FIYxP2G/mDx5sqk133KJzw6EyNHgles6zxThBQFjR
         JZBgXQF4nyLFsVzw8PjK6sXYk4enmWIA6Q4VOgSjNi+cfRup7MoWcmEFYfsbIcmZhrrk
         Ek9A==
X-Gm-Message-State: APjAAAUsPrVYjPMvJP9HTgINsdr2JKvspFaeBfV3CpouYnyQLu7M/bOt
        h4fT0efUq96tuMXKyaluXhk=
X-Google-Smtp-Source: APXvYqxHLZVgAdIIsU0FKFQ49/TWoLdxUaOWJDFX8vHrq/7KokfZQneNmxMcqZEdoz0vbuvGzyTscw==
X-Received: by 2002:a7b:c8c1:: with SMTP id f1mr3762382wml.159.1558807777790;
        Sat, 25 May 2019 11:09:37 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
        by smtp.gmail.com with ESMTPSA id s127sm5656914wmf.48.2019.05.25.11.09.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 25 May 2019 11:09:37 -0700 (PDT)
From:   =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH 08/10] arm64: dts: allwiner: h6: Add IR receiver node
Date:   Sat, 25 May 2019 20:09:21 +0200
Message-Id: <20190525180923.6105-9-peron.clem@gmail.com>
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

Allwiner H6 IR is similar to A31 and can use same driver.

Add support for it.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
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

