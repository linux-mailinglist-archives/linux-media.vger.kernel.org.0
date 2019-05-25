Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3D152A610
	for <lists+linux-media@lfdr.de>; Sat, 25 May 2019 20:10:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727504AbfEYSJx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 May 2019 14:09:53 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:50832 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727411AbfEYSJl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 May 2019 14:09:41 -0400
Received: by mail-wm1-f65.google.com with SMTP id f204so12347012wme.0;
        Sat, 25 May 2019 11:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R6G/HHE3Lw7PsZVrg7cAYjp5rZiFrvQ8UHmrA7ixhEk=;
        b=HvLEmGP+oz6IILCePytF8sAaQ99YcS9Ye2KaDW2bp14SIY5A83hIfqGuc2JLh2at5m
         VMJU7AEvIeX4yVeHXtfNbRseSxGpkzfo3gLbjygTCtvrniKNUIF1pYOcTcwahejKWhgk
         vqLP4JhR5yTm7uDe9Y0jfl9mjgmr9mGn3eDCNA77CJ1yS0PnJzVOWphbOumb2LjSNyqr
         RxALxjCXdaASu+UhkIRjx9gIqei1r+9v/hgYkdykV6L3wsAyEe77B3DtHDQAPn6FyFO3
         4WhLFWqZ8kFxTpUDJKXwsAMGFipCziF/yGDlUhb3eEm+cRdZxa3HaDh04MZLfArAqLVJ
         +19g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R6G/HHE3Lw7PsZVrg7cAYjp5rZiFrvQ8UHmrA7ixhEk=;
        b=XWrrK+E4Fadb6TDLN1t2V7gNGMpyzVLrxK9o63vq8ugkSPUo0xYeVldLijSpsQWikM
         LlifpzK+qsIHnVRGYIFwU6Wfeh3mKNJcp49L8O8xs4O3MGdJU3G2fytiJybuiAK++xf+
         UsP0Q2PtoY9zsXnnBOIVpTl9Glrw+TKmIsZukRdwApy/5wAWX47kzXIN8wXjBa/xLivo
         BcVRYt1yJ2HY9kCRGp72uGIPrxxD17oSyqmYrDNkd6aRY5R4NP2vR7/n2PEYyS4BEtU2
         KE6ZyrUC9/I8qiPwVh/ED9RLQRkLB6Kbis4R9J0rV9L85VoheJvoU1OfaT55alLXvOdZ
         4k4g==
X-Gm-Message-State: APjAAAUzbQktV39XemZnyTXyOZqao2U3LUq+JY/7WkhBVvE6khgyPN5y
        NbwnqGLBobgbGwOj9gadAEVISuho9Nffig==
X-Google-Smtp-Source: APXvYqyYLDpTxJSeuF/1FJtv064Jskcgj+3h2xNEtTfvS4X8dDGpHndFg5GKJaevnY+0KGJxDUs/uQ==
X-Received: by 2002:a1c:d143:: with SMTP id i64mr4263747wmg.176.1558807778819;
        Sat, 25 May 2019 11:09:38 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
        by smtp.gmail.com with ESMTPSA id s127sm5656914wmf.48.2019.05.25.11.09.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 25 May 2019 11:09:38 -0700 (PDT)
From:   =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH 09/10] arm64: dts: allwinner: h6: Enable IR on H6 boards
Date:   Sat, 25 May 2019 20:09:22 +0200
Message-Id: <20190525180923.6105-10-peron.clem@gmail.com>
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

Beelink GS1, OrangePi H6 boards and Pine H64  have an IR receiver.

Enable it in their device-tree.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts | 4 ++++
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi   | 4 ++++
 arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts    | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
index 0dc33c90dd60..680dc29cb089 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
@@ -232,6 +232,10 @@
 	};
 };
 
+&r_ir {
+	status = "okay";
+};
+
 &r_pio {
 	/*
 	 * PL0 and PL1 are used for PMIC I2C
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
index 62e27948a3fa..ec9b6a578e3f 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
@@ -189,6 +189,10 @@
 	};
 };
 
+&r_ir {
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_ph_pins>;
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
index 4802902e128f..ae12ee4fcc77 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
@@ -247,6 +247,10 @@
 	};
 };
 
+&r_ir {
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_ph_pins>;
-- 
2.20.1

