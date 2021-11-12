Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DA1F44E068
	for <lists+linux-media@lfdr.de>; Fri, 12 Nov 2021 03:40:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234525AbhKLCng (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 21:43:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233752AbhKLCnf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 21:43:35 -0500
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12873C061766;
        Thu, 11 Nov 2021 18:40:46 -0800 (PST)
Received: by mail-il1-x131.google.com with SMTP id i9so7666183ilu.8;
        Thu, 11 Nov 2021 18:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JYtrXD23shdyMcsFVgaL3Kb0G11os2lduL5hO5DAisc=;
        b=jRE5rg1/zaGSX+gVN/bOD8YjB3IaKxvdDoCmy5NcoFuoswXqvRBlIst8meObLmBAxs
         u/iuQQm9Sdbq38gLkav2/5wyrj5hRbZLNC2yZYHXZndX64i53+t1v/b3YSrFbbT6PMy0
         537NSp+aaWYstCxLd0AGLdcUiCzol4Thn5IZvGZNcczz1qFiNFgtEXqQDmTiZ6ewZihF
         JlwJg4FTlauqHGaSdvvOS3CSQLPQaY1aRnSxbCOS4lZ9eppD74hTQpz/MhS5OdftxJ8e
         Q3rKYFyRn8u70EYZ2hxZGjsCB4hQ3VKG44uS59rBEngDVa7kK51VuXWejwMAMg+P2co4
         en0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JYtrXD23shdyMcsFVgaL3Kb0G11os2lduL5hO5DAisc=;
        b=iGd5tHJ1d9vmGbDb02yaRMIzGUhnzdYN2eovIUTOt0pN5+uQCY/ggqK3C5xzDWo1mo
         6kb6wVwS0i1w6Ix2eAuhz1N2GsI/pNYB7YzEjBnOWYlBdzqXlMDyfXR7ffyxBnJAJASz
         u4aN3V3JTN+5RAwf0WgsyjYvaOoQyOiawneJIrLvu2ocUZm84iGrxutwDo1Pw8akQ5F7
         8reYkzquq4kfjefWAyqewGdB2HHso92Dcd1KSL/qOLulyEz8z++gV3zxfRBFFFzjAFx5
         Yk6CUlEpTkIS9ujkmxkb7vZfknSU/NGdUuzKA4mr5tpB15fWcU9MXX07a4qbl3HYXf7L
         ZTRw==
X-Gm-Message-State: AOAM532rZqJ+ShhQoVuZ+42q0X0RNGCoDf6JmkHz2aQ87XbOTmCj0ZTF
        zSYnQ01VkgEVRAOaIQZDJPTFlEE4ey02g9ZRQwk=
X-Google-Smtp-Source: ABdhPJx2ylAuHoOxN4N4gLfnyGTlEMXkoeCsHghAswy/PPJwkBYT64Wngb8jz94z0xFcQDtSgx6XsgDViC6DmJSuuiY=
X-Received: by 2002:a05:6e02:1d1a:: with SMTP id i26mr7591972ila.303.1636684845448;
 Thu, 11 Nov 2021 18:40:45 -0800 (PST)
MIME-Version: 1.0
References: <1635232282-3992-1-git-send-email-dillon.minfei@gmail.com> <1635232282-3992-10-git-send-email-dillon.minfei@gmail.com>
In-Reply-To: <1635232282-3992-10-git-send-email-dillon.minfei@gmail.com>
From:   Dillon Min <dillon.minfei@gmail.com>
Date:   Fri, 12 Nov 2021 10:40:09 +0800
Message-ID: <CAL9mu0LVBSorMK9KbZ3kXYcnubi44yPDxzMroKYVYB2c=o+xjQ@mail.gmail.com>
Subject: Re: [PATCH v7 09/10] clk: stm32: Fix ltdc's clock turn off by
 clk_disable_unused() after system enter shell
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Patrice CHOTARD <patrice.chotard@foss.st.com>,
        Pi-Hsun Shih <pihsun@chromium.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>, gnurou@gmail.com,
        ezequiel@collabora.com, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        mchehab+huawei@kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        hugues.fruchet@foss.st.com,
        linux-media <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, kernel test robot <lkp@intel.com>,
        kbuild-all@lists.01.org, llvm@lists.linux.dev,
        Alexandre TORGUE <alexandre.torgue@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stephen

Would you pick up this patch? Thanks.

Best Regards.
Dillon

On Tue, 26 Oct 2021 at 15:12, Dillon Min <dillon.minfei@gmail.com> wrote:
>
> stm32's clk driver register two ltdc gate clk to clk core by
> clk_hw_register_gate() and clk_hw_register_composite()
>
> first: 'stm32f429_gates[]', clk name is 'ltdc', which no user to use.
> second: 'stm32f429_aux_clk[]', clk name is 'lcd-tft', used by ltdc driver
>
> both of them point to the same offset of stm32's RCC register. after
> kernel enter console, clk core turn off ltdc's clk as 'stm32f429_gates[]'
> is no one to use. but, actually 'stm32f429_aux_clk[]' is in use.
>
> stm32f469/746/769 have the same issue, fix it.
>
> Fixes: daf2d117cbca ("clk: stm32f4: Add lcd-tft clock")
> Link: https://lore.kernel.org/linux-arm-kernel/1590564453-24499-7-git-send-email-dillon.minfei@gmail.com/
> Link: https://lore.kernel.org/lkml/CAPTRvHkf0cK_4ZidM17rPo99gWDmxgqFt4CDUjqFFwkOeQeFDg@mail.gmail.com/
> Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Acked-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> ---
> v7:
> - collect acked-by, reviewed-by from Gabriel, Patrice.
>
>  drivers/clk/clk-stm32f4.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
> index af46176ad053..473dfe632cc5 100644
> --- a/drivers/clk/clk-stm32f4.c
> +++ b/drivers/clk/clk-stm32f4.c
> @@ -129,7 +129,6 @@ static const struct stm32f4_gate_data stm32f429_gates[] __initconst = {
>         { STM32F4_RCC_APB2ENR, 20,      "spi5",         "apb2_div" },
>         { STM32F4_RCC_APB2ENR, 21,      "spi6",         "apb2_div" },
>         { STM32F4_RCC_APB2ENR, 22,      "sai1",         "apb2_div" },
> -       { STM32F4_RCC_APB2ENR, 26,      "ltdc",         "apb2_div" },
>  };
>
>  static const struct stm32f4_gate_data stm32f469_gates[] __initconst = {
> @@ -211,7 +210,6 @@ static const struct stm32f4_gate_data stm32f469_gates[] __initconst = {
>         { STM32F4_RCC_APB2ENR, 20,      "spi5",         "apb2_div" },
>         { STM32F4_RCC_APB2ENR, 21,      "spi6",         "apb2_div" },
>         { STM32F4_RCC_APB2ENR, 22,      "sai1",         "apb2_div" },
> -       { STM32F4_RCC_APB2ENR, 26,      "ltdc",         "apb2_div" },
>  };
>
>  static const struct stm32f4_gate_data stm32f746_gates[] __initconst = {
> @@ -286,7 +284,6 @@ static const struct stm32f4_gate_data stm32f746_gates[] __initconst = {
>         { STM32F4_RCC_APB2ENR, 21,      "spi6",         "apb2_div" },
>         { STM32F4_RCC_APB2ENR, 22,      "sai1",         "apb2_div" },
>         { STM32F4_RCC_APB2ENR, 23,      "sai2",         "apb2_div" },
> -       { STM32F4_RCC_APB2ENR, 26,      "ltdc",         "apb2_div" },
>  };
>
>  static const struct stm32f4_gate_data stm32f769_gates[] __initconst = {
> @@ -364,7 +361,6 @@ static const struct stm32f4_gate_data stm32f769_gates[] __initconst = {
>         { STM32F4_RCC_APB2ENR, 21,      "spi6",         "apb2_div" },
>         { STM32F4_RCC_APB2ENR, 22,      "sai1",         "apb2_div" },
>         { STM32F4_RCC_APB2ENR, 23,      "sai2",         "apb2_div" },
> -       { STM32F4_RCC_APB2ENR, 26,      "ltdc",         "apb2_div" },
>         { STM32F4_RCC_APB2ENR, 30,      "mdio",         "apb2_div" },
>  };
>
> --
> 2.7.4
>
