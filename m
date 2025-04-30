Return-Path: <linux-media+bounces-31372-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F513AA4530
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 10:24:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B7B51BA21D4
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 08:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0556215F5F;
	Wed, 30 Apr 2025 08:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ImCt9vrS"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779B71E9B09;
	Wed, 30 Apr 2025 08:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746001449; cv=none; b=AVDZOTo0rWVMGzmQH3TsLPXPDMjerTxN8fWFwIIZx2SDaVl84/BZbsx6B3m33l2AAM3p7xzYd7Bj895LYKJbf0n2YrEGb1rmSa8oUUertyfaUGDvXWrfxMvrp/3Ytyq9nMAKL+Xb8d5fXjV6u3Zhzlh48fE8g0L7pFl/z7OCBjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746001449; c=relaxed/simple;
	bh=XkzCV+HlYtWZq8CFLqb3j+QfX63WPGpBO5U9P6v5HbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rfOlg0ZYg0yKPF53OcaBA/VogFjJknbU6PrBlUDJfs+Xy9QvyYlFoUMY/xc5OvZ46eWnKo58veUYkGeC+BJITdmbi9FIsal10SgA6mgFckYp/uhvvSYznB53/F8YzRvGHBHx9yvlayf6W9pEr+isqJqmIkajs9HAe0Nb6To72AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ImCt9vrS; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746001448; x=1777537448;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XkzCV+HlYtWZq8CFLqb3j+QfX63WPGpBO5U9P6v5HbQ=;
  b=ImCt9vrSz3IgmxJL3lyq08BskNYRYfz+GOblvcQ4AofFzEM61aT4upid
   /cJh/7q9VfFVJOoE/XihmTQAD+sHGGfZhpWOJGHJm2LDhkGXG17xLRpVu
   yt3DAij9/Yx5aTqiJSdocKe4DKq91uaJHQM7bQX6Wh2iYFMLmvCtAkmU9
   FQ75clh052wAs7VmK1pJcq41wQtkfXrMOoEZl9o9/5IT81+mADkjB2LMR
   x69Cy2XjHbzb2e82LcAHbewhwKpAVv8VclUCkwySB0r/5Uwok4f0Tz0ih
   HPqYx4I1DvOJdkIqec61vunJFt2w3iIgZIbTD88D3s1jiR7orf1e+D6uZ
   w==;
X-CSE-ConnectionGUID: fmei6GrlQoa3NgTjUEOwmA==
X-CSE-MsgGUID: jdrwsVQSRt+J/vrN/7MAeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="73036895"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="73036895"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 01:24:06 -0700
X-CSE-ConnectionGUID: mRXpYfzTS/eLd4rgTlskdA==
X-CSE-MsgGUID: am3Q4LEeQ/yfmJ0T5s0Hkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="134570196"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 01:24:03 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 090B711F7E7;
	Wed, 30 Apr 2025 11:24:00 +0300 (EEST)
Date: Wed, 30 Apr 2025 08:24:00 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v3 3/9] media: v4l2-flash: add support for flash/strobe
 duration
Message-ID: <aBHeIBbFRkZ4P82E@kekkonen.localdomain>
References: <20250429-ov9282-flash-strobe-v3-0-2105ce179952@linux.dev>
 <20250429-ov9282-flash-strobe-v3-3-2105ce179952@linux.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429-ov9282-flash-strobe-v3-3-2105ce179952@linux.dev>

Hi Richard,

On Tue, Apr 29, 2025 at 02:59:08PM +0200, Richard Leitner wrote:
> Add support for the new V4L2_CID_FLASH_DURATION control to the v4l2
> flash led class.
> 
> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> ---
>  drivers/media/v4l2-core/v4l2-flash-led-class.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-flash-led-class.c b/drivers/media/v4l2-core/v4l2-flash-led-class.c
> index 355595a0fefac72c2f6941a30fa430d37dbdccfe..963b549480f6eb3b9eb0d80696a764de7ffcc1a2 100644
> --- a/drivers/media/v4l2-core/v4l2-flash-led-class.c
> +++ b/drivers/media/v4l2-core/v4l2-flash-led-class.c
> @@ -298,6 +298,12 @@ static int v4l2_flash_s_ctrl(struct v4l2_ctrl *c)
>  		 * microamperes for flash intensity units.
>  		 */
>  		return led_set_flash_brightness(fled_cdev, c->val);
> +	case V4L2_CID_FLASH_DURATION:
> +		/*
> +		 * No conversion is needed as LED Flash class also uses
> +		 * microseconds for flash duration units.
> +		 */
> +		return led_set_flash_duration(fled_cdev, c->val);
>  	}
>  
>  	return -EINVAL;
> @@ -424,6 +430,13 @@ static void __fill_ctrl_init_data(struct v4l2_flash *v4l2_flash,
>  		ctrl_cfg->flags = V4L2_CTRL_FLAG_VOLATILE |
>  				  V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
>  	}
> +
> +	/* Init FLASH_DURATION ctrl data */
> +	if (has_flash_op(fled_cdev, timeout_set)) {
> +		ctrl_init_data[FLASH_DURATION].cid = V4L2_CID_FLASH_DURATION;
> +		ctrl_cfg = &ctrl_init_data[FLASH_DURATION].config;
> +		__lfs_to_v4l2_ctrl_config(&fled_cdev->duration, ctrl_cfg);
> +		ctrl_cfg->id = V4L2_CID_FLASH_DURATION;

Has this been compile tested? :-)

>  }
>  
>  static int v4l2_flash_init_controls(struct v4l2_flash *v4l2_flash,
> 

-- 
Regards,

Sakari Ailus

