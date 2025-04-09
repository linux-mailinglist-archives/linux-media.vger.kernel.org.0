Return-Path: <linux-media+bounces-29716-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C78A81F08
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 10:01:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA74D19E727D
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 07:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 441C625A635;
	Wed,  9 Apr 2025 07:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=damsy.net header.i=@damsy.net header.b="slk6VF1v";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="09y8o62Y"
X-Original-To: linux-media@vger.kernel.org
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD3825B686;
	Wed,  9 Apr 2025 07:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.152.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744185500; cv=none; b=AGxBkN+dKRsFG2eV9mVx/t6z26DdoMjsqyuaEI6jfiSrGJZbadFywehOw8GBy4and9L2JjucmQ3Vt3/1Oo/FFFRIgKGyJEf0jNQZr8QdB2+sN0uEj43cyqvgGIpuf31NocOMG8U6DN4ZtIH0nDdYlpc6f75PBiuSxe0Y34twICI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744185500; c=relaxed/simple;
	bh=fg3tvVR/uXNXSDvxZ4l+Z3LudKE1cRCcApc0gwkbxMY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kDrWcxTDvD8mvnhHdOG44Mi0jJlahxjloAr2gaXmwchWHbC9NylIVzn0GHbsvJHGk3uEpoo5CiAPz2OmTUj624kjF6oG8KELR2GuwYjbjCFx4N/qaDgpjLljvzEmEIlSzZwnxefvXelB/Z7nA+/X4IkUCAHD/WT+1YCJKC5nN5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=damsy.net; spf=pass smtp.mailfrom=damsy.net; dkim=pass (2048-bit key) header.d=damsy.net header.i=@damsy.net header.b=slk6VF1v; dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b=09y8o62Y; arc=none smtp.client-ip=51.159.152.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=damsy.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=damsy.net
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1744185144; bh=m0UnMasJN//idMnYkH7ZVnj
	GqZ6c589EeVyBi7IEG6E=; b=slk6VF1v2JektGaPflcGO2CTCGnjVtConEYnMwNQuHIKv5GnZN
	iKySxNzKqaqmMSGTHV2sD7e6p9JMM/bWwVV60dKGgbydrphz39R0nULHz7MEORNs5C/68+fh8hE
	mlZ9b5Z88OSQ8xg9+VjAXpw/HRZzgwVLlWHsB8EiA5jMt5rjUUhF+Q/YRDNDgE1oqjF2JbvgPva
	cS89tlOy4Apc6IPe8ZmM/vtazs3BSCEAEgUDzLIxcvGjev4kX2xaLfNCszaUERyyBxHykYumB+1
	dBO7Dwa0yztI3rfuRieQ6sKhWOyoHaC9sv/tmFXCcrxeOxKvOvdgQCq577mnEJ+VpWw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1744185144; bh=m0UnMasJN//idMnYkH7ZVnj
	GqZ6c589EeVyBi7IEG6E=; b=09y8o62Y7U+ZSS7gXzumhfKXC15qDUDbHWKwRc+54MEVLT3ms7
	XJzrgBE+FB+rwkzQeINVbFqIXq5dQESfANCg==;
Message-ID: <f3416edf-46f8-4296-86bd-600ab629fe60@damsy.net>
Date: Wed, 9 Apr 2025 09:52:23 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/10] Improve gpu_scheduler trace events + UAPI
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Philipp Stanner <phasta@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, lima@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-arm-msm@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, nouveau@lists.freedesktop.org
References: <20250320095818.40622-1-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <20250320095818.40622-1-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

I've rebased the series on top of drm-next, applied the minor tweaks suggested by Tvrtko on v8 and 
the R-b tags. The result can be found on gitlab.fdo:

https://gitlab.freedesktop.org/pepp/linux/-/commits/improve_gpu_scheduler_trace_v9

I believe it's ready to be merged, unless I've missed something?

Thanks,
Pierre-Eric

Le 20/03/2025 à 10:57, Pierre-Eric Pelloux-Prayer a écrit :
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
> Changes since v7:
> * uint64_t -> u64
> * reworked dependencies tracing (Tvrtko)
> * use common name prefix for all events (Tvrtko)
> * dropped drm_sched_job::id (Tvrtko)
> 
> Useful links:
> - userspace tool using the updated events:
> https://gitlab.freedesktop.org/tomstdenis/umr/-/merge_requests/37
> - v7:
> https://lists.freedesktop.org/archives/dri-devel/2025-January/488117.html
> 
> Pierre-Eric Pelloux-Prayer (10):
>    drm/debugfs: output client_id in in drm_clients_info
>    drm/sched: store the drm client_id in drm_sched_fence
>    drm/sched: add device name to the drm_sched_process_job event
>    drm/sched: cleanup gpu_scheduler trace events
>    drm/sched: trace dependencies for gpu jobs
>    drm/sched: add the drm_client_id to the drm_sched_run/exec_job events
>    drm/sched: cleanup event names
>    drm/doc: document some tracepoints as uAPI
>    drm: get rid of drm_sched_job::id
>    drm/amdgpu: update trace format to match gpu_scheduler_trace
> 
>   Documentation/gpu/drm-uapi.rst                |  19 ++++
>   drivers/accel/amdxdna/aie2_ctx.c              |   3 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c    |   2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |   3 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       |   8 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.h       |   3 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h     |  32 ++----
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
>   .../gpu/drm/scheduler/gpu_scheduler_trace.h   | 103 +++++++++++++-----
>   drivers/gpu/drm/scheduler/sched_entity.c      |  16 ++-
>   drivers/gpu/drm/scheduler/sched_fence.c       |   4 +-
>   drivers/gpu/drm/scheduler/sched_internal.h    |   2 +-
>   drivers/gpu/drm/scheduler/sched_main.c        |  11 +-
>   drivers/gpu/drm/v3d/v3d_submit.c              |   2 +-
>   drivers/gpu/drm/xe/xe_sched_job.c             |   3 +-
>   include/drm/gpu_scheduler.h                   |  13 ++-
>   30 files changed, 186 insertions(+), 96 deletions(-)
> 


