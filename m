Return-Path: <linux-media+bounces-28843-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AD8A72E31
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 11:51:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE0FE3BD550
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 10:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16D4220F097;
	Thu, 27 Mar 2025 10:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RBkw9r1W"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D443520E708;
	Thu, 27 Mar 2025 10:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743072552; cv=none; b=lq2T2ioHW2AXOgWzVqBXpVVjjAJHzSV5ntejYDx7kx6Pw7i4GPTZkITkGmgtmmlhkjXY0Jh2FpxExX7ZQPvdRTqpys0rJ5Kue/LdDdSFxzUS61YtgBZ943AZ8oNVNTBH6fnMrBr1q6Rn1gnHOM/NtSsqfYZFZ2wNL2trXSfMTR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743072552; c=relaxed/simple;
	bh=P3x1nC7kSQVvmwQm9Ec9eNMVj34oIiVnU6SzBUoQOaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RoUt8iF/TJlB51HquPTaQPs8kUi6NzazhKa5xa7e0b5whCb0wtCTDdWkEn27ar0JL0z/h7R371F7vakMS0kJ/FzHxSEC9CPkrY11buknsCJ1l3O2HMz2nh9z+SbV7MnlFCWj9WNhOQNjI/YkVZ9tbOiewa8oiXzJ9i8R1+d0h+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RBkw9r1W; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743072551; x=1774608551;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=P3x1nC7kSQVvmwQm9Ec9eNMVj34oIiVnU6SzBUoQOaM=;
  b=RBkw9r1W+hLGSvhZjwmHk4ALFh6Vyfllm4OfYjE72K2B2Pkk9Wv0KWN7
   qXjl8eskl4EIkHR3i/hU3sVJGTKA6wgw//sQcP/VX5YRid2TAleMEyQYs
   NQceqGDavyzL7cYDOW7hBObeA7DargmjLlohtzCQW6Q7h/qZJ/WxFhPg3
   VRDdNK6DvJz5hIpoTvvbXZmu3CpICvsLfhFvNuAlhtw9n2gFq3gwnCfGg
   /21juPh1ThcnTD3GU+t0+K4wmu+GPAZYg0ojktVZiyZEn8np45A6lbOsq
   rcN+RaymDhHZ6ZMBpK9K5pzULzPHxkEyoiCYH0FI+xzFNpZEmVIHcfnXd
   A==;
X-CSE-ConnectionGUID: zfYcrfCYRzyNcqeTlttrMw==
X-CSE-MsgGUID: FNO3cuOsQ4qXw7KNEQPnDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44286117"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
   d="scan'208";a="44286117"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 03:49:10 -0700
X-CSE-ConnectionGUID: tjidnPEJTvGDfz226/1LtQ==
X-CSE-MsgGUID: 92b+NNZ4TeedXS7yQPAKgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
   d="scan'208";a="125617787"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 03:49:07 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id F037C1201BC;
	Thu, 27 Mar 2025 12:49:03 +0200 (EET)
Date: Thu, 27 Mar 2025 10:49:03 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ma Ke <make24@iscas.ac.cn>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl, sebastian.fricke@collabora.com,
	ribalda@chromium.org, benjamin.gaignard@collabora.com,
	viro@zeniv.linux.org.uk, bartosz.golaszewski@linaro.org,
	hljunggr@cisco.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v3] media: v4l2-dev: fix error handling in
 __video_register_device()
Message-ID: <Z-UtHzeewV-CvzfD@kekkonen.localdomain>
References: <20250319080248.1746847-1-make24@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319080248.1746847-1-make24@iscas.ac.cn>

On Wed, Mar 19, 2025 at 04:02:48PM +0800, Ma Ke wrote:
> Once device_register() failed, we should call put_device() to
> decrement reference count for cleanup. Or it could cause memory leak.
> And move callback function v4l2_device_release() and v4l2_device_get()
> before put_device().
> 
> As comment of device_register() says, 'NOTE: _Never_ directly free
> @dev after calling this function, even if it returned an error! Always
> use put_device() to give up the reference initialized in this function
> instead.'
> 
> Found by code review.
> 
> Cc: stable@vger.kernel.org
> Fixes: dc93a70cc7f9 ("V4L/DVB (9973): v4l2-dev: use the release callback from device instead of cdev")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus

