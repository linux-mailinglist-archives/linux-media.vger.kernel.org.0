Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC6A231A518
	for <lists+linux-media@lfdr.de>; Fri, 12 Feb 2021 20:12:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231705AbhBLTLu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Feb 2021 14:11:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231289AbhBLTLs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Feb 2021 14:11:48 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0FFEC061574;
        Fri, 12 Feb 2021 11:11:08 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id x9so353658plb.5;
        Fri, 12 Feb 2021 11:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dUQPqGrqOjvv+mPHTG6J4xufRDhb/jwG8dfmae0QgUA=;
        b=toh7dDdb0nclYftk7bpns5Fsk1Xg81Vo3sQTpUVnKXXdrY1jgRgMj9LYsN7+ssU+Wj
         1MEf6A1x0Of/nqpi6xcBgNBxZMLfKtkFoZsyE1VsNveM6/2YjmqBUKtChvxdgw+s9UPH
         tY9wPpmE2y/xYtV7xO+AK1uDuBV7UXbT7MTGRNwn7cI+S76+Jn8L4AwlnLmLc0x9YzSB
         9Sf3F5HTmC0/+BCTsGH8+9Arkb3BO8jugZ58e/5yRg0bi9olri7c7IJNVWIahCpbmJWi
         Mw/pSg4Sz3o8EdQg/cjmkn6BTBbu3x4+yqVVEjizE4/PwbPtaIfpu7cNeaxQUYotfxh0
         znnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dUQPqGrqOjvv+mPHTG6J4xufRDhb/jwG8dfmae0QgUA=;
        b=mIDds9HZEg7+bS0E8GyQJqIylvPx3sSl2aZhjt64SLnAte+ut4AdsNUR42ety21VQU
         C1E1skRIDgfGZeIFRQICMOiwaVEntITfvCRNc+rMktF/ydDa4bG1FFrr31Fu+m7ryBMr
         /IyCoPudeqYUpS1RnJmdpxEbzJm45yjkxuUsYVtPuCyeDFohCPqRR1piLTH5s48Y2aD+
         u6lHUgIRxIsSY/kBneiLvfwUJukveCS9sSc74WlhO0i5Uzbd52F1eH8GsLfkNF9WyNlF
         dlNR8+B7vj7+XO7Y1egYdKmaj5nJsQ18H1cavnxlK+Cgsm9eGtx0g2aiBMRy3CFTlv5h
         mQDQ==
X-Gm-Message-State: AOAM531OoiuA5V8UhcgVVHdRkS3+j0Kya4W1UcKFLeoVvvqOBpDIlZNJ
        HvInIbyDx6FNmiLvB0QLWxrWv443hlQ=
X-Google-Smtp-Source: ABdhPJzFJrubDP2iMk1Rg4vVAO4Pk2i8PW6t8ita0jcI9KziOc69D9GASt3DCwIgqERu6wx/KarI4A==
X-Received: by 2002:a17:90a:657:: with SMTP id q23mr4082954pje.192.1613157068162;
        Fri, 12 Feb 2021 11:11:08 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 21sm9453862pfh.56.2021.02.12.11.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Feb 2021 11:11:07 -0800 (PST)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     dave.stevenson@raspberrypi.com, maz@kernel.org, eric@anholt.net,
        tzimmermann@suse.de, linux-rpi-kernel@lists.infradead.org,
        hverkuil-cisco@xs4all.nl, nsaenzjulienne@suse.de,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        dri-devel@lists.freedesktop.org, maxime@cerno.tech,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] Revert "ARM: dts: bcm2711: Add the BSC interrupt controller"
Date:   Fri, 12 Feb 2021 11:11:04 -0800
Message-Id: <20210212191104.2365912-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As Dave reported:

This seems to have unintended side effects.  GIC interrupt 117 is shared
between the standard I2C controllers (i2c-bcm2835) and the l2-intc block
handling the HDMI I2C interrupts.

There is not a great way to share an interrupt between an interrupt
controller using the chained IRQ handler which is an interrupt flow and
another driver like i2c-bcm2835 which uses an interrupt handler
(although it specifies IRQF_SHARED).

Simply revert this change for now which will mean that HDMI I2C will be
polled, like it was before.

Reported-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/arm/boot/dts/bcm2711.dtsi | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/arm/boot/dts/bcm2711.dtsi b/arch/arm/boot/dts/bcm2711.dtsi
index 462b1dfb0385..720beec54d61 100644
--- a/arch/arm/boot/dts/bcm2711.dtsi
+++ b/arch/arm/boot/dts/bcm2711.dtsi
@@ -308,14 +308,6 @@ dvp: clock@7ef00000 {
 			#reset-cells = <1>;
 		};
 
-		bsc_intr: interrupt-controller@7ef00040 {
-			compatible = "brcm,bcm2711-l2-intc", "brcm,l2-intc";
-			reg = <0x7ef00040 0x30>;
-			interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-controller;
-			#interrupt-cells = <1>;
-		};
-
 		aon_intr: interrupt-controller@7ef00100 {
 			compatible = "brcm,bcm2711-l2-intc", "brcm,l2-intc";
 			reg = <0x7ef00100 0x30>;
@@ -362,8 +354,6 @@ ddc0: i2c@7ef04500 {
 			reg = <0x7ef04500 0x100>, <0x7ef00b00 0x300>;
 			reg-names = "bsc", "auto-i2c";
 			clock-frequency = <97500>;
-			interrupt-parent = <&bsc_intr>;
-			interrupts = <0>;
 			status = "disabled";
 		};
 
@@ -405,8 +395,6 @@ ddc1: i2c@7ef09500 {
 			reg = <0x7ef09500 0x100>, <0x7ef05b00 0x300>;
 			reg-names = "bsc", "auto-i2c";
 			clock-frequency = <97500>;
-			interrupt-parent = <&bsc_intr>;
-			interrupts = <1>;
 			status = "disabled";
 		};
 	};
-- 
2.25.1

