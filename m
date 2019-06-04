Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDC8734D61
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 18:31:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727902AbfFDQaS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 12:30:18 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41481 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727883AbfFDQaR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 12:30:17 -0400
Received: by mail-wr1-f66.google.com with SMTP id c2so16526958wrm.8;
        Tue, 04 Jun 2019 09:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BsQBIKOAel5fnBJ7QqXJ25YvFcF3acsbydOzLPIsKmY=;
        b=Neh3CJxmgXFLwtJqcm5/RvHG3XrJvBwVkV9GXw3SPiRijWVpJwq6+YsQMxCTy5KlbN
         tu8hzH6fOAthfEtmxLrlK1urrNqqwoYo+OCbCp2MSGN1n4lngSZDQ00zNN4afAinX9jR
         Sr/xMiJk2fIrZpPLdsLZxCOnaE0Y8w2GYyga4Hb9JKFllebZYMO2BHGj1fiYgbQgkXTs
         eHI5LGD+HC338p62eNbl1v7oAhaLEeM6Kmo6mrfnw27EgWqQrSKD1F1h+NV5mc0bA6/y
         rrVHyL8Z4xnOrc8Y6/J6fwGESDrMJ3ETnvi7TMyMb1adlzSTIe1wmOVgmUP3oNdHUtpA
         g9pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BsQBIKOAel5fnBJ7QqXJ25YvFcF3acsbydOzLPIsKmY=;
        b=A+NS9/2oH8HsMhqldIcTGpXWK41dF4Pad+BcI6cMeJ8E1MI/gN1Xzn3bvyH8Dcmkxf
         fOjGk+lZzhzW3iTq+F7kZvvX1SjZYebdgirsxoBm9yWMWv3NVgk0zqH+/HEdUp6sQRTY
         Ppg/i1jxlGWQsxmWwlM8hKC72UbwdwJhhp37pHnRHoRtnCr0MuG6DEUk7ybMCNQUfBYV
         f3QH2I9pRIu0uE/mdZSeYpkDKghy7kQQ0j5YpDOD7K1TOt7kr9DZtrWsi5X3UTdLBp6Z
         V7rAN1EGbq0Y//JUhq6+nvRGogSw81uv6WbnZ+gT4OCGGFSO009OuX6ua4akkEPpvkYb
         Ds+w==
X-Gm-Message-State: APjAAAW4kOYlCqKXIq1WOvmYATJrsR9z1ktdVX2KP9DKgLhgAihdhvhY
        Ra1P1oaBdY7UZXjuntq2Mdk=
X-Google-Smtp-Source: APXvYqw4IUgpTbaVDk3VP/y7dsyc/2s0BvfDiNjuBzNtOuW3TqSFu7Pv5I7AOYT3qOOXVOiKURXImQ==
X-Received: by 2002:a5d:5283:: with SMTP id c3mr7123707wrv.268.1559665815867;
        Tue, 04 Jun 2019 09:30:15 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
        by smtp.gmail.com with ESMTPSA id y12sm15108176wrh.40.2019.06.04.09.30.14
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 04 Jun 2019 09:30:15 -0700 (PDT)
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
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
        Sean Young <sean@mess.org>
Subject: [PATCH v4 08/13] arm64: dts: allwinner: a64: Add IR node
Date:   Tue,  4 Jun 2019 18:29:54 +0200
Message-Id: <20190604162959.29199-9-peron.clem@gmail.com>
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

From: Igors Makejevs <git_bb@bwzone.com>

IR peripheral is completely compatible with A31 one.

Signed-off-by: Igors Makejevs <git_bb@bwzone.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
Acked-by: Sean Young <sean@mess.org>
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

