Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AE3A3AB149
	for <lists+linux-media@lfdr.de>; Thu, 17 Jun 2021 12:22:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231209AbhFQKYd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 06:24:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230381AbhFQKYa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 06:24:30 -0400
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AEFCC061574;
        Thu, 17 Jun 2021 03:22:23 -0700 (PDT)
Received: by mail-il1-x132.google.com with SMTP id b14so4918296ilq.7;
        Thu, 17 Jun 2021 03:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/hzhj6uZyztkuz4L9+sZHe6TKd+kUbf+Pfcpd8L+6vA=;
        b=jDQjdVFq6cqHB+5UF2tB/Ekzslo8QM9nPXjpujkz7Du+LXzaIZsoOybGjKU1fod4ta
         y37oAsb1plFAe2Ck8pHuIjsHvPxnS/SecWYGESorjQ7sSk+G/40IunviGlB8LK0lm14t
         pNbcrs5dumgc+nhYaD9XVSZyXeEeV5ZBlOKgE3wdFXiH7sO7hU7xVZ6D5F3U1RsJRp+v
         zilrHfITMm8pPs3SRgtPD7nyQxIjpfNYdJTCF72quRq5+2bHMS+d/hFRZ8NkLK37xj50
         /2DarzyQd5kCrN71aNf9n6NTPYT97wCamgztBc+jx1BkYrD9vIumS9NT28fcr6dnbeSd
         0IdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/hzhj6uZyztkuz4L9+sZHe6TKd+kUbf+Pfcpd8L+6vA=;
        b=KXmDDhYoeLYlx2pu835Y5biY8KzQKYyjOYW4t6oujizPo5EPT12h3PMoUYW6dmZKxX
         noBLQGTmq8PlflChejW/5cIa/TJyIh+kayc6bKk1bCAthk24FLDAIyTX0MxgTSzJnFKD
         eu3qBQS1EFnMb4HfuBEPEccTkhAATFK6mk4fRY3e2rLkhRUDGAGGrUYvMQfUTRSlwqyw
         wAowOZ0YBrCd2WmAsn4PVyLLK4I+djrYpwy8NAoS/xRhs7pH8LGgEI/diNa0vQRJSxPM
         X6rBPPq+iSt2GuT+NkdhmJbywKEbIeAK2s8MkyWc2mnAS/Yt8j8s15OIf4s+tZ3oblY6
         rmow==
X-Gm-Message-State: AOAM5315nmT7uOwL9TD2ATD58GDw3xL4fk2oQL0peK16bjbzBdy5cQCC
        zqb94A5ITDm5Ou9dYf7bYcCrntSkAp4UH8gqBh0=
X-Google-Smtp-Source: ABdhPJxrNI3KDSQldUBRPRw9wR3kxez8+sxD0k7gHJWtaH7GuiGZr+LpkLYkkJie92XNoRL5RgtsXXa5C9MZmHRJqCs=
X-Received: by 2002:a92:a302:: with SMTP id a2mr2970793ili.184.1623925342620;
 Thu, 17 Jun 2021 03:22:22 -0700 (PDT)
MIME-Version: 1.0
References: <1621508727-24486-1-git-send-email-dillon.minfei@gmail.com>
 <1621508727-24486-4-git-send-email-dillon.minfei@gmail.com> <cd510ab8-a128-05cc-2f0b-f70f02d23d04@xs4all.nl>
In-Reply-To: <cd510ab8-a128-05cc-2f0b-f70f02d23d04@xs4all.nl>
From:   Dillon Min <dillon.minfei@gmail.com>
Date:   Thu, 17 Jun 2021 18:21:46 +0800
Message-ID: <CAL9mu0+1sg6R19NqztVs9U00tDAJKsniSeD2gB8NFesGZ2yNGg@mail.gmail.com>
Subject: Re: [PATCH 3/7] clk: stm32: Fix ltdc's clock turn off by
 clk_disable_unused() after kernel startup
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        mchehab+huawei@kernel.org, ezequiel@collabora.com,
        gnurou@gmail.com, Pi-Hsun Shih <pihsun@chromium.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@foss.st.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Patrice CHOTARD <patrice.chotard@foss.st.com>,
        hugues.fruchet@foss.st.com,
        linux-media <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Thu, Jun 17, 2021 at 5:57 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 20/05/2021 13:05, dillon.minfei@gmail.com wrote:
> > From: Dillon Min <dillon.minfei@gmail.com>
> >
> > stm32's clk driver register two ltdc gate clk to clk core by
> > clk_hw_register_gate() and clk_hw_register_composite()
> >
> > first: 'stm32f429_gates[]', clk name is 'ltdc', which no user to use.
> > second: 'stm32f429_aux_clk[]', clk name is 'lcd-tft', used by ltdc driver
> >
> > both of them point to the same offset of stm32's RCC register. after
> > kernel enter console, clk core turn off ltdc's clk as 'stm32f429_gates[]'
> > is no one to use. but, actually 'stm32f429_aux_clk[]' is in use.
> >
> > Fixes: daf2d117cbca ("clk: stm32f4: Add lcd-tft clock")
> > Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> > Acked-by: Stephen Boyd <sboyd@kernel.org>
> > Link: https://lore.kernel.org/linux-arm-kernel/1590564453-24499-7-git-send-email-dillon.minfei@gmail.com/
>
> For my understanding: this patch is going/has already gone in via a different
> subsystem, right? And I should skip it when adding this driver to the media subsystem?

Yes, Just ignore this patch please.

It's only to make st's engineer easier to verify the dma2d driver,
since the board's lcd panel depends on this patch to work

stm32f469-disco board :
https://www.st.com/content/st_com/en/products/evaluation-tools/product-evaluation-tools/mcu-mpu-eval-tools/stm32-mcu-mpu-eval-tools/stm32-discovery-kits/32f469idiscovery.html

Thanks
Best Regards

Dillon

>
> Regards,
>
>         Hans
>
> > ---
> >
> > This patch was submitted in
> > https://lore.kernel.org/lkml/1620990152-19255-1-git-send-email-dillon.minfei@gmail.com/
> >
> >  drivers/clk/clk-stm32f4.c | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
> > index 18117ce5ff85..b6ab8c3a7994 100644
> > --- a/drivers/clk/clk-stm32f4.c
> > +++ b/drivers/clk/clk-stm32f4.c
> > @@ -211,7 +211,6 @@ static const struct stm32f4_gate_data stm32f469_gates[] __initconst = {
> >       { STM32F4_RCC_APB2ENR, 20,      "spi5",         "apb2_div" },
> >       { STM32F4_RCC_APB2ENR, 21,      "spi6",         "apb2_div" },
> >       { STM32F4_RCC_APB2ENR, 22,      "sai1",         "apb2_div" },
> > -     { STM32F4_RCC_APB2ENR, 26,      "ltdc",         "apb2_div" },
> >  };
> >
> >  static const struct stm32f4_gate_data stm32f746_gates[] __initconst = {
> > @@ -557,13 +556,13 @@ static const struct clk_div_table post_divr_table[] = {
> >
> >  #define MAX_POST_DIV 3
> >  static const struct stm32f4_pll_post_div_data  post_div_data[MAX_POST_DIV] = {
> > -     { CLK_I2SQ_PDIV, PLL_I2S, "plli2s-q-div", "plli2s-q",
> > +     { CLK_I2SQ_PDIV, PLL_VCO_I2S, "plli2s-q-div", "plli2s-q",
> >               CLK_SET_RATE_PARENT, STM32F4_RCC_DCKCFGR, 0, 5, 0, NULL},
> >
> > -     { CLK_SAIQ_PDIV, PLL_SAI, "pllsai-q-div", "pllsai-q",
> > +     { CLK_SAIQ_PDIV, PLL_VCO_SAI, "pllsai-q-div", "pllsai-q",
> >               CLK_SET_RATE_PARENT, STM32F4_RCC_DCKCFGR, 8, 5, 0, NULL },
> >
> > -     { NO_IDX, PLL_SAI, "pllsai-r-div", "pllsai-r", CLK_SET_RATE_PARENT,
> > +     { NO_IDX, PLL_VCO_SAI, "pllsai-r-div", "pllsai-r", CLK_SET_RATE_PARENT,
> >               STM32F4_RCC_DCKCFGR, 16, 2, 0, post_divr_table },
> >  };
> >
> >
>
