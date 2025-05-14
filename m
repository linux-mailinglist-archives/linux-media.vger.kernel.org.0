Return-Path: <linux-media+bounces-32482-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5D5AB6BD8
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 14:53:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8856D18993AD
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 12:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17C582797A4;
	Wed, 14 May 2025 12:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="HNR9i4K6"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6767146A66;
	Wed, 14 May 2025 12:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747227217; cv=none; b=MFyFYw09tdiH7pBZSqQWvDBziu4E8RFYs2OFxVX12X7DtkjC+xEdZCzmpWgzhnWQ++SdTaM+oJXMUq1O/k3k63CvA851nGIet2JS2gYrKz9MahfRfiMh2NjNr4WqfzTAgpfmrUnyhDVDnAb+rakjJsa98dbsn69REoOzfL8q4Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747227217; c=relaxed/simple;
	bh=l2PN6QcepbAXB+iWYlA33obbARXQBzt9YebmBHehVqk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N5Hkne7w7PYuid9kS7qoca9b80kwEVMS1+FH4tI2cRPLzxR1oU52gl0twFOZTFrStNptbMJETCYmtzGsvfpD9OVxfJgznbm40cry/8uKfaxEGkA5UcniDO/v+4YH6Kz42hf21mN6lhTlKnK/zODybouQHaxMd283JIT0oTIEw/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=HNR9i4K6; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4ZyCv90K1mz9tHh;
	Wed, 14 May 2025 14:53:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1747227205; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lm/MiXf4ihAaUzAEA46o1hoZuKLtMGGmVsS5HYc+ftY=;
	b=HNR9i4K6g4d8AIbT72lAahbjubd4mU4WEI0EoZJba/Wkj8pOgiE7EGE+WmfOzG7MRYinOP
	JPHyc/Rzc9OUyQJCXigpzzvt2v2v2l9q9TFsmTzZkRrS3YiwITrUz+yTj51djjqcWZ+MPH
	Az59TrdqUI14isAdxFeLnnpuLLtAtzSAEuygcLSGII7P5z4Tu+CG0Ti1DU9SbwKIIbSoyj
	hK7PiVOsUnuwz79nWch6JnMA5tTcufEK1YqqrgpLlrP9tjqnQbWkA8dOve1eiGAumsCCOH
	TrartWS8kn4VlkP2cl2zE3hoYdP3Uba25A411/1lx8E+wIiX5S5LDMIM6r5n6g==
Message-ID: <27825c551adeda28f4b329f44c316ad2ab67fa5d.camel@mailbox.org>
Subject: Re: [PATCH v9 09/10] drm/doc: document some tracepoints as uAPI
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, Jonathan
 Corbet <corbet@lwn.net>, Matthew Brost <matthew.brost@intel.com>,  Danilo
 Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, Sumit Semwal
 <sumit.semwal@linaro.org>
Cc: Lucas Stach <l.stach@pengutronix.de>, =?ISO-8859-1?Q?Ma=EDra?= Canal
	 <mcanal@igalia.com>, Christian =?ISO-8859-1?Q?K=F6nig?=
	 <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Date: Wed, 14 May 2025 14:53:17 +0200
In-Reply-To: <20250424083834.15518-10-pierre-eric.pelloux-prayer@amd.com>
References: <20250424083834.15518-1-pierre-eric.pelloux-prayer@amd.com>
	 <20250424083834.15518-10-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: acfe79c786622b263c1
X-MBO-RS-META: t1hfj4zih9aibaphwnzyumj39wajigan

On Thu, 2025-04-24 at 10:38 +0200, Pierre-Eric Pelloux-Prayer wrote:
> This commit adds a document section in drm-uapi.rst about
> tracepoints,
> and mark the events gpu_scheduler_trace.h as stable uAPI.
>=20
> The goal is to explicitly state that tools can rely on the fields,
> formats and semantics of these events.
>=20
> Acked-by: Lucas Stach <l.stach@pengutronix.de>
> Acked-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Signed-off-by: Pierre-Eric Pelloux-Prayer
> <pierre-eric.pelloux-prayer@amd.com>
> ---
> =C2=A0Documentation/gpu/drm-uapi.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 19
> +++++++++++++++++++
> =C2=A0.../gpu/drm/scheduler/gpu_scheduler_trace.h=C2=A0=C2=A0 | 19
> +++++++++++++++++++
> =C2=A02 files changed, 38 insertions(+)
>=20
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-
> uapi.rst
> index 69f72e71a96e..4863a4deb0ee 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -693,3 +693,22 @@ dma-buf interoperability
> =C2=A0
> =C2=A0Please see Documentation/userspace-api/dma-buf-alloc-exchange.rst
> for
> =C2=A0information on how dma-buf is integrated and exposed within DRM.
> +
> +
> +Trace events
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +See Documentation/trace/tracepoints.rst for information about using
> +Linux Kernel Tracepoints.
> +In the DRM subsystem, some events are considered stable uAPI to
> avoid
> +breaking tools (e.g.: GPUVis, umr) relying on them. Stable means
> that fields
> +cannot be removed, nor their formatting updated. Adding new fields
> is
> +possible, under the normal uAPI requirements.
> +
> +Stable uAPI events
> +------------------
> +
> +From ``drivers/gpu/drm/scheduler/gpu_scheduler_trace.h``
> +
> +.. kernel-doc::=C2=A0 drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> +=C2=A0=C2=A0 :doc: uAPI trace events
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> index 781b20349389..7e840d08ef39 100644
> --- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> +++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> @@ -32,6 +32,25 @@
> =C2=A0#define TRACE_SYSTEM gpu_scheduler
> =C2=A0#define TRACE_INCLUDE_FILE gpu_scheduler_trace
> =C2=A0
> +/**
> + * DOC: uAPI trace events
> + *
> + * ``drm_sched_job_queue``, ``drm_sched_job_run``,
> ``drm_sched_job_add_dep``,
> + * ``drm_sched_job_done`` and ``drm_sched_job_unschedulable`` are
> considered
> + * stable uAPI.
> + *
> + * Common trace events attributes:
> + *
> + * * ``dev``=C2=A0=C2=A0 - the dev_name() of the device running the job.
> + *
> + * * ``ring``=C2=A0 - the hardware ring running the job. Together with
> ``dev`` it
> + *=C2=A0=C2=A0 uniquely identifies where the job is going to be executed=
.
> + *
> + * * ``fence`` - the &dma_fence.context and the &dma_fence.seqno of
> + *=C2=A0=C2=A0 &drm_sched_fence.finished
> + *
> + */

For my understanding, why do you use the double apostrophes here?

Also, the linking for the docu afair here two requires you to write

&struct dma_fence.seqno

If I am not mistaken

https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html#highlights=
-and-cross-references


P.

> +
> =C2=A0DECLARE_EVENT_CLASS(drm_sched_job,
> =C2=A0	=C2=A0=C2=A0=C2=A0 TP_PROTO(struct drm_sched_job *sched_job, struc=
t
> drm_sched_entity *entity),
> =C2=A0	=C2=A0=C2=A0=C2=A0 TP_ARGS(sched_job, entity),


