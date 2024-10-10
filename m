Return-Path: <linux-media+bounces-19347-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC636998871
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2024 15:55:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 578B1B28CAC
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2024 13:55:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0D081C9ED0;
	Thu, 10 Oct 2024 13:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RAS2eGlg"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C5C1C2DD5;
	Thu, 10 Oct 2024 13:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728568517; cv=none; b=khkWT0KO9IRwA+CgflRky9sYVjMUIMGD5eBkU/6R31dvY0Uxpssqs1mKM6+sX7mYZzQGX0/Nu98LT38ZqBhfQh0Pux/psBrXbg9JIKIuTlYOxkWb6kFMK4qwE8sGwolSp95T7AGtEB9PYrBTChf/N9tbEOtEFj8oGWBLteKkznU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728568517; c=relaxed/simple;
	bh=DTL5ztx2b+NpQq3sdrbksGVgSsewmzJdp2pI7oNZdrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VXX1cioe/OsHMWEbZYKQ7UnD224mdpQx1Dt6fK8N42KZ+wYhOp2Eoqh+tSvGzb+n+oSnb6YlPHDgdAfz9PdFQjfMThVGwTjrLbIlLHKP75oO+SaJEsuWr9IRMcmJb3KKKi6yh7/d+lTiJi//Eu+/FL0L7EiVQUOGxij7Rq4LKsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RAS2eGlg; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728568515; x=1760104515;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DTL5ztx2b+NpQq3sdrbksGVgSsewmzJdp2pI7oNZdrg=;
  b=RAS2eGlgh2TyKKMsPODp/OscrV3cqB/+mXjsd/IZ9BLeZuU8NxzgqcdB
   6bG4l5FrG4/m+J6UPeMQxFtM3dwwwxIQdajvVK3oPzFwitrBcm+a5rX2v
   qjGdCE6rbLCV8UFkY+MCT8RVVW7MZ6u5IQuVKxDACM77dVSpZs5ItRvoG
   Jb9TC/HY6jOmkx3Oc18kBFdC1vPhVCDosoNiLhXebN6u6eG1PdKvLS0yJ
   savCZNpAqZDs0xyRRscYq2dfeNZZwCTYQ8Q2OQmzzE4CzY0H5FIDBtsN2
   GNf6Gt/uRcxpm4SNcM2nL72pwRPXoOQfHneSaTmaE9/diRA+x09MxG/8u
   g==;
X-CSE-ConnectionGUID: cFQJZ1+jRZaIMufacs9rdg==
X-CSE-MsgGUID: IC7/IoFmSLSj3BUzp7qBKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="39315724"
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; 
   d="scan'208";a="39315724"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 06:55:15 -0700
X-CSE-ConnectionGUID: 4i93k9QyTm2eDV0LpAD6AQ==
X-CSE-MsgGUID: MU1tYFPrRLy0lwSsj/iiDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; 
   d="scan'208";a="99933403"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 06:55:13 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sytdG-00000001YN9-2fV0;
	Thu, 10 Oct 2024 16:55:10 +0300
Date: Thu, 10 Oct 2024 16:55:10 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jai Luthra <jai.luthra@ideasonboard.com>
Subject: Re: [PATCH 03/13] media: i2c: ds90ub960: Fix use of non-existing
 registers on UB9702
Message-ID: <ZwfcvuRRWO5oN94C@smile.fi.intel.com>
References: <20241004-ub9xx-fixes-v1-0-e30a4633c786@ideasonboard.com>
 <20241004-ub9xx-fixes-v1-3-e30a4633c786@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004-ub9xx-fixes-v1-3-e30a4633c786@ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Oct 04, 2024 at 05:46:34PM +0300, Tomi Valkeinen wrote:
> UB9702 doesn't have the registers for SP and EQ. Adjust the code in
> ub960_rxport_wait_locks() to not use those registers for UB9702. As
> these values are only used for a debug print here, there's no functional
> change.

...

> +		if (priv->hw_data->is_ub9702) {
> +			dev_dbg(dev, "\trx%u: locked, freq %llu Hz\n",
> +				nport, (v * 1000000ULL) >> 8);

Perhaps HZ_PER_MHZ?

> +		} else {

...

> +			dev_dbg(dev,
> +				"\trx%u: locked, SP: %d, EQ: %u, freq %llu Hz\n",
> +				nport, strobe_pos, eq_level,
> +				(v * 1000000ULL) >> 8);

Ditto.

> +		}

-- 
With Best Regards,
Andy Shevchenko



