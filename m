Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80FC32CB75
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 18:15:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727353AbfE1QPF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 12:15:05 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54152 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727274AbfE1QPF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 12:15:05 -0400
Received: by mail-wm1-f68.google.com with SMTP id d17so3613074wmb.3;
        Tue, 28 May 2019 09:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q27XYokGtE0PF+e6Jf1zBq2DoW5PvxIGPkQQOfCJr1E=;
        b=HFUvyHXx8VHztoOIZncJwhbhhwGM6/33nEZ+Dnb0ZNAZMX/HCdsLaTmJIlK2YB1rSt
         OqQIhud3nbj4bUcdGshdA0qed5SDiimDzVItGH+ythngmmlSg8CVcLNu0cdWvMYwSGSf
         u1VaunPEueoijVnZSkTPfMKjO5eDaDrheNDkoBVGXy1tKJUQI+VRPcKrAmaER3RZdsHk
         bpBii7hnK/soi9FuKOnK3OViFOI3+SH1oVxYddi0lsdwZOWncnR2odwoYpVGWbcdIRP9
         H3g34RRcBwN7JMDodaP8UniO9Re03GLcn92ezxYsaepo2xukm3EldxN/0oB93vhHE4lH
         ncKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q27XYokGtE0PF+e6Jf1zBq2DoW5PvxIGPkQQOfCJr1E=;
        b=GpZ+1bBuMgt73WjvIfgQVHvEjyKA8f2TLTrxhKG9mP+i00FtyociGtR5McqGvRLyvq
         4ElLVc4soDhJX/s1zIiJy3oS+pI1PIYr43iC1NIU4X99os2RzaESDkLM1flT65IJNGUn
         Iq7DidwB8Zp7E+XIv7gU6ZYLfuqw8NetfZqBk2UGctBPxsM0IuC9KqJcNe7MbU+IDMiy
         RVgWOdosCOukuRe419myhJJC7ysnpa8MB6z17gnVsXhH7BSdQzGGp8zepmqdtFKxOsBN
         gYqym+ekGXC9qe0JlxXbE01N/+LNBSWjbzCvlQcRIuu83Gr6UzQrgrGqNI3OkTSHtZOC
         OELw==
X-Gm-Message-State: APjAAAXL2njCd7dw2gnJ5fakDJd6f5GRpyCi94BXx9qxhT26cOnRurxX
        gDWF+nQd27Lol+TKjpygq2M=
X-Google-Smtp-Source: APXvYqz/joxHvvODIOd7kz0qELHlGEhUT9mw5hsDYpXJzwCuo0YHwLvhkfaEYMl/b5bkaqZyM6fKBw==
X-Received: by 2002:a1c:f606:: with SMTP id w6mr4037175wmc.130.1559060102677;
        Tue, 28 May 2019 09:15:02 -0700 (PDT)
Received: from localhost.localdomain (18.189-60-37.rdns.acropolistelecom.net. [37.60.189.18])
        by smtp.gmail.com with ESMTPSA id l14sm13678787wrt.57.2019.05.28.09.15.01
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 28 May 2019 09:15:01 -0700 (PDT)
From:   =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com, Igors Makejevs <git_bb@bwzone.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v3 07/12] arm64: dts: allwinner: a64: Add IR node
Date:   Tue, 28 May 2019 18:14:35 +0200
Message-Id: <20190528161440.27172-8-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190528161440.27172-1-peron.clem@gmail.com>
References: <20190528161440.27172-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Igors Makejevs <git_bb@bwzone.com>

IR peripheral is completely compatible with A31 one.

Signed-off-by: Igors Makejevs <git_bb@bwzone.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index 8c5b521e6389..b22b0aa89515 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -1072,6 +1072,19 @@
 			#size-cells = <0>;
 		};
 
+		r_ir: ir@1f02000 {
+			compatible = "allwinner,sun50i-a64-ir",
+				     "allwinner,sun6i-a31-ir";
+			reg = <0x01f02000 0x400>;
+			clocks = <&r_ccu CLK_APB0_IR>, <&r_ccu CLK_IR>;
+			clock-names = "apb", "ir";
+			resets = <&r_ccu RST_APB0_IR>;
+			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&r_ir_rx_pin>;
+			status = "disabled";
+		};
+
 		r_pwm: pwm@1f03800 {
 			compatible = "allwinner,sun50i-a64-pwm",
 				     "allwinner,sun5i-a13-pwm";
@@ -1099,6 +1112,11 @@
 				function = "s_i2c";
 			};
 
+			r_ir_rx_pin: r-ir-rx-pin {
+				pins = "PL11";
+				function = "s_cir_rx";
+			};
+
 			r_pwm_pin: r-pwm-pin {
 				pins = "PL10";
 				function = "s_pwm";
-- 
2.20.1

