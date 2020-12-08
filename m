Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 297BD2D20CE
	for <lists+linux-media@lfdr.de>; Tue,  8 Dec 2020 03:28:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727558AbgLHC2b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 21:28:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727179AbgLHC2b (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Dec 2020 21:28:31 -0500
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com [IPv6:2607:f8b0:4864:20::f44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F4C0C061749;
        Mon,  7 Dec 2020 18:27:51 -0800 (PST)
Received: by mail-qv1-xf44.google.com with SMTP id 62so7605185qva.11;
        Mon, 07 Dec 2020 18:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M6BrLtQzjtTPKyMV2O2fXe6jMdLz4xz3CFXS9fstNao=;
        b=RRnyDGHry2kQNjUragxCULNdKfvOQy05D2huodFRwOLiedS2MAL2DIFE3DlnqgS9jU
         Gfv0qINCbzTr6zM45qlfrJm5Pr6kMt1aLvWXSdupuZti//5M3Xtwo0OTCcvjHAkk/jCi
         lbI21+EYXua/3dz7BFK5CrbVUNhRk+MkC2wvk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M6BrLtQzjtTPKyMV2O2fXe6jMdLz4xz3CFXS9fstNao=;
        b=FcDIsYx7vSVzF3nrpIpXepKdpN+iKcvr00VQhHZ0jpfCqJnG2CFCaAGpXtMep5L4da
         hykVegOWxFNIEnIcs6LVR4/7K7UeGhAc7w4PKyYcMYlomOnbcfXfiJA1MLjbJc9dUCmS
         GqXt+JsIJKGjCtfA6LdhGOt3CX7EN6wrKOlqCpn6e24fDFLPqn5upAxvzamyqghB0gxS
         qoSTrEDM4GmU08g7EYM8AaLALtz2JL7eBEsuZJV7QJMWTazs81CPBCN4si6lCa53qBmH
         DO8WONUUrlozAsefGyeJ51Kv9+xFDXlROHE1n7vApc90TixDEYrPSs6SZPIV5hciHN/r
         pujA==
X-Gm-Message-State: AOAM533f0Vt7QKizlYE8JO8fD+VCgQgXEDQDjwHw4dkIBqswzE1kEBgl
        D+TrZl2XY4pgEzgmyvQf6AtDDEtG4F7JUqzJYY4=
X-Google-Smtp-Source: ABdhPJw29BFw6jgelfIVlOcw2Z1gxH77700UF44YtT2QPZke6I7PlgTaW6fFCR0Fh+6gLBi8JEUGte5SLQPrKOTCZig=
X-Received: by 2002:a05:6214:c66:: with SMTP id t6mr19745975qvj.43.1607394470213;
 Mon, 07 Dec 2020 18:27:50 -0800 (PST)
MIME-Version: 1.0
References: <20201207164240.15436-1-jae.hyun.yoo@linux.intel.com> <20201207164240.15436-2-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20201207164240.15436-2-jae.hyun.yoo@linux.intel.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Tue, 8 Dec 2020 02:27:37 +0000
Message-ID: <CACPK8Xf-5YDB2ofA+ivn8AtKLmVABD2PQ7p678cppu0hka63xQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: ast2600: fix reset settings for eclk and vclk
To:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc:     Andrew Jeffery <andrew@aj.id.au>,
        Eddie James <eajames@linux.ibm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-clk@vger.kernel.org, linux-media@vger.kernel.org,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 7 Dec 2020 at 16:33, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>
> Video engine reset setting should be coupled with eclk to match it
> with the setting for previous Aspeed SoCs which is defined in
> clk-aspeed.c since all Aspeed SoCs are sharing a single video engine
> driver. Also, reset bit 6 is defined as 'Video Engine' reset in
> datasheet so it should be de-asserted when eclk is enabled. This
> commit fixes the setting.
>
> Fixes: d3d04f6c330a ("clk: Add support for AST2600 SoC")
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

This fix should go to stable too.

Thanks Jae.

> ---
>  drivers/clk/clk-ast2600.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/clk-ast2600.c b/drivers/clk/clk-ast2600.c
> index 177368cac6dd..882da16575d4 100644
> --- a/drivers/clk/clk-ast2600.c
> +++ b/drivers/clk/clk-ast2600.c
> @@ -60,10 +60,10 @@ static void __iomem *scu_g6_base;
>  static const struct aspeed_gate_data aspeed_g6_gates[] = {
>         /*                                  clk rst  name               parent   flags */
>         [ASPEED_CLK_GATE_MCLK]          = {  0, -1, "mclk-gate",        "mpll",  CLK_IS_CRITICAL }, /* SDRAM */
> -       [ASPEED_CLK_GATE_ECLK]          = {  1, -1, "eclk-gate",        "eclk",  0 },   /* Video Engine */
> +       [ASPEED_CLK_GATE_ECLK]          = {  1,  6, "eclk-gate",        "eclk",  0 },   /* Video Engine */
>         [ASPEED_CLK_GATE_GCLK]          = {  2,  7, "gclk-gate",        NULL,    0 },   /* 2D engine */
>         /* vclk parent - dclk/d1clk/hclk/mclk */
> -       [ASPEED_CLK_GATE_VCLK]          = {  3,  6, "vclk-gate",        NULL,    0 },   /* Video Capture */
> +       [ASPEED_CLK_GATE_VCLK]          = {  3, -1, "vclk-gate",        NULL,    0 },   /* Video Capture */
>         [ASPEED_CLK_GATE_BCLK]          = {  4,  8, "bclk-gate",        "bclk",  0 }, /* PCIe/PCI */
>         /* From dpll */
>         [ASPEED_CLK_GATE_DCLK]          = {  5, -1, "dclk-gate",        NULL,    CLK_IS_CRITICAL }, /* DAC */
> --
> 2.17.1
>
