Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE6A93998D
	for <lists+linux-media@lfdr.de>; Sat,  8 Jun 2019 01:12:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731797AbfFGXLY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jun 2019 19:11:24 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:36247 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726754AbfFGXLX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Jun 2019 19:11:23 -0400
Received: by mail-wm1-f65.google.com with SMTP id u8so3304446wmm.1;
        Fri, 07 Jun 2019 16:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R6G/HHE3Lw7PsZVrg7cAYjp5rZiFrvQ8UHmrA7ixhEk=;
        b=ahFwOO/zCB7KOdKWJkSz8CtMTvqrKkophCTnEGGeQ3xtTYARUUadbs7ZImeIqQKw8D
         eysDByIUFGrTW6+i5dMZI8Vo1N8mgfKsXFoEIu056VxfQD89aO3IxbFgKHSjYvwYKJjm
         Dowd90UptEAKFpPe22Q7DaEst3SS4OW+1vdbtAWWBLQPeME6eDRwauspq0o1c29s/JpL
         DV5RtsXt6vWGRJmbUPdFm9DUVV3zA/TjZg7IW+Q38Zfo9Iier2NQgIoYf9S/3KIYymFZ
         7gqQGRg9SUXxueVQ/nbYQJHXwblNY79IZV/66Z/70fbYH7Xu1X5q+AvVh6kOeKcDmV6m
         CZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R6G/HHE3Lw7PsZVrg7cAYjp5rZiFrvQ8UHmrA7ixhEk=;
        b=hpQ+oEfnSurH6T5HNzqW5cUrM912lYGLfEN1rvtckkUSYU/EKOGpfVErijN+Q0IrNr
         csBld9JuZOTT6Nt/INHx8BprJA5yIeTZ3L8Kdo0Juesl6Aci8ht4/lz5pLCvzY30Y+wT
         0xtHaplQLFLxRSZWDjhCHCoy4OJnS2cOi3IqjLkJNyh8EGO8Zx8CBrr5R7NN4SqeRf44
         yiAqWf23/8ZuyRcXMQnuf5f+RSVyPEalkHka5Lkn7v+rwPew3TY8wyIvSGOnldJ6+daz
         yqnBzVuN4zCmBs1ZGbg7iPJENDjtB9/vtiAEHwDJMXC61oy1y4YuVMMxD9ThX/1I0uga
         1wMw==
X-Gm-Message-State: APjAAAWX4BeRcZiPL1Uv7uFiv+0bjwB2TFtwZlKBJ2oo1Ma6TATLRRpU
        /4TnvSuD9B2vJQYB7IVEw6k=
X-Google-Smtp-Source: APXvYqz5cDn7B2m4gq6V884tmFOzN3LBGdwFpLdbmiMpU4EIhb2xdLK3DyIN3eLohT14DTmzY2Ds7g==
X-Received: by 2002:a05:600c:2507:: with SMTP id d7mr5078640wma.2.1559949081423;
        Fri, 07 Jun 2019 16:11:21 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
        by smtp.gmail.com with ESMTPSA id h84sm4108559wmf.43.2019.06.07.16.11.20
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 07 Jun 2019 16:11:20 -0700 (PDT)
From:   =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com, linux-arm-kernel@lists.infradead.org,
        linux-media@vger.kernel.org,
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v5 12/13] arm64: dts: allwinner: h6: Enable IR on H6 boards
Date:   Sat,  8 Jun 2019 01:10:59 +0200
Message-Id: <20190607231100.5894-13-peron.clem@gmail.com>
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

