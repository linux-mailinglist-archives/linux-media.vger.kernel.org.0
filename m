Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAE921BC0B7
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2020 16:09:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727834AbgD1OJk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Apr 2020 10:09:40 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:54317 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727782AbgD1OJk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Apr 2020 10:09:40 -0400
X-Originating-IP: 212.216.150.148
Received: from uno.localdomain (a-ur1-85.tin.it [212.216.150.148])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 517991C0008;
        Tue, 28 Apr 2020 14:09:35 +0000 (UTC)
Date:   Tue, 28 Apr 2020 16:12:46 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     dave.stevenson@raspberrypi.com, linux-media@vger.kernel.org,
        mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hverkuil-cisco@xs4all.nl
Subject: Re: [PATCH v2] media: i2c: imx219: Implement get_selection
Message-ID: <20200428141246.cao7hvdq6tlfuw5g@uno.localdomain>
References: <20200426205250.305320-1-jacopo@jmondi.org>
 <20200426210548.GD31313@pendragon.ideasonboard.com>
 <20200428134036.askdjybit2lq47t6@uno.localdomain>
 <20200428134153.GF5859@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200428134153.GF5859@pendragon.ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, Apr 28, 2020 at 04:41:53PM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
>
> On Tue, Apr 28, 2020 at 03:40:36PM +0200, Jacopo Mondi wrote:
> > On Mon, Apr 27, 2020 at 12:05:48AM +0300, Laurent Pinchart wrote:
> > > Hi Jacopo,
> > >
> > > Thank you for the patch.
> > >
> >
> > [snip]
> >
> > > > +
> > > > +static int imx219_get_selection(struct v4l2_subdev *sd,
> > > > +				struct v4l2_subdev_pad_config *cfg,
> > > > +				struct v4l2_subdev_selection *sel)
> > > > +{
> > > > +	struct imx219 *imx219 = to_imx219(sd);
> > > > +	const struct v4l2_rect *__crop;
> > > > +
> > > > +	if (sel->pad != 0)
> > > > +		return -EINVAL;
> > > > +
> > > > +	mutex_lock(&imx219->mutex);
> > > > +
> > > > +	switch (sel->target) {
> > > > +	case V4L2_SEL_TGT_NATIVE_SIZE:
> > > > +		sel->r.top = 0;
> > > > +		sel->r.left = 0;
> > > > +		sel->r.width = IMX219_NATIVE_WIDTH;
> > > > +		sel->r.height = IMX219_NATIVE_HEIGHT;
> > > > +		mutex_unlock(&imx219->mutex);
> > > > +
> > > > +		return 0;
> > > > +
> > > > +	case V4L2_SEL_TGT_CROP_DEFAULT:
> > > > +		sel->r.top = IMX219_PIXEL_ARRAY_TOP;
> > > > +		sel->r.left = IMX219_PIXEL_ARRAY_LEFT;
> > > > +		sel->r.width = IMX219_PIXEL_ARRAY_WIDTH;
> > > > +		sel->r.height = IMX219_PIXEL_ARRAY_HEIGHT;
> > > > +		mutex_unlock(&imx219->mutex);
> > > > +
> > > > +		return 0;
> > > > +
> > > > +	case V4L2_SEL_TGT_CROP:
> > > > +		__crop = __imx219_get_pad_crop(imx219, cfg, sel->pad,
> > > > +					       sel->which);
> > > > +		sel->r = *__crop;
> > > > +		mutex_unlock(&imx219->mutex);
> > >
> > > I should have thought about it before, but only this case requires
> > > locking. Maybe
> >
> > I should have thought it better, yes
> >
> > >
> > > 		__crop = __imx219_get_pad_crop(imx219, cfg, sel->pad,
> > > 					       sel->which);
> > > 		mutex_lock(&imx219->mutex);
> >
> > Actually, retreiveing __crop should be protected too, as the crop
> > rectangle is part of the imx219->mode, which is updated by the set_fmt
> > operation.
>
> __crop is a pointer, retrieving the pointer doesn't need protection.
> Accessing its contents does. No big deal though, it's cheap, as long as
> we don't lock for the bounds and default cases.

Sorry, I was not clear maybe.

- __crop points to imx219->mode->crop
- set_fmt updates imx219->mode
- in the tiny window between when we get a pointer to
  imx219->mode->crop and we enter the critical section here a set_fmt call
  can update the imx219->mode, so we'll have here a pointer to the
  previous crop rectangle.

Unlikely, but yet, possible.
