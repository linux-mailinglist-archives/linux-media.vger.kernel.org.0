Return-Path: <linux-media+bounces-30265-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 906AEA8A0D1
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 16:20:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36E8D3ADEA9
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 14:19:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D46EA1F4614;
	Tue, 15 Apr 2025 14:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="nAZFsoFu"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DB3133987
	for <linux-media@vger.kernel.org>; Tue, 15 Apr 2025 14:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744726793; cv=none; b=duD3u4+8+aApjvMB+ycq3yNeP+SjwbaOMS03vFD9XQ+EAX8t/0W9ZuauGFncU2C5ppdnFD58MJ8U3YzJrNvU3nVv8UFZhzr67eO3Bf8Rut2wkvChkCrd5UFP0PaQDVMbF8cYtGHAZ/FNXhPk/evGzVQ7BeOiANhA3BUwu/B4xTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744726793; c=relaxed/simple;
	bh=dgp++Cs6W5q5h7MD0VTVdEsM0Lu3z7/pIHAVL7SrCWI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W/zH4rYdFNuNiWaWUcBF58/Ir9VgG15xw6/wJSJrZiTyp6lZiAosO52BcFxuMC7qUXBytpMsqtV/SXRi1fNbleEvjRoN5HvFnnlZiNCzyJAOcHl42oiw7FrFnEWJUKEwoF3Z5heOqTRa1qZi5N7UUEDzY7tw4eyrO7ePVjnqFAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=nAZFsoFu; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744726788;
	bh=dgp++Cs6W5q5h7MD0VTVdEsM0Lu3z7/pIHAVL7SrCWI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nAZFsoFu5UixEaV59cW6odqB2rul+Pc17rw0Qcyz8SkH1ot6IGqAkpl3vNFUBNkIW
	 gB1Sai912BUoUIKyEg6fUJYgGpnzfX0XXhvGsC75jFp5JY8Sgp2PIoO3YktqOeJ0wF
	 gLLKa29qG17gVVgsH7pipVgpWL5Ql0Ddp3bWjict2TOPlSRYIZeJMnzI0+e11LOpy0
	 mKFsjbETMCQY34AiFkePu8ujWZ7V+Ns+tgiAJG0KGfACPph3Rw3cvWPGsaEZPsa6/Y
	 hfs5Jyh4u3rjtgFNRRu93uk3CFRz9Jy523SdA3vz//BruoA4g0PL96UfzCmzUyRP7j
	 mIcz5xaFkLnTw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5F4A017E1134;
	Tue, 15 Apr 2025 16:19:48 +0200 (CEST)
Date: Tue, 15 Apr 2025 16:19:43 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com
Cc: simona@ffwll.ch, airlied@gmail.com, asrivats@redhat.com,
 andyshrk@163.com, christian.koenig@amd.com, mripard@kernel.org,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v2] drm/gem: Internally test import_attach for imported
 objects
Message-ID: <20250415161943.7c51c388@collabora.com>
In-Reply-To: <20250415140256.299550-1-tzimmermann@suse.de>
References: <20250415140256.299550-1-tzimmermann@suse.de>
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

On Tue, 15 Apr 2025 16:02:20 +0200
Thomas Zimmermann <tzimmermann@suse.de> wrote:

> Test struct drm_gem_object.import_attach.dmabuf to detect imported
> objects. Warn if the stored state is inconsistent.
>=20
> During object clenaup, the dma_buf field might be NULL. Testing it in
> an object's free callback then incorrectly does a cleanup as for native
> objects. Happens for calls to drm_mode_destroy_dumb_ioctl() that
> clears the dma_buf field in drm_gem_object_exported_dma_buf_free().
>=20
> v2:
> - use import_attach.dmabuf instead of dma_buf (Christian)
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: b57aa47d39e9 ("drm/gem: Test for imported GEM buffers with helper")
> Reported-by: Andy Yan <andyshrk@163.com>
> Closes: https://lore.kernel.org/dri-devel/38d09d34.4354.196379aa560.Corem=
ail.andyshrk@163.com/
> Tested-by: Andy Yan <andyshrk@163.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Anusha Srivatsa <asrivats@redhat.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> ---
>  include/drm/drm_gem.h | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
>=20
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index 9b71f7a9f3f8..464b9c7feec0 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -579,6 +579,21 @@ static inline bool drm_gem_object_is_shared_for_memo=
ry_stats(struct drm_gem_obje
>  	return (obj->handle_count > 1) || obj->dma_buf;
>  }
> =20
> +/**
> + * drm_gem_owns_dma_buf() - Tests if GEM object backs a DMA-buffer object
> + * @obj: the GEM object
> + * @obj: the DMA buffer
> + *
> + * Returns:
> + * True if the DMA buffer refers to the GEM object's buffer.
> + */
> +static inline bool drm_gem_owns_dma_buf(const struct drm_gem_object *obj,
> +					const struct dma_buf *dma_buf)
> +{
> +	/* The dma-buf's priv field points to the original GEM object. */
> +	return dma_buf->priv =3D=3D obj;
> +}
> +
>  /**
>   * drm_gem_is_imported() - Tests if GEM object's buffer has been imported
>   * @obj: the GEM object
> @@ -588,8 +603,15 @@ static inline bool drm_gem_object_is_shared_for_memo=
ry_stats(struct drm_gem_obje
>   */
>  static inline bool drm_gem_is_imported(const struct drm_gem_object *obj)
>  {
> -	/* The dma-buf's priv field points to the original GEM object. */
> -	return obj->dma_buf && (obj->dma_buf->priv !=3D obj);
> +	const struct dma_buf *dma_buf =3D NULL;
> +
> +	if (!obj->import_attach)
> +		return false;
> +
> +	dma_buf =3D obj->import_attach->dmabuf;
> +
> +	/* Warn if we somehow reimported our own buffer. */
> +	return !drm_WARN_ON_ONCE(obj->dev, !dma_buf || drm_gem_owns_dma_buf(obj=
, dma_buf));

I'm honestly not sure I see the point of checking
obj->import_attach->dmabuf. If obj->import_attach !=3D NULL, we're sure
it's a foreign buffer already, otherwise we would get the original GEM
object which has ->import_attach=3DNULL. So why not go for a simple

	return obj->import_attach !=3D NULL;

check, and extend the check when you get to implement imports without
import attachments (not sure what those would look like BTW).

