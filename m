Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5252142D6FC
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 12:25:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230221AbhJNK1e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Oct 2021 06:27:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230198AbhJNK1c (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Oct 2021 06:27:32 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 262D4C061570;
        Thu, 14 Oct 2021 03:25:28 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id v8so921452pfu.11;
        Thu, 14 Oct 2021 03:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ipMUO+N8Yq3/DitDfDXQzCUb18T3JUMsKhUaY8JPW7s=;
        b=A0TDd8zSvipUpKepUiq1ZLP4UIkFs0SKwBbgCmFzjpY6a02yQ+cmk+GmAGzUc/B9c0
         6ZlfYPuxLNjiLpEfzyywzqtaM4fzZocJ6vvFU9SV/sxOnaH/Klm9JtddgqHm0OUy7+Xg
         9BRrwbKuPF0huQZGM2q6F+AcZzWtKjn9GSkrVFZevDNwFkynX66GvsHeztThDid2NEKr
         wbQKH2xR0g2+NXrHY21+BWdI0Muzh1lREh5xHIyIVWwB1w9xqz2ywO1mivXBimIumP+O
         9rzrSbyMtTfBxts6Ylq3xslYXOY2pCu6mCxPrY2NwZ4pUhrSsFs7DBw5z2IMheGs5wAo
         4okw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ipMUO+N8Yq3/DitDfDXQzCUb18T3JUMsKhUaY8JPW7s=;
        b=Ad6dM99DoRtt0NMfQKuA/IKt53u/z6xDf5bptzctmL4XqOPYuk8YQf5wmPdcL+eZNu
         TUlKbGXpWNNdl6AVBnpcxn0iOYjNmYfx/qEKw6bAwI0Xg8zNvcyDvdkR8ATCpEdVPYLB
         fGtllCT+dtvXIbibeCP15ubnmoHjGf2WhfcJLIjOQF4TNdHbxTlhaPXSSMxDn4ymznYI
         obKEUw8qlzBSsrmSEM4fNsZ4vuHgC4VxHqY3WPzXTWT6j/KadQArg7MwLnPUbP+sDZP0
         h4atwb9BJ5lF1IYimYgev6YaRogBQYU5da7egk38qGWfpZG2ftZ6G+RTT0KEtwUM1HJz
         TpcA==
X-Gm-Message-State: AOAM533uBgy2b2qE0GEWSzHOFw6F/5li5WD3tMfch2sY5e52F3MK2eeW
        qlmoa6Q0IvEdBCHq6Mz6DVI=
X-Google-Smtp-Source: ABdhPJzcYMkMOh4NxKsESGdglutAm5a/C5ijlMs3/PFBuNzuFu6Wt2iRWEgs5NgnxbGz271ALy1BIw==
X-Received: by 2002:a63:ef01:: with SMTP id u1mr3577722pgh.336.1634207127758;
        Thu, 14 Oct 2021 03:25:27 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id ip10sm2105939pjb.40.2021.10.14.03.25.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Oct 2021 03:25:27 -0700 (PDT)
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
Subject: [PATCH v4 3/8] ARM: dts: stm32: Add DMA2D support for STM32F429 series soc
Date:   Thu, 14 Oct 2021 18:25:01 +0800
Message-Id: <1634207106-7632-4-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634207106-7632-1-git-send-email-dillon.minfei@gmail.com>
References: <1634207106-7632-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dillon Min <dillon.minfei@gmail.com>

Add DMA2D for STM32F429 series soc.

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
v4: no change.

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

