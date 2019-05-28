Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBA7F2CB89
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 18:15:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727578AbfE1QPz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 12:15:55 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:39206 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727147AbfE1QPB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 12:15:01 -0400
Received: by mail-wm1-f65.google.com with SMTP id z23so3529960wma.4;
        Tue, 28 May 2019 09:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=necYQR/hOII6qU6ihIL1rttwa5Q03SvHF96lpnmH/9A=;
        b=p6CM7nMRzyA7nfMJlp1pav4aU8ZS+VtI3bSSi/luP1NesrqAbse+UupeOmsEEdKh9y
         Ib1WhiPiWJksIHqPIYZbQhyRcbGW64wj+s6WW/uL1ujQydK3na1HZgbaWHm+tVir7kWL
         GR1dpbQ9D/b7dtYeZmn37dMo4UseeduNIzTCH6LrHvfF6+NPCCtjF6+aljOEKxJMokx+
         X2XLMaOWBEx5PVdpru/eCospvMl/bGZ9yQmf2+PFf81gnyevb8u9ePbC03gqopuX5L7l
         U+ci90UfGcvIYMqCf7S24FRkRy5UFtynrdKjS79eFC+UKUCCVXflUN3YED6ZGF1kVKXx
         dusg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=necYQR/hOII6qU6ihIL1rttwa5Q03SvHF96lpnmH/9A=;
        b=qe32vD5G7pV+F9r75Ca3mny26Ddf7sLa+sLKVypWVJ1ZHfHQROMM0AkvQe7nCmJCdV
         03bPaiJco7mERhHzCroI+WMiwVac7HTyO/+ftSE9h/IFnHsHixHbdaGsSWiR1dEMTCq1
         Qz0xVNhg2z5ue+8oSfdKL2ab2FECoO4pNyFJsHdZE+TRvHePjSxa/UC8Qw5cq/g8U9CV
         6f7bleWJ7jKE0MwH3kOd7K1Swsr6h6QNtMHxXnhTpvm0B/N0I3xJUnWrqDhKvNbCgaON
         vTyCC6vokPeWSvEaVVKhcMT+ifyxz/1EpBOS4lcYuDqHmknczigtfU17eQnPZhXS5okh
         QBaQ==
X-Gm-Message-State: APjAAAU7swJBYq1O0+1d2KuNM5unANVt2yegn6qetIf5YAndVzlgfvyN
        j453agCi8MlbXefu6MUqnkM=
X-Google-Smtp-Source: APXvYqwL9fEhE1DgBedObZFNedmqYKHhhGQeuaJT8KBh1Soz7MknuLcK+9WLqKNP/fkjMCvc0IbaEA==
X-Received: by 2002:a1c:2c89:: with SMTP id s131mr4038994wms.142.1559060099412;
        Tue, 28 May 2019 09:14:59 -0700 (PDT)
Received: from localhost.localdomain (18.189-60-37.rdns.acropolistelecom.net. [37.60.189.18])
        by smtp.gmail.com with ESMTPSA id l14sm13678787wrt.57.2019.05.28.09.14.58
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 28 May 2019 09:14:58 -0700 (PDT)
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
Subject: [PATCH v3 04/12] ARM: dts: sunxi: Prefer A31 bindings for IR
Date:   Tue, 28 May 2019 18:14:32 +0200
Message-Id: <20190528161440.27172-5-peron.clem@gmail.com>
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

Since A31, memory mapping of the IR driver has changed.

Prefer the A31 bindings instead of A13.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
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

