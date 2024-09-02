Return-Path: <linux-media+bounces-17392-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C393A968E94
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 21:59:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C3C9283758
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 19:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C44F1C62CE;
	Mon,  2 Sep 2024 19:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BbEfPd7d"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283F213CFB7;
	Mon,  2 Sep 2024 19:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725307138; cv=none; b=IN/XebxhRmCsbXo7daeayOtWSkG/gMbda47TppB3Sh3Y67xCQXq3lE7U1Gfq2YRoBT7wwzUDmHvu8JiOtMAj6n35mBzyeWqloKr2KH6BuXMXD0MeGuY3UldJJc307xCEmFGu0JakAdnsFCUdOK6oWFeK0PURt2qdyzzv6ch37tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725307138; c=relaxed/simple;
	bh=7KdAx9F1TvPAO0yOhQpFqsCBMcQMUsxQGnEv3VgvWMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VQOv8UbW7riEzkqOYjUVdMk16P08IKEluaIbNfQhDdY3yDd6qy+vZWWS1ltQQV+hbyd9wciYyOXTyljv93xhOA7jxfQctyx+b7SOn7x7HumcFxocEy8BpaKyGDT6yyA3PwE60YFuZ315mDzZlgwjoMcLmM6OwsPXi5mOCSPGp/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BbEfPd7d; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9E2294CE;
	Mon,  2 Sep 2024 21:57:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725307063;
	bh=7KdAx9F1TvPAO0yOhQpFqsCBMcQMUsxQGnEv3VgvWMQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BbEfPd7dmm1ng/jUSyW7GsQ1NgPdeb+42UYMcpvNSIlMWUOYMPA6WnLTpNBMsAVl3
	 rt4Vk03QtOYI2Z6w141RENMrK5UEatt5/ZTPqbLLKkvbsvttSQ8H98GS6Q3SaqTAeE
	 FoqTzonQsfKrtiprzrwad4kVp+vkKFWDYSG81KH0=
Date: Mon, 2 Sep 2024 22:58:21 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: bbara93@gmail.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Benjamin Bara <benjamin.bara@skidata.com>
Subject: Re: [PATCH v3 4/7] media: i2c: imx290: Introduce initial "off" mode
 & link freq
Message-ID: <20240902195821.GQ1995@pendragon.ideasonboard.com>
References: <20240902-imx290-avail-v3-0-b32a12799fed@skidata.com>
 <20240902-imx290-avail-v3-4-b32a12799fed@skidata.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240902-imx290-avail-v3-4-b32a12799fed@skidata.com>

Hi Benjamin,

Thank you for the patch.

On Mon, Sep 02, 2024 at 05:57:29PM +0200, bbara93@gmail.com wrote:
> From: Benjamin Bara <benjamin.bara@skidata.com>
> 
> To be compliant to the V4L2 API, the driver currently "randomly" decides
> on one of the two supported modes which also implies a link frequency.
> 
> Add a new mode and frequency which symbolize that the sensor is not in
> use. This can be used as a default value during probe() and enables us
> to avoid communication with the sensor.

I really doin't like this change. I would like to instead move away from
modes and make the driver freely configurable. Furthermore, the concept
of an initial unconfigured state isn't valid in V4L2. The driver must
fully initialize the whole device state at probe time.

> Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
> ---
> Changes since v2:
> - new
> ---
>  drivers/media/i2c/imx290.c | 29 +++++++++++++++++++++++------
>  1 file changed, 23 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 6812e7cb9e23..ece4d66001f5 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -425,14 +425,17 @@ static const struct imx290_csi_cfg imx290_csi_297mhz = {
>  /* supported link frequencies */
>  #define FREQ_INDEX_1080P	0
>  #define FREQ_INDEX_720P		1
> +#define FREQ_INDEX_OFF		2
>  static const s64 imx290_link_freq_2lanes[] = {
>  	[FREQ_INDEX_1080P] = 445500000,
>  	[FREQ_INDEX_720P] = 297000000,
> +	[FREQ_INDEX_OFF] = 0,
>  };
>  
>  static const s64 imx290_link_freq_4lanes[] = {
>  	[FREQ_INDEX_1080P] = 222750000,
>  	[FREQ_INDEX_720P] = 148500000,
> +	[FREQ_INDEX_OFF] = 0,
>  };
>  
>  /*
> @@ -552,6 +555,10 @@ static const struct imx290_mode imx290_modes_4lanes[] = {
>  	},
>  };
>  
> +static const struct imx290_mode imx290_mode_off = {
> +	.link_freq_index = FREQ_INDEX_OFF,
> +};
> +
>  static inline const struct imx290_mode *imx290_modes_ptr(const struct imx290 *imx290)
>  {
>  	if (imx290->nlanes == 2)
> @@ -876,10 +883,19 @@ static unsigned int imx290_get_blank_min(const struct imx290 *imx290, bool v)
>  static void imx290_ctrl_update(struct imx290 *imx290,
>  			       const struct imx290_mode *mode)
>  {
> -	unsigned int hblank_min = mode->hmax_min - mode->width;
> -	unsigned int hblank_max = IMX290_HMAX_MAX - mode->width;
> -	unsigned int vblank_min = mode->vmax_min - mode->height;
> -	unsigned int vblank_max = IMX290_VMAX_MAX - mode->height;
> +	unsigned int hblank_min, hblank_max, vblank_min, vblank_max;
> +
> +	if (mode == &imx290_mode_off) {
> +		hblank_min = imx290_get_blank_min(imx290, false);
> +		hblank_max = HBLANK_MAX;
> +		vblank_min = imx290_get_blank_min(imx290, true);
> +		vblank_max = VBLANK_MAX;
> +	} else {
> +		hblank_min = mode->hmax_min - mode->width;
> +		hblank_max = IMX290_HMAX_MAX - mode->width;
> +		vblank_min = mode->vmax_min - mode->height;
> +		vblank_max = IMX290_VMAX_MAX - mode->height;
> +	}
>  
>  	__v4l2_ctrl_s_ctrl(imx290->link_freq, mode->link_freq_index);
>  
> @@ -932,7 +948,8 @@ static int imx290_ctrl_init(struct imx290 *imx290)
>  	imx290->link_freq =
>  		v4l2_ctrl_new_int_menu(&imx290->ctrls, &imx290_ctrl_ops,
>  				       V4L2_CID_LINK_FREQ,
> -				       imx290_link_freqs_num(imx290) - 1, 0,
> +				       imx290_link_freqs_num(imx290) - 1,
> +				       FREQ_INDEX_OFF,
>  				       imx290_link_freqs_ptr(imx290));
>  	if (imx290->link_freq)
>  		imx290->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> @@ -1278,7 +1295,7 @@ static int imx290_subdev_init(struct imx290 *imx290)
>  	struct v4l2_subdev_state *state;
>  	int ret;
>  
> -	imx290->current_mode = &imx290_modes_ptr(imx290)[0];
> +	imx290->current_mode = &imx290_mode_off;
>  
>  	v4l2_i2c_subdev_init(&imx290->sd, client, &imx290_subdev_ops);
>  	imx290->sd.internal_ops = &imx290_internal_ops;
> 

-- 
Regards,

Laurent Pinchart

