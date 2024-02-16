Return-Path: <linux-media+bounces-5303-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 804978582D6
	for <lists+linux-media@lfdr.de>; Fri, 16 Feb 2024 17:42:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 360B51F2369A
	for <lists+linux-media@lfdr.de>; Fri, 16 Feb 2024 16:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D10EE130E20;
	Fri, 16 Feb 2024 16:42:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78260130ADC;
	Fri, 16 Feb 2024 16:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708101758; cv=none; b=CIJ7BMaplNnwLZCFszMPl2hclLUhQxvg2BJf3sPuA44aUREN4XBRXAU/WQQinQFZDBaVum6rfGpxqJTQjk/OpBfV8dPCnKCePe60DwRZ+tRHaEzZzNUHMOGpZQ26ZNJvYbINNuMR2mDhEFPcSadcjZ9XCnTM1tBJka+kU6d/w6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708101758; c=relaxed/simple;
	bh=L1pLiWASNepMoTQgj1KmDcAQXKiZ9p5aC6ASQn0nT3I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R0NmZLSF/gzSMnTtVIAHjUg4KAJf158LLO+cHx2BMn9tXKnydhTynMv0x07oRNgh/+IsNqvCIyARBfq3c+U5vls+ZGVonQgibRRsP57o6ixIxTKDbEWB6DLpssA7eQl0DujDk+p8WYWh27isV1HqHvplSyHeiNYGdmtzpEDsHeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE9ACC433C7;
	Fri, 16 Feb 2024 16:42:36 +0000 (UTC)
Date: Fri, 16 Feb 2024 11:44:12 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, Sumit
 Semwal <sumit.semwal@linaro.org>, Gustavo Padovan <gustavo@padovan.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, Alex Deucher
 <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2 6/6] drm: add drm_mode_atomic_commit event
Message-ID: <20240216114412.1f181ffa@gandalf.local.home>
In-Reply-To: <Zc-PQ9Yx4fk4TK43@phenom.ffwll.local>
References: <20240117184329.479554-1-pierre-eric.pelloux-prayer@amd.com>
	<20240213155112.156537-1-pierre-eric.pelloux-prayer@amd.com>
	<20240213155112.156537-7-pierre-eric.pelloux-prayer@amd.com>
	<20240213112017.726016f0@gandalf.local.home>
	<Zc-PQ9Yx4fk4TK43@phenom.ffwll.local>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 16 Feb 2024 17:37:23 +0100
Daniel Vetter <daniel@ffwll.ch> wrote:

> > > @@ -1503,6 +1504,24 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
> > >  		drm_mode_object_put(obj);
> > >  	}
> > >  
> > > +	if (trace_drm_mode_atomic_commit_enabled()) {
> > > +		struct drm_crtc_state *crtc_state;
> > > +		struct drm_crtc *crtc;
> > > +		int *crtcs;
> > > +		int i, num_crtcs;
> > > +
> > > +		crtcs = kcalloc(dev->mode_config.num_crtc, sizeof(int),
> > > +				GFP_KERNEL);  
> > 
> > If the above allocation fails, this will cause a NULL kernel dereference.  
> 
> Yeah can't we somehow iterate directly into the trace subsystem? If
> nothing else works I guess just a per-crtc event should do.

You mean like this?

  https://lore.kernel.org/all/20240216105934.7b81eae9@gandalf.local.home/

;-)

-- Steve

