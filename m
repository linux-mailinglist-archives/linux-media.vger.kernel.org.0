Return-Path: <linux-media+bounces-8116-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B6454890700
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 18:17:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2380D1F28A5A
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 17:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8612062147;
	Thu, 28 Mar 2024 17:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="szG/LXjD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D527E2B9C6
	for <linux-media@vger.kernel.org>; Thu, 28 Mar 2024 17:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711646238; cv=none; b=Xp4Y5Fy7TH3I3tSDEIdSrFzveFR3TTl8/Izbvq5bctuTJ/gc63s+vnO1cQ9ubNuAyas6yNv/s5FRh4nh2ATOJOlWI512mnLzLRMLky9nXFUzbzyIx4QFGkEf3tClJLshQBYZP9THsNGaO17Nz4pGbquURQdb3NsyHXs/uGwQPsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711646238; c=relaxed/simple;
	bh=SWRKp5mbeTMuqRPaMs0cK1mnf+H6u98+6JdXCZZfiGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AoLaIaqSdg2sQqxDbqOYfNbVSHU1tqRDYQHCfWxLlMq9vijjrHXvn4InrX3bROAE2pgpe5oJI+UjrIT/BoaqpjMnKkg7fAkM2OyDPRim0agm329N8DaKIU5JOD+whFnugMPYI0U2iwkWUdb4yhzAehqWCmfm8TcblR+dRp+1rOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=szG/LXjD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 06F7CE0C;
	Thu, 28 Mar 2024 18:16:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711646201;
	bh=SWRKp5mbeTMuqRPaMs0cK1mnf+H6u98+6JdXCZZfiGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=szG/LXjDQSz7Ra//j/rBC3YvRZe9uZEWxdsBUqUSGufKiWP9lnp5nx3Ipv0Ndza3P
	 eifdBgH64y9PtAU5P8ulbkYQspSCCgRyxq20pODh6aKV7tYLbOl46SHjmOeXMSovNV
	 f7lBFmwgUiNfmVUDCJxnqTDnxPSgo24f5E15fmLY=
Date: Thu, 28 Mar 2024 19:17:01 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Naushir Patuck <naush@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	kernel-list@raspberrypi.com, linux-rpi-kernel@lists.infradead.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH v7 04/15] media: i2c: imx219: Report streams using frame
 descriptors
Message-ID: <20240328171659.GE11463@pendragon.ideasonboard.com>
References: <20240324220854.15010-1-laurent.pinchart@ideasonboard.com>
 <20240324220854.15010-5-laurent.pinchart@ideasonboard.com>
 <0f3d4f4a-bc0a-43ac-aa5c-8cc7a54417d9@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0f3d4f4a-bc0a-43ac-aa5c-8cc7a54417d9@ideasonboard.com>

Hi Tomi,

On Wed, Mar 27, 2024 at 12:08:22PM +0200, Tomi Valkeinen wrote:
> On 25/03/2024 00:08, Laurent Pinchart wrote:
> > Implement the .get_frame_desc() subdev operation to report information
> > about streams to the connected CSI-2 receiver. This is required to let
> > the CSI-2 receiver driver know about virtual channels and data types for
> > each stream.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> > Changes since v6:
> > 
> > - Replace v4l2_subdev_state_get_stream_format() with
> >    v4l2_subdev_state_get_format()
> > - Make imx219_format_bpp() return an unsigned int
> > ---
> >   drivers/media/i2c/imx219.c | 67 ++++++++++++++++++++++++++++----------
> >   1 file changed, 50 insertions(+), 17 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > index 6602250834be..fa64bc402c9a 100644
> > --- a/drivers/media/i2c/imx219.c
> > +++ b/drivers/media/i2c/imx219.c
> > @@ -23,6 +23,7 @@
> >   #include <linux/pm_runtime.h>
> >   #include <linux/regulator/consumer.h>
> >   
> > +#include <media/mipi-csi2.h>
> >   #include <media/v4l2-cci.h>
> >   #include <media/v4l2-ctrls.h>
> >   #include <media/v4l2-device.h>
> > @@ -591,6 +592,24 @@ static void imx219_free_controls(struct imx219 *imx219)
> >    * Subdev operations
> >    */
> >   
> > +static unsigned int imx219_format_bpp(u32 code)
> > +{
> > +	switch (code) {
> > +	case MEDIA_BUS_FMT_SRGGB8_1X8:
> > +	case MEDIA_BUS_FMT_SGRBG8_1X8:
> > +	case MEDIA_BUS_FMT_SGBRG8_1X8:
> > +	case MEDIA_BUS_FMT_SBGGR8_1X8:
> > +		return 8;
> > +
> > +	case MEDIA_BUS_FMT_SRGGB10_1X10:
> > +	case MEDIA_BUS_FMT_SGRBG10_1X10:
> > +	case MEDIA_BUS_FMT_SGBRG10_1X10:
> > +	case MEDIA_BUS_FMT_SBGGR10_1X10:
> > +	default:
> > +		return 10;
> > +	}
> > +}
> > +
> >   static int imx219_set_framefmt(struct imx219 *imx219,
> >   			       struct v4l2_subdev_state *state)
> >   {
> > @@ -602,23 +621,7 @@ static int imx219_set_framefmt(struct imx219 *imx219,
> >   
> >   	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE);
> >   	crop = v4l2_subdev_state_get_crop(state, IMX219_PAD_IMAGE);
> > -
> > -	switch (format->code) {
> > -	case MEDIA_BUS_FMT_SRGGB8_1X8:
> > -	case MEDIA_BUS_FMT_SGRBG8_1X8:
> > -	case MEDIA_BUS_FMT_SGBRG8_1X8:
> > -	case MEDIA_BUS_FMT_SBGGR8_1X8:
> > -		bpp = 8;
> > -		break;
> > -
> > -	case MEDIA_BUS_FMT_SRGGB10_1X10:
> > -	case MEDIA_BUS_FMT_SGRBG10_1X10:
> > -	case MEDIA_BUS_FMT_SGBRG10_1X10:
> > -	case MEDIA_BUS_FMT_SBGGR10_1X10:
> > -	default:
> > -		bpp = 10;
> > -		break;
> > -	}
> > +	bpp = imx219_format_bpp(format->code);
> >   
> >   	cci_write(imx219->regmap, IMX219_REG_X_ADD_STA_A,
> >   		  crop->left - IMX219_PIXEL_ARRAY_LEFT, &ret);
> > @@ -1029,6 +1032,35 @@ static int imx219_init_state(struct v4l2_subdev *sd,
> >   	return 0;
> >   }
> >   
> > +static int imx219_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> > +				 struct v4l2_mbus_frame_desc *fd)
> > +{
> > +	const struct v4l2_mbus_framefmt *fmt;
> > +	struct v4l2_subdev_state *state;
> > +	u32 code;
> > +
> > +	if (pad != IMX219_PAD_SOURCE)
> > +		return -EINVAL;
> > +
> > +	state = v4l2_subdev_lock_and_get_active_state(sd);
> > +	fmt = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE, 0);
> 
> I was going to say change 0 to IMX219_STREAM_IMAGE, but you only add it 
> in the next patch. Perhaps a pointless reshuffling, but you could 
> introduce IMX219_STREAM_IMAGE in patch 3, or maybe as a separate patch, 
> so that in patch 5 (embedded data) you don't need to convert the lines 
> related to the image stream.

I'll introduce IMX219_STREAM_IMAGE in a separate patch.

> > +	code = fmt->code;
> > +	v4l2_subdev_unlock_state(state);
> > +
> > +	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
> > +	fd->num_entries = 1;
> > +
> > +	memset(fd->entry, 0, sizeof(fd->entry));
> 
> The whole fd has been already cleared in call_get_frame_desc().

I'll drop the memset().

> > +
> > +	fd->entry[0].pixelcode = code;
> > +	fd->entry[0].stream = 0;
> > +	fd->entry[0].bus.csi2.vc = 0;
> > +	fd->entry[0].bus.csi2.dt = imx219_format_bpp(code) == 8
> > +				 ? MIPI_CSI2_DT_RAW8 : MIPI_CSI2_DT_RAW10;
> > +
> > +	return 0;
> > +}
> > +
> >   static const struct v4l2_subdev_core_ops imx219_core_ops = {
> >   	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
> >   	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
> > @@ -1044,6 +1076,7 @@ static const struct v4l2_subdev_pad_ops imx219_pad_ops = {
> >   	.set_fmt = imx219_set_pad_format,
> >   	.get_selection = imx219_get_selection,
> >   	.enum_frame_size = imx219_enum_frame_size,
> > +	.get_frame_desc = imx219_get_frame_desc,
> >   };
> >   
> >   static const struct v4l2_subdev_ops imx219_subdev_ops = {

-- 
Regards,

Laurent Pinchart

