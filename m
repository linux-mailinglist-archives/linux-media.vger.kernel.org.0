Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CB9E1BC00A
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2020 15:43:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727076AbgD1NmM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Apr 2020 09:42:12 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:42960 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727057AbgD1NmL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Apr 2020 09:42:11 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2930572C;
        Tue, 28 Apr 2020 15:42:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1588081329;
        bh=Ztwc28sa8MiTTHghqNIMgky45c6jDpHEve/akex51bw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eE1py6Odoo3ru7bZdKGO+Z01kUrkdZpc43E1d8bBwUeLKJYWTUK1NS9TIi2KjXEQp
         u95t5umIYoaHl+qhsDAYJfLJ7lfo4yreyKbRgtvtGK7l0RGmJtEJTcQWs8TTW8xgSy
         JxAaEJ03Yds3bg769S4NuE73BzULhzBAROG1G2FU=
Date:   Tue, 28 Apr 2020 16:41:53 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     dave.stevenson@raspberrypi.com, linux-media@vger.kernel.org,
        mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hverkuil-cisco@xs4all.nl
Subject: Re: [PATCH v2] media: i2c: imx219: Implement get_selection
Message-ID: <20200428134153.GF5859@pendragon.ideasonboard.com>
References: <20200426205250.305320-1-jacopo@jmondi.org>
 <20200426210548.GD31313@pendragon.ideasonboard.com>
 <20200428134036.askdjybit2lq47t6@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200428134036.askdjybit2lq47t6@uno.localdomain>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Tue, Apr 28, 2020 at 03:40:36PM +0200, Jacopo Mondi wrote:
> On Mon, Apr 27, 2020 at 12:05:48AM +0300, Laurent Pinchart wrote:
> > Hi Jacopo,
> >
> > Thank you for the patch.
> >
> 
> [snip]
> 
> > > +
> > > +static int imx219_get_selection(struct v4l2_subdev *sd,
> > > +				struct v4l2_subdev_pad_config *cfg,
> > > +				struct v4l2_subdev_selection *sel)
> > > +{
> > > +	struct imx219 *imx219 = to_imx219(sd);
> > > +	const struct v4l2_rect *__crop;
> > > +
> > > +	if (sel->pad != 0)
> > > +		return -EINVAL;
> > > +
> > > +	mutex_lock(&imx219->mutex);
> > > +
> > > +	switch (sel->target) {
> > > +	case V4L2_SEL_TGT_NATIVE_SIZE:
> > > +		sel->r.top = 0;
> > > +		sel->r.left = 0;
> > > +		sel->r.width = IMX219_NATIVE_WIDTH;
> > > +		sel->r.height = IMX219_NATIVE_HEIGHT;
> > > +		mutex_unlock(&imx219->mutex);
> > > +
> > > +		return 0;
> > > +
> > > +	case V4L2_SEL_TGT_CROP_DEFAULT:
> > > +		sel->r.top = IMX219_PIXEL_ARRAY_TOP;
> > > +		sel->r.left = IMX219_PIXEL_ARRAY_LEFT;
> > > +		sel->r.width = IMX219_PIXEL_ARRAY_WIDTH;
> > > +		sel->r.height = IMX219_PIXEL_ARRAY_HEIGHT;
> > > +		mutex_unlock(&imx219->mutex);
> > > +
> > > +		return 0;
> > > +
> > > +	case V4L2_SEL_TGT_CROP:
> > > +		__crop = __imx219_get_pad_crop(imx219, cfg, sel->pad,
> > > +					       sel->which);
> > > +		sel->r = *__crop;
> > > +		mutex_unlock(&imx219->mutex);
> >
> > I should have thought about it before, but only this case requires
> > locking. Maybe
> 
> I should have thought it better, yes
> 
> >
> > 		__crop = __imx219_get_pad_crop(imx219, cfg, sel->pad,
> > 					       sel->which);
> > 		mutex_lock(&imx219->mutex);
> 
> Actually, retreiveing __crop should be protected too, as the crop
> rectangle is part of the imx219->mode, which is updated by the set_fmt
> operation.

__crop is a pointer, retrieving the pointer doesn't need protection.
Accessing its contents does. No big deal though, it's cheap, as long as
we don't lock for the bounds and default cases.

> I'll wrap the whole case content in a critical session.
> 
> > 		sel->r = *__crop;
> > 		mutex_unlock(&imx219->mutex);
> >
> > and removing the mutex_lock() at the beginning ?
> >
> > > +
> > > +		return 0;
> > > +	}
> > > +
> > > +	mutex_unlock(&imx219->mutex);
> > > +
> > > +	return -EINVAL;
> > > +}
> > > +
> > >  static int imx219_start_streaming(struct imx219 *imx219)
> > >  {
> > >  	struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
> > > @@ -1152,6 +1248,7 @@ static const struct v4l2_subdev_pad_ops imx219_pad_ops = {
> > >  	.enum_mbus_code = imx219_enum_mbus_code,
> > >  	.get_fmt = imx219_get_pad_format,
> > >  	.set_fmt = imx219_set_pad_format,
> > > +	.get_selection = imx219_get_selection,
> > >  	.enum_frame_size = imx219_enum_frame_size,
> > >  };
> > >

-- 
Regards,

Laurent Pinchart
