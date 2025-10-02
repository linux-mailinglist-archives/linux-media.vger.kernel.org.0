Return-Path: <linux-media+bounces-43660-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14715BB44B2
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 17:21:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 000A617B5E0
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 15:21:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEB7419D8AC;
	Thu,  2 Oct 2025 15:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hDG7KqqK"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112E92CCC0;
	Thu,  2 Oct 2025 15:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759418464; cv=none; b=Fc4NGWodkNZcDsSZBaOZJyDlzEPEm076ZHwvjifxxLn0PNl2XBUjQjbt9ZZR3Xir+vuN7cDn/9wTO7EvV7mFubUib+VsIf9usyGkzkYFgxnxJD3B2Q3BwcDnZ4TTKpaJcqz3QGrXmaDHVgFd//dzcgDQyv5A+e4h636K2qzIfnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759418464; c=relaxed/simple;
	bh=wpMI6K9jf8cxnVOXCIV9BDWS/xQlCr9Uira4EJEMdr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HIXMx/3M4Sumw5/1vfDdosX+x46WrJ7CABtTIwL4SaDabFvNgUt0VsXL2ntsQdihgdJzmSp3bamSv/Sc6Jnrxs1s55PDHm/JZwwuqS3I5vWl+riHsHYVoELl4hPpqjtsftsHOWpNJ+q7jIfOxiVuBVhYySjuHEyXIePwLMXsGNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hDG7KqqK; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759418462; x=1790954462;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=wpMI6K9jf8cxnVOXCIV9BDWS/xQlCr9Uira4EJEMdr8=;
  b=hDG7KqqKezmBP0cfvCjLK2P/WoZqIPhFXbUZZVTCKvZUSKgMxbmp7wmj
   QIyY0om7h39AJMOOAterll2T+Ao+W9gWqs2roNVDzb5yTZDfpZXuS1FTj
   if9Csqzxm3RpfUWD+jqqy5IYyoHaYtKRgewnOLL4EzkCZRvIXxnnlvG0E
   l4EYiUHQM7jCTnhZI4OXqYDEGd//Zn5TI3YsUgiZN3C2DOHm+gRLd3Q81
   nURI7aFp0/mgmN8QGLyiB6Sr+YkxMHd0NK0wJySAA75QAPCClFo5F0u4q
   411gYDl/AqsJd3wxl+ATmlXIuS9lvjr/GTQHLBEXBcG/kEGV8TAejec2r
   A==;
X-CSE-ConnectionGUID: Ty+4gfzkR3ezG4BA77HfCQ==
X-CSE-MsgGUID: 2l4RTd4sTMKOkV/p39kXIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="73134327"
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; 
   d="scan'208";a="73134327"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 08:21:01 -0700
X-CSE-ConnectionGUID: JNn/PG/jR3WevUnXl40jbA==
X-CSE-MsgGUID: ppAn+mkURAWVybHWGi/kHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; 
   d="scan'208";a="209762262"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.245.228])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 08:20:58 -0700
Date: Thu, 2 Oct 2025 18:20:54 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Alexandr Sapozhnkiov <alsp705@gmail.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH 5.10] gpu/i915: fix error return in mmap_offset_attach()
Message-ID: <aN6YVtnJ3Guh43n5@intel.com>
References: <20251002084828.11-1-alsp705@gmail.com>
 <aN6EbmgZYchyMHRn@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aN6EbmgZYchyMHRn@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Oct 02, 2025 at 09:55:58AM -0400, Rodrigo Vivi wrote:
> On Thu, Oct 02, 2025 at 11:48:26AM +0300, Alexandr Sapozhnkiov wrote:
> > From: Alexandr Sapozhnikov <alsp705@gmail.com>
> 
> About the subject, this is not just a 5.10 kernel issue.
> This code is the current code in our tip.
> So this needs to target drm-tip branch, and then Cc stable
> and perhaps a Fixes: tag.
> 
> > 
> > In the drm_vma_node_allow function, kmalloc may 
> > return NULL, in which case the file element will not be 
> > added to the mmo->vma_node list. It would be good to 
> > not ignore this event, but at least log an error message.
> > 
> > Found by Linux Verification Center (linuxtesting.org) with SVACE.
> > 
> > Signed-off-by: Alexandr Sapozhnikov <alsp705@gmail.com>
> > ---
> >  drivers/gpu/drm/i915/gem/i915_gem_mman.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> > index a2195e28b625..adaef8f09d59 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> > @@ -706,8 +706,11 @@ mmap_offset_attach(struct drm_i915_gem_object *obj,
> >  	mmo = insert_mmo(obj, mmo);
> >  	GEM_BUG_ON(lookup_mmo(obj, mmap_type) != mmo);
> >  out:
> > -	if (file)
> > -		drm_vma_node_allow_once(&mmo->vma_node, file);
> > +	if (file) {
> > +		err = drm_vma_node_allow_once(&mmo->vma_node, file);
> > +		if (err)
> 
> perhaps we also need to drm_vma_offset_remove here?
> I mean... honest question, doubt here. Is there any further clean-up needed?

Yeah, mmo->vma_node has already been linked to varius places here.
So this will lead to use-after-free in short order.

With the current code if this fails then I think all that ends up
happening is that subsequent mmap() will fail. Maybe that's just
fine?

> 
> > +			goto err;
> > +	}
> >  	return mmo;
> >  
> >  err:
> > -- 
> > 2.43.0
> > 

-- 
Ville Syrjälä
Intel

