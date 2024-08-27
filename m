Return-Path: <linux-media+bounces-16940-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 542F0961546
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 19:16:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65B191C23039
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 17:16:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE3841C93AF;
	Tue, 27 Aug 2024 17:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="fNv/IIZ8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF17F1BFE02
	for <linux-media@vger.kernel.org>; Tue, 27 Aug 2024 17:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724778968; cv=none; b=T8aEB6A5wzr3k+eFn2lAxXWB4M5XTi5xR8hmkHJFdbwagwyUn+mu3Vf8bodXonsScqOW5yRgRa5oFX2JvFdoZrJ15rsbw9qVJcu7/sZmENJza22jHFzc8vLgMvxgiFvrw7xOh5ADSI9nVZDkOxkuBukH1SNJFgsKfodPjpcDnao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724778968; c=relaxed/simple;
	bh=FrPc5xnJfdHcwIlwkNr60aoab3HbVIdS2h27uYE2NjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D4DEFO3qD3h1ZVGo3wbCa5QexK7fPoFrXZ0RfpzcxK7z5OirzSO7YYuK6sZ75HanrqUq1+c0SxwE9CiLOOpL1k0vbvQchjLrcx6WJNCsPinPqMOgLFRp+3T2A2ombqSoN86aEOQxFedujNfFgiXBjNyMHlBqWGLruJQCjWDyKZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=fNv/IIZ8; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42ab99fb45dso64067725e9.1
        for <linux-media@vger.kernel.org>; Tue, 27 Aug 2024 10:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1724778962; x=1725383762; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=58403xbudumO3JNg+OZmLQLpJDBaCWXoTPjgTWSOtEw=;
        b=fNv/IIZ80ayQUdR9tOaWGYNNR+WTAXzTtrovELC+QbW8ORT7Oci0grScYwClYvdrRk
         vrtULF9841/wiWA4wvq+ekgoTdEVBFY9eF6F0hfLESQajcLoYS2LnygAsFtD5myCyFm7
         DMlL+V/wEB603M6QpTGNyioG/+e4fPGVAMJzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724778962; x=1725383762;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=58403xbudumO3JNg+OZmLQLpJDBaCWXoTPjgTWSOtEw=;
        b=LmrAwwdSEUjbBkwqrnaryHGXVsXoC1ML6c3mZJq7GNCwW9IOsXhDmPGcG/WjhD4sZw
         O+l93RtjWvZPe6LUgZNig/72FiW7NVKtOfYlNF3c6dIirJfXTOaXW99+2wD+rv8G+yvs
         I93+jNp5IUiVSSof78rpAmqWg+13GYtzy34ZrSiEPpSqKylPvG9gvHVZ4s2fr7HqEcxN
         vi+ZfI38hA42mI1uBBtQm+a6w0VQBKtfj3BzDNyYvY30K9XIyM8DuyXObmXd75AgeZAW
         f2iYvKnvXgQvk0Eqjx1znNc6Tj5vKhj43PMmwdtjWhBu+vSQlWWH5ej7/xl9K+TfWaNE
         4DEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXR0ytCfZb8eSWaokf2APff/8Mi8jBVJqECXX/TbNQs/qeWJE3ytUV1rZANoiOtcDiL4/QTDwm3NUwQgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmL/J16ITYElZTwaNPVLjZRZYrJ46OBKffoqIVcyCt/wDBr9Dt
	KW5XMVyiu6qPjEqzvbEtCXDcsxZd8/krkdtGVEm3LLqSNcDkNdqT+UVfgV1iXn8=
X-Google-Smtp-Source: AGHT+IGR+88aHIYUAWR2VyxyLBZQ73WazlSN4kM7hsed9DKw3Zi4UpmqpWcLnUMtbsNUgfInUK1oGw==
X-Received: by 2002:a05:600c:3ba6:b0:428:e30:fa8d with SMTP id 5b1f17b1804b1-42acd54244fmr114121745e9.6.1724778961898;
        Tue, 27 Aug 2024 10:16:01 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3730814602asm13600524f8f.44.2024.08.27.10.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 10:16:01 -0700 (PDT)
Date: Tue, 27 Aug 2024 19:15:59 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	intel-xe@lists.freedesktop.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, thomas.hellstrom@linux.intel.com,
	sumit.semwal@linaro.org, daniel@ffwll.ch
Subject: Re: [PATCH v3 1/2] dma-buf: Split out dma fence array create into
 alloc and arm functions
Message-ID: <Zs4Jz0wwC7hGPLR8@phenom.ffwll.local>
References: <20240823045443.2132118-1-matthew.brost@intel.com>
 <20240823045443.2132118-2-matthew.brost@intel.com>
 <f7fcb678-afb2-428e-abad-af9892823e60@amd.com>
 <ZsiuvXACGYdm+Ons@DUT025-TGLU.fm.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZsiuvXACGYdm+Ons@DUT025-TGLU.fm.intel.com>
X-Operating-System: Linux phenom 6.9.12-amd64 

On Fri, Aug 23, 2024 at 03:46:05PM +0000, Matthew Brost wrote:
> On Fri, Aug 23, 2024 at 08:37:30AM +0200, Christian König wrote:
> > Am 23.08.24 um 06:54 schrieb Matthew Brost:
> > > Useful to preallocate dma fence array and then arm in path of reclaim or
> > > a dma fence.
> > 
> > Exactly that was rejected before because it allows to create circle
> > dependencies.
> > 
> 
> Can you explain or do you have link to that discussion? Trying to think
> how this would be problematic and failing to see how it is. 
> 
> > You would need a really really good argument why that is necessary.
> >
> 
> It seems quite useful when you have a code path in which you know N fences
> will be generated, prealloc a dma fence array, then populate at
> later time ensuring no failures points (malloc), and then finally
> install dma fence array in timeline sync obj (chain fences not allowed).
> 
> It fits nicely for VM bind operations in which a device has multple
> TLBs and the TLB invalidation completion is a fence. I suspect Intel
> can't be the only device out their with multiple TLBs, does VM bind, and
> use timeline sync obj.

I think the naming you've picked is a bit confusion, since all you're
splitting out is the kzalloc call. At that point the dma_fence_array isn't
yet useable as a fence, so there's no issues with with circles. It's only
when you call _arm that it becomes a real fence.

I think just renaming _arm to _init, so that we follow the standard naming
pattern for splitting _create() into kzalloc and everything else is all
that's needed here?

Plus updating the kernel doc to make it really clear that _alloc doesn't
give you a fence, just a pile of memory. And that _init must be called
with a compatible amount of fences, or it'll fail.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

