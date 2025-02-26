Return-Path: <linux-media+bounces-27036-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02117A4602D
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 14:05:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E72E3AFB47
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 13:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FD1D22173F;
	Wed, 26 Feb 2025 13:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g3438I56"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A94721B1A8;
	Wed, 26 Feb 2025 13:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740575028; cv=none; b=hYzOFd+5nD1LSAPXCTGzUly09dO8zLt0NcghyeD/YGIRSnGf9+AW+/+UCjOdSkFZOX3y3/A5SFCjo6pf2yiZxBTPu+uMLDsdaiAjuW9lHot88Q7kC/z79W+w/0I4P4AswIUzgP0+nbrbV05ZodaDO3jlLJ3SBTUncjVAFItrWzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740575028; c=relaxed/simple;
	bh=mKv7YBrc1HDYrnTjdnEPPLdoe5b6l7JfEKTBG8/pQR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HF+XYI3NNre9UBXD32H957Fs3m2tXVfemdTltlep5i1s6F2yTEVF5PwYVXuCO5Lf/a8LHXg12Vj0sw0uoILpk0kibUSaUekUbnOJcizlr61qGBzGJRVxMARvI4OP94kx0AG/pZTojBquRlkKbouZW6yqFgRDVR1AawvhAtPYWoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g3438I56; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740575027; x=1772111027;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mKv7YBrc1HDYrnTjdnEPPLdoe5b6l7JfEKTBG8/pQR4=;
  b=g3438I567+ELXqvIQX/nFVIH4YGMaoKAxud0u2hvTnf62/R9ZE5A/HQE
   t46lNOq6T/NgSCJqxiQZpgLDBGMwoie8SH68XXuVeE1i8zwPvaE/Pu27X
   ++szGtDfmNgFgNxW5N72cDEo1PJAlo+ke22Pr1r0RGBguJyRIgJWKpVOZ
   4H6vQqen5T0KaURWCSYvAuH/593f6hNJhXdGhdCOhbWRtb//Hgnr4G4Dt
   BY7pcBg+GPQcqXsbnzvIycMz6mVCE/NZJas2mddI3abSpRaPKsJlSHU18
   gEjyXs8N/cMzeZTudQTyAE4HdF/yIkExYuQ3zjjvKradpW5Gfj/BrQ8dQ
   A==;
X-CSE-ConnectionGUID: uY/tHS1eQFid0axOifui+g==
X-CSE-MsgGUID: VzTqIO1UQnqeLyQoLCXUTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="63882142"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="63882142"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 05:03:47 -0800
X-CSE-ConnectionGUID: lFonP+8URSeQu7LUa4uipg==
X-CSE-MsgGUID: cR+O4uRqQVqyKd3/uyLPAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="121302329"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 05:03:45 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8F03E11F944;
	Wed, 26 Feb 2025 15:03:42 +0200 (EET)
Date: Wed, 26 Feb 2025 13:03:42 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Qasim Ijaz <qasdev00@gmail.com>
Cc: benjamin.mugnier@foss.st.com, sylvain.petinot@foss.st.com,
	mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: Replace nested min() with single min3()
Message-ID: <Z78RLvljBbiaHqtm@kekkonen.localdomain>
References: <20250225125937.20413-1-qasdev00@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225125937.20413-1-qasdev00@gmail.com>

Hi Qasim,

On Tue, Feb 25, 2025 at 12:59:37PM +0000, Qasim Ijaz wrote:
> Use min3() macro instead of nesting min() to simplify the return
> statement.

Going forward, for this driver on subject:

s/i2c/vgxy61/

as this is a driver for vgxy61. I've done that this time.

-- 
Regards,

Sakari Ailus

