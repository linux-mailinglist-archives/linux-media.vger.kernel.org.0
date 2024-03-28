Return-Path: <linux-media+bounces-8069-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA8988F909
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 08:44:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD73728E50D
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 07:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F96E51C28;
	Thu, 28 Mar 2024 07:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XWKlj60S"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6551E89C
	for <linux-media@vger.kernel.org>; Thu, 28 Mar 2024 07:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711611881; cv=none; b=J37PY4Lzx5WP2UhKOlODK7zgXyiHvQjktgNT0A8o7xOe+kiVgzmmj3MmnS2Az3VSYX4j2/c3VeaQv1Bjz5HU3W3Bkf2mELjAK1WVrXdr0CCGe0aZB+/XZfoZeCz+TutNkozEsqWD6hGQpK6vjaoTZs1PKsOI9vv+aa7IszXUDaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711611881; c=relaxed/simple;
	bh=/5ecvwQDEHpQF66sElgIwIxJp6aqmamwAjrbBW+TojE=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=SUvK4yBMRDtZH8OvA/WY4jyAYaZKE1npkLoG5VD3pgLdxbh2FgD87jX+hPtIyEqgYdPsW/I4tHQzqCyIL8kgHCgdzFYYE5K8qUhx/Sz4Y1YnXkWGcJaUtWwlHSluFiqHqNs7HPLQz+u1/iyw0/fH0l6l2xSBjXrTqJH+V8HTtdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XWKlj60S; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711611881; x=1743147881;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=/5ecvwQDEHpQF66sElgIwIxJp6aqmamwAjrbBW+TojE=;
  b=XWKlj60SKjdcUrwJAP17SJJbbO+iLDV0pcHoLpUhO7QbwGDF5NToJovR
   PEg9h01RLhFm6xCl6bjOyUZo6DG24qJ0JfC1kgPUbFm5RmoRQSv0UG2KY
   8jAugAmoVgpCR0yzapkQBpDPxiCliJGxjStYfn8PD+ElCnR97i4a5flcL
   bgxLDmerXcNY25wSMbEbFFsfeTpb/10BJvrNm+Fqt0WRqo6oniA/550z0
   o5hkPH8E2qtV9oyKHZRZcF0gMa1eXoiZuMS0iy7+stZyJ66WmHcrq16zE
   9XHDjZweC86rDkC4KvZQoDh77i/xLrd6rKg5oZwoAQyASbpSWJn+pDVE/
   A==;
X-CSE-ConnectionGUID: l3VZDRDER1+rf6vaxeTBmA==
X-CSE-MsgGUID: zmRGLZXYSeq1szToS70Vqw==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="17896542"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="17896542"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 00:44:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="16507325"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by orviesa009.jf.intel.com with ESMTP; 28 Mar 2024 00:44:38 -0700
Subject: Re: [PATCH 1/1] media: ov2740: Fix LINK_FREQ and PIXEL_RATE control
 value reporting
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
 Hans de Goede <hdegoede@redhat.com>
References: <20240327132853.521461-1-sakari.ailus@linux.intel.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <78d36640-c17b-e5f9-e94f-321503cba172@linux.intel.com>
Date: Thu, 28 Mar 2024 15:45:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240327132853.521461-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Sakari,

Thank you for the fix patch.

On 3/27/24 9:28 PM, Sakari Ailus wrote:
> The driver dug the supported link frequency up from the V4L2 fwnode
> endpoint and used it internally, but failed to report this in the
> LINK_FREQ and PIXEL_RATE controls. Fix this.
> 
> Fixes: 0677a2d9b735 ("media: ov2740: Add support for 180 MHz link frequency")
> Cc: stable@vger.kernel.org # for v6.8 and later
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/ov2740.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
> index 552935ccb4a9..57906df7be4e 100644
> --- a/drivers/media/i2c/ov2740.c
> +++ b/drivers/media/i2c/ov2740.c
> @@ -768,14 +768,15 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
>  	cur_mode = ov2740->cur_mode;
>  	size = ARRAY_SIZE(link_freq_menu_items);
>  
> -	ov2740->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &ov2740_ctrl_ops,
> -						   V4L2_CID_LINK_FREQ,
> -						   size - 1, 0,
> -						   link_freq_menu_items);
> +	ov2740->link_freq =
> +		v4l2_ctrl_new_int_menu(ctrl_hdlr, &ov2740_ctrl_ops,
> +				       V4L2_CID_LINK_FREQ, size - 1,
> +				       ov2740->supported_modes->link_freq_index,
> +				       link_freq_menu_items);
>  	if (ov2740->link_freq)
>  		ov2740->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>  
> -	pixel_rate = to_pixel_rate(OV2740_LINK_FREQ_360MHZ_INDEX);
> +	pixel_rate = to_pixel_rate(ov2740->supported_modes->link_freq_index);
>  	ov2740->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops,
>  					       V4L2_CID_PIXEL_RATE, 0,
>  					       pixel_rate, 1, pixel_rate);
> 

Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>

-- 
Best regards,
Bingbu Cao

