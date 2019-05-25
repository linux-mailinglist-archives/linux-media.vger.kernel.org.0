Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AD4F2A605
	for <lists+linux-media@lfdr.de>; Sat, 25 May 2019 20:10:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727393AbfEYSJh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 May 2019 14:09:37 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54604 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727349AbfEYSJh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 May 2019 14:09:37 -0400
Received: by mail-wm1-f68.google.com with SMTP id i3so12322249wml.4;
        Sat, 25 May 2019 11:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q27XYokGtE0PF+e6Jf1zBq2DoW5PvxIGPkQQOfCJr1E=;
        b=SrSzMQys9MTC/2xLSRKZBSUjXhljuG/ZGp8eH19L2BUG75+6aDX+JSSuAbTCmf0C3w
         BrGW0GK9fZMBt4MOJ/CVIR8MCrhKiAVr9Ota136OQS0Fccwft3AzQU4w7kw/cpex7/iK
         u3BmO1g+8jLwdJx1dsLsRzEB+Dm7mxYa7lp4fSP+Wm4BXQH10rX/SNyo1PKsnL3OJHy3
         bvZ28EVxIi/Eb73rbLObriud5TlmsZa23Onbw91uh/xtF67EkgmfmVFfgDhesBjzQQxX
         9SpVdVaFJM1sgSZyiSxrPYuMJZdChQbdVU84hLfa3x8mPqNJVL6hDal6z2fdN4lt9+hT
         6CoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q27XYokGtE0PF+e6Jf1zBq2DoW5PvxIGPkQQOfCJr1E=;
        b=moFinvXruv5Mlj1XIeWyhWqmd8lJ022fWUow6X4j/PkwLbgcf07aRaQMUNKd319KHO
         O2fcHihnJfsJjDq4yZhHHxnkxlhtZXgKlOB8DRjpZhDR+bG2ofjTRT/TySeLt1XqeesK
         Ie/4vyO12Q+q0OluKUIRX+3oOt6fdAjzDIcSVq5Cdl0SVgM6pLx18LTpi8goWVbNpdr4
         xN+FzP4LA8q3/INlrZxUX791dmMSRCmfuRO++Hye+EOBVxYoAbsTn9wTdGsXyYEggfEd
         BRBpv83hiWJS9MD0e9CbsXQWGXBauO5B8Qn76LgqL1bF8uTyk4J3QlXWLheWsEf2vB8A
         6Naw==
X-Gm-Message-State: APjAAAXeakeVFaxL2ZpqhUAGJL1LvTgjXcqqxnOTZUxSSeKWu0h4kKC9
        WHWdIziA0kZbk+Ek0VcqNy0=
X-Google-Smtp-Source: APXvYqwaUGL4sJh71OtyfN00eKHWuGXOq8Rv9Td3pXKmqq0A8gYKOB04Ay8hZqO5UJ088+H7Oq83ow==
X-Received: by 2002:a1c:f20c:: with SMTP id s12mr10674822wmc.151.1558807774794;
        Sat, 25 May 2019 11:09:34 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
        by smtp.gmail.com with ESMTPSA id s127sm5656914wmf.48.2019.05.25.11.09.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 25 May 2019 11:09:34 -0700 (PDT)
From:   =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Igors Makejevs <git_bb@bwzone.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH 05/10] arm64: dts: allwinner: a64: Add IR node
Date:   Sat, 25 May 2019 20:09:18 +0200
Message-Id: <20190525180923.6105-6-peron.clem@gmail.com>
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

