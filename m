Return-Path: <linux-media+bounces-61621-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFmEK1MWBmp3egIAu9opvQ
	(envelope-from <linux-media+bounces-61621-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 20:37:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE9C545EF9
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 20:37:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D028306D87A
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 18:36:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEC6139E184;
	Thu, 14 May 2026 18:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NTq5EELC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F0F2BDC26
	for <linux-media@vger.kernel.org>; Thu, 14 May 2026 18:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778783771; cv=pass; b=jwB1mAi1B2Yt3trQS5bWu+5dicoL0AlHwdYlHFQO4tXxJMli0//T8LVxKz0hDVy9Lqu9tFjIx09yrXvX2kbJcgkHWvo4nc1zkSiJydh4/IP3EICIj5oXfk+s4Qe9H5Mqa39KJdyaDKULHK9X81uFe+IHYVR+m1sxAMfmSpqbYtA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778783771; c=relaxed/simple;
	bh=/qIWB5kY3TSY57LzCuBoN0AR1W10eHt1AVZjRONzhw0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lTlHHH8H/HsuxArr7VHMzRF+vb0hvsk7w6FIEKJoj9X7ih9l8jmG3iDbk3SJm4w8K6BOmIMF8uT+WYQV0o/p6HLFwPFjZRpX5kg7zZuNWvhsPySm5Q4+Y5y9Xtof88AahBOHmeC4T3RyXc/hg4wnDJVdeOd9zxaFf446FHUYK6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NTq5EELC; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-65c21049dafso9235299d50.2
        for <linux-media@vger.kernel.org>; Thu, 14 May 2026 11:36:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778783769; cv=none;
        d=google.com; s=arc-20240605;
        b=a3aVbxU/9hFdbrnLxqOYugPq1N0btlj5SZiKPWCGqIY2SolGdQH0F7+yzQAoAMGaq5
         KCSAD3OGsVj9yLEdvqYIT8wR8R+n7ebEKuVR9882bEPTStg6FRhYU3dTbJqKiCU3ijAp
         UDFZ3D1Dgy98MVYKFWzrS66hdHsho7F5y1yKdbkyJhX/h4BIVL4blDOy6/a2iQkk5RRo
         mP071GcfYOXl+E1ePyda1a65feNRtYOSS8VB6oOfI5DbquHEZLDa07a0t5SrWLbI+U8L
         PeFuItj/xv5PkvwXKyVU8ck+ylPVNlky1RplNBMgDUZTipi/n09/BHChUazwNcMDJeIi
         ZDMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gr66I4EbYeT/UuRyaffQxl03WvTdMurTInphDstZDZs=;
        fh=2h7mzglrQdXtGXqyb9AaMUSl6Z9DykFdEPjKVsf8tOg=;
        b=JhspTsjeqeTB46vtirtTr3N88dmgMG9e9XYgenW2p1LKH3pn1pn3aM6sJVzxSaImZ0
         AH3+5Mg4KINW+2xUipWkwHCPmPo183sgx1oCsQCgYK46ma+37qRnqQJTx384D6pDeAZS
         KzR6KdRgxccpIlemyjJtYXvYiZOxzb13HNkVSIYaQRJTteSr/8xspqoQoC/Wai4n6pQY
         TLbglmXTQYjfUT6h/rL3Ms2/HqCzSijzzSFAiTmYNwNKRcIL7CdIc/ZDM0qRGKCTLtxG
         EbafjpltWhK8Hl6PkPWify30VjX/Ao7fso1QL+bPD808pkgHzLxyGMhBc9P553dbvT4D
         k4Yg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778783769; x=1779388569; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gr66I4EbYeT/UuRyaffQxl03WvTdMurTInphDstZDZs=;
        b=NTq5EELCzsk/7ARHyER/ImpxwPHKOhl2OpvHU38eBzBuYq1gHDvsF6Zm0cf35qPTx/
         PlRd3GEudCwtr1JRSh0KhcK6Ev8It7eGbcYtpDEmt49mTahP+O8XtoSjoLZtPtw+KEyy
         QSD0Ix9oUdw2WySuydmkIWj0XhflwmRdI8Z0vtpVfrMiNkVdHlHSEEKKv/lV4J+erbpv
         tKECBqxah395Qgp4eekBvA19W1IHrRNjybMO7cZxIoSG2N9qqAYi0juCeLhDSkqXyNlZ
         A4k0Y/uKPJuVMbTQnB6ONAhWSW88x/eEtSxqAYuOWW0BgzQFGPEjqy+3TNgi6s/Fb6Tj
         1MIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778783769; x=1779388569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gr66I4EbYeT/UuRyaffQxl03WvTdMurTInphDstZDZs=;
        b=GhZI+LHKfeze8PTnGTRPtpqt7cREnUsgA9NK27Y4R4J+PZy831kChXW3h0JPRhRoCu
         86RwWpD+eNCUMqn7l6SMNj7nH1lwjA3eKq7JTZWZa88SrCiQ397VXwyBfNFAguFJ/Y3t
         0EWv8GpaX7g6cejjGxLapivwjy9s9TO7qw3fFfZd5z912pvinjfEzcEms3gKF8/B5bhe
         aXV94LGqqII5rnxDDCdq8jsxu1SJItv0PUYfrbat+EbU5wcJxfHn9CnuIrNx2feWeDlf
         PpPkbroIYYkL67kChemaluVQATN7RwAoEsHVNShrVI3vjbsoJTcl4e1gAL2Q/b32uRAO
         Qs/w==
X-Forwarded-Encrypted: i=1; AFNElJ8kjMgWYUZRG8NTIGBu1ywImz7bKdP5uX9CHrSDTZBKSk1LquklnIHoI1ASXjqr+naBEUDqEQ7NMN5Jdw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfu9AFSzoiW8XLmzzPAjnQCdpn9xnR/z2C8SbDuiqXh8ybfehc
	oEbkN+4CADrl3a5P5yZTEfSwHxtSyTOaAUK9M88NdIFtMB49y/3jOABKR5hyCJXZSoiu1CbMzvE
	JZT5Uid6PgmD0NTog6iiPyWFULleKvz8=
X-Gm-Gg: Acq92OGfvReA76uOdUMJxm6nJqaAtpskyzS7hglYxYzux0xX9hO6gSgdBgqIGOvcz1W
	YRwz2Z9UT2uFe0XBEJIwY7rUEGMw+MfS0ipeSTUUw+aUQyimgO4l3fF0Z9ee/uOBQE7a526cBAM
	CkZ+fOLGvVtIfCRcKseJHBswvYwgkZSK3tIrWRd5A5lU3TFNJJlZFBnJoWtqugiMcKMZfy9s6l7
	JI7HNt8v182OW44hAypExhPBNJCjXiBXVjiGExFIScKfUFDKM44b7wz/j3IXi6MyDV3plAm+u45
	+NIl5sMouQXBrKt7PWptCntrsGkW94qUam7xNQb41ekcxfahlES7pilKLONbxUEiWMJYfxW8Ag=
	=
X-Received: by 2002:a05:690c:c4e3:b0:7b7:de6:3354 with SMTP id
 00721157ae682-7c95c200649mr5551647b3.37.1778783768824; Thu, 14 May 2026
 11:36:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513-panthor-guard-refactor-v1-0-f2d8c15a97ce@collabora.com> <20260513-panthor-guard-refactor-v1-4-f2d8c15a97ce@collabora.com>
In-Reply-To: <20260513-panthor-guard-refactor-v1-4-f2d8c15a97ce@collabora.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 14 May 2026 11:35:57 -0700
X-Gm-Features: AVHnY4J4cD0AEiTpmvsUklLKRJtAwfvkQDtSEGOv6mvu5PgrUOl4KINCC3wbUDk
Message-ID: <CAPaKu7RBuff70qMFdr4uq-tAzxqG5SGiRfwyc+0Wx8KDrk_D7g@mail.gmail.com>
Subject: Re: [PATCH 4/6] drm/panthor: Use guards for resv locking
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 2EE9C545EF9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61621-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,linaro.org,amd.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,lists.linaro.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[olvaffe@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 10:09=E2=80=AFAM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> Now that we have guards for resv locks, we can use them to simplify the
> core. The only manual lock/unlock remaining are the ones in
> panthor_gem_try_evict_no_resv_wait(), because the lock/unlock are
> in different for_each() loop scopes.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
> ---
>  drivers/gpu/drm/panthor/panthor_gem.c | 77 ++++++++++++-----------------=
------
>  drivers/gpu/drm/panthor/panthor_mmu.c | 16 ++++----
>  2 files changed, 32 insertions(+), 61 deletions(-)
>
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/pant=
hor/panthor_gem.c
> index a6fddc380e7d..94facdc8cfe1 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -339,13 +339,9 @@ panthor_gem_dev_map_get_sgt_locked(struct panthor_ge=
m_object *bo)
>  struct sg_table *
>  panthor_gem_get_dev_sgt(struct panthor_gem_object *bo)
>  {
> -       struct sg_table *sgt;
> +       guard(dma_resv)(bo->base.resv);
>
> -       dma_resv_lock(bo->base.resv, NULL);
> -       sgt =3D panthor_gem_dev_map_get_sgt_locked(bo);
> -       dma_resv_unlock(bo->base.resv);
> -
> -       return sgt;
> +       return panthor_gem_dev_map_get_sgt_locked(bo);
>  }
>
>  static void
> @@ -497,7 +493,7 @@ panthor_gem_prime_begin_cpu_access(struct dma_buf *dm=
a_buf,
>         struct panthor_gem_object *bo =3D to_panthor_bo(obj);
>         struct dma_buf_attachment *attach;
>
> -       dma_resv_lock(obj->resv, NULL);
> +       guard(dma_resv)(obj->resv);
>         if (bo->dmap.sgt)
>                 dma_sync_sgtable_for_cpu(drm_dev_dma_dev(dev), bo->dmap.s=
gt, dir);
>
> @@ -510,7 +506,6 @@ panthor_gem_prime_begin_cpu_access(struct dma_buf *dm=
a_buf,
>                 if (sgt)
>                         dma_sync_sgtable_for_cpu(attach->dev, sgt, dir);
>         }
> -       dma_resv_unlock(obj->resv);
>
>         return 0;
>  }
> @@ -524,7 +519,7 @@ panthor_gem_prime_end_cpu_access(struct dma_buf *dma_=
buf,
>         struct panthor_gem_object *bo =3D to_panthor_bo(obj);
>         struct dma_buf_attachment *attach;
>
> -       dma_resv_lock(obj->resv, NULL);
> +       guard(dma_resv)(obj->resv);
>         list_for_each_entry(attach, &dma_buf->attachments, node) {
>                 struct sg_table *sgt =3D attach->priv;
>
> @@ -538,7 +533,6 @@ panthor_gem_prime_end_cpu_access(struct dma_buf *dma_=
buf,
>         if (bo->dmap.sgt)
>                 dma_sync_sgtable_for_device(drm_dev_dma_dev(dev), bo->dma=
p.sgt, dir);
>
> -       dma_resv_unlock(obj->resv);
>         return 0;
>  }
>
> @@ -625,19 +619,15 @@ static void panthor_gem_unpin_locked(struct drm_gem=
_object *obj)
>
>  int panthor_gem_pin(struct panthor_gem_object *bo)
>  {
> -       int ret =3D 0;
> -
>         if (drm_gem_is_imported(&bo->base))
>                 return 0;
>
>         if (refcount_inc_not_zero(&bo->backing.pin_count))
>                 return 0;
>
> -       dma_resv_lock(bo->base.resv, NULL);
> -       ret =3D panthor_gem_backing_pin_locked(bo);
> -       dma_resv_unlock(bo->base.resv);
> +       guard(dma_resv)(bo->base.resv);
>
> -       return ret;
> +       return panthor_gem_backing_pin_locked(bo);
>  }
>
>  void panthor_gem_unpin(struct panthor_gem_object *bo)
> @@ -648,9 +638,8 @@ void panthor_gem_unpin(struct panthor_gem_object *bo)
>         if (refcount_dec_not_one(&bo->backing.pin_count))
>                 return;
>
> -       dma_resv_lock(bo->base.resv, NULL);
> +       guard(dma_resv)(bo->base.resv);
>         panthor_gem_backing_unpin_locked(bo);
> -       dma_resv_unlock(bo->base.resv);
>  }
>
>  int panthor_gem_swapin_locked(struct panthor_gem_object *bo)
> @@ -759,13 +748,12 @@ static int panthor_gem_mmap(struct drm_gem_object *=
obj, struct vm_area_struct *v
>                 return -EINVAL;
>
>         if (!refcount_inc_not_zero(&bo->cmap.mmap_count)) {
> -               dma_resv_lock(obj->resv, NULL);
> +               guard(dma_resv)(obj->resv);
>                 if (!refcount_inc_not_zero(&bo->cmap.mmap_count)) {
>                         refcount_set(&bo->cmap.mmap_count, 1);
>                         guard(mutex)(&bo->base.gpuva.lock);
>                         panthor_gem_update_reclaim_state_locked(bo, NULL)=
;
>                 }
> -               dma_resv_unlock(obj->resv);
>         }
>
>         vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
> @@ -814,18 +802,12 @@ static vm_fault_t nonblocking_page_setup(struct vm_=
fault *vmf,
>  {
>         struct vm_area_struct *vma =3D vmf->vma;
>         struct panthor_gem_object *bo =3D to_panthor_bo(vma->vm_private_d=
ata);
> -       vm_fault_t ret;
>
> -       if (!dma_resv_trylock(bo->base.resv))
> +       ACQUIRE(dma_resv_try, resv_guard)(bo->base.resv);
> +       if (ACQUIRE_ERR(dma_resv_try, &resv_guard) || !bo->backing.pages)
>                 return VM_FAULT_RETRY;
>
> -       if (bo->backing.pages)
> -               ret =3D insert_page(vmf, order, bo->backing.pages[page_of=
fset]);
> -       else
> -               ret =3D VM_FAULT_RETRY;
> -
> -       dma_resv_unlock(bo->base.resv);
> -       return ret;
> +       return insert_page(vmf, order, bo->backing.pages[page_offset]);
>  }
>
>  static vm_fault_t blocking_page_setup(struct vm_fault *vmf, unsigned int=
 order,
> @@ -835,8 +817,8 @@ static vm_fault_t blocking_page_setup(struct vm_fault=
 *vmf, unsigned int order,
>         vm_fault_t ret;
>         int err;
>
> -       err =3D dma_resv_lock_interruptible(bo->base.resv, NULL);
> -       if (err)
> +       ACQUIRE(dma_resv_intr, resv_guard)(bo->base.resv);
> +       if (ACQUIRE_ERR(dma_resv_intr, &resv_guard))
>                 return mmap_lock_held ? VM_FAULT_NOPAGE : VM_FAULT_RETRY;
>
>         err =3D panthor_gem_backing_get_pages_locked(bo);
> @@ -857,8 +839,6 @@ static vm_fault_t blocking_page_setup(struct vm_fault=
 *vmf, unsigned int order,
>                         ret =3D VM_FAULT_RETRY;
>         }
>
> -       dma_resv_unlock(bo->base.resv);
> -
>         return ret;
>  }
>
> @@ -932,12 +912,12 @@ static void panthor_gem_vm_close(struct vm_area_str=
uct *vma)
>         if (refcount_dec_not_one(&bo->cmap.mmap_count))
>                 goto out;
>
> -       dma_resv_lock(bo->base.resv, NULL);
> -       if (refcount_dec_and_test(&bo->cmap.mmap_count)) {
> -               guard(mutex)(&bo->base.gpuva.lock);
> -               panthor_gem_update_reclaim_state_locked(bo, NULL);
> +       scoped_guard(dma_resv, bo->base.resv) {
> +               if (refcount_dec_and_test(&bo->cmap.mmap_count)) {
> +                       guard(mutex)(&bo->base.gpuva.lock);
> +                       panthor_gem_update_reclaim_state_locked(bo, NULL)=
;
> +               }
>         }
> -       dma_resv_unlock(bo->base.resv);
>
>  out:
>         drm_gem_object_put(&bo->base);
> @@ -1161,21 +1141,18 @@ panthor_gem_sync(struct drm_gem_object *obj, u32 =
type,
>         if (size =3D=3D 0)
>                 return 0;
>
> -       ret =3D dma_resv_lock_interruptible(bo->base.resv, NULL);
> +       ACQUIRE(dma_resv_intr, resv_guard)(bo->base.resv);
> +       ret =3D ACQUIRE_ERR(dma_resv_intr, &resv_guard);
>         if (ret)
>                 return ret;
>
>         /* If there's no pages, there's no point pulling those back, bail=
 out early. */
> -       if (!bo->backing.pages) {
> -               ret =3D 0;
> -               goto out_unlock;
> -       }
> +       if (!bo->backing.pages)
> +               return 0;
>
>         sgt =3D panthor_gem_dev_map_get_sgt_locked(bo);
> -       if (IS_ERR(sgt)) {
> -               ret =3D PTR_ERR(sgt);
> -               goto out_unlock;
> -       }
> +       if (IS_ERR(sgt))
> +               return PTR_ERR(sgt);
>
>         for_each_sgtable_dma_sg(sgt, sgl, count) {
>                 if (size =3D=3D 0)
> @@ -1219,11 +1196,7 @@ panthor_gem_sync(struct drm_gem_object *obj, u32 t=
ype,
>                         dma_sync_single_for_cpu(dma_dev, paddr, len, DMA_=
FROM_DEVICE);
>         }
>
> -       ret =3D 0;
> -
> -out_unlock:
> -       dma_resv_unlock(bo->base.resv);
> -       return ret;
> +       return 0;
>  }
>
>  /**
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/pant=
hor/panthor_mmu.c
> index 157eef286cb9..ab9a77e6a145 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -1118,10 +1118,10 @@ static void panthor_vm_bo_free(struct drm_gpuvm_b=
o *vm_bo)
>         /* We couldn't call this when we unlinked, because the resv lock =
can't
>          * be taken in the dma signalling path, so call it now.
>          */
> -       dma_resv_lock(bo->base.resv, NULL);
> -       scoped_guard(mutex, &bo->base.gpuva.lock)
> +       scoped_guard(dma_resv, bo->base.resv) {
> +               guard(mutex)(&bo->base.gpuva.lock);
>                 panthor_gem_update_reclaim_state_locked(bo, NULL);
> -       dma_resv_unlock(bo->base.resv);
> +       }
>
>         kfree(vm_bo);
>  }
> @@ -1342,16 +1342,14 @@ static int panthor_vm_prepare_map_op_ctx(struct p=
anthor_vm_op_ctx *op_ctx,
>
>         /* Insert BO into the extobj list last, when we know nothing can =
fail. */
>         if (bo->base.resv !=3D panthor_vm_resv(vm)) {
> -               dma_resv_lock(panthor_vm_resv(vm), NULL);
> +               guard(dma_resv)(panthor_vm_resv(vm));
>                 drm_gpuvm_bo_extobj_add(op_ctx->map.vm_bo);
> -               dma_resv_unlock(panthor_vm_resv(vm));
>         }
>
>         /* And finally update the BO state. */
> -       dma_resv_lock(bo->base.resv, NULL);
> -       scoped_guard(mutex, &bo->base.gpuva.lock)
> -               panthor_gem_update_reclaim_state_locked(bo, NULL);
> -       dma_resv_unlock(bo->base.resv);
> +       guard(dma_resv)(bo->base.resv);
> +       guard(mutex)(&bo->base.gpuva.lock);
> +       panthor_gem_update_reclaim_state_locked(bo, NULL);
>
>         return 0;
>
>
> --
> 2.54.0
>

