Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79C782AC7E
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2019 00:27:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726197AbfEZWZv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 May 2019 18:25:51 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35664 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726034AbfEZWZu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 May 2019 18:25:50 -0400
Received: by mail-wr1-f65.google.com with SMTP id m3so14994337wrv.2;
        Sun, 26 May 2019 15:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q27XYokGtE0PF+e6Jf1zBq2DoW5PvxIGPkQQOfCJr1E=;
        b=RRVbu4sWt4ZxcFOTHYisTJtdivqZZowGwZPI/XaQ7zxtSBnu+8QMqs1QnGKrRM6E3O
         oJ9jcOLXnxxQbh71CsgMwIGsxntR/R+BBLtRa9dCzu+uEbg6KBVS2zQreHSzNvV4laIM
         u7dG8Lv9ZarOC733yOpZjdBIOnf8m6VhZdwIsyZyTlBzJHX9sE9l9KL8I5rZdusKY67S
         k0aEyUSKAGlVZkJcZ2NyTJMB8d9syVbtxnissO2DY3nSHDPsSuH1rjk0v41cJM56CZg8
         OnHr20kuTuk2TUkrYnE0FSkzeauTZXLd2F7pdj6ZcJCB1tx6kYmWdOE0qf8YLDiLKDQb
         PmtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q27XYokGtE0PF+e6Jf1zBq2DoW5PvxIGPkQQOfCJr1E=;
        b=QmFEGYbpvXJ2fFEYm/dIQxF/BsBbC4l3lYV6jrjXz24LA3nWv9iDjys2RjGUrE4wL3
         fnwsfsnaWHFgfBaD3k2fpRXmdI0KMH9stIhjohcWS/4OzcOInMZO568X2appZvLkEFC/
         S/5NSP7/vL8OnmM0LXNSBaXt71gtjK2JO5JUtJeVtkttCfArHlV7xw1281gqjT+TdSe9
         aUe7uWasENS4U6FyqGt34NR1FWhie/upBqdkKviIHXToFT2lc9KE4agQpteUUVHJHnPS
         h7czKe+xzv9/na/h47HozRxyYquCk6KAeqwu+uooYYKi8kBa4o+qD6tiA5YLBw+pq7Lv
         qdSg==
X-Gm-Message-State: APjAAAX4vEdcJ6xsbGRLBjlQGFVyvUsEl1JvbikCMPKARDfZLsQR8Qn7
        02YvzrIk8QAwvYrCJBBa4Hg=
X-Google-Smtp-Source: APXvYqxb8yu+YLnqa5xxB88D8WdyrJlaqZ/IkWQ0b2ii4BOvjanFcCdF7BqfxTsFG/o1zIYIXGXAtA==
X-Received: by 2002:adf:a4d8:: with SMTP id h24mr15570038wrb.171.1558909549290;
        Sun, 26 May 2019 15:25:49 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
        by smtp.gmail.com with ESMTPSA id o20sm10368398wro.2.2019.05.26.15.25.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 May 2019 15:25:48 -0700 (PDT)
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
Subject: [PATCH v2 05/10] arm64: dts: allwinner: a64: Add IR node
Date:   Mon, 27 May 2019 00:25:31 +0200
Message-Id: <20190526222536.10917-6-peron.clem@gmail.com>
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

