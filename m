Return-Path: <linux-media+bounces-33527-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 606EEAC6B95
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 16:19:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EBAB81BC3DE2
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 14:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 829B5288C00;
	Wed, 28 May 2025 14:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="TJnJr1yD"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C4413AF2;
	Wed, 28 May 2025 14:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748441937; cv=none; b=uiJ+Ir9u1lvau6hkwg+8uhE19adYBCq13UtttWlTqmPdxO8sFP79c0vxi8LNv+6xRSAFhhiEQERLCP8E+KghptFHkn5I3IgC5ftDiPhCLVweAlAJZG1AXbVyO59poD9pZJJ6g/8W7mCQi+dH8hBlrWMICvgRW1nexL8MH2mbInA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748441937; c=relaxed/simple;
	bh=zJx6vFfwz0MYTEHthiU61dRG76ot+J1AonqUVhsuUz0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=evvXz9IVJOAQwf6nNXsbCSpa+V4ZasYurtbf3PymtNeOLR3sROJtf3rAHjytJXLyYiVzMosHd+JQsxE9ovrzKWswigpM55NoxmcpueNIeBe04UCPGfw6e+TCbxyanGCGUHvLg8kdbr4MEAHK9zsycdRpJOXqPfSwWwyvm7YtPZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=TJnJr1yD; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4b6s792zx3z9swD;
	Wed, 28 May 2025 16:18:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1748441925; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zJx6vFfwz0MYTEHthiU61dRG76ot+J1AonqUVhsuUz0=;
	b=TJnJr1yDLKr7T7cAmicStZcRlA8JXH9j13Oh8esWSeeepjouJBcnEQdg5nD8+CN6fFcVRD
	nyrSXhLPlMvsOWb5dmXyV57DQWLs4lCg8h21dj0UV1gLhSQ+PqoHzrs0MktM3kcTQOv3Tz
	VBqJRrdR/oGhIs7WY3mzAjxbRQUhpSTKVqH+6d5h7HpRjGCQIeCsy3PugkdN2ZlS2D8x5G
	Ft+kRUI2xzuE9c13mTzMYRXoC4wd517ZaJxnNNCcHX1K9j00VDmjGPj748+hdBLFjt/1kN
	JiF1Ken79t+9APOBjhHOqbJPNBQOCon9xR24tXyu9T4k9QG4wIkinlKw8bWbog==
Message-ID: <f46f73db6594c7cd40149e35da9f188baa5961a2.camel@mailbox.org>
Subject: Re: [PATCH v11 00/10] Improve gpu_scheduler trace events + UAPI
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Thomas
 =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, Abhinav
 Kumar <quic_abhinavk@quicinc.com>,  Alex Deucher
 <alexander.deucher@amd.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Danilo Krummrich <dakr@kernel.org>, David
 Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>, Felix
 Kuehling <Felix.Kuehling@amd.com>, Frank Binns <frank.binns@imgtec.com>,
 Jonathan Corbet <corbet@lwn.net>, Liviu Dudau <liviu.dudau@arm.com>, Lizhi
 Hou <lizhi.hou@amd.com>, Lucas De Marchi <lucas.demarchi@intel.com>, Lucas
 Stach <l.stach@pengutronix.de>, Lyude Paul <lyude@redhat.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Matt Coster
 <matt.coster@imgtec.com>, Matthew Brost <matthew.brost@intel.com>, Maxime
 Ripard <mripard@kernel.org>, Melissa Wen <mwen@igalia.com>, Min Ma
 <min.ma@amd.com>,  Oded Gabbay <ogabbay@kernel.org>, Philipp Stanner
 <phasta@kernel.org>, Qiang Yu <yuq825@gmail.com>, Rob Clark
 <robdclark@gmail.com>, Rob Herring <robh@kernel.org>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>, Steven Price
 <steven.price@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>, Thomas
 Zimmermann <tzimmermann@suse.de>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,  etnaviv@lists.freedesktop.org,
 freedreno@lists.freedesktop.org,  intel-xe@lists.freedesktop.org,
 lima@lists.freedesktop.org,  linaro-mm-sig@lists.linaro.org,
 linux-arm-msm@vger.kernel.org,  linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-media@vger.kernel.org,
 nouveau@lists.freedesktop.org
Date: Wed, 28 May 2025 16:18:30 +0200
In-Reply-To: <20250526125505.2360-1-pierre-eric.pelloux-prayer@amd.com>
References: <20250526125505.2360-1-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 71bbfe2918ed815d7c0
X-MBO-RS-META: 1d87cwrtfwt5qgx3mzet88gb4nq4xi15

On Mon, 2025-05-26 at 14:54 +0200, Pierre-Eric Pelloux-Prayer wrote:
> Hi,
>=20
> The initial goal of this series was to improve the drm and amdgpu
> trace events to be able to expose more of the inner workings of
> the scheduler and drivers to developers via tools.
>=20
> Then, the series evolved to become focused only on gpu_scheduler.
> The changes around vblank events will be part of a different
> series, as well as the amdgpu ones.
>=20
> Moreover Sima suggested to make some trace events stable uAPI,
> so tools can rely on them long term.
>=20
> The first patches extend and cleanup the gpu scheduler events,
> then add a documentation entry in drm-uapi.rst.
>=20
> The last 2 patches are new in v8. One is based on a suggestion
> from Tvrtko and gets rid of drm_sched_job::id. The other is a
> cleanup of amdgpu trace events to use the fence=3D%llu:%llu format.
>=20
> The drm_sched_job patches don't affect gpuvis which has code to parse
> the gpu_scheduler events but these events are not enabled.
>=20
> Changes since v10:
> * fixed 2 errors reported by kernel test robot
> * rebased on drm-misc-next
>=20
> Changes since v9:
> * fixed documentation link syntax
> * fixed typos in commit messages
> * spelled out that these events cannot be used before
> =C2=A0 drm_sched_job_arm has been called
>=20
> Changes since v8:
> * swapped patches 8 & 9
> * rebased on drm-next
>=20
> Changes since v7:
> * uint64_t -> u64
> * reworked dependencies tracing (Tvrtko)
> * use common name prefix for all events (Tvrtko)
> * dropped drm_sched_job::id (Tvrtko)
>=20
> Useful links:
> - userspace tool using the updated events:
> https://gitlab.freedesktop.org/tomstdenis/umr/-/merge_requests/37
> - v8:
> https://lists.freedesktop.org/archives/dri-devel/2025-March/496781.html
>=20
> Pierre-Eric Pelloux-Prayer (10):
> =C2=A0 drm/debugfs: Output client_id in in drm_clients_info
> =C2=A0 drm/sched: Store the drm client_id in drm_sched_fence
> =C2=A0 drm/sched: Add device name to the drm_sched_process_job event
> =C2=A0 drm/sched: Cleanup gpu_scheduler trace events
> =C2=A0 drm/sched: Trace dependencies for GPU jobs
> =C2=A0 drm/sched: Add the drm_client_id to the drm_sched_run/exec_job
> events
> =C2=A0 drm/sched: Cleanup event names
> =C2=A0 drm: Get rid of drm_sched_job.id
> =C2=A0 drm/doc: Document some tracepoints as uAPI
> =C2=A0 drm/amdgpu: update trace format to match gpu_scheduler_trace


Applied to drm-misc-next


Thanks
P.

>=20
> =C2=A0Documentation/gpu/drm-uapi.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 19 ++++
> =C2=A0drivers/accel/amdxdna/aie2_ctx.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +-
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +-
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_job.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 8 +-
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_job.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 3 +-
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 32 ++----
> =C2=A0drivers/gpu/drm/drm_debugfs.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 10 +-
> =C2=A0drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c=C2=A0 |=C2=A0=C2=A0 2 =
+-
> =C2=A0drivers/gpu/drm/imagination/pvr_job.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/imagination/pvr_queue.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 5 +-
> =C2=A0drivers/gpu/drm/imagination/pvr_queue.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/lima/lima_gem.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/lima/lima_sched.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +-
> =C2=A0drivers/gpu/drm/lima/lima_sched.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +-
> =C2=A0drivers/gpu/drm/lima/lima_trace.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +-
> =C2=A0drivers/gpu/drm/msm/msm_gem_submit.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 8 +-
> =C2=A0drivers/gpu/drm/nouveau/nouveau_sched.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 3 +-
> =C2=A0drivers/gpu/drm/panfrost/panfrost_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/panthor/panthor_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +-
> =C2=A0drivers/gpu/drm/panthor/panthor_mmu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/panthor/panthor_sched.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 5 +-
> =C2=A0drivers/gpu/drm/panthor/panthor_sched.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 3 +-
> =C2=A0.../gpu/drm/scheduler/gpu_scheduler_trace.h=C2=A0=C2=A0 | 103 +++++=
++++++++---
> --
> =C2=A0drivers/gpu/drm/scheduler/sched_entity.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 16 ++-
> =C2=A0drivers/gpu/drm/scheduler/sched_fence.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 4 +-
> =C2=A0drivers/gpu/drm/scheduler/sched_internal.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 12 +-
> =C2=A0.../gpu/drm/scheduler/tests/mock_scheduler.c=C2=A0 |=C2=A0=C2=A0 3 =
+-
> =C2=A0drivers/gpu/drm/v3d/v3d_submit.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/xe/xe_sched_job.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +-
> =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 13 ++-
> =C2=A032 files changed, 191 insertions(+), 101 deletions(-)
>=20


