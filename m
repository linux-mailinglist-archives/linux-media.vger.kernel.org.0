Return-Path: <linux-media+bounces-27642-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D81A502B3
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 15:51:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72A9C161AC3
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 14:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ECF624EF6B;
	Wed,  5 Mar 2025 14:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YMCRN1wq"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1E224E4D9;
	Wed,  5 Mar 2025 14:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741186003; cv=none; b=fCvi1kjFSKM0cfI7cW+ONZrz1b+r0twHcDBGe2D2nRLzMJMiQ89Y6olNHCcTp6dhVMkcaWADKnlrq/hhT1O0oAA3E8lXca5qoK/DvUHtSmnS03ckNtdVWO57sYkWulA/9ynPg/KQxGKeFADZZFoo9aa+lqMERESei7ptlHHPOCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741186003; c=relaxed/simple;
	bh=L3jUhS/r+JH2pja+AgnftKyj5qnxWl+7BgssdXVj2gw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EYv6rv+w0ObreoGEnHx4qhzBpkJCilz5ba8/+6a/U/qQbZTFKLCoemef+5TJucUT/ODEzZwaq+9wcfNqFI4Rd15jgX4Yc/nWVPQYJwmbBC6XrefKVePM9041XkqQ3rSiDr34va8kueus5pYOdliLAq64WD1ErCCcJUcCz+LlTM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YMCRN1wq; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741186002; x=1772722002;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L3jUhS/r+JH2pja+AgnftKyj5qnxWl+7BgssdXVj2gw=;
  b=YMCRN1wqjrZz0jVq2oA5gvJJXEE9JLqpd74quaAQ4VwV2oS63S/mZcY9
   HmSyQQ2exkoBRWBIs95jfa9JSFsuPEq0j/wxsfXuy8/i+ZTJFKraqeebG
   UmBL7hLlKikrFLi5hJCqr3OG1YdMil5i7njA8H9Mf9ERHWq9IeAah42ZA
   oE8gngIMsJ6CNJHl7EbB2ThN+AldTEEPnxPz2KrFMlSQES1X/Sz+oKAD1
   5JTaYC/cerR+uYn4clANO5hNTq2PzBmbrAkDRseoVv/U+61HrleVJHcjj
   i90JIAeHhF3lr5iDjDTr+IoAagTOkxcP3Hd4z2eJilzptHc3ZBKhV2C94
   Q==;
X-CSE-ConnectionGUID: DxY+jS37SFapsqkH3qK0Kg==
X-CSE-MsgGUID: LPwkdlqKSJqKdrq3HkcpYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="52792665"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="52792665"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 06:46:41 -0800
X-CSE-ConnectionGUID: jF6/yAj2RoqpY3HCtIYkbw==
X-CSE-MsgGUID: prA7QD4NTSOMacJKP8SD3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="118864143"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 06:46:39 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id BD44F11FB58;
	Wed,  5 Mar 2025 16:46:35 +0200 (EET)
Date: Wed, 5 Mar 2025 14:46:35 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: kieran.bingham@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] media: i2c: imx219: switch to
 {enable,disable}_streams
Message-ID: <Z8hjy8CiM-QcjTME@kekkonen.localdomain>
References: <20250305142117.29182-1-tarang.raval@siliconsignals.io>
 <20250305142117.29182-2-tarang.raval@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305142117.29182-2-tarang.raval@siliconsignals.io>

Hi Tarang,

Thanks for the update.

On Wed, Mar 05, 2025 at 07:51:15PM +0530, Tarang Raval wrote:
> Switch from s_stream to enable_streams and disable_streams callbacks.
> 
> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
> ---
>  drivers/media/i2c/imx219.c | 36 +++++++++++++++++-------------------
>  1 file changed, 17 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index f662c9d75511..12f1aa8824fe 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -723,12 +723,17 @@ static int imx219_configure_lanes(struct imx219 *imx219)
>  				  ARRAY_SIZE(imx219_4lane_regs), NULL);
>  };
>  
> -static int imx219_start_streaming(struct imx219 *imx219,
> -				  struct v4l2_subdev_state *state)
> +static int imx219_enable_streams(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_state *state, u32 pad,
> +				 u64 streams_mask)
>  {
> +	struct imx219 *imx219 = to_imx219(sd);
>  	struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
>  	int ret;
>  
> +	if (pad != 0)
> +		return -EINVAL;

There's no need to check for the pad argument: {enable,disable}_streams may
be called on source pads only.

> +
>  	ret = pm_runtime_resume_and_get(&client->dev);
>  	if (ret < 0)
>  		return ret;
> @@ -778,11 +783,17 @@ static int imx219_start_streaming(struct imx219 *imx219,
>  	return ret;
>  }
>  
> -static void imx219_stop_streaming(struct imx219 *imx219)
> +static int imx219_disable_streams(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *state, u32 pad,
> +				  u64 streams_mask)
>  {
> +	struct imx219 *imx219 = to_imx219(sd);
>  	struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
>  	int ret;
>  
> +	if (pad != 0)
> +		return -EINVAL;

Ditto.

> +
>  	/* set stream off register */
>  	ret = cci_write(imx219->regmap, IMX219_REG_MODE_SELECT,
>  			IMX219_MODE_STANDBY, NULL);
> @@ -793,22 +804,7 @@ static void imx219_stop_streaming(struct imx219 *imx219)
>  	__v4l2_ctrl_grab(imx219->hflip, false);
>  
>  	pm_runtime_put(&client->dev);
> -}
> -
> -static int imx219_set_stream(struct v4l2_subdev *sd, int enable)
> -{
> -	struct imx219 *imx219 = to_imx219(sd);
> -	struct v4l2_subdev_state *state;
> -	int ret = 0;
> -
> -	state = v4l2_subdev_lock_and_get_active_state(sd);
> -
> -	if (enable)
> -		ret = imx219_start_streaming(imx219, state);
> -	else
> -		imx219_stop_streaming(imx219);
>  
> -	v4l2_subdev_unlock_state(state);
>  	return ret;
>  }
>  
> @@ -992,7 +988,7 @@ static int imx219_init_state(struct v4l2_subdev *sd,
>  }
>  
>  static const struct v4l2_subdev_video_ops imx219_video_ops = {
> -	.s_stream = imx219_set_stream,
> +	.s_stream = v4l2_subdev_s_stream_helper,
>  };
>  
>  static const struct v4l2_subdev_pad_ops imx219_pad_ops = {
> @@ -1001,6 +997,8 @@ static const struct v4l2_subdev_pad_ops imx219_pad_ops = {
>  	.set_fmt = imx219_set_pad_format,
>  	.get_selection = imx219_get_selection,
>  	.enum_frame_size = imx219_enum_frame_size,
> +	.enable_streams = imx219_enable_streams,
> +	.disable_streams = imx219_disable_streams,
>  };
>  
>  static const struct v4l2_subdev_ops imx219_subdev_ops = {

-- 
Regards,

Sakari Ailus

