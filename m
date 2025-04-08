Return-Path: <linux-media+bounces-29627-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1847AA80EAA
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 16:44:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 188624E2FA1
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 14:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B2881EB195;
	Tue,  8 Apr 2025 14:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="YtQ6Wfbm"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5B118E75A;
	Tue,  8 Apr 2025 14:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744123137; cv=pass; b=gQGAh0B508m8YMBg2OvZufRMXozQTubbOO/fykE9rYE68Rf9lXBM1r4BDG1zK1Y+t0m1P6I4k/jvX+5ZxZj5JPBCz2SZvYYoR3zzNEzYIBGFGcoHk3Hc37al7j4lXZu1sjiB2F03nIYzpd7Wb6UE53p86KcyeWJ6FHKfYFoMBIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744123137; c=relaxed/simple;
	bh=bQIx/AE9WqiXKXhD1qSsHX2GVZU7x/G7IT+x5PASwOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JS8pFU1KhuGBCUZy33yyl1trH230H4uZieWmXSS9saapWsPa40C4kE017QxzPAoTmJKXNdn7qKiUEc3MBl/wJwu3Cr9qX4AazCmHFbp3aHwsI6BkfLaG7SBm8tDuK7CmFh9vMDx606AyVVhTF6EIfTaxEMcAmFHV8NwbawPuyIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=YtQ6Wfbm; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1744123106; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UIJbpd3Je7VE/22JP22ATgzhOov58v+4+9Xft0BsfcsOcXhziDc9W6mComkTRMjPw9kXV6BY2T9g7uDaWc4wlhl10fkyIhYQaBl1Zu/U+k4q1GT8KINu0B9qOLH/BpFzpdmMBVgUejkkFVbdTlS/9CN4jCqX+prHHcGzNDFSTYI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744123106; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=B8NT4vlOQRlx6/HGXEefSUCFtwKkqSEbEk6F1ZBggQQ=; 
	b=TKDC6HeEqVQ+Ngwxe7LuD8BpgIxXEqgLuqSzkruawGqWwql4f3KMVGVhCZHNdvzeLY63c4AcXwKmf5QwQRxWQVOHKNtXgX6X19ioMbqaJm5W82EdIgSnv1YEpCzXk7tyZ1XjeINFaBWB8SwaI93rzX4dFDTrauLkKULBtHjfnJY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744123106;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=B8NT4vlOQRlx6/HGXEefSUCFtwKkqSEbEk6F1ZBggQQ=;
	b=YtQ6Wfbm9jLxE5EO3hTtVtwEoM8tAzdJ6oMhIWwhgQc0EjX76aKfdlzN5wpJnQv3
	IcW96YBC6tTKulDc6OL8hYVrBpovzubUHZVqqay5SxXZlvyAbKaaeaoKW9vANqYbdAc
	LxoQjQMRx/YVqnIgtNKFx+Ci3jCYOIC6HOf3KWYk=
Received: by mx.zohomail.com with SMTPS id 1744123103481976.8695522962561;
	Tue, 8 Apr 2025 07:38:23 -0700 (PDT)
Date: Tue, 8 Apr 2025 15:38:18 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, kernel@collabora.com, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v4 4/4] drm/panthor: show device-wide list of DRM GEM
 objects over DebugFS
Message-ID: <k5pf4wkpaeuahdg5vasxo226jppjxtndkswoi2g72eezecttic@vrdnyjxbqont>
References: <20250402115432.1469703-1-adrian.larumbe@collabora.com>
 <20250402115432.1469703-5-adrian.larumbe@collabora.com>
 <20250402145804.5cf07f5e@collabora.com>
 <s66dyt32ukr37p24zjgbatm6sk5lzw5ujx2n7p2pr2ixrq3jf4@byemjauyp2mv>
 <20250408154755.0d45b54b@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250408154755.0d45b54b@collabora.com>

On 08.04.2025 15:47, Boris Brezillon wrote:
On Tue, 8 Apr 2025 14:38:44 +0100
Adrián Larumbe <adrian.larumbe@collabora.com> wrote:

> > > > diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> > > > index 44d027e6d664..2fc87be9b700 100644
> > > > --- a/drivers/gpu/drm/panthor/panthor_gem.c
> > > > +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> > > > @@ -2,6 +2,7 @@
> > > >  /* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
> > > >  /* Copyright 2023 Collabora ltd. */
> > > >
> > > > +#include <linux/cleanup.h>
> > > >  #include <linux/dma-buf.h>
> > > >  #include <linux/dma-mapping.h>
> > > >  #include <linux/err.h>
> > > > @@ -10,14 +11,65 @@
> > > >  #include <drm/panthor_drm.h>
> > > >
> > > >  #include "panthor_device.h"
> > > > +#include "panthor_fw.h"
> > > >  #include "panthor_gem.h"
> > > >  #include "panthor_mmu.h"
> > > >
> > > > +#ifdef CONFIG_DEBUG_FS
> > > > +static void panthor_gem_debugfs_bo_init(struct panthor_gem_object *bo, u32 type_mask)
> > > > +{
> > > > +	INIT_LIST_HEAD(&bo->debugfs.node);
> > >
> > > This should be called when the GEM object is created, otherwise the
> > > list_empty() test done in panthor_gem_debugfs_bo_rm() will only work if
> > > panthor_gem_debugfs_bo_add() is called, and depending on when this
> > > happens, or whether it happens at all, the error path will do a NULL
> > > deref.
> >
> > I'll be moving panthor_gem_debugfs_bo_add() back into panthor_gem_create_object() and
> > inline panthor_gem_debugfs_bo_init() into it.
>
> You mean moving the panthor_gem_debugfs_bo_add() call to
> panthor_gem_create_object(), not inlining its content, right?

Yes, inlining panthor_gem_debugfs_bo_init() into panthor_gem_debugfs_bo_add() and moving
panthor_gem_debugfs_bo_add() into panthor_gem_create_object().

> > > > +	} else {
> > > > +		bo->debugfs.creator.tgid = 0;
> > > > +		snprintf(bo->debugfs.creator.process_name,
> > > > +			 sizeof(bo->debugfs.creator.process_name),
> > > > +			 "kernel");
> > > > +	}
> > > > +
> > > > +	bo->debugfs.bo_mask = type_mask;
> > >
> > > Why not do that directly in panthor_gem_debugfs_bo_add()? The only bits
> > > that might be useful to do early is the INIT_LIST_HEAD(), and I think
> > > it can be inlined in panthor_gem_create_object().
> >
> > I'll be doing in this in the next revision, but because I've no access to the BO
> > type mask from inside Panthor's drm_driver::gem_create_object() binding, then
> > I'll have to assign the mask right after the object has been created.
> >
> > I think this means there might be a short window after the object's been added to
> > the DebugFS GEMs list in which it could be shown with the kernel mask field still
> > set to 0, but I guess that's not too important either.
>
> I think it's okay, as long as you don't crash when printing partially
> initialized objects. Another solution would be to have a flag encoding
> when the obj is initialized, so you can skip objects that don't have
> this flag set yet.

I think what I'll do is set the mask to a poison value, maybe 0xFF, and only when
it's overwritten with a legitimate value, display the object in the DebugFS GEMS file.

Adrian Larumbe

