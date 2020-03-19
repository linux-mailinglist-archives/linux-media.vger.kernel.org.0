Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7776C18B404
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 14:06:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727572AbgCSNGG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 09:06:06 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:45521 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727563AbgCSNGE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 09:06:04 -0400
Received: by mail-ot1-f65.google.com with SMTP id e9so2215397otr.12;
        Thu, 19 Mar 2020 06:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JNrzJ43ADUGKGgcYIYmm8uAsAxVnbPxCKcqomy6wzR8=;
        b=TVp42mYXKeI+CzEDqNdIZ8OSjOYd/x2BHF3WQsRwUplFoeXvhUkRzymLKfdlVKXVgS
         GzwUg2Q7ho8ZvC7uyy7SUT28MucxF4UxCJ/qO2fnyTsnua7SxjrDkXe0e99BVkOpALLL
         iX+Nfz8vqxrVET+CnfJyBGbZP9aENhotFEL8cWKt0rx0UXQxhpJcqzqqhY1hbF4XQMVh
         hUW+v4bgFd5HlN+csF5pQThvddNw+lZumxBcb3eP9pq7feovGzeBUf7Mthvx/0+wAbcr
         6u5pwajrtYTDgDnYY4EI1S3xWl1jc0aoSPYiQM1i+Ngl1EVzCXMzYw/esdw5gERxe7wM
         leBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JNrzJ43ADUGKGgcYIYmm8uAsAxVnbPxCKcqomy6wzR8=;
        b=DYznvXksrBeUHZ2YVSNV0phgaGurg+o4bMY5MKslsMP1VksI+Wiq2V4MfnzPpKkEpe
         d+ogyHTovUwoT/jjDPXka1vYqqigt0VYFG+PNqJmfJuP84PfJZEHVqhH7/stO2r3jDw/
         SKGVIoWW0ohF5BwP34dINXuwhRto4KxCF/dbs87kOOy8Idhp9PGP5kFUFMFBr09hb43I
         X2Eo/rgUyrLBj87Q1cTX6ifilrFLa/8Tko4FJ1J4ZDSMLFJXr2VeF3jcv7aJdmJn7Ci1
         jARiTLML3r1cS/KqRNruggY54qeykLpF12akiYsQh6jijR3HUgGoOCd/NGHnpnXVUYh/
         YbaQ==
X-Gm-Message-State: ANhLgQ1rTNoxibZJ92Shld0XqEy9egsypr7+mq53mdQ8ufbOj9Am73xV
        4bv903AD+VLekBMqekg6XyzLw+rfzerFSVeNobo=
X-Google-Smtp-Source: ADFU+vu6TgclLFcGUTWCKylwKuQ1xUKX/i4NckoB5Lg2bmpS65EzGwsKNTO9xiLZkksGH2ZBHR96INCeNIhBb87zs70=
X-Received: by 2002:a9d:264a:: with SMTP id a68mr2250727otb.176.1584623163859;
 Thu, 19 Mar 2020 06:06:03 -0700 (PDT)
MIME-Version: 1.0
References: <1584133954-6953-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1584133954-6953-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200319124452.3yfcvq754vi4q2rv@gilmour.lan>
In-Reply-To: <20200319124452.3yfcvq754vi4q2rv@gilmour.lan>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Thu, 19 Mar 2020 13:05:37 +0000
Message-ID: <CA+V-a8vH+wJoC1SL0nuk8ypAH3Mosd+K1dLNDA5wwgP4W6A=CQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] media: dt-bindings: media: i2c: Switch to assigned-clock-rates
To:     Maxime Ripard <maxime@cerno.tech>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Fabio Estevam <festevam@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Magnus Damm <magnus.damm@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        LAK <linux-arm-kernel@lists.infradead.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Maxime,

Thank you for the review.

On Thu, Mar 19, 2020 at 12:45 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi,
>
> On Fri, Mar 13, 2020 at 09:12:31PM +0000, Lad Prabhakar wrote:
> > Use assigned-clock-rates to specify the clock rate. Also mark
> > clock-frequency property as deprecated.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  Documentation/devicetree/bindings/media/i2c/ov5645.txt | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/media/i2c/ov5645.txt b/Documentation/devicetree/bindings/media/i2c/ov5645.txt
> > index 72ad992..e62fe82 100644
> > --- a/Documentation/devicetree/bindings/media/i2c/ov5645.txt
> > +++ b/Documentation/devicetree/bindings/media/i2c/ov5645.txt
> > @@ -8,7 +8,7 @@ Required Properties:
> >  - compatible: Value should be "ovti,ov5645".
> >  - clocks: Reference to the xclk clock.
> >  - clock-names: Should be "xclk".
> > -- clock-frequency: Frequency of the xclk clock.
> > +- clock-frequency (deprecated): Frequency of the xclk clock.
> >  - enable-gpios: Chip enable GPIO. Polarity is GPIO_ACTIVE_HIGH. This corresponds
> >    to the hardware pin PWDNB which is physically active low.
> >  - reset-gpios: Chip reset GPIO. Polarity is GPIO_ACTIVE_LOW. This corresponds to
> > @@ -37,7 +37,8 @@ Example:
> >
> >                       clocks = <&clks 200>;
> >                       clock-names = "xclk";
> > -                     clock-frequency = <24000000>;
> > +                     assigned-clocks = <&clks 200>;
> > +                     assigned-clock-rates = <24000000>;
> >
> >                       vdddo-supply = <&camera_dovdd_1v8>;
> >                       vdda-supply = <&camera_avdd_2v8>;
>
> clock-frequency is quite different from assigned-clock-rates though,
> semantically speaking. clock-frequency is only about what the clock
> frequency is, while assigned-clock-rates will change the rate as well,
> and you have no idea how long it will last.
>
Agreed clock-frequency tells whats the clock frequency, wrt ov5645 driver
this property was read and and the clock rate was changed accordingly as per
the value being passed. So switching  to assigned-clock-rates does bypass
of clock rate being set in the ov5645 driver [1] as the framework does it.

> If you want to retrieve that through the clock framework, then just
> making clock-frequency optional is enough and falling back to
> clk_get_rate on the clocks property already provided is enough.
>
As done in patch [1] ?

Fyi I have posted a v4 [2] to ML.

[1] https://patchwork.linuxtv.org/patch/62378/
[2] https://patchwork.linuxtv.org/project/linux-media/list/?series=1990

Cheers,
--Prabhakar

> Maxime
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
