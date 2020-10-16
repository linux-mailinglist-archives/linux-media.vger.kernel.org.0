Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 994BD28FED4
	for <lists+linux-media@lfdr.de>; Fri, 16 Oct 2020 09:05:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404375AbgJPHFR convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 16 Oct 2020 03:05:17 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:35944 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404197AbgJPHFR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Oct 2020 03:05:17 -0400
Received: by mail-ot1-f65.google.com with SMTP id 32so1555769otm.3;
        Fri, 16 Oct 2020 00:05:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CxNUEPF8Jf5OwmkJmJDQM9OCdYG3leyZjhp1GLevMrI=;
        b=rosMY5NTO6cLmr1sLv+HY73hRIMuNTDb8K3hRI1UTqPAu5/S9TiosgAZdPiAEqUsBA
         vi5ak891i2rtkqqsRiKel4F76BhMOovxqSe0hpm1M5ggy4xNgYfv8U6LqtqiCCsr+ZG+
         B5iyVMjvj/EKnvwZEhVPHbgnVEIGmnGizpFAoaJ4HDzCPg8Wc6ricr+mYyGuqpZK6HU7
         5J1SignxtBdadHpYgOtIk7Jx6HLhdX5j9vMvOmMv0Shf/QjMZkqCYLdPx49+OwzGl+0t
         clhVqhePWAinjqOPND5+wFSe+3T7Clb1JMGZjrwX4ecN9t3hI8/mmBwVJK1Lc0gSjZ2W
         WSyg==
X-Gm-Message-State: AOAM532PDJWni+ahNSm49sh0H+PsL3gP5jcUtj6he2njLegAS2rxNOoL
        pteMKIhE+3sM7LD4U87n9SRtR3imwKSm1UrvQtN1cMEQ
X-Google-Smtp-Source: ABdhPJysEwV5Mnx0dH4fWr3EwW04p2v5lFoGiF67y2GEXdjlOjRevdsUuteFr5mji5+m2GSmTBqobjYzRcJ5wAsiw38=
X-Received: by 2002:a05:6830:210a:: with SMTP id i10mr1539275otc.145.1602831916079;
 Fri, 16 Oct 2020 00:05:16 -0700 (PDT)
MIME-Version: 1.0
References: <20201015231408.2399933-1-niklas.soderlund+renesas@ragnatech.se> <20201015231408.2399933-6-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20201015231408.2399933-6-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 16 Oct 2020 09:05:04 +0200
Message-ID: <CAMuHMdWZAi5=1G9sF_Ft6mPa1jThCv0oewz-GJcPcAcv=Mg3eA@mail.gmail.com>
Subject: Re: [PATCH 5/5] rcar-vin: Add support for suspend and resume
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Fri, Oct 16, 2020 at 4:01 AM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Add support for suspend and resume by stopping and starting the video
> pipeline while still retaining all buffers given to the driver by
> user-space and internally allocated ones, this gives the application a
> seamless experience.
>
> Buffers are never returned to user-space unprocessed so user-space don't
> notice when suspending. When resuming the driver restarts the capture
> session using the internal scratch buffer, this happens before
> user-space is unfrozen, this leads to speedy response times once the
> application resumes its execution.
>
> As the entire pipeline is stopped on suspend all subdevices in use are
> also stopped, and if they enter a shutdown state when not streaming
> (such as the R-Car CSI-2 driver) they too will be suspended and resumed
> in sync with the VIN driver.
>
> To be able to do keep track of which VINs should be resumed a new
> internal state SUSPENDED is added to recode this.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Thanks for your patch!

> --- a/drivers/media/platform/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/rcar-vin/rcar-core.c

> +static int __maybe_unused rvin_resume(struct device *dev)
> +{
> +       struct rvin_dev *vin = dev_get_drvdata(dev);
> +
> +       if (vin->state != SUSPENDED)
> +               return 0;
> +
> +       /*
> +        * Restore group master CHSEL setting.
> +        *
> +        * This needs to be by every VIN resuming not only the master

to be done?

> +        * as we don't know if and in which order the master VINs will
> +        * be resumed.
> +        */
> +       if (vin->info->use_mc) {
> +               unsigned int master_id = rvin_group_id_to_master(vin->id);
> +               struct rvin_dev *master = vin->group->vin[master_id];
> +               int ret;
> +
> +               if (WARN_ON(!master))
> +                       return -ENODEV;
> +
> +               ret = rvin_set_channel_routing(master, master->chsel);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       return rvin_start_streaming(vin);
> +}
> +

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
