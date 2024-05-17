Return-Path: <linux-media+bounces-11620-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7648C8C2C
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2024 20:16:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FEDE1F23A65
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2024 18:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE24113DDCA;
	Fri, 17 May 2024 18:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jZcCheO8"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8091C1FC8;
	Fri, 17 May 2024 18:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715969786; cv=none; b=RiXlCXSg0pjbRyRsG01U32kwTXwmDzy6UXSASLQ7YhRqUMD12i+k0CfP1I4MMyHvhDlXvHc5tgBZesLZUl/Ian3cmdz8+SfXY3aeU5JSzQ2jrv6m72BevwZwh9hCGIwWGmAzHz46AHEfigirtG9WXGjED2I+0uYJ2YdiB+pM18Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715969786; c=relaxed/simple;
	bh=lT7ANqA15p++xYidjcIo07kOO4xRG9QuB0j8hQzfJzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ibq58k5oyuOSaDib3lCdSTYlSB593gjVUS0CFwbmUgT0hNH5e7w7Q2Sbdn16/IhJN+1XQSdsQqkHi/vsBLooBTNcAtdKmXkhneb69bpu3xZhnSzWvua6ufjIe5g6UUkubEkAeFDBw6V3c7jMdHMQLRPTpG7vI78z/RhaiUI5mW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jZcCheO8; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1715969782;
	bh=lT7ANqA15p++xYidjcIo07kOO4xRG9QuB0j8hQzfJzU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jZcCheO8ZjwBpoug2Q2/ytG3gx657OskG/XbaIiAZrOhXfcorzpCs4iF5I1afHlgs
	 EZ4NZjPdPgX3Cp10KlT8F3s7346E8K0x0ihp4YspKbBELQdEUyW6WnexjRnIzm6Vhg
	 yRMtbPnmF9eol0nJKLKxZJT7MkJ6CdvpLSjg7AOl9P5vE3FDD7G/MOiIZOXd+al0FD
	 OEgg3IqeqjIFoF/SQwpHht8bL5hIC5gnDGUSIEW7rSevhet68oFAJLvlw0Un8F+BPI
	 p+9/xedK8zxIpfkFnKN3HlFvDVn0KYgfrUymxPXLUFTJz3tqt6bdM3wgFaCxKbuNvE
	 79uYcdKoa1rlw==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: alarumbe)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5439837821B7;
	Fri, 17 May 2024 18:16:22 +0000 (UTC)
Date: Fri, 17 May 2024 19:16:21 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
	Qiang Yu <yuq825@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Steven Price <steven.price@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Christian Koenig= <christian.koenig@amd.com>, Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Zack Rusin <zack.rusin@broadcom.com>, kernel@collabora.com, dri-devel@lists.freedesktop.org, 
	lima@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v3 0/2] drm: Fix dma_resv deadlock at drm object pin time
Message-ID: <t64xneene7m7x2akecvrmr44yottiicy2mle7e5fimg7vacb4n@n4cjdf7g3nlp>
References: <20240501065650.2809530-1-adrian.larumbe@collabora.com>
 <84a5f7b6-d20a-4c69-83a8-d8394fea2b68@suse.de>
 <20240502135941.136ad639@collabora.com>
 <20240502140012.68e88831@collabora.com>
 <d520ea1b-e399-4c3d-8546-87c68e480cbc@suse.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d520ea1b-e399-4c3d-8546-87c68e480cbc@suse.de>

Hi Boris and Thomas,

On 02.05.2024 14:18, Thomas Zimmermann wrote:
> Hi
> 
> Am 02.05.24 um 14:00 schrieb Boris Brezillon:
> > On Thu, 2 May 2024 13:59:41 +0200
> > Boris Brezillon <boris.brezillon@collabora.com> wrote:
> > 
> > > Hi Thomas,
> > > 
> > > On Thu, 2 May 2024 13:51:16 +0200
> > > Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > > 
> > > > Hi,
> > > > 
> > > > ignoring my r-b on patch 1, I'd like to rethink the current patches in
> > > > general.
> > > > 
> > > > I think drm_gem_shmem_pin() should become the locked version of _pin(),
> > > > so that drm_gem_shmem_object_pin() can call it directly. The existing
> > > > _pin_unlocked() would not be needed any longer. Same for the _unpin()
> > > > functions. This change would also fix the consistency with the semantics
> > > > of the shmem _vmap() functions, which never take reservation locks.
> > > > 
> > > > There are only two external callers of drm_gem_shmem_pin(): the test
> > > > case and panthor. These assume that drm_gem_shmem_pin() acquires the
> > > > reservation lock. The test case should likely call drm_gem_pin()
> > > > instead. That would acquire the reservation lock and the test would
> > > > validate that shmem's pin helper integrates well into the overall GEM
> > > > framework. The way panthor uses drm_gem_shmem_pin() looks wrong to me.
> > > > For now, it could receive a wrapper that takes the lock and that's it.
> > > I do agree that the current inconsistencies in the naming is
> > > troublesome (sometimes _unlocked, sometimes _locked, with the version
> > > without any suffix meaning either _locked or _unlocked depending on
> > > what the suffixed version does), and that's the very reason I asked
> > > Dmitry to address that in his shrinker series [1]. So, ideally I'd
> > > prefer if patches from Dmitry's series were applied instead of
> > > trying to fix that here (IIRC, we had an ack from Maxime).
> > With the link this time :-).
> > 
> > [1]https://lore.kernel.org/lkml/20240105184624.508603-1-dmitry.osipenko@collabora.com/T/
> 
> Thanks. I remember these patches. Somehow I thought they would have been
> merged already. I wasn't super happy about the naming changes in patch 5,
> because the names of the GEM object callbacks do no longer correspond with
> their implementations. But anyway.
> 
> If we go that direction, we should here simply push drm_gem_shmem_pin() and
> drm_gem_shmem_unpin() into panthor and update the shmem tests with
> drm_gem_pin(). Panfrost and lima would call drm_gem_shmem_pin_locked(). IMHO
> we should not promote the use of drm_gem_shmem_object_*() functions, as they
> are meant to be callbacks for struct drm_gem_object_funcs. (Auto-generating
> them would be nice.)

I'll be doing this in the next patch series iteration, casting the pin function's
drm object parameter to an shmem object.

Also for the sake of leaving things in a consistent state, and against Boris' advice,
I think I'll leave the drm WARN statement inside drm_gem_shmem_pin_locked. I guess
even though Dmitry's working on it, rebasing his work on top of this minor change
shouldn't be an issue.

Cheers,
Adrian Larumbe

> Best regards
> Thomas
> 
> 
> > 
> > > Regards,
> > > 
> > > Boris

