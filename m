Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12ABC42D70F
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 12:26:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230369AbhJNK2L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Oct 2021 06:28:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230323AbhJNK1w (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Oct 2021 06:27:52 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFC39C06174E;
        Thu, 14 Oct 2021 03:25:47 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id t11so3842747plq.11;
        Thu, 14 Oct 2021 03:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=KXS2nUcAjz3o0YUh91xZNToPY0k4AGqu28iPxHecA3U=;
        b=gcsmDTCXikZipwe/mjfYMy0k+t8P0l4//3rPe4+Zt16aO3RzxA9aRKuo7ApV5uSiCl
         QuPt9Osur8/HV9m+5Z3xeYf3GUzuF7nt01+lPXt7UuG8uN0/zOME9cW6wqdWUkilfUOu
         C8QsXzsPXoX0TU/IZZH6BxYqSK83rtEruOq0jIb8A7GwctWEXBysx641mxZxgi65b3Xz
         a9f6fJbaUpKukhPBcaxIpSy9P2qJvCjJCZKHK9p2obv+p1TRWR1EY9VAh81WZSUuHQ9M
         ekfd+98ZDFeQ/sKnZB+99J4808ui+orAy13ODgRn8GUHWwLcpjVwadffLmfyvU8eMQUU
         lSfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=KXS2nUcAjz3o0YUh91xZNToPY0k4AGqu28iPxHecA3U=;
        b=kqzisSB5vGU+04v7VvrqZt8FziYQHKcKHYVdx2MYEepCeodoiaKcqm0cSu1yjiPrP8
         SWGvtIXPWdtr5Ogj/N6vlx1AJqCGz9dG4yUih2/Wred6UhU951yg5Q33KUoZh1WpbMrx
         xqXREBo1SU8v6NzXfc9SqN8q+dUrST9F5U8swY6HJC5HMwv8hLQ08KGv6PNEaAGt8DMj
         OoVKfBDT3CiVNeIH9gqqI/7zMGxny8rqS9rjPTUd8gOzBg0/Tj1lVYwBGRtUQ8uSxhWj
         qFzLLyTXmQG5CUU+5Ejw5RY3jkOS3FX5Xk4WQ4RO16ZKpTkhVG8DIXu78KJgPFEOTSn5
         NwQQ==
X-Gm-Message-State: AOAM531dW0gTIMvlcHVnqf66vzvZHdm/+TmHKF41hrSYBh8Jl9nB9Q6F
        Ou4wTUr5bcpJ9MVQg9SPTx0=
X-Google-Smtp-Source: ABdhPJwVDaJUyUEgX1EvPHisAB+vEoDE9e/NrSa6GWYRIx4LR6DrxUimK8nk6LUMtKw6uu0YAJ5yQg==
X-Received: by 2002:a17:90b:30d6:: with SMTP id hi22mr19731006pjb.4.1634207147427;
        Thu, 14 Oct 2021 03:25:47 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id ip10sm2105939pjb.40.2021.10.14.03.25.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Oct 2021 03:25:47 -0700 (PDT)
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
Subject: [PATCH v4 7/8] clk: stm32: Fix ltdc's clock turn off by clk_disable_unused() after system enter shell
Date:   Thu, 14 Oct 2021 18:25:05 +0800
Message-Id: <1634207106-7632-8-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634207106-7632-1-git-send-email-dillon.minfei@gmail.com>
References: <1634207106-7632-1-git-send-email-dillon.minfei@gmail.com>
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

stm32f469/746/769 have the same issue, fix it.

Fixes: daf2d117cbca ("clk: stm32f4: Add lcd-tft clock")
Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
Acked-by: Stephen Boyd <sboyd@kernel.org>
Link: https://lore.kernel.org/linux-arm-kernel/1590564453-24499-7-git-send-email-dillon.minfei@gmail.com/
Link: https://lore.kernel.org/lkml/CAPTRvHkf0cK_4ZidM17rPo99gWDmxgqFt4CDUjqFFwkOeQeFDg@mail.gmail.com/
Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
v4: no change.

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

