Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CACE34D49
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 18:30:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727866AbfFDQaO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 12:30:14 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45429 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727844AbfFDQaO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 12:30:14 -0400
Received: by mail-wr1-f65.google.com with SMTP id f9so1795945wre.12;
        Tue, 04 Jun 2019 09:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JnmvhZZD8Mx24yTeSpnfmQh3x3T3CVtR6CE0dBfbLB8=;
        b=Y5cjZ26jlUxFNeNaiMKAFzUilMvI+Dc6dprxGIq8ITJDnDN8XGenta0Zc0Qt2xzz+T
         CUPjfuM/M3IFsd5YHkVn3jG0ZF+d7ttvSaW4BqSKDhwjKZhGnckRWrIKfqzaVnVT0DOg
         XrrRP/AewELt8Ljf3Bixp1jBv8HqPSRWjWxstJLZWnAOSEPa6KaPJLfnUY7ljzM38xj5
         hWBEgZ/wqjDM8gIcaSwO3XVYPrC3Sc/M+0defamCm42VoZoxVykwsLWFXkOer6+UImm9
         1N1T2JFEWwCWtRYt+7i62Okzt95sKHAPrKvZUt3BIZqfwx3ul1tYgjOIw4BHvS1NF7zU
         tyAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JnmvhZZD8Mx24yTeSpnfmQh3x3T3CVtR6CE0dBfbLB8=;
        b=q2PJ1CaeUCF0R8RfMOj7Jj0Ljfm6yLgAoiJsSkSCatOPteubu02AIXkGmhj0lzUPwu
         xs9qTHck/2b1XMnTCrD5yPNgOQ6xl/DE3qInOlDGgoYOi0rho0D7wmzzBs61fcR4YpqL
         TGb5I21f13Cr/oMod8ZUdLesMG+Redzz7pkuisIMPm6bucQL2Yvv2dT5LWh+6bPUCNLv
         DSQ/rBsOTrKPkahkWnydGSRY0HE9ddeb15Aea+Gk2Q8vvLuuskcQAUC6nyJbaNu0M9xu
         Bu5SdjlvX0iH61os84rLsk7diQDSYBi5DyY5KHRNUXgVPwVNVZpmv7ILHZQ0DZCFFDYE
         lH6g==
X-Gm-Message-State: APjAAAXhapliSQJ9p73ACxxkONcQB7DyxkG1YTNcNZ5lgAjs63KAyj+M
        CoFNHLSRrEvNIPfe7GDMQt8=
X-Google-Smtp-Source: APXvYqwA70yB81shWvgQA1UmGXj4nMXog36OwjUoh3hCQCaHYnAaQiNf5aqqateTqEOy2jYk39HyUg==
X-Received: by 2002:adf:e40f:: with SMTP id g15mr20287449wrm.174.1559665812558;
        Tue, 04 Jun 2019 09:30:12 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
        by smtp.gmail.com with ESMTPSA id y12sm15108176wrh.40.2019.06.04.09.30.11
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 04 Jun 2019 09:30:11 -0700 (PDT)
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
Subject: [PATCH v4 06/13] ARM: dts: sunxi: Prefer A31 bindings for IR
Date:   Tue,  4 Jun 2019 18:29:52 +0200
Message-Id: <20190604162959.29199-7-peron.clem@gmail.com>
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
 arch/arm/boot/dts/sunxi-h3-h5.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
index 84977d4eb97a..f0f5ba349c1b 100644
--- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
+++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
@@ -822,7 +822,7 @@
 		};
 
 		ir: ir@1f02000 {
-			compatible = "allwinner,sun5i-a13-ir";
+			compatible = "allwinner,sun6i-a31-ir";
 			clocks = <&r_ccu CLK_APB0_IR>, <&r_ccu CLK_IR>;
 			clock-names = "apb", "ir";
 			resets = <&r_ccu RST_APB0_IR>;
-- 
2.20.1

