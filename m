Return-Path: <linux-media+bounces-28418-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED044A674D4
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 14:20:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D0A6188B913
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 13:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F0A820D4E7;
	Tue, 18 Mar 2025 13:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="czhU9c+x"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1B4AD2C;
	Tue, 18 Mar 2025 13:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742303938; cv=none; b=oeGpuDwHBg4RLt8oyFjPilS/PB5WpdCXGdlmBEjfMF7NNREabhB0BvitiuNMhRktmH5vRP7gJFYrTZO6EpqPfXLrEptbyOCRodt8eaB5gCL0y2HWcRuaU6w8PhZM59gCoTxSwjWLlNLWX2z2fE1v/yatiOVElyUe5DA73y5SA/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742303938; c=relaxed/simple;
	bh=3Oi8jiFqgl+aEYI1HZI2J5pcnohFtSR2tEqDeV0RWqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dlSEHilFg2PGoLhKl9zPHPlTWnNSmlWy/s6Rpi8ppoQwXKM1Z6us2n5dtyD8NHNxuwk25tiTZI3gBKYfMM8Bn0kQ4hECj9kql7YHh1jL9UUDWL31oIm3qelqm2TRJAjJzWQ1BAYznU42cT0oAwuPjn+X0zxS/lZanOoDdhhguWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=czhU9c+x; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742303933; x=1773839933;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3Oi8jiFqgl+aEYI1HZI2J5pcnohFtSR2tEqDeV0RWqU=;
  b=czhU9c+xjanu8QqHL7xX8wt4597RTKbcVbxPT03hMDW36Dhp2RLzeZoK
   PO2UNSBu25Txpzu7BWaNYSZ/w7zYds0CFJYcxhbpFZHQvQcSk8OrpJpmw
   zte8yGNt8tu8A/lEZr1tqrBDC885NPQsgt0jLX+KdxNA1ZpiBQ9EGbQCH
   ue/E/rSgMXXL3WhN4ZuZ9ZjYsxGtJA5uK4Whs3hrhvjiEOfn9iDW458kI
   cvbXgM37M7AIK6SOlSQrpkAu3GtTertXSHqxCsfP4PTT49nLkXtcA/Dvc
   nKilIGjOjYwi0NYNHlQMPM1siWmRKjDLrIgaBF9ZKiNuJ5ssn1jL8BBX1
   g==;
X-CSE-ConnectionGUID: f9+2qQVZQ1W+sE3Nr6tQ3A==
X-CSE-MsgGUID: +m7ZGvrESMeY85Ft4NT6TQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="43359897"
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="43359897"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 06:18:52 -0700
X-CSE-ConnectionGUID: glzh0WzESBmuMqdayJU9ew==
X-CSE-MsgGUID: oaV8qNn3QgKXR5Bk48/n4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="122231949"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.112.43])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 06:18:48 -0700
Date: Tue, 18 Mar 2025 14:18:45 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Ma Ke <make24@iscas.ac.cn>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl, sebastian.fricke@collabora.com,
	ribalda@chromium.org, benjamin.gaignard@collabora.com,
	viro@zeniv.linux.org.uk, bartosz.golaszewski@linaro.org,
	hljunggr@cisco.com, sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] media: v4l2-dev: fix error handling in
 __video_register_device()
Message-ID: <Z9lytZ0bOk4Fjk83@linux.intel.com>
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

This tag does not seems to be right, the commit just change printk calls.

Regards
Stanislaw


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
> -- 
> 2.25.1
> 
> 

