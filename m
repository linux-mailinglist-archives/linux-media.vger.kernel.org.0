Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F5C12AC91
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2019 00:27:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726183AbfEZW01 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 May 2019 18:26:27 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:44418 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725834AbfEZWZt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 May 2019 18:25:49 -0400
Received: by mail-wr1-f66.google.com with SMTP id w13so6617725wru.11;
        Sun, 26 May 2019 15:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+vaehzousi1ZvrkZVCU5L96BprdpUm+MB96+HzfnfTc=;
        b=fTSTK4loejbHv8OiY2aKVD9yytte8x9X8MJ+h+/6invxOjOVbxrQyD8XqynT6i5j9d
         si92YhxPz7rAoYC28iLJzy18lMkolVeTdBoCz2wosUG9iKMGQLtnZCwsU0tO64J9WblB
         sciupEFJFBcXKvGJr2+bH3K1jbcP1w2+JDUU4EhOZpnhYkkK87d8SzAcGoQHwB1L6b1w
         /2jYpLjLF54ITd6DNvgwuk1RivUAxG6I/68IZfH39pu+oFr6gOM8mECT9a5yClPrgoiS
         fRfShHT+qvFgq0dqngFnvKgQTAx0rtLNWCYn4eP1AWdjvTALf3hZHMDmUNlCTxQ7iUVC
         QQAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+vaehzousi1ZvrkZVCU5L96BprdpUm+MB96+HzfnfTc=;
        b=SLs2muT3cYYGXGUG3nnx8N+ZXSxZ1+rz3+mVdw7Y0ZQKyPvUJTMu10qEm2p/4B9YEP
         HG7/dbY2d6ot8Oll3cJ354SexM6y9mVP80Le3M1njDBeanoRESjUx6LCcS9BRC7RyhtQ
         Z4KNiuOu6yWjXYOq8uVpFVyXBOy8Ak5rLkmDgtPIVG/DsTf3WmsuINcJapGwVsjsMb2I
         oGdoJgle5lAc4eQaBPLobHitGr/8qZ6WAd29I1wP8/CMB46np1zJxenGfZ6oYjfre8Xz
         Qn7GngA8nbIOG5vcWPWME3EhV5vrJSHRQW1OVyv3j5apvFiQ0txCapXrTufUPXCoh3Ic
         qY8A==
X-Gm-Message-State: APjAAAV19ZAzNoVgwaXElvK9BckrPQfdJuxfbspD9mq27/9W+3DI1oFo
        b5kqSaiJye3Fj378fAzeE4U=
X-Google-Smtp-Source: APXvYqyFnqOmHgAzXV2IX3zI/93AwTPEgF89lW1l5NyIbDZwfAuKEuxgfypD2AreMSkzLbi7bkFM3w==
X-Received: by 2002:a5d:4212:: with SMTP id n18mr10471393wrq.330.1558909546828;
        Sun, 26 May 2019 15:25:46 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
        by smtp.gmail.com with ESMTPSA id o20sm10368398wro.2.2019.05.26.15.25.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 May 2019 15:25:46 -0700 (PDT)
From:   =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com,
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v2 03/10] ARM: dts: sunxi: prefer A31 instead of A13 for ir
Date:   Mon, 27 May 2019 00:25:29 +0200
Message-Id: <20190526222536.10917-4-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190526222536.10917-1-peron.clem@gmail.com>
References: <20190526222536.10917-1-peron.clem@gmail.com>
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

