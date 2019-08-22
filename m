Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35AC998FC9
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2019 11:39:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729666AbfHVJfv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Aug 2019 05:35:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:46834 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725987AbfHVJfv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Aug 2019 05:35:51 -0400
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 929B6233FD;
        Thu, 22 Aug 2019 09:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566466549;
        bh=LMbz0msR2O1TEK3U783cJtWTMHGs6gnyRFKKA4qw9FM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=wbBT/iLZv5Wp9pUaZsoOmul3hbR3i44kk5j2aCaC8DqcNqkb8QApNnM0k4vsvgHAN
         aMKjlKh3K5CM9JonHm6fzbo57cYnr6VBfpwbcEzpN/c8JTh86IVzyiGfr4wLImSiy1
         r+EaZOw07sRHt8H3Lt1nBM5rAX/6K678k72nm6ZM=
Received: by mail-lj1-f178.google.com with SMTP id t14so4923305lji.4;
        Thu, 22 Aug 2019 02:35:49 -0700 (PDT)
X-Gm-Message-State: APjAAAXLe5G5+5NUwYQVKopoIuXG0KvuSHd+kGW3/tYVsH3I+dJvFDTs
        /ZMENoUpPBQzKO0S9d6t+gpQ4KCJ5t88r/5OR5Y=
X-Google-Smtp-Source: APXvYqwPG6IU9fzrtES73q5HLxpelXNjNyTBalBXupuLQ+rX2BTYt8MTWVa27JDKckQ6Tyd1mVaeOKbvP/nwZOxlJaM=
X-Received: by 2002:a2e:95d9:: with SMTP id y25mr17509040ljh.236.1566466547743;
 Thu, 22 Aug 2019 02:35:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190820094027.4144-1-ribalda@kernel.org> <20190820094027.4144-3-ribalda@kernel.org>
 <1566466282.3653.5.camel@pengutronix.de>
In-Reply-To: <1566466282.3653.5.camel@pengutronix.de>
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
Date:   Thu, 22 Aug 2019 11:35:30 +0200
X-Gmail-Original-Message-ID: <CAPybu_2jeu4m8o5nT932dot5LtY0s5zecK6XZ_owr1qVeV9+yQ@mail.gmail.com>
Message-ID: <CAPybu_2jeu4m8o5nT932dot5LtY0s5zecK6XZ_owr1qVeV9+yQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] media: imx214: Add new control with V4L2_CID_UNIT_CELL_SIZE
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Philipp

On Thu, Aug 22, 2019 at 11:31 AM Philipp Zabel <p.zabel@pengutronix.de> wrote:
>
> On Tue, 2019-08-20 at 11:40 +0200, Ricardo Ribalda Delgado wrote:
> > According to the product brief, the unit cell size is 1120 nanometers^2.
> >
> > https://www.sony-semicon.co.jp/products_en/IS/sensor1/img/products/ProductBrief_IMX214_20150428.pdf
> >
> > Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
> > ---
> >  drivers/media/i2c/imx214.c | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> >
> > diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> > index 159a3a604f0e..cc0a013ba7da 100644
> > --- a/drivers/media/i2c/imx214.c
> > +++ b/drivers/media/i2c/imx214.c
> > @@ -47,6 +47,7 @@ struct imx214 {
> >       struct v4l2_ctrl *pixel_rate;
> >       struct v4l2_ctrl *link_freq;
> >       struct v4l2_ctrl *exposure;
> > +     struct v4l2_ctrl *unit_size;
>
> This is never used.
>
> Neither are pixel_rate and exposure, it appears. And link_freq is only
> used locally in imx214_probe to set the read-only flag.
>
> >
> >       struct regulator_bulk_data      supplies[IMX214_NUM_SUPPLIES];
> >
> > @@ -941,6 +942,26 @@ static int __maybe_unused imx214_resume(struct device *dev)
> >       return ret;
> >  }
> >
> > +static void unit_size_init(const struct v4l2_ctrl *ctrl, u32 idx,
> > +                  union v4l2_ctrl_ptr ptr)
> > +{
> > +     ptr.p_area->width = 1120;
> > +     ptr.p_area->height = 1120;
> > +}
> > +
> > +static const struct v4l2_ctrl_type_ops unit_size_ops = {
> > +     .init = unit_size_init,
> > +};
> > +
> > +static struct v4l2_ctrl *new_unit_size_ctrl(struct v4l2_ctrl_handler *handler)
> > +{
> > +     static struct v4l2_ctrl_config ctrl = {
> > +             .id = V4L2_CID_UNIT_CELL_SIZE,
> > +             .type_ops = &unit_size_ops,
> > +     };
> > +
> > +     return v4l2_ctrl_new_custom(handler, &ctrl, NULL);
> > +}
> >  static int imx214_probe(struct i2c_client *client)
> >  {
> >       struct device *dev = &client->dev;
> > @@ -1029,6 +1050,8 @@ static int imx214_probe(struct i2c_client *client)
> >                                            V4L2_CID_EXPOSURE,
> >                                            0, 3184, 1, 0x0c70);
> >
> > +     imx214->unit_size = new_unit_size_ctrl(&imx214->ctrls);
> > +
> >       ret = imx214->ctrls.error;
> >       if (ret) {
> >               dev_err(&client->dev, "%s control init failed (%d)\n",
>
> This seems like a lot of parts to assemble in every sensor driver just
> to provide a constant area control. Should this be turned into a
> v4l2_ctrl_new_area helper that takes a const struct v4l2_area as an
> argument?

I agree, I was planning on making a helper afterwards ;). I do not
mind adding it to this series.

>
>         static const struct v4l2_area unit_cell_size = {
>                 .width = 1120,
>                 .height = 1120
>         };
>
>         v4l2_ctrl_new_area(&imx214->ctrls, V4L2_CID_UNIT_CELL_SIZE,
>                            &unit_cell_size);
>
> regards
> Philipp
