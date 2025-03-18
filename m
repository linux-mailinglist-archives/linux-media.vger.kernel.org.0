Return-Path: <linux-media+bounces-28417-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D3CA673D3
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 13:26:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE91218902F4
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 12:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C13EA20C03C;
	Tue, 18 Mar 2025 12:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dsPH6kgE"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E6E20AF88;
	Tue, 18 Mar 2025 12:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742300724; cv=none; b=r249IgTNj5KlmwxAThEiys6CSOaH7a6ig0lYSxskQ+b+DnmEEzAgH07k0hJQNPVXa7smCAdHm4dx8CRTLLLsRCkWk5WSN91CRHf9SrdxrOPGt4pQomwej3dNVTaxFR7P2OvZ1hZfZ2zlxGBdyf/OcI+ngsD5ZZanK/WoCuUlLY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742300724; c=relaxed/simple;
	bh=zi9dRxN+ND2jyyw2oSzr+LnlgDS15RwIOE2rJL1EGko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a4lZ2M1pgubltIhPHdVTp0ZnZ4iDSoRO/AAup8E2iX4SCxkFydbdJ/uX/+yqRBDjID44GLYs/vMn1lzVjna5mdRvwWgy1zEWkpKl/lUCNzrTtHWCOyLpxjvt5pm4powQ2SB1dUDl3Gi+nKS/6m8tnvaBVEu+R+HOAdHXjNSsvZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dsPH6kgE; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742300719; x=1773836719;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zi9dRxN+ND2jyyw2oSzr+LnlgDS15RwIOE2rJL1EGko=;
  b=dsPH6kgEvp5PpFJSvv+JOJUmS51puB0selDH74+ATNKW7QeYGJE1Mi/y
   MhkELi4dxQ5aHsVgnlqi2ZxIeDf53aU0KvdW+ZH3e0dth7gHPrM/8TWuY
   DWi1s50DcjkMLg3/oZD2X5xMCEkHxOX2rMn0C+IOyBJLJvSA7C7Q+mKke
   N9n/mOlryX1w0Gv3DZPqPVuQuQuMTFpKl3vKfXwSAo4nfOyyDXXRHopgF
   xe2OuRNNusSTMgJs4N0nRVXcat/zUl3a39Z6/pNwd/Xd8kx6oT2KaBxJ4
   16iB/iKEq8EtioofSBkL4qe2bMSHn9rPzYhs2KHsYoJ66+3rtKZhl/sfA
   A==;
X-CSE-ConnectionGUID: 14pXo24dR1u87A59QMImcQ==
X-CSE-MsgGUID: ef4KWIdkSoC1wFAjdC4wYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="46202274"
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="46202274"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 05:25:18 -0700
X-CSE-ConnectionGUID: 5q7OoIhAQkigPw2DVYglwA==
X-CSE-MsgGUID: xGJhRqnWRhe+NPCOQEEE+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="126904270"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 05:25:15 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 4604411F74E;
	Tue, 18 Mar 2025 14:25:13 +0200 (EET)
Date: Tue, 18 Mar 2025 12:25:13 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ma Ke <make24@iscas.ac.cn>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl, sebastian.fricke@collabora.com,
	ribalda@chromium.org, benjamin.gaignard@collabora.com,
	viro@zeniv.linux.org.uk, bartosz.golaszewski@linaro.org,
	hljunggr@cisco.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] media: v4l2-dev: fix error handling in
 __video_register_device()
Message-ID: <Z9lmKWC-JlVo6Biw@kekkonen.localdomain>
References: <20250318090945.1655458-1-make24@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318090945.1655458-1-make24@iscas.ac.cn>

Hi Ma,

Thanks for the update.

On Tue, Mar 18, 2025 at 05:09:45PM +0800, Ma Ke wrote:
> Once device_register() failed, we should call put_device() to
> decrement reference count for cleanup. Or it could cause memory leak.
> And move callback function before put_device().
> 
> As comment of device_register() says, 'NOTE: _Never_ directly free
> @dev after calling this function, even if it returned an error! Always
> use put_device() to give up the reference initialized in this function
> instead.'
> 
> Found by code review.
> 
> Cc: stable@vger.kernel.org
> Fixes: baa057e29b58 ("media: v4l2-dev: use pr_foo() for printing messages")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
> Changes in v2:
> - modified the patch as no callback function before put_device().
> ---
>  drivers/media/v4l2-core/v4l2-dev.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> index 5bcaeeba4d09..4a8fdf8115c0 100644
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -1054,17 +1054,16 @@ int __video_register_device(struct video_device *vdev,
>  	vdev->dev.class = &video_class;
>  	vdev->dev.devt = MKDEV(VIDEO_MAJOR, vdev->minor);
>  	vdev->dev.parent = vdev->dev_parent;
> +	vdev->dev.release = v4l2_device_release;
>  	dev_set_name(&vdev->dev, "%s%d", name_base, vdev->num);
>  	mutex_lock(&videodev_lock);
>  	ret = device_register(&vdev->dev);
>  	if (ret < 0) {
>  		mutex_unlock(&videodev_lock);
>  		pr_err("%s: device_register failed\n", __func__);
> -		goto cleanup;
> +		put_device(&vdev->dev);
> +		return ret;
>  	}
> -	/* Register the release callback that will be called when the last
> -	   reference to the device goes away. */
> -	vdev->dev.release = v4l2_device_release;
>  
>  	if (nr != -1 && nr != vdev->num && warn_if_nr_in_use)
>  		pr_warn("%s: requested %s%d, got %s\n", __func__,

I think this still needs some work. E.g. v4l2_device_get() hasn't been
called yet here, but still v4l2_device_release() will call
v4l2_device_put().

-- 
Regards,

Sakari Ailus

