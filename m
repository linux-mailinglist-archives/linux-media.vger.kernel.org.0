Return-Path: <linux-media+bounces-29719-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49574A81F5E
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 10:09:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 348618811E3
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 08:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 062D425D206;
	Wed,  9 Apr 2025 08:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="H9kbCebU"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DAB25B673;
	Wed,  9 Apr 2025 08:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744185832; cv=none; b=ndWMEQIYmqDj3hGqZJrxp7o/HOC/2CQ5xnJkF7Mj4WnUAWBqoNdTq6QetATSiM18HIvAvnbeeQT6mHS49/aBRsdlLQLqCaxGvIgsIaHY9g4H95tQRWU6wcgp9VLJMp7QeRE1c9wqLVaaiX76JwA4PMgzKdxryLT9qUMlNZiyVoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744185832; c=relaxed/simple;
	bh=7fqznLAyvHu/jJ9za6hfLAeZqCvQ3xojCZMtgLC3XYw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=V3VYGwF19eduEdHH0T1XTdf6vjdkqiuB4AteDqRjiUL+susHcJAaGWohJiHkl91/B/fHCwcnSMDyq18WYx5ASbf66sAPMmB4LnyMnepAjbsGNS+qJuADw1/fF0LhI9enKQq7lF/HVsIUSN0YpdI0eoAQkgnm9f9951A+TAH+jC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=H9kbCebU; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4ZXb711qMBz9t4w;
	Wed,  9 Apr 2025 10:03:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1744185821; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7fqznLAyvHu/jJ9za6hfLAeZqCvQ3xojCZMtgLC3XYw=;
	b=H9kbCebUZR1c7HOrQgYjPIYBVEFAXQSWcq6/p1UyaFsQL5RVW8qDJPZJDp+qC3GjKNVxRt
	DRZL0n/rENniKePXYZaCqEJY0i7wRIVO8nj1NZnDeePrW2Dn3W1dB+9XWKWpB33dMcfYJ9
	J2f7juccWHrQ6rBYVzSeuDhek0t6v0Y1omaNC+VbHOyOLNiRNHXjOlg+v77wj55CLq6kZe
	I8GCkSKnPB7VGieK0t/tUrz6+VwPURjf1eHIX/aqKevwbGEZET2BfNY4v4zU1C5ZKlQMsV
	q1BjHRuzslbwi9G5yJVXKkWQP5uTYc6Ftpwgx9gaAtErlzy1rplwxy1+/krYeg==
Message-ID: <2486e9eba3806f8e7fc3df724e916929a627fac7.camel@mailbox.org>
Subject: Re: [PATCH v8 00/10] Improve gpu_scheduler trace events + UAPI
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>, Pierre-Eric
 Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, Philipp Stanner <phasta@kernel.org>, Danilo
 Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	etnaviv@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, lima@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-arm-msm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, nouveau@lists.freedesktop.org
Date: Wed, 09 Apr 2025 10:03:34 +0200
In-Reply-To: <f3416edf-46f8-4296-86bd-600ab629fe60@damsy.net>
References: <20250320095818.40622-1-pierre-eric.pelloux-prayer@amd.com>
	 <f3416edf-46f8-4296-86bd-600ab629fe60@damsy.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: ac77wnkq97cnh7ipc437xrje46qmhgfq
X-MBO-RS-ID: 890d0c8e5ddfbadb243

On Wed, 2025-04-09 at 09:52 +0200, Pierre-Eric Pelloux-Prayer wrote:
> Hi,
>=20
> I've rebased the series on top of drm-next, applied the minor tweaks
> suggested by Tvrtko on v8 and=20
> the R-b tags. The result can be found on gitlab.fdo:
>=20
> https://gitlab.freedesktop.org/pepp/linux/-/commits/improve_gpu_scheduler=
_trace_v9
>=20
> I believe it's ready to be merged, unless I've missed something?

Has slipped my radar for a while, sorry.

I browsed over the series=20

Can you pro forma send the v9 (with the scheduler maintainers also in
the cover letter's CC) with the changelog, please?

Then I'd ACK and someone (probably me?) can take it in.

Thanks
P.

>=20
> Thanks,
> Pierre-Eric
>=20
> Le 20/03/2025 =C3=A0 10:57, Pierre-Eric Pelloux-Prayer a =C3=A9crit=C2=A0=
:
> > Hi,
> >=20
> > The initial goal of this series was to improve the drm and amdgpu
> > trace events to be able to expose more of the inner workings of
> > the scheduler and drivers to developers via tools.
> >=20
> > Then, the series evolved to become focused only on gpu_scheduler.
> > The changes around vblank events will be part of a different
> > series, as well as the amdgpu ones.
> >=20
> > Moreover Sima suggested to make some trace events stable uAPI,
> > so tools can rely on them long term.
> >=20
> > The first patches extend and cleanup the gpu scheduler events,
> > then add a documentation entry in drm-uapi.rst.
> >=20
> > The last 2 patches are new in v8. One is based on a suggestion
> > from Tvrtko and gets rid of drm_sched_job::id. The other is a
> > cleanup of amdgpu trace events to use the fence=3D%llu:%llu format.
> >=20
> > The drm_sched_job patches don't affect gpuvis which has code to
> > parse
> > the gpu_scheduler events but these events are not enabled.
> >=20
> > Changes since v7:
> > * uint64_t -> u64
> > * reworked dependencies tracing (Tvrtko)
> > * use common name prefix for all events (Tvrtko)
> > * dropped drm_sched_job::id (Tvrtko)
> >=20
> > Useful links:
> > - userspace tool using the updated events:
> > https://gitlab.freedesktop.org/tomstdenis/umr/-/merge_requests/37
> > - v7:
> > https://lists.freedesktop.org/archives/dri-devel/2025-January/488117.ht=
ml
> >=20
> > Pierre-Eric Pelloux-Prayer (10):
> > =C2=A0=C2=A0 drm/debugfs: output client_id in in drm_clients_info
> > =C2=A0=C2=A0 drm/sched: store the drm client_id in drm_sched_fence
> > =C2=A0=C2=A0 drm/sched: add device name to the drm_sched_process_job ev=
ent
> > =C2=A0=C2=A0 drm/sched: cleanup gpu_scheduler trace events
> > =C2=A0=C2=A0 drm/sched: trace dependencies for gpu jobs
> > =C2=A0=C2=A0 drm/sched: add the drm_client_id to the drm_sched_run/exec=
_job
> > events
> > =C2=A0=C2=A0 drm/sched: cleanup event names
> > =C2=A0=C2=A0 drm/doc: document some tracepoints as uAPI
> > =C2=A0=C2=A0 drm: get rid of drm_sched_job::id
> > =C2=A0=C2=A0 drm/amdgpu: update trace format to match gpu_scheduler_tra=
ce
> >=20
> > =C2=A0 Documentation/gpu/drm-uapi.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 19 ++++
> > =C2=A0 drivers/accel/amdxdna/aie2_ctx.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +-
> > =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 2 +-
> > =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +-
> > =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 8 +-
> > =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +-
> > =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 32 ++----
> > =C2=A0 drivers/gpu/drm/drm_debugfs.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 10 =
+-
> > =C2=A0 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c=C2=A0 |=C2=A0=C2=A0=
 2 +-
> > =C2=A0 drivers/gpu/drm/imagination/pvr_job.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> > =C2=A0 drivers/gpu/drm/imagination/pvr_queue.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 5 +-
> > =C2=A0 drivers/gpu/drm/imagination/pvr_queue.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> > =C2=A0 drivers/gpu/drm/lima/lima_gem.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> > =C2=A0 drivers/gpu/drm/lima/lima_sched.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +-
> > =C2=A0 drivers/gpu/drm/lima/lima_sched.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +-
> > =C2=A0 drivers/gpu/drm/msm/msm_gem_submit.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 8 +-
> > =C2=A0 drivers/gpu/drm/nouveau/nouveau_sched.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +-
> > =C2=A0 drivers/gpu/drm/panfrost/panfrost_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> > =C2=A0 drivers/gpu/drm/panthor/panthor_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +-
> > =C2=A0 drivers/gpu/drm/panthor/panthor_mmu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> > =C2=A0 drivers/gpu/drm/panthor/panthor_sched.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 5 +-
> > =C2=A0 drivers/gpu/drm/panthor/panthor_sched.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +-
> > =C2=A0 .../gpu/drm/scheduler/gpu_scheduler_trace.h=C2=A0=C2=A0 | 103
> > +++++++++++++-----
> > =C2=A0 drivers/gpu/drm/scheduler/sched_entity.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 16 ++-
> > =C2=A0 drivers/gpu/drm/scheduler/sched_fence.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +-
> > =C2=A0 drivers/gpu/drm/scheduler/sched_internal.h=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 2 +-
> > =C2=A0 drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 11 +-
> > =C2=A0 drivers/gpu/drm/v3d/v3d_submit.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> > =C2=A0 drivers/gpu/drm/xe/xe_sched_job.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +-
> > =C2=A0 include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 13 ++-
> > =C2=A0 30 files changed, 186 insertions(+), 96 deletions(-)
> >=20


