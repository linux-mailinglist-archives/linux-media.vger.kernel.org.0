Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC6C42AC8B
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2019 00:27:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726366AbfEZW0I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 May 2019 18:26:08 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:38663 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726274AbfEZWZz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 May 2019 18:25:55 -0400
Received: by mail-wm1-f65.google.com with SMTP id t5so13955197wmh.3;
        Sun, 26 May 2019 15:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R6G/HHE3Lw7PsZVrg7cAYjp5rZiFrvQ8UHmrA7ixhEk=;
        b=vAPJYNIgJbg379x5TSG1UjdT8jbZpl4hvt21vzKGAjZJEvX/UJix9FBFG7hjmFhzy4
         za/2ff4UluXZZxfPhzoxKWemEWXzv1PFVnX1aVc1T5RGYLH4TwEV56cE9cT7Ufth1mXi
         fAl3w3sCU+zz2VVSaIYQQjWozvEiMKFkukqb5DKWk8I2ohzlBo4wrnh1nNnqee4UIUXc
         KIDlXY+a0J4HR3GMMXKSv1nTV9qD3Wpo+/vgwcNeVVxJLj5DnHLODnv8OutEdud+ISrB
         Q62+GJ09cDr91x5MOsD0T2l6RLhawzGUmfdnYfnThqmzwPzaFLcAVyRd1XE3KeOzzVLQ
         dzVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R6G/HHE3Lw7PsZVrg7cAYjp5rZiFrvQ8UHmrA7ixhEk=;
        b=nkqJfy/UApUIbowxrArXvFyGwJC9k2lAqMJPjBlp0w6HR76Rrz+FDit+seNm0NdSIr
         KN8MSpvYX/zUrs4aQSGCnamjOHSAMwmh9Wpsc/D5VDqsBfMInN68xFTVOb1+1QkOcTs4
         UFI44frh8Xdi8OSLpYr0pP3DesV0tnzmM3xYJdOouyijrHFUCNkDyQKAmAGf1OU2Cyw+
         F4p1a7jMtOoSFkZftIlj3b3dbioQeeCSN/T6dMloF0wnt9n1HgJPhHMf/YPn79+9xAaY
         YIgjUwEymoIzm06+gtQN9EMihMYWQHpjXSxDkB2USQ/eVLDtSV5O9YbLXEqSyW0h3FFz
         /buQ==
X-Gm-Message-State: APjAAAUQe8v8bLc00yjZ2LD3cZx0LrWFcASmbxrjnPyXXptyA8xKTiKd
        IrHAVwV6AiiDsPjI9cbEXrQ=
X-Google-Smtp-Source: APXvYqwKDaZc9r4kJO6lse9EMVISrv3fmUs9dX0gWrCzsdIlT+3R6I2IjzVSJxdAXiChfzLxDrB1mw==
X-Received: by 2002:a1c:cb05:: with SMTP id b5mr7808670wmg.146.1558909553540;
        Sun, 26 May 2019 15:25:53 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
        by smtp.gmail.com with ESMTPSA id o20sm10368398wro.2.2019.05.26.15.25.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 May 2019 15:25:52 -0700 (PDT)
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
Subject: [PATCH v2 09/10] arm64: dts: allwinner: h6: Enable IR on H6 boards
Date:   Mon, 27 May 2019 00:25:35 +0200
Message-Id: <20190526222536.10917-10-peron.clem@gmail.com>
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

Beelink GS1, OrangePi H6 boards and Pine H64 have an IR receiver.

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

