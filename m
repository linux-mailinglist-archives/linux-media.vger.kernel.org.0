Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96CD734D56
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 18:30:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728030AbfFDQai (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 12:30:38 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:40808 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727933AbfFDQaW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 12:30:22 -0400
Received: by mail-wr1-f68.google.com with SMTP id p11so11681459wre.7;
        Tue, 04 Jun 2019 09:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R6G/HHE3Lw7PsZVrg7cAYjp5rZiFrvQ8UHmrA7ixhEk=;
        b=Kedeat9Q1DoBS2uCjqTmSzeahTsS+pO8gnneywg90JhjrJLeQ7O6xfmqwM5DmgW/MI
         RWjVZqpB79tnBwnrfcplpN8QBUJDHsnYmW6Wes/VKr6kdbur8gzABlwudagkRk6VRYAB
         dlhAvJMvOHQYVgbF6ED9hxP2cRqKzZDFrPBiFgYD8MbFF6lnNRTpqbtnvGYUVTTMfaDP
         Cm550MzkV5tr91BdIW3smbnjxHcrnFoTZ9S9W9R8kFn2o0G8XQl8U2oDQKEnKGMUMLiH
         QgzmS0V+LcLF8LJ7hvZCvaLeO6GP4uwUEtEe/4oWJ/HNDbQ/rKWeoB5QADX6lxrUR8to
         OF0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R6G/HHE3Lw7PsZVrg7cAYjp5rZiFrvQ8UHmrA7ixhEk=;
        b=emcUEbwl1hdkZfeF94Tp4jSV74NOmUE/Y1E96RoAKAqNLzN2F1D+8UuYlg9Ge4rhRq
         H5QTaf2KELV0nlAhjxW397LQ2SZvljTm42Nid+tg58kLC67+o8IQwVxeNbngxIPKUdqN
         WayPLhHNq9RjTKQQhv+ip5L330mEZ5TtLwFDeoWzxxFR3+h18Y0tA426i9bXzfN1GJdI
         kxlSJASLQvhsG01/ym1H+LlU1VhNM3TFW0gaTtH0zvcMa+d5LrXRrnMMEfanlx25vEdJ
         hcIDfJlDmLbpnVTdughz4FtHm90cogW4A4TCTBS2WapWRc/9s/5LjMYsRkdFqFUciM5a
         oqGA==
X-Gm-Message-State: APjAAAU/Olk/yXKEfSuRI+gs/zEyute3rBXNwXasTc/+3ClObqX4Ov5f
        4VT9FWbKDVSCXhPEc/cS4h4=
X-Google-Smtp-Source: APXvYqwi4oFrO7C1qnIPUTgo/kzDBOoSBBpNkHtnhvHg7KuAsyuewuuG+vnaOzim/mUn8o+LyWKDog==
X-Received: by 2002:adf:e590:: with SMTP id l16mr7127528wrm.257.1559665819998;
        Tue, 04 Jun 2019 09:30:19 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
        by smtp.gmail.com with ESMTPSA id y12sm15108176wrh.40.2019.06.04.09.30.18
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 04 Jun 2019 09:30:19 -0700 (PDT)
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
Subject: [PATCH v4 12/13] arm64: dts: allwinner: h6: Enable IR on H6 boards
Date:   Tue,  4 Jun 2019 18:29:58 +0200
Message-Id: <20190604162959.29199-13-peron.clem@gmail.com>
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

