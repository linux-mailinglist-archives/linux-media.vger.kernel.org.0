Return-Path: <linux-media+bounces-30249-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFDAA89F2F
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 15:16:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E08AC17AE98
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 13:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EB0129A3C7;
	Tue, 15 Apr 2025 13:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="R9yTmNJ9"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8524F2973CE
	for <linux-media@vger.kernel.org>; Tue, 15 Apr 2025 13:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744722957; cv=none; b=dHLEkx22NYysySdF5bsE2kcRPNsKfg3G5oHmWi47u2II/MIY6aaijTaHZPhfWVt3zP7a/Juky15JQrvZkX5i8OahmQjWdeEU+KrmNcJ+WCueNBqTiXCpqOQzm2m2uoPu6B9Ok2EXsWQASIo75xTT2GNGYxhVfdFbGjrnb90LBxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744722957; c=relaxed/simple;
	bh=3vgHieO2AJpal5F1LuNhLN4FjXtEOsywJMgTYWQDnx8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oqa4eoB/HTmAulSSiXYykqIxfJ2Sb4+818c6QJ3z6JG3RpAA0gtsigRXSTsFNpgCs6rTdrQLqvvZguIL2cc1ytVnNRn7XO3vDk8RmYjZ4QEbERF+brt8MnLR0L3V0cmgixT3Aevf7VUtyad8mD7ESI0Lah4+KJKVsgMkokrCbA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=R9yTmNJ9; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744722950;
	bh=3vgHieO2AJpal5F1LuNhLN4FjXtEOsywJMgTYWQDnx8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=R9yTmNJ9I4uOIMQK+irT0Um+RZWz2IzujA0Om6MhncszHWmkfXITKFmMgBJuEF2OA
	 QRBlncf/Jaz5GnYFZPbrRliEmlQsgIfEixOLWGjnxdv/6Sqi1294xOsOIhtlkcH+1K
	 rthHRqwTVRvq0DB1IOoj52gonYsmii0+yz7tXTf7CaWJZJ/Ob/DhKZxdZj3R6PMEoo
	 DZ6K+nc+sXWGvxO7oX+/w49BwUfkqDml3NY71SILXiTKyId1+Ie93SOth+bA2flq8G
	 xMwgjeQEqerJAYd/qoClQYMiLKj0OzGKVt+3BW0C9RBlM0H4yPOBQBiXGtj67yvB/A
	 FL1RC5ObJ8m2g==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0327B17E35E5;
	Tue, 15 Apr 2025 15:15:49 +0200 (CEST)
Date: Tue, 15 Apr 2025 15:15:47 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
 airlied@gmail.com, asrivats@redhat.com, andyshrk@163.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH] drm/gem: Internally test import_attach for imported
 objects
Message-ID: <20250415151547.3c9f5444@collabora.com>
In-Reply-To: <b924ffa7-99c0-42f1-9170-069e92299021@amd.com>
References: <20250415092057.63172-1-tzimmermann@suse.de>
	<e2e82102-eb9f-4eb6-8ac3-6122ed7fcf28@amd.com>
	<48ab9b82-0d26-4d7c-88b0-feab9762b128@suse.de>
	<b924ffa7-99c0-42f1-9170-069e92299021@amd.com>
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

On Tue, 15 Apr 2025 14:19:20 +0200
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> Am 15.04.25 um 12:45 schrieb Thomas Zimmermann:
> > Hi
> >
> > Am 15.04.25 um 11:39 schrieb Christian K=C3=B6nig: =20
> >> Am 15.04.25 um 11:20 schrieb Thomas Zimmermann: =20
> >>> Test struct drm_gem_object.import_attach to detect imported
> >>> objects during cleanup. At that point, the imported DMA buffer
> >>> might have already been released and the dma_buf field is NULL.
> >>> The object's free callback then does a cleanup as for native
> >>> objects. =20
> >> I don't think that this is a good idea.
> >>
> >> The DMA-buf is separately reference counted through the import
> >> attachment. =20
> >
> > I understand that it's not ideal, but testing for import_attach to
> > be set is what we currently do throughout drivers. Putting this
> > behind an interface is already a step forward.=20
> >> =20
> >>> Happens for calls to drm_mode_destroy_dumb_ioctl() that eventually
> >>> clear the dma_buf field in
> >>> drm_gem_object_exported_dma_buf_free(). =20
> >> That is for exported DMA-buf and should *NEVER* be used for
> >> imported ones. =20
> >
> > Did you look at the discussion at the Closes tag? Where else could
> > dma-buf be cleared? =20
>=20
> Yeah, I've seen that. The solution is just completely wrong.
>=20
> See for the export case obj->dma_buf points to the exported DMA-buf
> and causes a circle dependency when not set to NULL when the last
> handle is released.

I can confirm this is causing a regression in Panthor, where the driver
holds references to GEMs that might have been released by userspace, so
it's not just drivers calling drm_mode_destroy_dumb_ioctl(). This leads
drm_gem_is_imported() to return inconsistent values depending on when
the function is called (before/after the handle creation/destruction).
This patch seems to fix the problem, but I can't tell if it's the right
thing to do.

