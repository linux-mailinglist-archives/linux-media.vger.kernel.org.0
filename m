Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 455711923DA
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 10:17:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726109AbgCYJRg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 05:17:36 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39278 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725907AbgCYJRg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 05:17:36 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5850580C;
        Wed, 25 Mar 2020 10:17:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1585127854;
        bh=zJ1tfhxZz87cR+FKTONmRrvNpjrGYCaW6xjQqMeNhSM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wIbEl1bjGqDSuFk0VAGr68mylTnhepItoghl1Qm8LgTKpK8hofhZUocHYGaRmNUx2
         eoYI66VwHQlaEINZ6n0Z4Yj/3GzXBoDu/71fvGPuz2ozp/D7zpvnJLlOzeWKBTQl9W
         zRtWZQ6D4XNwrQt34lwi3lSfqY0c3hNdOQPpilrM=
Date:   Wed, 25 Mar 2020 11:17:32 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: Re: [PATCH 13/14] media: imx: imx7-mipi-csis: Don't use
 imx-media-utils helpers
Message-ID: <20200325091732.GC4760@pendragon.ideasonboard.com>
References: <20200312234722.23483-1-laurent.pinchart@ideasonboard.com>
 <20200312234722.23483-14-laurent.pinchart@ideasonboard.com>
 <8b877c3f-e6ff-86ce-34d8-17cf4ed0395d@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8b877c3f-e6ff-86ce-34d8-17cf4ed0395d@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Wed, Mar 25, 2020 at 10:13:05AM +0100, Hans Verkuil wrote:
> On 3/13/20 12:47 AM, Laurent Pinchart wrote:
> > The imx7-mipi-csis only uses the imx_media_init_mbus_fmt() function from
> > the imx-media-utils helpers. The helpers don't support all the media bus
> > formats used by this driver, and are thus a bad fit. As the MIPI CSIS is
> > a standalone IP core that could be integrated in other SoCs, let's not
> > use the helper.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/staging/media/imx/imx7-mipi-csis.c | 20 ++++++++++++--------
> >  1 file changed, 12 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
> > index 0829980d7af5..66ff73919371 100644
> > --- a/drivers/staging/media/imx/imx7-mipi-csis.c
> > +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
> > @@ -28,8 +28,6 @@
> >  #include <media/v4l2-fwnode.h>
> >  #include <media/v4l2-subdev.h>
> >  
> > -#include "imx-media.h"
> > -
> >  #define CSIS_DRIVER_NAME			"imx7-mipi-csis"
> >  #define CSIS_SUBDEV_NAME			CSIS_DRIVER_NAME
> >  
> > @@ -709,15 +707,21 @@ static int mipi_csis_init_cfg(struct v4l2_subdev *mipi_sd,
> >  	struct v4l2_mbus_framefmt *fmt_sink;
> >  	struct v4l2_mbus_framefmt *fmt_source;
> >  	enum v4l2_subdev_format_whence which;
> > -	int ret;
> >  
> >  	which = cfg ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
> >  	fmt_sink = mipi_csis_get_format(state, cfg, which, CSIS_PAD_SINK);
> > -	ret = imx_media_init_mbus_fmt(fmt_sink, MIPI_CSIS_DEF_PIX_WIDTH,
> > -				      MIPI_CSIS_DEF_PIX_HEIGHT, 0,
> > -				      V4L2_FIELD_NONE, NULL);
> > -	if (ret < 0)
> > -		return ret;
> > +
> > +	fmt_sink->code = MEDIA_BUS_FMT_UYVY8_2X8;
> > +	fmt_sink->width = MIPI_CSIS_DEF_PIX_WIDTH;
> > +	fmt_sink->height = MIPI_CSIS_DEF_PIX_HEIGHT;
> > +	fmt_sink->field = V4L2_FIELD_NONE;
> > +
> > +	fmt_sink->colorspace = V4L2_COLORSPACE_SMPTE170M;
> 
> Why V4L2_COLORSPACE_SMPTE170M?
> 
> After grepping a bit more in the imx code I see that the colorspace
> handling is wrong in any case, so I will just accept this patch, but
> this really should be fixed driver-wide.

That's exactly why V4L2_COLORSPACE_SMPTE170M :-) It's what the driver
uses today, I didn't want to change it in this patch. I agree it should
be fixed on top.

> It looks like the driver makes the typical mistake of thinking that
> YUV formats use SMPTE170M colorspace and RGB formats use SRGB, but that's
> not true. For drivers like this that typically are used with sensors
> initializing the colorspace to SRGB is a good default. But the actual
> colorspace comes from the sensor or the video receiver, the imx driver can't
> know. And YUV vs RGB memory formats is just a different pixel encoding and
> is unrelated to the colorspace.
> 
> > +	fmt_sink->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(fmt_sink->colorspace);
> > +	fmt_sink->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(fmt_sink->colorspace);
> > +	fmt_sink->quantization =
> > +		V4L2_MAP_QUANTIZATION_DEFAULT(false, fmt_sink->colorspace,
> > +					      fmt_sink->ycbcr_enc);
> >  
> >  	/*
> >  	 * When called from mipi_csis_subdev_init() to initialize the active

-- 
Regards,

Laurent Pinchart
