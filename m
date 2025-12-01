Return-Path: <linux-media+bounces-47983-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF16C981C4
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 16:51:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26B883A45F5
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 15:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53D2F33342A;
	Mon,  1 Dec 2025 15:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="itQUXyVO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F9E332EBD;
	Mon,  1 Dec 2025 15:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764604246; cv=none; b=gOYyyEkTQoJc6S/VKl38FmlII9RZL9UEmsJJMLAvy9bM1thqp3xFPuWO8pv0iyhywmZkgdfqpJ/hKGEy5Xzz5nZnicFsgGJD8JDmeoXbSfhYV6ZSUc41x2AsFZpz1n9TPeUvteShc92apXMq0B/8KL6+YSR1XiuilMMwh6tFAYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764604246; c=relaxed/simple;
	bh=RPOV0/K3agKHfWiaDX9fzUjkflEVPIyTOubNJMJlfMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eYb/RBBLmWNjfD0FOgJ99D20UGzPH29Ny27WNU8OPGJA/4tQRh0KDJyeKVf4aBSX43XRqX8bHT0d2G+45M0WnidsFPgg7YmPmpSYIdth78HQmszI2LT8ewiRtx9Pn1SPNDMQ7HwWbni5++fbwYABTv/An3Mm7CXptdk9xCpoU0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=itQUXyVO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A660B6DF;
	Mon,  1 Dec 2025 16:48:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1764604108;
	bh=RPOV0/K3agKHfWiaDX9fzUjkflEVPIyTOubNJMJlfMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=itQUXyVOMu7lWo3z+QPxRwuim1ehUvcepthaRD6JVTt+9/ZyKm1ZFAeJkCtZ0zx5k
	 ER18R8anxc0qjLjYKAxiUEXHG9oasaadYJmiprWW/Ts64ah2WMPe+Lqzg+TlNYS1dp
	 XBz2gVqI9bHDSkD2z11UIE5L9k+0j7MlQw8NTsEY=
Date: Mon, 1 Dec 2025 16:50:39 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Jacopo Mondi <jacopo@jmondi.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Naushir Patuck <naush@raspberrypi.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, David Plowman <david.plowman@raspberrypi.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Peter Robinson <pbrobinson@gmail.com>, 
	Stefan Wahren <wahrenst@gmx.net>, "Ivan T. Ivanov" <iivanov@suse.de>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v2 16/16] media: i2c: ov5647: Add V4L2_CID_LINK_FREQUENCY
 control
Message-ID: <5e2lwyzel45ejbb4mch2johetncaj7arpidjst2tjpatseklvn@vlv6hnwzfmwj>
References: <20251118-b4-rpi-ov5647-v2-0-5e78e7cb7f9b@ideasonboard.com>
 <20251118-b4-rpi-ov5647-v2-16-5e78e7cb7f9b@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251118-b4-rpi-ov5647-v2-16-5e78e7cb7f9b@ideasonboard.com>

Hi Jai

On Tue, Nov 18, 2025 at 05:33:09PM +0530, Jai Luthra wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
>
> The link frequency can vary between modes, so add it as a
> control.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
>  drivers/media/i2c/ov5647.c | 24 +++++++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index 71107d74f2900b39233a52b29a229282bd087963..de27e76b487957bfa0a072359f28194425950eaf 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -97,6 +97,13 @@ static const char * const ov5647_supply_names[] = {
>
>  #define OV5647_NUM_SUPPLIES ARRAY_SIZE(ov5647_supply_names)
>
> +#define FREQ_INDEX_FULL		0
> +#define FREQ_INDEX_VGA		1
> +static const s64 ov5647_link_freqs[] = {
> +	[FREQ_INDEX_FULL]	= 218750000,
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

I now read again v1 13/13 and this mode seems to have a different pixel
rate and a lower link freq ?

> +		.link_freq_index = FREQ_INDEX_VGA,
>  		.hts		= 1852,
>  		.vts		= 0x1f8,
>  		.reg_list	= ov5647_640x480_10bpp,
> @@ -927,6 +940,8 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
>  					 sensor->exposure->minimum,
>  					 exposure_max, sensor->exposure->step,
>  					 exposure_def);
> +
> +		__v4l2_ctrl_s_ctrl(sensor->link_freq, mode->link_freq_index);
>  	}
>  	*fmt = mode->format;
>  	/* The code we pass back must reflect the current h/vflips. */
> @@ -1236,7 +1251,7 @@ static int ov5647_init_controls(struct ov5647 *sensor)
>  	int hblank, exposure_max, exposure_def;
>  	struct device *dev = &client->dev;
>
> -	v4l2_ctrl_handler_init(&sensor->ctrls, 13);
> +	v4l2_ctrl_handler_init(&sensor->ctrls, 14);
>
>  	v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
>  			  V4L2_CID_AUTOGAIN, 0, 1, 1, 0);
> @@ -1292,6 +1307,13 @@ static int ov5647_init_controls(struct ov5647 *sensor)
>  	sensor->vflip = v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
>  					  V4L2_CID_VFLIP, 0, 1, 1, 0);
>
> +	sensor->link_freq =
> +		v4l2_ctrl_new_int_menu(&sensor->ctrls, NULL, V4L2_CID_LINK_FREQ,
> +				       ARRAY_SIZE(ov5647_link_freqs) - 1, 0,

The default control value should follow the default mode.
You can use mode->link_req_index to retrieve it

> +				       ov5647_link_freqs);
> +	if (sensor->link_freq)
> +		sensor->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
>  	v4l2_fwnode_device_parse(dev, &props);
>
>  	v4l2_ctrl_new_fwnode_properties(&sensor->ctrls, &ov5647_ctrl_ops,
>
> --
> 2.51.1
>

