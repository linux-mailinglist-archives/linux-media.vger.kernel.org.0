Return-Path: <linux-media+bounces-5301-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B26BF858292
	for <lists+linux-media@lfdr.de>; Fri, 16 Feb 2024 17:32:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6747F281E99
	for <lists+linux-media@lfdr.de>; Fri, 16 Feb 2024 16:32:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DE8B7E0F4;
	Fri, 16 Feb 2024 16:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="b4d0IJIY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA3144369
	for <linux-media@vger.kernel.org>; Fri, 16 Feb 2024 16:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708101161; cv=none; b=X9IxY0rlfuQsmiGABOjr5Sw53H9X0mpBuYKpr4BzU4kOhdnu1R4HL9OPVKT2T38lpyTFZcDoapI1+Jv1bhx96Llo7bkSzQS/3jBCaSEt8K3jy92jfzfsD4lUx23mMvuxUFHyIdp9V19Iba9T0H44TCJySbjTaINtxSf0DZxMccs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708101161; c=relaxed/simple;
	bh=nbS+DWL4hB3shfwO1v5rkV0F8YJT3g5jzIQJ4pwcCuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QLHHEPpsw7gSuOVUMIukjou6gtinjy+Nvs6sX0/BMSL3Y3lCrsAVt8jBcUf08TrDPA3MUHqWJM4U6F9HpZAgsA05Pve733I1dCGeab/IXYRy42lkle1HDyAkYqkoCRk45PNFKn13i+1Zk09Fc0zI7haIlsgXnHhEkLrmmiDTylc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=b4d0IJIY; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4123891b49cso2724615e9.1
        for <linux-media@vger.kernel.org>; Fri, 16 Feb 2024 08:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1708101158; x=1708705958; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SgQeh6gny5JrINPGAEJwqjErNXlFS7uJm/gN6H25Wl4=;
        b=b4d0IJIY1V5SNnB4q1eHpb6d0DnFgLeUnH/UW++qfDunEVC3jUWYGX1jvzYRt8Gy2b
         W3ZVFrMne6tBPNJw+gMD3dL01pPcyZq8DijwoTt11K5F8/VPpirLx/FsOuwfbpkBalDJ
         wBMWts03hSMBZy4dmncjS3XpRESUSaBXz8wWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708101158; x=1708705958;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SgQeh6gny5JrINPGAEJwqjErNXlFS7uJm/gN6H25Wl4=;
        b=tv2ivAcS1Yq+icn03sZNBY3Fzg3cxc0O1SzWzwMACZn4F5EHP2AnlH8It+k/ovIMvr
         Bu1dlLtC+cdBGeMGJCe2J2IowGiSxgN6wSGsNtSTj38qJH3jd/3/jLsoN3IlYgaV/ENc
         wMjuSWaGhP3WSAHf+2Yi3XMxtXQbLVaUx+3PV/15DzVmz3bRDGUXlsrCCGwv3dZN7Ecy
         XoUL+D18w+gAWuhbb5Yv2gL4PK/EEaKmMtyzkIuEX/wudT5lDJmn7sn3jELHslN+d5tK
         e5c8dNgWJ7tgMmqdP7Lss4HwaOgMJO9f4THa3KGm/ubNek9T6aGjA9SCJvfwdqLKTIWs
         Bjng==
X-Forwarded-Encrypted: i=1; AJvYcCUvk4ZB5DfjBCppKekbR8FQu14DdJ7Z2jJDtFtzOQ2TsalddeOnxkl5rjDi2PvqHulb+rt0hogbfb6lHK7LDgKK6z5HXXAbTMToTPs=
X-Gm-Message-State: AOJu0YxFf4y7YKmQQS8iQp9sqltj8HGlDVQXV7xstxD9jFFKG/aegdII
	c0rmk9cO2mVGGZPtI0WkAZfQqFW+b5gLJoruW3Iu786j8ylq2NEMSgVQzrAu+gc=
X-Google-Smtp-Source: AGHT+IFE0jwLawnXRHSScGe2ockTGkEpG5gU+Fwm8RLqeKicUfmzpG/tRRmoFIyQP2z5PdY038vGLA==
X-Received: by 2002:a05:600c:510a:b0:411:de28:bb52 with SMTP id o10-20020a05600c510a00b00411de28bb52mr3914738wms.4.1708101158500;
        Fri, 16 Feb 2024 08:32:38 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id j6-20020a05600c190600b00411d0b58056sm2932741wmq.5.2024.02.16.08.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 08:32:38 -0800 (PST)
Date: Fri, 16 Feb 2024 17:32:36 +0100
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
Subject: Re: [PATCH v2 1/6] tracing, dma-buf: add a trace_dma_fence_sync_to
 event
Message-ID: <Zc-OJAXlApzcOfYQ@phenom.ffwll.local>
References: <20240117184329.479554-1-pierre-eric.pelloux-prayer@amd.com>
 <20240213155112.156537-1-pierre-eric.pelloux-prayer@amd.com>
 <20240213155112.156537-2-pierre-eric.pelloux-prayer@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240213155112.156537-2-pierre-eric.pelloux-prayer@amd.com>
X-Operating-System: Linux phenom 6.6.11-amd64 

On Tue, Feb 13, 2024 at 04:50:26PM +0100, Pierre-Eric Pelloux-Prayer wrote:
> This new event can be used to trace where a given dma_fence is added
> as a dependency of some other work.

How?

What I'd expected here is that you add a dependency chain from one fence
to another, but this only has one fence. How do you figure out what's the
next dma_fence that will stall on this dependency? Like in the gpu
scheduler we do know what will be the fence that userspace gets back, so
we can make that connection. And same for the atomic code (although you
don't wire that up at all).

I'm very confused on how this works and rather worried it's a brittle
amdgpu-only solution ...
-Sima

> I plan to use it in amdgpu.
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>  drivers/dma-buf/dma-fence.c      |  1 +
>  include/trace/events/dma_fence.h | 34 ++++++++++++++++++++++++++++++++
>  2 files changed, 35 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index e0fd99e61a2d..671a499a5ccd 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -23,6 +23,7 @@
>  EXPORT_TRACEPOINT_SYMBOL(dma_fence_emit);
>  EXPORT_TRACEPOINT_SYMBOL(dma_fence_enable_signal);
>  EXPORT_TRACEPOINT_SYMBOL(dma_fence_signaled);
> +EXPORT_TRACEPOINT_SYMBOL(dma_fence_sync_to);
>  
>  static DEFINE_SPINLOCK(dma_fence_stub_lock);
>  static struct dma_fence dma_fence_stub;
> diff --git a/include/trace/events/dma_fence.h b/include/trace/events/dma_fence.h
> index 3963e79ca7b4..9b3875f7aa79 100644
> --- a/include/trace/events/dma_fence.h
> +++ b/include/trace/events/dma_fence.h
> @@ -83,6 +83,40 @@ DEFINE_EVENT(dma_fence, dma_fence_wait_end,
>  	TP_ARGS(fence)
>  );
>  
> +DECLARE_EVENT_CLASS(dma_fence_from,
> +
> +	TP_PROTO(struct dma_fence *fence, const char *reason),
> +
> +	TP_ARGS(fence, reason),
> +
> +	TP_STRUCT__entry(
> +		__string(driver, fence->ops->get_driver_name(fence))
> +		__string(timeline, fence->ops->get_timeline_name(fence))
> +		__field(unsigned int, context)
> +		__field(unsigned int, seqno)
> +		__string(reason, reason)
> +	),
> +
> +	TP_fast_assign(
> +		__assign_str(driver, fence->ops->get_driver_name(fence));
> +		__assign_str(timeline, fence->ops->get_timeline_name(fence));
> +		__entry->context = fence->context;
> +		__entry->seqno = fence->seqno;
> +		__assign_str(reason, reason);
> +	),
> +
> +	TP_printk("driver=%s timeline=%s context=%u seqno=%u reason=%s",
> +		  __get_str(driver), __get_str(timeline), __entry->context,
> +		  __entry->seqno, __get_str(reason))
> +);
> +
> +DEFINE_EVENT(dma_fence_from, dma_fence_sync_to,
> +
> +	TP_PROTO(struct dma_fence *fence, const char *reason),
> +
> +	TP_ARGS(fence, reason)
> +);
> +
>  #endif /*  _TRACE_DMA_FENCE_H */
>  
>  /* This part must be outside protection */
> -- 
> 2.40.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

