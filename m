Return-Path: <linux-media+bounces-29624-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EEBA80CF6
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 15:54:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2A378838DC
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 13:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFB111A314B;
	Tue,  8 Apr 2025 13:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="nDgFkkME"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41975175D50;
	Tue,  8 Apr 2025 13:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744120083; cv=none; b=VP2Na9A2SiR8//X7h46CmTgNGAEs6tNXJhH2N2+zT002UGyhFGxF7HDNK4zKwnpZU/rutkbzVKBPQoZRfB0uI6diO4Ph8Y2Zn1xAWPyz7K5sEiUXV6Y/QsbP1wlJ8BjStmvSyJwVAmgt6peN5Qcg7ughhLADSQaHD5F703FN8XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744120083; c=relaxed/simple;
	bh=C3YRdVfN9/tTERgpzrFW3Dz1VIKYRWNPIZCGRvkTjQA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ex5oPqYjd4jPkVEvZzDBay5NBcMPqlD6GCDPhhq0QEmGofCz1vbASLnQskAaXNXENd8UDWReIMp7matdcRkMa/7ZFSvs3b9Q2qbPFQ7Xiq8TUNws6xKExCJiKhK5RLlxA+h3oPPqMiqris+0gIWw67Kjf/8+Y7D8p3UjcO6ZtXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=nDgFkkME; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744120079;
	bh=C3YRdVfN9/tTERgpzrFW3Dz1VIKYRWNPIZCGRvkTjQA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nDgFkkMEertxPzp7FI7rLDLgWd/jyh1Cmrn8XxSMVprkJ5Q0P3XLoQYXi1yTkAp3e
	 qWrgEUXO/B3yeacx7cSkTcwY1kHbmIRc1cHtIQsClfflQHENP01YmMv+0gzBiHSg9S
	 shfcJMfrJvpIIA6VtmHpXm6ccx95myyISWvYvezP9pA3a/NJy+MaQSHyhhOS6041tS
	 uiP96Cq9qFDKO7Qr5X+Qu0Yxl/z0d5PBC09FRW4juTzy2RSJ/66Y0qfjVJnKYFmhsY
	 X2POczZraBQBg2bxlLWszgjhwWRq9HKDQorpJVXygctsb4MOZxz+wCqv/w4BoHu+sd
	 orQB1f527BupA==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B4A0917E10F7;
	Tue,  8 Apr 2025 15:47:58 +0200 (CEST)
Date: Tue, 8 Apr 2025 15:47:55 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v4 4/4] drm/panthor: show device-wide list of DRM GEM
 objects over DebugFS
Message-ID: <20250408154755.0d45b54b@collabora.com>
In-Reply-To: <s66dyt32ukr37p24zjgbatm6sk5lzw5ujx2n7p2pr2ixrq3jf4@byemjauyp2mv>
References: <20250402115432.1469703-1-adrian.larumbe@collabora.com>
	<20250402115432.1469703-5-adrian.larumbe@collabora.com>
	<20250402145804.5cf07f5e@collabora.com>
	<s66dyt32ukr37p24zjgbatm6sk5lzw5ujx2n7p2pr2ixrq3jf4@byemjauyp2mv>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 8 Apr 2025 14:38:44 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> > > diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/=
panthor/panthor_gem.c
> > > index 44d027e6d664..2fc87be9b700 100644
> > > --- a/drivers/gpu/drm/panthor/panthor_gem.c
> > > +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> > > @@ -2,6 +2,7 @@
> > >  /* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
> > >  /* Copyright 2023 Collabora ltd. */
> > >
> > > +#include <linux/cleanup.h>
> > >  #include <linux/dma-buf.h>
> > >  #include <linux/dma-mapping.h>
> > >  #include <linux/err.h>
> > > @@ -10,14 +11,65 @@
> > >  #include <drm/panthor_drm.h>
> > >
> > >  #include "panthor_device.h"
> > > +#include "panthor_fw.h"
> > >  #include "panthor_gem.h"
> > >  #include "panthor_mmu.h"
> > >
> > > +#ifdef CONFIG_DEBUG_FS
> > > +static void panthor_gem_debugfs_bo_init(struct panthor_gem_object *b=
o, u32 type_mask)
> > > +{
> > > +	INIT_LIST_HEAD(&bo->debugfs.node); =20
> >
> > This should be called when the GEM object is created, otherwise the
> > list_empty() test done in panthor_gem_debugfs_bo_rm() will only work if
> > panthor_gem_debugfs_bo_add() is called, and depending on when this
> > happens, or whether it happens at all, the error path will do a NULL
> > deref. =20
>=20
> I'll be moving panthor_gem_debugfs_bo_add() back into panthor_gem_create_=
object() and
> inline panthor_gem_debugfs_bo_init() into it.

You mean moving the panthor_gem_debugfs_bo_add() call to
panthor_gem_create_object(), not inlining its content, right?

> > > +	} else {
> > > +		bo->debugfs.creator.tgid =3D 0;
> > > +		snprintf(bo->debugfs.creator.process_name,
> > > +			 sizeof(bo->debugfs.creator.process_name),
> > > +			 "kernel");
> > > +	}
> > > +
> > > +	bo->debugfs.bo_mask =3D type_mask; =20
> >
> > Why not do that directly in panthor_gem_debugfs_bo_add()? The only bits
> > that might be useful to do early is the INIT_LIST_HEAD(), and I think
> > it can be inlined in panthor_gem_create_object(). =20
>=20
> I'll be doing in this in the next revision, but because I've no access to=
 the BO
> type mask from inside Panthor's drm_driver::gem_create_object() binding, =
then
> I'll have to assign the mask right after the object has been created.
>=20
> I think this means there might be a short window after the object's been =
added to
> the DebugFS GEMs list in which it could be shown with the kernel mask fie=
ld still
> set to 0, but I guess that's not too important either.

I think it's okay, as long as you don't crash when printing partially
initialized objects. Another solution would be to have a flag encoding
when the obj is initialized, so you can skip objects that don't have
this flag set yet.

