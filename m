Return-Path: <linux-media+bounces-11816-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 843448CD1F9
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 14:14:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3AC3E2838E9
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 12:14:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03105149E18;
	Thu, 23 May 2024 12:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="LsRnHD7U"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84CD149E08;
	Thu, 23 May 2024 12:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716466396; cv=none; b=SIib0OWi2eBukFHvGpOJjhXM69MFIfOF0OLTeMc8SfoTinW8AE2O2ee4JCIvJ7SQDXy0FyerRDLbjYI7pet+S9nGRRAFnvX4FELWqDnEm1mSi85mtLxJL99JUXb9nwbqO/kwflGzZ3Jl2c+ftXjBBCyyMmptBsKw9fY9OIwe0eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716466396; c=relaxed/simple;
	bh=133f/ppm7e5WBFptxyFQbVG8EMvUy33o+cg2kVvmScs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q45WOyzfEXYSlw+YG3d1bMsNEWRFSetw5HgAWuCgMS38yyAHUV5wSLSKNTbTrAks84N7VXRd0NrlZRRTo/lDGf9u1xX10TXCc5Sbigh14nW+6wJrRlhKLRBtcIxWNb6pHh526b4ujDGxCahv8oMQqc4d1/OosR66U15F841Ftu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=LsRnHD7U; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716466392;
	bh=133f/ppm7e5WBFptxyFQbVG8EMvUy33o+cg2kVvmScs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LsRnHD7Uog2ITakq18wy7ygWug9EUT5qq3HeLJPOLkNCEWXIWvV3jEGvKsSXitW+L
	 +Q0s/o0GlcJv03qWXltfU4ZIym4/y+4S6bo/4euqa865crfewK2SsJTDcIg7cnnHtw
	 2pqgNAqpF3qEH0uZ00g9b0ouzJcI+qPVx613LpkpINUCHcAjq2h51ZXh9ZbPIWKGhD
	 aTK9hMQYrG0cJKzQopG+cFrea36aO3ueov7NiMz3A2uRovuGwfbVuNCcWbvu0fqsnk
	 utNHZm4Aio+FkPH03/08V8ZwbzBhDvAmIbOvJ8M5hGHwQQDLPMowTlweFEkRqhLxrT
	 c1Evhc1QMnppQ==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E5B303782039;
	Thu, 23 May 2024 12:13:11 +0000 (UTC)
Date: Thu, 23 May 2024 14:13:10 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Dmitry Osipenko
 <dmitry.osipenko@collabora.com>, Zack Rusin <zack.rusin@broadcom.com>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v4 1/3] drm/panfrost: Fix dma_resv deadlock at drm
 object pin time
Message-ID: <20240523141310.0b12c83c@collabora.com>
In-Reply-To: <20240523113236.432585-2-adrian.larumbe@collabora.com>
References: <20240523113236.432585-1-adrian.larumbe@collabora.com>
	<20240523113236.432585-2-adrian.larumbe@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 23 May 2024 12:32:17 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> When Panfrost must pin an object that is being prepared a dma-buf
> attachment for on behalf of another driver, the core drm gem object pinni=
ng
> code already takes a lock on the object's dma reservation.
>=20
> However, Panfrost GEM object's pinning callback would eventually try taki=
ng
> the lock on the same dma reservation when delegating pinning of the object
> onto the shmem subsystem, which led to a deadlock.
>=20
> This can be shown by enabling CONFIG_DEBUG_WW_MUTEX_SLOWPATH, which throws
> the following recursive locking situation:
>=20
> weston/3440 is trying to acquire lock:
> ffff000000e235a0 (reservation_ww_class_mutex){+.+.}-{3:3}, at: drm_gem_sh=
mem_pin+0x34/0xb8 [drm_shmem_helper]
> but task is already holding lock:
> ffff000000e235a0 (reservation_ww_class_mutex){+.+.}-{3:3}, at: drm_gem_pi=
n+0x2c/0x80 [drm]
>=20
> Fix it by replacing drm_gem_shmem_pin with its locked version, as the lock
> had already been taken by drm_gem_pin().
>=20
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Steven Price <steven.price@arm.com>
> Fixes: a78027847226 ("drm/gem: Acquire reservation lock in drm_gem_{pin/u=
npin}()")
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_gem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/pa=
nfrost/panfrost_gem.c
> index d47b40b82b0b..8e0ff3efede7 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
> @@ -192,7 +192,7 @@ static int panfrost_gem_pin(struct drm_gem_object *ob=
j)
>  	if (bo->is_heap)
>  		return -EINVAL;
> =20
> -	return drm_gem_shmem_pin(&bo->base);
> +	return drm_gem_shmem_pin_locked(&bo->base);
>  }
> =20
>  static enum drm_gem_object_status panfrost_gem_status(struct drm_gem_obj=
ect *obj)


