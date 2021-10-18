Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7E8E4313EF
	for <lists+linux-media@lfdr.de>; Mon, 18 Oct 2021 11:59:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229698AbhJRKBq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Oct 2021 06:01:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbhJRKBp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Oct 2021 06:01:45 -0400
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0155C06161C;
        Mon, 18 Oct 2021 02:59:34 -0700 (PDT)
Received: by mail-il1-x133.google.com with SMTP id k3so3871348ilo.7;
        Mon, 18 Oct 2021 02:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yEQAn5uV9AfMBE5tXOwewIzSaClqzwXKCugpoaZ1wLk=;
        b=n6CwHB+oIVObBW5uujQM8Q9GCGrixHj9QdHrVwnwSPKGd76JV2XYjMYVLXdgPhAImU
         t4Ux5p/GHbpNNBJuSOAll7LRYXII8BV40z2kt4vGRBohfzlfwVLizmNl6QTog9IWXVTq
         RcVx4PME/zML631cjdbwdnILpJCUwVzCyB3dFKAxvImpCmtr72jBO26D/tuDzWKCllY8
         ZcqUNolZjaMT22aMdCe2rSLfuk/scebZ8mg0vMwpoKI/M2wEEaxIdLN0SkwSNbaipZUg
         nVohAruew81ozODDp6A4kPC5fi7Wg/e4Xr1lXAEg2iCX0eoeUwNftXNl1DlKTgkycECX
         GhWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yEQAn5uV9AfMBE5tXOwewIzSaClqzwXKCugpoaZ1wLk=;
        b=QT+Wv0qsJi74gHKVu2W6eClYcDRk1eycFHuUaBt2xraR/AVmzJtgadXcU/zr6RBMqR
         7G+PL1aMPPTTPmZ4mJFKoIFl9aMCQtYADXTlLKqHk69qlnmiCqmPF4UnanMDG120orGD
         eqA9kq1udwUHimwjfS8EmGSOCwtRBvoQr57gY6AmnAEoRFVRkrCdTiTxs6mSvSxk6U3p
         wn0F38+qPHwLG13X27xC0LLeKsxfBvDBjagfDzCezdKTu34xShhJIeRF+m+b7IESLchk
         O2KyAfeXQZk9vzdE0l70w8kzk9gEz4PieN4p+TWY8S0inLNammGGlwtyjyYJHnt89rzk
         Np2Q==
X-Gm-Message-State: AOAM531OQN3yVzdBk25oR+UUtWz5QkHCG6/kd+w7i8oMBLH7p1fGjVAk
        Mi23o2s915alufIPZdKgF8HEGabvwYVVy5zgnGQ=
X-Google-Smtp-Source: ABdhPJwpl0Po7TzEvXtBa7vjIvp9QYgcURhpjY4jJKzgN+EYqExncVGlpyZ0GN4mPIAPh51IinDYpdGDT+g3slVkcBo=
X-Received: by 2002:a05:6e02:190a:: with SMTP id w10mr13138492ilu.243.1634551174071;
 Mon, 18 Oct 2021 02:59:34 -0700 (PDT)
MIME-Version: 1.0
References: <1634533488-25334-1-git-send-email-dillon.minfei@gmail.com>
 <1634533488-25334-10-git-send-email-dillon.minfei@gmail.com> <1159ec06-cf36-efef-e87a-5d826b6b44d3@xs4all.nl>
In-Reply-To: <1159ec06-cf36-efef-e87a-5d826b6b44d3@xs4all.nl>
From:   Dillon Min <dillon.minfei@gmail.com>
Date:   Mon, 18 Oct 2021 17:58:57 +0800
Message-ID: <CAL9mu0+wdQ-QGJEfjvc+x4vF--9HdvfG3W+5L3FWR9ij85YvTQ@mail.gmail.com>
Subject: Re: [PATCH v5 09/10] clk: stm32: Fix ltdc's clock turn off by
 clk_disable_unused() after system enter shell
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        mchehab+huawei@kernel.org, ezequiel@collabora.com,
        gnurou@gmail.com, Pi-Hsun Shih <pihsun@chromium.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@foss.st.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, gabriel.fernandez@st.com,
        gabriel.fernandez@foss.st.com,
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

Hi Hans

On Mon, 18 Oct 2021 at 17:37, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> Hi Dillon,
>
> On 18/10/2021 07:04, dillon.minfei@gmail.com wrote:
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
> > stm32f469/746/769 have the same issue, fix it.
> >
> > Fixes: daf2d117cbca ("clk: stm32f4: Add lcd-tft clock")
> > Acked-by: Stephen Boyd <sboyd@kernel.org>
>
> Just to double check (I asked as well when v1 was posted, but that's a long time ago):
> I can ignore this patch, right? If so, then make sure you follow up on this in the clk
> subsystem since it is not yet merged in mainline.
>
> If you DO want me to pick it up, then I see that the clk maintainer has already Acked
> it, so I take it as well.

Appreciate, please help to pick it up.

Thanks & Regards
Dillon

>
> Regards,
>
>         Hans
>
> > Link: https://lore.kernel.org/linux-arm-kernel/1590564453-24499-7-git-send-email-dillon.minfei@gmail.com/
> > Link: https://lore.kernel.org/lkml/CAPTRvHkf0cK_4ZidM17rPo99gWDmxgqFt4CDUjqFFwkOeQeFDg@mail.gmail.com/
> > Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> > ---
> > v5: no change.
> >
> >  drivers/clk/clk-stm32f4.c | 4 ----
> >  1 file changed, 4 deletions(-)
> >
> > diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
> > index af46176ad053..473dfe632cc5 100644
> > --- a/drivers/clk/clk-stm32f4.c
> > +++ b/drivers/clk/clk-stm32f4.c
> > @@ -129,7 +129,6 @@ static const struct stm32f4_gate_data stm32f429_gates[] __initconst = {
> >       { STM32F4_RCC_APB2ENR, 20,      "spi5",         "apb2_div" },
> >       { STM32F4_RCC_APB2ENR, 21,      "spi6",         "apb2_div" },
> >       { STM32F4_RCC_APB2ENR, 22,      "sai1",         "apb2_div" },
> > -     { STM32F4_RCC_APB2ENR, 26,      "ltdc",         "apb2_div" },
> >  };
> >
> >  static const struct stm32f4_gate_data stm32f469_gates[] __initconst = {
> > @@ -211,7 +210,6 @@ static const struct stm32f4_gate_data stm32f469_gates[] __initconst = {
> >       { STM32F4_RCC_APB2ENR, 20,      "spi5",         "apb2_div" },
> >       { STM32F4_RCC_APB2ENR, 21,      "spi6",         "apb2_div" },
> >       { STM32F4_RCC_APB2ENR, 22,      "sai1",         "apb2_div" },
> > -     { STM32F4_RCC_APB2ENR, 26,      "ltdc",         "apb2_div" },
> >  };
> >
> >  static const struct stm32f4_gate_data stm32f746_gates[] __initconst = {
> > @@ -286,7 +284,6 @@ static const struct stm32f4_gate_data stm32f746_gates[] __initconst = {
> >       { STM32F4_RCC_APB2ENR, 21,      "spi6",         "apb2_div" },
> >       { STM32F4_RCC_APB2ENR, 22,      "sai1",         "apb2_div" },
> >       { STM32F4_RCC_APB2ENR, 23,      "sai2",         "apb2_div" },
> > -     { STM32F4_RCC_APB2ENR, 26,      "ltdc",         "apb2_div" },
> >  };
> >
> >  static const struct stm32f4_gate_data stm32f769_gates[] __initconst = {
> > @@ -364,7 +361,6 @@ static const struct stm32f4_gate_data stm32f769_gates[] __initconst = {
> >       { STM32F4_RCC_APB2ENR, 21,      "spi6",         "apb2_div" },
> >       { STM32F4_RCC_APB2ENR, 22,      "sai1",         "apb2_div" },
> >       { STM32F4_RCC_APB2ENR, 23,      "sai2",         "apb2_div" },
> > -     { STM32F4_RCC_APB2ENR, 26,      "ltdc",         "apb2_div" },
> >       { STM32F4_RCC_APB2ENR, 30,      "mdio",         "apb2_div" },
> >  };
> >
> >
>
