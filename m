Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC65834D48
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 18:30:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727855AbfFDQaO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 12:30:14 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39193 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727826AbfFDQaN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 12:30:13 -0400
Received: by mail-wr1-f67.google.com with SMTP id x4so16529574wrt.6;
        Tue, 04 Jun 2019 09:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E4E30xpqxw1cyUThhqcs8LcBlilNIoX4BY+l8x9uJrk=;
        b=WOubF3Lko3LWSDIpWvmPAXAAhm2TuHCaP4QPXH2488QmNOENFFYoAgMqN5DzcwyL81
         BgNWnnfwKGgPjXQp6DeX9jYpb03pAyoIBRiBwncmw7FGhCieHwtPhAE93HKy1V36SzpH
         MwxGiuBokritpXqReXZHO6xYRgAeU2b7cXRE+9bKJIpA9u6coE64Zz07PGYX1Zk7S0f1
         gPjmLgC28L9L+F+ZgF4FP+sKykC9vJ/ynlvoO/Aa2gwkGCS4f/jhdB4AngnI+hJZSo9Z
         gf4FzgXmJK1T09TyPrSiWRd3/LZwQP2bHy2eSOnymIcNSBkbaEgvcsM9i2xOLLrgzMG4
         aJbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E4E30xpqxw1cyUThhqcs8LcBlilNIoX4BY+l8x9uJrk=;
        b=j7P3cAwSNl4Xe1/tw6EiNGS2MHAvlhl+rE74AU3cvzCHgN5nsQaPCk0n/D2Kfvko9A
         IjYiuj7yG1o3xFiOkr7hIHZTm67ojU4PNQIL8BlQlhiIDVpZgMMmSxL9c8H9zVSZgdXk
         ieXx9XpieZAvq7SWusNYfVe+md6YFnA79Hma2TdbvIdwE7yO07tewDjMZVoJUre+r1Uj
         UwPnAfdwJwKvv2u4NUYR+5JRCBpNo7BESeBtzGNMDfWLenPb8laKBthzqt2uQbGL9ZjN
         qqcvDcb7K8kwsWGwkz/b0a1KyY2Bzp63gTvTxVlTEL/Ucf/Z37qmn5u/kifjetVbzDcX
         6qrA==
X-Gm-Message-State: APjAAAXwdDP/HsAl2sSIjOOINwH7L58UzWWouXqbqd4T9ivOo6uJ9YiB
        uN/IvBM84xyUSH6dMyKzAMQ=
X-Google-Smtp-Source: APXvYqzAdmrYB00nq1AF6bb6WEBSVA5fc135x0zqnHQocdDVwGW9tJVeQEfsQVvvFzBzsVsHaTBAzw==
X-Received: by 2002:adf:c60e:: with SMTP id n14mr7423912wrg.255.1559665811137;
        Tue, 04 Jun 2019 09:30:11 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
        by smtp.gmail.com with ESMTPSA id y12sm15108176wrh.40.2019.06.04.09.30.10
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 04 Jun 2019 09:30:10 -0700 (PDT)
From:   =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com,
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
        Sean Young <sean@mess.org>
Subject: [PATCH v4 05/13] ARM: dts: sunxi: Prefer A31 bindings for IR
Date:   Tue,  4 Jun 2019 18:29:51 +0200
Message-Id: <20190604162959.29199-6-peron.clem@gmail.com>
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

Since A31, memory mapping of the IR driver has changed.

Prefer the A31 bindings instead of A13.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
Acked-by: Sean Young <sean@mess.org>
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

