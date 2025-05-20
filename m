Return-Path: <linux-media+bounces-32920-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 766CCABD893
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 14:54:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A51224A35AB
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 12:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DB551D435F;
	Tue, 20 May 2025 12:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="g3yvTSms"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0B7E573;
	Tue, 20 May 2025 12:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747745655; cv=pass; b=J7fsz0VU3qqZGU328fT0bT0UiU4wokBs29TKIpSL4Lmu7VQvRTbQa5uFceeTUftmBiwXVATPx8nQXy4KhrIvG19cb693WmgkMW8yhB9Thy6ZTWgod7nklr74wqwWaqnXknpMrK4T/zdOchVtocOgEsRytsq+XkFLSH+SLK+pc34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747745655; c=relaxed/simple;
	bh=VyDRu5okBNYh0PPU8c6EFcuLKrl934GUxOrmkcF81Wc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YZQFdL7w3GpQbcaisfUQbPr8ZkVlrIaW8bknOQJhNePQItar4aQNEHqUdQOAOZ3GFvP4RS1wCd0XPRmGYIl7NGpoDc9KnVns/Mfc7Q+QK5GQOteHCXQGbSCmW/b7dKNXCYNqqzj5+xM/NEM3xB0X/4EwMLPek8tDF0/Oj/w36ZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=g3yvTSms; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1747745619; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PtbyDuG+Xx8o4Fo82q7gnzgQXzDhkhuOwgpsBwhKqs1kN+veFb597R7SmL0acmpVblQKhP5T2//K2bvT3qGHZg8JX9PxK8Ukp3DMFEbXsXzYA2xWO8yeajGClzl6MaCP8H7HPytGyk6h7JQZuK0vVbYD85a2EDdZuhP7w/WoNRE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747745619; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xpT1I6OsQDTs/OF6TNihbbaghdO2wEfulzUIutllrog=; 
	b=N/Vb1ix5HrbvV5ZA1XrkeBdi4W4mfR9AKiBeYZmGYvJPpeHpWoX0DiF0s4hSDw7zH1iLzyGg3NUBVPmHhDLei83LokqjKKsaxYN+8H/K2My/+tNmTwGe0b/D4G/nRr3kHqlPNKuZpFeq/ySiaQpKXsnKIhOuliGBXisUbZCHf3w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747745619;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=xpT1I6OsQDTs/OF6TNihbbaghdO2wEfulzUIutllrog=;
	b=g3yvTSmsy65qXoWGb8uBaN+T4q/WMuNwAKSrRiKs8IJaXx9Gb62wGqL/XB0tPwZR
	ZSBdWYFuEZAH+oHbqIMvyJ2BrPF5O1MM2wzxsCG506MnSTUCZygE2n+O3Fjd+b1coDP
	+UhQicfjZXhr6yXQndXN/37rC1cLFkcyJUgp6Yh0=
Received: by mx.zohomail.com with SMTPS id 1747745619348731.4739743284113;
	Tue, 20 May 2025 05:53:39 -0700 (PDT)
Date: Tue, 20 May 2025 13:53:33 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Daniel Stone <daniel@fooishbar.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
	Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com, Rob Herring <robh@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Linux Media Mailing List <linux-media@vger.kernel.org>, 
	"moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>
Subject: Re: [PATCH v2 3/3] drm/panfrost: show device-wide list of DRM GEM
 objects over DebugFS
Message-ID: <3ufktxc3qkp6nimqkll2kju2iraopvy3cdfkrabqdoct2j5xkg@dv6xalz7jlvy>
References: <20250507160713.1363985-1-adrian.larumbe@collabora.com>
 <20250507160713.1363985-4-adrian.larumbe@collabora.com>
 <9c0b95c8-bf2d-4689-ac1f-ccacba826060@arm.com>
 <CAPj87rOiEa1bTOPqyauYhoVoXEtNeDjE+DkLbzeGVJ1tW9fJcQ@mail.gmail.com>
 <6a00017f-89dd-47b9-a4db-ceedd63f456f@arm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6a00017f-89dd-47b9-a4db-ceedd63f456f@arm.com>

Hi Steven,

Thanks for the fix, I've tested it and it fixes the outstanding issue.

However, including the perfcnt sample buffer in the DebugFS GEMs file raises the question of what
to do with its labelling, because it isn't exposed to UM through a handle, so my previous assumption
about not needing to handle static labels when tagging BO's within the driver no longer holds.

This might require some quick rewrite so that the sample BO can be displayed with a fitting name.

On 19.05.2025 17:02, Steven Price wrote:
> On 15/05/2025 19:04, Daniel Stone wrote:
> > Hi Steven,
> >
> > On Thu, 8 May 2025 at 11:42, Steven Price <steven.price@arm.com> wrote:
> >> I'm also seeing a splat when running this, see below. I haven't got my
> >> head around how this is happening, but I see it when glmark quits at the
> >> end of the test.
> >>
> >> [  399.505066] Unable to handle kernel NULL pointer dereference at virtual address 00000004 when write
> >> [...]
> >> [  399.882216] Call trace:
> >> [  399.882222]  panfrost_gem_free_object [panfrost] from drm_gem_handle_delete+0x84/0xb0
> >> [  399.893813]  drm_gem_handle_delete from drm_ioctl+0x2b8/0x4f4
> >> [  399.900237]  drm_ioctl from sys_ioctl+0x428/0xe30
> >> [  399.905496]  sys_ioctl from ret_fast_syscall+0x0/0x1c
> >
> > Soooo. Let's assume it has to actually occur in
> > panfrost_gem_debugfs_bo_rm(), since that's all that's changed here.
> >
> > I don't think pfdev can be NULL here, because we've already
> > dereferenced ptdev and written to a structure member earlier in
> > panfrost_gem_free_object(). I don't think it can be the debugfs mutex,
> > because a) that's initialised with the device, and b) wouldn't be
> > offset 0x4.
> >
> > I'm looking then at list_del_init(&bo->debugfs.node), which would
> > effectively execute bo->debugfs.node->next->prev =
> > bo->debugfs.node->prev. So if bo->debugfs.node->next was NULL, that
> > would explain a write to 0x4 on 32-bit systems.
>
> So I finally got some time to do some debugging on this. And you are
> absolutely correct on where the fault is triggered.
>
> The cause of it is that panfrost_gem_debugfs_bo_add() is called from
> panfrost_gem_create(), but that isn't the only place that Panfrost GEM
> objects are created - it turns out panfrost_perfcnt_enable_locked() also
> calls drm_gem_shmem_create(). And in that case the list next/prev
> pointers are left set to NULL, causing things to blow up when the GEM
> object is freed.
>
> The below patch gets things working, or alternatively just init the list
> in panfrost_gem_create_object() if we don't want to include the perfcnt
> buffer in the list.

> Steve
>
> ---8<--
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c
> b/drivers/gpu/drm/panfrost/panfrost_gem.c
> index fe2cdbe8baf0..51da13cd81f0 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
> @@ -297,13 +297,14 @@ struct drm_gem_object
> *panfrost_gem_create_object(struct drm_device *dev, size_t
>         obj->base.map_wc = !pfdev->coherent;
>         mutex_init(&obj->label.lock);
>
> +       panfrost_gem_debugfs_bo_add(pfdev, obj);
> +
>         return &obj->base.base;
>  }
>
>  struct panfrost_gem_object *
>  panfrost_gem_create(struct drm_device *dev, size_t size, u32 flags)
>  {
> -       struct panfrost_device *pfdev = dev->dev_private;
>         struct drm_gem_shmem_object *shmem;
>         struct panfrost_gem_object *bo;
>
> @@ -319,8 +320,6 @@ panfrost_gem_create(struct drm_device *dev, size_t
> size, u32 flags)
>         bo->noexec = !!(flags & PANFROST_BO_NOEXEC);
>         bo->is_heap = !!(flags & PANFROST_BO_HEAP);
>
> -       panfrost_gem_debugfs_bo_add(pfdev, bo);
> -
>         return bo;
>  }

