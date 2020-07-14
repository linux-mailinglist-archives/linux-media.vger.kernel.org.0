Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0613220124
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2020 01:49:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727834AbgGNXtr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jul 2020 19:49:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726964AbgGNXtr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jul 2020 19:49:47 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50534C061755
        for <linux-media@vger.kernel.org>; Tue, 14 Jul 2020 16:49:47 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9D9B871D;
        Wed, 15 Jul 2020 01:49:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594770585;
        bh=WS5sdAOHn6poxkBeivvOuHczZ4xvC44z0LELG7wxB3Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=af8e7oOC9p2Gd0KMJM4+P2nZzTSX/SK8ox0qmNCVrEsw/SrGDKfIDrue7zP1nGH1q
         GK+DhELUx66qjxwFaKlr8JXp0vglKe7FkRVNhrmaosk5wCzmwXClqpa8e9J8RgaFQ8
         0a8klk7sZCSLuBlo8SJRHjC/OzmAK0KBHDhm8NZ8=
Date:   Wed, 15 Jul 2020 02:49:38 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
        libcamera-devel@lists.libcamera.org
Subject: Re: [PATCH] imx219: selection compliance fixes
Message-ID: <20200714234938.GP5854@pendragon.ideasonboard.com>
References: <b580ac9d-5ae4-29ce-c81a-a1f98b1d953b@xs4all.nl>
 <20200714123146.5xhmslath7vqqfds@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200714123146.5xhmslath7vqqfds@uno.localdomain>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Tue, Jul 14, 2020 at 02:31:46PM +0200, Jacopo Mondi wrote:
> Hi Hans,
> 
> On Thu, Jul 02, 2020 at 03:50:04PM +0200, Hans Verkuil wrote:
> > The top/left crop coordinates were 0, 0 instead of 8, 8 in the
> > supported_modes array. This was a mismatch with the default values,
> > so this is corrected. Found with v4l2-compliance.
> >
> > Also add V4L2_SEL_TGT_CROP_BOUNDS support: CROP_DEFAULT and CROP_BOUNDS
> > always go together. Found with v4l2-compliance.
> 
> I actually introduced this with
> e6d4ef7d58aa ("media: i2c: imx219: Implement get_selection")
> 
> >
> > Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > ---
> >  drivers/media/i2c/imx219.c | 17 +++++++++--------
> >  1 file changed, 9 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > index 0a546b8e466c..935e2a258ce5 100644
> > --- a/drivers/media/i2c/imx219.c
> > +++ b/drivers/media/i2c/imx219.c
> > @@ -473,8 +473,8 @@ static const struct imx219_mode supported_modes[] = {
> >  		.width = 3280,
> >  		.height = 2464,
> >  		.crop = {
> > -			.left = 0,
> > -			.top = 0,
> > +			.left = 8,
> > +			.top = 8,
> 
> Mmmm, why this change ?
> This values are used to report V4L2_SEL_TGT_CROP rectangle, which
> according to the documentation is defined as
> "Crop rectangle. Defines the cropped area."
> (not a much extensive description :)
> 
> Clearly this is a faulty definition, and I know from experience how
> hard is proving to define pixel array properties and in which extent
> the documentation has to go:
> https://lists.libcamera.org/pipermail/libcamera-devel/2020-June/009115.html
> 
> My understanding is that target should report the current crop
> rectangle, defined from the rectangle retrieved with the
> V4L2_SEL_TGT_CROP_DEFAULT target, which, according documentation
> reports the:
> "Suggested cropping rectangle that covers the “whole picture”.
> This includes only active pixels and excludes other non-active pixels such
> as black pixels"
> 
> The TGT_CROP_DEFAULT then reports the active pixel array portion, and
> needs to be defined in respect to the TGT_NATIVE_SIZE, which reports
> the dimensions of the whole pixel matrix, including non-active pixels,
> optical blanks active and non-active pixels.
> 
> The TGT_CROP rectangle is hence defined from the CROP_DEFAULT one, and
> if the 'whole active area' is selected, its top-left corner is placed
> in position (0, 0) (what's the point of defining it in respect to an
> area which cannot be read anyway ?)
> 
> Unless TGT_CROP should be defined in respect to the NATIVE_SIZE
> rectangle too, but that's not specified anywhere.
> 
> Anyway, those selection targets badly apply to image sensors, are
> ill-defined as the definition of active pixels, optical blank (active
> and non-active) pixels is not provided anywhere, and it's not specified
> anywhere what is the reference area for each of those rectangles, so I
> might very well got them wrongly.

My understanding is that both TGT_CROP_DEFAULT and TGT_CROP_BOUNDS are
relative to TGT_NATIVE_SIZE. BOUNDS defines all the pixels that can be
captured, including optical black and invalid pixels, while DEFAULT
defines the active area, excluding optical black and invalida pixels. To
put it another way, DEFAULT is what the kernel recommends applications
to use if they have no specific requirement and/or no specific knowledge
about the sensor.

I fully agree this is very under-documented, which also means that my
understanding may be wrong :-)

> >  			.width = 3280,
> >  			.height = 2464
> >  		},
> > @@ -489,8 +489,8 @@ static const struct imx219_mode supported_modes[] = {
> >  		.width = 1920,
> >  		.height = 1080,
> >  		.crop = {
> > -			.left = 680,
> > -			.top = 692,
> > +			.left = 8 + 680,
> > +			.top = 8 + 692,
> >  			.width = 1920,
> >  			.height = 1080
> >  		},
> > @@ -505,8 +505,8 @@ static const struct imx219_mode supported_modes[] = {
> >  		.width = 1640,
> >  		.height = 1232,
> >  		.crop = {
> > -			.left = 0,
> > -			.top = 0,
> > +			.left = 8,
> > +			.top = 8,
> >  			.width = 3280,
> >  			.height = 2464
> >  		},
> > @@ -521,8 +521,8 @@ static const struct imx219_mode supported_modes[] = {
> >  		.width = 640,
> >  		.height = 480,
> >  		.crop = {
> > -			.left = 1000,
> > -			.top = 752,
> > +			.left = 8 + 1000,
> > +			.top = 8 + 752,
> >  			.width = 1280,
> >  			.height = 960
> >  		},
> > @@ -1014,6 +1014,7 @@ static int imx219_get_selection(struct v4l2_subdev *sd,
> >  		return 0;
> >
> >  	case V4L2_SEL_TGT_CROP_DEFAULT:
> > +	case V4L2_SEL_TGT_CROP_BOUNDS:
> 
> Still not getting what is the purpose of two targets if the "always
> have to go together" :)
> 
> >  		sel->r.top = IMX219_PIXEL_ARRAY_TOP;
> >  		sel->r.left = IMX219_PIXEL_ARRAY_LEFT;
> >  		sel->r.width = IMX219_PIXEL_ARRAY_WIDTH;

-- 
Regards,

Laurent Pinchart
