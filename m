Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 732F336A07E
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 11:12:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232152AbhDXJNW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 05:13:22 -0400
Received: from mail-ua1-f46.google.com ([209.85.222.46]:39450 "EHLO
        mail-ua1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229850AbhDXJNU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 05:13:20 -0400
Received: by mail-ua1-f46.google.com with SMTP id a12so12197540uak.6;
        Sat, 24 Apr 2021 02:12:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YeTmoO42uoi3i60Ai3NZHOpwkktNr+Lql55GBGVHTYI=;
        b=Tn/JYODhFN55O00xPkixb5hIH38UBUx/HhnOqIyyC7BeDDtK1SaICtowEucadPLMMR
         trJcu1JMuOW8H2AMedILs+uVsriTwEQ9xaQQASkV/Bz1GNKrOyrNUB4vRE7n2eRBmNMK
         91i4JlZYnr6AsjLXnD2LsQewy/tYYrhqaWUBrhfeEPnygo7iU3HQ6HylCj4nKjMO4j1F
         s4YdUAMu4+sah55oYo84INlk0+wChhFF5EWlz4iOuVtCFeCv+EGm8VXJMzzfaNh2n+4Y
         LPjF+ly6051AAWoQPQkXEdJm3YwWViOMqKrWW8myUbAHTzTEMo8rJu3YrgKPaCxR4sjf
         z/5Q==
X-Gm-Message-State: AOAM533OxUIIsR7mNHsgxYJF3D931HhP8ZqTmtIEIL1BTOhimeqvcNKO
        wXAxXO0LKnO2h0h0XmaYts35VfXTHRkYbKur9Pyv2V1Oqjk=
X-Google-Smtp-Source: ABdhPJz6ZD0/vFdJyOTCwcJaiJMRFPiUqampywY+fJbagxHaSZRVD7MIf1WtO4iiGw25DPP/MDNj9ml4OqV4jNj5y7w=
X-Received: by 2002:ab0:6306:: with SMTP id a6mr6210257uap.2.1619255562481;
 Sat, 24 Apr 2021 02:12:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1619191723.git.mchehab+huawei@kernel.org> <dc7f4bc45cd6be79d19d1a4027fb6f35dfb45a03.1619191723.git.mchehab+huawei@kernel.org>
In-Reply-To: <dc7f4bc45cd6be79d19d1a4027fb6f35dfb45a03.1619191723.git.mchehab+huawei@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sat, 24 Apr 2021 11:12:31 +0200
Message-ID: <CAMuHMdWRxy76Dq0NYAUNKATaCx+tVMSO43HP+urFrukDQ_pTkg@mail.gmail.com>
Subject: Re: [PATCH 69/78] media: rcar-vin: use pm_runtime_resume_and_get()
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linuxarm <linuxarm@huawei.com>, mauro.chehab@huawei.com,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Sat, Apr 24, 2021 at 8:46 AM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
> Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> added pm_runtime_resume_and_get() in order to automatically handle
> dev->power.usage_count decrement on errors.
>
> Use the new API, in order to cleanup the error check logic.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Thanks for your patch!

> --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> @@ -408,7 +408,7 @@ static void rcsi2_enter_standby(struct rcar_csi2 *priv)
>
>  static void rcsi2_exit_standby(struct rcar_csi2 *priv)
>  {
> -       pm_runtime_get_sync(priv->dev);
> +       pm_runtime_resume_and_get(priv->dev);

I believe this part is incorrect: on failure[*], the refcount will now
be decremented, and in a subsequent call to rcsi2_enter_standby(), the
refcount will be decremented again due to the call to pm_runtime_put().

[*] On e.g. R-Car SoCs, this can never fail.  This is the reason why
    many R-Car (and SuperH) drivers never check the result of
    pm_runtime_get_sync().  So the refcount "imbalances" were actually
    introduced by the various "clean up" patches to add return value
    checking, which now need another round of fixing...

>         reset_control_deassert(priv->rstc);
>  }

> --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> @@ -1458,11 +1458,9 @@ int rvin_set_channel_routing(struct rvin_dev *vin, u8 chsel)
>         u32 vnmc;
>         int ret;
>
> -       ret = pm_runtime_get_sync(vin->dev);
> -       if (ret < 0) {
> -               pm_runtime_put_noidle(vin->dev);
> +       ret = pm_runtime_resume_and_get(vin->dev);
> +       if (ret < 0)
>                 return ret;
> -       }

This change (and the change below) is correct, as the logic before/after
is equivalent.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
