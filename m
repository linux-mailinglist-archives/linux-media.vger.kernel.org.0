Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1D223C9BA7
	for <lists+linux-media@lfdr.de>; Thu, 15 Jul 2021 11:26:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241034AbhGOJ22 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jul 2021 05:28:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241041AbhGOJ21 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jul 2021 05:28:27 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5479C061762;
        Thu, 15 Jul 2021 02:25:33 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id g24so3419506pji.4;
        Thu, 15 Jul 2021 02:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=gcxw6XD4AIeU+4iAv3iUPWpTfU9V4aKQsg+udm/obkg=;
        b=Nsq6X6I4DT8vULD++h4J7WHQlZTpB6uvH0UyuBx6nFk2lzr+3/ePlPKTFrZCkVxE2Z
         zpBsZBkZG6+j1yQkWxIYPHStf6GahaasMQir5pksoBrBS1gecZU6V87tEp2K/KfkKW8C
         6rPpnGECaTyP34WG7bz64eY24ULg1Uj3DcoXvVXwtuLdgjgxydTY4ennfx7h6b7loe9/
         SlDBL22kKNmJyFpdVGwSNO7r724CSkv4KURNRNKE4lEzygmin4J+0EXo4QjqCJgqfPI+
         o6fWp3mIMDOPw+35TU8jKvDujIa6hiMCHCAA7+fPmF8+xrzfZ77HuNC3zy2brsV8U1Sd
         LIMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=gcxw6XD4AIeU+4iAv3iUPWpTfU9V4aKQsg+udm/obkg=;
        b=hzfvGExotdV4ekojnSbezO2L2aLpdNRHvbAxyQQ7weiEg4Q9etjbYMLHP5Fl+S/Mey
         pGKTPvbilbBZGhhQmtjs7SOGjHyNweaXWaTOVXm9r32Ii9UMjxcSi8lmHOeoSGxCA0dK
         Yu2XX3tHtjIx6pwWcBCDUzsUDUXBEVUVu/x5BdOPBSrEQvh/oNqmM8SV6Q6s1oYo4QB1
         QiwMZ64gKvW2bSk4czeQOTxL056W1RLtyX06gBMnu58UG8WbxmVaJ/f00feHIlZRCSrs
         qWpIZscOvvC3cMgAueGENh3X38J4ZaTH0dglqoBxb3ZsOoewMIPiEUHA2YJ6Uo0q4YCc
         jiLA==
X-Gm-Message-State: AOAM532jHsRJGkMa3TXeO3J5GNxVjaiVIV1g03MK/r257j6nNy7JuHSm
        WyoSs4vaGKVLTeLZlFI70G4=
X-Google-Smtp-Source: ABdhPJyI/zo7QyjIE1v+lZ4/2fPtmX3k8URcZKTajjqd60bcfSxnUK499qmJk5g4lAm/r4op8G8JbQ==
X-Received: by 2002:a17:90a:e54d:: with SMTP id ei13mr9042898pjb.187.1626341133441;
        Thu, 15 Jul 2021 02:25:33 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id 11sm6662503pge.7.2021.07.15.02.25.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Jul 2021 02:25:33 -0700 (PDT)
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
Subject: [PATCH v2 3/9] clk: stm32: Fix ltdc's clock turn off by clk_disable_unused() after kernel startup
Date:   Thu, 15 Jul 2021 17:24:22 +0800
Message-Id: <1626341068-20253-14-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1626341068-20253-1-git-send-email-dillon.minfei@gmail.com>
References: <1626341068-20253-1-git-send-email-dillon.minfei@gmail.com>
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
v2: no change

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

