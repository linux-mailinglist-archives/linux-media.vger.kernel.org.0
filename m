Return-Path: <linux-media+bounces-32220-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45166AB23C2
	for <lists+linux-media@lfdr.de>; Sat, 10 May 2025 14:25:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3F50A03E5B
	for <lists+linux-media@lfdr.de>; Sat, 10 May 2025 12:24:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC74C256C7C;
	Sat, 10 May 2025 12:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hA0MG2B2"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657751C5F13
	for <linux-media@vger.kernel.org>; Sat, 10 May 2025 12:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746879904; cv=none; b=BtWM+v8hq/+tPQcX+9zPc+eh1dhmL41OvMu7rOvG/pQWxzAh0MSOPO0HKnzSNYCI8ssu3S310lluI6cxtd2nc/2NQ1vzeZsx6UT+/04wSe3HkMdZ+uZePhCF8Fngc8beU8KfK9U0sNTBd6sQkJ9u2gPGV6P444mDDL0sFDnfg5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746879904; c=relaxed/simple;
	bh=dBM+UQUeSxwYoT1mtG3LFK5m6GtQWea0C8sEsFnQpNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HG9iDCStJcP4MXjrXfmvy0VXdNR8Pjpc4GOZTo2Pp6rLKgHQRFWx512557vIF56mF9jxMFPzijmB9VSjL8c7J5prIg/IvVLg3GcZdQnkxbu5H+ZO9Oi5bG1+YNTL4xlbnMPBShfk8aLrABHuiEmnhgwDudkYRON5EPZhV9tgDgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hA0MG2B2; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746879902; x=1778415902;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dBM+UQUeSxwYoT1mtG3LFK5m6GtQWea0C8sEsFnQpNU=;
  b=hA0MG2B2TjC4F5E8btKSKNR/KuOnsHnEYO3+FWmgQPT3KnU5RBPxQ4EI
   X/v3C4ttLZ4PJMzQBcSzekA7+sLJQYh7GE7V6z7D8VXFEhB6Pub5CBerp
   gbJCLJg46Zh5Vv7m9AzHZWw5BZ8PyqYqpf55JkAehIKuuAo1aDelLCJFu
   3+oKgR+/6g8U3frkp8Mgn7Jvr1ucPlhruvs3GQmAQrnxmWjnI9fbkbtiA
   ln9ck5vvLiIkKKDYeNyubJoeJbb7BAOYXWwfWvvTYfvPwl+JU89ayXDET
   nppHvbHHCIz0aW9XomBTovrLq210dJnfVcsNzR2bJIN54pB0g9M5cbkOT
   g==;
X-CSE-ConnectionGUID: NU6fWAs2QKWL67F3IDflSw==
X-CSE-MsgGUID: h/5B4pmRQWOBlRh98Lqx9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11429"; a="59705264"
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="59705264"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 05:25:02 -0700
X-CSE-ConnectionGUID: fB356A56TP6UeI27QfM8ag==
X-CSE-MsgGUID: tJ2DatS3THe0rJ0z0KpBTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="140940742"
Received: from agladkov-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.64])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 05:25:00 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3D4471201BC;
	Sat, 10 May 2025 15:24:57 +0300 (EEST)
Date: Sat, 10 May 2025 12:24:57 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathis Foerst <mathis.foerst@mt.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 07/13] media: mt9m114: Update hblank and vblank defaults
 on pixel-array format changes
Message-ID: <aB9FmRpF0-npP1O0@kekkonen.localdomain>
References: <20250504101336.18748-1-hdegoede@redhat.com>
 <20250504101336.18748-8-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250504101336.18748-8-hdegoede@redhat.com>

Hi Hans,

On Sun, May 04, 2025 at 12:13:28PM +0200, Hans de Goede wrote:
> Update hblank and vblank defaults when the pixel-array format changes,
> to maintain 30 fps on format changes.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/media/i2c/mt9m114.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> index ba8b7660f88a..be3e7bb44ad8 100644
> --- a/drivers/media/i2c/mt9m114.c
> +++ b/drivers/media/i2c/mt9m114.c
> @@ -333,6 +333,10 @@
>  #define MT9M114_MIN_VBLANK				21
>  #define MT9M114_DEF_HBLANK				308
>  #define MT9M114_DEF_VBLANK				21
> +#define MT9M114_DEF_HTS					\
> +	(MT9M114_PIXEL_ARRAY_WIDTH + MT9M114_DEF_HBLANK)
> +#define MT9M114_DEF_VTS					\
> +	(MT9M114_PIXEL_ARRAY_HEIGHT + MT9M114_DEF_VBLANK)
>  
>  #define MT9M114_DEF_FRAME_RATE				30
>  #define MT9M114_MAX_FRAME_RATE				120
> @@ -1130,18 +1134,22 @@ static void mt9m114_pa_ctrl_update_exposure(struct mt9m114 *sensor, bool manual)
>  static void mt9m114_pa_ctrl_update_blanking(struct mt9m114 *sensor,
>  					    const struct v4l2_mbus_framefmt *format)
>  {
> -	unsigned int max_blank;
> +	unsigned int def_blank, max_blank;
>  
>  	/* Update the blanking controls ranges based on the output size. */
>  	max_blank = MT9M114_CAM_SENSOR_CFG_LINE_LENGTH_PCK_MAX
>  		  - format->width;
> +	def_blank = MT9M114_DEF_HTS - format->width;
>  	__v4l2_ctrl_modify_range(sensor->pa.hblank, MT9M114_MIN_HBLANK,
> -				 max_blank, 1, MT9M114_DEF_HBLANK);
> +				 max_blank, 1, def_blank);

__v4l2_ctrl_modify_range() may fail.

The problem isn't introduced by this patch but it'd be nice to fix it
(separately).

> +	__v4l2_ctrl_s_ctrl(sensor->pa.hblank, def_blank);
>  
>  	max_blank = MT9M114_CAM_SENSOR_CFG_FRAME_LENGTH_LINES_MAX
>  		  - format->height;
> +	def_blank = MT9M114_DEF_VTS - format->height;
>  	__v4l2_ctrl_modify_range(sensor->pa.vblank, MT9M114_MIN_VBLANK,
> -				 max_blank, 1, MT9M114_DEF_VBLANK);
> +				 max_blank, 1, def_blank);
> +	__v4l2_ctrl_s_ctrl(sensor->pa.vblank, def_blank);
>  }
>  
>  /* -----------------------------------------------------------------------------

-- 
Regards,

Sakari Ailus

