Return-Path: <linux-media+bounces-61622-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNdqM0kWBmp3egIAu9opvQ
	(envelope-from <linux-media+bounces-61622-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 20:36:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF8F545EE9
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 20:36:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EC78C30117BF
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 18:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 161D439E184;
	Thu, 14 May 2026 18:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HRR26f+a"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA45F3932CB
	for <linux-media@vger.kernel.org>; Thu, 14 May 2026 18:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778783814; cv=pass; b=LweUxYlzLdh1sKrsK0tdrxbuS/Jh4Cc7Ipzko2lmjDhZxwDW17jwusEaZLW1GOwf1Lx8ukztCXR+VOlZv9oaZaz28Uz8kHW1W6LMI6VnLFK4thAwYw2aqH7zwtrsk6/Y6RhA5d5CqIROEK5zqV+spwP2q7cO3LMOIONryvO/Fx8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778783814; c=relaxed/simple;
	bh=ldQ5TPlSDVAaZCL1RHiVp7BAcZ4EQPjX1eKzTjmKvtw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n2gXOJOjE/VGRfmEdp9TDh9PBzct+O5ncY2jPhKt+PaSTTFuW6FvQV6n7Z3Ltx12k/Of9V4f2ClGaOMxvovuhMRVL3sJ1KMYtm3CE+4pnI3yW7qxSRpXXfMIh6afeHl/gTbNIhVLwoKXskVGGlla3gdMD7jNNIjEfM5dpPpb1fs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HRR26f+a; arc=pass smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-6530287803cso10047982d50.1
        for <linux-media@vger.kernel.org>; Thu, 14 May 2026 11:36:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778783812; cv=none;
        d=google.com; s=arc-20240605;
        b=NL/aTtLVOxNQNXG7txY+5If5KEDC+Py7roC7RmbtT49vKdrHwlmIQ7r1xFWUBNpBjW
         tLqb7bifjeJ8vdiDvcWKzrCqcgeELboxeRuXWvaFUBqzFkrdKS5JfmHAm037DqNteytH
         2FinONT+k2vb3QeX8Cr9w8Gj3ujLQMVbOxDk79mehajylr1KqHWFcKAtV5hg9QD+AhKJ
         k29GP1AKyCq7lN8wZsqXc2V8W/+y+fO2v/6wgt0xVMFyjuJ06R7stg0G25HAJzKan28B
         BfofbZskrA1Vo4VNNQJwi9qV85zU/xvedWfA+80Rsm8GdVNXPQvrYDsOGY1ACmhePH6H
         oH/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ofLQ0WZkULXfMuSqkbcmkllFaI6VJgcrCFzwzW8gdh0=;
        fh=aOo2rklFzXZlLierxyYu1fgQ+jagCM9l+hexa5TcolI=;
        b=G99mfPVyRxkhjPWSBZ6bDBvrPlhpC5gU01Zxs03JpgtGa3N8hLJJfLjgBRcmlR8xqy
         4+f60ujIx7JAIWujGyNkg/Wx2/ecvxVWT5i6+dzmG78jgKdwr2WkN1XMEgiJC8oGs8sU
         DDoxl3bCGXpZ2DvDFE4C8VkGtGjwWW4Q8kU8qJUoH6kEVeiR4ZKGfsUfLfHQCCaeJ6dh
         vU2pkcOYjinrYrpfqXov2+Ly1zQs2LwJ5UuU5/YwJ6yLDfUUC8/XOzKevirBT7fRKie0
         TFSlEerP37QG5GXIsOmJ44auUYCpigpnZC9XszJ99ZGp4b1NfTJFJDk5xFKbdXZsNjYr
         rmlA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778783812; x=1779388612; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ofLQ0WZkULXfMuSqkbcmkllFaI6VJgcrCFzwzW8gdh0=;
        b=HRR26f+aJAc7Ol8pd/CScBCGsm3CBDjmEBmHC593hdTEY1nHvl9bNH2sNJ+tnZi7/t
         uSvVpkaprDOuY9zOWlGdC691YBFo3Tixcj/HP4uAwn5biQL40X62MixHOTiItZAhaavF
         xkqyn6U7VDJVRIInG2CCZ6M3ekkOYewF0n8Lk9KmgCWkeNmAYbIHfM6CmKEb9Rdt0l/N
         QPJvWHa8lB8Ex08NrUEK+geEHcRxVE/mX8q2bozmRzFYQT1nLGOEvwjCGuumpLvVmZNB
         P1US99ojSYJ/tel3vWB9OUsPdSQg3wzU7Q5IVKr4E0XNSZwMwX5gw+QCdT4kMGRLpUWa
         XyyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778783812; x=1779388612;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ofLQ0WZkULXfMuSqkbcmkllFaI6VJgcrCFzwzW8gdh0=;
        b=o/w4FObRWJiHhPRkZCWM6D97gw/TM2C5lpFgeHDIpGzngRCvzp/Psei1QyzuC5Hzm5
         aldJzDHVCwVMtJttrZf1f5MbTUDO2olsVhYRbuCJCMua3s06NF1HQIteGwn914FC8eSw
         r+/U8/ktv3qrJxVmUryRGMQkxEz6qQoauLthEv8UTrOI1/tDeIsgBD+148JfOcg5ktKk
         v8AB05cgOhYbe6ibe1QORUsXWQjSSTr/D+NjzVG3SZ5E5nnWU4CD4n/RWH41KVZJBQ6Q
         svpr2xAreGVyxxa9qi94Z5klTbSD+Jhl79AIKuwU46sljbf9NTt6VnSArhjpVGFx21nv
         22lg==
X-Forwarded-Encrypted: i=1; AFNElJ8o0lPSQiJurEPXen50Zouhf2bgD8BI/SoLreqZdHgj7HKIA6LgeB342w3WkSHnYULLoU2x85S3hEtN+A==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn+54Pt065+zvnnCRhIDyyffCv6pvCPnnci7n8CdmcTTmNjuVj
	MtjC3+UU8J0nThWQylxvmN7E4rNhvOwNJcm8Qjj+fNX/rRke0WEVfk4EZk70zDBrgJUmklG/zTR
	aNGXebyCh/lZw1L+WqNv1wJv6Z7msfjk=
X-Gm-Gg: Acq92OHpOCcftJuMzeTUqBrXNDtGtOpkeTlq15TlsFppv82HKTYGbmXKHZhpHD5GTF0
	Wa208hlwHp/InD69a3R2dWwg9v0mFa71PhpKMkDa48Iur+bvKZm3H25sen5nYWl8r71ta9txidN
	Ly9NM15b7Zsu/aXcoqSOR69GuL84zvSIk1D+hR0hry4gXJT0lJkiPqCC/4JuV9p9Ti1Kb9/5Pj7
	Jjkp5BgWthlzpmXXg5HMo2w3iBozhN3xWB7ElGWdhBEZldn4ORndwbMYPHLHolVn/hPT+5oS4sF
	B5wGouxXUedGCyiWLRRbhlXknBsWuvykw9GamNJtMW6BENSW8MvAHBQhBqU6H/j5lQDwilEW8w=
	=
X-Received: by 2002:a05:690c:f06:b0:7bf:107b:e77a with SMTP id
 00721157ae682-7c95c6f3c40mr5657087b3.30.1778783811407; Thu, 14 May 2026
 11:36:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513-panthor-guard-refactor-v1-0-f2d8c15a97ce@collabora.com> <20260513-panthor-guard-refactor-v1-5-f2d8c15a97ce@collabora.com>
In-Reply-To: <20260513-panthor-guard-refactor-v1-5-f2d8c15a97ce@collabora.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 14 May 2026 11:36:40 -0700
X-Gm-Features: AVHnY4K60r1MCKB_TMfS092NfmTqUOWhT6Z5aVt_4fNBfnWGP3q11PrX_MvwBnU
Message-ID: <CAPaKu7TPe3ohss2=4S=jL=egsbNWxOvu7KW+6mN3arvVmo3r-w@mail.gmail.com>
Subject: Re: [PATCH 5/6] drm/panthor: Use the drm_dev_access guard
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 3FF8F545EE9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61622-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,reset.work:url,tick_work.work:url,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 10:09=E2=80=AFAM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> It simplifies the code in a few places, allowing direct returns instead
> of gotos. It also helps identifying the sections under the dev_access
> guard when scoped_cond_guard() is used.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
> ---
>  drivers/gpu/drm/panthor/panthor_device.c | 127 ++++++++++++++-----------=
------
>  drivers/gpu/drm/panthor/panthor_drv.c    |  58 ++++++--------
>  drivers/gpu/drm/panthor/panthor_mmu.c    |  29 +++----
>  drivers/gpu/drm/panthor/panthor_sched.c  |  10 +--
>  4 files changed, 95 insertions(+), 129 deletions(-)
>
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/p=
anthor/panthor_device.c
> index cb9cd8d0448b..988a9a34f753 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -123,7 +123,7 @@ static void panthor_device_reset_cleanup(struct drm_d=
evice *ddev, void *data)
>  static void panthor_device_reset_work(struct work_struct *work)
>  {
>         struct panthor_device *ptdev =3D container_of(work, struct pantho=
r_device, reset.work);
> -       int ret =3D 0, cookie;
> +       int ret =3D 0;
>
>         /* If the device is entering suspend, we don't reset. A slow rese=
t will
>          * be forced at resume time instead.
> @@ -131,19 +131,17 @@ static void panthor_device_reset_work(struct work_s=
truct *work)
>         if (atomic_read(&ptdev->pm.state) !=3D PANTHOR_DEVICE_PM_STATE_AC=
TIVE)
>                 return;
>
> -       if (!drm_dev_enter(&ptdev->base, &cookie))
> -               return;
> -
> -       panthor_sched_pre_reset(ptdev);
> -       panthor_fw_pre_reset(ptdev, true);
> -       panthor_mmu_pre_reset(ptdev);
> -       panthor_hw_soft_reset(ptdev);
> -       panthor_hw_l2_power_on(ptdev);
> -       panthor_mmu_post_reset(ptdev);
> -       ret =3D panthor_fw_post_reset(ptdev);
> -       atomic_set(&ptdev->reset.pending, 0);
> -       panthor_sched_post_reset(ptdev, ret !=3D 0);
> -       drm_dev_exit(cookie);
> +       scoped_cond_guard(drm_dev_access, return, &ptdev->base) {
> +               panthor_sched_pre_reset(ptdev);
> +               panthor_fw_pre_reset(ptdev, true);
> +               panthor_mmu_pre_reset(ptdev);
> +               panthor_hw_soft_reset(ptdev);
> +               panthor_hw_l2_power_on(ptdev);
> +               panthor_mmu_post_reset(ptdev);
> +               ret =3D panthor_fw_post_reset(ptdev);
> +               atomic_set(&ptdev->reset.pending, 0);
> +               panthor_sched_post_reset(ptdev, ret !=3D 0);
> +       }
>
>         if (ret) {
>                 panthor_device_unplug(ptdev);
> @@ -394,38 +392,31 @@ static vm_fault_t panthor_mmio_vm_fault(struct vm_f=
ault *vmf)
>         u64 offset =3D (u64)vma->vm_pgoff << PAGE_SHIFT;
>         unsigned long pfn;
>         pgprot_t pgprot;
> -       vm_fault_t ret;
>         bool active;
> -       int cookie;
>
> -       if (!drm_dev_enter(&ptdev->base, &cookie))
> +       ACQUIRE(drm_dev_access, dev_guard)(&ptdev->base);
> +       if (ACQUIRE_ERR(drm_dev_access, &dev_guard))
>                 return VM_FAULT_SIGBUS;
>
> -       scoped_guard(mutex, &ptdev->pm.mmio_lock) {
> -               active =3D atomic_read(&ptdev->pm.state) =3D=3D PANTHOR_D=
EVICE_PM_STATE_ACTIVE;
> +       guard(mutex)(&ptdev->pm.mmio_lock);
> +       active =3D atomic_read(&ptdev->pm.state) =3D=3D PANTHOR_DEVICE_PM=
_STATE_ACTIVE;
>
> -               switch (offset) {
> -               case DRM_PANTHOR_USER_FLUSH_ID_MMIO_OFFSET:
> -                       if (active)
> -                               pfn =3D __phys_to_pfn(ptdev->phys_addr + =
CSF_GPU_LATEST_FLUSH_ID);
> -                       else
> -                               pfn =3D page_to_pfn(ptdev->pm.dummy_lates=
t_flush);
> +       switch (offset) {
> +       case DRM_PANTHOR_USER_FLUSH_ID_MMIO_OFFSET:
> +               if (active)
> +                       pfn =3D __phys_to_pfn(ptdev->phys_addr + CSF_GPU_=
LATEST_FLUSH_ID);
> +               else
> +                       pfn =3D page_to_pfn(ptdev->pm.dummy_latest_flush)=
;
>
> -                       pgprot =3D vma->vm_page_prot;
> -                       if (active)
> -                               pgprot =3D pgprot_noncached(pgprot);
> +               pgprot =3D vma->vm_page_prot;
> +               if (active)
> +                       pgprot =3D pgprot_noncached(pgprot);
>
> -                       ret =3D vmf_insert_pfn_prot(vma, vmf->address, pf=
n, pgprot);
> -                       break;
> +               return vmf_insert_pfn_prot(vma, vmf->address, pfn, pgprot=
);
>
> -               default:
> -                       ret =3D VM_FAULT_SIGBUS;
> -                       break;
> -               }
> +       default:
> +               return VM_FAULT_SIGBUS;
>         }
> -
> -       drm_dev_exit(cookie);
> -       return ret;
>  }
>
>  static const struct vm_operations_struct panthor_mmio_vm_ops =3D {
> @@ -482,7 +473,7 @@ static int panthor_device_resume_hw_components(struct=
 panthor_device *ptdev)
>  int panthor_device_resume(struct device *dev)
>  {
>         struct panthor_device *ptdev =3D dev_get_drvdata(dev);
> -       int ret, cookie;
> +       int ret;
>
>         if (atomic_read(&ptdev->pm.state) !=3D PANTHOR_DEVICE_PM_STATE_SU=
SPENDED)
>                 return -EINVAL;
> @@ -503,28 +494,27 @@ int panthor_device_resume(struct device *dev)
>
>         panthor_devfreq_resume(ptdev);
>
> -       if (panthor_device_is_initialized(ptdev) &&
> -           drm_dev_enter(&ptdev->base, &cookie)) {
> -               /* If there was a reset pending at the time we suspended =
the
> -                * device, we force a slow reset.
> -                */
> -               if (atomic_read(&ptdev->reset.pending)) {
> -                       ptdev->reset.fast =3D false;
> -                       atomic_set(&ptdev->reset.pending, 0);
> -               }
> +       if (panthor_device_is_initialized(ptdev)) {
> +               scoped_cond_guard(drm_dev_access, ret =3D 0, &ptdev->base=
) {
> +                       /* If there was a reset pending at the time we su=
spended the
> +                        * device, we force a slow reset.
> +                        */
> +                       if (atomic_read(&ptdev->reset.pending)) {
> +                               ptdev->reset.fast =3D false;
> +                               atomic_set(&ptdev->reset.pending, 0);
> +                       }
>
> -               ret =3D panthor_device_resume_hw_components(ptdev);
> -               if (ret && ptdev->reset.fast) {
> -                       drm_err(&ptdev->base, "Fast reset failed, trying =
a slow reset");
> -                       ptdev->reset.fast =3D false;
>                         ret =3D panthor_device_resume_hw_components(ptdev=
);
> +                       if (ret && ptdev->reset.fast) {
> +                               drm_err(&ptdev->base, "Fast reset failed,=
 trying a slow reset");
> +                               ptdev->reset.fast =3D false;
> +                               ret =3D panthor_device_resume_hw_componen=
ts(ptdev);
> +                       }
> +
> +                       if (!ret)
> +                               panthor_sched_resume(ptdev);
>                 }
>
> -               if (!ret)
> -                       panthor_sched_resume(ptdev);
> -
> -               drm_dev_exit(cookie);
> -
>                 if (ret)
>                         goto err_suspend_devfreq;
>         }
> @@ -559,7 +549,6 @@ int panthor_device_resume(struct device *dev)
>  int panthor_device_suspend(struct device *dev)
>  {
>         struct panthor_device *ptdev =3D dev_get_drvdata(dev);
> -       int cookie;
>
>         if (atomic_read(&ptdev->pm.state) !=3D PANTHOR_DEVICE_PM_STATE_AC=
TIVE)
>                 return -EINVAL;
> @@ -577,19 +566,19 @@ int panthor_device_suspend(struct device *dev)
>                                     DRM_PANTHOR_USER_MMIO_OFFSET, 0, 1);
>         }
>
> -       if (panthor_device_is_initialized(ptdev) &&
> -           drm_dev_enter(&ptdev->base, &cookie)) {
> -               cancel_work_sync(&ptdev->reset.work);
> +       if (panthor_device_is_initialized(ptdev)) {
> +               scoped_guard(drm_dev_access, &ptdev->base) {
> +                       cancel_work_sync(&ptdev->reset.work);
>
> -               /* We prepare everything as if we were resetting the GPU.
> -                * The end of the reset will happen in the resume path th=
ough.
> -                */
> -               panthor_sched_suspend(ptdev);
> -               panthor_fw_suspend(ptdev);
> -               panthor_mmu_suspend(ptdev);
> -               panthor_gpu_suspend(ptdev);
> -               panthor_pwr_suspend(ptdev);
> -               drm_dev_exit(cookie);
> +                       /* We prepare everything as if we were resetting =
the GPU.
> +                        * The end of the reset will happen in the resume=
 path though.
> +                        */
> +                       panthor_sched_suspend(ptdev);
> +                       panthor_fw_suspend(ptdev);
> +                       panthor_mmu_suspend(ptdev);
> +                       panthor_gpu_suspend(ptdev);
> +                       panthor_pwr_suspend(ptdev);
> +               }
>         }
>
>         panthor_devfreq_suspend(ptdev);
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/pant=
hor/panthor_drv.c
> index e8dc4096c1d2..789ddc0ff7ef 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -997,9 +997,10 @@ static int panthor_ioctl_vm_create(struct drm_device=
 *ddev, void *data,
>         struct panthor_device *ptdev =3D container_of(ddev, struct pantho=
r_device, base);
>         struct panthor_file *pfile =3D file->driver_priv;
>         struct drm_panthor_vm_create *args =3D data;
> -       int cookie, ret;
> +       int ret;
>
> -       if (!drm_dev_enter(ddev, &cookie))
> +       ACQUIRE(drm_dev_access, dev_guard)(ddev);
> +       if (ACQUIRE_ERR(drm_dev_access, &dev_guard))
>                 return -ENODEV;
>
>         ret =3D panthor_vm_pool_create_vm(ptdev, pfile->vms,  args);
> @@ -1008,7 +1009,6 @@ static int panthor_ioctl_vm_create(struct drm_devic=
e *ddev, void *data,
>                 ret =3D 0;
>         }
>
> -       drm_dev_exit(cookie);
>         return ret;
>  }
>
> @@ -1033,38 +1033,30 @@ static int panthor_ioctl_bo_create(struct drm_dev=
ice *ddev, void *data,
>         struct panthor_file *pfile =3D file->driver_priv;
>         struct drm_panthor_bo_create *args =3D data;
>         struct panthor_vm *vm =3D NULL;
> -       int cookie, ret;
> +       int ret;
>
> -       if (!drm_dev_enter(ddev, &cookie))
> +       ACQUIRE(drm_dev_access, dev_guard)(ddev);
> +       if (ACQUIRE_ERR(drm_dev_access, &dev_guard))
>                 return -ENODEV;
>
>         if (!args->size || args->pad ||
> -           (args->flags & ~PANTHOR_BO_FLAGS)) {
> -               ret =3D -EINVAL;
> -               goto out_dev_exit;
> -       }
> +           (args->flags & ~PANTHOR_BO_FLAGS))
> +               return -EINVAL;
>
>         if ((args->flags & DRM_PANTHOR_BO_NO_MMAP) &&
> -           (args->flags & DRM_PANTHOR_BO_WB_MMAP)) {
> -               ret =3D -EINVAL;
> -               goto out_dev_exit;
> -       }
> +           (args->flags & DRM_PANTHOR_BO_WB_MMAP))
> +               return -EINVAL;
>
>         if (args->exclusive_vm_id) {
>                 vm =3D panthor_vm_pool_get_vm(pfile->vms, args->exclusive=
_vm_id);
> -               if (!vm) {
> -                       ret =3D -EINVAL;
> -                       goto out_dev_exit;
> -               }
> +               if (!vm)
> +                       return -EINVAL;
>         }
>
>         ret =3D panthor_gem_create_with_handle(file, ddev, vm, &args->siz=
e,
>                                              args->flags, &args->handle);
>
>         panthor_vm_put(vm);
> -
> -out_dev_exit:
> -       drm_dev_exit(cookie);
>         return ret;
>  }
>
> @@ -1107,17 +1099,18 @@ static int panthor_ioctl_group_submit(struct drm_=
device *ddev, void *data,
>         struct drm_panthor_group_submit *args =3D data;
>         struct drm_panthor_queue_submit *jobs_args;
>         struct panthor_submit_ctx ctx;
> -       int ret =3D 0, cookie;
> +       int ret =3D 0;
>
>         if (args->pad)
>                 return -EINVAL;
>
> -       if (!drm_dev_enter(ddev, &cookie))
> +       ACQUIRE(drm_dev_access, dev_guard)(ddev);
> +       if (ACQUIRE_ERR(drm_dev_access, &dev_guard))
>                 return -ENODEV;
>
>         ret =3D PANTHOR_UOBJ_GET_ARRAY(jobs_args, &args->queue_submits);
>         if (ret)
> -               goto out_dev_exit;
> +               return ret;
>
>         ret =3D panthor_submit_ctx_init(&ctx, file, args->queue_submits.c=
ount);
>         if (ret)
> @@ -1201,8 +1194,6 @@ static int panthor_ioctl_group_submit(struct drm_de=
vice *ddev, void *data,
>  out_free_jobs_args:
>         kvfree(jobs_args);
>
> -out_dev_exit:
> -       drm_dev_exit(cookie);
>         return ret;
>  }
>
> @@ -1438,18 +1429,15 @@ static int panthor_ioctl_vm_bind(struct drm_devic=
e *ddev, void *data,
>                                  struct drm_file *file)
>  {
>         struct drm_panthor_vm_bind *args =3D data;
> -       int cookie, ret;
>
> -       if (!drm_dev_enter(ddev, &cookie))
> +       ACQUIRE(drm_dev_access, dev_guard)(ddev);
> +       if (ACQUIRE_ERR(drm_dev_access, &dev_guard))
>                 return -ENODEV;
>
>         if (args->flags & DRM_PANTHOR_VM_BIND_ASYNC)
> -               ret =3D panthor_ioctl_vm_bind_async(ddev, args, file);
> -       else
> -               ret =3D panthor_ioctl_vm_bind_sync(ddev, args, file);
> +               return panthor_ioctl_vm_bind_async(ddev, args, file);
>
> -       drm_dev_exit(cookie);
> -       return ret;
> +       return panthor_ioctl_vm_bind_sync(ddev, args, file);
>  }
>
>  static int panthor_ioctl_vm_get_state(struct drm_device *ddev, void *dat=
a,
> @@ -1671,9 +1659,10 @@ static int panthor_mmap(struct file *filp, struct =
vm_area_struct *vma)
>         struct panthor_device *ptdev =3D pfile->ptdev;
>         u64 offset =3D (u64)vma->vm_pgoff << PAGE_SHIFT;
>         u64 user_mmio_offset;
> -       int ret, cookie;
> +       int ret;
>
> -       if (!drm_dev_enter(file->minor->dev, &cookie))
> +       ACQUIRE(drm_dev_access, dev_guard)(file->minor->dev);
> +       if (ACQUIRE_ERR(drm_dev_access, &dev_guard))
>                 return -ENODEV;
>
>         /* Adjust the user MMIO offset to match the offset used kernel si=
de.
> @@ -1691,7 +1680,6 @@ static int panthor_mmap(struct file *filp, struct v=
m_area_struct *vma)
>                 ret =3D drm_gem_mmap(filp, vma);
>         }
>
> -       drm_dev_exit(cookie);
>         return ret;
>  }
>
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/pant=
hor/panthor_mmu.c
> index ab9a77e6a145..ff3beb9147e8 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -788,13 +788,13 @@ static int panthor_vm_active_locked(struct panthor_=
vm *vm)
>  int panthor_vm_active(struct panthor_vm *vm)
>  {
>         struct panthor_device *ptdev =3D vm->ptdev;
> -       int ret =3D 0, cookie;
>
> -       if (!drm_dev_enter(&ptdev->base, &cookie))
> +       ACQUIRE(drm_dev_access, dev_guard)(&ptdev->base);
> +       if (ACQUIRE_ERR(drm_dev_access, &dev_guard))
>                 return -ENODEV;
>
>         if (refcount_inc_not_zero(&vm->as.active_cnt))
> -               goto out_dev_exit;
> +               return 0;
>
>         /* As soon as active is called, we place the VM at the end of the=
 VM LRU.
>          * If something fails after that, the only downside is that this =
VM that
> @@ -809,14 +809,10 @@ int panthor_vm_active(struct panthor_vm *vm)
>         /* Make sure we don't race with lock/unlock_region() calls
>          * happening around VM bind operations.
>          */
> -       scoped_guard(mutex, &vm->op_lock) {
> -               guard(mutex)(&ptdev->mmu->as.slots_lock);
> -               ret =3D panthor_vm_active_locked(vm);
> -       }
> +       guard(mutex)(&vm->op_lock);
> +       guard(mutex)(&ptdev->mmu->as.slots_lock);
>
> -out_dev_exit:
> -       drm_dev_exit(cookie);
> -       return ret;
> +       return panthor_vm_active_locked(vm);
>  }
>
>  /**
> @@ -902,16 +898,15 @@ static size_t get_pgsize(u64 addr, size_t size, siz=
e_t *count)
>  static void panthor_vm_declare_unusable(struct panthor_vm *vm)
>  {
>         struct panthor_device *ptdev =3D vm->ptdev;
> -       int cookie;
>
>         if (vm->unusable)
>                 return;
>
>         vm->unusable =3D true;
>         guard(mutex)(&ptdev->mmu->as.slots_lock);
> -       if (vm->as.id >=3D 0 && drm_dev_enter(&ptdev->base, &cookie)) {
> -               panthor_mmu_as_disable(ptdev, vm->as.id, false);
> -               drm_dev_exit(cookie);
> +       if (vm->as.id >=3D 0) {
> +               scoped_guard(drm_dev_access, &ptdev->base)
> +                       panthor_mmu_as_disable(ptdev, vm->as.id, false);
>         }
>  }
>
> @@ -1983,12 +1978,8 @@ static void panthor_vm_free(struct drm_gpuvm *gpuv=
m)
>         scoped_guard(mutex, &vm->op_lock) {
>                 guard(mutex)(&ptdev->mmu->as.slots_lock);
>                 if (vm->as.id >=3D 0) {
> -                       int cookie;
> -
> -                       if (drm_dev_enter(&ptdev->base, &cookie)) {
> +                       scoped_guard(drm_dev_access, &ptdev->base)
>                                 panthor_mmu_as_disable(ptdev, vm->as.id, =
false);
> -                               drm_dev_exit(cookie);
> -                       }
>
>                         ptdev->mmu->as.slots[vm->as.id].vm =3D NULL;
>                         clear_bit(vm->as.id, &ptdev->mmu->as.alloc_mask);
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/pa=
nthor/panthor_sched.c
> index d8cadd393fbe..9aa9941d2309 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -2624,21 +2624,19 @@ static void tick_work(struct work_struct *work)
>         struct panthor_scheduler *sched =3D container_of(work, struct pan=
thor_scheduler,
>                                                       tick_work.work);
>         struct panthor_device *ptdev =3D sched->ptdev;
> -       int ret, cookie;
> +       int ret;
>
> -       if (!drm_dev_enter(&ptdev->base, &cookie))
> +       ACQUIRE(drm_dev_access, dev_guard)(&ptdev->base);
> +       if (ACQUIRE_ERR(drm_dev_access, &dev_guard))
>                 return;
>
>         ret =3D panthor_device_resume_and_get(ptdev);
>         if (drm_WARN_ON(&ptdev->base, ret))
> -               goto out_dev_exit;
> +               return;
>
>         tick(sched);
>         pm_runtime_mark_last_busy(ptdev->base.dev);
>         pm_runtime_put_autosuspend(ptdev->base.dev);
> -
> -out_dev_exit:
> -       drm_dev_exit(cookie);
>  }
>
>  static int panthor_queue_eval_syncwait(struct panthor_group *group, u8 q=
ueue_idx)
>
> --
> 2.54.0
>

