Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80C29433171
	for <lists+linux-media@lfdr.de>; Tue, 19 Oct 2021 10:44:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234834AbhJSIqe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Oct 2021 04:46:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234925AbhJSIq3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Oct 2021 04:46:29 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4C27C061768;
        Tue, 19 Oct 2021 01:44:14 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d9so9817997pfl.6;
        Tue, 19 Oct 2021 01:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Qf2pjhCpfk07YQKtxJ7Ycuq1vo5ZtJccHCuLQD7alI0=;
        b=RLrSpFbXOk9mKOfE+/CLCAUA8uCHIMz3SBRn996JqGd+oOkg9sDjTATvfD9We6xH/i
         sRStywzhdvf0TRWHhm+RH0Bcm6ae+vKn98Rmhmecq92q4YeqeuTiwo5sXnpkBDEQmCBa
         sKbIXuZFdQIxrF2wM1yceaDJZtSYA+n6iWnsBslT8wsyhhG12aIMQ2OEVT0dsMhPMGGw
         DZa3rUH7h+jZ5SVygqD8zzh8/+fNM0a83/CQUzxcMk/fuhbZ8/7p32gT7zmLfpXPlvIq
         +PAA7Lh0BVHkkpafxeRqMdpC19sEqZlbrh/XC+G1YwaO1Z6wShdCOckiRrv7vZ35Lznp
         2uDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Qf2pjhCpfk07YQKtxJ7Ycuq1vo5ZtJccHCuLQD7alI0=;
        b=JQdE7IU7oTAPX4+pnaBfOQWPr4b1vWSEOJPPKowYgVgJYfzCvVo0IIeCU5+rcV33ZW
         cWGuykruEN+5VVkSKU8Gmh2hdzXGDD0oTEWOHBn8FZnT94xj8ZKpnK4dRUhiHAyxOU3g
         BWEC5B6u5FepRTuqLn6vwKYx0GOGLP7qK/OWos3MOS5HMXDOTIdknzBFB57U8u7q+cGS
         w58h5XDD/7VXBV57W4bwtm07xP3LGqI0eo4CHPshJ3Yg6eycG1Q0+XOyIq7j1FXI7sue
         BHX1mmueu8CJXqtjjMeWPUuDsSPq0YCZgu2ZXl5dGKmAK9zewxZDxVGRPjt3ImedG1+R
         vDdw==
X-Gm-Message-State: AOAM531cfaij2CgBUtDTek80UaTLDKsVxwvnDkh1NALPZowSSFiXI/5L
        1eKX2ctSSPYs6W4/AmFIzRE=
X-Google-Smtp-Source: ABdhPJyldc/nOmHnQzAvE7388dI4Radsjo0IQ0KG1jEUqZoRWSO82e9aTHcG8Mp9CkR2nSbMCLLR8g==
X-Received: by 2002:a63:1266:: with SMTP id 38mr27685059pgs.219.1634633054300;
        Tue, 19 Oct 2021 01:44:14 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id c11sm1824716pji.38.2021.10.19.01.44.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Oct 2021 01:44:14 -0700 (PDT)
From:   Dillon Min <dillon.minfei@gmail.com>
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
        devicetree@vger.kernel.org
Subject: [PATCH v6 09/10] clk: stm32: Fix ltdc's clock turn off by clk_disable_unused() after system enter shell
Date:   Tue, 19 Oct 2021 16:43:22 +0800
Message-Id: <1634633003-18132-10-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634633003-18132-1-git-send-email-dillon.minfei@gmail.com>
References: <1634633003-18132-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

stm32's clk driver register two ltdc gate clk to clk core by
clk_hw_register_gate() and clk_hw_register_composite()

first: 'stm32f429_gates[]', clk name is 'ltdc', which no user to use.
second: 'stm32f429_aux_clk[]', clk name is 'lcd-tft', used by ltdc driver

both of them point to the same offset of stm32's RCC register. after
kernel enter console, clk core turn off ltdc's clk as 'stm32f429_gates[]'
is no one to use. but, actually 'stm32f429_aux_clk[]' is in use.

stm32f469/746/769 have the same issue, fix it.

Fixes: daf2d117cbca ("clk: stm32f4: Add lcd-tft clock")
Acked-by: Stephen Boyd <sboyd@kernel.org>
Link: https://lore.kernel.org/linux-arm-kernel/1590564453-24499-7-git-send-email-dillon.minfei@gmail.com/
Link: https://lore.kernel.org/lkml/CAPTRvHkf0cK_4ZidM17rPo99gWDmxgqFt4CDUjqFFwkOeQeFDg@mail.gmail.com/
Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
v6: no change.

 drivers/clk/clk-stm32f4.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
index af46176ad053..473dfe632cc5 100644
--- a/drivers/clk/clk-stm32f4.c
+++ b/drivers/clk/clk-stm32f4.c
@@ -129,7 +129,6 @@ static const struct stm32f4_gate_data stm32f429_gates[] __initconst = {
 	{ STM32F4_RCC_APB2ENR, 20,	"spi5",		"apb2_div" },
 	{ STM32F4_RCC_APB2ENR, 21,	"spi6",		"apb2_div" },
 	{ STM32F4_RCC_APB2ENR, 22,	"sai1",		"apb2_div" },
-	{ STM32F4_RCC_APB2ENR, 26,	"ltdc",		"apb2_div" },
 };
 
 static const struct stm32f4_gate_data stm32f469_gates[] __initconst = {
@@ -211,7 +210,6 @@ static const struct stm32f4_gate_data stm32f469_gates[] __initconst = {
 	{ STM32F4_RCC_APB2ENR, 20,	"spi5",		"apb2_div" },
 	{ STM32F4_RCC_APB2ENR, 21,	"spi6",		"apb2_div" },
 	{ STM32F4_RCC_APB2ENR, 22,	"sai1",		"apb2_div" },
-	{ STM32F4_RCC_APB2ENR, 26,	"ltdc",		"apb2_div" },
 };
 
 static const struct stm32f4_gate_data stm32f746_gates[] __initconst = {
@@ -286,7 +284,6 @@ static const struct stm32f4_gate_data stm32f746_gates[] __initconst = {
 	{ STM32F4_RCC_APB2ENR, 21,	"spi6",		"apb2_div" },
 	{ STM32F4_RCC_APB2ENR, 22,	"sai1",		"apb2_div" },
 	{ STM32F4_RCC_APB2ENR, 23,	"sai2",		"apb2_div" },
-	{ STM32F4_RCC_APB2ENR, 26,	"ltdc",		"apb2_div" },
 };
 
 static const struct stm32f4_gate_data stm32f769_gates[] __initconst = {
@@ -364,7 +361,6 @@ static const struct stm32f4_gate_data stm32f769_gates[] __initconst = {
 	{ STM32F4_RCC_APB2ENR, 21,	"spi6",		"apb2_div" },
 	{ STM32F4_RCC_APB2ENR, 22,	"sai1",		"apb2_div" },
 	{ STM32F4_RCC_APB2ENR, 23,	"sai2",		"apb2_div" },
-	{ STM32F4_RCC_APB2ENR, 26,	"ltdc",		"apb2_div" },
 	{ STM32F4_RCC_APB2ENR, 30,	"mdio",		"apb2_div" },
 };
 
-- 
2.7.4

