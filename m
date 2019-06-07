Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A39A39981
	for <lists+linux-media@lfdr.de>; Sat,  8 Jun 2019 01:12:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731708AbfFGXLU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jun 2019 19:11:20 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37545 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731454AbfFGXLT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Jun 2019 19:11:19 -0400
Received: by mail-wm1-f67.google.com with SMTP id 22so3289943wmg.2;
        Fri, 07 Jun 2019 16:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BsQBIKOAel5fnBJ7QqXJ25YvFcF3acsbydOzLPIsKmY=;
        b=F3abP1GJdWlmfJW/OC7w6iBmIU7IT9Rbr586VC3aGTc5hCHZyoeC5LXUTU52seqokB
         0lum/lXwTv7VihyKAp25E94NNv6ebzvAlfrF1jvag8+cGfIg6N3uFqkt0Zi6NXd2Z9Nz
         /W7Te95jk8n3pJ2prulZW7n8rxtBYqG+Tbr71BswZlyJrmixfWUJN9VCTfgwv7RxTIj1
         Ob2CvmKyf8VQAGtQZ+QTSEJEBXR6w7gebLF/0Np8PGacuW8DCAIbVC/5dnyxZm5XarBV
         lA4m/UiPjNoxuw+jm0uxhugbVpVpF2qCtC2PEbOjG8ErLgIaxVd+0k9v+YGJvRZkfFRV
         4Zgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BsQBIKOAel5fnBJ7QqXJ25YvFcF3acsbydOzLPIsKmY=;
        b=GbStUuovSAeFfGMIqo8RHSy218cA5uP9ifMWdU6GPD/ButvyYiPvK0z8dzXehHDjRM
         RFHGMBC9DQ1GAZbht1XR/VL0NRG+DZmdTChfMQeUd7PVFU0C9h6LxSIKG1yQxszKpijy
         NzB60oM5Rg3W9SzBLnfV07gMCJd6ojqBwisrBCf+AS2kDPN7RzISmKYc0uFOH49nS5To
         B3hmYmpzAKDNah762sDMypcD7Qw3ecYEC4UAujGUVOoPZAiLHefnT+FmYmz7q6eOdvld
         SNXDut14aWIBuEGtbqAZXuS1rhso7SxVtJi+UFg0Sx5YAMrr/hO1eP5LfV0pksrUsISs
         ry6w==
X-Gm-Message-State: APjAAAVMguxxzf0JckEks8RoQkM1XK+lH8OcdYOT2FSuXExER5m/qOiU
        h0L7xSvuMpJeGiXRSJx4WVI=
X-Google-Smtp-Source: APXvYqzHBE1qVb3MOsnJZBaCNkT/iFJTJDAo6+g+YPS8ESoYt0STIvyQR+CFM/+/sd3m4Oxt45Vn0Q==
X-Received: by 2002:a05:600c:1150:: with SMTP id z16mr4958318wmz.168.1559949077095;
        Fri, 07 Jun 2019 16:11:17 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
        by smtp.gmail.com with ESMTPSA id h84sm4108559wmf.43.2019.06.07.16.11.16
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 07 Jun 2019 16:11:16 -0700 (PDT)
From:   =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com, linux-arm-kernel@lists.infradead.org,
        linux-media@vger.kernel.org, Igors Makejevs <git_bb@bwzone.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
        Sean Young <sean@mess.org>
Subject: [PATCH v5 08/13] arm64: dts: allwinner: a64: Add IR node
Date:   Sat,  8 Jun 2019 01:10:55 +0200
Message-Id: <20190607231100.5894-9-peron.clem@gmail.com>
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

