Return-Path: <linux-media+bounces-17533-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8579596B3CB
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 10:02:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D7862893F5
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 08:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F76117BECC;
	Wed,  4 Sep 2024 08:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="dUHmIPgk"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46501494AB;
	Wed,  4 Sep 2024 08:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725436926; cv=none; b=ry7W8Wnfe0dAxT9eduEh6LwUyMfwRC26G4HxmGkBb/T8Akv+kLqBxereLxhfI8j3MwxUdmllHGXudBjJdsdOG3pZ5pXgfgX2bGWW+henxzILBYTPtMcVtJ68v0QzsLdchY5t/Xp0YipTC2G/GeshL2DuUWg1t8bYNy5YPMol8+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725436926; c=relaxed/simple;
	bh=XeBmn7/telVY98tcBnVnUjGvx8fxxfqnV6V1SQ2n+Ho=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CYoSFSKBmijsxnz/EOjW+K8+4E0a5YmbPSSyZ3/frDRAibG/hoBhRi0JR74Uun2Sy9DgS8HSuqaWC4B1SehGN0hM7dvxyTjTfFvrbrAg33uTYjp+r22dJXfWJPAWzBKR/geUMrJSzFH4VeIJRC9iTh6187lhD7ykyMrsFrRbeX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=dUHmIPgk; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1725436921;
	bh=XeBmn7/telVY98tcBnVnUjGvx8fxxfqnV6V1SQ2n+Ho=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dUHmIPgkfhM8EwRMkz/bit0yJZRmAOfwk2STlktZh6AKVAhyTdpuPi/Hhr0JSwAEs
	 iOGH+wkvOcrrwWCd5MdJnylXsaPa+QjLknuvXPN59B91JxA7GKWplnuzI2dOUadCgb
	 LXPVtyfTq2e0YuwbDlkYz6Qj9fp7Fs14jFA18ub6a8ICZOExUbwjjYgLGO7dfbkzG2
	 s3ulvvydeM/8Y6hCZvx2j3rqYEOGjjr7vskO3j6aasVAo4dyymfS26PkZMBM1ANrEh
	 rh13MzGXG3RA1a5r7UE2Dk3IdYcrHD4UB06bN7Ag7GS5MnPuY1KAYY2/1icvjabUi2
	 WDkrSicwHUSag==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2AC4817E0F94;
	Wed,  4 Sep 2024 10:02:01 +0200 (CEST)
Date: Wed, 4 Sep 2024 10:01:56 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v5 2/4] drm/panthor: add DRM fdinfo support
Message-ID: <20240904100156.4fc7cb3c@collabora.com>
In-Reply-To: <20240903202541.430225-3-adrian.larumbe@collabora.com>
References: <20240903202541.430225-1-adrian.larumbe@collabora.com>
	<20240903202541.430225-3-adrian.larumbe@collabora.com>
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

On Tue,  3 Sep 2024 21:25:36 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Drawing from the FW-calculated values in the previous commit, we can
> increase the numbers for an open file by collecting them from finished jo=
bs
> when updating their group synchronisation objects.
>=20
> Display of fdinfo key-value pairs is governed by a flag that is by default
> disabled in the present commit, and supporting manual toggle of it will be
> the matter of a later commit.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_devfreq.c | 18 ++++++++-
>  drivers/gpu/drm/panthor/panthor_device.h  | 14 +++++++
>  drivers/gpu/drm/panthor/panthor_drv.c     | 35 ++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_sched.c   | 45 +++++++++++++++++++++++
>  4 files changed, 111 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/=
panthor/panthor_devfreq.c
> index c6d3c327cc24..9d0f891b9b53 100644
> --- a/drivers/gpu/drm/panthor/panthor_devfreq.c
> +++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
> @@ -62,14 +62,20 @@ static void panthor_devfreq_update_utilization(struct=
 panthor_devfreq *pdevfreq)
>  static int panthor_devfreq_target(struct device *dev, unsigned long *fre=
q,
>  				  u32 flags)
>  {
> +	struct panthor_device *ptdev =3D dev_get_drvdata(dev);
>  	struct dev_pm_opp *opp;
> +	int err;
> =20
>  	opp =3D devfreq_recommended_opp(dev, freq, flags);
>  	if (IS_ERR(opp))
>  		return PTR_ERR(opp);
>  	dev_pm_opp_put(opp);
> =20
> -	return dev_pm_opp_set_rate(dev, *freq);
> +	err =3D dev_pm_opp_set_rate(dev, *freq);
> +	if (!err)
> +		ptdev->current_frequency =3D *freq;
> +
> +	return err;
>  }
> =20
>  static void panthor_devfreq_reset(struct panthor_devfreq *pdevfreq)
> @@ -130,6 +136,7 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
>  	struct panthor_devfreq *pdevfreq;
>  	struct dev_pm_opp *opp;
>  	unsigned long cur_freq;
> +	unsigned long freq =3D ULONG_MAX;
>  	int ret;
> =20
>  	pdevfreq =3D drmm_kzalloc(&ptdev->base, sizeof(*ptdev->devfreq), GFP_KE=
RNEL);
> @@ -161,6 +168,7 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
>  		return PTR_ERR(opp);
> =20
>  	panthor_devfreq_profile.initial_freq =3D cur_freq;
> +	ptdev->current_frequency =3D cur_freq;
> =20
>  	/* Regulator coupling only takes care of synchronizing/balancing voltage
>  	 * updates, but the coupled regulator needs to be enabled manually.
> @@ -204,6 +212,14 @@ int panthor_devfreq_init(struct panthor_device *ptde=
v)
> =20
>  	dev_pm_opp_put(opp);
> =20
> +	/* Find the fastest defined rate  */
> +	opp =3D dev_pm_opp_find_freq_floor(dev, &freq);
> +	if (IS_ERR(opp))
> +		return PTR_ERR(opp);
> +	ptdev->fast_rate =3D freq;
> +
> +	dev_pm_opp_put(opp);
> +
>  	/*
>  	 * Setup default thresholds for the simple_ondemand governor.
>  	 * The values are chosen based on experiments.
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/p=
anthor/panthor_device.h
> index a48e30d0af30..0e68f5a70d20 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -184,6 +184,17 @@ struct panthor_device {
> =20
>  	/** @profile_mask: User-set profiling flags for job accounting. */
>  	u32 profile_mask;
> +
> +	/** @current_frequency: Device clock frequency at present. Set by DVFS*/
> +	unsigned long current_frequency;
> +
> +	/** @fast_rate: Maximum device clock frequency. Set by DVFS */
> +	unsigned long fast_rate;
> +};

Can we move the current_frequency/fast_rate retrieval in a separate
patch?

> +
> +struct panthor_gpu_usage {
> +	u64 time;
> +	u64 cycles;
>  };
> =20
>  /**
> @@ -198,6 +209,9 @@ struct panthor_file {
> =20
>  	/** @groups: Scheduling group pool attached to this file. */
>  	struct panthor_group_pool *groups;
> +
> +	/** @stats: cycle and timestamp measures for job execution. */
> +	struct panthor_gpu_usage stats;
>  };
> =20
>  int panthor_device_init(struct panthor_device *ptdev);
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/pant=
hor/panthor_drv.c
> index b5e7b919f241..e18838754963 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -3,12 +3,17 @@
>  /* Copyright 2019 Linaro, Ltd., Rob Herring <robh@kernel.org> */
>  /* Copyright 2019 Collabora ltd. */
> =20
> +#ifdef CONFIG_ARM_ARCH_TIMER
> +#include <asm/arch_timer.h>
> +#endif
> +
>  #include <linux/list.h>
>  #include <linux/module.h>
>  #include <linux/of_platform.h>
>  #include <linux/pagemap.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/time64.h>
> =20
>  #include <drm/drm_debugfs.h>
>  #include <drm/drm_drv.h>
> @@ -1351,6 +1356,34 @@ static int panthor_mmap(struct file *filp, struct =
vm_area_struct *vma)
>  	return ret;
>  }
> =20
> +static void panthor_gpu_show_fdinfo(struct panthor_device *ptdev,
> +				    struct panthor_file *pfile,
> +				    struct drm_printer *p)
> +{
> +	if (ptdev->profile_mask & PANTHOR_DEVICE_PROFILING_TIMESTAMP) {
> +#ifdef CONFIG_ARM_ARCH_TIMER
> +		drm_printf(p, "drm-engine-panthor:\t%llu ns\n",
> +			   DIV_ROUND_UP_ULL((pfile->stats.time * NSEC_PER_SEC),
> +					    arch_timer_get_cntfrq()));
> +#endif
> +	}
> +	if (ptdev->profile_mask & PANTHOR_DEVICE_PROFILING_CYCLES)
> +		drm_printf(p, "drm-cycles-panthor:\t%llu\n", pfile->stats.cycles);

Don't know if that's an issue, but another thread might be updating the
stats while show_fdinfo() is run, which means the data you return might
be coming from two different sampling points.

> +
> +	drm_printf(p, "drm-maxfreq-panthor:\t%lu Hz\n", ptdev->fast_rate);
> +	drm_printf(p, "drm-curfreq-panthor:\t%lu Hz\n", ptdev->current_frequenc=
y);
> +}
> +
> +static void panthor_show_fdinfo(struct drm_printer *p, struct drm_file *=
file)
> +{
> +	struct drm_device *dev =3D file->minor->dev;
> +	struct panthor_device *ptdev =3D container_of(dev, struct panthor_devic=
e, base);
> +
> +	panthor_gpu_show_fdinfo(ptdev, file->driver_priv, p);
> +
> +	drm_show_memory_stats(p, file);
> +}
> +
>  static const struct file_operations panthor_drm_driver_fops =3D {
>  	.open =3D drm_open,
>  	.release =3D drm_release,
> @@ -1360,6 +1393,7 @@ static const struct file_operations panthor_drm_dri=
ver_fops =3D {
>  	.read =3D drm_read,
>  	.llseek =3D noop_llseek,
>  	.mmap =3D panthor_mmap,
> +	.show_fdinfo =3D drm_show_fdinfo,
>  };
> =20
>  #ifdef CONFIG_DEBUG_FS
> @@ -1378,6 +1412,7 @@ static const struct drm_driver panthor_drm_driver =
=3D {
>  			   DRIVER_SYNCOBJ_TIMELINE | DRIVER_GEM_GPUVA,
>  	.open =3D panthor_open,
>  	.postclose =3D panthor_postclose,
> +	.show_fdinfo =3D panthor_show_fdinfo,
>  	.ioctls =3D panthor_drm_driver_ioctls,
>  	.num_ioctls =3D ARRAY_SIZE(panthor_drm_driver_ioctls),
>  	.fops =3D &panthor_drm_driver_fops,
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/pa=
nthor/panthor_sched.c
> index b087648bf59a..e69ab5175ae8 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -619,6 +619,18 @@ struct panthor_group {
>  	 */
>  	struct panthor_kernel_bo *syncobjs;
> =20
> +	/** @fdinfo: Per-file total cycle and timestamp values reference. */
> +	struct {
> +		/** @data: Pointer to actual per-file sample data. */
> +		struct panthor_gpu_usage *data;
> +
> +		/**
> +		 * @lock: Mutex to govern concurrent access from drm file's fdinfo cal=
lback
> +		 * and job post-completion processing function
> +		 */
> +		struct mutex lock;
> +	} fdinfo;
> +
>  	/** @state: Group state. */
>  	enum panthor_group_state state;
> =20
> @@ -886,6 +898,8 @@ static void group_release_work(struct work_struct *wo=
rk)
>  						   release_work);
>  	u32 i;
> =20
> +	mutex_destroy(&group->fdinfo.lock);
> +
>  	for (i =3D 0; i < group->queue_count; i++)
>  		group_free_queue(group, group->queues[i]);
> =20
> @@ -2808,6 +2822,28 @@ void panthor_sched_post_reset(struct panthor_devic=
e *ptdev, bool reset_failed)
>  	}
>  }
> =20
> +static void update_fdinfo_stats(struct panthor_job *job)
> +{
> +	struct panthor_group *group =3D job->group;
> +	struct panthor_queue *queue =3D group->queues[job->queue_idx];
> +	struct panthor_gpu_usage *fdinfo;
> +	struct panthor_job_profiling_data *times;
> +
> +	times =3D (struct panthor_job_profiling_data *)
> +		((unsigned long) queue->profiling_info.slots->kmap +
> +		 (job->profiling_slot * sizeof(struct panthor_job_profiling_data)));
> +
> +	mutex_lock(&group->fdinfo.lock);
> +	if ((group->fdinfo.data)) {
> +		fdinfo =3D group->fdinfo.data;
> +		if (job->profile_mask & PANTHOR_DEVICE_PROFILING_CYCLES)
> +			fdinfo->cycles +=3D times->cycles.after - times->cycles.before;
> +		if (job->profile_mask & PANTHOR_DEVICE_PROFILING_TIMESTAMP)
> +			fdinfo->time +=3D times->time.after - times->time.before;
> +	}
> +	mutex_unlock(&group->fdinfo.lock);
> +}
> +
>  static void group_sync_upd_work(struct work_struct *work)
>  {
>  	struct panthor_group *group =3D
> @@ -2840,6 +2876,8 @@ static void group_sync_upd_work(struct work_struct =
*work)
>  	dma_fence_end_signalling(cookie);
> =20
>  	list_for_each_entry_safe(job, job_tmp, &done_jobs, node) {
> +		if (job->profile_mask)
> +			update_fdinfo_stats(job);
>  		list_del_init(&job->node);
>  		panthor_job_put(&job->base);
>  	}
> @@ -3430,6 +3468,9 @@ int panthor_group_create(struct panthor_file *pfile,
>  	}
>  	mutex_unlock(&sched->reset.lock);
> =20
> +	group->fdinfo.data =3D &pfile->stats;
> +	mutex_init(&group->fdinfo.lock);
> +
>  	return gid;
> =20
>  err_put_group:
> @@ -3469,6 +3510,10 @@ int panthor_group_destroy(struct panthor_file *pfi=
le, u32 group_handle)
>  	mutex_unlock(&sched->lock);
>  	mutex_unlock(&sched->reset.lock);
> =20
> +	mutex_lock(&group->fdinfo.lock);
> +	group->fdinfo.data =3D NULL;
> +	mutex_unlock(&group->fdinfo.lock);
> +
>  	group_put(group);
>  	return 0;
>  }


