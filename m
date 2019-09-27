Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8A7FC0017
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2019 09:34:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726136AbfI0HeM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Sep 2019 03:34:12 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:42228 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726118AbfI0HeL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Sep 2019 03:34:11 -0400
Received: by mail-lj1-f196.google.com with SMTP id y23so1472166lje.9;
        Fri, 27 Sep 2019 00:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=doszWGbeqJhGNmlXgnBna5EvgHabx/d6O/EtYtXDbwI=;
        b=jEhyHybLYT0E1ol5FjBo36xmkuGWVFBC1mtbB6mIPywrkiYSa0gsRPKdYw7nAp4KQ6
         Pj6xXEnWldEcHEmWdpg4k9ENupJSHIAqikbxKwCgPGCMZTu7bWSTZYdZGFfbVBV5Asvw
         RwNXJKoOv4WGIeCAYh8TCP86fgEp1DBcV06euu3ajlr+1rCodsW3vE1KVQNzxnJ1rSx2
         imtiTjVZamcO9MaSWiFv4AAU5Get7Sz11EHd290fJVJy3iPMJMdsA7LPWQsiPYIElUvh
         KmLpXUYbJqUM5gUFcg/7i3UVyy7JPSazQ1CfexUgrfi4BXVF3mTf15/NBCa/lw8JTW/C
         C4bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=doszWGbeqJhGNmlXgnBna5EvgHabx/d6O/EtYtXDbwI=;
        b=KunEMKm00BjWf2D1TiI0WMEDFYz7OC8xmLOSnM96I6bsKgANYPZ9zmCYJfrqzzVXyC
         AinTc6kIv3AOGNQAwFn1DSH65qMPM5bT2ZFwXq1Ly167RPcHMqrwKUE0myI1C3LQJWkQ
         aCKE53aqJoLGICdMR2/tnPESP1o4r9Vu1vuuA3T8UQfG1y+GBRpfvhU1kdRtAgAJbjI0
         SlGG888zAsi6Tg2k51Rzt5MWqMgm94E17YrvzJPOjWIANWWgoS4eHVSZvtW06eTU0Hs7
         qSn9meHkuphzLr4U5P4So7XTFMMV0wkL2eqKkEmxklxCdE/dlwCyYsMUCBN6vjpSN/oT
         TCgw==
X-Gm-Message-State: APjAAAXZT5lIhxoBv2q332TYNjWWhskWg6P4OyW9OTpD3rqjuPaupL/V
        rcSVQ7I3U8SwGtFuYVZhRdaOnuquuOE2zI+mzG8=
X-Google-Smtp-Source: APXvYqwQmtwsyouO3Zzfka6gwtQVJ/qWbnVInojMGIv1C/zgBRBYRQk0/5BM8MAxX2bww5KD5vkH92joSMy6tECIuws=
X-Received: by 2002:a2e:9a89:: with SMTP id p9mr1841492lji.131.1569569649807;
 Fri, 27 Sep 2019 00:34:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190920135137.10052-1-ricardo@ribalda.com> <20190920135137.10052-8-ricardo@ribalda.com>
 <6e4c1969-a80d-4747-7a44-b7a46804fe12@xs4all.nl>
In-Reply-To: <6e4c1969-a80d-4747-7a44-b7a46804fe12@xs4all.nl>
From:   Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date:   Fri, 27 Sep 2019 09:33:53 +0200
Message-ID: <CAPybu_3ga6rJ8pzw3wAP=nMOHDqeQEWWa-reto7Xk_FzRFVLyw@mail.gmail.com>
Subject: Re: [PATCH v6 7/7] media: imx214: Add new control with V4L2_CID_UNIT_CELL_SIZE
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Jacopo Mondi <jacopo@jmondi.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans

On Fri, 27 Sep 2019, 09:14 Hans Verkuil, <hverkuil-cisco@xs4all.nl> wrote:
>
> On 9/20/19 3:51 PM, Ricardo Ribalda Delgado wrote:
> > From: Ricardo Ribalda Delgado <ribalda@kernel.org>
> >
> > According to the product brief, the unit cell size is 1120 nanometers^2.
> >
> > https://www.sony-semicon.co.jp/products_en/IS/sensor1/img/products/ProductBrief_IMX214_20150428.pdf
> >
> > Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
> > ---
> >  drivers/media/i2c/imx214.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> > index 159a3a604f0e..57562e20c4ca 100644
> > --- a/drivers/media/i2c/imx214.c
> > +++ b/drivers/media/i2c/imx214.c
> > @@ -47,6 +47,7 @@ struct imx214 {
> >       struct v4l2_ctrl *pixel_rate;
> >       struct v4l2_ctrl *link_freq;
> >       struct v4l2_ctrl *exposure;
> > +     struct v4l2_ctrl *unit_size;
> >
> >       struct regulator_bulk_data      supplies[IMX214_NUM_SUPPLIES];
> >
> > @@ -948,6 +949,13 @@ static int imx214_probe(struct i2c_client *client)
> >       static const s64 link_freq[] = {
> >               IMX214_DEFAULT_LINK_FREQ,
> >       };
> > +     struct v4l2_area unit_size = {
> > +             .width = 1120,
> > +             .height = 1120,
> > +     };
> > +     union v4l2_ctrl_ptr p_def = {
> > +             .p_area = &unit_size,
> > +     };
>
> Use static const for both.
>
> I think you should add a small static inline helper function to v4l2-ctrls.h that
> takes a void pointer and returns a union v4l2_ctrl_ptr.
>
> Then you don't need to make a union v4l2_ctrl_ptr just to pass the unit_size pointer.
>

That sounds useful, but can we warantee for all the arches that
sizeof(v4l2_ctrl_ptr) <= sizeof (void *)

Of course, it sounds logic, that a union of pointers is the same size
than a pointer... but you never know.

No matter what I will make the helper and resend. with all the changes
from Jacopo

Thanks!

> Regards,



>
>         Hans
>
> >       int ret;
> >
> >       ret = imx214_parse_fwnode(dev);
> > @@ -1029,6 +1037,10 @@ static int imx214_probe(struct i2c_client *client)
> >                                            V4L2_CID_EXPOSURE,
> >                                            0, 3184, 1, 0x0c70);
> >
> > +     imx214->unit_size = v4l2_ctrl_new_std_compound(&imx214->ctrls,
> > +                                                    NULL,
> > +                                                    V4L2_CID_UNIT_CELL_SIZE,
> > +                                                    p_def);
> >       ret = imx214->ctrls.error;
> >       if (ret) {
> >               dev_err(&client->dev, "%s control init failed (%d)\n",
> >
>
