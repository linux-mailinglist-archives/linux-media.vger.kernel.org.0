Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2ECF798022
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2019 18:32:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728493AbfHUQbZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Aug 2019 12:31:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:54398 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726828AbfHUQbZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Aug 2019 12:31:25 -0400
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C7AE1216F4;
        Wed, 21 Aug 2019 16:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566405084;
        bh=bnh8CvEnQy9X0C5bvrBrKiyeazRpnmEBbeppLigN01M=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=A4JP0whayHrqiYOVBAWhgwbz5C2crsOyLMmFmTDTd7JmlLqBoHVPOp8AmaE/1WVZb
         qbiKfKwz6zTugTqA4BeGM5x2S/cC/2VQ6ZqyC+RbVmgXCBkcdZy+3+qTpkbBelEqD+
         3hLuketMdtBNM/br/RWxkKZxlQJv0TzWM7p3ilEY=
Received: by mail-lf1-f41.google.com with SMTP id c19so2253749lfm.10;
        Wed, 21 Aug 2019 09:31:23 -0700 (PDT)
X-Gm-Message-State: APjAAAXiQBL/fm5vFy7w4TFjV35xzIUeMo+LISKo94OC/jcRc+q0XLVD
        B90ZOi7Y74+1V6VmJ0HQtSK5dt+Gs/9hgTnU01M=
X-Google-Smtp-Source: APXvYqz/fVv8SO2SRb1xcvEP45J5/AL+mqd7uc/GSC0z3wrtoDQ5760ULyRWZHOO/9MnwlPhYhVrEsf9IJ0s9M8anYQ=
X-Received: by 2002:ac2:44ce:: with SMTP id d14mr19154003lfm.143.1566405082035;
 Wed, 21 Aug 2019 09:31:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190819121720.31345-1-ribalda@kernel.org> <20190819121720.31345-3-ribalda@kernel.org>
 <20190821161523.6lckivpwiihpl35z@uno.localdomain>
In-Reply-To: <20190821161523.6lckivpwiihpl35z@uno.localdomain>
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
Date:   Wed, 21 Aug 2019 18:31:05 +0200
X-Gmail-Original-Message-ID: <CAPybu_3QzD4t7c4BXLcxAwYbuKUoAmJY8foPQLm=XKzgD7W+Dw@mail.gmail.com>
Message-ID: <CAPybu_3QzD4t7c4BXLcxAwYbuKUoAmJY8foPQLm=XKzgD7W+Dw@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: imx214: Add new control with V4L2_CID_PIXEL_SIZE
To:     Jacopo Mondi <jacopo@jmondi.org>
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

Hi Jacopo


On Wed, Aug 21, 2019 at 6:14 PM Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> Hi Ricardo,
>
> On Mon, Aug 19, 2019 at 02:17:20PM +0200, Ricardo Ribalda Delgado wrote:
> > According to the product brief, the unit cell size is 1120 nanometers^2.
>
> Should this information come from DT ?

I do not think so. You cannot change this value and it needs to be
defined also in sensors/cameras that might not have a DT, like a usb
webcam.

It would be like adding to the DT the min/max exposure time...

But of course we can discuss it ;)

Best regards

>
> I'm asking as I've a series in review that adds an helper that
> collectes dt properties and register controls for them. It currently
> only supports the newly proposed camera location control, but there
> might be others like the rotation, for which we already have a DT
> property.
>
> https://patchwork.kernel.org/project/linux-media/list/?series=160901
>
> This new one is indeed an HW property of the sensor, I wonder if
> having it in the firmware interface would make any sense or not...
>
> Thanks
>   j
>
> >
> > https://www.sony-semicon.co.jp/products_en/IS/sensor1/img/products/ProductBrief_IMX214_20150428.pdf
> >
> > Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
> > ---
> >  drivers/media/i2c/imx214.c | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> >
> > diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> > index 159a3a604f0e..b2f6bd2d8d7d 100644
> > --- a/drivers/media/i2c/imx214.c
> > +++ b/drivers/media/i2c/imx214.c
> > @@ -47,6 +47,7 @@ struct imx214 {
> >       struct v4l2_ctrl *pixel_rate;
> >       struct v4l2_ctrl *link_freq;
> >       struct v4l2_ctrl *exposure;
> > +     struct v4l2_ctrl *pixel_size;
> >
> >       struct regulator_bulk_data      supplies[IMX214_NUM_SUPPLIES];
> >
> > @@ -941,6 +942,26 @@ static int __maybe_unused imx214_resume(struct device *dev)
> >       return ret;
> >  }
> >
> > +static void pixel_size_init(const struct v4l2_ctrl *ctrl, u32 idx,
> > +                  union v4l2_ctrl_ptr ptr)
> > +{
> > +     ptr.p_pixel_size->width = 1120;
> > +     ptr.p_pixel_size->height = 1120;
> > +}
> > +
> > +static const struct v4l2_ctrl_type_ops pixel_size_ops = {
> > +     .init = pixel_size_init,
> > +};
> > +
> > +static struct v4l2_ctrl *new_pixel_size_ctrl(struct v4l2_ctrl_handler *handler)
> > +{
> > +     static struct v4l2_ctrl_config ctrl = {
> > +             .id = V4L2_CID_PIXEL_SIZE,
> > +             .type_ops = &pixel_size_ops,
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
> > +     imx214->pixel_size = new_pixel_size_ctrl(&imx214->ctrls);
> > +
> >       ret = imx214->ctrls.error;
> >       if (ret) {
> >               dev_err(&client->dev, "%s control init failed (%d)\n",
> > --
> > 2.23.0.rc1
> >
