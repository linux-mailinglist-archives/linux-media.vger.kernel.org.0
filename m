Return-Path: <linux-media+bounces-20671-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7039B8D47
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 09:48:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B84CD2831CE
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 08:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC80D157484;
	Fri,  1 Nov 2024 08:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QMAdul2E"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC52F25757;
	Fri,  1 Nov 2024 08:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730450916; cv=none; b=Kj9UnmfEyYRJTRwfqsn7H5LLql/Tsl6fEwj5nk1RW+PTqDifEK8PZBagv2Y5UxurlP0MhCFmhAXh2UsOhhWP4aqAK2r9C2/cWjUnMg7loVdXBypfpfGdKpGXO46VXTt6HLQ7rOwfa/uem/4bXGNUau+yypa+ARSS6mt/a7LZ4XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730450916; c=relaxed/simple;
	bh=LP+a1BxjVJ9vG3B3530nnZthAjEqK/mW+C3gUxuiK8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QmrIlXYWiUERynVi2FmijUa51/SyGq98ol/W/D+7ApAvA43KZUb5VzugAIyr6V4/qRTAT1WqC8XOQNn6Fhw9wG5ci8g8RUzl1wbT21r4226Bkk1woj3VWVSDeIPaKlfROcoRRjjyThupkB1cxsZqzIo96zF8ODzA6GNyQBPIq3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QMAdul2E; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730450914; x=1761986914;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LP+a1BxjVJ9vG3B3530nnZthAjEqK/mW+C3gUxuiK8Q=;
  b=QMAdul2EIGuD0B+e1VnDfr0FSYsXfssp2ZJNHOyTVje7SLXn/wlwDTP8
   kPUt+FHThKR04iZ6QKvVtjm2pc1t/umdTk7n+3YmWFm8KKVS7fzHaukGM
   t0yTPIIwTVvaT3vscbo5al6iq0Bmy2uPYUPOcDaB8KItQ0wZ8JzaDOJzT
   RI0fY/RQp10beaTiJ8Pmbe7b9OwBrISOboi9wzyrmukTuzBFMpEspaXJu
   7YB8ccaZgVuC6OZYxaMt/ERvSJvzRBd5CZCyeqHB2CD23JfB2D5IxJRgZ
   /WxQm4b17Cz9FnmQw5ExboCN/tHIySvvD2Enhjt858fmqVFYL5GJxTdel
   w==;
X-CSE-ConnectionGUID: xf7WQykQS7SSMqWKOSeVkg==
X-CSE-MsgGUID: limw8SqdS+mFhPJbhIXKSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="30326198"
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="30326198"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 01:48:33 -0700
X-CSE-ConnectionGUID: N8xSZEgoTDW1z+YmmO8zYQ==
X-CSE-MsgGUID: 0vCVJNsHSZm34gklDtKZfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="106242221"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 01:48:31 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id AE05C11FA28;
	Fri,  1 Nov 2024 10:48:28 +0200 (EET)
Date: Fri, 1 Nov 2024 08:48:28 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] media: i2c: imx219: make HBLANK r/w to allow longer
 exposures
Message-ID: <ZySV3KKXSyIreRI4@kekkonen.localdomain>
References: <20241029-imx219_fixes-v1-0-b45dc3658b4e@ideasonboard.com>
 <20241029-imx219_fixes-v1-2-b45dc3658b4e@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029-imx219_fixes-v1-2-b45dc3658b4e@ideasonboard.com>

Hi Jai,

On Tue, Oct 29, 2024 at 02:27:36PM +0530, Jai Luthra wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> The HBLANK control was read-only, and always configured such
> that the sensor HTS register was 3448. This limited the maximum
> exposure time that could be achieved to around 1.26 secs.
> 
> Make HBLANK read/write so that the line time can be extended,
> and thereby allow longer exposures (and slower frame rates).
> Retain the overall HTS setting when changing modes rather than
> resetting it to a default.

It looks like this changes horizontal blanking at least in some cases. Does
this also work as expected in binned modes, for instance?

Many sensors have image quality related issues on untested albeit
functional line length values.

So my question is: how has this been validated?

> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
>  drivers/media/i2c/imx219.c | 35 +++++++++++++++++++++++------------
>  1 file changed, 23 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index f98aad74fe584a18e2fe7126f92bf294762a54e3..de9230d4ad81f085640be254db9391ae7ad20773 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -76,8 +76,10 @@
>  
>  #define IMX219_VBLANK_MIN		32
>  
> -/* HBLANK control - read only */
> -#define IMX219_PPL_DEFAULT		3448
> +/* HBLANK control range */
> +#define IMX219_PPL_MIN			3448
> +#define IMX219_PPL_MAX			0x7ff0
> +#define IMX219_REG_HTS			CCI_REG16(0x0162)
>  
>  #define IMX219_REG_LINE_LENGTH_A	CCI_REG16(0x0162)
>  #define IMX219_REG_X_ADD_STA_A		CCI_REG16(0x0164)
> @@ -422,6 +424,10 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
>  		cci_write(imx219->regmap, IMX219_REG_VTS,
>  			  format->height + ctrl->val, &ret);
>  		break;
> +	case V4L2_CID_HBLANK:
> +		cci_write(imx219->regmap, IMX219_REG_HTS,
> +			  format->width + ctrl->val, &ret);
> +		break;
>  	case V4L2_CID_TEST_PATTERN_RED:
>  		cci_write(imx219->regmap, IMX219_REG_TESTP_RED,
>  			  ctrl->val, &ret);
> @@ -496,12 +502,11 @@ static int imx219_init_controls(struct imx219 *imx219)
>  					   V4L2_CID_VBLANK, IMX219_VBLANK_MIN,
>  					   IMX219_VTS_MAX - mode->height, 1,
>  					   mode->vts_def - mode->height);
> -	hblank = IMX219_PPL_DEFAULT - mode->width;
> +	hblank = IMX219_PPL_MIN - mode->width;
>  	imx219->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
> -					   V4L2_CID_HBLANK, hblank, hblank,
> +					   V4L2_CID_HBLANK, hblank,
> +					   IMX219_PPL_MIN - mode->width,
>  					   1, hblank);
> -	if (imx219->hblank)
> -		imx219->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>  	exposure_max = mode->vts_def - 4;
>  	exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
>  		exposure_max : IMX219_EXPOSURE_DEFAULT;
> @@ -842,6 +847,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>  	crop->top = (IMX219_NATIVE_HEIGHT - crop->height) / 2;
>  
>  	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> +		u32 prev_hts = format->width + imx219->hblank->val;
>  		int exposure_max;
>  		int exposure_def;
>  		int hblank;
> @@ -861,13 +867,18 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>  					 exposure_max, imx219->exposure->step,
>  					 exposure_def);
>  		/*
> -		 * Currently PPL is fixed to IMX219_PPL_DEFAULT, so hblank
> -		 * depends on mode->width only, and is not changeble in any
> -		 * way other than changing the mode.
> +		 * Retain PPL setting from previous mode so that the
> +		 * line time does not change on a mode change.
> +		 * Limits have to be recomputed as the controls define
> +		 * the blanking only, so PPL values need to have the
> +		 * mode width subtracted.
>  		 */
> -		hblank = IMX219_PPL_DEFAULT - mode->width;
> -		__v4l2_ctrl_modify_range(imx219->hblank, hblank, hblank, 1,
> -					 hblank);
> +		hblank = prev_hts - mode->width;
> +		__v4l2_ctrl_modify_range(imx219->hblank,
> +					 IMX219_PPL_MIN - mode->width,
> +					 IMX219_PPL_MAX - mode->width,
> +					 1, IMX219_PPL_MIN - mode->width);
> +		__v4l2_ctrl_s_ctrl(imx219->hblank, hblank);
>  	}
>  
>  	return 0;
> 

-- 
Kind regards,

Sakari Ailus

