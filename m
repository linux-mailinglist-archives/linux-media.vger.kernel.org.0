Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 680C14267DA
	for <lists+linux-media@lfdr.de>; Fri,  8 Oct 2021 12:30:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239830AbhJHKcc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Oct 2021 06:32:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230074AbhJHKca (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Oct 2021 06:32:30 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B450C061570;
        Fri,  8 Oct 2021 03:30:35 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id oa6-20020a17090b1bc600b0019ffc4b9c51so9059637pjb.2;
        Fri, 08 Oct 2021 03:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=t3NdgUxFuRWErDfaVwf7s4lHqmvHQTxX2pad0GzH++k=;
        b=TprIH9OfnpHAcfh6ZMb95W60Cp7uyvwy0doxNpqJ6zxsuc5gAfs76dgey+H4nJPUui
         Xq+ac0GYw0U/+YqNmBPgBOutsB9MkSP20AgbkIVKYTA6SeiBT2i9m4F9/LWrxUxrlesf
         HWD84TP6H3yrajJ9H5u4RwEkBEJKMX025sZjy/Za4CQ050UW7KApfsnFYJnLP5ac/hp4
         Yv2V7YMW/xEuZ1IMsZMNQjBwvTHfkQ9ZlvEC0lPEmg7GagAlMY/WlI6St68lpSFrv9l/
         PIckAKgmnzoCwQ1uDVj1J0GbEhlWvMeYOB8sG8GIThEGWI+QBwPv95MEVTi6UIJw0LCb
         voiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=t3NdgUxFuRWErDfaVwf7s4lHqmvHQTxX2pad0GzH++k=;
        b=kt+lHsAdcKs6pq1trOWlEEbZk8Wt/v1t+OOsa5BksrFyuQ9vWvMJvXS1lNtLfv0ZgY
         23/FA5gTK7thgfVuNGcfp+VET5ddV85ErBBLy7gNOHOh7X6QjUf3dbTPOOFnyXRomB4v
         XYNZQkS8VyVEq5swd7Ej12Rjepy+n38yR8tDwGBB8/9UD6oM/1nSmHJzRPh4sw7V/stq
         /B5xhmwhAh0lzvq/kZwz/J0Hb2Kj0r10eq7Lrj1lulh1GiAYjXk/VSI1bldRl6x1McpU
         4khcahn2mJbmYlX2vCQKRM59QEDj5NDLCeVWUyxvH+YHc4Qsa6VnEgkSVxgePDLOjmRh
         28Hw==
X-Gm-Message-State: AOAM5339G4hpFPoEDaBzqlQ+E+/dAv0KtK3deB8cfZ0ffvA4JQ1WBzgu
        0gx4XvCHVTIcWPRGyMabk5Y=
X-Google-Smtp-Source: ABdhPJwLu4QWPRED0QHuGLIFNuWjH8syqHtuYJR1SdJbHmLU3c/Mgbqg9CXiGOiRThAOVfkutJ16OQ==
X-Received: by 2002:a17:902:da85:b0:13e:f80f:4e19 with SMTP id j5-20020a170902da8500b0013ef80f4e19mr8642678plx.26.1633689034585;
        Fri, 08 Oct 2021 03:30:34 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id y15sm2620151pfa.64.2021.10.08.03.30.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 08 Oct 2021 03:30:34 -0700 (PDT)
From:   dillon.minfei@gmail.com
To:     mchehab@kernel.org, mchehab+huawei@kernel.org,
        hverkuil-cisco@xs4all.nl, ezequiel@collabora.com, gnurou@gmail.com,
        pihsun@chromium.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org, gabriel.fernandez@st.com,
        gabriel.fernandez@foss.st.com
Cc:     patrice.chotard@foss.st.com, hugues.fruchet@foss.st.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Dillon Min <dillon.minfei@gmail.com>
Subject: [PATCH v3 3/8] ARM: dts: stm32: Add DMA2D support for STM32F429 series soc
Date:   Fri,  8 Oct 2021 18:30:07 +0800
Message-Id: <1633689012-14492-4-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1633689012-14492-1-git-send-email-dillon.minfei@gmail.com>
References: <1633689012-14492-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dillon Min <dillon.minfei@gmail.com>

Add DMA2D for STM32F429 series soc.

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
v3: move the dma2d define position before mac.

 arch/arm/boot/dts/stm32f429.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
index 8748d5850298..1d8be5e7c8b8 100644
--- a/arch/arm/boot/dts/stm32f429.dtsi
+++ b/arch/arm/boot/dts/stm32f429.dtsi
@@ -743,6 +743,16 @@
 			st,mem2mem;
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
 		mac: ethernet@40028000 {
 			compatible = "st,stm32-dwmac", "snps,dwmac-3.50a";
 			reg = <0x40028000 0x8000>;
-- 
2.7.4

