Return-Path: <linux-media+bounces-9806-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5951D8ABAC9
	for <lists+linux-media@lfdr.de>; Sat, 20 Apr 2024 11:31:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EE9A1F21DED
	for <lists+linux-media@lfdr.de>; Sat, 20 Apr 2024 09:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B92F1758E;
	Sat, 20 Apr 2024 09:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dulWp0DW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0CD114AB4
	for <linux-media@vger.kernel.org>; Sat, 20 Apr 2024 09:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713605470; cv=none; b=URtdqebL9R1smqe2PAJpZIE95YhHoSG8CDOFlig2zj+Gdusw+/+ZgkFJWHy8Q9c9rrhUKbuOf8Aj+ivsUq1RZIxbRdk67eEkMcB7eKBqXqqmQZunGBPpGEzB02YCH7OUB8kWCW/hSILj+nUsMn9fZOwGasJWQ7Ged4ZmrdtJNUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713605470; c=relaxed/simple;
	bh=EF8IHXrOHKDIpGof7tjT4z5bHEznwYb//S2wnb3eO2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZMNdewe/XY/XysYM5NoXj8mT/UbwHfzfZtzGzn/4i90xm483h7rOJqSPb6DnodBMwuqviNc1pASstrmPbH7oZ3t96P7yFT4mfIEIYqiRppqOPJwxdzmCHFT9pyFCITEQ7M6ihx+Klnl5J1TVmJ5B7de2iyB+nDFrYrjg0980MwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dulWp0DW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 736E955;
	Sat, 20 Apr 2024 11:30:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713605418;
	bh=EF8IHXrOHKDIpGof7tjT4z5bHEznwYb//S2wnb3eO2M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dulWp0DWAsiJj3UR8PktuU8BGcyJF2/7o9jp7Zdodc0I3DGfe0RkF6CByune9FW6z
	 ed2x9jSlPhP7OlgQB4WktZK6s5+VA/sZVvSBq+vCfB/ZkQbdDpbx8eq6sxJvixEwQt
	 EmcY3zRnnLYOcEU3KCC8z+e0MX9FO3grLMWlP+1g=
Date: Sat, 20 Apr 2024 12:30:58 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v9 38/46] media: ov2740: Remove shorthand variables
Message-ID: <20240420093058.GX6414@pendragon.ideasonboard.com>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
 <20240416193319.778192-39-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240416193319.778192-39-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Tue, Apr 16, 2024 at 10:33:11PM +0300, Sakari Ailus wrote:
> Remove two variables in ov2740_init_control() that are used as a shorthand
> for where the information is really located. Make the code more readable
> by removing them.

Dropping size is nice. I don't know if removing cur_mode makes the code
more readable, but if it does for you,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/ov2740.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
> index 57906df7be4e..196a111516b0 100644
> --- a/drivers/media/i2c/ov2740.c
> +++ b/drivers/media/i2c/ov2740.c
> @@ -754,10 +754,8 @@ static const struct v4l2_ctrl_ops ov2740_ctrl_ops = {
>  static int ov2740_init_controls(struct ov2740 *ov2740)
>  {
>  	struct v4l2_ctrl_handler *ctrl_hdlr;
> -	const struct ov2740_mode *cur_mode;
>  	s64 exposure_max, h_blank, pixel_rate;
>  	u32 vblank_min, vblank_max, vblank_default;
> -	int size;
>  	int ret;
>  
>  	ctrl_hdlr = &ov2740->ctrl_handler;
> @@ -765,12 +763,10 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
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
> @@ -781,14 +777,14 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
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
> @@ -801,7 +797,7 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
>  	v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
>  			  OV2740_DGTL_GAIN_MIN, OV2740_DGTL_GAIN_MAX,
>  			  OV2740_DGTL_GAIN_STEP, OV2740_DGTL_GAIN_DEFAULT);
> -	exposure_max = cur_mode->vts_def - OV2740_EXPOSURE_MAX_MARGIN;
> +	exposure_max = ov2740->cur_mode->vts_def - OV2740_EXPOSURE_MAX_MARGIN;
>  	ov2740->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops,
>  					     V4L2_CID_EXPOSURE,
>  					     OV2740_EXPOSURE_MIN, exposure_max,

-- 
Regards,

Laurent Pinchart

