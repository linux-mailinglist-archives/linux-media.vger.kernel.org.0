Return-Path: <linux-media+bounces-5299-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 04246858269
	for <lists+linux-media@lfdr.de>; Fri, 16 Feb 2024 17:25:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98B01B22405
	for <lists+linux-media@lfdr.de>; Fri, 16 Feb 2024 16:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05DFE12FF8B;
	Fri, 16 Feb 2024 16:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="JAfGjzyZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7A912F39F
	for <linux-media@vger.kernel.org>; Fri, 16 Feb 2024 16:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708100732; cv=none; b=Rrbxt1Jnwy6AsURGBtK94qDQXJ9Nj9c7rYXpsMsUANhuEE8+tZmhZTJ6dpIFFmA13HAtvp3xWNwp0cAZ2rbu6fsGNzaheS4JHNFw4QhHSluhX9Vuv0W5o96MYNcq9tkbn3RH5oeY2xz9aq4to75ienbcGgiQ1gMJ0BfthZNw+IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708100732; c=relaxed/simple;
	bh=5yTnta56AR6BXnFEPPoLSDh9Nm3LmRA9pgmcvYBfpIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CDtohnCdXyrKS+002vWyTIa2nAkAsxuYNFBODhUcdIwCK1XloIVLYzDi5YRCvVSLfDPZ4Mt1hEaBDIbnAtW09DX13aPUHuMh9nmWI0DlbHNL5gmVTDSD4TXHYhKuW3kBwWD275cxFJN3H1QhST5MtDkX8rQUJzVwQLMdA5/X0z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=JAfGjzyZ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-411b1c73c66so2897335e9.1
        for <linux-media@vger.kernel.org>; Fri, 16 Feb 2024 08:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1708100728; x=1708705528; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FbovBTMRuauZ87JHkxYtCDu9xXwl8pNuoEKKXTPkIE4=;
        b=JAfGjzyZRf39SvxvvliBO06xKVSlsQQNQykpQHXzfgl1RrfmdpgyyFJ6vpKRAV6UKg
         lopK9i+uCJQti9k7Ld85tisaYRoC7H4YfYniGX4TV/+ofpW4DCU2ghN8uJx8yZDMhqUM
         P8KqMIeBfCJ/SxzMloTLXY+FrXz894nB25Y2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708100728; x=1708705528;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FbovBTMRuauZ87JHkxYtCDu9xXwl8pNuoEKKXTPkIE4=;
        b=oQzn8JT5tvLbnAGQ5aS8QluaMCtnAEukRX+ACIDqqfjB78ETH07G6VNhtuLnkE9jve
         9gxahhzyMtuUF+mMR+WaX3QZfXYYRn6qrfyvXv/LSqDtiyCBAfViVASsTRtRrCDjfAF7
         Y4MIVj4ioelC7Vt8JhWaEf4oyPELoPSw0aG3QgEI07vwTpQPvzLZ5X31qYBYUOpqBI23
         kDuh9zdMJsdZ2Pq+7E8W8PTqX8dyL+2V+3CA0DC3JYvf1dOALfdQrP7AiWJHQzvRjVli
         hbMJueQAmjmL7KfQ8os2BwCO5dtmTZjUb5AtiSct5MUGMCXgoB4CZgvyi1qXXLsZhiL/
         w41w==
X-Forwarded-Encrypted: i=1; AJvYcCVVmiyFsMcur7sqh96iTyusbFc7JWBIQsdFKIiW0N28FL1+AxGzBoXKe6Uiv7QB+kiiKM1veuj8CB5eS8BZW359v5mzbH/u+YRWBzk=
X-Gm-Message-State: AOJu0Yw+ietZxm7tn51MYTamYZcI49omFD/WxIc+K1rVwjAhYZElPyX9
	o0eE24sdasakz5qrIOyB8oTNVBvnKP1qFyig48mJaanKHINGBW+uZwnpv0HPax4=
X-Google-Smtp-Source: AGHT+IHeHVBrgNXG+qAN5mqx7oJbbjaQd6P5O0lqO0uCc/gzwoRohy4nD+vPEEMKf02n7YyersNUsg==
X-Received: by 2002:a05:600c:2258:b0:412:456e:636e with SMTP id a24-20020a05600c225800b00412456e636emr1585192wmm.3.1708100728278;
        Fri, 16 Feb 2024 08:25:28 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id s10-20020a05600c044a00b004122fbf9253sm2726818wmb.39.2024.02.16.08.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 08:25:27 -0800 (PST)
Date: Fri, 16 Feb 2024 17:25:25 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
	Gustavo Padovan <gustavo@padovan.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	Alex Deucher <alexander.deucher@amd.com>,
	amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2 0/6] dma-fence, drm, amdgpu new trace events
Message-ID: <Zc-MdXp_2Wcm5ouT@phenom.ffwll.local>
References: <20240117184329.479554-1-pierre-eric.pelloux-prayer@amd.com>
 <20240213155112.156537-1-pierre-eric.pelloux-prayer@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240213155112.156537-1-pierre-eric.pelloux-prayer@amd.com>
X-Operating-System: Linux phenom 6.6.11-amd64 

On Tue, Feb 13, 2024 at 04:50:25PM +0100, Pierre-Eric Pelloux-Prayer wrote:
> This series adds new events to make it easier for tools
> like gpuvis or umr to graph the GPUs, kernel and applications
> activity.
> 
> UMR patches using these events can be found here:
> https://gitlab.freedesktop.org/tomstdenis/umr/-/merge_requests/37
> 
> V1:
> https://patchwork.kernel.org/project/linux-media/patch/20240117184329.479554-1-pierre-eric.pelloux-prayer@amd.com/
> 
> Changes from V1:
> * uses trace_dma_fence_sync_to from dma-fence-chain.c
> * new amdgpu events
> * new drm plane commit event

I think a patch to add this to the drm/sched dependency tracking would be
really neat. With the addition of drm_sched_job_add_dependency() and
friends that would wire up some basic dependency tracking for a _lot_ of
drivers.

It should also be done before the amdgpu specific additions, because
amdgpu is also using that and we don't want to duplicate fence dependency
tracking in drivers that should be in common code.

Cheer, Sima
> 
> Pierre-Eric Pelloux-Prayer (6):
>   tracing, dma-buf: add a trace_dma_fence_sync_to event
>   dma-buf/fence-chain: use trace_dma_fence_sync_to
>   amdgpu: use trace_dma_fence_sync_to in amdgpu_fence_sync
>   drm/amdgpu: add BO clear event
>   drm/amdgpu: add a amdgpu_cs_ioctl2 event
>   drm: add drm_mode_atomic_commit event
> 
>  drivers/dma-buf/dma-fence-chain.c             |  4 +++
>  drivers/dma-buf/dma-fence.c                   |  1 +
>  .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  8 ++---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        | 16 +++++----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c       |  8 ++---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c       |  4 +--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    |  2 ++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c      | 11 ++++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h      |  3 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h     | 28 +++++++++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c  |  4 +--
>  drivers/gpu/drm/drm_atomic_uapi.c             | 19 +++++++++++
>  drivers/gpu/drm/drm_trace.h                   | 28 +++++++++++++--
>  include/trace/events/dma_fence.h              | 34 +++++++++++++++++++
>  14 files changed, 144 insertions(+), 26 deletions(-)
> 
> -- 
> 2.40.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

