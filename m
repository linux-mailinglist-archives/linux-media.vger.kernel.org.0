Return-Path: <linux-media+bounces-32479-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0D9AB6B7F
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 14:35:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA0C81B67692
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 12:35:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E37D27702C;
	Wed, 14 May 2025 12:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=damsy.net header.i=@damsy.net header.b="oMTg1HUK";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="8rhNJnqq"
X-Original-To: linux-media@vger.kernel.org
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962B322A4EA;
	Wed, 14 May 2025 12:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.152.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747226128; cv=none; b=VgdfJ2sueVr8xmILctMSFICQpUJVONIsuhvJP3qJx/8/WMylj1a2sKVfRrX2aioXQbgdHXBSZMAGg8d/7NLsFF5bK8VhtgYEKpxpwl/IlBsc1DF+XTyKcA0bp+hQB7PqeWVW/ZLvN5zsEyG1pK772Elo6OTh2x0cr51z8BOqfZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747226128; c=relaxed/simple;
	bh=2dw3JOnHoUcdzGRN6kdhMybNLL/lLmz++l0w6F81qtA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V4dGyynKORV0CW2f9XXEgZRmtMCDCMKkcg9MzoUWe/8/su/EYLnVdQh9pxeD0QaaJSRK+04G6CJHeUUj3yJAQVcrCwbECJZzXvkyj1INYqZ5l74V4n3EyKrEERZcXH0QmKxBNBjlYGLyzoAB91fS2JMpKXT0UhghVds78wIoEwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=damsy.net; spf=pass smtp.mailfrom=damsy.net; dkim=pass (2048-bit key) header.d=damsy.net header.i=@damsy.net header.b=oMTg1HUK; dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b=8rhNJnqq; arc=none smtp.client-ip=51.159.152.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=damsy.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=damsy.net
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1747225555; bh=l7CVYbiYMp3bpjoLvOLIf89
	4834vFxO7Y79o9x78pyY=; b=oMTg1HUKKUobVlbG1lxjwnSVhtfqSEmona5UDnIjZyLZ4MADxl
	Iu+V4jDnCCa+oX6zJ5zpHnio52K1/GJjoriWc1Bl19m/F9Op7LPsok/s5OcAIziZgoGoGDpL/Gq
	3DFUKcpBQniDaFPUFgVDsB0pE/7ZCIlPpHGPKafTS6OCDVZ1KeLhvn1hWVbyKe8ryC8P996eUyS
	yoMVJNdLRG9ONuljR661KK1wpqwL5g4LF6x2NFg3Nf03bcRAc2Li+IyvqhLsZ0rbEuM0lWfTQ18
	jSMTrtwtA/eip8TZHZ1M8LwKajaKqlXm5yI+W8s8V9AFFA3EEtABl6/eWFxNl59TMrw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1747225555; bh=l7CVYbiYMp3bpjoLvOLIf89
	4834vFxO7Y79o9x78pyY=; b=8rhNJnqqS9bntJ5mODbeO/T1NcD6UqMJSaRqqa55oYbmm812Ve
	EVdgv1k90iVoDZxU6Dwj9GmsxfIwPu7djNBw==;
Message-ID: <34321866-6991-4aa0-98e9-6d6b7c37e8e4@damsy.net>
Date: Wed, 14 May 2025 14:25:54 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/10] Improve gpu_scheduler trace events + UAPI
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Philipp Stanner <phasta@kernel.org>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Felix Kuehling
 <Felix.Kuehling@amd.com>, Frank Binns <frank.binns@imgtec.com>,
 Jonathan Corbet <corbet@lwn.net>, Liviu Dudau <liviu.dudau@arm.com>,
 Lizhi Hou <lizhi.hou@amd.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Lucas Stach <l.stach@pengutronix.de>, Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matt Coster <matt.coster@imgtec.com>, Matthew Brost
 <matthew.brost@intel.com>, Maxime Ripard <mripard@kernel.org>,
 Melissa Wen <mwen@igalia.com>, Min Ma <min.ma@amd.com>,
 Oded Gabbay <ogabbay@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 Qiang Yu <yuq825@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Simona Vetter <simona@ffwll.ch>, Steven Price <steven.price@arm.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 lima@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 nouveau@lists.freedesktop.org
References: <20250424083834.15518-1-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <20250424083834.15518-1-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Philipp,

Did you get a chance to take a look at the latest revision of this series?

Thanks,
Pierre-Eric

Le 24/04/2025 à 10:38, Pierre-Eric Pelloux-Prayer a écrit :
> Hi,
> 
> The initial goal of this series was to improve the drm and amdgpu
> trace events to be able to expose more of the inner workings of
> the scheduler and drivers to developers via tools.
> 
> Then, the series evolved to become focused only on gpu_scheduler.
> The changes around vblank events will be part of a different
> series, as well as the amdgpu ones.
> 
> Moreover Sima suggested to make some trace events stable uAPI,
> so tools can rely on them long term.
> 
> The first patches extend and cleanup the gpu scheduler events,
> then add a documentation entry in drm-uapi.rst.
> 
> The last 2 patches are new in v8. One is based on a suggestion
> from Tvrtko and gets rid of drm_sched_job::id. The other is a
> cleanup of amdgpu trace events to use the fence=%llu:%llu format.
> 
> The drm_sched_job patches don't affect gpuvis which has code to parse
> the gpu_scheduler events but these events are not enabled.
> 
> Changes since v8:
> * swapped patches 8 & 9
> * rebased on drm-next
> 
> Changes since v7:
> * uint64_t -> u64
> * reworked dependencies tracing (Tvrtko)
> * use common name prefix for all events (Tvrtko)
> * dropped drm_sched_job::id (Tvrtko)
> 
> Useful links:
> - userspace tool using the updated events:
> https://gitlab.freedesktop.org/tomstdenis/umr/-/merge_requests/37
> - v8:
> https://lists.freedesktop.org/archives/dri-devel/2025-March/496781.html
> 
> Pierre-Eric Pelloux-Prayer (10):
>    drm/debugfs: output client_id in in drm_clients_info
>    drm/sched: store the drm client_id in drm_sched_fence
>    drm/sched: add device name to the drm_sched_process_job event
>    drm/sched: cleanup gpu_scheduler trace events
>    drm/sched: trace dependencies for gpu jobs
>    drm/sched: add the drm_client_id to the drm_sched_run/exec_job events
>    drm/sched: cleanup event names
>    drm: get rid of drm_sched_job::id
>    drm/doc: document some tracepoints as uAPI
>    drm/amdgpu: update trace format to match gpu_scheduler_trace
> 
>   Documentation/gpu/drm-uapi.rst                |  19 ++++
>   drivers/accel/amdxdna/aie2_ctx.c              |   3 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c    |   2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |   3 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       |   8 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.h       |   3 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h     |  32 +++---
>   drivers/gpu/drm/drm_debugfs.c                 |  10 +-
>   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c  |   2 +-
>   drivers/gpu/drm/imagination/pvr_job.c         |   2 +-
>   drivers/gpu/drm/imagination/pvr_queue.c       |   5 +-
>   drivers/gpu/drm/imagination/pvr_queue.h       |   2 +-
>   drivers/gpu/drm/lima/lima_gem.c               |   2 +-
>   drivers/gpu/drm/lima/lima_sched.c             |   6 +-
>   drivers/gpu/drm/lima/lima_sched.h             |   3 +-
>   drivers/gpu/drm/msm/msm_gem_submit.c          |   8 +-
>   drivers/gpu/drm/nouveau/nouveau_sched.c       |   3 +-
>   drivers/gpu/drm/panfrost/panfrost_drv.c       |   2 +-
>   drivers/gpu/drm/panthor/panthor_drv.c         |   3 +-
>   drivers/gpu/drm/panthor/panthor_mmu.c         |   2 +-
>   drivers/gpu/drm/panthor/panthor_sched.c       |   5 +-
>   drivers/gpu/drm/panthor/panthor_sched.h       |   3 +-
>   .../gpu/drm/scheduler/gpu_scheduler_trace.h   | 100 +++++++++++++-----
>   drivers/gpu/drm/scheduler/sched_entity.c      |  16 ++-
>   drivers/gpu/drm/scheduler/sched_fence.c       |   4 +-
>   drivers/gpu/drm/scheduler/sched_internal.h    |   2 +-
>   drivers/gpu/drm/scheduler/sched_main.c        |  11 +-
>   .../gpu/drm/scheduler/tests/mock_scheduler.c  |   2 +-
>   drivers/gpu/drm/v3d/v3d_submit.c              |   2 +-
>   drivers/gpu/drm/xe/xe_sched_job.c             |   3 +-
>   include/drm/gpu_scheduler.h                   |  13 ++-
>   31 files changed, 184 insertions(+), 97 deletions(-)
> 


