Return-Path: <linux-media+bounces-33392-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26162AC4044
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 15:24:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2150188B9A5
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 13:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C31D81F4C96;
	Mon, 26 May 2025 13:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bh6oT24+"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3946C7483;
	Mon, 26 May 2025 13:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748265874; cv=none; b=p7AzkqGKg3m63OB7SFU9Y5ebYatnm4UQX0xxS/XMHR5WcjhFFup+lWP+4zVOJyjdzP/iV3Pqd872JSXBWfb8u92s6Nf5yab2cUElMDBw+wrj40wp0ZmxT69+OLOSpjX9N6401pQDmNmguTCvWceLB8elShTBkRQeddf+WYRA3mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748265874; c=relaxed/simple;
	bh=osVsQrSYzdvef7/iUa+Or5IvPPYVb5WN4ATbcQpHmJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pSXzqeX+MmORiwB7UOwrQas9DJws1J0T55X7G09Hcp98c62VU1rjakR0lMz9DQf+sXZJqXpCTz7akR4F9p1Tn7ZVi6myDzdGxxfp89j3XfJJViP/7cjx+cKsfJ/EcoskjVnktokUFnn27h6HpRaxYuQcBt4HmfhusU8OYmczKBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bh6oT24+; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748265872; x=1779801872;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=osVsQrSYzdvef7/iUa+Or5IvPPYVb5WN4ATbcQpHmJI=;
  b=Bh6oT24+KRJFeZ16ERJK9nTXyDMjI/Wr+7WwrDrf+NprOGanFh8JNmRE
   EOKemGd2Zh+2ruueBfHvR6D9mYyBPulitsIxOG6Ydd1M6B6+zUyZzS+Oq
   SeAJFwUN+H2/dx2WhwalTwfj+ay++CI5ITVWFdbViawXA6V+a5Co6VFFR
   mF78c63L92POgNOuAVS9lsOheeKfOBl9tv3ReYwT9eoDmGeA7SRB2HDvL
   YNdBECJB2/INQMMQ2EAPLT6S3ENs3RIXuv8r5J1CRV++mgSUlNS3p3LXF
   OIaDaxk4rD+n/l1qiYF+6JiIIv8MHvFHU4rqab7+fv4jKTk0EikkYDcdP
   A==;
X-CSE-ConnectionGUID: wakVJeRzQkSSc/zmctbZnA==
X-CSE-MsgGUID: fDmB/B7pQo23foPmIbrBig==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="50399316"
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; 
   d="scan'208";a="50399316"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 06:24:30 -0700
X-CSE-ConnectionGUID: oNfceUcwQBayUJ0E7hEkpQ==
X-CSE-MsgGUID: ARCWEYm6TSKL23rOyExWAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; 
   d="scan'208";a="146271278"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.125])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 06:24:27 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 4685711F732;
	Mon, 26 May 2025 16:24:24 +0300 (EEST)
Date: Mon, 26 May 2025 13:24:24 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Haren Myneni <haren@linux.ibm.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Andrew Donnellan <ajd@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Akshay Gupta <akshay.gupta@amd.com>, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, hans@jjverkuil.nl,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Lee Jones <lee@kernel.org>
Subject: Re: [PATCH 1/2] Documentation: Bump media IOCTL reserved numbers
Message-ID: <aDRriOnRfEYPeziC@kekkonen.localdomain>
References: <20250526111732.487229-1-sakari.ailus@linux.intel.com>
 <20250526111732.487229-2-sakari.ailus@linux.intel.com>
 <20250526114802.GD17743@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250526114802.GD17743@pendragon.ideasonboard.com>

Hi Laurent,

On Mon, May 26, 2025 at 01:48:02PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.

Thank you for the review.

> 
> On Mon, May 26, 2025 at 02:17:31PM +0300, Sakari Ailus wrote:
> > The Media Controller uses IOCTL numbers up to 0x81. Given that nothing
> > appears to be using them for other purposes, even in the samples
> > allocation (checked with $ git grep "#define.*_IO.*'|'"), just reassign
> > the numbers up to 0x8f to linux/media.h and bump the samples allocation by
> > 0x10.
> 
> The commit message should explain why. The explanation is in the cover
> letter, just move it to this patch. With that,
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I'll use this in v2:

The Media Controller uses IOCTL type '|' with numbers up to 0x81 while
numbers from 0x80 onwards are allocated for samples, creating a conflict
between allocations for MC and samples. Given that nothing appears to be
using numbers between 0x80 and 0x8f for other purposes than MC, even in
the samples allocation (checked with $ git grep "#define.*_IO.*'|'"), just
reassign the numbers up to 0x8f to linux/media.h and bump the samples
allocation by 0x10.

> 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  Documentation/userspace-api/ioctl/ioctl-number.rst | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
> > index bc91756bde73..6b3be3fb0b15 100644
> > --- a/Documentation/userspace-api/ioctl/ioctl-number.rst
> > +++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
> > @@ -312,8 +312,8 @@ Code  Seq#    Include File                                           Comments
> >  'z'   40-7F                                                          CAN bus card conflict!
> >                                                                       <mailto:oe@port.de>
> >  'z'   10-4F  drivers/s390/crypto/zcrypt_api.h                        conflict!
> > -'|'   00-7F  linux/media.h
> > -'|'   80-9F  samples/                                                Any sample and example drivers
> > +'|'   00-8F  linux/media.h
> > +'|'   90-AF  samples/                                                Any sample and example drivers
> >  0x80  00-1F  linux/fb.h
> >  0x81  00-1F  linux/vduse.h
> >  0x89  00-06  arch/x86/include/asm/sockios.h
> 

-- 
Regards,

Sakari Ailus

