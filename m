Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EE0C38ADE0
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 14:18:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237573AbhETMS7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 08:18:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235063AbhETMSt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 08:18:49 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67840C07A82B;
        Thu, 20 May 2021 04:05:47 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id h20-20020a17090aa894b029015db8f3969eso4460658pjq.3;
        Thu, 20 May 2021 04:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=D9D/SebRgoz4N6yfdEXII2paqsfOcRWX2rFKjrxzcw0=;
        b=n0+pkU5PxKkwmp4xF6CdTboKamzW/tXcbrQ5uXy2S1kHdB5TLUZi7cGi3k+SOHvE4o
         oFZnjz4BftMR8+VLdluJFMVcmP4YlAIu00+IsW2LLvZgSKZr67LBDBY8lEL3/F6DghhP
         xZffUIOFKV7EZ+rOU8BA1+a4hSFq46cOoV63aRe2FJMC5oMl6up6enEpbYe8Tq2sWCk3
         xdiVvEwRzKxxnCK9m80tbvIRxzmJi8TDsyc3bUd8/FrWbWSMWLbtBiGOtLX37MKeisbx
         z82lHVVzGYxJbh8pnmnc1vlqpTS7EDxVV7plJQZP8233WL2TBIx7D1Xr8OobCJkli8cG
         m2AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=D9D/SebRgoz4N6yfdEXII2paqsfOcRWX2rFKjrxzcw0=;
        b=lw9LaXye6JA8jLSm+yX6HYCqhP2rkA7UCiYmzsdRyl6CunxOXWk5Buqxrbhy9sVnKd
         gXIkVQfFHetY9wD+iZiq2VuAG4dKxxnyodCMWmwoNMYrbV3WNdNXC0AOgiBiwm3Ao4lp
         2hxa+vSyv0F2PzO9Qc53AxIix8Vfhl45ZePJvoq+nZ/YfVNu7oZeBW69WBy+2kG4ilel
         Mur6EmOHeJ5cJpkuDDZCMF4/jliTs+qUbm24EDSaHBuEydJG55+I84cYsDQeC5irA8dT
         V/5HHrP5e/kWaPyAxVrhRROGso9Dowl9t1qz2b6AQpIyXBOoBl8yQUC2zupyE3nzQsGy
         0k2A==
X-Gm-Message-State: AOAM533rHFfUQsfCgfcUcuY+c21SHORrLsjCv70lQLx7nnmZ+la4ETbO
        UAevEcdqviUOcxcMTPcSxqg=
X-Google-Smtp-Source: ABdhPJwfmZj1H42oTeBLXCHtpO6AiQLahgiJ5qI8ckQKEweXFrnWuGUD+EQDwyvtBQTlxDZuPTySPw==
X-Received: by 2002:a17:902:820b:b029:ef:4c29:2950 with SMTP id x11-20020a170902820bb02900ef4c292950mr5291860pln.78.1621508747020;
        Thu, 20 May 2021 04:05:47 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id hk15sm5839121pjb.53.2021.05.20.04.05.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 May 2021 04:05:46 -0700 (PDT)
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
Subject: [PATCH 3/7] clk: stm32: Fix ltdc's clock turn off by clk_disable_unused() after kernel startup
Date:   Thu, 20 May 2021 19:05:23 +0800
Message-Id: <1621508727-24486-4-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621508727-24486-1-git-send-email-dillon.minfei@gmail.com>
References: <1621508727-24486-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dillon Min <dillon.minfei@gmail.com>

stm32's clk driver register two ltdc gate clk to clk core by
clk_hw_register_gate() and clk_hw_register_composite()

first: 'stm32f429_gates[]', clk name is 'ltdc', which no user to use.
second: 'stm32f429_aux_clk[]', clk name is 'lcd-tft', used by ltdc driver

both of them point to the same offset of stm32's RCC register. after
kernel enter console, clk core turn off ltdc's clk as 'stm32f429_gates[]'
is no one to use. but, actually 'stm32f429_aux_clk[]' is in use.

Fixes: daf2d117cbca ("clk: stm32f4: Add lcd-tft clock")
Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
Acked-by: Stephen Boyd <sboyd@kernel.org>
Link: https://lore.kernel.org/linux-arm-kernel/1590564453-24499-7-git-send-email-dillon.minfei@gmail.com/
---

This patch was submitted in
https://lore.kernel.org/lkml/1620990152-19255-1-git-send-email-dillon.minfei@gmail.com/

 drivers/clk/clk-stm32f4.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
index 18117ce5ff85..b6ab8c3a7994 100644
--- a/drivers/clk/clk-stm32f4.c
+++ b/drivers/clk/clk-stm32f4.c
@@ -211,7 +211,6 @@ static const struct stm32f4_gate_data stm32f469_gates[] __initconst = {
 	{ STM32F4_RCC_APB2ENR, 20,	"spi5",		"apb2_div" },
 	{ STM32F4_RCC_APB2ENR, 21,	"spi6",		"apb2_div" },
 	{ STM32F4_RCC_APB2ENR, 22,	"sai1",		"apb2_div" },
-	{ STM32F4_RCC_APB2ENR, 26,	"ltdc",		"apb2_div" },
 };
 
 static const struct stm32f4_gate_data stm32f746_gates[] __initconst = {
@@ -557,13 +556,13 @@ static const struct clk_div_table post_divr_table[] = {
 
 #define MAX_POST_DIV 3
 static const struct stm32f4_pll_post_div_data  post_div_data[MAX_POST_DIV] = {
-	{ CLK_I2SQ_PDIV, PLL_I2S, "plli2s-q-div", "plli2s-q",
+	{ CLK_I2SQ_PDIV, PLL_VCO_I2S, "plli2s-q-div", "plli2s-q",
 		CLK_SET_RATE_PARENT, STM32F4_RCC_DCKCFGR, 0, 5, 0, NULL},
 
-	{ CLK_SAIQ_PDIV, PLL_SAI, "pllsai-q-div", "pllsai-q",
+	{ CLK_SAIQ_PDIV, PLL_VCO_SAI, "pllsai-q-div", "pllsai-q",
 		CLK_SET_RATE_PARENT, STM32F4_RCC_DCKCFGR, 8, 5, 0, NULL },
 
-	{ NO_IDX, PLL_SAI, "pllsai-r-div", "pllsai-r", CLK_SET_RATE_PARENT,
+	{ NO_IDX, PLL_VCO_SAI, "pllsai-r-div", "pllsai-r", CLK_SET_RATE_PARENT,
 		STM32F4_RCC_DCKCFGR, 16, 2, 0, post_divr_table },
 };
 
-- 
2.7.4

