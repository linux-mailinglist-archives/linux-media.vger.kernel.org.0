Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A2C01BBFAD
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2020 15:37:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726860AbgD1Nha (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Apr 2020 09:37:30 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:59323 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726846AbgD1Nha (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Apr 2020 09:37:30 -0400
Received: from uno.localdomain (a-ur1-85.tin.it [212.216.150.148])
        (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id D4C7310000D;
        Tue, 28 Apr 2020 13:37:25 +0000 (UTC)
Date:   Tue, 28 Apr 2020 15:40:36 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     dave.stevenson@raspberrypi.com, linux-media@vger.kernel.org,
        mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hverkuil-cisco@xs4all.nl
Subject: Re: [PATCH v2] media: i2c: imx219: Implement get_selection
Message-ID: <20200428134036.askdjybit2lq47t6@uno.localdomain>
References: <20200426205250.305320-1-jacopo@jmondi.org>
 <20200426210548.GD31313@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200426210548.GD31313@pendragon.ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Mon, Apr 27, 2020 at 12:05:48AM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>

[snip]

> > +
> > +static int imx219_get_selection(struct v4l2_subdev *sd,
> > +				struct v4l2_subdev_pad_config *cfg,
> > +				struct v4l2_subdev_selection *sel)
> > +{
> > +	struct imx219 *imx219 = to_imx219(sd);
> > +	const struct v4l2_rect *__crop;
> > +
> > +	if (sel->pad != 0)
> > +		return -EINVAL;
> > +
> > +	mutex_lock(&imx219->mutex);
> > +
> > +	switch (sel->target) {
> > +	case V4L2_SEL_TGT_NATIVE_SIZE:
> > +		sel->r.top = 0;
> > +		sel->r.left = 0;
> > +		sel->r.width = IMX219_NATIVE_WIDTH;
> > +		sel->r.height = IMX219_NATIVE_HEIGHT;
> > +		mutex_unlock(&imx219->mutex);
> > +
> > +		return 0;
> > +
> > +	case V4L2_SEL_TGT_CROP_DEFAULT:
> > +		sel->r.top = IMX219_PIXEL_ARRAY_TOP;
> > +		sel->r.left = IMX219_PIXEL_ARRAY_LEFT;
> > +		sel->r.width = IMX219_PIXEL_ARRAY_WIDTH;
> > +		sel->r.height = IMX219_PIXEL_ARRAY_HEIGHT;
> > +		mutex_unlock(&imx219->mutex);
> > +
> > +		return 0;
> > +
> > +	case V4L2_SEL_TGT_CROP:
> > +		__crop = __imx219_get_pad_crop(imx219, cfg, sel->pad,
> > +					       sel->which);
> > +		sel->r = *__crop;
> > +		mutex_unlock(&imx219->mutex);
>
> I should have thought about it before, but only this case requires
> locking. Maybe

I should have thought it better, yes

>
> 		__crop = __imx219_get_pad_crop(imx219, cfg, sel->pad,
> 					       sel->which);
> 		mutex_lock(&imx219->mutex);

Actually, retreiveing __crop should be protected too, as the crop
rectangle is part of the imx219->mode, which is updated by the set_fmt
operation.

I'll wrap the whole case content in a critical session.

Thanks
  j

> 		sel->r = *__crop;
> 		mutex_unlock(&imx219->mutex);
>
> and removing the mutex_lock() at the beginning ?
>
> > +
> > +		return 0;
> > +	}
> > +
> > +	mutex_unlock(&imx219->mutex);
> > +
> > +	return -EINVAL;
> > +}
> > +
> >  static int imx219_start_streaming(struct imx219 *imx219)
> >  {
> >  	struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
> > @@ -1152,6 +1248,7 @@ static const struct v4l2_subdev_pad_ops imx219_pad_ops = {
> >  	.enum_mbus_code = imx219_enum_mbus_code,
> >  	.get_fmt = imx219_get_pad_format,
> >  	.set_fmt = imx219_set_pad_format,
> > +	.get_selection = imx219_get_selection,
> >  	.enum_frame_size = imx219_enum_frame_size,
> >  };
> >
> > --
> > 2.26.1
> >
>
> --
> Regards,
>
> Laurent Pinchart
