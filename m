Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 099EC2B5B38
	for <lists+linux-media@lfdr.de>; Tue, 17 Nov 2020 09:45:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727181AbgKQIoy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Nov 2020 03:44:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727162AbgKQIox (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Nov 2020 03:44:53 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2D8CC0613CF
        for <linux-media@vger.kernel.org>; Tue, 17 Nov 2020 00:44:52 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id l1so22286698wrb.9
        for <linux-media@vger.kernel.org>; Tue, 17 Nov 2020 00:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MLQVEogLPpntY7/K46szj62exzsJj4q8MDOgKu+50fs=;
        b=UwXYEJojzUWxuZWpoyALqr99KGTx93FqzgQE0G5qJdDTQq4GMPGDSFwSpEeMm/xeXp
         Hl099niw1Dj7HM0JGkXGcXV2NY/Ojnrg5xr7g00JeztTpcgM2Q7HOwIl/32oCg2rCvzP
         Mjvd8ZytXAMUIEgWGndAVc625d/Zm/t3W2wEln66xGXULcLjz8EHZKcw9dgiP4eAPlJi
         rfhvftbtYSlWVm92G8MGHc5PQ/KiDN8MRWbvEAmCdfpjKgCZpZAtdsQ59SwkyU0DtxA9
         3qsQP9DhgXVix2xiTF31NQaK+H7G00lLxmqE8Okonti3Dvy0zA+uToYhYTCoMMz7WZft
         4J0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MLQVEogLPpntY7/K46szj62exzsJj4q8MDOgKu+50fs=;
        b=rf1ansgWC5AtDuNXaiI26n3ixyZQhHM7V0R0njKt3zrwg3yaoW65rRgbFHfPkWOyHn
         DR6qGXVi3uYSNpmmD7OaW+WSR5lGdV2uukFN4zM6wsJ+7zXrB3Uf83gVREKHrAEQGCvE
         5zucoOTETtrRW6u/yF+2o3QjMu0ZrwwSi0Lqp3824aPqw/qtSV4FsFBMnKRsGoARDDTa
         WbbnZ4VilIGnzKIgPcrCZaFOVe1/SapV2S5B3YQalpGX5HV88R5vMQlVD7dTEDOtXg2l
         bWB4FRbmU5lC+DtwKEOvdTXxx+0R8ml832YE2UDcn3LcOk/0Ysshh3t+Nvef1xf+cYpE
         n5YQ==
X-Gm-Message-State: AOAM531e2HdgzQL8o2j59mW2q3z3ijFiNj5KTDOTj3wAToPMTSZ42tZp
        nlwsTIFE351iZCW/aetB0NzqKw==
X-Google-Smtp-Source: ABdhPJy4mPCg/pB0fVmr1u4LTHLg4BZ8blydsOJL6dwkknwKcwDSczWGuEad0rzYeHrP98k4eq/aGw==
X-Received: by 2002:adf:f607:: with SMTP id t7mr23588748wrp.169.1605602691496;
        Tue, 17 Nov 2020 00:44:51 -0800 (PST)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:1561:9f4b:5829:8e26])
        by smtp.gmail.com with ESMTPSA id s4sm25631423wro.10.2020.11.17.00.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 00:44:50 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     hverkuil@xs4all.nl, khilman@baylibre.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] arm64: dts: meson-axg: add GE2D node
Date:   Tue, 17 Nov 2020 09:44:40 +0100
Message-Id: <20201117084440.578540-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201117084440.578540-1-narmstrong@baylibre.com>
References: <20201117084440.578540-1-narmstrong@baylibre.com>
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
index b9efc8469265..376f5c3f6188 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -1563,6 +1563,15 @@ saradc: adc@9000 {
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

