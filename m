Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3E822CC42E
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 18:48:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389200AbgLBRpq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 12:45:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387479AbgLBRpp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Dec 2020 12:45:45 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9441C061A4D
        for <linux-media@vger.kernel.org>; Wed,  2 Dec 2020 09:44:31 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id s8so4926031wrw.10
        for <linux-media@vger.kernel.org>; Wed, 02 Dec 2020 09:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s7fXTOo1aazw2JxwuGjclgMvOEDpr6fiuRKDzr3aTR8=;
        b=xv0VaZTRH0v0oboQ91QM5gtP0jffstmJtMQe2QVLsdKl9O6p7QEhxaKpXakYOev6Mm
         nQ6YIrZzJ4I45lWqvV8HCWbFvx8iu0WaThJ0WKkGZxZE9xm9/7pVZRtYHAL13ryKdcqQ
         4VjTSZ80O0pyvYUiMtRH/YzLe/uST9FCkByGq3gfbkuspCo5FTMy4TRQS01uzsKqx3Jk
         +IwDoRw3EZgTopFda+ew1FDIP3uOAsjL4X+jOgeaIT4MeKhpAvdWP6sAf5YzLhUtgfYR
         2VT/DOuf3+GN4R3fOBV6XF0EuPefMax+P9ZtGmD/JUuBUNOYG/4Dc9GogXdwNBedcIUF
         aVKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s7fXTOo1aazw2JxwuGjclgMvOEDpr6fiuRKDzr3aTR8=;
        b=EU/BgWNB75IeMuj9ASyPm9mYy2O/x2uI1RD42n3d6CqIXw0vChxhLv+pPnmqKjpYBv
         kUX+7cO3sJ9Ws23o+R/ZATKCNwe1+iIzIXyB+GiCkQFEMq2I52Gyj4jwqBONT2BDVXir
         bpWwCg0+9piEPgwDOLeVBqq8nBh0FWlaS/hXWtk20iYWcQejn4z8G5AUrO4FybyhzpqI
         8CgC7haS58M82Lde4mfghJJoKKwMJTfWDjgxuEyT0Gf8lJam4B8HR7/QlEr+i2GwdEVS
         38iFPAKeF+GtvUGNmTXn5uQejb7Kfrsy8FReuQZUiASml3ghMVc6GeexL5tQirI3K0Js
         l9XQ==
X-Gm-Message-State: AOAM532MAV2kRpEIFTx31LIBCd7C2h83t60kCmHDdO9v8HpaqfTXcUZP
        ZUEZT3BX1W02nenlHSfOKHqvKQ==
X-Google-Smtp-Source: ABdhPJyp/pXoOl8woo+mTCPlCCyB3BR1ozyf9vbD4WED1vgNH+uYjDWaoa+RLNi1V2lRikNy9pKEug==
X-Received: by 2002:a5d:4ccf:: with SMTP id c15mr4774675wrt.237.1606931070225;
        Wed, 02 Dec 2020 09:44:30 -0800 (PST)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:15b4:c668:8f06:1b99])
        by smtp.gmail.com with ESMTPSA id q12sm2842915wrx.86.2020.12.02.09.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 09:44:29 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     hverkuil@xs4all.nl, khilman@baylibre.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/4] arm64: dts: meson-axg: add GE2D node
Date:   Wed,  2 Dec 2020 18:44:17 +0100
Message-Id: <20201202174417.3778306-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201202174417.3778306-1-narmstrong@baylibre.com>
References: <20201202174417.3778306-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This adds the node for the GE2D accelerator unit.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 724ee179b316..30efbceaa35d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -1605,6 +1605,15 @@ saradc: adc@9000 {
 			};
 		};
 
+		ge2d: ge2d@ff940000 {
+			compatible = "amlogic,axg-ge2d";
+			reg = <0x0 0xff940000 0x0 0x10000>;
+			interrupts = <GIC_SPI 150 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&clkc CLKID_VAPB>;
+			resets = <&reset RESET_GE2D>;
+			reset-names = "core";
+		};
+
 		gic: interrupt-controller@ffc01000 {
 			compatible = "arm,gic-400";
 			reg = <0x0 0xffc01000 0 0x1000>,
-- 
2.25.1

