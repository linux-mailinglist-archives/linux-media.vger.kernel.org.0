Return-Path: <linux-media+bounces-43668-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9C4BB49BC
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 19:00:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F58C3C2AD7
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 17:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BE7D26CE26;
	Thu,  2 Oct 2025 17:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PYPazlgO"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E0715853B;
	Thu,  2 Oct 2025 17:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759424404; cv=none; b=Hb0AZDmhk7llAUsCkIuAfLkdtbm84GczcSv8JWUyDg83IwSG3uLmG76q4EzxNJSTVXzIbso8lhgbCWjz3E/0GBqq2JaewSWVfwfH2QaoCKLmXh/gBBVspuvKv5ZVY8laHhDFlJ3d0tKi48KC2fvorfd3O+bbhnUYAzt7wYLKCDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759424404; c=relaxed/simple;
	bh=GUZV8YmlzjH2/RShYbeKv2H7/Ifr0wYLQQDZqdP58hg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nrZoBsqFNLqB4krOqDf1dhVBoy9lxrxkv1i83vOXvMd4J5DXbc0Z9yVSVahxIWZrmJrtYxWZPIj7NITJVhSYGJgeGSHfNsz+1h+Bi5ObpWVTWJEHS/KH2TgEsBfuA4m6aLCfryCS6+INKnqXqk7Xtl9/9GlRwitXpr/cceL2VDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PYPazlgO; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759424401; x=1790960401;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=GUZV8YmlzjH2/RShYbeKv2H7/Ifr0wYLQQDZqdP58hg=;
  b=PYPazlgOAv768vAXYE1RO/q7Dle+Vsf/rFoRxVI/+dMMqubcrCNR7K7K
   PgMtUH5HzcyaOt7OCLbDJojg4dAG0pLTh0P1mwY0B+gdLQORELYRWwFvD
   mPuMFVglMQsmbQYsl/EH5nav4QqnnSf1E8je+LX2EbP7gjrp3tt+ZNbTX
   s6ADilTIl9GRB2VJDx8cSZipkQBWlwHZoCBuK2C/OgcMd/kDY1qB50XRs
   sh5eG6j5P8iG86lpK9CcH64325LSHXh+i+caKvZ62IDLYCAqFzUwL99Zu
   Ceck2OrZ83v18FfnjtmfGZUpbJAW17Og2ZS3SsB8aV8pN4DnOxbthzB9P
   w==;
X-CSE-ConnectionGUID: jkQWybxrQ++gCMegve5gpA==
X-CSE-MsgGUID: PEh0n7EsSQiXmZVsdu0psA==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="79138648"
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; 
   d="scan'208";a="79138648"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 10:00:00 -0700
X-CSE-ConnectionGUID: EMqVWqnuTA+mZUl+yGD9ng==
X-CSE-MsgGUID: 0ejGAm0WTWyO4bgIcrxGFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; 
   d="scan'208";a="183488996"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.245.228])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 09:59:56 -0700
Date: Thu, 2 Oct 2025 19:59:54 +0300
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
Message-ID: <aN6vivjT61-MXVlt@intel.com>
References: <20251002084828.11-1-alsp705@gmail.com>
 <aN6EbmgZYchyMHRn@intel.com>
 <aN6YVtnJ3Guh43n5@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aN6YVtnJ3Guh43n5@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Oct 02, 2025 at 06:20:54PM +0300, Ville Syrjälä wrote:
> On Thu, Oct 02, 2025 at 09:55:58AM -0400, Rodrigo Vivi wrote:
> > On Thu, Oct 02, 2025 at 11:48:26AM +0300, Alexandr Sapozhnkiov wrote:
> > > From: Alexandr Sapozhnikov <alsp705@gmail.com>
> > 
> > About the subject, this is not just a 5.10 kernel issue.
> > This code is the current code in our tip.
> > So this needs to target drm-tip branch, and then Cc stable
> > and perhaps a Fixes: tag.
> > 
> > > 
> > > In the drm_vma_node_allow function, kmalloc may 
> > > return NULL, in which case the file element will not be 
> > > added to the mmo->vma_node list. It would be good to 
> > > not ignore this event, but at least log an error message.
> > > 
> > > Found by Linux Verification Center (linuxtesting.org) with SVACE.
> > > 
> > > Signed-off-by: Alexandr Sapozhnikov <alsp705@gmail.com>
> > > ---
> > >  drivers/gpu/drm/i915/gem/i915_gem_mman.c | 7 +++++--
> > >  1 file changed, 5 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> > > index a2195e28b625..adaef8f09d59 100644
> > > --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> > > @@ -706,8 +706,11 @@ mmap_offset_attach(struct drm_i915_gem_object *obj,
> > >  	mmo = insert_mmo(obj, mmo);
> > >  	GEM_BUG_ON(lookup_mmo(obj, mmap_type) != mmo);
> > >  out:
> > > -	if (file)
> > > -		drm_vma_node_allow_once(&mmo->vma_node, file);
> > > +	if (file) {
> > > +		err = drm_vma_node_allow_once(&mmo->vma_node, file);
> > > +		if (err)
> > 
> > perhaps we also need to drm_vma_offset_remove here?
> > I mean... honest question, doubt here. Is there any further clean-up needed?
> 
> Yeah, mmo->vma_node has already been linked to varius places here.
> So this will lead to use-after-free in short order.
> 
> With the current code if this fails then I think all that ends up
> happening is that subsequent mmap() will fail. Maybe that's just
> fine?

Hmm, or maybe it would be better to just directly return an error
here without freeing/cleaning up anything. Looks to me like that
should work fine as well, and userspace would get the error
immediately instead of later.

> 
> > 
> > > +			goto err;
> > > +	}
> > >  	return mmo;
> > >  
> > >  err:
> > > -- 
> > > 2.43.0
> > > 
> 
> -- 
> Ville Syrjälä
> Intel

-- 
Ville Syrjälä
Intel

