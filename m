Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70A0E2B005
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2019 10:20:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726481AbfE0IUS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 May 2019 04:20:18 -0400
Received: from mail-yw1-f66.google.com ([209.85.161.66]:42450 "EHLO
        mail-yw1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726185AbfE0IUR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 May 2019 04:20:17 -0400
Received: by mail-yw1-f66.google.com with SMTP id s5so6346184ywd.9;
        Mon, 27 May 2019 01:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=dJeEKckc8XozRLSFvJQNZuIEHzNmeUHgfWOIaZszYtA=;
        b=BLHzncT1kN7FS46Ig7BbAIzeg0htnEqqcE5Uz6kTPKJlFC+nbFVK3SPSdDD0f1NUBl
         tdYaDl798MdAr6vMuegnctjmteNlLze07H+qB0lg30e5Bxk5nL4UaYUnz/hK1RcxCG/b
         APNdaNsgxTw0UzIEjiJKuAFyL2ARtKVuqEq5zGaAj9/Kjz2B5co2ZhFeii9qEQc1rpc0
         70j/VWj60k9lqj07/Add6/yorkdlTSFZYMPYqxQZpwfYVTdKJjPg2/6xfjw9++ofDONa
         qjgUAPlhQFyYGHzaE9fmOojCnWXiATsuU7Ppvp5KNLH1loqSlFvzB6KkVjVr8zbv2Upq
         oIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=dJeEKckc8XozRLSFvJQNZuIEHzNmeUHgfWOIaZszYtA=;
        b=lXEovrT6kcSqmz095IR5akBNoW5WOZrL5PK2k2q5Wa3JSqtTKZ2EHzaHyAtjQvoa1c
         AvV1bJ4PwknlQgmVWTFuK/TYghRdQq4nMzl9YFD4lJxFXLe6I2duBDH6mfFnb0JIhpqE
         nV8SOMNpLjVS/UkyZBJioLzpXq5oTXBi2KZiQeQkmRZ17OhYScx5y007KyrsdddAPHQ9
         uyBHnOuhzj5SSCJtu9vYTrghONtuwmcvDpTEXwlCTukieAIgmQz2Xp50sywsOlEsq57E
         HZC9bgoPYaz50PYPefMps96C6p85QVjbfCKXr1Z7YkLm6qH3Pha0eVAgAS4oP7KQhCDC
         DGdA==
X-Gm-Message-State: APjAAAWXR/TVeuqqSkWYdI8q1g3IrqO8zkn9zZe/j0ldN0ijwt/O4jqJ
        GwiiRKbCw0MbY7cNspQQQg/tyVxKYkar3hTkXaWURhlJQjg=
X-Google-Smtp-Source: APXvYqwTVORwEEGE7eSHGWZrthPsgVfPBw0yPd9WJn2AOEH62eCbfODDcTFuaIULYKXYvtqhyQ5lZapfseMXcqGyLZM=
X-Received: by 2002:a81:59c2:: with SMTP id n185mr53377206ywb.21.1558945216859;
 Mon, 27 May 2019 01:20:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190526222536.10917-1-peron.clem@gmail.com> <20190526222536.10917-3-peron.clem@gmail.com>
 <20190527074700.rvhqua44ixudt52z@flea>
In-Reply-To: <20190527074700.rvhqua44ixudt52z@flea>
From:   =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date:   Mon, 27 May 2019 10:20:05 +0200
Message-ID: <CAJiuCcfknVV5V4sMrfizz_K92BeTQsRYekmQQpWFP_-jhPPaQA@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] media: rc: sunxi: Add A31 compatible
To:     Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Chen-Yu Tsai <wens@csie.org>, linux-media@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Maxime,

On Mon, 27 May 2019 at 09:47, Maxime Ripard <maxime.ripard@bootlin.com> wro=
te:
>
> Hi,
>
> On Mon, May 27, 2019 at 12:25:28AM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> > Allwiner A31 has a different memory mapping so add the compatible
> > we will need it later.
> >
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > ---
> >  drivers/media/rc/sunxi-cir.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.=
c
> > index 307e44714ea0..29ac33b68596 100644
> > --- a/drivers/media/rc/sunxi-cir.c
> > +++ b/drivers/media/rc/sunxi-cir.c
> > @@ -319,6 +319,7 @@ static int sunxi_ir_remove(struct platform_device *=
pdev)
> >  static const struct of_device_id sunxi_ir_match[] =3D {
> >       { .compatible =3D "allwinner,sun4i-a10-ir", },
> >       { .compatible =3D "allwinner,sun5i-a13-ir", },
> > +     { .compatible =3D "allwinner,sun6i-a31-ir", },
>
> We should also move from reset_get_optional to the non optional
> variant for the A31, and ignore it otherwise.

Should this be done in this series ?
Thanks,
Cl=C3=A9ment

>
> Maxime
>
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
