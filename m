Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 967DE20F24E
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2020 12:10:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732229AbgF3KKS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jun 2020 06:10:18 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:44825 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732189AbgF3KKS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jun 2020 06:10:18 -0400
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id D1D2F100002;
        Tue, 30 Jun 2020 10:10:09 +0000 (UTC)
Date:   Tue, 30 Jun 2020 12:13:38 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dave.stevenson@raspberrypi.org,
        naush@raspberrypi.com, andrew_gabbasov@mentor.com,
        mrodin@de.adit-jv.com, mripard@kernel.org,
        libcamera-devel@lists.libcamera.org, sudipi@jp.adit-jv.com,
        hugues.fruchet@st.com, erosca@de.adit-jv.com, aford173@gmail.com,
        linux-media@vger.kernel.org
Subject: Re: [libcamera-devel] [PATCH 19/25] media: ov5647: Implement set_fmt
 pad operation
Message-ID: <20200630101338.dz7toga2mhah7rsq@uno.localdomain>
References: <20200623100815.10674-1-jacopo@jmondi.org>
 <20200623164911.45147-4-jacopo@jmondi.org>
 <8f9e76ed-8c78-f6ae-c0c9-fc6d0927325b@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8f9e76ed-8c78-f6ae-c0c9-fc6d0927325b@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On Mon, Jun 29, 2020 at 06:54:43PM +0200, Dafna Hirschfeld wrote:
>
>
> On 23.06.20 18:49, Jacopo Mondi wrote:
> > Now that the driver supports more than a single mode, implement the
> > .set_fmt pad operation and adjust the existing .get_fmt one to report
> > the currently applied format.
> >
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >   drivers/media/i2c/ov5647.c | 67 +++++++++++++++++++++++++++++++++++---
> >   1 file changed, 62 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> > index af9e6d43967d8..39e320f321bd8 100644
> > --- a/drivers/media/i2c/ov5647.c
> > +++ b/drivers/media/i2c/ov5647.c
> > @@ -1016,15 +1016,72 @@ static int ov5647_enum_frame_size(struct v4l2_subdev *sd,
> >   	return 0;
> >   }
> > -static int ov5647_set_get_fmt(struct v4l2_subdev *sd,
> > +static int ov5647_get_pad_fmt(struct v4l2_subdev *sd,
> >   			      struct v4l2_subdev_pad_config *cfg,
> >   			      struct v4l2_subdev_format *format)
> >   {
> >   	struct v4l2_mbus_framefmt *fmt = &format->format;
> > +	struct v4l2_mbus_framefmt *sensor_format;
> > +	struct ov5647 *sensor = to_sensor(sd);
> > -	/* Only one format is supported, so return that. */
> > +	mutex_lock(&sensor->lock);
> >   	memset(fmt, 0, sizeof(*fmt));
> > -	*fmt = OV5647_DEFAULT_FORMAT;
> > +
> > +	switch (format->which) {
> > +	case V4L2_SUBDEV_FORMAT_TRY:
> > +		sensor_format = v4l2_subdev_get_try_format(sd, cfg, format->pad);
> > +		break;
> > +	default:
> > +		sensor_format = &sensor->mode->format;
> > +		break;
> > +	}
> > +
> > +	*fmt = *sensor_format;
> > +	mutex_unlock(&sensor->lock);
> > +
> > +	return 0;
> > +}
> > +
> > +static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
> > +			      struct v4l2_subdev_pad_config *cfg,
> > +			      struct v4l2_subdev_format *format)
> > +{
> > +	struct v4l2_mbus_framefmt *fmt = &format->format;
> > +	struct ov5647 *sensor = to_sensor(sd);
> > +	struct ov5647_mode *ov5647_mode_list;
> > +	struct ov5647_mode *mode;
> > +	unsigned int num_modes;
> > +
> > +	/*
> > +	 * Default mbus code MEDIA_BUS_FMT_SBGGR10_1X10 if the requested one
> > +	 * is not supported.
>
> In previous patch you added macros OV5647_DEFAULT_MODE, OV5647_DEFAULT_FORMAT
> which comes from first format in the array 'ov5647_formats' which is MEDIA_BUS_FMT_SBGGR8_1X8.

Oh well, that's just an arbitrary selection of the format the sensor
is initialized with.

> But here you set the default format to MEDIA_BUS_FMT_SBGGR10_1X10
>

I chose the _1x10 version as it supports more resolution than the _1X8
one. The v4l2-spec says if the requested format is not supported the
closed possible match should be reported. It is easy to identify what
a closes possible match is when considering the image size, but for image
formats the "closes possible match" might be tricky to define.

I can change the sensor initial default state if you think that's the
case, but I don't think the initial configuration and the adjusted format
returned from s_stream() should be considered related. Do you agree or
is there any part of the specs I'm overlooking ?

Thanks
  j


> > +	 */
> > +	if (fmt->code == MEDIA_BUS_FMT_SBGGR8_1X8) {
> > +		ov5647_mode_list = ov5647_sbggr8_modes;
> > +		num_modes = ARRAY_SIZE(ov5647_sbggr8_modes);
> > +	} else {
> > +		ov5647_mode_list = ov5647_sbggr10_modes;
> > +		num_modes = ARRAY_SIZE(ov5647_sbggr10_modes);
> > +	}
> > +
> > +	mode = v4l2_find_nearest_size(ov5647_mode_list, num_modes,
> > +				      format.width, format.height,
> > +				      fmt->width, fmt->height);
> > +
> > +	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
> > +		mutex_lock(&sensor->lock);
> > +		*v4l2_subdev_get_try_format(sd, cfg, format->pad) = mode->format;
> > +		*fmt = mode->format;
> > +		mutex_unlock(&sensor->lock);
> > +
> > +		return 0;
> > +	}
> > +
> > +	/* Update the sensor mode and apply at it at streamon time. */
> > +	mutex_lock(&sensor->lock);
> > +	sensor->mode = mode;
> > +	*fmt = mode->format;
> > +	mutex_unlock(&sensor->lock);
> >   	return 0;
> >   }
> > @@ -1068,8 +1125,8 @@ static int ov5647_get_selection(struct v4l2_subdev *sd,
> >   static const struct v4l2_subdev_pad_ops ov5647_subdev_pad_ops = {
> >   	.enum_mbus_code		= ov5647_enum_mbus_code,
> >   	.enum_frame_size	= ov5647_enum_frame_size,
> > -	.set_fmt		= ov5647_set_get_fmt,
> > -	.get_fmt		= ov5647_set_get_fmt,
> > +	.set_fmt		= ov5647_set_pad_fmt,
> > +	.get_fmt		= ov5647_get_pad_fmt,
> >   	.get_selection		= ov5647_get_selection,
> >   };
> >
