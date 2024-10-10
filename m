Return-Path: <linux-media+bounces-19348-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E21D99887E
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2024 15:58:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 317E6285B95
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2024 13:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D44851CB510;
	Thu, 10 Oct 2024 13:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iDITFUEn"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55801CB33D;
	Thu, 10 Oct 2024 13:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728568688; cv=none; b=l7HyxflrK5sOyPnoHJPUnn/qfLd3QWMlNAYZFAKUyPYj1eqQE7B6JR0BdOXbUr4JcV3WEep5pVUYPrDTradezm9lXYchiOGkSXNHvbtkE3ZLJo9DQTBLCuvKc6YP0Xo9ocQmE6msQKE/0K7EKMt7x7RfVyoPEyaimiwTbzDp7WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728568688; c=relaxed/simple;
	bh=TgI9S0Go6bQ1y/AMbPaAoAXf2sCWa+z7YSynkKFtPaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OubP0TTIBXc4vLw4eRAc4ZLL9AGfIj9UvNbdhCU4mv+x5PflVaCopv1ZyK7TFmFtGMEfokrWLgU53rmAGolpCZl2jBGdIi4N6leFRiMOMkHR7DWKpAIvRl2UmRJsocXKKwBm17+maV0N3LLAbqU0gWEjFjjllHOzJBKMdq+hDY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iDITFUEn; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728568687; x=1760104687;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TgI9S0Go6bQ1y/AMbPaAoAXf2sCWa+z7YSynkKFtPaY=;
  b=iDITFUEn3gBLBQN2ie1OiYLmyi0OMZ1rmNRzy5bz9ymfvwsJrfFeHS5q
   oIbjrTNuGRfOnbQNB9bpM1o86S687JbHIFd05Eqs6IbZhGjZtjGvOFobe
   iqJQocmXgaEfN1gvDCuTggBRBNRZjW/oU3ffWO+PuU/Pcw3EJ0N/U8Q+k
   c/odVe9FdrB6tThYL+eragwhGVyMkyWtAobTB6fE/FYhG02I2T7Kw7v72
   BouQv+TROjFhLTh/zRk59uyZaG2YNoW8oa48NIB/njT0ZergcpDIfNnXF
   J2THlTdf5q85IX1Ss5Bua9aCtjcUJZxW2G/aXKVBIJNTxMxu8oTRKnzLr
   A==;
X-CSE-ConnectionGUID: UJMGMQvqSuecHLvzbMEJ7A==
X-CSE-MsgGUID: 0X3/FiO4TLemE2Hv52IOEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="28058728"
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; 
   d="scan'208";a="28058728"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 06:58:07 -0700
X-CSE-ConnectionGUID: 7mgKdkltQ7GCKQ48WgiJ+A==
X-CSE-MsgGUID: E6ziY75MSdmtcrlbFcFQkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; 
   d="scan'208";a="107440161"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 06:58:05 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sytg1-00000001YQw-36RB;
	Thu, 10 Oct 2024 16:58:01 +0300
Date: Thu, 10 Oct 2024 16:58:01 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jai Luthra <jai.luthra@ideasonboard.com>
Subject: Re: [PATCH 04/13] media: i2c: ds90ub960: Fix logging SP & EQ status
 only for UB9702
Message-ID: <ZwfdaeRkAc3PzKsX@smile.fi.intel.com>
References: <20241004-ub9xx-fixes-v1-0-e30a4633c786@ideasonboard.com>
 <20241004-ub9xx-fixes-v1-4-e30a4633c786@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004-ub9xx-fixes-v1-4-e30a4633c786@ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Oct 04, 2024 at 05:46:35PM +0300, Tomi Valkeinen wrote:
> UB9702 does not have SP and EQ registers, but the driver uses them in
> log_status(). Fix this by separating the SP and EQ related log_status()
> work into a separate function (for clarity) and calling that function
> only for UB960.

...

> +		dev_info(dev, "\tStrobe range [%d, %d]\n",
> +			 ((v >> UB960_XR_SFILTER_CFG_SFILTER_MIN_SHIFT) & 0xf) -
> +				 7,
> +			 ((v >> UB960_XR_SFILTER_CFG_SFILTER_MAX_SHIFT) & 0xf) -
> +				 7);

I believe the code is much more readable if those 7:s moved to the previous
lines. Btw, does driver use bitfield.h? And why not?


...

> -			dev_info(dev, "\tStrobe range [%d, %d]\n",
> -				 ((v >> UB960_XR_SFILTER_CFG_SFILTER_MIN_SHIFT) & 0xf) - 7,
> -				 ((v >> UB960_XR_SFILTER_CFG_SFILTER_MAX_SHIFT) & 0xf) - 7);

It will be even shorter in the new code!

-- 
With Best Regards,
Andy Shevchenko



