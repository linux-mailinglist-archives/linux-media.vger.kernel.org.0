Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 788154267F1
	for <lists+linux-media@lfdr.de>; Fri,  8 Oct 2021 12:31:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239873AbhJHKdB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Oct 2021 06:33:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240036AbhJHKcx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Oct 2021 06:32:53 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7702C061773;
        Fri,  8 Oct 2021 03:30:54 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id nn3-20020a17090b38c300b001a03bb6c4ebso4997816pjb.1;
        Fri, 08 Oct 2021 03:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=++IO6RFxmgIsh9EOoHZYHnkeJIbAQGN9wkMCCBk4kyE=;
        b=CwlDyo774NtGyKk1cxH/9sglt/KFox7LkT9WPq4RfCnIAf/BkETkcyZ+gfEmWVzGnY
         2HQLKpBE68Se4oLP/pXpP40qKq3MH8f2ppWuGZ6BedqOOM5t8MVKd/bmm+GxjsWa97/r
         4fBL7IH8bJiw90lqcJMHheRculDxhUtpU2M23mLygNKLPJmlygKJfyBI9gD1Lksu43CO
         xR7hX2FiA9vm6UojlHrW7Azxk+9tYAKAXyoB0fOOQiPg3EZaWONzabxxXgap/+kgSAge
         X1rHvrcqAIdrkWzAQnxZZRUuV0bQklhb6FrdIrhb0B/2LFdjrUq7fZJFpamKeKBhUPTd
         0CRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=++IO6RFxmgIsh9EOoHZYHnkeJIbAQGN9wkMCCBk4kyE=;
        b=0MFYztVxs4WN2iVqiVRDLS9snQ/Tc4tKcSN/+mmA0szZEgHg9mVhpWf5SqgJfAKUZG
         /c9txxFtOSUbxhHUoW/NJYFyAAnYgSm0R66QH0RytJ6hiXXJPwRuMZG5/s7Bl7va35qB
         LNC0dblvmB+xNTxSeR8hCJ0mvPA8HYXpUZ2k4bST7CJF2KNKOJ8NQd8En7xcjKMMIO+B
         vxdVpHlcdo7MmeNtTSFUoiIophIm0xmBuIe1dIpUhiaS2II5vQKRjy0BhbROqIOeeRT2
         PBbe482AnYKLyE8SDgHnbQMrDWS3dvWej1/73WJOfV5hkwH9Al7Jwr2l3LY7P73a05VI
         4E/g==
X-Gm-Message-State: AOAM531uWaa6u+kq5w5hyhpGPq1bH+kw6iGXAeo7G0mAYe0o0181+eHI
        MyDq8t9iYYqdp5BIZbmBLDI=
X-Google-Smtp-Source: ABdhPJy14VnYxwwq2lQHd+a0qYTqLFH07Gh9t1d4uurzdGPcgHbi+dJcSgw1qqdkSjE8q240Ky+xwA==
X-Received: by 2002:a17:90a:de16:: with SMTP id m22mr11445604pjv.38.1633689054454;
        Fri, 08 Oct 2021 03:30:54 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id y15sm2620151pfa.64.2021.10.08.03.30.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 08 Oct 2021 03:30:54 -0700 (PDT)
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
Subject: [PATCH v3 7/8] clk: stm32: Fix ltdc's clock turn off by clk_disable_unused() after enter shell
Date:   Fri,  8 Oct 2021 18:30:11 +0800
Message-Id: <1633689012-14492-8-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1633689012-14492-1-git-send-email-dillon.minfei@gmail.com>
References: <1633689012-14492-1-git-send-email-dillon.minfei@gmail.com>
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

stm32f469/746/769 has same issue, fix it.

Fixes: daf2d117cbca ("clk: stm32f4: Add lcd-tft clock")
Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
Acked-by: Stephen Boyd <sboyd@kernel.org>
Link: https://lore.kernel.org/linux-arm-kernel/1590564453-24499-7-git-send-email-dillon.minfei@gmail.com/
Link: https://lore.kernel.org/lkml/CAPTRvHkf0cK_4ZidM17rPo99gWDmxgqFt4CDUjqFFwkOeQeFDg@mail.gmail.com/
---
v3: introduce this patch for Gabriel Fernandez to review.

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

