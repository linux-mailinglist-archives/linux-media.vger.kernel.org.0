Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 209BABE700
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2019 23:23:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725821AbfIYVW4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Sep 2019 17:22:56 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:44633 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725806AbfIYVW4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Sep 2019 17:22:56 -0400
Received: by mail-lj1-f194.google.com with SMTP id m13so7190254ljj.11;
        Wed, 25 Sep 2019 14:22:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U610o8DhX8dPtXlasTMJnSiR0eXeLZTVnrwXIEiOEPo=;
        b=Qx8FKvmTMGfUSHUo/RUf3UuUnv6EQWp2vaJ4FO36OKbvRIWvZNzYGwyxp+/+JyxQq+
         6JH4RfIWjBqEW+mMsqh6p5KYWAGKXaadK6Y0y00aXiNLQYDQbirITA9dv74WpThMrEZF
         LmFw/mLZYE4/7Lw5HTo5gFcRtOHxDc37j+SD3FwCWe5RE2tBknGxr4uL9nouRo534XIz
         xZHtk21TaAiywWCcLnREgHJk24I4d+bv7sABoMm2l7JDWHc20MMfXHJ0fylbJqE0Xz+1
         iYb0Ro3pQWhFcHABKAvmqGs9UqqVF7Zdne/+PUfBePP2SjwBSrp4D2nCKLi+Slzw1/6P
         BnrA==
X-Gm-Message-State: APjAAAXekmSYKzoOHE/Brr6tErCT3gKr9+9Xb3d6J3unC/WORYPAbGTU
        BxBXQXydk8TKdUf03VtpNxzJ+VUwpcrPTqrwxmA=
X-Google-Smtp-Source: APXvYqyBY16qcMqD0X8eEUYTs58uMslOWYDq9eAWjL6JvfhkAcnE4rCuNMhhk3pBQNWxSFrIp2pWUuL3gOp/77CtKZ4=
X-Received: by 2002:a2e:5b9a:: with SMTP id m26mr238583lje.90.1569446140921;
 Wed, 25 Sep 2019 14:15:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190920135137.10052-1-ricardo@ribalda.com> <20190920135137.10052-8-ricardo@ribalda.com>
 <20190925092552.okhiq5nweujjuk7q@uno.localdomain>
In-Reply-To: <20190925092552.okhiq5nweujjuk7q@uno.localdomain>
From:   Ricardo Ribalda Delgado <ricardo@ribalda.com>
Date:   Wed, 25 Sep 2019 23:15:19 +0200
Message-ID: <CAPybu_3ma+oPPzgQ39fjGtZrSLxPuLRC2crvFe0cERGYZfzwuw@mail.gmail.com>
Subject: Re: [PATCH v6 7/7] media: imx214: Add new control with V4L2_CID_UNIT_CELL_SIZE
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo

Thanks for the review

On Wed, Sep 25, 2019 at 11:24 AM Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> Hi Ricardo,
>
> On Fri, Sep 20, 2019 at 03:51:37PM +0200, Ricardo Ribalda Delgado wrote:
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
>
> Would something like this scale? I'm a bit bothered by the need of
> declaring v4l2_ctrl_ptr structure just to set a field there in
> drivers.

I have implemented the interface that Hans proposed on
https://www.mail-archive.com/linux-media@vger.kernel.org/msg149901.html

I thik Hans prefers this way to avoid castings, which can end in a lot
of "here be dragoons" :)


>
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index 57562e20c4ca..a00d8fa481c2 100644
> --- a/drivers/media/i2c/imx214.c
> +++ b/drivers/media/i2c/imx214.c
> @@ -953,9 +953,6 @@ static int imx214_probe(struct i2c_client *client)
>                 .width = 1120,
>                 .height = 1120,
>         };
> -       union v4l2_ctrl_ptr p_def = {
> -               .p_area = &unit_size,
> -       };
>         int ret;
>
>         ret = imx214_parse_fwnode(dev);
> @@ -1040,7 +1037,7 @@ static int imx214_probe(struct i2c_client *client)
>         imx214->unit_size = v4l2_ctrl_new_std_compound(&imx214->ctrls,
>                                                        NULL,
>                                                        V4L2_CID_UNIT_CELL_SIZE,
> -                                                      p_def);
> +                                                      &unit_size);
>         ret = imx214->ctrls.error;
>         if (ret) {
>                 dev_err(&client->dev, "%s control init failed (%d)\n",
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index f626f9983408..4a2648bee6f5 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -2681,18 +2681,26 @@ EXPORT_SYMBOL(v4l2_ctrl_new_std_menu_items);
>  /* Helper function for standard compound controls */
>  struct v4l2_ctrl *v4l2_ctrl_new_std_compound(struct v4l2_ctrl_handler *hdl,
>                                 const struct v4l2_ctrl_ops *ops, u32 id,
> -                               const union v4l2_ctrl_ptr p_def)
> +                               void *defval)
>  {
>         const char *name;
>         enum v4l2_ctrl_type type;
>         u32 flags;
>         s64 min, max, step, def;
> +       union v4l2_ctrl_ptr p_def;
>
>         v4l2_ctrl_fill(id, &name, &type, &min, &max, &step, &def, &flags);
>         if (type < V4L2_CTRL_COMPOUND_TYPES) {
>                 handler_set_err(hdl, -EINVAL);
>                 return NULL;
>         }
> +
> +       switch ((u32)type) {
> +       case V4L2_CTRL_TYPE_AREA:
> +               p_def.p_area = defval;
> +               break;
> +       }
> +
>         return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
>                              min, max, step, def, NULL, 0,
>                              flags, NULL, NULL, p_def, NULL);
>
> However, due to my limitied understanding of the control framework, I
> cannot tell how many cases the newly introduced switch should
> handle...
>
> > --
> > 2.23.0
> >



-- 
Ricardo Ribalda
