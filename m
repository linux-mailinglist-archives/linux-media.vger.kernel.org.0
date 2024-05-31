Return-Path: <linux-media+bounces-12369-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E418D6855
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 19:44:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A256E1F28B91
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 17:44:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 503A917C223;
	Fri, 31 May 2024 17:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jnTil/6J"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF7E1E4AD;
	Fri, 31 May 2024 17:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717177440; cv=none; b=Sn/jJSCLHfVMXiQ0jxohSibG05fpH1GnKKqQAmEE7mPS5xDBKEzRPvwzK5r5F7aLfgPUrROXOzF7GoGEfF/aIln11Hfag7RP8/JigrlOkOklLXsYsn4gUwRXdLAftLaexgCRniafPqmpiq7D14J2qAgYDFcO3WvxzPcF8A5FnwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717177440; c=relaxed/simple;
	bh=/Eq6jjMTe5hXojK4Xe9QdTwxwjf55ce8NuTAKC3uO8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R/YcFEjdcPZ4UUHOGaRKCQhKfpdCnf1KBNj1v1Fy2/3Mfb2AsgtKXaw/s0QCloKj6O+xVORRRXSJLBfUkNTPLEkc4E/JCLnngs9cj1XbGiYfpdJv1lpFga8jxBXrp3n0YmE1H3MkXGk/2q+tx/KT0Z0VTMiv/BOaXakG5zbI0zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jnTil/6J; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717177439; x=1748713439;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/Eq6jjMTe5hXojK4Xe9QdTwxwjf55ce8NuTAKC3uO8k=;
  b=jnTil/6JrhZzlASMqklClcMUKB84u2AYAcItXCRCj+lJzwUFE7I90n4L
   Dnie+E8Ujq2m7+NN7BiSWJHul+8jt5piFw+FIxJ9Md9cTBLfkyQ9W5gVe
   Bu6bNivLfzGXW8wN8b3GBQ9Mpry+p2g77CWzF46EVCloDt836hJthJPbF
   tw4i/UBEiFOzze8jOXSAAea9VMWKuSBKgJbNYgMZicU1JoxaZzURNypUD
   q8k4qaKD4ihtiX2hcmo/EzfP4QgcNIrAa54D1NpTFS3q/jmcdwE3rH7Gx
   CA5xFEMEasRmB0wQh8L+n2ctq7UfFT/1UIHtIs5E/NVarHx0Byz5chJ1s
   Q==;
X-CSE-ConnectionGUID: T92O5okWQW2phqRfuQKevQ==
X-CSE-MsgGUID: c5ihQazCQPGkpTGxufL9Cg==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="13855802"
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; 
   d="scan'208";a="13855802"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 10:43:58 -0700
X-CSE-ConnectionGUID: lK8G+GTRTF+gVjFfnTGmJA==
X-CSE-MsgGUID: uim22wo1SxuBhmVGD/DkIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; 
   d="scan'208";a="41307335"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 10:43:51 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sD6I7-0000000CXcT-340d;
	Fri, 31 May 2024 20:43:47 +0300
Date: Fri, 31 May 2024 20:43:47 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	benjamin.gaignard@collabora.com, sebastian.fricke@collabora.com,
	akpm@linux-foundation.org, gregkh@linuxfoundation.org,
	adobriyan@gmail.com, jani.nikula@intel.com, p.zabel@pengutronix.de,
	airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
	laurent.pinchart@ideasonboard.com, praneeth@ti.com, nm@ti.com,
	vigneshr@ti.com, a-bhatia1@ti.com, j-luthra@ti.com, b-brnich@ti.com,
	detheridge@ti.com, p-mantena@ti.com, vijayp@ti.com,
	andrzej.p@collabora.com, nicolas@ndufresne.ca, davidgow@google.com,
	dlatypov@google.com
Subject: Re: [PATCH v11 09/11] lib: math_kunit: Add tests for new macros
 related to rounding to nearest value
Message-ID: <ZloMU7U1ef1KG3QH@smile.fi.intel.com>
References: <20240531170229.1270828-1-devarsht@ti.com>
 <20240531171628.1306389-1-devarsht@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531171628.1306389-1-devarsht@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, May 31, 2024 at 10:46:28PM +0530, Devarsh Thakkar wrote:
> Add tests for round_closest_up/down and roundclosest macros which round
> to nearest multiple of specified argument. These are tested with kunit
> tool as shared here [1].
> 
> [1]: https://gist.github.com/devarsht/3f9042825be3da4e133b8f4eda067876

Make it a tag...

> 

...here

Link: ... [1]

> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>

With the same caveat as per patch 1,
Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



