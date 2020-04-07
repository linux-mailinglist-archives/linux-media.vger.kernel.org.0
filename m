Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5330A1A081B
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2020 09:19:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727614AbgDGHT0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Apr 2020 03:19:26 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:42331 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727447AbgDGHT0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Apr 2020 03:19:26 -0400
Received: by mail-ot1-f65.google.com with SMTP id z5so2053982oth.9;
        Tue, 07 Apr 2020 00:19:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g+XZ6eWRxT51LkvH11c8+ThbAOFhSXYL8LBe1VIqCNE=;
        b=DhwSCDl+7ACBPTLQdSB7RuMtuSpajTTFaV1s5fRlZGFa0BWnHe+V0taChTaUWC6W7A
         kWwkl/gKNU7J5BatO4vIwrH1XMrbVISS6GtlUUWf40d4pMgvYIAn8387j7D+snj+MSfh
         IUkh9ZjYemkKOd+bl3Xv6mGq1dY8P57c8aBJl2h95X19isxqf/E3y7/R/BrIW4ykbDFh
         08EwCikjSIOXeTt5BxVOWZpAfRFdVNZCA4ROU60Da0jkTR9KuTnutfF4R2MHnJ25vEDo
         aiXGi6CqoyHAskMtCWAvqQZ4tLfNgP/B1QXE2O9jQb+M2DQ8P35UxbPL9dJ+kUfN868s
         rc1Q==
X-Gm-Message-State: AGi0PuZ9wdcGdXn6NGmysV17i9bxElryOPtHOhgEmqWdo2623TrVwuUG
        BFgOo0nQMlGye+NnRqxudQ/a/pjvUHdoLR2Yq2Q=
X-Google-Smtp-Source: APiQypLUdsK7yU153RxjOxhNIxV/Xw9ACw8OtsLh0XZapYyedux3wnO9XAP0vLKBN6rHQlllM5GrmxNfKkWy8xkAWUo=
X-Received: by 2002:a9d:7590:: with SMTP id s16mr479079otk.250.1586243965762;
 Tue, 07 Apr 2020 00:19:25 -0700 (PDT)
MIME-Version: 1.0
References: <1586191361-16598-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1586191361-16598-4-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1586191361-16598-4-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 7 Apr 2020 09:19:14 +0200
Message-ID: <CAMuHMdX4sGzVWPFYLBiySastZSR2afqMHxmaEh-WhRMAcXFeMQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] media: i2c: ov5645: Turn probe error into warning
 for xvclk frequency mismatch
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Lad Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar,

On Mon, Apr 6, 2020 at 6:43 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> PLL's on platforms might not be so accurate enough to generate the
> required clock frequency, so instead of erroring out on xvlck frequency

xvclk? (but see below)

> mismatch just warn the user and continue ahead in probe.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Like for 2/5, what about the xvclk naming?

> --- a/drivers/media/i2c/ov5645.c
> +++ b/drivers/media/i2c/ov5645.c
> @@ -1103,11 +1103,8 @@ static int ov5645_probe(struct i2c_client *client)
>         }
>         /* external clock must be 24MHz, allow 1% tolerance */
>         xclk_freq = clk_get_rate(ov5645->xclk);
> -       if (xclk_freq < 23760000 || xclk_freq > 24240000) {
> -               dev_err(dev, "external clock frequency %u is not supported\n",
> -                       xclk_freq);
> -               return -EINVAL;
> -       }
> +       if (xclk_freq < 23760000 || xclk_freq > 24240000)
> +               dev_warn(dev, "xvclk mismatched, modes are based on 24MHz\n");

Calling it "xvclk" here will confuse the user, as the clock is named
"xclk" in DT?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
