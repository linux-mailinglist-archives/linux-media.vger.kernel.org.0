Return-Path: <linux-media+bounces-11817-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CA08CD201
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 14:14:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76EF81F224D8
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 12:14:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3D1D14A4DF;
	Thu, 23 May 2024 12:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="qxj091ez"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A0314A0B8;
	Thu, 23 May 2024 12:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716466406; cv=none; b=bYviHdv4+ekUouWb0edIbLlidt/zYGKh0KLTZmIhHh2/g0k+dkCifIwSrqhpUWDmb4uz5OO5I11xCCsrsFZfzuYCgkxwjO6/iNQwLVSLwyvo0j7/8uHvQTXZmfxAnTQ/jahuza/9sKY9+Yj88LrWeQe7QRKHbbhAXMUps/Zuuag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716466406; c=relaxed/simple;
	bh=+CYaVxTzq0ceeLUfwVvZ2nYbnTRs9uaqpHkH+8hVsI0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YWOOgyz5opu9D/V8uf+jBT2RZbnd3Vwg/ssIUDjlo99egOJQypBhk7UCxGvMEeetTT+i7UVvwq1fzraCCRgqIUTYaRj+VAuryawTdiI/01/rkrOkOO9uSSS/2apci8SVTD2ZG2IIVu8ohGyloCdcyrcQXvRT4+DHJx5Xa3RDWSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=qxj091ez; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716466403;
	bh=+CYaVxTzq0ceeLUfwVvZ2nYbnTRs9uaqpHkH+8hVsI0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qxj091ezU6J4Fi5axDKhXEY+6AH4RF97BlNBObMD0d/Ay46uRPApd+bV4Lr1KjFHX
	 Li3b/WIjk7MOYGGrAdiDyXsUGz+UBC3PzkQXaLSJnQA/Sf9HxeF+zLa2guF3Z+jZni
	 8pVnuArxpFyYW/fD5SVpinh4yknPtWU0z08URfYJIDvmSacZLL6jWEP4NB/AjIzieD
	 XyLvj59Eu175MLhJSTLZQ/9dgSG3SEYmNBte/u+rd/QfHeCaBwmNNnB5ZMk6Gd4sNp
	 HTf+ikygIrjujcfXwy7BW3xmlOjL0Mdmx+xSWfQ5/wBn4jy00OP+mU3oAiWttWr5o+
	 3QS9nFpM729XA==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5EC473782039;
	Thu, 23 May 2024 12:13:22 +0000 (UTC)
Date: Thu, 23 May 2024 14:13:21 +0200
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
Subject: Re: [PATCH v4 2/3] drm/lima: Fix dma_resv deadlock at drm object
 pin time
Message-ID: <20240523141321.52ea7224@collabora.com>
In-Reply-To: <20240523113236.432585-3-adrian.larumbe@collabora.com>
References: <20240523113236.432585-1-adrian.larumbe@collabora.com>
	<20240523113236.432585-3-adrian.larumbe@collabora.com>
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

On Thu, 23 May 2024 12:32:18 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Commit a78027847226 ("drm/gem: Acquire reservation lock in
> drm_gem_{pin/unpin}()") moved locking the DRM object's dma reservation to
> drm_gem_pin(), but Lima's pin callback kept calling drm_gem_shmem_pin,
> which also tries to lock the same dma_resv, leading to a double lock
> situation.
>=20
> As was already done for Panfrost in the previous commit, fix it by
> replacing drm_gem_shmem_pin() with its locked variant.
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
>  drivers/gpu/drm/lima/lima_gem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_=
gem.c
> index 7ea244d876ca..9bb997dbb4b9 100644
> --- a/drivers/gpu/drm/lima/lima_gem.c
> +++ b/drivers/gpu/drm/lima/lima_gem.c
> @@ -185,7 +185,7 @@ static int lima_gem_pin(struct drm_gem_object *obj)
>  	if (bo->heap_size)
>  		return -EINVAL;
> =20
> -	return drm_gem_shmem_pin(&bo->base);
> +	return drm_gem_shmem_pin_locked(&bo->base);
>  }
> =20
>  static int lima_gem_vmap(struct drm_gem_object *obj, struct iosys_map *m=
ap)


