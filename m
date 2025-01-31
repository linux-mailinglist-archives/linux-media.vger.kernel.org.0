Return-Path: <linux-media+bounces-25468-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F25BA23E30
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 14:12:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD1B418877FB
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 13:12:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 565111C54A5;
	Fri, 31 Jan 2025 13:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qv0Vx60V"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DF91C461F;
	Fri, 31 Jan 2025 13:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738329155; cv=none; b=EuD9dq5jPmy2EyPgvawfy00Im4RLjC8sK3R/HXGMb+Tsoeq6nS6wdnyn1kPY7O0cYd5XU2SJn9UjfHowXAFP17vxyKlYvwS4K2uU8+KTZ6zsrjmvNn4/SYF4Wm23mnH4l2ZfxHqOo5SLUS6rSJN5rE0nYGl6h7bfEimFu4RwngA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738329155; c=relaxed/simple;
	bh=BbyKo5qgSbKGRwmdExkn+VWyTR4nHKaDT3omlcynxiA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nOGZwhJLLIyr1IJzEdjPfsrsoD0Q4BGayxdO90vgzD51S6h1O1l2ZlWlxU0Ckhj4BFLNKAW1wstc0TwO3K4h5VLlhX6nk5yXSwoXZQSMy/WfMbT68AxLkvbGtgDJ9XrFIT3UtpdtUOPZQeaWIreGAiW300yjhckUfTOxZlnu6SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qv0Vx60V; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-438a39e659cso13956365e9.2;
        Fri, 31 Jan 2025 05:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738329152; x=1738933952; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8Qf5Ag+gkCkodLzQTGh44JB0E7mlh4X9B+GfpD3S+A8=;
        b=Qv0Vx60VBM+8Zsw4WGl7PyVC0YU6tX1x0vigQSLoVhDY0TAngmkyCNQL/9WRSSVZrT
         F1403CJERgUejvs4XuzXi6/fSS6Fy/zwVkFUe9wPTYtB3THJGDLq4TiXjGWjFS5tghAw
         MZJBNrP7jjrRdhT2xbYsxD7d/4J4OXqj2mK9lZTRQAHSFnBY6rq8sL7io8ZoVRHAVnjj
         aWTTn5EcgbHf7ZU3/oGmqt5W9fyk6IPrbq86Gnj6wbvdMlOHA3V9jP9pLuRFTba2h9h9
         YzXAaevDIwq1wGtf7O5wHpOBBJQSyX27wZqEifiCDaSXXBiu8lJCw4nvpJjzx6bycMh4
         arkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738329152; x=1738933952;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Qf5Ag+gkCkodLzQTGh44JB0E7mlh4X9B+GfpD3S+A8=;
        b=AnNyP5ewAoXZcbqjo/S0EiLIB/Y+3YhC8b4OlR+myAsRSnk8hzVKnlVVNWVExXCFTA
         KBUSmOQJ8SC9b2w/Tiaaqj1HPZ1IH7DmlIagr4Ko139ZMITJhinnqyYsexKP0tcoInA2
         y8N2GfcIhiMO4gVQnt1olYFKjgufr6jM4XmAgatpdM0dk7JU8Ftui0mMIZP4kRsQT+hb
         QVO6cks/fmwpPsg0peIX8Qg6BsMXqtUyyZQ0QM02RA+vgOscThJjgYILaVIPcQSw/2xF
         heirOK0fXij+/mcOxyXvCbUaeGfyFyp9NmUdURDPRIH+YGE/24MhymPKLJ0aN3gLAwC1
         CzAw==
X-Forwarded-Encrypted: i=1; AJvYcCUO0pyiEMyWQzYnPo0j0vc6OlOmS6cKXNCZSjGNxQuol4ga4KYaOYtG4PVQTVSbcMaL7O0GsRk8FcoyO2wy@vger.kernel.org, AJvYcCWQ4azVwjJVMlYImcxZokRqRXr0TxqK2ecP+xl6uDXNjfmpp1lHKKzoE5WYaYTJMZJVnDvn5BC7SzXH@vger.kernel.org, AJvYcCWeRSYX5AizuAj5ViqjUbh3flRWZtnD8dMJNbLMen/sTYdJh34CTh4fdsRwIniG9hLzkJNShRuNvErvTikh@vger.kernel.org, AJvYcCX/o/JmKx1TYbPOhEJvkf9TUrjfGPtbQr7NrYtKpNwdDtVTtnDv1Xn6AppT7FLkv3Pl4dS7t47g+yAAEg8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzXFEwucEpSQ1VXBPBphcmU1ZNqJc9adYPeLrOSMPuw6hCOvy1
	pwjT4bxWzy8lxG6tF0I6M9zS3Iy93YnvL4h42KoOlc5AyeNkS9kY1scvhxY7
X-Gm-Gg: ASbGnctUl3C6AZ309HPMGF5DvA79Pe+NRacZSmO+A2VJC0XjAjVQ0dorQaqQnft3BAG
	Oz55F87wI4GLwEYyul3XgF4wYvNeQzeGns3xpvIYPootW/Q2Oc+qSiuXqHL0BrlqE31j1OIZjCw
	jJqZFR/O/4aDVhXCL3a2PBeuI2DS2jLNbf96eUIufsG/uvS+xMgMV+tfe/it6J21tpc4k6kjVW3
	yvQoEU1XsquQjrS7A8tfxnF9epqw0k1kCcTGueYCBlbaG59R5mv6/wN9pjhKu/BtlFZR7nppZ/G
	gY+w+2HyS7ZGXoJLRFdc1OuW9lt8akkN/oyuN5BPtq+m
X-Google-Smtp-Source: AGHT+IGKBtM8zdX0f/k9fSlmikQgi6UfU2qNH1ycY66SNDkJyOrXViqSqC8f4KUEz2AE7pAcFmrXww==
X-Received: by 2002:a5d:59a6:0:b0:385:f1f2:13f1 with SMTP id ffacd0b85a97d-38c51951c51mr9664356f8f.22.1738329150361;
        Fri, 31 Jan 2025 05:12:30 -0800 (PST)
Received: from [10.254.108.83] (munvpn.amd.com. [165.204.72.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc263f0sm90055545e9.9.2025.01.31.05.12.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 05:12:29 -0800 (PST)
Message-ID: <0b20e88a-9009-4fa2-b5cb-ab78ce834587@gmail.com>
Date: Fri, 31 Jan 2025 14:12:28 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/7] Improve gpu_scheduler trace events + uAPI
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, lima@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-arm-msm@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, nouveau@lists.freedesktop.org
References: <20250131110328.706695-1-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20250131110328.706695-1-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

I can't see patch #1 in my inbox for some reason, but I already know 
what it does from your repository.

Feel free to add Reviewed-by: Christian König <christian.koenig@amd.com> 
to the entire series.

Regards,
Christian.

Am 31.01.25 um 12:02 schrieb Pierre-Eric Pelloux-Prayer:
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
> The first patches extend and cleanup the gpu scheduler events.
>
> The last one adds a documentation entry in drm-uapi.rst.
>
> Changes since v6:
> * Addressed comments from Philipp, Tvrtko, Steven
> * The commit storing drm_client_id in sched_fence adds an extra
> field which looks like a duplicate of the owner field. Currently
> amdgpu uses the owner field with some magic values, so we have to
> have 2 separate fields for now, but ultimately one could be removed.
> Similarly storing the drm_client_id in the sched_entity is not
> really possible as there's nothing preventing a driver to use a
> sched_entity with multiple drm_file instances.
>
>
> Useful links:
> - userspace tool using the updated events:
> https://gitlab.freedesktop.org/tomstdenis/umr/-/merge_requests/37
> - v6:
> https://lists.freedesktop.org/archives/dri-devel/2024-November/477644.html
>
> Pierre-Eric Pelloux-Prayer (7):
>    drm/debugfs: output client_id in in drm_clients_info
>    drm/sched: store the drm client_id in drm_sched_fence
>    drm/sched: add device name to the drm_sched_process_job event
>    drm/sched: cleanup gpu_scheduler trace events
>    drm/sched: trace dependencies for gpu jobs
>    drm/sched: add the drm_client_id to the drm_sched_run/exec_job events
>    drm/doc: document some tracepoints as uAPI
>
>   Documentation/gpu/drm-uapi.rst                |  19 +++
>   drivers/accel/amdxdna/aie2_ctx.c              |   3 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c    |   2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |   3 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       |   8 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.h       |   3 +-
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
>   .../gpu/drm/scheduler/gpu_scheduler_trace.h   | 123 ++++++++++++++----
>   drivers/gpu/drm/scheduler/sched_entity.c      |   8 +-
>   drivers/gpu/drm/scheduler/sched_fence.c       |   4 +-
>   drivers/gpu/drm/scheduler/sched_main.c        |   8 +-
>   drivers/gpu/drm/v3d/v3d_submit.c              |   2 +-
>   drivers/gpu/drm/xe/xe_sched_job.c             |   3 +-
>   include/drm/gpu_scheduler.h                   |  12 +-
>   28 files changed, 192 insertions(+), 64 deletions(-)
>


