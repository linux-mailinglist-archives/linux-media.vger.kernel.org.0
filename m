Return-Path: <linux-media+bounces-38914-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F5DB1B1DD
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 12:22:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 611B9189F474
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 10:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19F3226F471;
	Tue,  5 Aug 2025 10:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZgEB29+0"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBA226CE26
	for <linux-media@vger.kernel.org>; Tue,  5 Aug 2025 10:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754389364; cv=none; b=CFNvPAnC9zKXUguM0tkMLbxVob73p3YTfshFyL68Aoe51JRXucprgzaFPn+IXK+Rf9dFNVuPqNCWE+9fQx568kJ7ooWaf/C0DozBkL7MotNmnFye0LcF9TF7TcNZtp3uLwy/ZMq2uAB89tNkZrmENu3prUdkh4rwTYG+HVLybtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754389364; c=relaxed/simple;
	bh=SKed1GIHsWw1PZnH3i5+04QUyTdq6ySLpgr7w3XmQfc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lnych7d8dNUkDuvM8JMD/u3lPXiEvWDI/ZWwhXiEbUnxErrkXnTR9iNzC9HOA9D99bEcLj969uQ74aeCOMn4hLkpUJhUYtljVXT/KIKADZFWKwqXsJaGl4CUTeeysc/lsCT4N7w7uKaeKZZtN7FsJTj5vacXa9OoJ28jdP5KONc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZgEB29+0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754389360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hxwtnm/6FWirXaVh9W/3hXWhtlUN58tGvHC41ZQtmVY=;
	b=ZgEB29+0VexAAN8UNmnHPz6svEsIWgUttgU6C3SmukUjyQ6x41EivOXKTycR6lSz3NEdsz
	yALb8rC2dZ3+AZr2FtjoEB7E5+j8Jt7/8qtrqkXN75zyEvLCpUR5du0XMJ32u8pqo6WeKC
	byWTGU93DSDOMHTQTS2pRyXdqn5leuU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-115-jWH4OhezPuKst0krufUj0Q-1; Tue, 05 Aug 2025 06:22:37 -0400
X-MC-Unique: jWH4OhezPuKst0krufUj0Q-1
X-Mimecast-MFC-AGG-ID: jWH4OhezPuKst0krufUj0Q_1754389356
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6158c31f27cso1943871a12.2
        for <linux-media@vger.kernel.org>; Tue, 05 Aug 2025 03:22:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754389356; x=1754994156;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hxwtnm/6FWirXaVh9W/3hXWhtlUN58tGvHC41ZQtmVY=;
        b=tA/slfqsO+RtzFJwHUsvzuMpwAOWt45HAkybU5+dFXBVI5wa7bhGdyAfvsmlp4aKG2
         vnkAB/JM6snGMUxImfko/LoXZLuApy1ghi69nE6unhkKX0meR66ZpHf1fzGhR/7m4K8a
         6NaUyUsk01AocFEoAv2D7yzXXmB4GmT99riTW3u7KHtcB/KaMTz5NMpFB0/kyDkLMoDW
         Cmt/XqAwAlUSZVuLuOTY0xO3QUDF+KH+hF6+4wVJsg6V5LljsUokP6xi8F4D2tfFwXJQ
         5RjQPH1y7scnMOzeg2y7hFts59wzipdtiFNGXb9Vrl6//3rUle9YRZ2GVxnSMac7KkNq
         8T0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXtB6InVecr6XqEYSg7pnu/n+A2dYuPrzK63V8tlk0+9RQTUQe42tbAL8PZYwOfipjjs6Z15eG9nIZAXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyL/ywLWUPAtsH7/b1vZ6Ff3PvnhWH0c6cokwEuuHJBrkZTcPkl
	pB3zCEyFkRWHikG6O6epgwZpPtHFnH7RlpNDOROyTNp10DY14YmX7WJw5GTqTOlkNkkCno0YBw7
	TcQi4VpJYAjbZTVQs13Z1awBS4s4tqGahs/Cyo4O7aXtSHJkxLSx2BPquQPOWGUhd
X-Gm-Gg: ASbGncsK6EcclZrFNfyrwU4oOi+SbYspf/GI+ZrH+2YD5anS2+wgTFCkkSOZgMiOHcJ
	dXoYPPA6w0ATZCQjmlrt+UeH+xJDLK8mzwRIFZchUEdsUQqM0TTyJ1WuwYoIAuhBfUJlmnKCFJ4
	+nLDOnZmpjAo+4KaaR/Me3Gh6wFBZrw+BcDv0I3fO+AUTzGYJLY5L4CnoBt6uJk8mf2Su+Rfm2A
	z356x+zYU3ByvdEQ7v80QYbXZTbWURNQWSpWviHrN3FD9OEFyJvG22TkIXfWxoXldhLd+jN1EwM
	MSpTJlEBAb/KHHl6SXzRq2xcH3oKrinr/9XTb9aIXlAFKSrD4Ma/AJhpFlK/lFRd9SU7i1oFPC3
	x1GnLXoLTcb0=
X-Received: by 2002:a05:6402:518d:b0:615:a2d9:61f4 with SMTP id 4fb4d7f45d1cf-615e6ef6947mr12269575a12.15.1754389356126;
        Tue, 05 Aug 2025 03:22:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOrBfn1c849N18l/tb+xnqIlivd4zM8l2Mm8o9RS5bGcm/HnwY352Hs9YE32I/17KvLQMEjw==
X-Received: by 2002:a05:6402:518d:b0:615:a2d9:61f4 with SMTP id 4fb4d7f45d1cf-615e6ef6947mr12269544a12.15.1754389355639;
        Tue, 05 Aug 2025 03:22:35 -0700 (PDT)
Received: from ?IPv6:2001:16b8:3d90:a700:522d:5615:dfb:4451? ([2001:16b8:3d90:a700:522d:5615:dfb:4451])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f00066sm8016265a12.7.2025.08.05.03.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 03:22:35 -0700 (PDT)
Message-ID: <c1f7c4adaa0ac8d1994046436da8eb64bba5e06e.camel@redhat.com>
Subject: Re: [PATCH] drm/sched: Extend and update documentation
From: Philipp Stanner <pstanner@redhat.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Philipp
 Stanner <phasta@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, Matthew
 Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Date: Tue, 05 Aug 2025 12:22:33 +0200
In-Reply-To: <5fb872d0-9b0a-4398-9472-eea3fdf61940@amd.com>
References: <20250724140121.70873-2-phasta@kernel.org>
	 <f064a8c305bd2f2c0684251d3cd2470699c28d5e.camel@redhat.com>
	 <5fb872d0-9b0a-4398-9472-eea3fdf61940@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-08-05 at 11:05 +0200, Christian K=C3=B6nig wrote:
> On 24.07.25 17:07, Philipp Stanner wrote:
> > > +/**
> > > + * DOC: Scheduler Fence Object
> > > + *
> > > + * The scheduler fence object (&struct drm_sched_fence) encapsulates=
 the whole
> > > + * time from pushing the job into the scheduler until the hardware h=
as finished
> > > + * processing it. It is managed by the scheduler. The implementation=
 provides
> > > + * dma_fence interfaces for signaling both scheduling of a command s=
ubmission
> > > + * as well as finishing of processing.
> > > + *
> > > + * The lifetime of this object also follows normal dma_fence refcoun=
ting rules.
> > > + */
> >=20
> > The relict I'm most unsure about is this docu for the scheduler fence.
> > I know that some drivers are accessing the s_fence, but I strongly
> > suspect that this is a) unncessary and b) dangerous.
>=20
> Which s_fence member do you mean? The one in the job? That should be harm=
less as far as I can see.

I'm talking about struct drm_sched_fence.

>=20
> > But the original draft from Christian hinted at that. So, @Christian,
> > this would be an opportunity to discuss this matter.
> >=20
> > Otherwise I'd drop this docu section in v2. What users don't know, they
> > cannot misuse.
>=20
> I would rather like to keep that to avoid misusing the job as the object =
for tracking the submission lifetime.

Why would a driver ever want to access struct drm_sched_fence? The
driver knows when it signaled the hardware fence, and it knows when its
callbacks run_job() and free_job() were invoked.

I'm open to learn what amdgpu does there and why.

>=20
> > > +/**
> > > + * DOC: Error and Timeout handling
> > > + *
> > > + * Errors are signaled by using dma_fence_set_error() on the hardwar=
e fence
> > > + * object before signaling it with dma_fence_signal(). Errors are th=
en bubbled
> > > + * up from the hardware fence to the scheduler fence.
> > > + *
> > > + * The entity allows querying errors on the last run submission usin=
g the
> > > + * drm_sched_entity_error() function which can be used to cancel que=
ued
> > > + * submissions in &struct drm_sched_backend_ops.run_job as well as p=
reventing
> > > + * pushing further ones into the entity in the driver's submission f=
unction.
> > > + *
> > > + * When the hardware fence doesn't signal within a configurable amou=
nt of time
> > > + * &struct drm_sched_backend_ops.timedout_job gets invoked. The driv=
er should
> > > + * then follow the procedure described in that callback's documentat=
ion.
> > > + *
> > > + * (TODO: The timeout handler should probably switch to using the ha=
rdware
> > > + * fence as parameter instead of the job. Otherwise the handling wil=
l always
> > > + * race between timing out and signaling the fence).
> >=20
> > This TODO can probably removed, too. The recently merged
> > DRM_GPU_SCHED_STAT_NO_HANG has solved this issue.
>=20
> No, it only scratched on the surface of problems here.
>=20
> I'm seriously considering sending a RFC patch to cleanup the job lifetime=
 and implementing this change.
>=20
> Not necessarily giving the HW fence as parameter to the timeout callback,=
 but more generally not letting the scheduler depend on driver behavior.

That's rather vague. Regarding this TODO, "racing between timing out
and signaling the fence" can now be corrected by the driver. Are there
more issues? If so, we want to add a new FIXME for them.

That said, such an RFC would obviously be great. We can discuss the
paragraph above there, if you want.


Regards
P.

>=20
> Regards,
> Christian.
>=20
> >=20
> >=20
> > P.
> >=20
> > > + *
> > > + * The scheduler also used to provided functionality for re-submitti=
ng jobs
> > > + * and, thereby, replaced the hardware fence during reset handling. =
This
> > > + * functionality is now deprecated. This has proven to be fundamenta=
lly racy
> > > + * and not compatible with dma_fence rules and shouldn't be used in =
new code.
> > > + *
> > > + * Additionally, there is the function drm_sched_increase_karma() wh=
ich tries
> > > + * to find the entity which submitted a job and increases its 'karma=
' atomic
> > > + * variable to prevent resubmitting jobs from this entity. This has =
quite some
> > > + * overhead and resubmitting jobs is now marked as deprecated. Thus,=
 using this
> > > + * function is discouraged.
> > > + *
> > > + * Drivers can still recreate the GPU state in case it should be los=
t during
> > > + * timeout handling *if* they can guarantee that forward progress wi=
ll be made
> > > + * and this doesn't cause another timeout. But this is strongly hard=
ware
> > > + * specific and out of the scope of the general GPU scheduler.
> > > + */
> > > =C2=A0#include <linux/export.h>
> > > =C2=A0#include <linux/wait.h>
> > > =C2=A0#include <linux/sched.h>
> > > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.=
h
> > > index 323a505e6e6a..0f0687b7ae9c 100644
> > > --- a/include/drm/gpu_scheduler.h
> > > +++ b/include/drm/gpu_scheduler.h
> > > @@ -458,8 +458,8 @@ struct drm_sched_backend_ops {
> > > =C2=A0	struct dma_fence *(*run_job)(struct drm_sched_job *sched_job);
> > > =C2=A0
> > > =C2=A0	/**
> > > -	 * @timedout_job: Called when a job has taken too long to execute,
> > > -	 * to trigger GPU recovery.
> > > +	 * @timedout_job: Called when a hardware fence didn't signal within=
 a
> > > +	 * configurable amount of time. Triggers GPU recovery.
> > > =C2=A0	 *
> > > =C2=A0	 * @sched_job: The job that has timed out
> > > =C2=A0	 *
> > > @@ -506,7 +506,6 @@ struct drm_sched_backend_ops {
> > > =C2=A0	 * that timeout handlers are executed sequentially.
> > > =C2=A0	 *
> > > =C2=A0	 * Return: The scheduler's status, defined by &enum drm_gpu_sc=
hed_stat
> > > -	 *
> > > =C2=A0	 */
> > > =C2=A0	enum drm_gpu_sched_stat (*timedout_job)(struct drm_sched_job *=
sched_job);
> > > =C2=A0
> >=20
>=20


