Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2F3E3C9B6D
	for <lists+linux-media@lfdr.de>; Thu, 15 Jul 2021 11:25:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240716AbhGOJ1n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jul 2021 05:27:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240399AbhGOJ1m (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jul 2021 05:27:42 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 099EFC06175F;
        Thu, 15 Jul 2021 02:24:49 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id 21so4629446pfp.3;
        Thu, 15 Jul 2021 02:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=gcxw6XD4AIeU+4iAv3iUPWpTfU9V4aKQsg+udm/obkg=;
        b=qglZ+DgC6F7u6ervaKaYaEZwUYh7+bPSG5FB5yGXIebNUJb9SiaMVoaW/ZGliJ9pKQ
         cIS7OmlaeK7wkkLgzoBkJ0warDpy3eWzy4Ncgj4b5jkSzAKpTTRcw77XQjPJAyn+fdXM
         ho/LmesfRkrktxa5fHmU/D9Qmnnz+0RMhNzwon9nYijDwqfyD22eAgH+YLQ1aa2D1Hyh
         blXCcjSGdxmxnKfqbd61QWO3hsh/zG5HNuycl9XLMzvs0zn/jCWj1eUeMD0KssFV/vMx
         KXDfR3HJ7HaRn7zPSSfAKT2vLK79q1UW+q/8pPgHce8PCFbF33LrzFNTHUzvAWkpDDVA
         asRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=gcxw6XD4AIeU+4iAv3iUPWpTfU9V4aKQsg+udm/obkg=;
        b=d8ON6Tk9fonWqsZuCR8UsayUjsao4Zhi2s+PDB442xxgLZQ+DtsgAc2ykEfji4uCXF
         hTqoqko4sIRixMDC+HLTEEcxKzxVr+u8ax+6ndF+y3VO3/xFlpDlFAeOiB05ePDfFGHl
         gRP/WmuqKAt7W+He9CuLO27Q2AmW7IZ611HodkWYploh9ks497AG9sG/MehW51yVBjqm
         lyzoyCRfnJxouj9zcdBJ6qjRqcWvu9yw7v+moO4zG/3hijtqKYmvQCnCZPMC5qCjIuFG
         f2V59BhUAhSraVEskYyU+9rCMX2He//YxaIVEmrTcVyAM2vdL0h1icR3dtMSIVjWsTJd
         288Q==
X-Gm-Message-State: AOAM533V1PwE685QqhUTTYJFc2jeNt6Au1FxiFqTwKhEXReNyCzkx/Bp
        ZC65CwQIXaURB6VX3v0quoU=
X-Google-Smtp-Source: ABdhPJymvED2h/ZxtQkNP+JxkbrY1NC4OA1zIoYXJCnd17uWrM/QM8vjom1RglS2q165XVTkjRel0A==
X-Received: by 2002:a65:6118:: with SMTP id z24mr3577383pgu.325.1626341088600;
        Thu, 15 Jul 2021 02:24:48 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id 11sm6662503pge.7.2021.07.15.02.24.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Jul 2021 02:24:48 -0700 (PDT)
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
Date:   Thu, 15 Jul 2021 17:24:12 +0800
Message-Id: <1626341068-20253-4-git-send-email-dillon.minfei@gmail.com>
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

