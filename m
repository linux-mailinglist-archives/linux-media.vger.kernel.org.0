Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96EF42CB71
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 18:15:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727484AbfE1QP0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 12:15:26 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39927 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727367AbfE1QPI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 12:15:08 -0400
Received: by mail-wr1-f67.google.com with SMTP id x4so1784751wrt.6;
        Tue, 28 May 2019 09:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f1zmDm9n7G9V5x4Qey/KRvnzXY0A1V0uEl3s5XqqEzY=;
        b=J9kR0LToqcgOqHPK2G2vT86fGv23P9fL28b8i/ZLI+U2hm88ebN5E2QEc/Mc1Te2Mf
         x+9gmUy0MajiKLaI3f9kGwfYNYFBXsN34WLns8T6+o/iNEQyheVTvsjdwFqmaJUwBYtG
         O4yt/bc9WUwsE3EFHIGNPHU2e1F/F8nqu54Oi59jIQJ5PJDXd0154AyX6j/+iktHTTDF
         v8bX4oXtjO9dYCAH17hTXJGHQv4hyIBnN563Fo7mZA6QBHnOE1ZBZ4uc01pjREi/OcVW
         L4UQvPaTT/0OIa4ThFB1+9oUDqN6v0NBrZKGFceAPXglUh7dH2YoI6jV+pAYlHwPBsBO
         EvhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f1zmDm9n7G9V5x4Qey/KRvnzXY0A1V0uEl3s5XqqEzY=;
        b=WEmyPkP064bWy9k/o+MeWYPoSWwCfel6JhWak0xwzn5zsaCIDrVgtI5+ud6xuKmpzK
         d8ZwCOHZo3tO/+2KogfHcdYLPyATmONbzyqgWkQbrCTusydgiFoCUHefgY+QmmEYnPB1
         UFqju64ePcIfXVjlMbNpGC8o0W29yajh11L0u3JppGkIaUTrlZtwUAiZnS3rE6CPHp2K
         nYjqPfHMcIFDjxdTP3Vr8zVBstIAW90iB38OrLs+2u7VIfJYCc9TldPDtTKPjvkOIg+s
         nzOO6E2tz0ytp80VUcicqkBcMYcB+zGlkqX7I7cVY3Let4h+qbZqhIAcfT8NVJ9cAbzz
         SsoQ==
X-Gm-Message-State: APjAAAXEihlOmYX4o/NgXklyQOUDnZ45PBc+iXaVk5J5CIB4M71S0AYp
        oKjCxAvb1CT2p1K9bEScbAOGSM0Q2dqPLA==
X-Google-Smtp-Source: APXvYqwmOqOqJxolC9tUEax25/Sr1ZnPeFKpMVvGK2UA6Zj6v2olTjM+xe+o9RIprAv96UP5geOtYA==
X-Received: by 2002:adf:ed41:: with SMTP id u1mr2256706wro.162.1559060106290;
        Tue, 28 May 2019 09:15:06 -0700 (PDT)
Received: from localhost.localdomain (18.189-60-37.rdns.acropolistelecom.net. [37.60.189.18])
        by smtp.gmail.com with ESMTPSA id l14sm13678787wrt.57.2019.05.28.09.15.05
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 28 May 2019 09:15:05 -0700 (PDT)
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
Subject: [PATCH v3 10/12] arm64: dts: allwinner: h6: Add IR receiver node
Date:   Tue, 28 May 2019 18:14:38 +0200
Message-Id: <20190528161440.27172-11-peron.clem@gmail.com>
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

Allwinner H6 IR is similar to A31 and can use same driver.

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

