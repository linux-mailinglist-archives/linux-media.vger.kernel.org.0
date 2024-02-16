Return-Path: <linux-media+bounces-5305-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 531E88584BF
	for <lists+linux-media@lfdr.de>; Fri, 16 Feb 2024 19:03:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC8961F22BB5
	for <lists+linux-media@lfdr.de>; Fri, 16 Feb 2024 18:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 198781339A1;
	Fri, 16 Feb 2024 18:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="L4k18Lh+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1FF12F5AB
	for <linux-media@vger.kernel.org>; Fri, 16 Feb 2024 18:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708106574; cv=none; b=Ahehtjw+HUD3nTCxbptCm0OgFSMdtBWXbkYMKhK2tRrS5OdogJujHkXnGp2ZuNr+0og4sKwTmL51utjPKOtt5G8+GjfL3hcQZgFc2o/HAJ/8sYE//+Ch6vWlwuTfHJVX4fAzu0fpaybJMOFp41ASPQY2+BpezOF/kLj+O8qc8Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708106574; c=relaxed/simple;
	bh=THit63uVPKgH3BKErUJlnkxg4AEbv7tu7om5C0j2s2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EveYJpd3/dOR1s5Mr5ri3QLb2qrZgWD8mia/7nez36C+69icwHHd8DqTtE2QLccEJIdkoW9nO0uwdGAl96h80B+656q109VQbyZSgMvINXomKGQtDGNNVjKRT59g2F7OJKBN+BmO9u+dIKbbiTBSX0LwjWoeI9fVOhyGwQJnut4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=L4k18Lh+; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a3d2422f1b5so66925766b.1
        for <linux-media@vger.kernel.org>; Fri, 16 Feb 2024 10:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1708106571; x=1708711371; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kWOeJUy90KVtiP9YXPoGesfXE8zdwI8eJnlf9+BtZ90=;
        b=L4k18Lh+zUoZnan64w743YAqDyB+SdpZQwY7906UFPU3W8bK8bzsfhIuLBidXPuWFS
         uy4MuQiu1CMEyvAtgUDPmCdxb/XN6Stwo9ePKcSKmpBLug8MzyKKqTEPR8u9SChq+Z8w
         l9FL3xco8/4+taiptiYGfzTgw6BYtGt2cr0SU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708106571; x=1708711371;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kWOeJUy90KVtiP9YXPoGesfXE8zdwI8eJnlf9+BtZ90=;
        b=LV4tfcxuk2/bqGCzq60ONRYFj4+7s0QNaY/7iV+Bcuknhj9OwLTbjEmwktXY9d2eMr
         EkDomkJk7BPaoP+z/Ey/4kkCqj5LNxU3w+sdkXOiU9EjYL9G1EaSCEDkbfTSHMEdy66T
         ozGlsIHTED1oAqEnDYstlQoumcdTd+4Dnixhi+b7OYKsbM45bvfAKRGtJQLmM7dQscl6
         IDNMiG0TaR43/oCvqIfQcShOTY/V9bT0miMX7hViOVxnD2oAqrOqjL3JfJIqOfUyzgBs
         2JAR9ZbJYAxVkkgkRkc9IKv6Hg0SGB0yPFMhtohTdNiXHOzCBwYGciuia6yc3CByGpWm
         vmRw==
X-Forwarded-Encrypted: i=1; AJvYcCUg8HMNJ5FWLgkLgKBpyjhSciGNA4R5eHTW+b76NMbequsrtFE3PnnhdjJXnnRayLaiD9hvlCjlGDXOwsmy0jTuk8rJ5iiduIgE93g=
X-Gm-Message-State: AOJu0Yx/1mAyShadIf7WH1jHkCtKeJccXI/hy6TLaVFew1Mm+4UCRjGt
	l+Bvjy3AFdhG0+ta8+5wxRl2i7PCxcfWLvmeUFVuw5w5+lSAYEMjW8i5DE30MTY=
X-Google-Smtp-Source: AGHT+IHSmOAy3oa2La7yssKepZFC0ok9e49lHpBPZtwML9qSR/4sCtqzMn/r6OGKsb48uF7ZvrRmBQ==
X-Received: by 2002:a17:907:1604:b0:a38:526e:78ed with SMTP id cw4-20020a170907160400b00a38526e78edmr4205804ejd.7.1708106570987;
        Fri, 16 Feb 2024 10:02:50 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id lc5-20020a170906f90500b00a3d6ff5f087sm191930ejb.55.2024.02.16.10.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 10:02:50 -0800 (PST)
Date: Fri, 16 Feb 2024 19:02:48 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel@ffwll.ch>,
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Gustavo Padovan <gustavo@padovan.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	Alex Deucher <alexander.deucher@amd.com>,
	amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2 1/6] tracing, dma-buf: add a trace_dma_fence_sync_to
 event
Message-ID: <Zc-jSH4BVrBrkj5d@phenom.ffwll.local>
References: <20240117184329.479554-1-pierre-eric.pelloux-prayer@amd.com>
 <20240213155112.156537-1-pierre-eric.pelloux-prayer@amd.com>
 <20240213155112.156537-2-pierre-eric.pelloux-prayer@amd.com>
 <Zc-OJAXlApzcOfYQ@phenom.ffwll.local>
 <b719d7b9-8a9a-42ad-b35b-145d6a835964@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b719d7b9-8a9a-42ad-b35b-145d6a835964@amd.com>
X-Operating-System: Linux phenom 6.6.11-amd64 

On Fri, Feb 16, 2024 at 05:51:59PM +0100, Christian König wrote:
> Am 16.02.24 um 17:32 schrieb Daniel Vetter:
> > On Tue, Feb 13, 2024 at 04:50:26PM +0100, Pierre-Eric Pelloux-Prayer wrote:
> > > This new event can be used to trace where a given dma_fence is added
> > > as a dependency of some other work.
> > How?
> > 
> > What I'd expected here is that you add a dependency chain from one fence
> > to another, but this only has one fence.
> 
> That's what I though initially as well, but at the point we add the
> dependency fences to the scheduler job we don't have the scheduler fence
> initialized yet.
> 
> We could change this so that we only trace all the fences after we have
> initialized the scheduler fence, but then we loose the information where the
> dependency comes from.

Hm right, I thought we'd dump the hashed pointe value into the fence
events too, then you could make the connection. But we don't, so this is a
bit annoying ...

And walking the entire scheduler dependency chain at trace_dma_fence_emit
time (or something similar) maybe?
-Sima

> > How do you figure out what's the
> > next dma_fence that will stall on this dependency?
> 
> I'm not fully sure on that either. Pierre?
> 
> Christian.
> 
> 
> >   Like in the gpu
> > scheduler we do know what will be the fence that userspace gets back, so
> > we can make that connection. And same for the atomic code (although you
> > don't wire that up at all).
> > 
> > I'm very confused on how this works and rather worried it's a brittle
> > amdgpu-only solution ...
> > -Sima
> > 
> > > I plan to use it in amdgpu.
> > > 
> > > Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> > > ---
> > >   drivers/dma-buf/dma-fence.c      |  1 +
> > >   include/trace/events/dma_fence.h | 34 ++++++++++++++++++++++++++++++++
> > >   2 files changed, 35 insertions(+)
> > > 
> > > diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> > > index e0fd99e61a2d..671a499a5ccd 100644
> > > --- a/drivers/dma-buf/dma-fence.c
> > > +++ b/drivers/dma-buf/dma-fence.c
> > > @@ -23,6 +23,7 @@
> > >   EXPORT_TRACEPOINT_SYMBOL(dma_fence_emit);
> > >   EXPORT_TRACEPOINT_SYMBOL(dma_fence_enable_signal);
> > >   EXPORT_TRACEPOINT_SYMBOL(dma_fence_signaled);
> > > +EXPORT_TRACEPOINT_SYMBOL(dma_fence_sync_to);
> > >   static DEFINE_SPINLOCK(dma_fence_stub_lock);
> > >   static struct dma_fence dma_fence_stub;
> > > diff --git a/include/trace/events/dma_fence.h b/include/trace/events/dma_fence.h
> > > index 3963e79ca7b4..9b3875f7aa79 100644
> > > --- a/include/trace/events/dma_fence.h
> > > +++ b/include/trace/events/dma_fence.h
> > > @@ -83,6 +83,40 @@ DEFINE_EVENT(dma_fence, dma_fence_wait_end,
> > >   	TP_ARGS(fence)
> > >   );
> > > +DECLARE_EVENT_CLASS(dma_fence_from,
> > > +
> > > +	TP_PROTO(struct dma_fence *fence, const char *reason),
> > > +
> > > +	TP_ARGS(fence, reason),
> > > +
> > > +	TP_STRUCT__entry(
> > > +		__string(driver, fence->ops->get_driver_name(fence))
> > > +		__string(timeline, fence->ops->get_timeline_name(fence))
> > > +		__field(unsigned int, context)
> > > +		__field(unsigned int, seqno)
> > > +		__string(reason, reason)
> > > +	),
> > > +
> > > +	TP_fast_assign(
> > > +		__assign_str(driver, fence->ops->get_driver_name(fence));
> > > +		__assign_str(timeline, fence->ops->get_timeline_name(fence));
> > > +		__entry->context = fence->context;
> > > +		__entry->seqno = fence->seqno;
> > > +		__assign_str(reason, reason);
> > > +	),
> > > +
> > > +	TP_printk("driver=%s timeline=%s context=%u seqno=%u reason=%s",
> > > +		  __get_str(driver), __get_str(timeline), __entry->context,
> > > +		  __entry->seqno, __get_str(reason))
> > > +);
> > > +
> > > +DEFINE_EVENT(dma_fence_from, dma_fence_sync_to,
> > > +
> > > +	TP_PROTO(struct dma_fence *fence, const char *reason),
> > > +
> > > +	TP_ARGS(fence, reason)
> > > +);
> > > +
> > >   #endif /*  _TRACE_DMA_FENCE_H */
> > >   /* This part must be outside protection */
> > > -- 
> > > 2.40.1
> > > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

