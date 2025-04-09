Return-Path: <linux-media+bounces-29718-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9272CA81F43
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 10:07:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43E2A3B7A88
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 08:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E22825A634;
	Wed,  9 Apr 2025 08:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="a/FKFrCa"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7373C25A620;
	Wed,  9 Apr 2025 08:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744185766; cv=none; b=R1sDRaE8j4nANunxapx1jhhzr1hSCA1T8qZE1tEykZ7+ghh5ZYIpv5VVkjRtDB4Yuay5l3Mwy1Ml2fovfGrOzgLmndeCaDE4O5UXUqzfoqKtCClewA7LD/u05JFi1uNip5fj1+9rz/azcReXKML24wyhzIOM2itZSFL2hn3WSxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744185766; c=relaxed/simple;
	bh=7JaXlk6Ow9kqmxyDvnnDUnrF65VEYrVRFf8JaGGZOzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GIx6VZlQ0McHZcTGOJ6iu9r03FfTsVvlwvXrCtYMuUDR6dx2fODZdWrrIGCStNrbSoKYysQphIOKtKemWZ1KR4wadzeRR7ENyxmyznY0u0K71UYpPcBetZnB6bSUoDTITc8gzjef9EomAPQBJNoUe/vraAUQATkJkfGAOSBWzNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=a/FKFrCa; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744185762;
	bh=7JaXlk6Ow9kqmxyDvnnDUnrF65VEYrVRFf8JaGGZOzQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=a/FKFrCa77AVRLxjzYVOvcjwp+87ulCaBy9i3Sc5IcLSkwc61Q0yuCOBHqIkY8fhJ
	 a1Ay1U0RhhezDhFFNsR98n86ynE3q1rsMBxcJ2ECvcrmKoRDUhc42ocS5pNkJqatrv
	 x17qvv+xbAZuHRqlQXDJTs2G4wgKlv1fJRpHB7/0x2sjO1joIoGKHdD4UrQungmhmw
	 moti4p1yuyefkKWKLYmsjQbRKriNaDoubLISqG0TNJkRCo79F5818GditJBrmHmjAy
	 EZj9CF8PcLmpKpStDSaZ117+PlvknNFC0fPFQ5F9Nzr88OM3c3pK7zTUhXD4492XVd
	 gs+pGjfbQrWew==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F2C1317E07F3;
	Wed,  9 Apr 2025 10:02:41 +0200 (CEST)
Date: Wed, 9 Apr 2025 10:02:37 +0200
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
Subject: Re: [PATCH v5 2/4] drm/panthor: Add driver IOCTL for setting BO
 labels
Message-ID: <20250409100237.1a152238@collabora.com>
In-Reply-To: <20250408222427.1214330-3-adrian.larumbe@collabora.com>
References: <20250408222427.1214330-1-adrian.larumbe@collabora.com>
	<20250408222427.1214330-3-adrian.larumbe@collabora.com>
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

On Tue,  8 Apr 2025 23:24:22 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Allow UM to label a BO for which it possesses a DRM handle.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Just one minor doc issue below, but with this fixed, it's

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/panthor/panthor_drv.c | 42 ++++++++++++++++++++++++++-
>  drivers/gpu/drm/panthor/panthor_gem.h |  2 ++
>  include/uapi/drm/panthor_drm.h        | 19 ++++++++++++
>  3 files changed, 62 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/pant=
hor/panthor_drv.c
> index 310bb44abe1a..163c027562aa 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1330,6 +1330,44 @@ static int panthor_ioctl_vm_get_state(struct drm_d=
evice *ddev, void *data,
>  	return 0;
>  }
> =20
> +static int panthor_ioctl_bo_set_label(struct drm_device *ddev, void *dat=
a,
> +				  struct drm_file *file)
> +{
> +	struct drm_panthor_bo_set_label *args =3D data;
> +	struct drm_gem_object *obj;
> +	const char *label;
> +	int ret =3D 0;
> +
> +	obj =3D drm_gem_object_lookup(file, args->handle);
> +	if (!obj)
> +		return -ENOENT;
> +
> +	if (args->size && args->label) {
> +		if (args->size > PANTHOR_BO_LABEL_MAXLEN) {
> +			ret =3D -E2BIG;
> +			goto err_label;
> +		}
> +
> +		label =3D strndup_user(u64_to_user_ptr(args->label), args->size);
> +		if (IS_ERR(label)) {
> +			ret =3D PTR_ERR(label);
> +			goto err_label;
> +		}
> +	} else if (args->size && !args->label) {
> +		ret =3D -EINVAL;
> +		goto err_label;
> +	} else {
> +		label =3D NULL;
> +	}
> +
> +	panthor_gem_bo_set_label(obj, label);
> +
> +err_label:
> +	drm_gem_object_put(obj);
> +
> +	return ret;
> +}
> +
>  static int
>  panthor_open(struct drm_device *ddev, struct drm_file *file)
>  {
> @@ -1399,6 +1437,7 @@ static const struct drm_ioctl_desc panthor_drm_driv=
er_ioctls[] =3D {
>  	PANTHOR_IOCTL(TILER_HEAP_CREATE, tiler_heap_create, DRM_RENDER_ALLOW),
>  	PANTHOR_IOCTL(TILER_HEAP_DESTROY, tiler_heap_destroy, DRM_RENDER_ALLOW),
>  	PANTHOR_IOCTL(GROUP_SUBMIT, group_submit, DRM_RENDER_ALLOW),
> +	PANTHOR_IOCTL(BO_SET_LABEL, bo_set_label, DRM_RENDER_ALLOW),
>  };
> =20
>  static int panthor_mmap(struct file *filp, struct vm_area_struct *vma)
> @@ -1508,6 +1547,7 @@ static void panthor_debugfs_init(struct drm_minor *=
minor)
>   * - 1.2 - adds DEV_QUERY_GROUP_PRIORITIES_INFO query
>   *       - adds PANTHOR_GROUP_PRIORITY_REALTIME priority
>   * - 1.3 - adds DRM_PANTHOR_GROUP_STATE_INNOCENT flag
> + * - 1.4 - adds DRM_IOCTL_PANTHOR_BO_SET_LABEL ioctl
>   */
>  static const struct drm_driver panthor_drm_driver =3D {
>  	.driver_features =3D DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
> @@ -1521,7 +1561,7 @@ static const struct drm_driver panthor_drm_driver =
=3D {
>  	.name =3D "panthor",
>  	.desc =3D "Panthor DRM driver",
>  	.major =3D 1,
> -	.minor =3D 3,
> +	.minor =3D 4,
> =20
>  	.gem_create_object =3D panthor_gem_create_object,
>  	.gem_prime_import_sg_table =3D drm_gem_shmem_prime_import_sg_table,
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/pant=
hor/panthor_gem.h
> index 0582826b341a..e18fbc093abd 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.h
> +++ b/drivers/gpu/drm/panthor/panthor_gem.h
> @@ -13,6 +13,8 @@
> =20
>  struct panthor_vm;
> =20
> +#define PANTHOR_BO_LABEL_MAXLEN	PAGE_SIZE
> +
>  /**
>   * struct panthor_gem_object - Driver specific GEM object.
>   */
> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_dr=
m.h
> index 97e2c4510e69..26b52f147360 100644
> --- a/include/uapi/drm/panthor_drm.h
> +++ b/include/uapi/drm/panthor_drm.h
> @@ -127,6 +127,9 @@ enum drm_panthor_ioctl_id {
> =20
>  	/** @DRM_PANTHOR_TILER_HEAP_DESTROY: Destroy a tiler heap. */
>  	DRM_PANTHOR_TILER_HEAP_DESTROY,
> +
> +	/** @DRM_PANTHOR_BO_SET_LABEL: Label a BO. */
> +	DRM_PANTHOR_BO_SET_LABEL,
>  };
> =20
>  /**
> @@ -977,6 +980,20 @@ struct drm_panthor_tiler_heap_destroy {
>  	__u32 pad;
>  };
> =20
> +/**
> + * struct drm_panthor_bo_set_label - Arguments passed to DRM_IOCTL_PANTH=
OR_BO_SET_LABEL
> + */
> +struct drm_panthor_bo_set_label {
> +	/** @handle: Handle of the buffer object to label. */
> +	__u32 handle;
> +
> +	/** @size: Length of the label, including the NULL terminator. */

We probably want to document the limit here (page size).

> +	__u32 size;
> +
> +	/** @label: User pointer to a NULL-terminated string */
> +	__u64 label;
> +};
> +
>  /**
>   * DRM_IOCTL_PANTHOR() - Build a Panthor IOCTL number
>   * @__access: Access type. Must be R, W or RW.
> @@ -1019,6 +1036,8 @@ enum {
>  		DRM_IOCTL_PANTHOR(WR, TILER_HEAP_CREATE, tiler_heap_create),
>  	DRM_IOCTL_PANTHOR_TILER_HEAP_DESTROY =3D
>  		DRM_IOCTL_PANTHOR(WR, TILER_HEAP_DESTROY, tiler_heap_destroy),
> +	DRM_IOCTL_PANTHOR_BO_SET_LABEL =3D
> +		DRM_IOCTL_PANTHOR(WR, BO_SET_LABEL, bo_set_label),
>  };
> =20
>  #if defined(__cplusplus)


