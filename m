Return-Path: <linux-media+bounces-35476-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7CDAE178B
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 11:31:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A50C2167D91
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 09:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6564827CCF0;
	Fri, 20 Jun 2025 09:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Jofygd0N"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3A8218AAB
	for <linux-media@vger.kernel.org>; Fri, 20 Jun 2025 09:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750411891; cv=none; b=nYiUYmF+CADEgBZUptLLkoZ8jECdzA4NmdfwD0V5lNk567cy5iU5FXTrTONNC6oeo4cuVfav/x28IgQxlluVKd5g5SMTHVHP+fsXHVI0qIhW6MUzkV2R65FwBsQYQf5Pnp5ueib/N7iEd0haC5k0tZDf+v/Pzag0xDAgYJzuQlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750411891; c=relaxed/simple;
	bh=xZVOjK/IsKVVM6zt1/EXLTDfSFeO/YhDqIpW71mGIIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eusMcLF9o2dxt/a3s6vmXWUU3N9uWL2nO7D6uSTUKyBCJCx4gtTbTb++5LLd6emEtcG0z9MJlXLnNF5P005bCn8FY/4DlyVowzezJCo1OpI6hJQ1o425zeCuvuTKyG7oAMRqiWHRVxjAnObQOgsoTU5irMImY82ESbz+ZL6OGZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Jofygd0N; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B51F1C0B;
	Fri, 20 Jun 2025 11:31:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750411872;
	bh=xZVOjK/IsKVVM6zt1/EXLTDfSFeO/YhDqIpW71mGIIo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jofygd0NqHz5o5T4lNfrS+OSQnj49lbi3OBU+IOtS925qMWmY6fO4PJiHcLuiFj1B
	 nLq75UvTbX2Kbx9nvYyrZDG3iIS1TtTbSOw4VaW6uTVrivJaiL2/hYEDitJZeyh01D
	 6pRj+JpKM7RiUw8kIHu9i7uBe1pzCBvjp7IwcZrw=
Date: Fri, 20 Jun 2025 11:31:23 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl, 
	laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, 
	Kate Hsuan <hpa@redhat.com>, Alexander Shiyan <eagle.alexander923@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	Umang Jain <umang.jain@ideasonboard.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Julien Massot <julien.massot@collabora.com>, Naushir Patuck <naush@raspberrypi.com>, 
	"Yan, Dongcheng" <dongcheng.yan@intel.com>, "Cao, Bingbu" <bingbu.cao@intel.com>, 
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>, "Wang, Hongju" <hongju.wang@intel.com>, 
	Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, 
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Ricardo Ribalda Delgado <ribalda@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v10 01/64] media: ov2740: Remove shorthand variables
Message-ID: <uedfwf5nucpqkgdineevlrpnw4a4tejchetymw3al6pcwscurb@x47q3a2h77qp>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
 <20250619115836.1946016-2-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250619115836.1946016-2-sakari.ailus@linux.intel.com>

Hi Sakari

On Thu, Jun 19, 2025 at 02:57:33PM +0300, Sakari Ailus wrote:
> Remove two variables in ov2740_init_control() that are used as a shorthand
> for where the information is really located. Make the code more readable
> by removing them.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

> ---
>  drivers/media/i2c/ov2740.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
> index 6cf461e3373c..4e959534e6e7 100644
> --- a/drivers/media/i2c/ov2740.c
> +++ b/drivers/media/i2c/ov2740.c
> @@ -766,11 +766,9 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
>  {
>  	struct i2c_client *client = v4l2_get_subdevdata(&ov2740->sd);
>  	struct v4l2_ctrl_handler *ctrl_hdlr;
> -	const struct ov2740_mode *cur_mode;
>  	s64 exposure_max, h_blank, pixel_rate;
>  	u32 vblank_min, vblank_max, vblank_default;
>  	struct v4l2_fwnode_device_properties props;
> -	int size;
>  	int ret;
>
>  	ctrl_hdlr = &ov2740->ctrl_handler;
> @@ -778,12 +776,10 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
>  	if (ret)
>  		return ret;
>
> -	cur_mode = ov2740->cur_mode;
> -	size = ARRAY_SIZE(link_freq_menu_items);
> -
>  	ov2740->link_freq =
>  		v4l2_ctrl_new_int_menu(ctrl_hdlr, &ov2740_ctrl_ops,
> -				       V4L2_CID_LINK_FREQ, size - 1,
> +				       V4L2_CID_LINK_FREQ,
> +				       ARRAY_SIZE(link_freq_menu_items) - 1,
>  				       ov2740->supported_modes->link_freq_index,
>  				       link_freq_menu_items);
>  	if (ov2740->link_freq)
> @@ -794,14 +790,14 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
>  					       V4L2_CID_PIXEL_RATE, 0,
>  					       pixel_rate, 1, pixel_rate);
>
> -	vblank_min = cur_mode->vts_min - cur_mode->height;
> -	vblank_max = cur_mode->vts_max - cur_mode->height;
> -	vblank_default = cur_mode->vts_def - cur_mode->height;
> +	vblank_min = ov2740->cur_mode->vts_min - ov2740->cur_mode->height;
> +	vblank_max = ov2740->cur_mode->vts_max - ov2740->cur_mode->height;
> +	vblank_default = ov2740->cur_mode->vts_def - ov2740->cur_mode->height;
>  	ov2740->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops,
>  					   V4L2_CID_VBLANK, vblank_min,
>  					   vblank_max, 1, vblank_default);
>
> -	h_blank = cur_mode->hts - cur_mode->width;
> +	h_blank = ov2740->cur_mode->hts - ov2740->cur_mode->width;
>  	ov2740->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops,
>  					   V4L2_CID_HBLANK, h_blank, h_blank, 1,
>  					   h_blank);
> @@ -814,7 +810,7 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
>  	v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
>  			  OV2740_DGTL_GAIN_MIN, OV2740_DGTL_GAIN_MAX,
>  			  OV2740_DGTL_GAIN_STEP, OV2740_DGTL_GAIN_DEFAULT);
> -	exposure_max = cur_mode->vts_def - OV2740_EXPOSURE_MAX_MARGIN;
> +	exposure_max = ov2740->cur_mode->vts_def - OV2740_EXPOSURE_MAX_MARGIN;
>  	ov2740->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops,
>  					     V4L2_CID_EXPOSURE,
>  					     OV2740_EXPOSURE_MIN, exposure_max,
> --
> 2.39.5
>
>

