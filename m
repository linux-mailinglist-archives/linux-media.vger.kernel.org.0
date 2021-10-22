Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDC5F437489
	for <lists+linux-media@lfdr.de>; Fri, 22 Oct 2021 11:15:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232375AbhJVJR1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Oct 2021 05:17:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232180AbhJVJR1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Oct 2021 05:17:27 -0400
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A743C061764;
        Fri, 22 Oct 2021 02:15:10 -0700 (PDT)
Received: by mail-il1-x12a.google.com with SMTP id j10so200009ilu.2;
        Fri, 22 Oct 2021 02:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7DczJgTsrEUe66TRocDFUq17LG2eh3rHGp1OMow1/+w=;
        b=cHca5wcCZFcIOzsxgI1SKRJm8zwJz8tYeN49PeA6DW51nZrTWPmUGV1y4rogZ4zSFc
         FZMCPJHOh7X1ODHnoJNdw6DWP+YeSlhnfEaymoqnvhpfuP7onfUFf72lohDWEOb0hoLs
         36jokar2MqMJ3pcYomSDGtSeTtvKnJGNSqxLypDcez+ghR3Vnj+vYl/0z1E/bZoWd2eB
         OKCV/6+77knnFz0msLAAuecBmCe3xnK7tIdyNj+Vh3dzfeK4A7WCOOsEjPYVTdC5b/JU
         OHo8kRyaBQuN6FrGp7cFTtM0FSUAcCNSpezlTec+R0Vh+F1i98sDepdpXGrfQwbzT7cj
         k22w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7DczJgTsrEUe66TRocDFUq17LG2eh3rHGp1OMow1/+w=;
        b=ntNLzp29s4DWxinLW+uVHrVVQr9AXLcVAxRc+n0YD6l9EkoOtnIulQaFLgNLlq68D0
         5MrPI+6Oq5bqHCECBkxhvz6fnaZXdQ+b/2Vlx4TOTE7vBXZ/UmlRy6q6qy+uWK/g+FSM
         H14WAVHileMTnq3914H4U8rV44WKImg2tBZ3KweZOjxSihL0vhScVXteziSbxdQLr4kh
         wnGzmFR6LFOIWmBzqfy+S6qobB4mgqrfd73+Zz8I7if+/ySyzoaOHvGNh5p9AbHFbXfL
         Ii8W+ldVfdbuxMjzIxMp+yGBrvaGJEL9IH0i+NSO1DQ1mTYrFbH5m7Il146+t43N70I/
         O6Uw==
X-Gm-Message-State: AOAM532ngrqbcmVBBupcGm1cWd6/GXQFM49rjsxy+ElPrcoxUMAiObl0
        hiszxUyXHXK4E7G/q4eMwqAjQHShDsyUQkmluMA=
X-Google-Smtp-Source: ABdhPJztOeX0qbkcDhGUgqmJkz/Xjz1Z8hBdU+o7cNL+/8jFrXgzSoqv4ReeXcrxKop/kg/iRZYdgBvZCtGp/EOroWY=
X-Received: by 2002:a05:6e02:1a05:: with SMTP id s5mr7531783ild.303.1634894109439;
 Fri, 22 Oct 2021 02:15:09 -0700 (PDT)
MIME-Version: 1.0
References: <1634633003-18132-1-git-send-email-dillon.minfei@gmail.com>
 <1634633003-18132-10-git-send-email-dillon.minfei@gmail.com>
 <CAL9mu0Jw99aeSmwy7gnY3XQK3V1V-C1-R8ET5jvSMz7niH=g4g@mail.gmail.com> <b43699a6-dc53-3fcd-6cc9-6b05025cad96@foss.st.com>
In-Reply-To: <b43699a6-dc53-3fcd-6cc9-6b05025cad96@foss.st.com>
From:   Dillon Min <dillon.minfei@gmail.com>
Date:   Fri, 22 Oct 2021 17:14:32 +0800
Message-ID: <CAL9mu0LUs0iwn2NUaUrbDjDGkB8dahdW+86RSeVJPpaP=V8f6A@mail.gmail.com>
Subject: Re: [PATCH v6 09/10] clk: stm32: Fix ltdc's clock turn off by
 clk_disable_unused() after system enter shell
To:     "gabriel.fernandez@foss.st.com" <gabriel.fernandez@foss.st.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        mchehab+huawei@kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        ezequiel@collabora.com, gnurou@gmail.com,
        Pi-Hsun Shih <pihsun@chromium.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@foss.st.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, gabriel.fernandez@st.com,
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

Hi Gabriel

Thanks for the quick response.

Best Regards
Dillon

On Fri, 22 Oct 2021 at 17:10, gabriel.fernandez@foss.st.com
<gabriel.fernandez@foss.st.com> wrote:
>
> Hi Dillon,
>
> You can add my Acked-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
>
> Best Regards
> Gabriel
>
> On 10/22/21 9:25 AM, Dillon Min wrote:
> > Hi Gabriel
> >
> > I guess you are the maintainer of stm32 clk subsystem from [1], Could
> > you help to review this patch, just give a brief of the history:
> >
> > - this patch was acked by Stephen Boyd at [2].
> > - reviewed by Patrice Chotard at [3].
> >
> > Without this patch , the kernel will turn off ltdc's clk after the
> > system reach shell.
> >
> > [1] https://lore.kernel.org/lkml/AM8PR10MB4785545DC980090C1E7D66B281009@AM8PR10MB4785.EURPRD10.PROD.OUTLOOK.COM/
> >
> > [2] https://lore.kernel.org/linux-arm-kernel/159056850835.88029.9264848839121822798@swboyd.mtv.corp.google.com/
> >
> > [3] https://lore.kernel.org/lkml/6915fa2a-e211-476f-8317-6825e280c322@foss.st.com/#t
> >
> > Best Regards
> > Dillon
> >
> > On Tue, 19 Oct 2021 at 16:44, Dillon Min <dillon.minfei@gmail.com> wrote:
> >>
> >> stm32's clk driver register two ltdc gate clk to clk core by
> >> clk_hw_register_gate() and clk_hw_register_composite()
> >>
> >> first: 'stm32f429_gates[]', clk name is 'ltdc', which no user to use.
> >> second: 'stm32f429_aux_clk[]', clk name is 'lcd-tft', used by ltdc driver
> >>
> >> both of them point to the same offset of stm32's RCC register. after
> >> kernel enter console, clk core turn off ltdc's clk as 'stm32f429_gates[]'
> >> is no one to use. but, actually 'stm32f429_aux_clk[]' is in use.
> >>
> >> stm32f469/746/769 have the same issue, fix it.
> >>
> >> Fixes: daf2d117cbca ("clk: stm32f4: Add lcd-tft clock")
> >> Acked-by: Stephen Boyd <sboyd@kernel.org>
> >> Link: https://lore.kernel.org/linux-arm-kernel/1590564453-24499-7-git-send-email-dillon.minfei@gmail.com/
> >> Link: https://lore.kernel.org/lkml/CAPTRvHkf0cK_4ZidM17rPo99gWDmxgqFt4CDUjqFFwkOeQeFDg@mail.gmail.com/
> >> Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> >> ---
> >> v6: no change.
> >>
> >>   drivers/clk/clk-stm32f4.c | 4 ----
> >>   1 file changed, 4 deletions(-)
> >>
> >> diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
> >> index af46176ad053..473dfe632cc5 100644
> >> --- a/drivers/clk/clk-stm32f4.c
> >> +++ b/drivers/clk/clk-stm32f4.c
> >> @@ -129,7 +129,6 @@ static const struct stm32f4_gate_data stm32f429_gates[] __initconst = {
> >>          { STM32F4_RCC_APB2ENR, 20,      "spi5",         "apb2_div" },
> >>          { STM32F4_RCC_APB2ENR, 21,      "spi6",         "apb2_div" },
> >>          { STM32F4_RCC_APB2ENR, 22,      "sai1",         "apb2_div" },
> >> -       { STM32F4_RCC_APB2ENR, 26,      "ltdc",         "apb2_div" },
> >>   };
> >>
> >>   static const struct stm32f4_gate_data stm32f469_gates[] __initconst = {
> >> @@ -211,7 +210,6 @@ static const struct stm32f4_gate_data stm32f469_gates[] __initconst = {
> >>          { STM32F4_RCC_APB2ENR, 20,      "spi5",         "apb2_div" },
> >>          { STM32F4_RCC_APB2ENR, 21,      "spi6",         "apb2_div" },
> >>          { STM32F4_RCC_APB2ENR, 22,      "sai1",         "apb2_div" },
> >> -       { STM32F4_RCC_APB2ENR, 26,      "ltdc",         "apb2_div" },
> >>   };
> >>
> >>   static const struct stm32f4_gate_data stm32f746_gates[] __initconst = {
> >> @@ -286,7 +284,6 @@ static const struct stm32f4_gate_data stm32f746_gates[] __initconst = {
> >>          { STM32F4_RCC_APB2ENR, 21,      "spi6",         "apb2_div" },
> >>          { STM32F4_RCC_APB2ENR, 22,      "sai1",         "apb2_div" },
> >>          { STM32F4_RCC_APB2ENR, 23,      "sai2",         "apb2_div" },
> >> -       { STM32F4_RCC_APB2ENR, 26,      "ltdc",         "apb2_div" },
> >>   };
> >>
> >>   static const struct stm32f4_gate_data stm32f769_gates[] __initconst = {
> >> @@ -364,7 +361,6 @@ static const struct stm32f4_gate_data stm32f769_gates[] __initconst = {
> >>          { STM32F4_RCC_APB2ENR, 21,      "spi6",         "apb2_div" },
> >>          { STM32F4_RCC_APB2ENR, 22,      "sai1",         "apb2_div" },
> >>          { STM32F4_RCC_APB2ENR, 23,      "sai2",         "apb2_div" },
> >> -       { STM32F4_RCC_APB2ENR, 26,      "ltdc",         "apb2_div" },
> >>          { STM32F4_RCC_APB2ENR, 30,      "mdio",         "apb2_div" },
> >>   };
> >>
> >> --
> >> 2.7.4
> >>
