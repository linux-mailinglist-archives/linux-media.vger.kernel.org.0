Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F37C02C4F6F
	for <lists+linux-media@lfdr.de>; Thu, 26 Nov 2020 08:30:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729937AbgKZH25 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Nov 2020 02:28:57 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:34759 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728047AbgKZH25 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Nov 2020 02:28:57 -0500
Received: from uno.localdomain (host-80-104-176-17.retail.telecomitalia.it [80.104.176.17])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 5E5EF20000E;
        Thu, 26 Nov 2020 07:28:52 +0000 (UTC)
Date:   Thu, 26 Nov 2020 08:28:57 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
        libcamera-devel@lists.libcamera.org,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [libcamera-devel] [PATCH 4/4] media: i2c: imx219: Selection
 compliance fixes
Message-ID: <20201126072857.52cplpzfwq7tnejz@uno.localdomain>
References: <20200805105721.15445-1-jacopo@jmondi.org>
 <20200805105721.15445-5-jacopo@jmondi.org>
 <20201106123306.2djzfifmopfl6og6@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201106123306.2djzfifmopfl6og6@uno.localdomain>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Fri, Nov 06, 2020 at 01:33:06PM +0100, Jacopo Mondi wrote:
> Hi Hans,
>
> On Wed, Aug 05, 2020 at 12:57:21PM +0200, Jacopo Mondi wrote:
> > From: Hans Verkuil <hverkuil@xs4all.nl>
> >
> > To comply with the intended usage of the V4L2 selection target when
> > used to retrieve a sensor image properties, adjust the rectangles
> > returned by the imx219 driver.
> >
> > The top/left crop coordinates of the TGT_CROP rectangle were set to
> > (0, 0) instead of (8, 8) which is the offset from the larger physical
> > pixel array rectangle. This was also a mismatch with the default values
> > crop rectangle value, so this is corrected. Found with v4l2-compliance.
> >
> > While at it, add V4L2_SEL_TGT_CROP_BOUNDS support: CROP_DEFAULT and
> > CROP_BOUNDS have the same size as the non-active pixels are not readable
> > using the selection API. Found with v4l2-compliance.
> >
> > Fixes: e6d4ef7d58aa7 ("media: i2c: imx219: Implement get_selection")
> > Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > [reword commit message, use macros for pixel offsets]
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
>
> Has this fallen to the cracks ? It was part of a larger series
> (abandoned for now) but I think this patch has merits and can be broke
> out.
>
> If that's the case I'll fix ov5647 which I have in the pipe which
> suffer from the same issue as this one and update the libcamera side
> that uses this information.

Gentle ping

>
> Thanks
>   j
>
> > ---
> >  drivers/media/i2c/imx219.c | 17 +++++++++--------
> >  1 file changed, 9 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > index 60b23d113fc56..ff48a95b448b1 100644
> > --- a/drivers/media/i2c/imx219.c
> > +++ b/drivers/media/i2c/imx219.c
> > @@ -473,8 +473,8 @@ static const struct imx219_mode supported_modes[] = {
> >  		.width = 3280,
> >  		.height = 2464,
> >  		.crop = {
> > -			.left = 0,
> > -			.top = 0,
> > +			.left = IMX219_PIXEL_ARRAY_LEFT,
> > +			.top = IMX219_PIXEL_ARRAY_TOP,
> >  			.width = 3280,
> >  			.height = 2464
> >  		},
> > @@ -489,8 +489,8 @@ static const struct imx219_mode supported_modes[] = {
> >  		.width = 1920,
> >  		.height = 1080,
> >  		.crop = {
> > -			.left = 680,
> > -			.top = 692,
> > +			.left = 688,
> > +			.top = 700,
> >  			.width = 1920,
> >  			.height = 1080
> >  		},
> > @@ -505,8 +505,8 @@ static const struct imx219_mode supported_modes[] = {
> >  		.width = 1640,
> >  		.height = 1232,
> >  		.crop = {
> > -			.left = 0,
> > -			.top = 0,
> > +			.left = IMX219_PIXEL_ARRAY_LEFT,
> > +			.top = IMX219_PIXEL_ARRAY_TOP,
> >  			.width = 3280,
> >  			.height = 2464
> >  		},
> > @@ -521,8 +521,8 @@ static const struct imx219_mode supported_modes[] = {
> >  		.width = 640,
> >  		.height = 480,
> >  		.crop = {
> > -			.left = 1000,
> > -			.top = 752,
> > +			.left = 1008,
> > +			.top = 760,
> >  			.width = 1280,
> >  			.height = 960
> >  		},
> > @@ -1045,6 +1045,7 @@ static int imx219_get_selection(struct v4l2_subdev *sd,
> >  		return 0;
> >
> >  	case V4L2_SEL_TGT_CROP_DEFAULT:
> > +	case V4L2_SEL_TGT_CROP_BOUNDS:
> >  		sel->r.top = IMX219_PIXEL_ARRAY_TOP;
> >  		sel->r.left = IMX219_PIXEL_ARRAY_LEFT;
> >  		sel->r.width = IMX219_PIXEL_ARRAY_WIDTH;
> > --
> > 2.27.0
> >
> _______________________________________________
> libcamera-devel mailing list
> libcamera-devel@lists.libcamera.org
> https://lists.libcamera.org/listinfo/libcamera-devel
