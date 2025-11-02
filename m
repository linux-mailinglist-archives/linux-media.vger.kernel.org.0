Return-Path: <linux-media+bounces-46145-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 402BCC28E1E
	for <lists+linux-media@lfdr.de>; Sun, 02 Nov 2025 12:29:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EB6374E4DA7
	for <lists+linux-media@lfdr.de>; Sun,  2 Nov 2025 11:29:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A058D2C324D;
	Sun,  2 Nov 2025 11:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JE3MVc4L"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BD22C2356;
	Sun,  2 Nov 2025 11:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762082953; cv=none; b=HG5Ws7e5ym13e6wXs4d9Xp6UDAjIk63oFspfUFfjPhks50ckm72xH+pMNSLCR2g1uxEHFmWwij5LDvgg7TcT2hh0rYMogTUMbE4ieaDSTyz501w6rc4Hn/m0FeGv4L+E2KFV9CDw6oC919R5U0P7vSRAO28zazJQoQhgesL29ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762082953; c=relaxed/simple;
	bh=6XTc0JwjAybxLT51/rRkbbyFARfQVGM8s6Y6tCnkQrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GR+F8lxs1tTT+Wz2mexktC6+yviHuxK+EbLacAl05U4d2qFzIrGsOky7IdqRJGyBFghtpnskpwYViublsLJe+Byh83zo/FNEd/6OMuzC1SdRwfyIPl+kC0cud/bnDln0A5tsVv09cX4u/MG3gX+LO2vUo1gYzAJEsN17U6kcXek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JE3MVc4L; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-50-232.net.vodafone.it [5.90.50.232])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 82766A98;
	Sun,  2 Nov 2025 12:27:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1762082834;
	bh=6XTc0JwjAybxLT51/rRkbbyFARfQVGM8s6Y6tCnkQrg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JE3MVc4Lu40x8F4xfd1ysGgRmsNbcFN0zT6vheCMuq9O7kV+qfaC0yXQQtslZq9xh
	 KzPCfX2vIg4FibTJxJ1OccLEbUoUehtLSXvE4ICy6JbmWEgX3t4A5fEFKrqZsdAZ+/
	 U7gA6vw13L8y7f8HX+9iQCa0M+e2VN87cp0cWZ8Q=
Date: Sun, 2 Nov 2025 12:29:02 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Jacopo Mondi <jacopo@jmondi.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	David Plowman <david.plowman@raspberrypi.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Peter Robinson <pbrobinson@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, 
	"Ivan T. Ivanov" <iivanov@suse.de>
Subject: Re: [PATCH 13/13] media: i2c: ov5647: Add V4L2_CID_LINK_FREQUENCY
 control
Message-ID: <tca3pwpzwqokxpjlv5mjsf3mai6ojlwypve6np53vur4cojd3t@viistqpnzv25>
References: <20251028-b4-rpi-ov5647-v1-0-098413454f5e@ideasonboard.com>
 <20251028-b4-rpi-ov5647-v1-13-098413454f5e@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251028-b4-rpi-ov5647-v1-13-098413454f5e@ideasonboard.com>

Hi Jai

On Tue, Oct 28, 2025 at 12:57:24PM +0530, Jai Luthra wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
>
> The link frequency can vary between modes, so add it as a
> control.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
>  drivers/media/i2c/ov5647.c | 25 ++++++++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index be0b96c4372ae0c6d8fc57280b195d6069dd7019..dea978305c3c868819780f7f631b225f4c1e7756 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -97,6 +97,13 @@ static const char * const ov5647_supply_names[] = {
>
>  #define OV5647_NUM_SUPPLIES ARRAY_SIZE(ov5647_supply_names)
>
> +#define FREQ_INDEX_FULL		0
> +#define FREQ_INDEX_VGA		1
> +static const s64 ov5647_link_freqs[] = {
> +	[FREQ_INDEX_FULL]	= 218500000,

The full mode pixel rate is set to 87500000, which considering CSI-2
DDR mode and the 2 lanes in use give me a link freq of 21875000.

Do you know where 218500000 comes from ? (it might be perfectly legit,
I'm not questioning that).

> +	[FREQ_INDEX_VGA]	= 208333000,
> +};
> +
>  struct regval_list {
>  	u16 addr;
>  	u8 data;
> @@ -106,6 +113,7 @@ struct ov5647_mode {
>  	struct v4l2_mbus_framefmt	format;
>  	struct v4l2_rect		crop;
>  	u64				pixel_rate;
> +	unsigned int			link_freq_index;
>  	int				hts;
>  	int				vts;
>  	const struct regval_list	*reg_list;
> @@ -128,6 +136,7 @@ struct ov5647 {
>  	struct v4l2_ctrl		*exposure;
>  	struct v4l2_ctrl		*hflip;
>  	struct v4l2_ctrl		*vflip;
> +	struct v4l2_ctrl		*link_freq;
>  };
>
>  static inline struct ov5647 *to_sensor(struct v4l2_subdev *sd)
> @@ -376,6 +385,7 @@ static const struct ov5647_mode ov5647_modes[] = {
>  			.height		= 1944
>  		},
>  		.pixel_rate	= 87500000,
> +		.link_freq_index = FREQ_INDEX_FULL,
>  		.hts		= 2844,
>  		.vts		= 0x7b0,
>  		.reg_list	= ov5647_2592x1944_10bpp,
> @@ -397,6 +407,7 @@ static const struct ov5647_mode ov5647_modes[] = {
>  			.height		= 1080,
>  		},
>  		.pixel_rate	= 87500000,
> +		.link_freq_index = FREQ_INDEX_FULL,
>  		.hts		= 2416,
>  		.vts		= 0x450,
>  		.reg_list	= ov5647_1080p30_10bpp,
> @@ -418,6 +429,7 @@ static const struct ov5647_mode ov5647_modes[] = {
>  			.height		= 1944,
>  		},
>  		.pixel_rate	= 87500000,
> +		.link_freq_index = FREQ_INDEX_FULL,
>  		.hts		= 1896,
>  		.vts		= 0x59b,
>  		.reg_list	= ov5647_2x2binned_10bpp,
> @@ -439,6 +451,7 @@ static const struct ov5647_mode ov5647_modes[] = {
>  			.height		= 1920,
>  		},
>  		.pixel_rate	= 55000000,
> +		.link_freq_index = FREQ_INDEX_VGA,
>  		.hts		= 1852,
>  		.vts		= 0x1f8,
>  		.reg_list	= ov5647_640x480_10bpp,
> @@ -925,6 +938,8 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
>  					 sensor->exposure->minimum,
>  					 exposure_max, sensor->exposure->step,
>  					 exposure_def);
> +
> +		__v4l2_ctrl_s_ctrl(sensor->link_freq, mode->link_freq_index);

Doesn't this cause an error in s_ctrl where the control is not handled
?

>  	}
>  	*fmt = mode->format;
>  	/* The code we pass back must reflect the current h/vflips. */
> @@ -1230,7 +1245,7 @@ static int ov5647_init_controls(struct ov5647 *sensor, struct device *dev)
>  	int hblank, exposure_max, exposure_def;
>  	struct v4l2_fwnode_device_properties props;
>
> -	v4l2_ctrl_handler_init(&sensor->ctrls, 9);
> +	v4l2_ctrl_handler_init(&sensor->ctrls, 10);
>
>  	v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
>  			  V4L2_CID_AUTOGAIN, 0, 1, 1, 0);
> @@ -1290,6 +1305,14 @@ static int ov5647_init_controls(struct ov5647 *sensor, struct device *dev)
>  	if (sensor->vflip)
>  		sensor->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
>
> +	sensor->link_freq =
> +		v4l2_ctrl_new_int_menu(&sensor->ctrls, &ov5647_ctrl_ops,

As suggested for PIXEL_RATE, if you make the control read-only you
should set the control ops to NULL.
> +				       V4L2_CID_LINK_FREQ,
> +				       ARRAY_SIZE(ov5647_link_freqs) - 1, 0,
> +				       ov5647_link_freqs);
> +	if (sensor->link_freq)
> +		sensor->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;

You know, I thought link_freq was set as READ_ONLY by the framework,
but it's actuallt PIXEL_RATE (you can remove setting the flags
in the driver if you send a patch to remove the control ops when
registering PIXEL_RATE).

Thanks
  j

> +
>  	v4l2_fwnode_device_parse(dev, &props);
>
>  	v4l2_ctrl_new_fwnode_properties(&sensor->ctrls, &ov5647_ctrl_ops,
>
> --
> 2.51.0
>

