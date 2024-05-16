Return-Path: <linux-media+bounces-11521-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9368C74BF
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 12:42:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3DE52B22940
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 10:42:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2CFE145348;
	Thu, 16 May 2024 10:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TkB6i3Ee"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA76143C56;
	Thu, 16 May 2024 10:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715856133; cv=none; b=KvU5hU+wE5F/YxgtiGNMxv2+w2ST0j7pxbGsLkp8bYXIfiTk7ndQy/Ugb7n8QhQvQVDhtxmxX5U8WWELDu9t4aH/EpKXnf9noXz2gvz932Is/Ncto7QF5qySXRGbdBvm8gvH+qkLC0viqluwdg8r9mOj1rLSkQzi6sYOq7MESXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715856133; c=relaxed/simple;
	bh=LC4AeqwZIRmI4MhnnhupDiJJMKgFyN7s0/4iOHpe3+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZFVII72vfBCQ6PdotS0RjKqJVxcjCsxmq7wWedYVHLc3SgDlCkI0p8HaEflrVuW/ZvVRCljFW9i/1vYWl5Wl30x4s+iPgfWZeDJtZxRKa7rRLy79267LGWwD6Bohmme1TPcrOlmuEiyPYoXrn1ljZ2dDVYHa6A0LGOpe+8p6Ils=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TkB6i3Ee; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715856131; x=1747392131;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LC4AeqwZIRmI4MhnnhupDiJJMKgFyN7s0/4iOHpe3+4=;
  b=TkB6i3Een8HSgJnxi4bkUJ9SDx3oReLjN2RtjqDAJ/5tcA/qSzSIn6pg
   6FDuZiKIJr56rSAJdEqSWz6aEMS1Y0nhjYlVcnQJumZjD1+at29GUhN+M
   MkgW5ySFjH/VoQcNu2lcK+sdUd4u91vWGNoJSbRJpOnS7O3/vfAuyM+G9
   rUbDQdBzrFNN+NvJlLRTDHDcwSzvQCfifIJbZVcCLUp5RoOU7PR0Q9LvD
   An7OtnrNmdVaNtrVKz7+7IIRtwDHkKVRE8udF7yfbqV7oMiOJ2Cw6UW+y
   4peInmB0qUPO2uhRpZxbFJK6LrYGMfHXDdZrwezALhpxc1bvhlsju44xD
   A==;
X-CSE-ConnectionGUID: NDk50ujVReq8fhyThOurug==
X-CSE-MsgGUID: vxpLYxZiRMK/FPDBgDEfww==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11803709"
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; 
   d="scan'208";a="11803709"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 03:42:09 -0700
X-CSE-ConnectionGUID: drmnooZZQMKtYIAtdk4Uzg==
X-CSE-MsgGUID: ZFPyQ8ZsTqWAKrvtrFP90w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; 
   d="scan'208";a="31962616"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 03:42:08 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 122A811FC04;
	Thu, 16 May 2024 13:42:05 +0300 (EEST)
Date: Thu, 16 May 2024 10:42:05 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: cy_huang@richtek.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: v4l: async: Fix NULL pointer when v4l2 flash
 subdev binding
Message-ID: <ZkXi_U5Js34dUQsA@kekkonen.localdomain>
References: <e2f9f2b7b7de956d70b8567a2ab285409fff988b.1715136478.git.cy_huang@richtek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2f9f2b7b7de956d70b8567a2ab285409fff988b.1715136478.git.cy_huang@richtek.com>

Hi Chi Yuan,

On Wed, May 08, 2024 at 10:51:49AM +0800, cy_huang@richtek.com wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> In v4l2_async_create_ancillary_links(), if v4l2 async notifier is
> created from v4l2 device, the v4l2 flash subdev async binding will enter
> the logic to create media link. Due to the subdev of notifier is NULL,
> this will cause NULL pointer to access the subdev entity. Therefore, add
> the check to bypass it.
> 
> Fixes: aa4faf6eb271 ("media: v4l2-async: Create links during v4l2_async_match_notify()")
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
> Hi,
> 
>   I'm trying to bind the v4l2 subdev for flashlight testing. It seems
> some logic in v4l2 asynd binding is incorrect.
> 
> From the change, I modified vim2m as the test driver to bind mt6370 flashlight.
> 
> Here's the backtrace log.
> 
>  vim2m soc:vim2m: bound [white:flash-2]
>  Unable to handle kernel NULL pointer dereference at virtual address 0000000000000058
>  ......skipping
>  Call trace:
>   media_create_ancillary_link+0x48/0xd8 [mc]
>   v4l2_async_match_notify+0x17c/0x208 [v4l2_async]
>   v4l2_async_register_subdev+0xb8/0x1d0 [v4l2_async]

There's something wrong obviously somewhere but where?

A sub-notifier does have a sub-device after the notifier initialisation.
Maybe the initialisation does not happen in the right order?

>   __v4l2_flash_init.part.0+0x3b4/0x4b0 [v4l2_flash_led_class]
>   v4l2_flash_init+0x28/0x48 [v4l2_flash_led_class]
>   mt6370_led_probe+0x348/0x690 [leds_mt6370_flash]
> 
> After tracing the code, it will let the subdev labeled as F_LENS or
> F_FLASH function to create media link. To prevent the NULL pointer
> issue, the simplest way is add a check when 'n->sd' is NULL and bypass
> the later media link creataion.
> ---
>  drivers/media/v4l2-core/v4l2-async.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index 3ec323bd528b..9d3161c51954 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -324,6 +324,9 @@ static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
>  	    sd->entity.function != MEDIA_ENT_F_FLASH)
>  		return 0;
>  
> +	if (!n->sd)
> +		return 0;

This isn't the right fix: the ancillary link won't be created as a result.

> +
>  	link = media_create_ancillary_link(&n->sd->entity, &sd->entity);
>  
>  #endif

-- 
Regards,

Sakari Ailus

