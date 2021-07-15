Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C4FE3C9B72
	for <lists+linux-media@lfdr.de>; Thu, 15 Jul 2021 11:25:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240780AbhGOJ1r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jul 2021 05:27:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240761AbhGOJ1q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jul 2021 05:27:46 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72950C061765;
        Thu, 15 Jul 2021 02:24:53 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id my10so3365560pjb.1;
        Thu, 15 Jul 2021 02:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/WxDN386m/02gF4IltuUVKKXTkTakJEWTUA4LPWTxX0=;
        b=UbQFlnT/VEzwxNn/8UfNBaI9DH5IsAzm7C7btpyoodAGqpgHGifPlUOcHd9lX1A5vZ
         J96bqre8YCxLPUPgLB7qGGjD4k1zRGFLqRGPbHvG8PVTwMulyY+FP7b/idh+0WX45UJe
         /sKrhqLKK5Y4IAho394HhCe+AKSbaB2MbVsXIhYNLNaJqpUP1QAMp6+xlNtXYYfMb4Su
         1vvDmJUlpvqBSoG1vSiOVQGYAtadGcimM7kfOdyDYlZA7QB085b8buxApuN7+4VJ7cKJ
         npI7lbDhaHT/phvmIYij1cx5Dfv/lWHEum/x77ZILPB4IHbxDheMiuI7uLJmeHyqHg1w
         LhsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/WxDN386m/02gF4IltuUVKKXTkTakJEWTUA4LPWTxX0=;
        b=DSU/zKCDjDahUYqfh8zJKejhkhZ3t6qBAtbuA9oCrczSuJfXCI5sdtpzJYAxojoJP7
         Aiwj1dcqXxwqojjwJO5mOgBg+zZQNX1xnrjHGvjp8ZaYyQ+ihvqYADkbcdkrkeshzyVZ
         zLpFsbTcFDh4BoQnCj6zOz6nZvNkeIzidEvHmAv+463LyyglBEJJvbFCRyJgwNOTT+ZT
         2KZONREHqZcOyKi7YZUsjCFWSVAZskPIxPUbgBFCx/6fsAds6IU7vTX7t78HZHP8Vvhf
         B7s33+8fGkC8wjBmw2mFtt0lxw37KhfaVNWq0ZTeXO6WrIKYr2OxCZH/NJniko4hVUnx
         2QWw==
X-Gm-Message-State: AOAM530fXcYHicZN7eIDigY2vhAMHccxD4obNj4v9TWuS5ku6fbtcefa
        xMDBzBoYK56pYik4F3b1I54=
X-Google-Smtp-Source: ABdhPJxdVjWwXUqUJ1cQCSZcWLgwAKdNFOfLW61IC+slO0gxQDMBRbtlzy8RUwnb/275zXsHWrj2ew==
X-Received: by 2002:a17:90a:d3d2:: with SMTP id d18mr9262416pjw.102.1626341093065;
        Thu, 15 Jul 2021 02:24:53 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id 11sm6662503pge.7.2021.07.15.02.24.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Jul 2021 02:24:52 -0700 (PDT)
From:   dillon.minfei@gmail.com
To:     mchehab@kernel.org, mchehab+huawei@kernel.org,
        hverkuil-cisco@xs4all.nl, ezequiel@collabora.com, gnurou@gmail.com,
        pihsun@chromium.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org
Cc:     patrice.chotard@foss.st.com, hugues.fruchet@foss.st.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Dillon Min <dillon.minfei@gmail.com>
Subject: [PATCH v2 4/9] ARM: dts: stm32: Enable DMA2D support on STM32F429 MCU
Date:   Thu, 15 Jul 2021 17:24:13 +0800
Message-Id: <1626341068-20253-5-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1626341068-20253-1-git-send-email-dillon.minfei@gmail.com>
References: <1626341068-20253-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dillon Min <dillon.minfei@gmail.com>

Enable DMA2D on STM32F429 MCU.

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
v2: no change

 arch/arm/boot/dts/stm32f429.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
index 8748d5850298..a06437f2210d 100644
--- a/arch/arm/boot/dts/stm32f429.dtsi
+++ b/arch/arm/boot/dts/stm32f429.dtsi
@@ -791,6 +791,16 @@
 			status = "disabled";
 		};
 
+		dma2d: dma2d@4002b000 {
+			compatible = "st,stm32-dma2d";
+			reg = <0x4002b000 0xc00>;
+			interrupts = <90>;
+			resets = <&rcc STM32F4_AHB1_RESET(DMA2D)>;
+			clocks = <&rcc 0 STM32F4_AHB1_CLOCK(DMA2D)>;
+			clock-names = "dma2d";
+			status = "disabled";
+		};
+
 		rng: rng@50060800 {
 			compatible = "st,stm32-rng";
 			reg = <0x50060800 0x400>;
-- 
2.7.4

