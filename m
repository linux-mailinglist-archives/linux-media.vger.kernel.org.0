Return-Path: <linux-media+bounces-31691-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E779AA8E8E
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 10:52:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91EEC1894470
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 08:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F9881F4C98;
	Mon,  5 May 2025 08:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S+biLN86"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304AF1F4623
	for <linux-media@vger.kernel.org>; Mon,  5 May 2025 08:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746435131; cv=none; b=HhvaM/0pHbOkJpuBPvgJcN5XLUGmXBO3lC+MRcqVmzMNVw/i7UPRQ27NiBlcD3/GG1wpqiekS4lh8LoKu2aopsbTPPAnsPZ/yIWd18A8YD9Wu4Taah089jwCcEkEPWc1e3KcK7vHce5DMIxkzZXnqv/jMk6nEIj8xOuwrpW8Ji4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746435131; c=relaxed/simple;
	bh=8STcb4Eb84k2BUUOT1ngKVMNSzaUdX/MO1GF5rAVkW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aIzXipSG8YxgsUct6bD1upNQvRUAh+u6C0nI6v1a7RqQ0xmZgMDgpDwGo+5L9eLfaa2eh6BUs1R5vcfaxF7L1nntIbn4lVVwRi7Qq4qCKHkaZ2yJ1HS00V/ILk/nUeMZgtv2tJIeiHpDj0JY3/Z9N74TmPX+pZrpGcGKCUlset4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S+biLN86; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746435130; x=1777971130;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8STcb4Eb84k2BUUOT1ngKVMNSzaUdX/MO1GF5rAVkW4=;
  b=S+biLN86aovNZ3v8eMdCRAepgqoxPWr1m6qYdCZr5b3ZPagj7G65vAMt
   eJ/GQmeO0D0S+Mdx9XqTteQdH54CfcTym6i0rImdfEr5KycvxKIHInYas
   SqHELEjFudeyfHte89bWw0qc9CN5Pm42CoXvr9k8jJdRvbxZVoxqsh8YR
   ZaoQvJFBQyFsOiTjNTfotwAB35GwoZCAFGKdEE+j1EL1vyVIWMQaXdggH
   g6wPSgUL4Ogq05D5ubeMiHZV9xLk5LtBmdaYFRfV/c4tFcX7rMDF0gHg1
   K5T37+FkWVabXIt4/eXYKBSck6tiiOEH350uD3eGt5BEFH85D9EXDo2V3
   g==;
X-CSE-ConnectionGUID: RbsuJkZITL6l/fPkjiE6Tw==
X-CSE-MsgGUID: UKmG843wS8KHf+zaLABpvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11423"; a="65438675"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="65438675"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 01:52:09 -0700
X-CSE-ConnectionGUID: aMcWogrSTyGJFcG7KP0HMQ==
X-CSE-MsgGUID: FqTURSCtTTqafbvUJFbx9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="139983920"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.252])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 01:52:06 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 525D41203AA;
	Mon,  5 May 2025 10:05:57 +0300 (EEST)
Date: Mon, 5 May 2025 07:05:57 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hao Yao <hao.yao@intel.com>
Cc: Arec Kao <arec.kao@intel.com>, Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>
Subject: Re: [PATCH v3 2/3] media: i2c: ov13b10: Improve code redability
Message-ID: <aBhjVeKADyv9nn0_@kekkonen.localdomain>
References: <20250312020713.687778-1-hao.yao@intel.com>
 <20250312020713.687778-2-hao.yao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250312020713.687778-2-hao.yao@intel.com>

Hi Hao,

On Wed, Mar 12, 2025 at 10:06:27AM +0800, Hao Yao wrote:
> Use mode instead of ov13b->cur_mode in set_pad_format.
> 
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> Signed-off-by: Hao Yao <hao.yao@intel.com>
> ---
>  drivers/media/i2c/ov13b10.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
> index 79c0280e42f3..2e83fc23f321 100644
> --- a/drivers/media/i2c/ov13b10.c
> +++ b/drivers/media/i2c/ov13b10.c
> @@ -1069,15 +1069,11 @@ ov13b10_set_pad_format(struct v4l2_subdev *sd,
>  		__v4l2_ctrl_s_ctrl_int64(ov13b->pixel_rate, pixel_rate);
>  
>  		/* Update limits and set FPS to default */
> -		vblank_def = ov13b->cur_mode->vts_def -
> -			     ov13b->cur_mode->height;
> -		vblank_min = ov13b->cur_mode->vts_min -
> -			     ov13b->cur_mode->height;
> +		vblank_def = mode->vts_def - mode->height;
> +		vblank_min = mode->vts_min - mode->height;
>  		__v4l2_ctrl_modify_range(ov13b->vblank, vblank_min,
> -					 OV13B10_VTS_MAX
> -					 - ov13b->cur_mode->height,
> -					 1,
> -					 vblank_def);
> +					 OV13B10_VTS_MAX - mode->height,
> +					 1, vblank_def);
>  		__v4l2_ctrl_s_ctrl(ov13b->vblank, vblank_def);
>  		h_blank = mode->ppl - mode->width;
>  		__v4l2_ctrl_modify_range(ov13b->hblank, h_blank,

Note that these can all fail. Please add error handling, as a follow-up
patch.

-- 
Regards,

Sakari Ailus

