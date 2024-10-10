Return-Path: <linux-media+bounces-19350-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E2A99888B
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2024 16:00:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 809A81C234D7
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2024 14:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3D161CB527;
	Thu, 10 Oct 2024 13:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dAZfvjN/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C216A1C9DFC;
	Thu, 10 Oct 2024 13:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728568777; cv=none; b=X+AwF8HQMqmy3t9/Rjv1AM+nU9cNKqlghBsxkKQi35NaCi+Cyfi+SWMymZjnKI8tRTtHShZMspfQmMqLGZmy3jJEyq3xajSmMdqH5zKTvgIGMBw6t5lN8NoRpfRDmStZu2JlqJuyRX4zQx/pGqAaz56vbo2yj1EIZKyElGTpPD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728568777; c=relaxed/simple;
	bh=z241OsGhzwd4gLOzx2Fbf6xuPo9cZjnBqKUvmZf8G8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LGZQNH5nEo6vlAXXr7uVpBfClYCGNK5in5UhxMdZ/JFKiCrfxF5ixv2Zc+ZS+6eqF0yI0/ly72RmrcnBKSzbxZkecudimsNHygkn8fckL9j24HHWUnuJVk7ezQSJoi0rpdGj/DloIeGzutq+y+CBFpdSZnnhnBgQ0lfDA7cfIPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dAZfvjN/; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728568776; x=1760104776;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z241OsGhzwd4gLOzx2Fbf6xuPo9cZjnBqKUvmZf8G8s=;
  b=dAZfvjN/Yodi6T35aDrERABbVNylcDt52lAyGNuwZesj7L57/rWTJuct
   vC2xuwvyGo6qPkWFJmTedNKSsuixGgwi0Vkpt/5MSIHG6zSUldRI9fJWQ
   qXfu+DXOIfLgxY4dLkwY2tMd4eorrJolp4NWejDqy0+0wfmHzgdwoNuSQ
   PhPa8E15IVmozxZivLll9xJnhRbbKcRXrfhLB64J4lc3+uFVbToj/u/ro
   4+mTXlDZ6WSWgPA/iKrB9Li/w8MOfq91HkQxIrxAjHH8tZ8BzYgBcDb/Q
   Wk4QQ3zWw12X2BivO/Hz6LjD836ZqybHXzd5SUd/suGmZoIFQbY8KfjAx
   w==;
X-CSE-ConnectionGUID: axJt2bThQf6viN1cxhjfoQ==
X-CSE-MsgGUID: SNdL+9YEQEGwBCA0MHsq1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="28081251"
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; 
   d="scan'208";a="28081251"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 06:59:35 -0700
X-CSE-ConnectionGUID: lwOEzoBZSNOMIIyOI8PGdA==
X-CSE-MsgGUID: QwlwpABySz+PQGyqiq7Q2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; 
   d="scan'208";a="80599789"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 06:59:33 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sythT-00000001YS0-05kD;
	Thu, 10 Oct 2024 16:59:31 +0300
Date: Thu, 10 Oct 2024 16:59:30 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jai Luthra <jai.luthra@ideasonboard.com>
Subject: Re: [PATCH 06/13] media: i2c: ds90ub960: Add support for I2C_RX_ID
Message-ID: <Zwfdwn1J9DDSrHjc@smile.fi.intel.com>
References: <20241004-ub9xx-fixes-v1-0-e30a4633c786@ideasonboard.com>
 <20241004-ub9xx-fixes-v1-6-e30a4633c786@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004-ub9xx-fixes-v1-6-e30a4633c786@ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Oct 04, 2024 at 05:46:37PM +0300, Tomi Valkeinen wrote:
> Normally the driver accesses both the RX and the TX port registers via a
> paging mechanism: one register is used to select the page (i.e. the
> port), which dictates the port used when accessing the port specific
> registers.
> 
> The downside to this is that while debugging it's almost impossible to
> access the port specific registers from the userspace, as the driver can
> change the page at any moment.
> 
> The hardware supports another access mechanism: using the I2C_RX_ID
> registers (one for each RX port), i2c addresses can be chosen which,
> when accessed, will always use the specific port's registers, skipping
> the paging mechanism.
> 
> The support is only for the RX port, but it has proven very handy while
> debugging and testing. So let's add the code for this, but hide it
> behind a disabled define.

...

> +	for (unsigned int i = 0; i < 4; ++i)

Why pre-increment?

> +		ub960_write(priv, UB960_SR_I2C_RX_ID(i),
> +			    (UB960_DEBUG_I2C_RX_ID + i) << 1);

-- 
With Best Regards,
Andy Shevchenko



