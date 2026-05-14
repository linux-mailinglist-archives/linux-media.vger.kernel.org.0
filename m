Return-Path: <linux-media+bounces-61623-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uI4DKRkXBmp3egIAu9opvQ
	(envelope-from <linux-media+bounces-61623-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 20:40:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 130AA545F59
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 20:40:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BD3B7302F437
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 18:40:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E81C3A1CFE;
	Thu, 14 May 2026 18:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HwwAc74f"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B79A397E6D
	for <linux-media@vger.kernel.org>; Thu, 14 May 2026 18:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778784008; cv=pass; b=C5NwY/CBoRj3Tua6J6FukIiSFDJow0B65WcV/nRwCdSlpo8DVMRRcdOAbG27NqjjLc/6e69OrBqr8HPWLwylOAEd1/KX1aVDccPJiD7sybzDDHx7Swz52ATyeP/y6lEvpe8CZ+5Qe8tTUmukrl5ceaxCvxVKGZYbY9p/IB4U1Nc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778784008; c=relaxed/simple;
	bh=qqw9pri2xaQ8Gm35Z3/8MWqJ63tPB5yH4caN4Oo5qyY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kDgAeIBHaQGZpMKNSChzxqsfiBQf5pllcX46L6oJL3+PbJ7VM2ht2GaAhNOICAeWOzMwscfO6XSpATU/Izf7OryZUVJL3MMjVMkpFc/y+X48LvOZ9aHoqVeTX0mZLMOZsMLacm4qL2JPpMszcj85JN2Dy2e/mHNXTHGnC6L4s8U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HwwAc74f; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-656d749109cso6202367d50.3
        for <linux-media@vger.kernel.org>; Thu, 14 May 2026 11:40:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778784006; cv=none;
        d=google.com; s=arc-20240605;
        b=F+zythU2Bk+u6YlNiQlMD6JuJ3/7Pn21wuRm1UJEXEzr/owjwPX0IW5RvueoYqvcre
         5ekp/BtipAcMsF11MSvXhNViIbHWr4HvJHnB/O6Kv0tMjoQxg28zEDHHUgl0aUG1gCMG
         6gdkCMutCZpXMK5w9pRN3bIR7+8meJI6iG0/CH/ZPnJ5Qa8PxVr+J1DgiVrXVf1kGrZ6
         ZzemVJzAfhsrKAb3m27KiV3TJOtlT44elpoyItu7Vd+2QRKyedUyJvhNBvGnUH+Klaw9
         yd5cVcwoL8ZUwNkKOU2JtG0DapTChk2XSa77w+bH5Vy9UCETP1q0nSwPydBiQR7Hy7Uc
         Azag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FpoaXEJLcSJc84yZ2vARDAmkfQwqX2rRItHaBW+mwvI=;
        fh=mNJa7BlRNxob87d/E1gxAibdjFKgqXQqU0X5IuUikFY=;
        b=NlQ4dfS6eZLKCeD0oCtNzttiFrH4ySuL9ccp6qCmRbxIrL+Xp4cMGdySYnBW6XozAB
         3Kk9hLAKR0kgRTnBP6JO34eVnDkYdgy6Z3FnEMKVVLp/qNF0kheMvtUYiYtEEak9NZhl
         bqGBnjkO9KjAMmshkfNhYpVCf3dmFieIeMvkjWF8Lk9fwYdQyXPTEMloMmfnTCWUk/Bo
         Q2JZGpdLJfhYvJHZtlmR/MLjqZx4ty37kb3byGK8q18FCYSgrE1w29tP2htYhzdr3gRo
         sOIRTIJ/Qc6fvkY59ZJF3tICL5CT78Kjaf9ZeOytzXWaPRiwpPh4Jz4v1+L0vjrLhZCq
         EawQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778784006; x=1779388806; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FpoaXEJLcSJc84yZ2vARDAmkfQwqX2rRItHaBW+mwvI=;
        b=HwwAc74fyGCrzb/I6EjW4Ol0BPIMCuXTUnhJxpeiDEGblaRhH0QmBGHTQf8dJ7HoVX
         YMLIaJZuCoyCs5SN6RKjfgSx+X9Q+ek/CHwR/pecqzBkfxuUZjx1Rwp4ishKF+f28z21
         JpJIiJDevKr9OG0q1x4kA4cjpm0/p2jsPWCvFzfgnxdGOlJnttuEe2LagDq4Tf2WEfZx
         uZVUVQnpMwtbPct6ruX9rrWJVi6ia8unmTN8dT7mQSau4OYD9e9hPgH2y1rb2H8EP2lz
         MtLZArj5DuhJuUgn/ojsR3LbeCQ/FJxuUnmXkTGpJC/W/E+ihXFONYpTAN9RJ0NKfoFF
         BnYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778784006; x=1779388806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FpoaXEJLcSJc84yZ2vARDAmkfQwqX2rRItHaBW+mwvI=;
        b=daxhQHp0CyUqbzMGLF9c34lqzcc8iBBzATSLh38HarVWTKsnUMzWtniDRhrZEhsvpg
         +E4IO60BoskXS/fh9zcFUi1lDyWm1JW6kQrBqs4FrzNw/o3kE0npKdM0zZDGGrF/JLse
         FxZ693uqLzJvHD6VAuRPkEro8kRWqVcj1foQSvH6rdL/MYFQHBsl9+9rETo1YvsEeQeQ
         o2CRm3k2L+xVQO/DHF5oSnBYu/jFRz4th/bO7s/c6siYyxfwpH/LGII2ttol0iSNj3qg
         yunqcvUgQAhAo+yXbkwAOqSHRUcuEZKHWpZiGNbJECcwTgH0PMf3GpBgq7vLPxxwrw4Z
         znJA==
X-Forwarded-Encrypted: i=1; AFNElJ+H4gB0nb93ecj+r0tIpGf7Q/aYULZs1j1zZg0McP76arBo42ucr8f8cv9BRBzdJjeBLPGVdfcmnJZitQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIR30UO2mgJMBJmhvPt59sucNW/7KFYCT5tVZ9n7CMmcycTjND
	B+EFdDy5CI2P0oCAM8HUHCQr9E7HFKs/6b02IQzQsFi4nSu45mrvWunEgrqybLNYrtT0jYDy6ea
	zPqnXTcZVzoRvSlhRGHtJ//fQw77EKzg=
X-Gm-Gg: Acq92OE2srxgt5+8Y9Bf1w2C9C3P+UZxBu5slOhdoYdLq8IudhO19cnLEjD8gFcyfV9
	pEXT5nvDvZPUbaJ0iZe8soeJZ3LU9iyXeUPWoAz3PfRmekpZzannsbyjA8BomZHgg/hzOGgwS3l
	c9QZ8GEe75Hz2MtKV44k1TWjlAxSIFVzSgX2H5jUCQqfROpzUwjUQTdDPhW4ngVPlv8vfGjVHjt
	er7PGHRd6wpnbzKJK7QaudDZh3VkgRdBvQ2eW8M4nX7/Q7nbxp+4i3cE7XBnewIL/crHLPFGSF+
	onu8B3dUQVfTKV1b0qRlKTTlCxGYUJJn8VVg7gRnmhzE4DvJsAI+6ILkoJmMroVZZ92LwtrGWMI
	9Dv7PQPl5
X-Received: by 2002:a05:690c:c504:b0:7b8:926e:3ef4 with SMTP id
 00721157ae682-7c9599a3c98mr6741257b3.17.1778784005522; Thu, 14 May 2026
 11:40:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513-panthor-guard-refactor-v1-0-f2d8c15a97ce@collabora.com> <20260513-panthor-guard-refactor-v1-6-f2d8c15a97ce@collabora.com>
In-Reply-To: <20260513-panthor-guard-refactor-v1-6-f2d8c15a97ce@collabora.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 14 May 2026 11:39:54 -0700
X-Gm-Features: AVHnY4K0-CnWJWVhrI1GvcjAaDfSNRBL6O_alT4g9naFYZIyIVIX0tJzKPjAXlk
Message-ID: <CAPaKu7Sttfu4xapUwnk6WzskHVEqNuc8NOfpZch-Yp-OGd6bww@mail.gmail.com>
Subject: Re: [PATCH 6/6] drm/panthor: Add a new guard for our custom
 resume_and_get() PM helper
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 130AA545F59
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61623-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,collabora.com:email]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 9:59=E2=80=AFAM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> Overload the already existing pm_runtime_active_auto_try_enabled guard
> with our custom guard that force the state to suspened (and thus clear
> the runtime_error) in case the resume fails.
>
> Once done, we can replace the existing places where manual
> panthor_device_resume_and_get()+pm_runtime_put_autosuspend() were
> done by guards.
This patch also replaces a pm_runtime_put call by
pm_runtime_put_autosuspend, and removes redundant
pm_runtime_mark_last_busy calls. Can we add another patch for the
functionality change first?

>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_device.h | 10 +++++++---
>  drivers/gpu/drm/panthor/panthor_drv.c    |  4 ++--
>  drivers/gpu/drm/panthor/panthor_sched.c  | 11 ++++-------
>  3 files changed, 13 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/p=
anthor/panthor_device.h
> index 1aaf06df875b..51527d2e2f77 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -407,9 +407,10 @@ int panthor_device_mmap_io(struct panthor_device *pt=
dev,
>  int panthor_device_resume(struct device *dev);
>  int panthor_device_suspend(struct device *dev);
>
> -static inline int panthor_device_resume_and_get(struct panthor_device *p=
tdev)
> +static inline int panthor_device_resume_and_get(struct device *dev)
>  {
> -       int ret =3D pm_runtime_resume_and_get(ptdev->base.dev);
> +       struct panthor_device *ptdev =3D dev_get_drvdata(dev);
> +       int ret =3D pm_runtime_resume_and_get(dev);
>
>         /* If the resume failed, we need to clear the runtime_error, whic=
h
>          * can done by forcing the RPM state to suspended. If multiple
> @@ -424,11 +425,14 @@ static inline int panthor_device_resume_and_get(str=
uct panthor_device *ptdev)
>          * something we can live with.
>          */
>         if (ret && atomic_cmpxchg(&ptdev->pm.recovery_needed, 1, 0) =3D=
=3D 1)
> -               pm_runtime_set_suspended(ptdev->base.dev);
> +               pm_runtime_set_suspended(dev);
>
>         return ret;
>  }
>
> +DEFINE_GUARD_COND(pm_runtime_active_auto, _try_enabled_or_suspend,
> +                 panthor_device_resume_and_get(_T), _RET =3D=3D 0)
> +
>  enum drm_panthor_exception_type {
>         DRM_PANTHOR_EXCEPTION_OK =3D 0x00,
>         DRM_PANTHOR_EXCEPTION_TERMINATED =3D 0x04,
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/pant=
hor/panthor_drv.c
> index 789ddc0ff7ef..f2d60ff00896 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -824,7 +824,8 @@ static int panthor_query_timestamp_info(struct pantho=
r_device *ptdev,
>                 (flags & DRM_PANTHOR_TIMESTAMP_DURATION) ||
>                 (timestamp_types >=3D 2);
>
> -       ret =3D panthor_device_resume_and_get(ptdev);
> +       ACQUIRE(pm_runtime_active_auto_try_enabled_or_suspend, pm_guard)(=
ptdev->base.dev);
> +       ret =3D ACQUIRE_ERR(pm_runtime_active_auto_try_enabled_or_suspend=
, &pm_guard);
>         if (ret)
>                 return ret;
>
> @@ -894,7 +895,6 @@ static int panthor_query_timestamp_info(struct pantho=
r_device *ptdev,
>                 arg->cpu_timestamp_nsec =3D 0;
>         }
>
> -       pm_runtime_put(ptdev->base.dev);
>         return 0;
>  }
>
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/pa=
nthor/panthor_sched.c
> index 9aa9941d2309..9afa38e87fc9 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -2630,13 +2630,12 @@ static void tick_work(struct work_struct *work)
>         if (ACQUIRE_ERR(drm_dev_access, &dev_guard))
>                 return;
>
> -       ret =3D panthor_device_resume_and_get(ptdev);
> +       ACQUIRE(pm_runtime_active_auto_try_enabled_or_suspend, pm_guard)(=
ptdev->base.dev);
> +       ret =3D ACQUIRE_ERR(pm_runtime_active_auto_try_enabled_or_suspend=
, &pm_guard);
>         if (drm_WARN_ON(&ptdev->base, ret))
>                 return;
>
>         tick(sched);
> -       pm_runtime_mark_last_busy(ptdev->base.dev);
> -       pm_runtime_put_autosuspend(ptdev->base.dev);
>  }
>
>  static int panthor_queue_eval_syncwait(struct panthor_group *group, u8 q=
ueue_idx)
> @@ -3359,7 +3358,8 @@ queue_run_job(struct drm_sched_job *sched_job)
>                 return dma_fence_get(job->done_fence);
>         }
>
> -       ret =3D panthor_device_resume_and_get(ptdev);
> +       ACQUIRE(pm_runtime_active_auto_try_enabled_or_suspend, pm_guard)(=
ptdev->base.dev);
> +       ret =3D ACQUIRE_ERR(pm_runtime_active_auto_try_enabled_or_suspend=
, &pm_guard);
>         if (drm_WARN_ON(&ptdev->base, ret))
>                 return ERR_PTR(ret);
>
> @@ -3367,9 +3367,6 @@ queue_run_job(struct drm_sched_job *sched_job)
>                 done_fence =3D queue_run_job_locked(job);
>         }
>
> -       pm_runtime_mark_last_busy(ptdev->base.dev);
> -       pm_runtime_put_autosuspend(ptdev->base.dev);
> -
>         return done_fence;
>  }
>
>
> --
> 2.54.0
>

