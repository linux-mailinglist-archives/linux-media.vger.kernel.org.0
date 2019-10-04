Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D301CB864
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2019 12:35:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387512AbfJDKfR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Oct 2019 06:35:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:46970 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387482AbfJDKfR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 4 Oct 2019 06:35:17 -0400
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 85E55207FF;
        Fri,  4 Oct 2019 10:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570185315;
        bh=lm6QI2OD7PE4Y+f59+6PY1W+uveJUbJmhBeMtYIzA1Q=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=pkdUK/VFbjAMiSjF7KwjVu6QWhF3ThXR5wjnSOQt3XZbh6yo+zTZvvPwnJ2ZrmeUl
         +3hWvhUVJ9bVssB2F3+TYcQuuiplkFVHJAte6I7MGYCCPnVsmG8WsRYPPVJjEEzrZh
         7sLCXX7vR+lr3o2EbssMiRGNFXnENi0BRwA0JPwU=
Received: by mail-lf1-f42.google.com with SMTP id r2so4105769lfn.8;
        Fri, 04 Oct 2019 03:35:15 -0700 (PDT)
X-Gm-Message-State: APjAAAW8q5PoDOUxMxZYukZfkYlbKUf6k8py35f8X4SimdSTdiqhjpDy
        uMc9oWrJ19aloFfM8OnuewnkPD9wqpXSPB7Zybc=
X-Google-Smtp-Source: APXvYqx0FfVj4sm3HZBluW8ovnu0fM3ne8UVt/pKLHbR55m/9NFo51yvBBzWDR+eof7CVXfVTJSfbzrF2dMLB4kzZhg=
X-Received: by 2002:a19:f711:: with SMTP id z17mr8421781lfe.58.1570185313710;
 Fri, 04 Oct 2019 03:35:13 -0700 (PDT)
MIME-Version: 1.0
References: <20191001112421.2778-1-ribalda@kernel.org> <20191001112421.2778-9-ribalda@kernel.org>
 <98d3b559-8be0-a240-c94f-3171dd543009@xs4all.nl>
In-Reply-To: <98d3b559-8be0-a240-c94f-3171dd543009@xs4all.nl>
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
Date:   Fri, 4 Oct 2019 12:34:57 +0200
X-Gmail-Original-Message-ID: <CAPybu_2nes-yNqdzq-nPQvu=T5J4EGo3bkvqif=XX39pzyLJpA@mail.gmail.com>
Message-ID: <CAPybu_2nes-yNqdzq-nPQvu=T5J4EGo3bkvqif=XX39pzyLJpA@mail.gmail.com>
Subject: Re: [PATCH v9 8/8] media: imx214: Add new control with V4L2_CID_UNIT_CELL_SIZE
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

On Fri, Oct 4, 2019 at 12:31 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 10/1/19 1:24 PM, Ricardo Ribalda Delgado wrote:
> > According to the product brief, the unit cell size is 1120 nanometers^2.
> >
> > https://www.sony-semicon.co.jp/products_en/IS/sensor1/img/products/ProductBrief_IMX214_20150428.pdf
> >
> > Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
> > ---
> >  drivers/media/i2c/imx214.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> > index 159a3a604f0e..adcaaa8c86d1 100644
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
> > @@ -948,6 +949,10 @@ static int imx214_probe(struct i2c_client *client)
> >       static const s64 link_freq[] = {
> >               IMX214_DEFAULT_LINK_FREQ,
> >       };
> > +     static const struct v4l2_area unit_size = {
> > +             .width = 1120,
> > +             .height = 1120,
> > +     };
> >       int ret;
> >
> >       ret = imx214_parse_fwnode(dev);
> > @@ -1029,6 +1034,10 @@ static int imx214_probe(struct i2c_client *client)
> >                                            V4L2_CID_EXPOSURE,
> >                                            0, 3184, 1, 0x0c70);
> >
> > +     imx214->unit_size = v4l2_ctrl_new_std_compound(&imx214->ctrls,
> > +                             NULL,
> > +                             V4L2_CID_UNIT_CELL_SIZE,
> > +                             v4l2_ctrl_ptr_create((void *)&unit_size));
>
> The imx214 supports two modes: 4096x2304 and 1920x1080. I assume that the
> latter is using binning? So shouldn't the unit cell size be different in that
> case?

To be honest I do not know if it is cropping or binning. I can try to
turn on the sensor and figure out if the field of view changes.

>
> I'm not so sure the unit cell size should depend on binning. I'd rather have
> the binning information exposed somehow and let userspace do the calculation.

I think there are good arguments on both directions ;).

The issue with considering the binning is that if there a later step
on the pipeline that does the bining then it has to change also the
unit_cell_size control. I would say, for now lets keep them
independent.


>
> Regards,
>
>         Hans
>
> >       ret = imx214->ctrls.error;
> >       if (ret) {
> >               dev_err(&client->dev, "%s control init failed (%d)\n",
> >
>
