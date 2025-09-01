Return-Path: <linux-media+bounces-41483-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBC2B3F06B
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 23:17:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5AC9A4E0874
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 21:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BA0A22836C;
	Mon,  1 Sep 2025 21:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FoD+BIOp"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02E4C13B;
	Mon,  1 Sep 2025 21:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756761419; cv=none; b=TGTtVLSFUcSDOO3asJ+UZDwt7U5l8fzVRVCZBdSGaulGhKf7VxryeiB/yzF+ZboFt+j5gwOgg9ZLhBo3doKOUcbwvPT3uAFNgErqGosxfX2olhHv0b9iR27Vq7qYuDtqXEFMPa1kra9PTgXyd5w1WKa47lSaEXDsgNd97qZI2fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756761419; c=relaxed/simple;
	bh=fuLtbWcuMApjPw4Zt2GQ2hRAQyVE7wvAKMyumnRxa/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pEBWT6QfvpG9KrzQtCsUD3GbyKS82Fbzhr8dj9ZIle8Qx8MQiSVUaHEIDv9ifLyHD5AdVifBngFrN6q10/vz47JA/+BRer5Nsk7z4rcvg4QdPLBroYBuTBGjeJG/IpIa767OEFdbG+02AApalyD9VCy37fBJdR71zhcEJV55LE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FoD+BIOp; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756761418; x=1788297418;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=fuLtbWcuMApjPw4Zt2GQ2hRAQyVE7wvAKMyumnRxa/s=;
  b=FoD+BIOpHhvsDId2qfBze/0UDkaR5OWwC58DL2/FE7jfDhROE5D/vQhY
   nGtbmuzANJbieN0ZmbxhcUIQSjrbhok7v0PzBr5gs7atnMy2gYVSEtnwD
   /uM1xnms/+YBDjY7rBpR0wS1mStxB1TVNHYExevhIX8MY7Zo7qpF+bEDq
   PPZZ8ZPD8Bpi6htfOpk271eBmmJMjDZ8NQ7UqdQOL7QLscMNf0pnqMFNx
   ZXPPCTkveN6KkLqSYfsgXLVY1J3WwKmRUv1hML/nEiCYbgfNO4qKMxWXs
   zAx2nET6wjLM9cIdteRFGZbzHA1HkOptCaJJqh8pSDOgnPQyAekEQf26w
   Q==;
X-CSE-ConnectionGUID: qXyRjuG+T32yp5UX/TrsWw==
X-CSE-MsgGUID: dj9WZwX6TBK24XCxGO3xxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="81602941"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="81602941"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 14:16:57 -0700
X-CSE-ConnectionGUID: KhwXel9eT0GJMJ+94UV2cw==
X-CSE-MsgGUID: NM+geiECRziMrMWX5U+T2w==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.254])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 14:16:54 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B446C11F738;
	Tue, 02 Sep 2025 00:16:51 +0300 (EEST)
Date: Tue, 2 Sep 2025 00:16:51 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>
Subject: Re: [PATCH v7 10/10] media: i2c: ov9282: dynamic flash_duration
 maximum
Message-ID: <aLYNQ4W8f55G_7HP@kekkonen.localdomain>
References: <20250901-ov9282-flash-strobe-v7-0-d58d5a694afc@linux.dev>
 <20250901-ov9282-flash-strobe-v7-10-d58d5a694afc@linux.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250901-ov9282-flash-strobe-v7-10-d58d5a694afc@linux.dev>

Hi Richard,

On Mon, Sep 01, 2025 at 05:05:15PM +0200, Richard Leitner wrote:
> This patch sets the current exposure time as maximum for the
> flash_duration control. As Flash/Strobes which are longer than the
> exposure time have no effect.
> 
> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> ---
>  drivers/media/i2c/ov9282.c | 30 ++++++++++++++++++++++++++----
>  1 file changed, 26 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index b104ae77f00e9e7777342e48b7bf3caa6d297f69..3253d9f271cb3caef6d85837ebec4f5beb466a4d 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -198,6 +198,7 @@ struct ov9282_mode {
>   * @exp_ctrl: Pointer to exposure control
>   * @again_ctrl: Pointer to analog gain control
>   * @pixel_rate: Pointer to pixel rate control
> + * @flash_duration: Pointer to flash duration control
>   * @vblank: Vertical blanking in lines
>   * @noncontinuous_clock: Selection of CSI2 noncontinuous clock mode
>   * @cur_mode: Pointer to current selected sensor mode
> @@ -220,6 +221,7 @@ struct ov9282 {
>  		struct v4l2_ctrl *again_ctrl;
>  	};
>  	struct v4l2_ctrl *pixel_rate;
> +	struct v4l2_ctrl *flash_duration;
>  	u32 vblank;
>  	bool noncontinuous_clock;
>  	const struct ov9282_mode *cur_mode;
> @@ -611,6 +613,15 @@ static int ov9282_update_controls(struct ov9282 *ov9282,
>  					mode->vblank_max, 1, mode->vblank);
>  }
>  
> +static u32 ov9282_exposure_to_us(struct ov9282 *ov9282, u32 exposure)
> +{
> +	/* calculate exposure time in µs */
> +	u32 frame_width = ov9282->cur_mode->width + ov9282->hblank_ctrl->val;
> +	u32 trow_us = (frame_width * 1000000UL) / ov9282->pixel_rate->val;

Redundant parentheses.

> +
> +	return exposure * trow_us;
> +}
> +
>  /**
>   * ov9282_update_exp_gain() - Set updated exposure and gain
>   * @ov9282: pointer to ov9282 device
> @@ -622,9 +633,10 @@ static int ov9282_update_controls(struct ov9282 *ov9282,
>  static int ov9282_update_exp_gain(struct ov9282 *ov9282, u32 exposure, u32 gain)
>  {
>  	int ret;
> +	u32 exposure_us = ov9282_exposure_to_us(ov9282, exposure);
>  
> -	dev_dbg(ov9282->dev, "Set exp %u, analog gain %u",
> -		exposure, gain);
> +	dev_dbg(ov9282->dev, "Set exp %u (~%u us), analog gain %u",
> +		exposure, exposure_us, gain);
>  
>  	ret = ov9282_write_reg(ov9282, OV9282_REG_HOLD, 1, 1);
>  	if (ret)
> @@ -635,6 +647,12 @@ static int ov9282_update_exp_gain(struct ov9282 *ov9282, u32 exposure, u32 gain)
>  		goto error_release_group_hold;
>  
>  	ret = ov9282_write_reg(ov9282, OV9282_REG_AGAIN, 1, gain);
> +	if (ret)
> +		goto error_release_group_hold;
> +
> +	ret = __v4l2_ctrl_modify_range(ov9282->flash_duration,
> +				       0, exposure_us, 1,
> +				       OV9282_FLASH_DURATION_DEFAULT);
>  
>  error_release_group_hold:
>  	ov9282_write_reg(ov9282, OV9282_REG_HOLD, 1, 0);
> @@ -1420,6 +1438,7 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
>  	struct v4l2_fwnode_device_properties props;
>  	struct v4l2_ctrl *ctrl;
>  	u32 hblank_min;
> +	u32 exposure_us;
>  	u32 lpfr;
>  	int ret;
>  
> @@ -1491,8 +1510,11 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
>  	/* Flash/Strobe controls */
>  	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_FLASH_HW_STROBE_SIGNAL, 0, 1, 1, 0);
>  
> -	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_FLASH_DURATION,
> -			  0, 13900, 1, 8);
> +	exposure_us = ov9282_exposure_to_us(ov9282, OV9282_EXPOSURE_DEFAULT);
> +	ov9282->flash_duration = v4l2_ctrl_new_std(ctrl_hdlr,
> +						   &ov9282_ctrl_ops, V4L2_CID_FLASH_DURATION,
> +						   0, exposure_us,
> +						   1, OV9282_FLASH_DURATION_DEFAULT);

Wrap this differently, please, e.g. after '='.

>  
>  	ctrl = v4l2_ctrl_new_std_menu(ctrl_hdlr, &ov9282_ctrl_ops,
>  				      V4L2_CID_FLASH_STROBE_SOURCE,
> 

To me the set looks good but I wouldn't mind about having a bit more
review.

-- 
Kind regards,

Sakari Ailus

