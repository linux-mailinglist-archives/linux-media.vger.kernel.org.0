Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 881132A0812
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 15:38:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726852AbgJ3Oh6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 10:37:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726827AbgJ3Oh5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 10:37:57 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38B38C0613D2
        for <linux-media@vger.kernel.org>; Fri, 30 Oct 2020 07:37:57 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id w14so6703909wrs.9
        for <linux-media@vger.kernel.org>; Fri, 30 Oct 2020 07:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MLQVEogLPpntY7/K46szj62exzsJj4q8MDOgKu+50fs=;
        b=BXgL45pdvPA/qdgaB7dRSqK8o/iZ2Px44eM98lmD5Qtv8a2HvbfT/KsI6jUHoSPOhJ
         +8n59E1oQq6e4j/s17DDf4Gc9k4gTCZ6nV7DHBgV7zUPSofgF0ZVWKLj0kyAyRUpi65Z
         /xMIZni8xobSsWZT8TaDGke9uUvXWnSWtYQDjeheGMDdEgTUQ+X75yOQkrXrPWSSHGAG
         AbrMPqkurCEJwk8GtoOcxPj81eGTlM1Ao5D405B0bWTmesg+6SrTKDgof9m87RAiUTgT
         XTQd91RbXvycZYBg9JhNqWPJ/Y0w4bRt0UHSW4PwWrCeFF85ft15rgNpVOxkdnKX9k7g
         CoYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MLQVEogLPpntY7/K46szj62exzsJj4q8MDOgKu+50fs=;
        b=SnKBVk7RgFC868RhxNO/VsKPrET6flL2JCU+BQQ3BDiaS8Hp3mYVGnn1qqkUc1aKjR
         +uo3HIZhBC9uKTGeKOCXVx5BHhqQ7it4hwHkZvVn78bTFBhWzwhruLBHA+bCw4Utl1Kd
         EK8BTwg4RAXngbNcCqVnrK0ZFNVpREIUqBpClZ1tMthENX2BCesdgvvPek6+2LiboCmH
         gDt1u1n1rOixbmLx+REZSvHCrBfdf26BJeULG3omN6rclhQVOYflZMgvKs3ptx/ob8/5
         Kq9FiWBiLAjwVHiELYaI2GefHNi/TNddyySoGNO07ROxWiXNp5m0yBK6N9z5TgWbY8N3
         E8IQ==
X-Gm-Message-State: AOAM530SDLJh+A86cfot92fQRG2WaOJoa5BLKX5LDI1m+4ktRXPHzldZ
        5qtFUED1xRRsVGKlBU6Ge/PtYA==
X-Google-Smtp-Source: ABdhPJxLpl0ttOzWhJ8Mlq8TG4CfMXiXVp2XCIMU4607i6rnnRmyL1dHnrGpRG4qSGePE6aq7yiwEw==
X-Received: by 2002:adf:e9c6:: with SMTP id l6mr3519102wrn.257.1604068675781;
        Fri, 30 Oct 2020 07:37:55 -0700 (PDT)
Received: from localhost.localdomain ([37.172.114.188])
        by smtp.gmail.com with ESMTPSA id y200sm351481wmc.23.2020.10.30.07.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 07:37:55 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     hverkuil@xs4all.nl, khilman@baylibre.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] arm64: dts: meson-axg: add GE2D node
Date:   Fri, 30 Oct 2020 15:37:15 +0100
Message-Id: <20201030143715.577641-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201030143715.577641-1-narmstrong@baylibre.com>
References: <20201030143715.577641-1-narmstrong@baylibre.com>
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

