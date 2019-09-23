Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83699BBE40
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2019 00:05:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503140AbfIWWFB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Sep 2019 18:05:01 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:44578 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2503109AbfIWWFB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Sep 2019 18:05:01 -0400
Received: by mail-wr1-f66.google.com with SMTP id i18so15581702wru.11
        for <linux-media@vger.kernel.org>; Mon, 23 Sep 2019 15:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jbJLKwQpjOd723wY7Vi/Lqdhwgi3KaOZ4g+zQ7nLgfE=;
        b=V4bUEYg0YS+4DAymJw1ykzYFSljWIhwUN4y0c4Xw3ikBoT9IKyG3AA4yOUguY3uQRo
         JkplzVQ3uvBj8cjOy4GowAIFgZ6IuJVXgiDk3f722KJYjU+EruvFD86VLAgDBBVIVUK4
         ax0xf+bIbrxz8VPghVoqm2wahCBiLaucrCQDs6XvLRbQwzyHq5z0eC5Ii9Lxdd/B4KwE
         nd1KlWDNVB0UdBEXeLrgXOlE5pNaUcOUvWYO2d9VvVh6QPTXUYmoHgXTtnVXXzwie3gG
         SK/EmaGQHLpEKetBY1pFpUPvkByDkxYBpECcF7zWTCqj7JddiZtiXZziUmRObKh2UshR
         ywnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jbJLKwQpjOd723wY7Vi/Lqdhwgi3KaOZ4g+zQ7nLgfE=;
        b=aj3wsncWJ1PW8bESQrFoIozR+sqBE/qrAYeoyaBoRq2FognpZguKwviSxF/trg4HY8
         Kg0tXgMKfAGNAcBYY433mLM35d6t6dMqVMV+fOCb4dAFuYfUhIiqqI5n8U/CjHUqOJIE
         09zn9wXN7IEu4QFfgaMlMbre0B5HcXT2b8gig72zoZlHUip8LBGIiA4wRuum+HnCVCmj
         i3a2HggOGQvOLHdvU+XCB85NY6X37orJkUt/32ptz1d9BRXFKMg1YYcE4o/IVgBwiw6e
         /hrF+UfOq6OtSdgcx/ice02W9VCAd+JHtElzJXkGl2A18KBZdksfylFKM67D5ksPt8LI
         RjIg==
X-Gm-Message-State: APjAAAVEewOWg+4jTkug6JFkVwjJ2RQJ2AaiTvwp/10w+KH9J9vDIh/M
        SKVAHEVufxf3hBXZxLgdf+12iTc1LV6T2AMwBLkc6g==
X-Google-Smtp-Source: APXvYqzSOfuanb7Qe1YMUmEHyioZIDI2B1FuvdEYuNZP6+C4WB4y7q1q/O0Me708Nq8MNMy+P/KaY67kI/lqA5PNB74=
X-Received: by 2002:adf:e591:: with SMTP id l17mr1122991wrm.199.1569276298912;
 Mon, 23 Sep 2019 15:04:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190827215539.1286-1-mmichilot@gateworks.com>
 <cb3e9be4-9ce6-354f-bb7c-a4710edc1c1b@xs4all.nl> <20190829142931.GZ28351@bigcity.dyn.berto.se>
In-Reply-To: <20190829142931.GZ28351@bigcity.dyn.berto.se>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Mon, 23 Sep 2019 15:04:47 -0700
Message-ID: <CAJ+vNU11HTcP8L5J2Xg+Rmhvb8JDYemhJxt-GaGG5Myk3n38Tw@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: adv7180: fix adv7280 BT.656-4 compatibility
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Matthew Michilot <matthew.michilot@gmail.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 29, 2019 at 7:29 AM Niklas S=C3=B6derlund
<niklas.soderlund@ragnatech.se> wrote:
>
> Hi,
>
> On 2019-08-29 13:43:49 +0200, Hans Verkuil wrote:
> > Adding Niklas.
> >
> > Niklas, can you take a look at this?
>
> I'm happy to have a look at this. I'm currently moving so all my boards
> are in a box somewhere. I hope to have my lab up and running next week,
> so if this is not urgent I will look at it then.
>

Niklas,

Have you looked at this yet? Without this patch the ADV7280A does not
output proper BT.656. We tested this on a Gateworks Ventana GW5404-G
which uses the ADV7280A connected to the IMX6 CSI parallel bus. I'm
hoping to see this get merged and perhaps backported to older kernels.

Regards,

Tim

> >
> > Regards,
> >
> >       Hans
> >
> > On 8/27/19 11:55 PM, Matthew Michilot wrote:
> > > From: Matthew Michilot <matthew.michilot@gmail.com>
> > >
> > > Captured video would be out of sync when using the adv7280 with
> > > the BT.656-4 protocol. Certain registers (0x04, 0x31, 0xE6) had to
> > > be configured properly to ensure BT.656-4 compatibility.
> > >
> > > An error in the adv7280 reference manual suggested that EAV/SAV mode
> > > was enabled by default, however upon inspecting register 0x31, it was
> > > determined to be disabled by default.
> > >
> > > Signed-off-by: Matthew Michilot <matthew.michilot@gmail.com>
> > > Reviewed-by: Tim Harvey <tharvey@gateworks.com>
> > > ---
> > >  drivers/media/i2c/adv7180.c | 15 +++++++++++++--
> > >  1 file changed, 13 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.=
c
> > > index 99697baad2ea..27da424dce76 100644
> > > --- a/drivers/media/i2c/adv7180.c
> > > +++ b/drivers/media/i2c/adv7180.c
> > > @@ -94,6 +94,7 @@
> > >  #define ADV7180_REG_SHAP_FILTER_CTL_1      0x0017
> > >  #define ADV7180_REG_CTRL_2         0x001d
> > >  #define ADV7180_REG_VSYNC_FIELD_CTL_1      0x0031
> > > +#define ADV7180_VSYNC_FIELD_CTL_1_NEWAV 0x12
> > >  #define ADV7180_REG_MANUAL_WIN_CTL_1       0x003d
> > >  #define ADV7180_REG_MANUAL_WIN_CTL_2       0x003e
> > >  #define ADV7180_REG_MANUAL_WIN_CTL_3       0x003f
> > > @@ -935,10 +936,20 @@ static int adv7182_init(struct adv7180_state *s=
tate)
> > >             adv7180_write(state, ADV7180_REG_EXTENDED_OUTPUT_CONTROL,=
 0x57);
> > >             adv7180_write(state, ADV7180_REG_CTRL_2, 0xc0);
> > >     } else {
> > > -           if (state->chip_info->flags & ADV7180_FLAG_V2)
> > > +           if (state->chip_info->flags & ADV7180_FLAG_V2) {
> > > +                   /* ITU-R BT.656-4 compatible */
> > >                     adv7180_write(state,
> > >                                   ADV7180_REG_EXTENDED_OUTPUT_CONTROL=
,
> > > -                                 0x17);
> > > +                                 ADV7180_EXTENDED_OUTPUT_CONTROL_NTS=
CDIS);
> > > +                   /* Manually set NEWAVMODE */
> > > +                   adv7180_write(state,
> > > +                                 ADV7180_REG_VSYNC_FIELD_CTL_1,
> > > +                                 ADV7180_VSYNC_FIELD_CTL_1_NEWAV);
> > > +                   /* Manually set V bit end position in NTSC mode *=
/
> > > +                   adv7180_write(state,
> > > +                                 ADV7180_REG_NTSC_V_BIT_END,
> > > +                                 ADV7180_NTSC_V_BIT_END_MANUAL_NVEND=
);
> > > +           }
> > >             else
> > >                     adv7180_write(state,
> > >                                   ADV7180_REG_EXTENDED_OUTPUT_CONTROL=
,
> > >
> >
>
> --
> Regards,
> Niklas S=C3=B6derlund
