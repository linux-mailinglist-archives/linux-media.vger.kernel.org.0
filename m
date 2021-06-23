Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BDE43B17C4
	for <lists+linux-media@lfdr.de>; Wed, 23 Jun 2021 12:06:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230175AbhFWKIf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Jun 2021 06:08:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230212AbhFWKIe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Jun 2021 06:08:34 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA89BC061574
        for <linux-media@vger.kernel.org>; Wed, 23 Jun 2021 03:06:16 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id m18so1979608wrv.2
        for <linux-media@vger.kernel.org>; Wed, 23 Jun 2021 03:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IWwJbaaInxRPzXQDD4t5DQbwvc5VcsNtKk9LwGC2rok=;
        b=GCXejyW50heEg9rRADPO0LVSAwzAO932C9yCIGR2McvX1vaBc/p4bZG0OUcm2avc6b
         cPXBOPN+uMI91BO8AFddXiY4OQkug1xzwQNrx+e8D9MI73GexkkQ4G2FMUxhIMcZZwmh
         2bP/hJ4riM90UNCAwzJvdy9K8NCIQe3WodaE7wSIefp/ZzJAFinZYUNbiAi6KJ+3LTTD
         363cFvHP6Np/z8GBs4xvTkYPE9n8I5VchyCnZWCRnnkU5LjAj6afEZZAXNIu46fEpCSU
         Pw0Dw5RMZnO/oQS97TUAgBGEkREubzsso/s9aWOPHLSs+EARVqhtR/22OYuVkTfrdU/O
         GA8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IWwJbaaInxRPzXQDD4t5DQbwvc5VcsNtKk9LwGC2rok=;
        b=JWxcRSKfOJ9rRY8ncEpxhOjfAVCUHCTHuRGgNAPylo6iuh/0EspKlI6+NTDYrUZw1+
         13V4bh6crPCCXqiH85hq9CFfhmR2OSvkNeJ5xR1pxXHbYzrCATVGXV7T31Nt/sPKpkZ2
         mvZGght4nAQGjuCWq+Jgzo/8v4lNsSty5HAXMA5fdV6khyBN2ltXBEVsL/cyZuVwAlmu
         LsDi0yETuTYnjQpjsQCK1p/KBWuGmlwcpcqjBeg4DiQgjCz+GyB4tNPaWlfBIqdi68zZ
         xgdn73h7ENhASxxZOFFn8ouoFVgqX+wqL+6Sd0nnO7Yhl4Hzrq1ePMI6XDNJ/XaV94h/
         vDXA==
X-Gm-Message-State: AOAM531tlRQWPm/ze8l+5poCvtiWWQYb88lC7W1l5iCnI7W8Y/GaH4l7
        0didYcPdrfbXXKaCxjoPioSeLVsM1qhPLEL+k2chasUDFyWaU9KP
X-Google-Smtp-Source: ABdhPJz9YirV8E0gSGyffnE1FvpgYOvgexz/sq7WO319jVQCEDwwUB1bQ1isxogjEhw0sRl/77cHVy0ZLWRgW+ORNqk=
X-Received: by 2002:a5d:4a51:: with SMTP id v17mr10456503wrs.150.1624442775426;
 Wed, 23 Jun 2021 03:06:15 -0700 (PDT)
MIME-Version: 1.0
References: <427466e4-1b6f-f7c3-3d5e-89c7a7f2ec79@jm0.eu> <20210622203329.11608-1-josua@solid-run.com>
In-Reply-To: <20210622203329.11608-1-josua@solid-run.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Wed, 23 Jun 2021 11:05:58 +0100
Message-ID: <CAPY8ntCo+GSvPjcKxK52C8SEN8JMhFOo+yOPYRhgaNoA7wKsYA@mail.gmail.com>
Subject: Re: [PATCH] media: tc358743: fix missing return of error code in tc358743_probe_of
To:     Josua Mayer <josua@solid-run.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        matrandg@cisco.com, Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Josua

Thanks for the patch.

On Tue, 22 Jun 2021 at 21:33, Josua Mayer <josua@solid-run.com> wrote:
>
> When device-tree configures an unsupported combinaion of number of lanes,

s/combinaion/combination

> and link frequency, e.g. by exceeding 1Gbps per lane, 0 is returned,
> wrongly indicating success. In this case, return EINVAL instead!

The change you've provided is in the check that the lane link
frequency is within range only. Nothing to do with the number of
lanes.

> This fixes a divide-by-zero crash in tc358743_num_csi_lanes_needed,
> where the divisor becomes zero because pll_fbd has been left at 0 by probe.

There's a very similar case in this function if the refclk frequency
is not supported.
That will cause a divide-by-zero when calculating pll_fbd with a 0
pll_prd value.

@@ -1980,6 +1980,7 @@ static int tc358743_probe_of(struct tc358743_state *state)
        default:
                dev_err(dev, "unsupported refclk rate: %u Hz\n",
                        state->pdata.refclk_hz);
+               ret = -EINVAL;
                goto disable_clk;
        }

Could you roll that one in too?

Cheers
  Dave

> Signed-off-by: Josua Mayer <josua@solid-run.com>
> ---
>  drivers/media/i2c/tc358743.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
> index 1b309bb743c7..f21da11caf22 100644
> --- a/drivers/media/i2c/tc358743.c
> +++ b/drivers/media/i2c/tc358743.c
> @@ -1974,6 +1974,7 @@ static int tc358743_probe_of(struct tc358743_state *state)
>         bps_pr_lane = 2 * endpoint.link_frequencies[0];
>         if (bps_pr_lane < 62500000U || bps_pr_lane > 1000000000U) {
>                 dev_err(dev, "unsupported bps per lane: %u bps\n", bps_pr_lane);
> +               ret = -EINVAL;
>                 goto disable_clk;
>         }
>
> --
> 2.32.0
>
