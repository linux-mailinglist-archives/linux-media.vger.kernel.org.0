Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0BA497FC5
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2019 18:14:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728255AbfHUQNd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Aug 2019 12:13:33 -0400
Received: from mail-ed1-f48.google.com ([209.85.208.48]:45484 "EHLO
        mail-ed1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727959AbfHUQNc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Aug 2019 12:13:32 -0400
Received: by mail-ed1-f48.google.com with SMTP id x19so3546109eda.12
        for <linux-media@vger.kernel.org>; Wed, 21 Aug 2019 09:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=9F5bjaMc9P000ps+Gl1qY6vV8NWSDQv4mY3g0dOh/G8=;
        b=ljEy8ojdWAD/hPsmWlI/5ERHgkDUDB8eUM+JVsXlwGeenV9Lot1i75VXoz8sc9Es9F
         9BSE/kQbk86c2FpJ9OJkiq15KpS95AUyzkFdN5MgjLtFtSgVyCI9eF8V2vuo6ebiBjAX
         cnMiALZj6mD9d07RlN0ZVLsVIfHt/fDs2lnbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=9F5bjaMc9P000ps+Gl1qY6vV8NWSDQv4mY3g0dOh/G8=;
        b=dEJMwKVcnntNChhhB8s+u/F+oD+DDM8rU0WKRten0Fd2g9BylIci8iHW5h+GPIsVMt
         GNw7MZmKDep+2BdzYU1arD28C5WMmtQb32v8vWY1E6Sw0i9QnhkDZeXzxCa4Wzf4UWOY
         mNh4uuFOnExj5oaMI3XYzmBMKLteOK2qjVzUMB5jVEipxlsnyZa3qbcZvy/QUlz3BgbX
         NZUR1Yk6PnPcCielH6jZ+nJecwE2qWlqx2V3yZOHPX9B7TVT5irq17Ok0MwyXaTQIu5a
         gjlxTmycR5CJs9y2UcVaVaMr4pjUj/xAkkBRMfUC3KfASxb2ucsMP0I4vDhWClWw1UWD
         4m0Q==
X-Gm-Message-State: APjAAAXhvrM9TRLUy4fKO55b8t8NEfDKLVa9/oAp/nnLMy4GKI2ocmKo
        ZLZr25QOkVYFYPwBim/Kv5voDw==
X-Google-Smtp-Source: APXvYqy31LW3yEn6hEEMQFThT4JnCQX43e25E+unpLiiHuK6DkGmALDxLLbgr+bd+xP3Jy81R2YcQw==
X-Received: by 2002:aa7:d701:: with SMTP id t1mr36940245edq.265.1566404011008;
        Wed, 21 Aug 2019 09:13:31 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id i8sm4181194edg.12.2019.08.21.09.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2019 09:13:29 -0700 (PDT)
Date:   Wed, 21 Aug 2019 18:13:27 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
        daniel.vetter@ffwll.ch, sumit.semwal@linaro.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [RFC] replacing dma_resv API
Message-ID: <20190821161327.GO11147@phenom.ffwll.local>
References: <20190821123147.110736-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190821123147.110736-1-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Aug 21, 2019 at 02:31:37PM +0200, Christian König wrote:
> Hi everyone,
> 
> In previous discussion it surfaced that different drivers use the shared
> and explicit fences in the dma_resv object with different meanings.
> 
> This is problematic when we share buffers between those drivers and
> requirements for implicit and explicit synchronization leaded to quite a
> number of workarounds related to this.
> 
> So I started an effort to get all drivers back to a common understanding
> of what the fences in the dma_resv object mean and be able to use the
> object for different kind of workloads independent of the classic DRM
> command submission interface.
> 
> The result is this patch set which modifies the dma_resv API to get away
> from a single explicit fence and multiple shared fences, towards a
> notation where we have explicit categories for writers, readers and
> others.
> 
> To do this I came up with a new container called dma_resv_fences which
> can store both a single fence as well as multiple fences in a
> dma_fence_array.
> 
> This turned out to actually be even be quite a bit simpler, since we
> don't need any complicated dance between RCU and sequence count
> protected updates any more.
> 
> Instead we can just grab a reference to the dma_fence_array under RCU
> and so keep the current state of synchronization alive until we are done
> with it.
> 
> This results in both a small performance improvement since we don't need
> so many barriers any more, as well as fewer lines of code in the actual
> implementation.

I think you traded lack of barriers/retry loops for correctness here, see
reply later on. But I haven't grokked the full thing in details, so easily
might have missed something.

But high level first, and I don't get this at all. Current state:

Ill defined semantics, no docs. You have to look at the implementations.

New state after you patch series:

Ill defined semantics (but hey different!), no docs. You still have to
look at the implementations to understand what's going on.

I think what has actually changed (aside from the entire implementation)
is just these three things:
- we now allow multiple exclusive fences
- exclusive was renamed to writer fences, shared to reader fences
- there's a new "other" group, for ... otherwordly fences?

Afaiui we have the following to issues with the current fence semantics:
- amdgpu came up with a totally different notion of implicit sync, using
  the owner to figure out when to sync. I have no idea at all how that
  meshes with multiple writers, but I guess there's a connection.
- amdkfd does a very fancy eviction/preempt fence. Is that what the other
  bucket is for?

I guess I could read the amdgpu/ttm code in very fine detail and figure
this out, but I really don't see how that's moving stuff forward.

Also, I think it'd be really good to decouple semantic changes from
implementation changes, because untangling them if we have to revert one
or the other is going to be nigh impossible. And dma_* is not really an
area where we can proudly claim that reverts don't happen.

Cheers, Daniel

> 
> Please review and/or comment,
> Christian. 
> 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
