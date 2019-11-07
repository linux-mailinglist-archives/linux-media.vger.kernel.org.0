Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45DCFF284F
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2019 08:47:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726823AbfKGHr0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Nov 2019 02:47:26 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:37976 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726618AbfKGHrZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Nov 2019 02:47:25 -0500
Received: by mail-lf1-f65.google.com with SMTP id q28so820463lfa.5
        for <linux-media@vger.kernel.org>; Wed, 06 Nov 2019 23:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=cKLrjd6hPEO/Jc0xNhchJiZtMdBoUVdn4eJ7APKX2jE=;
        b=BBz5oZLiuakz609lS+aZji3klLLOwQpOCJL1gFlU9O7J7nJJ3dUhTSXyHKxchmHigV
         7TPMZplDBezmGPc6jkahIgZfmDkK4bdA5HCiEMmbTFzg/tvw1fKa2SQAyPkXoSNVeiKE
         2oeldbFR5/G4wPubXggaqzixgv8WhYaUB12mAEofWdQ8QM+2a+tT5fLaHh5zD/F5wddS
         /4Vq4HFTW0J+U6N7AkX04VhAcpDpnhnk8HDjsJqLAbK9Ut0mY0/DuKZerZEXW7s4GOi3
         x628KaYfY3RofURUnU5+tGvvi6AU6tgeYlwTd/UKHuRGrNw/CQ1HOAPvDh9DX6yjTzoW
         pPrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=cKLrjd6hPEO/Jc0xNhchJiZtMdBoUVdn4eJ7APKX2jE=;
        b=lCUh8eVlOr/IU3AbYBDTY+x7+u/L7QS8OpjBao9aLEyJeUSrojkCj1V7Od7zAqYpzo
         WnfN6b+rdiAXdpQeNNtiNcLm2DEhdkXvJSS1oENCWx6nqTPoUgnRt5K5MBJ9J3JiY27W
         k5yzFX4RfoJxkUeNdp6O284Azcz3ivNWKn0ZKtwWS3W33LcSt55uc6PKBHZ7JfdemYIP
         U1uM9aieCneuuqceB0OPBhDtM7Mn8EjdBadZsN5k5LOg5t/ukqxl2XrOg8aQtHLSDxYK
         V8UK+Dlc04vYBEzENUUoiW2wmZAOIJibXyAX6foeXQ7W4ykKmvOjl9X33U3256jEPHDz
         b2/A==
X-Gm-Message-State: APjAAAWlg8301z3xgKUjZ7KxWtHgUdvJXiyUP13LL35HBoirnLrYDrBZ
        pKvHT9TCFogEWPj1uitALpwcOwAs1Qs=
X-Google-Smtp-Source: APXvYqykjpEK9EbCTTsJdmf3gXqw3YAWyYnPqeUL7oT6HXYSspF1mf9vfRUXLyOchnZQ5mil/IGguw==
X-Received: by 2002:a19:6454:: with SMTP id b20mr1290714lfj.159.1573112843965;
        Wed, 06 Nov 2019 23:47:23 -0800 (PST)
Received: from localhost (h-93-159.A463.priv.bahnhof.se. [46.59.93.159])
        by smtp.gmail.com with ESMTPSA id n21sm568156ljc.67.2019.11.06.23.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 23:47:23 -0800 (PST)
Date:   Thu, 7 Nov 2019 08:47:22 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] rcar-vin: Limit NV12 availability to supported VIN
 channels only
Message-ID: <20191107074722.GH18345@bigcity.dyn.berto.se>
References: <20191106232304.2332121-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdW-i+L0pQx1WRWUZ6_BWF0ujQ-4s9TXNfAM9w5OHcgR+g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdW-i+L0pQx1WRWUZ6_BWF0ujQ-4s9TXNfAM9w5OHcgR+g@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Geert,

Thanks for your feedback.

On 2019-11-07 08:41:11 +0100, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Thu, Nov 7, 2019 at 12:25 AM Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > When adding support for NV12 it was overlooked that the pixel format is
> > only supported on some VIN channels. Fix this by adding a check to only
> > accept NV12 on the supported channels (0, 1, 4, 5, 8, 9, 12 and 13).
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Thanks for your patch!
> 
> > --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > @@ -76,7 +76,12 @@ const struct rvin_video_format *rvin_format_from_pixel(struct rvin_dev *vin,
> >         if (vin->info->model == RCAR_M1 && pixelformat == V4L2_PIX_FMT_XBGR32)
> >                 return NULL;
> >
> > -       if (pixelformat == V4L2_PIX_FMT_NV12 && !vin->info->nv12)
> > +       /*
> > +        * If NV12 is supported it's only supported on some channels (0, 1, 4,
> > +        * 5, 8, 9, 12 and 13).
> 
> Is this true for all SoCs, or do you need a vin->info->model == RCAR_GEN3
> check?

NV12 is only supported by most Gen3 SoCs, but no extra check is needed 
as vin->info->nv12 is only set for the Gen3 SoCs that can support NV12.

> 
> > +        */
> > +       if (pixelformat == V4L2_PIX_FMT_NV12 &&
> > +           (!vin->info->nv12 || BIT(vin->id) & 0xcccc))
> >                 return NULL;
> 
> So 0xcccc = ~(BIT(0) | BIT(1) | BIT(4) | ...)?

Yes.

> What if you ever have an id larger than 15?
> Wouldn't it be safer to check for !(BIT(vin->id) & 0x3333)?

There is no SoC with more then 16 VIN instances, today... Maybe your 
suggestion of the inverted check makes more sens. Will respin a v2.

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Regards,
Niklas Söderlund
