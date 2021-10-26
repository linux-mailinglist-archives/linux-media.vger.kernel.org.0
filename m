Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F121143ACEE
	for <lists+linux-media@lfdr.de>; Tue, 26 Oct 2021 09:12:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235262AbhJZHO6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Oct 2021 03:14:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234731AbhJZHOr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Oct 2021 03:14:47 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9866CC06122A;
        Tue, 26 Oct 2021 00:12:18 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id o133so13393865pfg.7;
        Tue, 26 Oct 2021 00:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=hyF/RzFfBJTTS6Hbd70K8OAEr7g1NX6pk1CZXFYtYhs=;
        b=VVov/2BwFUxXgkuL8PLdXYwgIkBNhT+m++EFtwBx3Cp56Rhr2Pa2YSS3wTgaV5xyQ5
         NoW7OZfzxfDljOA8BcxtniYArWKBBwHqxl8tOufRSaqLZKn2iBK8MKyfTqe58lBnHW3b
         Cr/QuyjAFU7xaf6V7/RbSMFPyhjG/yDpLdzioG9UbES4/5b6XcroOVwp2GyfSUO2Kkt4
         G/mIf8VpCqkBgBFgnkKlRmXYeWVTB9gaVQeg4DgXAldUKQPfhmpRzaiDTFsuTMBL5y6w
         oDO4gdyiy7uFqDFyqR4ZZLBWapCqRKJrjkUtIj1/naJhHwteLmIAiwL60z+iZZhEylj8
         /Obw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=hyF/RzFfBJTTS6Hbd70K8OAEr7g1NX6pk1CZXFYtYhs=;
        b=CaD29YIK5aTk36s+LZx6A1t76iNyDCfvGLx3nztvkzv2mtE49PumhSXZKJIDc/ifqE
         blLoN8X9DJl/ZpUz6I4Edesq4ll0Jvin4tIjZtbyLBMD6mZsppJTKP4AcOb5DNkgie34
         A9+hYZSxtJjXlaWObGSNAxBQsH4eqD7PeqGOd3szTQz9oXV5b3sOq5eoG2pYSn85tgZS
         fqzyj8UwNMwyT8l86obv4t/wz/5dcyzaT+3xjkLWt0zbWiwtBkk9SZ6bABV85U1PNL9e
         fTDaoVnLpiN9PNG7LdSiPxg2wBXDT/dS6oaT43BtukgIMpdCfz8BUc3zDkaeJMTa29sD
         JtTQ==
X-Gm-Message-State: AOAM5320CYPrQZJ7jRdVnkETOvZS70t9I/rGPaVzciFzRkORvxwq/NO8
        KLHTOMKwlDFJ5Q+7xhef4xo=
X-Google-Smtp-Source: ABdhPJyEHC/nlLvU5vCXzuZSwXcLN+6ocgwaSNzynt9R+H1K1jgbauv8ZO4rWDxKl1lYHH9jya+UZQ==
X-Received: by 2002:a63:2d46:: with SMTP id t67mr17382780pgt.15.1635232338173;
        Tue, 26 Oct 2021 00:12:18 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id l11sm23243367pjg.22.2021.10.26.00.12.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Oct 2021 00:12:17 -0700 (PDT)
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
        devicetree@vger.kernel.org, lkp@intel.com, kbuild-all@lists.01.org,
        llvm@lists.linux.dev
Subject: [PATCH v7 09/10] clk: stm32: Fix ltdc's clock turn off by clk_disable_unused() after system enter shell
Date:   Tue, 26 Oct 2021 15:11:21 +0800
Message-Id: <1635232282-3992-10-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635232282-3992-1-git-send-email-dillon.minfei@gmail.com>
References: <1635232282-3992-1-git-send-email-dillon.minfei@gmail.com>
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
Link: https://lore.kernel.org/linux-arm-kernel/1590564453-24499-7-git-send-email-dillon.minfei@gmail.com/
Link: https://lore.kernel.org/lkml/CAPTRvHkf0cK_4ZidM17rPo99gWDmxgqFt4CDUjqFFwkOeQeFDg@mail.gmail.com/
Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Acked-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Acked-by: Stephen Boyd <sboyd@kernel.org>
---
v7: 
- collect acked-by, reviewed-by from Gabriel, Patrice.

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

