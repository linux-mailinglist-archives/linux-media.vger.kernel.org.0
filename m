Return-Path: <linux-media+bounces-31599-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D3BAA74BB
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 16:16:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF34C1C07416
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 14:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0244F2561DF;
	Fri,  2 May 2025 14:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N1B2bHmd"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24F4255F5E;
	Fri,  2 May 2025 14:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746195262; cv=none; b=Lym4MZe8afKW4IEw0g8IC5vHvaLomUSlFGUv65EMSG7yQfhOPkadI0MGFgPEOqaDOPxurS8BZNaB9yj83eywaMoOMP0NULR0Olm3XUOeLpyyeK3xc+0ZYpmR4q68zUq7twLHogWzBo4w8KLKhXUYlu5h5U19w9tzaWcKfbYMNAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746195262; c=relaxed/simple;
	bh=m6QjeTDmjEFVIOLoBxnDhIcTIAn+T1Yym8af0FkdhUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ogKmMv5bYy32vrmko6cvAViqBoLd3DFuHFe8AN0fF5bz3mR8VJIvY/sRZ4oLE6y/MZSDd2e1eViQPdzoYplT6JpFTZmiANbXK3mUy9V8Yr9WODLgdCiz02HNn1vXVpZB7nTIbQk3Q9Eh+Y45iWz/mzSu9a7y/O5Cx5fgdhKeXRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N1B2bHmd; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746195261; x=1777731261;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=m6QjeTDmjEFVIOLoBxnDhIcTIAn+T1Yym8af0FkdhUk=;
  b=N1B2bHmdRHYVJxjuLspl4lHNbTlTL0HmVbALhrUTJz6AXEAV1sACu5K3
   1mSDa0McEc2uqsw0X584Ipka4pwdYQ5sH7RPf4Uo/nr69l4l/nrbtx1FR
   IUurbqnPhlfHQAAe1PZrAKg+s3JfriPfzGQ9E4EU9HXDh/VYJEkys+Po+
   ydQLa6Nr6LgcLJjiXhgrsiPU24qhI8Eem7AhtSy8w3o/y2nFQMlUjUvd2
   ftilepix1tHIe4lrAEkOytUE0JWmkstN3/Gt3GB0pt/Gvg9kLCvKelhO+
   7XwxXnvJu0j5dOis414pAlRw8/NZwn/YqUYsNjXHRqJFa0rl+vASi/shf
   Q==;
X-CSE-ConnectionGUID: biGiGNgYQb+6u1fPyrD96w==
X-CSE-MsgGUID: 8QhSk6daSyCL3CJF7pMOLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="47135939"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="47135939"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 07:14:20 -0700
X-CSE-ConnectionGUID: U6cdrD1BQjy+FzNHh436kw==
X-CSE-MsgGUID: 6hLzPHLnTRqVpm7t8tnImQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="134611673"
Received: from smile.fi.intel.com ([10.237.72.55])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 07:14:19 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uAr9d-00000002Dla-0SwG;
	Fri, 02 May 2025 17:14:17 +0300
Date: Fri, 2 May 2025 17:14:16 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v3 1/1] media: v4l2-core: Replace the check for firmware
 registered I2C devices
Message-ID: <aBTTOLmILq7D-AZy@smile.fi.intel.com>
References: <20250313113115.359942-1-andriy.shevchenko@linux.intel.com>
 <Z9RkYCJ-ggJl2kn0@smile.fi.intel.com>
 <Z_UT8qKhF6R5VTan@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z_UT8qKhF6R5VTan@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Apr 08, 2025 at 03:17:54PM +0300, Andy Shevchenko wrote:
> On Fri, Mar 14, 2025 at 07:16:17PM +0200, Andy Shevchenko wrote:
> > On Thu, Mar 13, 2025 at 01:30:34PM +0200, Andy Shevchenko wrote:
> > > Replace the check for firmware registered I²C devices as the firmware node
> > > independently on type should be retrieved via dev_fwnode().
> > 
> > Hans, are you okay with this now? Can it be applied?
> 
> Is this fell into cracks? Also, can somebody harvest those pretty much simple
> one- or so liners that I have sent last week(s)? They all basically in a way
> about fwnode.

Any comments? Can it be applied?

-- 
With Best Regards,
Andy Shevchenko



