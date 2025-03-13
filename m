Return-Path: <linux-media+bounces-28121-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A2767A5F058
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 11:11:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FB633B4023
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 10:10:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CFB7265637;
	Thu, 13 Mar 2025 10:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T7VBDQao"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9816126560E;
	Thu, 13 Mar 2025 10:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741860654; cv=none; b=A6f3/CBrP3y3EeEG8Ayvfk+Xuz4eVBEb0ELxzDyd4IsZjAMoRIn1EMqSuZzVNU6hJkKe4iI9ZHW8SHYNSqzaICl3m6ARmYwF5/cUzKdQ/wGa8YPde72BVPk9ToGv/chj1wm8aVWiV/p6pvMs+EFM0cfUDTktYvmUAbbAfvDcBfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741860654; c=relaxed/simple;
	bh=iDTPmKsP/Dkh4u+cTW/Lgk7hf7SQS3xcNseBGE75wpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DMvVCQ7JQuuqW8lsl5DDQsmVxJLurEKfuPiTaIc2il2DpZK7hcuL0uVjcO1kfgNwrOAtC6RIEFQIlp2KYNpxV+af39dY80BW7jO2ZFGhqxJnp9GQgHVxdTbZYXmfLMrLMvM83P3biB2ah5VPq8HmDeJjtFH6HzHjfxCpGTWnAzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T7VBDQao; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741860652; x=1773396652;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iDTPmKsP/Dkh4u+cTW/Lgk7hf7SQS3xcNseBGE75wpE=;
  b=T7VBDQaoCp48ih/skMjiFRIXlxRD651cZjVuj+A7woEoEE7puaxcWdA1
   jDtpH44+AQXARl5gW9SvuQVTIwjg2hNUQyyvuNYAwiD+hvGnQgS+fdhxr
   Ds1PokSOBH/yjLHLugQJLPeqDFZR+tPgfJtylu1APuKNcyYwC3pWnuggg
   t11Syk9NKC7wn5ea5ZOBS1UfayTMtT4R+cX4FbujHC5aN+SXourYxQhLa
   NJz9/qM/Bc4yF45t5flUU8qbNxRw4csnIglLAIwfWzY+/S/mhS/VOfvQu
   snZ6czTiutpDqc6Wpi8SdjFQxYZZIIEmHe0LTogFGRcHmeTQLDPYdivMq
   Q==;
X-CSE-ConnectionGUID: /LA1ktMtRnaDfhFpb4O0Xg==
X-CSE-MsgGUID: YHGow8oHSf6BGun5+1DfLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="46873637"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="46873637"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 03:10:51 -0700
X-CSE-ConnectionGUID: QfouAGhmRcOb8ID6NJbPbw==
X-CSE-MsgGUID: 4EoC7DcFQ7W0MBVryaDIsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="151747890"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 03:10:50 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 96A2511F96E;
	Thu, 13 Mar 2025 12:10:46 +0200 (EET)
Date: Thu, 13 Mar 2025 10:10:46 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ma Ke <make24@iscas.ac.cn>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl, viro@zeniv.linux.org.uk,
	bartosz.golaszewski@linaro.org, benjamin.gaignard@collabora.com,
	hljunggr@cisco.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] media: v4l2-dev: fix error handling in
 __video_register_device()
Message-ID: <Z9KvJteBVuPE8Hrs@kekkonen.localdomain>
References: <20250313074318.305556-1-make24@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313074318.305556-1-make24@iscas.ac.cn>

Hi Ma,

Thanks for the patch.

On Thu, Mar 13, 2025 at 03:43:18PM +0800, Ma Ke wrote:
> Once device_register() failed, we should call put_device() to
> decrement reference count for cleanup. Or it could cause memory leak.
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
>  drivers/media/v4l2-core/v4l2-dev.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> index 5bcaeeba4d09..1619614e96bf 100644
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -1060,6 +1060,7 @@ int __video_register_device(struct video_device *vdev,
>  	if (ret < 0) {
>  		mutex_unlock(&videodev_lock);
>  		pr_err("%s: device_register failed\n", __func__);
> +		put_device(&vdev->dev);

Fixing this isn't quite as simple. The release callback is actually set
below so there's no release callback set for this device yet.

>  		goto cleanup;
>  	}
>  	/* Register the release callback that will be called when the last

-- 
Kind regards,

Sakari Ailus

