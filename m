Return-Path: <linux-media+bounces-30561-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDACA93ED7
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 22:23:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 531A2169C05
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 20:23:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDDDA22F155;
	Fri, 18 Apr 2025 20:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="LOcoStOv"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DD978F29;
	Fri, 18 Apr 2025 20:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745007818; cv=pass; b=i9khDRr5DB+esDNu/uawG6R1wUPBe+9CIearxFt3nFngGjXEvOpdolO6ZDhaYWRBozREJwM/xl0XQq/+8vpt2BDBesUB09dmBzB4dcTlZYXMt12PPwz0qcH1ZlT+Lx9WK+7soc6lAvx7GogpYU7l0K+mTbU4aCyIIGROX2DYfao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745007818; c=relaxed/simple;
	bh=+WS4rLU7EmYVCrP3SGj434wc9tvLSlrM0cx3OAYdtm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jh2A85CRUT2laE3y6UZl1n/4CwSJwTV6HLscCSmpyzuqF+aPrF7hftWh4Q/w+RysGYVeN09ouf3bjoaxHOuGpSyWKVqH73juVS7wP09W5UNiLxE8joplUYtYVzhipsZNifCcxkxsczGyOnbWwQpcSyC/7I27mA0zdQpySm2O7gw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=LOcoStOv; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1745007786; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Gat52nrHOun0wuFnA9nm2B3LP7WfHNOQGsVMmfKX0Jt/ybRtXaeIj/x7nvHYi59SO51KUM3/YGwm45jl4cRr1hlJr446FRaYF7uDsXimBxzvQ9VeNGuNn88OT7pTvtR9RwCWDzBh+aS5pTN573ZSBhaZDd89JVpvL3Zu53CV5wc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745007786; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3hdd8erPVH9AAhQT0McvltK6BgQEt4fniwbV/M/RxT4=; 
	b=Z88MYSiwuSmS4SudhBXA9wiNpId227uN6hwoU/oNI+P2O3pTSsnovQvbtC4XAsdJukouiYVzZY13oviOzjCSbeebjy3LvBSuqbuJQAv094XPrEkUKFasCO+Mh/vpZhzXir/0a9MIu1sI7zDla6zaYfgneOqg3IhG00AGtE1T9Ic=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745007786;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=3hdd8erPVH9AAhQT0McvltK6BgQEt4fniwbV/M/RxT4=;
	b=LOcoStOvMq7A/5rMZLV490MEqDleQKO5E/eYC4OVNFYpfLptpjCHuqIlNzhE8ycd
	P7zIRwGquJEfXaeUCIUEXOz9UP81AXqpmApvZoz6xZnFali1CRxkSyRtjXNGbXuXGeo
	h4ItgY7QJA7sy/UgeA/RqM5IpahgQJ/l0MyjsoBg=
Received: by mx.zohomail.com with SMTPS id 1745007784882287.4377600541733;
	Fri, 18 Apr 2025 13:23:04 -0700 (PDT)
Date: Fri, 18 Apr 2025 21:22:59 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	kernel@collabora.com, Liviu Dudau <liviu.dudau@arm.com>, 
	Steven Price <steven.price@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v9 4/4] drm/panthor: show device-wide list of DRM GEM
 objects over DebugFS
Message-ID: <tb6267pfhg25zpoaqyzxhw7jxzzmncjgxa5v6czimhdu6xaabu@ygv4z7ibtmxu>
References: <20250418022710.74749-1-adrian.larumbe@collabora.com>
 <20250418022710.74749-5-adrian.larumbe@collabora.com>
 <20250418101156.0241a000@collabora.com>
 <20250418102649.41a609d6@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250418102649.41a609d6@collabora.com>

On 18.04.2025 10:26, Boris Brezillon wrote:
On Fri, 18 Apr 2025 10:11:56 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> On Fri, 18 Apr 2025 03:27:07 +0100
> Adrián Larumbe <adrian.larumbe@collabora.com> wrote:
>
> > +	static const char * const gem_state_flags_names[] = {
> > +		[PANTHOR_DEBUGFS_GEM_STATE_FLAG_IMPORTED] = "imported",

> FYI, the compiler seems to be happy with:
>
> 		[ffs(PANTHOR_DEBUGFS_GEM_STATE_FLAG_IMPORTED) - 1] = "imported",
>
> but I'm not sure we want to fix it this way. The other
> option would be to define bit pos in the enum and then
> define flags according to these bit pos:
>
> enum panthor_debugfs_gem_state_flags {
> 	PANTHOR_DEBUGFS_GEM_STATE_IMPORTED_BIT = 0,
> 	PANTHOR_DEBUGFS_GEM_STATE_EXPORTED_BIT = 1,
>
> 	/** @PANTHOR_DEBUGFS_GEM_STATE_FLAG_IMPORTED: GEM BO is PRIME imported. */
> 	PANTHOR_DEBUGFS_GEM_STATE_FLAG_IMPORTED = BIT(PANTHOR_DEBUGFS_GEM_STATE_IMPORTED_BIT),
>
> 	/** @PANTHOR_DEBUGFS_GEM_STATE_FLAG_EXPORTED: GEM BO is PRIME exported. */
> 	PANTHOR_DEBUGFS_GEM_STATE_FLAG_EXPORTED = BIT(PANTHOR_DEBUGFS_GEM_STATE_EXPORTED_BIT),
> };

I'm happy with this solution too. To be frank I thought of something like this
when I realised flag names array indices an bit values were askew by one, but
since the names array is constant and mostly meant to be read in the future by
programmers who want to add new flag meanings to the same table, I didn't think
of having a hole in index 0 as a problem.

> > +		[PANTHOR_DEBUGFS_GEM_STATE_FLAG_EXPORTED] = "exported",
>
> Okay, I think I know where the flag indexing issue comes from:
> PANTHOR_DEBUGFS_GEM_STATE_FLAG_xx are flags, not bit positions, so we
> can't use them as indices here.
>
> > +	};
> > +
> > +	static const char * const gem_usage_flags_names[] = {
> > +		[PANTHOR_DEBUGFS_GEM_USAGE_FLAG_KERNEL] = "kernel",
> > +		[PANTHOR_DEBUGFS_GEM_USAGE_FLAG_FW_MAPPED] = "fw-mapped",
>
> Same problem here.
>
> > +	};
> > +


Adrian Larumbe

