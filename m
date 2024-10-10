Return-Path: <linux-media+bounces-19354-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2F49988B7
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2024 16:05:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 292321C235D4
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2024 14:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BF371CB309;
	Thu, 10 Oct 2024 14:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ly0IpkVg"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F0D1C8FD9;
	Thu, 10 Oct 2024 14:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728569102; cv=none; b=md7Mn8hIzeJwcN/lHu/bntgv5NLCzyMfXozph8LpA4Ix824rPu/l+oUrQU8TKggw3SXepK0JY/+/UJPm2ij8UIPTDYaQ13ep+Ht1NyYD2MLPm2ljrDPfZ7/s4N6DPbwON6s2QPbf7xX7rWd+FZc3JEG5Ti24LqZymgZgvcr02tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728569102; c=relaxed/simple;
	bh=qlFazhdY3LadMTqM1gppptyJCxhnz9Bj7jrDqYnr8DU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VvVPRiFUsJvUBlLlMlnFRfXNNsGJZVXNcMOLoci93KhNTiYdIm1OWSq8zkENEh5L2yIYimtOENJHkPCu4MkNY2sHekZJMfVmtGZ2tNoxNFN5mTJ/vONt0dLfObdUUPk7CkM/U70npBIw+QyRtXaGbl4KECP4vg8pINJ/fKHFh7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ly0IpkVg; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728569102; x=1760105102;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qlFazhdY3LadMTqM1gppptyJCxhnz9Bj7jrDqYnr8DU=;
  b=ly0IpkVgOpEjzaX6eFwJj5Y4DHnY+mBG0J9T6tif/8rBinxcWA7oKaZL
   Te2uoO5WKHS33+aCZd8WDc6n+ocrdGE8bA/VcyLmt3f1h5fAg6nOcxg45
   2Z6v04IsZ2wL2haZkiSxHI7l/pFpHRKawk9vACePHmuVr1sw7KUG8102w
   B1Va6icsE+Cn9c+J2eRmpkR1DzhNf8kFoNcvZq8+RGoRmpAgm5yjLjLOk
   n5ib+cSI7R21PJlfh3IoFunbxBLV0wIkhOMHUBZaNnFnGh3XvQ8FzaG5B
   TcUllFjhtamkMPwOgMsLohssBiKx84QsYuOX3kVIZfX2xU8wMQiOWB19S
   Q==;
X-CSE-ConnectionGUID: 0px18HJtRBOLCYBItyOdcw==
X-CSE-MsgGUID: 6wD5H2TaQKaJdsj3MiSB0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="45405315"
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; 
   d="scan'208";a="45405315"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 07:04:35 -0700
X-CSE-ConnectionGUID: ll8uRov0QiS8jjNodzd4dQ==
X-CSE-MsgGUID: twNYhGoYQO6yvY627aAYsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; 
   d="scan'208";a="77088342"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 07:04:33 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sytmI-00000001YWx-0cCl;
	Thu, 10 Oct 2024 17:04:30 +0300
Date: Thu, 10 Oct 2024 17:04:29 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jai Luthra <jai.luthra@ideasonboard.com>
Subject: Re: [PATCH 12/13] media: i2c: ds90ub913: Add error handling to
 ub913_hw_init()
Message-ID: <Zwfe7V_rV3Xyxp31@smile.fi.intel.com>
References: <20241004-ub9xx-fixes-v1-0-e30a4633c786@ideasonboard.com>
 <20241004-ub9xx-fixes-v1-12-e30a4633c786@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004-ub9xx-fixes-v1-12-e30a4633c786@ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Oct 04, 2024 at 05:46:43PM +0300, Tomi Valkeinen wrote:
> Add error handling to ub913_hw_init() using a new helper function,
> ub913_update_bits().

...

> +	ret = ub913_update_bits(priv, UB913_REG_GENERAL_CFG,
> +				UB913_REG_GENERAL_CFG_PCLK_RISING,
> +				priv->pclk_polarity_rising ?
> +					UB913_REG_GENERAL_CFG_PCLK_RISING :
> +					0);

So, you can use regmap_set_bits() / regmap_clear_bits() instead of this
ternary. It also gives one parameter less to the regmap calls.

> +	if (ret)
> +		return ret;

-- 
With Best Regards,
Andy Shevchenko



