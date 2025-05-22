Return-Path: <linux-media+bounces-33210-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B80AC153E
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 22:05:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 888F3A27AC9
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 20:04:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D9CB2BFC63;
	Thu, 22 May 2025 20:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="vTz5EE3W"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3399E2BF3F2
	for <linux-media@vger.kernel.org>; Thu, 22 May 2025 20:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747944278; cv=none; b=piHqJp9QEDG/GtVmHjdJ+CLgphuJVbXacmW4G5g7qoRK7zXsCrQffIfE2tP05MfJcrvtUAgTBnTF3qlzxEmVEED6fXlWzAhUiUooGf8gXk+FV15Z8PZZyptcH+poTef+Y9sxLXcw4H9/z2WQM8umJAdMo+I1Xy10DrexKk6d0HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747944278; c=relaxed/simple;
	bh=EMgNRTTifoLWHG2xAjklDCE9eoEx24sJQBQCpVn1Bg8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Q811tSt4U8A4X5OBZjR1bK317JIQFL0rjrS/fzzhOATnft4B8jdGA+bR3K4iXVMiba9npGNzvFSAQ3jt3a5Gu2NR1lQL68b1YxO5ATvwme1oAdqm53eA5VqToQiD0KDVbzXPWWKbTTe2Ncl1Nj7+36/O4sjzP7Op5SjpmBE7WZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=vTz5EE3W; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-476977848c4so89444481cf.1
        for <linux-media@vger.kernel.org>; Thu, 22 May 2025 13:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1747944275; x=1748549075; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TzHpwlFMF4RNKvahY0VpCyb7xMb9fVKsum9SE7uDRsM=;
        b=vTz5EE3Wz9lTGa2di2D1AZQqq6an1B1mb141zDQttrq3wVCncTTTgXT0bGYXNi5Wiv
         fCMBkJnvPEIwNDqLv2p5dwynf0w96Wpny0Gtxpn3VcUkLNZV2MaDifAoeFs6As3RQUSb
         /E/j74fCPtcMk5VG6NzWPOXEsQ3xxu7l4Dc5KdVpL9bszmnXIf2Ijnwq7dihy0IVduAq
         cuOO6up2C8JXeuq4T2XdqiJ98efQXXBdrqt+XkzeJo5WDpyxT5QHVtHG9Xhf1VXjWsJE
         OhCALOq65FFZuq3Ei/zycqdbPHmbAu8Kxpxik1nDiBSYL/FPFR7hU2j294HeF+yhR1aK
         n08w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747944275; x=1748549075;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TzHpwlFMF4RNKvahY0VpCyb7xMb9fVKsum9SE7uDRsM=;
        b=tlNtTLnLZxFBYirN5FrVeeCWkr8ye4C67Yp3CdEs/WUQjCm/ENGweVFHOPOlI1O7gw
         2onsbHLBfhLidHER/CY539oWJpDBfcFtmL+YoNi+MbYwJP4wF2tE2Soyd/Qh/aQ2cF/M
         khkrb5JeVQrEgmc8Xw3UtulSPp6cm6wi02MKkmmbgF0E8DR3M2LCp3bX5AkA5AR/37vp
         6PkjjVEJDStThSZL18UOLpO4zqAtXXgQuoDXzMAdNGmDtaOD3xcnF0mi5PdkiRWHt4mI
         4wSRaIrec1/SjwBzwfeRJu9p6VCYY64ayhe/iFsehbsllIhPmAkgiTZixrfO1Bad1i+E
         eSWw==
X-Forwarded-Encrypted: i=1; AJvYcCX76iseiE89kMh+MNITDPkotWvI42yK8RKNaYrU0PQtT0p1jPLktDi3R3XQaIIKd8UIqzqNK5foCDtbfw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVO4sHy6SPs4EN2uRv0xBv7UoZBdDYtoUHKOp8zmWtj97BVgWk
	BR+P9ETgfO0uJFZfYAFxJPBut10xttExE6YCvCZeBeeWH3nIK5aeQNhZalcnN5gKRZM=
X-Gm-Gg: ASbGnct2AhXNrzVTlgk17Y8k/s5lZrxc9dDihXBvYVAaTARoE58ZY5oyjCPTPscLJIp
	UdaKcOdaiXiPJ6h+gaeUM52TZ1fsfES4QZ2jPt5/XkEkPKGVX3haW+rSs2J6gsgS+y38czxq1xp
	L3+Ugy5Y8Wnlf2XrpbTma6Q0diIROgsbwJqlQJ9kODwqhrXF8XGg2kCcTYvsdM2H9y9013VGjBV
	NaC3cN7ROgt1mJ6BpJqrkqzB0HQ06NsBeZtOLYs0sNUbBOUCQ27K3CP1vySeQMQHhlNt9Wpc5uQ
	Nrv/gtkIILSdWIXmqmJugRrdNEeI9lSuKNoIp+/6Zvn50wBgiMio2HWX
X-Google-Smtp-Source: AGHT+IFSp329Ht4NjP+NKPzuePkrG4DHMedfVWs2jBkGiWmm863rFqR4tDPHeN32R2dW5lXFQ/ktHw==
X-Received: by 2002:a05:6214:400c:b0:6f5:113a:6901 with SMTP id 6a1803df08f44-6fa93a3e45dmr8181196d6.21.1747944274617;
        Thu, 22 May 2025 13:04:34 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b2fc::5ac? ([2606:6d00:17:b2fc::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b0883f2esm104841966d6.25.2025.05.22.13.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 13:04:34 -0700 (PDT)
Message-ID: <06d4d2834e749a5d4e6f73c30dca74a4079edaee.camel@ndufresne.ca>
Subject: Re: [PATCH 2/3] media: mc: Add media jobs framework
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com, 
	mchehab@kernel.org
Date: Thu, 22 May 2025 16:04:33 -0400
In-Reply-To: <20250519140403.443915-3-dan.scally@ideasonboard.com>
References: <20250519140403.443915-1-dan.scally@ideasonboard.com>
	 <20250519140403.443915-3-dan.scally@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

Le lundi 19 mai 2025 =C3=A0 15:04 +0100, Daniel Scally a =C3=A9crit=C2=A0:
> Add a new framework to the media subsystem describing media jobs.
> This framework is intended to be able to model the interactions
> between multiple different drivers that need to be run in concert
> to fully control a media pipeline, for example an ISP driver and a
> driver controlling a DMA device that feeds data from memory in to
> that ISP.
>=20
> The new framework allows all drivers involved to add explicit steps
> that need to be performed, and to control the ordering of those steps
> precisely. Once the job with its steps has been created it's then
> scheduled to be run with a workqueue which executes each step in the
> defined order.
>=20
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> =C2=A0drivers/media/mc/Makefile=C2=A0 |=C2=A0=C2=A0 2 +-
> =C2=A0drivers/media/mc/mc-jobs.c | 446 ++++++++++++++++++++++++++++++++++=
+++
> =C2=A0include/media/media-jobs.h | 354 +++++++++++++++++++++++++++++
> =C2=A03 files changed, 801 insertions(+), 1 deletion(-)
> =C2=A0create mode 100644 drivers/media/mc/mc-jobs.c
> =C2=A0create mode 100644 include/media/media-jobs.h
>=20
> diff --git a/drivers/media/mc/Makefile b/drivers/media/mc/Makefile
> index 2b7af42ba59c..9148bbfd1578 100644
> --- a/drivers/media/mc/Makefile
> +++ b/drivers/media/mc/Makefile
> @@ -1,7 +1,7 @@
> =C2=A0# SPDX-License-Identifier: GPL-2.0
> =C2=A0
> =C2=A0mc-objs	:=3D mc-device.o mc-devnode.o mc-entity.o \
> -	=C2=A0=C2=A0 mc-request.o
> +	=C2=A0=C2=A0 mc-jobs.o mc-request.o
> =C2=A0
> =C2=A0ifneq ($(CONFIG_USB),)
> =C2=A0	mc-objs +=3D mc-dev-allocator.o
> diff --git a/drivers/media/mc/mc-jobs.c b/drivers/media/mc/mc-jobs.c
> new file mode 100644
> index 000000000000..1f04cdf63d27
> --- /dev/null
> +++ b/drivers/media/mc/mc-jobs.c
> @@ -0,0 +1,446 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Media jobs framework
> + *
> + * Copyright 2025 Ideas on Board Oy
> + *
> + * Author: Daniel Scally <dan.scally@ideasonboard.com>
> + */
> +
> +#include <linux/cleanup.h>
> +#include <linux/kref.h>
> +#include <linux/list.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +
> +#include <media/media-device.h>
> +#include <media/media-entity.h>
> +#include <media/media-jobs.h>
> +
> +int media_jobs_add_job_step(struct media_job *job, void (*run_step)(void=
 *data),
> +			=C2=A0=C2=A0=C2=A0 void *data, unsigned int flags, unsigned int pos)
> +{
> +	struct media_job_step *step, *tmp;
> +	unsigned int num =3D flags;
> +	unsigned int count =3D 0;
> +
> +	guard(spinlock)(&job->lock);
> +
> +	if (!flags) {
> +		WARN_ONCE(1, "%s(): No flag bits set\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	/* Count the number of set flags; they're mutually exclusive. */
> +	while (num) {
> +		num &=3D (num - 1);
> +		count++;
> +	}

Can this be replaced by hweight_long() or hweight32() ?

just a drive by comment,
Nicolas

> +
> +	if (count > 1) {
> +		WARN_ONCE(1, "%s(): Multiple flag bits set\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	step =3D kzalloc(sizeof(*step), GFP_KERNEL);
> +	if (!step)
> +		return -ENOMEM;
> +
> +	step->run_step =3D run_step;
> +	step->data =3D data;
> +	step->flags =3D flags;
> +	step->pos =3D pos;
> +
> +	/*
> +	 * We need to decide where to place the step. If the list is empty that
> +	 * is really easy (and also the later code is much easier if the code i=
s
> +	 * guaranteed not to be empty...)
> +	 */
> +	if (list_empty(&job->steps)) {
> +		list_add_tail(&step->list, &job->steps);
> +		return 0;
> +	}
> +
> +	/*
> +	 * If we've been asked to place it at a specific position from the end
> +	 * of the list, we cycle back through it until either we exhaust the
> +	 * list or find an entry that needs to go further from the back than th=
e
> +	 * new one.
> +	 */
> +	if ((flags & MEDIA_JOBS_FL_STEP_FROM_BACK)) {
> +		list_for_each_entry_reverse(tmp, &job->steps, list) {
> +			if (tmp->flags =3D=3D flags && tmp->pos =3D=3D pos)
> +				return -EINVAL;
> +
> +			if (tmp->flags !=3D MEDIA_JOBS_FL_STEP_FROM_BACK ||
> +			=C2=A0=C2=A0=C2=A0 tmp->pos > pos)
> +				break;
> +		}
> +
> +		/*
> +		 * If the entry we broke on is also one placed from the back and
> +		 * should be closer to the back than the new one, we place the
> +		 * new one in front of it...otherwise place the new one behind
> +		 * it.
> +		 */
> +		if (tmp->flags =3D=3D flags && tmp->pos < pos)
> +			list_add_tail(&step->list, &tmp->list);
> +		else
> +			list_add(&step->list, &tmp->list);
> +
> +		return 0;
> +	}
> +
> +	/*
> +	 * If we've been asked to place it a specific position from the front o=
f
> +	 * the list we do the same kind of operation, but going from the front
> +	 * instead.
> +	 */
> +	if (flags & MEDIA_JOBS_FL_STEP_FROM_FRONT) {
> +		list_for_each_entry(tmp, &job->steps, list) {
> +			if (tmp->flags =3D=3D flags && tmp->pos =3D=3D pos)
> +				return -EINVAL;
> +
> +			if (tmp->flags !=3D MEDIA_JOBS_FL_STEP_FROM_FRONT ||
> +			=C2=A0=C2=A0=C2=A0 tmp->pos > pos)
> +				break;
> +		}
> +
> +		/*
> +		 * If the entry we broke on is also placed from the front and
> +		 * should be closed to the front than the new one, we place the
> +		 * new one behind it, otherwise in front of it.
> +		 */
> +		if (tmp->flags =3D=3D flags && tmp->pos < pos)
> +			list_add(&step->list, &tmp->list);
> +		else
> +			list_add_tail(&step->list, &tmp->list);
> +
> +		return 0;
> +	}
> +
> +	/*
> +	 * If the step is flagged as "can go anywhere" we just need to try to
> +	 * find the first "from the back" entry and add it immediately before
> +	 * that. If we can't find one, add it after whatever we did find.
> +	 */
> +	if (flags & MEDIA_JOBS_FL_STEP_ANYWHERE) {
> +		list_for_each_entry(tmp, &job->steps, list)
> +			if ((tmp->flags & MEDIA_JOBS_FL_STEP_FROM_BACK))
> +				break;
> +
> +		if ((tmp->flags & MEDIA_JOBS_FL_STEP_FROM_BACK) ||
> +		=C2=A0=C2=A0=C2=A0 list_entry_is_head(tmp, &job->steps, list))
> +			list_add_tail(&step->list, &tmp->list);
> +		else
> +			list_add(&step->list, &tmp->list);
> +
> +		return 0;
> +	}
> +
> +	/* Shouldn't get here, unless the flag value is wrong. */
> +	WARN_ONCE(1, "%s(): Invalid flag value\n", __func__);
> +	return -EINVAL;
> +}
> +EXPORT_SYMBOL_GPL(media_jobs_add_job_step);
> +
> +int media_jobs_add_job_dep(struct media_job *job, struct media_job_dep_o=
ps *ops,
> +			=C2=A0=C2=A0 void *data)
> +{
> +	struct media_job_dep *dep;
> +
> +	if (!ops || !ops->check_dep || !data)
> +		return -EINVAL;
> +
> +	guard(spinlock)(&job->lock);
> +
> +	/* Confirm the same dependency hasn't already been added */
> +	list_for_each_entry(dep, &job->deps, list)
> +		if (dep->ops =3D=3D ops && dep->data =3D=3D data)
> +			return -EINVAL;
> +
> +	dep =3D kzalloc(sizeof(*dep), GFP_KERNEL);
> +	if (!dep)
> +		return -ENOMEM;
> +
> +	dep->ops =3D ops;
> +	dep->data =3D data;
> +	list_add(&dep->list, &job->deps);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(media_jobs_add_job_dep);
> +
> +static bool media_jobs_check_pending_job(struct media_job *job,
> +					 enum media_job_types type,
> +					 struct media_job_dep_ops *dep_ops,
> +					 void *data)
> +{
> +	struct media_job_dep *dep;
> +
> +	guard(spinlock)(&job->lock);
> +
> +	if (job->type !=3D type)
> +		return false;
> +
> +	list_for_each_entry(dep, &job->deps, list) {
> +		if (dep->ops =3D=3D dep_ops && dep->data =3D=3D data) {
> +			if (dep->met)
> +				return false;
> +
> +			break;
> +		}
> +	}
> +
> +	dep->met =3D true;
> +	return true;
> +}
> +
> +static struct media_job *media_jobs_get_job(struct media_job_scheduler *=
sched,
> +					=C2=A0=C2=A0=C2=A0 enum media_job_types type,
> +					=C2=A0=C2=A0=C2=A0 struct media_job_dep_ops *dep_ops,
> +					=C2=A0=C2=A0=C2=A0 void *dep_data)
> +{
> +	struct media_job_setup_func *jsf;
> +	struct media_job *job;
> +	int ret;
> +
> +	list_for_each_entry(job, &sched->pending, list)
> +		if (media_jobs_check_pending_job(job, type, dep_ops, dep_data))
> +			return job;
> +
> +	job =3D kzalloc(sizeof(*job), GFP_KERNEL);
> +	if (!job)
> +		return ERR_PTR(-ENOMEM);
> +
> +	spin_lock_init(&job->lock);
> +	INIT_LIST_HEAD(&job->deps);
> +	INIT_LIST_HEAD(&job->steps);
> +	job->type =3D type;
> +	job->sched =3D sched;
> +
> +	list_for_each_entry(jsf, &sched->setup_funcs, list) {
> +		if (jsf->type !=3D type)
> +			continue;
> +
> +		ret =3D jsf->job_setup(job, jsf->data);
> +		if (ret) {
> +			kfree(job);
> +			return ERR_PTR(ret);
> +		}
> +	}
> +
> +	list_add_tail(&job->list, &sched->pending);
> +
> +	/* This marks the dependency as met */
> +	media_jobs_check_pending_job(job, type, dep_ops, dep_data);
> +
> +	return job;
> +}
> +
> +static void media_jobs_free_job(struct media_job *job, bool reset)
> +{
> +	struct media_job_step *step, *stmp;
> +	struct media_job_dep *dep, *dtmp;
> +
> +	scoped_guard(spinlock, &job->lock) {
> +		list_for_each_entry_safe(dep, dtmp, &job->deps, list) {
> +			if (reset && dep->ops->reset_dep)
> +				dep->ops->reset_dep(dep->data);
> +
> +			list_del(&dep->list);
> +			kfree(dep);
> +		}
> +
> +		list_for_each_entry_safe(step, stmp, &job->steps, list) {
> +			list_del(&step->list);
> +			kfree(step);
> +		}
> +	}
> +
> +	list_del(&job->list);
> +	kfree(job);
> +}
> +
> +int media_jobs_try_queue_job(struct media_job_scheduler *sched,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 enum media_job_types type,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 struct media_job_dep_ops *dep_ops, void *dep=
_data)
> +{
> +	struct media_job_dep *dep;
> +	struct media_job *job;
> +
> +	if (!sched)
> +		return 0;
> +
> +	guard(spinlock)(&sched->lock);
> +
> +	job =3D media_jobs_get_job(sched, type, dep_ops, dep_data);
> +	if (IS_ERR(job))
> +		return PTR_ERR(job);
> +
> +	list_for_each_entry(dep, &job->deps, list)
> +		if (!dep->ops->check_dep(dep->data))
> +			return 0; /* Not a failure */
> +
> +	list_for_each_entry(dep, &job->deps, list)
> +		if (dep->ops->clear_dep)
> +			dep->ops->clear_dep(dep->data);
> +
> +	list_move_tail(&job->list, &sched->queue);
> +	queue_work(sched->async_wq, &sched->work);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(media_jobs_try_queue_job);
> +
> +static void __media_jobs_run_jobs(struct work_struct *work)
> +{
> +	struct media_job_scheduler *sched =3D container_of(work,
> +							 struct media_job_scheduler,
> +							 work);
> +	struct media_job_step *step;
> +	struct media_job *job;
> +
> +	while (true) {
> +		scoped_guard(spinlock, &sched->lock) {
> +			if (list_empty(&sched->queue))
> +				return;
> +
> +			job =3D list_first_entry(&sched->queue, struct media_job,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 list);
> +		}
> +
> +		list_for_each_entry(step, &job->steps, list)
> +			step->run_step(step->data);
> +
> +		media_jobs_free_job(job, false);
> +	}
> +}
> +
> +void media_jobs_run_jobs(struct media_job_scheduler *sched)
> +{
> +	if (!sched)
> +		return;
> +
> +	queue_work(sched->async_wq, &sched->work);
> +}
> +EXPORT_SYMBOL_GPL(media_jobs_run_jobs);
> +
> +static void __media_jobs_cancel_jobs(struct media_job_scheduler *sched)
> +{
> +	struct media_job *job, *jtmp;
> +
> +	list_for_each_entry_safe(job, jtmp, &sched->pending, list)
> +		media_jobs_free_job(job, true);
> +
> +	list_for_each_entry_safe(job, jtmp, &sched->queue, list)
> +		media_jobs_free_job(job, true);
> +}
> +
> +void media_jobs_cancel_jobs(struct media_job_scheduler *sched)
> +{
> +	if (!sched)
> +		return;
> +
> +	guard(spinlock)(&sched->lock);
> +	__media_jobs_cancel_jobs(sched);
> +}
> +EXPORT_SYMBOL_GPL(media_jobs_cancel_jobs);
> +
> +int media_jobs_add_job_setup_func(struct media_job_scheduler *sched,
> +				=C2=A0 int (*job_setup)(struct media_job *job, void *data),
> +				=C2=A0 void *data, enum media_job_types type)
> +{
> +	struct media_job_setup_func *new_setup_func;
> +
> +	guard(spinlock)(&sched->lock);
> +
> +	new_setup_func =3D kzalloc(sizeof(*new_setup_func), GFP_KERNEL);
> +	if (!new_setup_func)
> +		return -ENOMEM;
> +
> +	new_setup_func->type =3D type;
> +	new_setup_func->job_setup =3D job_setup;
> +	new_setup_func->data =3D data;
> +	list_add_tail(&new_setup_func->list, &sched->setup_funcs);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(media_jobs_add_job_setup_func);
> +
> +static void __media_jobs_put_scheduler(struct kref *kref)
> +{
> +	struct media_job_scheduler *sched =3D
> +		container_of(kref, struct media_job_scheduler, kref);
> +	struct media_job_setup_func *func, *ftmp;
> +
> +	cancel_work_sync(&sched->work);
> +	destroy_workqueue(sched->async_wq);
> +
> +	scoped_guard(spinlock, &sched->lock) {
> +		__media_jobs_cancel_jobs(sched);
> +
> +		list_for_each_entry_safe(func, ftmp, &sched->setup_funcs, list) {
> +			list_del(&func->list);
> +			kfree(func);
> +		}
> +	}
> +
> +	list_del(&sched->list);
> +	kfree(sched);
> +}
> +
> +void media_jobs_put_scheduler(struct media_job_scheduler *sched)
> +{
> +	kref_put(&sched->kref, __media_jobs_put_scheduler);
> +}
> +EXPORT_SYMBOL_GPL(media_jobs_put_scheduler);
> +
> +struct media_job_scheduler *media_jobs_get_scheduler(struct media_device=
 *mdev)
> +{
> +	struct media_job_scheduler *sched;
> +	char workqueue_name[32];
> +	int ret;
> +
> +	guard(mutex)(&media_job_schedulers_lock);
> +
> +	list_for_each_entry(sched, &media_job_schedulers, list) {
> +		if (sched->mdev =3D=3D mdev) {
> +			kref_get(&sched->kref);
> +			return sched;
> +		}
> +	}
> +
> +	ret =3D snprintf(workqueue_name, sizeof(workqueue_name),
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "mc jobs (%s)", mdev->driver_name=
);
> +	if (!ret)
> +		return ERR_PTR(-EINVAL);
> +
> +	sched =3D kzalloc(sizeof(*sched), GFP_KERNEL);
> +	if (!sched)
> +		return ERR_PTR(-ENOMEM);
> +
> +	sched->async_wq =3D alloc_workqueue(workqueue_name, 0, 0);
> +	if (!sched->async_wq) {
> +		kfree(sched);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	sched->mdev =3D mdev;
> +	kref_init(&sched->kref);
> +	spin_lock_init(&sched->lock);
> +	INIT_LIST_HEAD(&sched->setup_funcs);
> +	INIT_LIST_HEAD(&sched->pending);
> +	INIT_LIST_HEAD(&sched->queue);
> +	INIT_WORK(&sched->work, __media_jobs_run_jobs);
> +
> +	list_add_tail(&sched->list, &media_job_schedulers);
> +
> +	return sched;
> +}
> +EXPORT_SYMBOL_GPL(media_jobs_get_scheduler);
> +
> +LIST_HEAD(media_job_schedulers);
> +
> +/* Synchronise access to the global schedulers list */
> +DEFINE_MUTEX(media_job_schedulers_lock);
> diff --git a/include/media/media-jobs.h b/include/media/media-jobs.h
> new file mode 100644
> index 000000000000..a97270861251
> --- /dev/null
> +++ b/include/media/media-jobs.h
> @@ -0,0 +1,354 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Media jobs framework
> + *
> + * Copyright 2025 Ideas on Board Oy
> + *
> + * Author: Daniel Scally <dan.scally@ideasonboard.com>
> + */
> +
> +#include <linux/kref.h>
> +#include <linux/list.h>
> +#include <linux/mutex.h>
> +#include <linux/spinlock.h>
> +#include <linux/types.h>
> +#include <linux/workqueue.h>
> +
> +#ifndef _MEDIA_JOBS_H
> +#define _MEDIA_JOBS_H
> +
> +struct media_device;
> +struct media_entity;
> +struct media_job;
> +struct media_job_dep;
> +
> +/**
> + * define MEDIA_JOBS_FL_STEP_ANYWHERE - \
> + *=C2=A0=C2=A0=C2=A0 Flag a media job step as able to run anytime
> + *
> + * This flag informs the framework that a job step does not need a parti=
cular
> + * position in the list of job steps and can be placed anywhere.
> + */
> +#define MEDIA_JOBS_FL_STEP_ANYWHERE			BIT(0)
> +
> +/**
> + * define MEDIA_JOBS_FL_STEP_FROM_FRONT - \
> + *=C2=A0=C2=A0=C2=A0 Flag a media job step as needing to be placed near =
the start of the list
> + *
> + * This flag informs the framework that a job step needs to be placed at=
 a set
> + * position from the start of the list of job steps.
> + */
> +#define MEDIA_JOBS_FL_STEP_FROM_FRONT			BIT(1)
> +
> +/**
> + * define MEDIA_JOBS_FL_STEP_FROM_BACK - \
> + *=C2=A0=C2=A0=C2=A0 Flag a media job step as needing to be placed near =
the end of the list
> + *
> + * This flag informs the framework that a job step needs to be placed at=
 a set
> + * position from the end of the list of job steps.
> + */
> +#define MEDIA_JOBS_FL_STEP_FROM_BACK			BIT(2)
> +
> +/**
> + * enum media_job_types - Type of media job
> + *
> + * @MEDIA_JOB_TYPE_PIPELINE_PULSE:	A data event moving through the media
> + *					pipeline
> + *
> + * This enumeration details different types of media jobs. The type can =
be used
> + * to differentiate between which steps and dependencies a driver needs =
to add
> + * to a job when it is created.
> + */
> +enum media_job_types {
> +	MEDIA_JOB_TYPE_PIPELINE_PULSE,
> +};
> +
> +/**
> + * struct media_job_scheduler - A job scheduler for a particular media d=
evice
> + *
> + * @mdev:		Media device this scheduler is for
> + * @list:		List head to attach to the global list of schedulers
> + * @kref:		Reference counter
> + * @lock:		Lock to protect access to the scheduler
> + * @setup_funcs:	List of &struct media_job_setup_func to populate jobs
> + * @pending:		List of &struct media_jobs created but not yet queued
> + * @queue:		List of &struct media_jobs queued to the scheduler
> + * @work:		Work item to run the jobs
> + * @async_wq:		Workqueue to run the work on
> + *
> + * This struct is the main job scheduler struct - drivers wanting to use=
 this
> + * framework should acquire an instance through media_jobs_get_scheduler=
() and
> + * subsequently populate it with job setup functions.
> + */
> +struct media_job_scheduler {
> +	struct media_device *mdev;
> +	struct list_head list;
> +	struct kref kref;
> +
> +	spinlock_t lock; /* Synchronise access to the struct's lists */
> +	struct list_head setup_funcs;
> +	struct list_head pending;
> +	struct list_head queue;
> +	struct work_struct work;
> +	struct workqueue_struct *async_wq;
> +};
> +
> +/**
> + * struct media_job_setup_func - A function to populate a media job with=
 steps
> + *				 and dependencies
> + *
> + * @list:	The list object to attach to the scheduler
> + * @type:	The &enum media_job_types that this function populates a job f=
or
> + * @job_setup:	Function pointer to the driver's job setup function
> + * @data:	Pointer to the driver data for use with @job_setup
> + *
> + * This struct holds data about the functions a driver registers with th=
e jobs
> + * framework in order to populate a new job with steps and dependencies.
> + */
> +struct media_job_setup_func {
> +	struct list_head list;
> +	enum media_job_types type;
> +	int (*job_setup)(struct media_job *job, void *data);
> +	void *data;
> +};
> +
> +/**
> + * struct media_job - A representation of a job to be run through the pi=
peline
> + *
> + * @lock:	Lock to protect access to the job's lists
> + * @list:	List head to attach the job to &struct media_job_scheduler in
> + *		either the pending or queue lists
> + * @steps:	List of &struct media_job_step to run the job
> + * @deps:	List of &struct media_job_dep to check that the job can be
> + *		queued
> + * @sched:	Pointer to the media job scheduler
> + * @type:	The type of the job
> + *
> + * This struct holds lists of steps that need to be performed to carry o=
ut a
> + * job in the pipeline. A separate list of dependencies allows the queue=
ing of
> + * the job to be delayed until all drivers are ready to carry it out.
> + */
> +struct media_job {
> +	spinlock_t lock; /* Synchronise access to the struct's lists 6*/
> +	struct list_head list;
> +	struct list_head steps;
> +	struct list_head deps;
> +	struct media_job_scheduler *sched;
> +	enum media_job_types type;
> +};
> +
> +/**
> + * struct media_job_step - A holder for a function to run as part of a j=
ob
> + *
> + * @list:	List head to attach the job step to a &struct media_job.steps
> + * @run_step:	The function to run to perform the step
> + * @data:	Data to pass to the .run_step() function
> + * @flags:	Flags to control how the step is ordered within the job's lis=
t
> + *		of steps
> + * @pos:	Position indicator to control how the step is ordered within th=
e
> + *		job's list of steps
> + *
> + * This struct defines a function that needs to be run as part of the ex=
ecution
> + * of a job in a media pipeline, along with information that help the sc=
heduler
> + * determine what order it should be ran in in reference to the other st=
eps that
> + * are part of the same job.
> + */
> +struct media_job_step {
> +	struct list_head list;
> +	void (*run_step)(void *data);
> +	void *data;
> +	unsigned int flags;
> +	unsigned int pos;
> +};
> +
> +/**
> + * struct media_job_dep_ops - Operations to manage a media job dependenc=
y
> + *
> + * @check_dep:	A function to ask the driver whether the dependency is me=
t
> + * @clear_dep:	A function to tell the driver that the job has been queue=
d
> + * @reset_dep:	A function to tell the driver that the job has been cance=
lled
> + *
> + * Media jobs have dependencies, such as requiring buffers to be queued.=
 These
> + * operations allow a driver to define how the media jobs framework shou=
ld check
> + * whether or not those dependencies are met and how it should inform th=
em that
> + * it is taking action based on the state of those dependencies.
> + */
> +struct media_job_dep_ops {
> +	bool (*check_dep)(void *data);
> +	void (*clear_dep)(void *data);
> +	void (*reset_dep)(void *data);
> +};
> +
> +/**
> + * struct media_job_dep - Representation of media job dependency
> + *
> + * @list:	List head to attach to a &struct media_job.deps
> + * @ops:	A pointer to the dependency's operations functions
> + * @met:	A flag to record whether or not the dependency is met
> + * @data:	Data to pass to the dependency's operations
> + *
> + * This struct represents a dependency of a media job. The operations me=
mber
> + * holds pointers to functions allowing the framework to interact with t=
he
> + * driver to check whether or not the dependency is met.
> + */
> +struct media_job_dep {
> +	struct list_head list;
> +	struct media_job_dep_ops *ops;
> +	bool met;
> +	void *data;
> +};
> +
> +/**
> + * media_jobs_try_queue_job - Try to queue a &struct media_job
> + *
> + * @sched:	Pointer to the job scheduler
> + * @type:	The type of the media job
> + * @dep_ops:	A pointer to the dependency operations for this job
> + * @dep_data:	A pointer to the dependency data for this job
> + *
> + * Try to queue a media job with the scheduler. This function should be =
called
> + * by the drivers whenever a dependency for a media job is met - for exa=
mple
> + * when a buffer is queued to the driver. The framework will check to se=
e if an
> + * existing job on the scheduler's pending list shares the same type, de=
pendency
> + * operations and dependency data. If it does then that existing job wil=
l be
> + * considered. If there is no extant job with those same parameters, a n=
ew job
> + * is allocated and populated by calling the setup functions registered =
with
> + * the framework.
> + *
> + * The function iterates over the dependencies that are registered with =
the job
> + * and checks to see if they are met. If they're all met, they're cleare=
d and
> + * the job is placed onto the scheduler's queue.
> + *
> + * To help reduce conditionals in drivers where a driver supports both t=
he use
> + * of the media jobs framework and operation without it, this function i=
s a no
> + * op if @sched is NULL.
> + *
> + * Return: 0 on success or a negative error number
> + */
> +int media_jobs_try_queue_job(struct media_job_scheduler *sched,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 enum media_job_types type,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 struct media_job_dep_ops *dep_ops, void *dep=
_data);
> +
> +/**
> + * media_jobs_add_job_step - Add a step to a media job
> + *
> + * @job:	Pointer to the &struct media_job
> + * @run_step:	Pointer to the function to run to execute the step
> + * @data:	Pointer to the data to pass to @run_ste
> + * @flags:	One of the MEDIA_JOBS_FL_STEP_* flags
> + * @pos:	A position indicator to use with @flags
> + *
> + * This function adds a step to the job and should be called from the dr=
ivers'
> + * job setup functions as registered with the framework through
> + * media_jobs_add_job_setup_func(). The @flags and @pos parameters are u=
sed
> + * to determine the ordering of the steps within the job:
> + *
> + * If @flags has the MEDIA_JOBS_FL_STEP_ANYWHERE bit set, the step is pl=
aced
> + * after all steps with MEDIA_JOBS_FL_STEP_FROM_FRONT and before all ste=
ps with
> + * MEDIA_JOBS_FL_STEP_FROM_BACK bit set, but otherwise in whatever order=
 this
> + * function is called.
> + *
> + * If @flags has the MEDIA_JOBS_FL_STEP_FROM_FRONT bit set then the step=
 is
> + * placed @pos steps from the front of the list. Attempting to place mul=
tiple
> + * steps in the same position will result in an error.
> + *
> + * If @flags has the MEDIA_JOBS_FL_STEP_FROM_BACK bit set then the step =
is
> + * placed @pos steps from the back of the list. Attempting to place mult=
iple
> + * steps in the same position will result in an error.
> + *
> + * Return: 0 on success or a negative error number
> + */
> +int media_jobs_add_job_step(struct media_job *job, void (*run_step)(void=
 *data),
> +			=C2=A0=C2=A0=C2=A0 void *data, unsigned int flags, unsigned int pos);
> +
> +/**
> + * media_jobs_add_job_dep - Add a dependency to a media job
> + *
> + * @job:	Pointer to the &struct media_job
> + * @ops:	Pointer to the &struct media_job_dep_ops
> + * @data:	Pointer to the data to pass to the dependency's operations
> + *
> + * This function adds a dependency to the job and should be called from =
the
> + * drivers job setup functions as registered with the framework through =
the
> + * media_jobs_add_job_setup_func() function.
> + *
> + * Return: 0 on success or a negative error number
> + */
> +int media_jobs_add_job_dep(struct media_job *job, struct media_job_dep_o=
ps *ops,
> +			=C2=A0=C2=A0 void *data);
> +
> +/**
> + * media_jobs_add_job_setup_func - Add a function that populates a media=
 job
> + *
> + * @sched:	Pointer to the media jobs scheduler
> + * @job_setup:	Pointer to the new job setup function
> + * @data:	Data to pass to the job setup function
> + * @type:	The type of job that this function should be called for
> + *
> + * Drivers that wish to utilise the framework need to use this function =
to
> + * register a callback that adds job steps and dependencies when one is =
created.
> + * The function must call media_jobs_add_job_step() and media_jobs_add_j=
ob_dep()
> + * to populate the job.
> + *
> + * Return: 0 on success or a negative error number
> + */
> +int media_jobs_add_job_setup_func(struct media_job_scheduler *sched,
> +				=C2=A0 int (*job_setup)(struct media_job *job, void *data),
> +				=C2=A0 void *data, enum media_job_types type);
> +
> +/**
> + * media_jobs_put_scheduler - Put a reference to the media jobs schedule=
r
> + *
> + * @sched:	Pointer to the media jobs scheduler
> + *
> + * This function puts a reference to the media jobs scheduler, and is in=
tended
> + * to be called in error and exit paths for consuming drivers
> + */
> +void media_jobs_put_scheduler(struct media_job_scheduler *sched);
> +
> +/**
> + * media_jobs_get_scheduler - Get a media jobs scheduler
> + *
> + * @mdev:	Pointer to the media device associated with the scheduler
> + *
> + * This function gets a pointer to a &struct media_job_scheduler associa=
ted with
> + * the media device passed to @mdev. If one is not available then it is
> + * allocated and returned. This allows multiple drivers sharing a media =
graph to
> + * work with the same media job scheduler.
> + *
> + * Return: 0 on success or a negative error number
> + */
> +struct media_job_scheduler *media_jobs_get_scheduler(struct media_device=
 *mdev);
> +
> +/**
> + * media_jobs_run_jobs - Run any media jobs that are ready in the queue
> + *
> + * @sched:	Pointer to the media job scheduler
> + *
> + * This function triggers the workqueue that processes any jobs that hav=
e been
> + * queued, and should be called whenever the pipeline is ready to do so.
> + *
> + * To help reduce conditionals in drivers where a driver supports both t=
he use
> + * of the media jobs framework and operation without it, this function i=
s a no
> + * op if @sched is NULL.
> + */
> +void media_jobs_run_jobs(struct media_job_scheduler *sched);
> +
> +/**
> + * media_jobs_cancel_jobs - cancel all waiting jobs
> + *
> + * @sched:	Pointer to the media job scheduler
> + *
> + * This function iterates over any pending and queued jobs, resets their
> + * dependencies and frees the job
> + *
> + * To help reduce conditionals in drivers where a driver supports both t=
he use
> + * of the media jobs framework and operation without it, this function i=
s a no
> + * op if @sched is NULL.
> + */
> +void media_jobs_cancel_jobs(struct media_job_scheduler *sched);
> +
> +extern struct list_head media_job_schedulers;
> +extern struct mutex media_job_schedulers_lock;
> +
> +#endif /* _MEDIA_JOBS_H */

