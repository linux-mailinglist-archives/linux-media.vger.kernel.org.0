Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18BD1430F89
	for <lists+linux-media@lfdr.de>; Mon, 18 Oct 2021 07:05:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230189AbhJRFHl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Oct 2021 01:07:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbhJRFHc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Oct 2021 01:07:32 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26470C06176A;
        Sun, 17 Oct 2021 22:05:11 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id q5so14834465pgr.7;
        Sun, 17 Oct 2021 22:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=i+sN0ln4C4CZnDhAWrKWfVyRpzPY9us3huE3UGBGxOk=;
        b=GA/+tUwIAFZw9zfAkPz2n2mTpy7fhEf/ZEfbho9GEsH4qTlBcyuwiGxOPCkMhXuiip
         qLtQUzg54RLkVN8DaUo6czVWX+sEuOl5sOJNvhoaVnjppoM2mWprPzEBuGc4NSPUGb5p
         8fKrkaZA8+9VGuFX8JDP1FMZicboxY8l85BSS8HmidPyb0kBgqc0pcXwQetqX75Qb8+p
         YZ6pjxN98Fe1H4wyYOmZDH72v/3s1gcXpu29CkmMrqqzNs7yawwRuvyUllZIse3tvWiq
         bYcRfRF2MfQTK9uLGlsonwhjByScNQMa0udxwK+vWJE34Y8W3tz5BCfoyqsF4vz96Jnj
         D7lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=i+sN0ln4C4CZnDhAWrKWfVyRpzPY9us3huE3UGBGxOk=;
        b=IeBMqKTCLguskMgCwENqGzUs1CN16OJOXCiQjgsceKaSS+sePaekDe2iukPTZaDByC
         H3GrH1EXisV69bs8HBnPfzhbzCwYEwD3iRiG2TmHWpqzUI5N9jMGcdwVGPeVSLhOpaNW
         3DkCLT2vShPPr8tNw6wlxUDvpbqely+0NWHHMkyAPFPFHJV1rTccClkWIO7kkrT9nNlq
         7JDot4o1XTIFfSNszdy6Zi8VD+pbonZMJulCxO/1hnUcwQxTRogfPRe1ZX7sSagBHDo7
         yXsGWZlzOcsZ9x1D7AynuoXZJCTo0weFNEoUrbQ3zjLfPCXwPHOFT/XvMlKjwsed4EgZ
         0Kvw==
X-Gm-Message-State: AOAM532OuMke6QHH5GZdl9JEYPiniuEBpVKCDU/CBhSy8GCWKCFzKvo9
        93v3jXLelKI/E0+DSaZ5Atw=
X-Google-Smtp-Source: ABdhPJzn5dqT+V460e7yLsF03hsg22p2zuEuoGOLx7suc9Apu5B98gpcvGZK25W9D/puTO8HTh4TSw==
X-Received: by 2002:aa7:8497:0:b0:44d:24ce:988d with SMTP id u23-20020aa78497000000b0044d24ce988dmr26405902pfn.18.1634533510768;
        Sun, 17 Oct 2021 22:05:10 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id c205sm11416625pfc.43.2021.10.17.22.05.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 17 Oct 2021 22:05:10 -0700 (PDT)
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
Subject: [PATCH v5 03/10] ARM: dts: stm32: Add DMA2D support for STM32F429 series soc
Date:   Mon, 18 Oct 2021 13:04:41 +0800
Message-Id: <1634533488-25334-4-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634533488-25334-1-git-send-email-dillon.minfei@gmail.com>
References: <1634533488-25334-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dillon Min <dillon.minfei@gmail.com>

Add DMA2D for STM32F429 series soc.

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
v5: no change.

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

