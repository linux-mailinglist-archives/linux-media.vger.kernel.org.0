Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD6B339987
	for <lists+linux-media@lfdr.de>; Sat,  8 Jun 2019 01:12:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731758AbfFGXLW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jun 2019 19:11:22 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55703 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731725AbfFGXLW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Jun 2019 19:11:22 -0400
Received: by mail-wm1-f67.google.com with SMTP id a15so3495633wmj.5;
        Fri, 07 Jun 2019 16:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=njnjG6a7jdrYLSKYX++HVTkLLSLz4gvoHp7YU4YYSHc=;
        b=rloz6Cds/NcMZNyX5rYQjfALN+w2sD5cwdqhllPoUbXBmo8udxJ0GPHIGW9k93s5Zy
         IaGyx6fa4lOL0OtqX1KdDOP0m4A/Stjp7v3fKISOW9c9HR7JFDMdVV9gyavmg5XydFjy
         1Q5C/XfWld69ItuWgeM7X8Csi5s42hghY7NRTi81LMy7+cIVJNkguVaQwSTU7tPEFOnt
         m80h0avgOSIZHmo8IDE5n5ENCEzrhfQHQzF+bmXv1popmBa17bFYDVJat//VcrWLkJPt
         haGZHYjeygHbonGEmu/0f5VyCQ0mXQeYpR2wYujWxyoryzhertqqaKpFMonDIyBDzVOK
         3KBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=njnjG6a7jdrYLSKYX++HVTkLLSLz4gvoHp7YU4YYSHc=;
        b=fv6j7aNwa+g0khKc9XG1hSGCb7ZEgPZqnWkUVXL/PTDnB/WDGxr0EAW5MfcVDmmOLk
         IXHsnU3+Ks73Ij338i1j/Vmv4N+iaSLNw0M5IAiCIIR0SWo1jVHS1wI2OP8BSHa9fVZf
         RCYNxpd+vtbbFJN71ReFMkn4cZKWjzJ63Z6hYekCUK6BpoRtF0JNv4eiC0LnmrGcRuQe
         sO9ZAVAaR2gHtlxqluEDy+ZQjQT5iQJA7RGP+yWmB/MkxhWHSM3mWlRLx5sHoSh7+j5T
         28jYSOeQNVmQMOq6NIWeF/XAB1xHhW2jN60m0zCdhzGifJwC6Y3YgM2kkewAnfa6c8+s
         INJg==
X-Gm-Message-State: APjAAAWFZGysunZdBfC4nTvIQRdswjquuXVqMg7LHuZGx0eXLH0/DB5x
        d1lXTQVPlvt48UgP3ljVUyc=
X-Google-Smtp-Source: APXvYqzEr1O0RpYAA6xX7b1pY4WlGx9jKDwzLXPofzg39mkwMlQpXn6zyw+shISAW27y3Y6h+x5pVA==
X-Received: by 2002:a7b:cb55:: with SMTP id v21mr5134238wmj.157.1559949080086;
        Fri, 07 Jun 2019 16:11:20 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
        by smtp.gmail.com with ESMTPSA id h84sm4108559wmf.43.2019.06.07.16.11.18
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 07 Jun 2019 16:11:19 -0700 (PDT)
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
Subject: [PATCH v5 11/13] arm64: dts: allwinner: h6: Add IR receiver node
Date:   Sat,  8 Jun 2019 01:10:58 +0200
Message-Id: <20190607231100.5894-12-peron.clem@gmail.com>
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

