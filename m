Return-Path: <linux-media+bounces-29236-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF55A78F3F
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 14:59:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4976D1721C2
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 12:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A29223A981;
	Wed,  2 Apr 2025 12:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="AX5LkIwZ"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27530238D5A;
	Wed,  2 Apr 2025 12:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743598693; cv=none; b=JEhyBUZe/P0YOo1AO+QQMggoVhUoWtvVX581BUnvtMSmgzI14AqVctjYFR6XLD1X/n+jj839JM8+iwmWdBSSRNkBwst/IkbWXF804OIX59DKO6TfYoX3+9uCrHncP0kydZoulDugOMlAbpz+keN4JPKpOJ3z8eskGbosvBtWKw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743598693; c=relaxed/simple;
	bh=UK42PdnMtf0Qa5rMpsbgRc0+I+IawzFM3jt4sOSw3C0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uW65lmbSkdp8zQZoA3hibTqzjihsq8upm5ZcTRpCFChGYjFiHpcpdjrb6G2uXn9NDRyzsLpUBZ7/AYMok+MrdUsoydVF9iXRIxKQX9eao3/QqNWXQPfLl/j6yxtnPlbbroXXULli5fj6Rn9tQJgwrA/6PHeWipuxZL3dW2GFeYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=AX5LkIwZ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743598689;
	bh=UK42PdnMtf0Qa5rMpsbgRc0+I+IawzFM3jt4sOSw3C0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AX5LkIwZQUhw0VHtm8dOT70p9dlZA5aMbbBsDM+5v3iZLrd3aZ2ltQ7TEh2hpR4Yf
	 Y1Yh4ptpTjc3V/wtZ2QVPOT82RjojLEnIrLMZ6soHNhCZEBJaiLBRpi2FJ6uHhDHt+
	 6db3vc7I1j1SvVy0JJQR/vRcpgkkw6P/uA1MN4nvl/xVwdK3Tpae6hpRfYSXV/Z1o3
	 W+3r85QRruiwHy+IMUDq/QnbswjxuDKdooP3+eEr2un9XnmXIlfKUpBpCYh21aO1vE
	 9GlKwFKxMvvRZEJtcKmCCAHRHPy9LBSZagmoWESnUX8vGx6Xn9aM7S6w3QXdX/vHWf
	 nO6skZ274TGHA==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9DEDE17E0865;
	Wed,  2 Apr 2025 14:58:08 +0200 (CEST)
Date: Wed, 2 Apr 2025 14:58:04 +0200
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
Message-ID: <20250402145804.5cf07f5e@collabora.com>
In-Reply-To: <20250402115432.1469703-5-adrian.larumbe@collabora.com>
References: <20250402115432.1469703-1-adrian.larumbe@collabora.com>
	<20250402115432.1469703-5-adrian.larumbe@collabora.com>
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

On Wed,  2 Apr 2025 12:54:29 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Add a device DebugFS file that displays a complete list of all the DRM
> GEM objects that are exposed to UM through a DRM handle.
>=20
> Since leaking object identifiers that might belong to a different NS is
> inadmissible, this functionality is only made available in debug builds
> with DEBUGFS support enabled.
>=20
> File format is that of a table, with each entry displaying a variety of
> fields with information about each GEM object.
>=20
> Each GEM object entry in the file displays the following information
> fields: Client PID, BO's global name, reference count, BO virtual size,
> BO resize size, VM address in its DRM-managed range, BO label and a flag
> bitmask.
>=20
> There's also a kflags field for the type of BO. Bit 0 tells us whether
> it's a kernel BO, and bit 1 means the BO is mapped onto the FW's address
> space.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_device.c |   5 +
>  drivers/gpu/drm/panthor/panthor_device.h |  11 ++
>  drivers/gpu/drm/panthor/panthor_drv.c    |  26 ++++
>  drivers/gpu/drm/panthor/panthor_gem.c    | 149 +++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_gem.h    |  35 ++++++
>  5 files changed, 226 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/p=
anthor/panthor_device.c
> index a9da1d1eeb70..b776e1a2e4f3 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -184,6 +184,11 @@ int panthor_device_init(struct panthor_device *ptdev)
>  	if (ret)
>  		return ret;
> =20
> +#ifdef CONFIG_DEBUG_FS
> +	drmm_mutex_init(&ptdev->base, &ptdev->gems.lock);
> +	INIT_LIST_HEAD(&ptdev->gems.node);
> +#endif
> +
>  	atomic_set(&ptdev->pm.state, PANTHOR_DEVICE_PM_STATE_SUSPENDED);
>  	p =3D alloc_page(GFP_KERNEL | __GFP_ZERO);
>  	if (!p)
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/p=
anthor/panthor_device.h
> index da6574021664..86206a961b38 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -205,6 +205,17 @@ struct panthor_device {
> =20
>  	/** @fast_rate: Maximum device clock frequency. Set by DVFS */
>  	unsigned long fast_rate;
> +
> +#ifdef CONFIG_DEBUG_FS
> +	/** @gems: Device-wide list of GEM objects owned by at least one file. =
*/
> +	struct {
> +		/** @gems.lock: Protects the device-wide list of GEM objects. */
> +		struct mutex lock;
> +
> +		/** @node: Used to keep track of all the device's DRM objects */
> +		struct list_head node;
> +	} gems;
> +#endif
>  };
> =20
>  struct panthor_gpu_usage {
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/pant=
hor/panthor_drv.c
> index d5277284fe27..3e870ed2ad90 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1534,9 +1534,35 @@ static const struct file_operations panthor_drm_dr=
iver_fops =3D {
>  };
> =20
>  #ifdef CONFIG_DEBUG_FS
> +static int panthor_gems_show(struct seq_file *m, void *data)
> +{
> +	struct drm_info_node *node =3D m->private;
> +	struct drm_device *dev =3D node->minor->dev;
> +	struct panthor_device *ptdev =3D container_of(dev, struct panthor_devic=
e, base);
> +
> +	panthor_gem_debugfs_print_bos(ptdev, m);
> +
> +	return 0;
> +}
> +
> +
> +static struct drm_info_list panthor_debugfs_list[] =3D {
> +	{"gems", panthor_gems_show, 0, NULL},
> +};
> +
> +static int panthor_gems_debugfs_init(struct drm_minor *minor)
> +{
> +	drm_debugfs_create_files(panthor_debugfs_list,
> +				 ARRAY_SIZE(panthor_debugfs_list),
> +				 minor->debugfs_root, minor);
> +
> +	return 0;
> +}
> +
>  static void panthor_debugfs_init(struct drm_minor *minor)
>  {
>  	panthor_mmu_debugfs_init(minor);
> +	panthor_gems_debugfs_init(minor);
>  }
>  #endif
> =20
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/pant=
hor/panthor_gem.c
> index 44d027e6d664..2fc87be9b700 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -2,6 +2,7 @@
>  /* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
>  /* Copyright 2023 Collabora ltd. */
> =20
> +#include <linux/cleanup.h>
>  #include <linux/dma-buf.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/err.h>
> @@ -10,14 +11,65 @@
>  #include <drm/panthor_drm.h>
> =20
>  #include "panthor_device.h"
> +#include "panthor_fw.h"
>  #include "panthor_gem.h"
>  #include "panthor_mmu.h"
> =20
> +#ifdef CONFIG_DEBUG_FS
> +static void panthor_gem_debugfs_bo_init(struct panthor_gem_object *bo, u=
32 type_mask)
> +{
> +	INIT_LIST_HEAD(&bo->debugfs.node);

This should be called when the GEM object is created, otherwise the
list_empty() test done in panthor_gem_debugfs_bo_rm() will only work if
panthor_gem_debugfs_bo_add() is called, and depending on when this
happens, or whether it happens at all, the error path will do a NULL
deref.

> +
> +	if (!(type_mask & PANTHOR_BO_FW_MAPPED)) {
> +		bo->debugfs.creator.tgid =3D current->group_leader->pid;
> +		get_task_comm(bo->debugfs.creator.process_name, current->group_leader);

I don't think that's good to assume that FW-mapped BOs have been
created by the kernel without userspace directly or indirectly asking
for the allocation. For instance, per-group memory allocated for the
USER_CS interfaces are indirectly triggered by a GROUP_CREATE ioctl(),
and should IMO be flagged as being created by the process that
created the group. Don't we have another way to check if we're called
from a kernel thread?

> +	} else {
> +		bo->debugfs.creator.tgid =3D 0;
> +		snprintf(bo->debugfs.creator.process_name,
> +			 sizeof(bo->debugfs.creator.process_name),
> +			 "kernel");
> +	}
> +
> +	bo->debugfs.bo_mask =3D type_mask;

Why not do that directly in panthor_gem_debugfs_bo_add()? The only bits
that might be useful to do early is the INIT_LIST_HEAD(), and I think
it can be inlined in panthor_gem_create_object().

> +}
> +
> +static void panthor_gem_debugfs_bo_add(struct panthor_gem_object *bo, u3=
2 type_mask)
> +{
> +	struct panthor_device *ptdev =3D  container_of(bo->base.base.dev,
> +						     struct panthor_device, base);
> +
> +	panthor_gem_debugfs_bo_init(bo, type_mask);
> +
> +	mutex_lock(&ptdev->gems.lock);
> +	list_add_tail(&bo->debugfs.node, &ptdev->gems.node);
> +	mutex_unlock(&ptdev->gems.lock);
> +}
> +
> +static void panthor_gem_debugfs_bo_rm(struct panthor_gem_object *bo)
> +{
> +	struct panthor_device *ptdev =3D container_of(bo->base.base.dev,
> +						    struct panthor_device, base);
> +
> +	if (list_empty(&bo->debugfs.node))
> +		return;
> +
> +	mutex_lock(&ptdev->gems.lock);
> +	list_del_init(&bo->debugfs.node);
> +	mutex_unlock(&ptdev->gems.lock);
> +}
> +
> +#else
> +static void panthor_gem_debugfs_bo_add(struct panthor_gem_object *bo, u3=
2 type_mask) {}
> +static void panthor_gem_debugfs_bo_rm(struct panthor_gem_object *bo) {}
> +#endif
> +
>  static void panthor_gem_free_object(struct drm_gem_object *obj)
>  {
>  	struct panthor_gem_object *bo =3D to_panthor_bo(obj);
>  	struct drm_gem_object *vm_root_gem =3D bo->exclusive_vm_root_gem;
> =20
> +	panthor_gem_debugfs_bo_rm(bo);
> +
>  	/*
>  	 * Label might have been allocated with kstrdup_const(),
>  	 * we need to take that into account when freeing the memory
> @@ -86,6 +138,7 @@ panthor_kernel_bo_create(struct panthor_device *ptdev,=
 struct panthor_vm *vm,
>  	struct drm_gem_shmem_object *obj;
>  	struct panthor_kernel_bo *kbo;
>  	struct panthor_gem_object *bo;
> +	u32 type_mask =3D PANTHOR_BO_KERNEL;
>  	int ret;
> =20
>  	if (drm_WARN_ON(&ptdev->base, !vm))
> @@ -105,7 +158,12 @@ panthor_kernel_bo_create(struct panthor_device *ptde=
v, struct panthor_vm *vm,
>  	kbo->obj =3D &obj->base;
>  	bo->flags =3D bo_flags;
> =20
> +	if (vm =3D=3D panthor_fw_vm(ptdev))
> +		type_mask |=3D PANTHOR_BO_FW_MAPPED;
> +
>  	panthor_gem_kernel_bo_set_label(kbo, name);
> +	panthor_gem_debugfs_bo_add(to_panthor_bo(kbo->obj), type_mask);
> +
>  	/* The system and GPU MMU page size might differ, which becomes a
>  	 * problem for FW sections that need to be mapped at explicit address
>  	 * since our PAGE_SIZE alignment might cover a VA range that's
> @@ -255,6 +313,8 @@ panthor_gem_create_with_handle(struct drm_file *file,
>  	/* drop reference from allocate - handle holds it now. */
>  	drm_gem_object_put(&shmem->base);
> =20
> +	panthor_gem_debugfs_bo_add(bo, 0);
> +
>  	return ret;
>  }
> =20
> @@ -286,3 +346,92 @@ panthor_gem_kernel_bo_set_label(struct panthor_kerne=
l_bo *bo, const char *label)
> =20
>  	panthor_gem_bo_set_label(bo->obj, kstrdup_const(str, GFP_KERNEL));
>  }
> +
> +#ifdef CONFIG_DEBUG_FS
> +static bool panfrost_gem_print_flag(const char *name,
> +				    bool is_set,
> +				    bool other_flags_printed,
> +				    struct seq_file *m)
> +{
> +	if (is_set)
> +		seq_printf(m, "%s%s", other_flags_printed ? "," : "", name);
> +
> +	return is_set | other_flags_printed;
> +}
> +
> +struct gem_size_totals {
> +	size_t size;
> +	size_t resident;
> +	size_t reclaimable;
> +};
> +
> +static void panthor_gem_debugfs_bo_print(struct panthor_gem_object *bo,
> +					 struct seq_file *m,
> +					 struct gem_size_totals *totals)
> +{
> +	unsigned int refcount =3D kref_read(&bo->base.base.refcount);
> +	char creator_info[32] =3D {};
> +	bool has_flags =3D false;
> +	size_t resident_size;
> +
> +	/* Skip BOs being destroyed. */
> +	if (!refcount)
> +		return;
> +
> +	resident_size =3D bo->base.pages !=3D NULL ? bo->base.base.size : 0;
> +
> +	snprintf(creator_info, sizeof(creator_info),
> +		 "%s/%d", bo->debugfs.creator.process_name, bo->debugfs.creator.tgid);
> +	seq_printf(m, "%-32s%-16d%-16d%-16zd%-16zd%-16lx",
> +		   creator_info,
> +		   bo->base.base.name,
> +		   refcount,
> +		   bo->base.base.size,
> +		   resident_size,
> +		   drm_vma_node_start(&bo->base.base.vma_node));
> +
> +	seq_puts(m, "(");
> +	has_flags =3D panfrost_gem_print_flag("imported", bo->base.base.import_=
attach !=3D NULL,
> +					    has_flags, m);
> +	has_flags =3D panfrost_gem_print_flag("exported", bo->base.base.dma_buf=
 !=3D NULL,
> +					    has_flags, m);
> +	if (bo->base.madv < 0)
> +		has_flags =3D panfrost_gem_print_flag("purged", true, has_flags, m);
> +	else if (bo->base.madv > 0)
> +		has_flags =3D panfrost_gem_print_flag("purgeable", true, has_flags, m);
> +	if (!has_flags)
> +		seq_puts(m, "none");
> +	seq_puts(m, ")");
> +
> +	seq_printf(m, "%-6s0x%-2x", "", bo->debugfs.bo_mask);
> +
> +	mutex_lock(&bo->label.lock);
> +	seq_printf(m, "%-6s%-60s", "", bo->label.str ? : NULL);
> +	mutex_unlock(&bo->label.lock);
> +	seq_puts(m, "\n");
> +
> +	totals->size +=3D bo->base.base.size;
> +	totals->resident +=3D resident_size;
> +	if (bo->base.madv > 0)
> +		totals->reclaimable +=3D resident_size;
> +}
> +
> +void panthor_gem_debugfs_print_bos(struct panthor_device *ptdev,
> +				   struct seq_file *m)
> +{
> +	struct gem_size_totals totals =3D {0};
> +	struct panthor_gem_object *bo;
> +
> +	seq_puts(m, "created-by                      global-name     refcount  =
      size            resident-size   file-offset     flags     kflags     =
label\n");
> +	seq_puts(m, "----------------------------------------------------------=
---------------------------------------------------------------------------=
-----------\n");
> +
> +	scoped_guard(mutex, &ptdev->gems.lock) {
> +		list_for_each_entry(bo, &ptdev->gems.node, debugfs.node)
> +			panthor_gem_debugfs_bo_print(bo, m, &totals);
> +	}
> +
> +	seq_puts(m, "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n");
> +	seq_printf(m, "Total size: %zd, Total resident: %zd, Total reclaimable:=
 %zd\n",
> +		   totals.size, totals.resident, totals.reclaimable);
> +}
> +#endif
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/pant=
hor/panthor_gem.h
> index 49daa5088a0d..22ecc0d39d5e 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.h
> +++ b/drivers/gpu/drm/panthor/panthor_gem.h
> @@ -15,6 +15,32 @@ struct panthor_vm;
> =20
>  #define PANTHOR_BO_LABEL_MAXLEN	PAGE_SIZE
> =20
> +#define PANTHOR_BO_KERNEL	BIT(0)
> +#define PANTHOR_BO_FW_MAPPED	BIT(1)
> +
> +/**
> + * struct panthor_gem_debugfs - GEM object's DebugFS list information
> + */
> +struct panthor_gem_debugfs {
> +	/**
> +	 * @node: Node used to insert the object in the device-wide list of
> +	 * GEM objects, to display information about it through a DebugFS file.
> +	 */
> +	struct list_head node;
> +
> +	/** @creator: Information about the UM process which created the GEM. */
> +	struct {
> +		/** @creator.process_name: Group leader name in owning thread's proces=
s */
> +		char process_name[TASK_COMM_LEN];
> +
> +		/** @creator.tgid: PID of the thread's group leader within its process=
 */
> +		pid_t tgid;
> +	} creator;
> +
> +	/** @bo_mask: Bitmask encoding BO type as {USER, KERNEL} x {GPU, FW} */
> +	u32 bo_mask;
> +};
> +
>  /**
>   * struct panthor_gem_object - Driver specific GEM object.
>   */
> @@ -62,6 +88,10 @@ struct panthor_gem_object {
>  		/** @lock.str: Protects access to the @label.str field. */
>  		struct mutex lock;
>  	} label;
> +
> +#ifdef CONFIG_DEBUG_FS
> +	struct panthor_gem_debugfs debugfs;
> +#endif
>  };
> =20
>  /**
> @@ -157,4 +187,9 @@ panthor_kernel_bo_create(struct panthor_device *ptdev=
, struct panthor_vm *vm,
> =20
>  void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo);
> =20
> +#ifdef CONFIG_DEBUG_FS
> +void panthor_gem_debugfs_print_bos(struct panthor_device *pfdev,
> +				   struct seq_file *m);
> +#endif
> +
>  #endif /* __PANTHOR_GEM_H__ */


