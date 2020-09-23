Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4ED89275775
	for <lists+linux-media@lfdr.de>; Wed, 23 Sep 2020 13:51:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbgIWLva (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Sep 2020 07:51:30 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:45279 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726472AbgIWLv1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Sep 2020 07:51:27 -0400
Received: by mail-ot1-f65.google.com with SMTP id g96so18636435otb.12;
        Wed, 23 Sep 2020 04:51:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ilgxByGOSgsHtVfbxP26WHdAwJw6URnSELus0QGjA6Y=;
        b=luc5Y0A/9sB7vxmjLumwtruQr+rGMupAnwyxl+oU/LXE9VEYpnvaJ2yR4fL+r4BC+r
         YejNMVaKxFVQiXPJxkvNhmF9/kPI/eC2yu5DSKYdWzGSbqUbu+GLUXTdlLp7rBbbDWbW
         wnkcZzYti9u0pD1B/Oio7DUOVg3+5IHfRuJ50M2DXCDKMLCyci10YPr18uYZdaOEGyjf
         y+VYMaFettC4DivPD4lHanC1nm0mn+XbAPPxWXXuyQGm9dJxI7bARvGOjBDIwr3aeGSK
         wgkgptTaHph0uohi8OAQ3nHhddul3hR01tYtH1nEw5Shqi/wMem8eD3+goSMprqsjO9f
         KoDg==
X-Gm-Message-State: AOAM531LPs0GWUIcBjxEF2FFnX04obifWpHW2uCfOzmkoQOZxj6HTedf
        qfP+Nl+G565X8x6+f23I9aB9SzdTVNSwtdWjkNI=
X-Google-Smtp-Source: ABdhPJyVPkXw3z2XFbiOWyJS4AOuwFvwFsr5xbhXbd1QOKHQYtOt6huhn3MrZTLtGDWQC8ck0Z6ajvDTi9HT68fRN10=
X-Received: by 2002:a05:6830:1008:: with SMTP id a8mr5454370otp.107.1600861886885;
 Wed, 23 Sep 2020 04:51:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200922155210.242536-1-kieran.bingham+renesas@ideasonboard.com>
 <20200922155210.242536-2-kieran.bingham+renesas@ideasonboard.com>
 <CAMuHMdXv1JRoBTT=XL+q=jwOPnTPYRZMp8pk+_M0WOGofFf0dg@mail.gmail.com> <89b1ae29-5422-8d40-8075-0b814afea9b1@ideasonboard.com>
In-Reply-To: <89b1ae29-5422-8d40-8075-0b814afea9b1@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 23 Sep 2020 13:51:14 +0200
Message-ID: <CAMuHMdXrxg29AW43OHp-xJA56gO1HFHtkqwNfMhm2uVGtz_=BQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] media: i2c: max9286: Use unsigned constants
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

On Wed, Sep 23, 2020 at 11:41 AM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
> On 23/09/2020 08:42, Geert Uytterhoeven wrote:
> > On Tue, Sep 22, 2020 at 5:52 PM Kieran Bingham
> > <kieran.bingham+renesas@ideasonboard.com> wrote:
> >> Convert the bitfield definitions to use unsigned integers.
> >>
> >> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >
> > Thanks for your patch!
> >
> >> --- a/drivers/media/i2c/max9286.c
> >> +++ b/drivers/media/i2c/max9286.c
> >> @@ -31,85 +31,85 @@
> >>  #include <media/v4l2-subdev.h>
> >>
> >>  /* Register 0x00 */
> >> -#define MAX9286_MSTLINKSEL_AUTO                (7 << 5)
> >> +#define MAX9286_MSTLINKSEL_AUTO                (7U << 5)
> >
> > While using this format for multi-bit fields makes sense...
> >
> >>  #define MAX9286_MSTLINKSEL(n)          ((n) << 5)
> >>  #define MAX9286_EN_VS_GEN              BIT(4)
> >> -#define MAX9286_LINKEN(n)              (1 << (n))
> >> +#define MAX9286_LINKEN(n)              (1U << (n))
> >
> > ... I think single-bit fields (more below) make better use of the BIT() macro.
>
> Ooops, I missed that, indeed that certainly looks like a BIT.
>
> I was really trying to make sure all the 'bit-field enum' type values
> are consistent here, i.e.:
>
> #define MAX9286_I2CSLVSH_1046NS_469NS   (3U << 5)
> #define MAX9286_I2CSLVSH_938NS_352NS    (2U << 5)
> #define MAX9286_I2CSLVSH_469NS_234NS    (1U << 5)
> #define MAX9286_I2CSLVSH_352NS_117NS    (0U << 5)
>
> I'll sift out the single bit fields that are more appropriate for BIT().
>
> There is also the FIELD_PREP, FIELD_GET macros that could be used
> instead from include/linux/bitfield.h which are new to me, and seem
> interesting but I haven't worked out if it's worth converting the whole
> driver to use that yet or not.

Personally, I'm not such a big fan of them.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
