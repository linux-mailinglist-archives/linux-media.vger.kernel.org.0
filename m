Return-Path: <linux-media+bounces-22344-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B884A9DE728
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 14:22:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 510371622AF
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 13:22:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 418C319DF99;
	Fri, 29 Nov 2024 13:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WtkelygA"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E2B18952C
	for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 13:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732886563; cv=none; b=ZEQ3ElFoEspoelv3u4wSF+ztiK4WB3kgEYxFe5kyTRx56L4lvGe9lEdXZa0KwpT8R50BBU9Ky1WRIG0T/cUSt2h75VFFy9wqKBFyWHxVkmJvmhe6vxs3SUTdNmg+W0w3S7yQsyA3jmzDYT6Ernuc2RxtBpJsAc3Hy47aixfHK2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732886563; c=relaxed/simple;
	bh=ZAncUBCPTq1Qk4SbybBVY7REqKo7hs52uG+Zwnk8u8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WIrdtecwJ6eoFb5wr9mmBpy1ldGIGL+yIWGtHVUuofQZ5JnVdE3SBvgpTXNW2kbt/JYHq3+mVfZB5jWegRjCdgfEcilXOJ4p/YGpIDiw+cAQBJzRRvoD9EtjlLFSkfV0YaQmpwd/7qBXhP1H8BEJXjRwogI5ZsKxUcN0beNzfYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WtkelygA; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732886562; x=1764422562;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZAncUBCPTq1Qk4SbybBVY7REqKo7hs52uG+Zwnk8u8w=;
  b=WtkelygA68wAEOvWTdjDrZhwhG7QXxN4pMxGSGCb4cZXMLOdjNjRuYr6
   A/ULeIKW0PV0IymF6fg8ZCuKIPfvqbkb2hOu8bSgzfIdr1mlVhUWz/Qxx
   /bsK1rnU8FsfrPXd0UF52YYzO9/80nmC+RiIGMMUWhS8ie/+YEDEUqqQX
   DH85fuGVxHtaGAcfBE4sDPb/Eo4+ToonygZxqP8NGQmfO2eXIvlnpTysn
   RgUL8rOL8Da/GEUun7XU9lVlbmoCUfOMfzwAVNUXrcXUmp4xj3CtbWnx1
   aeKwYT3Aiqb62eNPja5lGfnOESiRCv2nZ5Br0ol3DmDJ72mR9xbb6Dcs9
   A==;
X-CSE-ConnectionGUID: SV09HrYuRfmonNLJibDdsw==
X-CSE-MsgGUID: R4zepCCnShS3MyBFeIty4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="37054672"
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; 
   d="scan'208";a="37054672"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 05:22:41 -0800
X-CSE-ConnectionGUID: Ll1ahfW+Q229OjFCA7hMZA==
X-CSE-MsgGUID: OtzBh/qcT9+WTNeeea6DeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; 
   d="scan'208";a="92399719"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.246.8.237])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 05:22:40 -0800
Date: Fri, 29 Nov 2024 14:22:37 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 1/4] media: ov2740: Debug log chip ID
Message-ID: <Z0nAHYQWAp+hFkks@linux.intel.com>
References: <20241128152338.4583-1-hdegoede@redhat.com>
 <20241128152338.4583-2-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241128152338.4583-2-hdegoede@redhat.com>

On Thu, Nov 28, 2024 at 04:23:35PM +0100, Hans de Goede wrote:
> Calling the identify function may get delayed till the first stream-on,
> add a dev_dbg() to it so that we know when it has run. This is useful
> to debug bring-up problems related to regulators / clks / GPIOs.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Tested-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

> ---
>  drivers/media/i2c/ov2740.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
> index 387c529d9736..e7a611967b40 100644
> --- a/drivers/media/i2c/ov2740.c
> +++ b/drivers/media/i2c/ov2740.c
> @@ -644,6 +644,8 @@ static int ov2740_identify_module(struct ov2740 *ov2740)
>  		return -ENXIO;
>  	}
>  
> +	dev_dbg(&client->dev, "chip id: %x\n", val);
> +
>  	ov2740->identified = true;
>  
>  	return 0;
> -- 
> 2.47.0
> 
> 

