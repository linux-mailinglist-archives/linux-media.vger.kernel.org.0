Return-Path: <linux-media+bounces-20689-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E63E9B8FCB
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 11:55:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6A81283E88
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 10:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D13F1922D6;
	Fri,  1 Nov 2024 10:55:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D7418660C;
	Fri,  1 Nov 2024 10:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730458523; cv=none; b=uzqCEjqZO3UxMjfYqrNFDXR/zeO4XU+DhIPWiviNJodNVshYyHeTePuY8tpBISPEGDOu66M3P4VKBlmwww0shzzi+8t7yd5qdbkPw+OR/FI1PRMdjVNFE3DQwVkbpkX+sTYK+WDNMSCjO40arD/SlwhRN/+TNhPJQw+1oXe0uck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730458523; c=relaxed/simple;
	bh=QsUe6fSQf6mGTRUNT4acXIgf2YQM285WnECE08WtvIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qRdr2jXFVqzCjFOv00uCbl6Z0QvfPHLoh2S7sauFGk4ebaQ+zMdfCkGaBCVSRwJqS10+FcjI/u6OBxc0AlljK2J0NO2T3CZX9NL5ur8een6UkmiJAPmm53YvOJxBNq2ECBpmwJ35Yws1J/GGaWV8yaXOw4+FU/SSmRhq6z7e1aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: r7q/n43fQ5O89q3oRuLvwQ==
X-CSE-MsgGUID: C3KI8X0TSPqLFZa6MMCWHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="30334171"
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="30334171"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 03:55:21 -0700
X-CSE-ConnectionGUID: yM9fdRu8T92QKPFQQiyPqg==
X-CSE-MsgGUID: vDnbDOEnRfilStIda7gUPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="113716536"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 03:55:19 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1t6pJD-0000000A0Cr-2X1U;
	Fri, 01 Nov 2024 12:55:15 +0200
Date: Fri, 1 Nov 2024 12:55:15 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Li Huafei <lihuafei1@huawei.com>
Cc: mchehab@kernel.org, hdegoede@redhat.com, sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: atomisp: Add check for rgby_data memory
 allocation failure
Message-ID: <ZySzkw3wJa-1Z5jw@smile.fi.intel.com>
References: <20241101154823.3067891-1-lihuafei1@huawei.com>
 <ZySRjyrxI9jrcY1q@smile.fi.intel.com>
 <d2590a9f-7786-ca08-a705-a5b287e74ba3@huawei.com>
 <ZySqY9YX0ke64Lf-@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZySqY9YX0ke64Lf-@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Nov 01, 2024 at 12:16:03PM +0200, Andy Shevchenko wrote:
> On Fri, Nov 01, 2024 at 05:57:36PM +0800, Li Huafei wrote:
> > On 2024/11/1 16:30, Andy Shevchenko wrote:
> > > On Fri, Nov 01, 2024 at 11:48:23PM +0800, Li Huafei wrote:
> > >> In ia_css_3a_statistics_allocate(), there is no check on the allocation
> > >> result of the rgby_data memory. If rgby_data is not successfully
> > >> allocated, it may trigger the assert(host_stats->rgby_data) assertion in
> > >> ia_css_s3a_hmem_decode(). Adding a check to fix this potential issue.
> > > 
> > > Not sure if this code even run on currently supported hardware / firmware,
> > > but fix looks okay.
> > > 
> > >> Fixes: ad85094b293e ("Revert "media: staging: atomisp: Remove driver"")
> > > 
> > > No, this is an intermediate commit, you should find the original, which is
> > > earlier in the history.
> > 
> > Apologies, the correct fix tag should be:
> > 
> > Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
> > 
> > If this fix can be applied, do I need to send a v2, or can you help add the Fix tag?
> 
> Up to Hans, but there is another question left unanswered about SoB chain.
> Can you clarify that?

Ah, sorry, I misread the From and answered to the wrong thread.
Fixes tag seems better now.

-- 
With Best Regards,
Andy Shevchenko



