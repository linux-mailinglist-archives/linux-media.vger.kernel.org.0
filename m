Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84DAD98527
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2019 22:05:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730433AbfHUUFk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Aug 2019 16:05:40 -0400
Received: from mail-ed1-f48.google.com ([209.85.208.48]:34448 "EHLO
        mail-ed1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730412AbfHUUFj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Aug 2019 16:05:39 -0400
Received: by mail-ed1-f48.google.com with SMTP id s49so4437229edb.1
        for <linux-media@vger.kernel.org>; Wed, 21 Aug 2019 13:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=orRpnkbZf1TeqVUlAqXevvUOA/4LgBZq7OH271x1NQw=;
        b=F/H415IN/cIrHx/9AxdOEWaYvXChAb7QABbxYYP7fb0xchauIp4JLQvWbbwYiV2GEo
         cCvndo5FeVhfDSHcuxCgMPv73kPW6nRGSOCy4hcScqEjn9ObE82CCWPKSmz9+q9Bk/NS
         bMzr+yyDLv3GDNtNJzWpvNV4gW9JVYtlYfVH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=orRpnkbZf1TeqVUlAqXevvUOA/4LgBZq7OH271x1NQw=;
        b=InMFYU3/j9aMPsysdkj6MSBYPR7x0O8MjnkGMZPNfP+W25xYTpaKzGA/djXDaFiYHd
         n23ltvWN9T9S9nXt7fYVwAtYZAZVXkfvPMkUF0uX/xRA17MefrVnAhwQqIiaTs7aq7uI
         bov2TSecsi52+M5tVAqIhVHnVW5uE6vpkc5o3HfWWHPgKG8nLKKFI66ony4HX4m0nw5t
         KyHcJguYAHsJ7Yuovwwti4JcYuAG15Ve1FT1a7A/1P7Pdn/lu+PWCknDlDM3VCv/wJ03
         SpdNM/fHjcA9QZF2vxqJHcf1YE49BCW8gIYZSeh8WNzT+u68X387F5JrjDMTelDJUzKx
         hbSQ==
X-Gm-Message-State: APjAAAX6459uSOiz9xIY0084cc7uVxwsJHnhJM220yE97EbgSa68usCW
        1w8bGLybsOKIJMpY0syMqtXHig==
X-Google-Smtp-Source: APXvYqwn/BN66am28bpggHW140zRjJA8fFCS4rikRUn0mOXFEY2c/0DSsnSnFDglT7bIUCE7wpcyIw==
X-Received: by 2002:a17:906:4813:: with SMTP id w19mr17396732ejq.89.1566417937493;
        Wed, 21 Aug 2019 13:05:37 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id j12sm4182366edt.66.2019.08.21.13.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2019 13:05:36 -0700 (PDT)
Date:   Wed, 21 Aug 2019 22:05:34 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
        daniel.vetter@ffwll.ch, sumit.semwal@linaro.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [RFC] replacing dma_resv API
Message-ID: <20190821200534.GS11147@phenom.ffwll.local>
References: <20190821123147.110736-1-christian.koenig@amd.com>
 <20190821161327.GO11147@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190821161327.GO11147@phenom.ffwll.local>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Aug 21, 2019 at 06:13:27PM +0200, Daniel Vetter wrote:
> On Wed, Aug 21, 2019 at 02:31:37PM +0200, Christian König wrote:
> > Hi everyone,
> > 
> > In previous discussion it surfaced that different drivers use the shared
> > and explicit fences in the dma_resv object with different meanings.
> > 
> > This is problematic when we share buffers between those drivers and
> > requirements for implicit and explicit synchronization leaded to quite a
> > number of workarounds related to this.
> > 
> > So I started an effort to get all drivers back to a common understanding
> > of what the fences in the dma_resv object mean and be able to use the
> > object for different kind of workloads independent of the classic DRM
> > command submission interface.
> > 
> > The result is this patch set which modifies the dma_resv API to get away
> > from a single explicit fence and multiple shared fences, towards a
> > notation where we have explicit categories for writers, readers and
> > others.
> > 
> > To do this I came up with a new container called dma_resv_fences which
> > can store both a single fence as well as multiple fences in a
> > dma_fence_array.
> > 
> > This turned out to actually be even be quite a bit simpler, since we
> > don't need any complicated dance between RCU and sequence count
> > protected updates any more.
> > 
> > Instead we can just grab a reference to the dma_fence_array under RCU
> > and so keep the current state of synchronization alive until we are done
> > with it.
> > 
> > This results in both a small performance improvement since we don't need
> > so many barriers any more, as well as fewer lines of code in the actual
> > implementation.
> 
> I think you traded lack of barriers/retry loops for correctness here, see
> reply later on. But I haven't grokked the full thing in details, so easily
> might have missed something.
> 
> But high level first, and I don't get this at all. Current state:
> 
> Ill defined semantics, no docs. You have to look at the implementations.
> 
> New state after you patch series:
> 
> Ill defined semantics (but hey different!), no docs. You still have to
> look at the implementations to understand what's going on.
> 
> I think what has actually changed (aside from the entire implementation)
> is just these three things:
> - we now allow multiple exclusive fences

This isn't really new, you could just attach a dma_fence_array already to
the exclusive slot. So not really new either.

> - exclusive was renamed to writer fences, shared to reader fences

Bit more context why I think this is a pure bikeshed: We've had (what at
least felt like) a multi-year bikeshed on what to call these, with the two
options writer/readers and exclusive/shared. Somehow (it's not documented,
hooray) we ended up going with exlusive/shared. Switching that over to the
other bikeshed again, still without documenting what exactly you should be
putting there (since amdgpu still doesn't always fill out the writer,
because that's not how amdgpu works), feels really silly.

> - there's a new "other" group, for ... otherwordly fences?

I guess this is to better handle the amdkfd magic fence, or the vm fences?
Still no idea since not used.

One other thing I've found while trying to figure out your motivation here
(since I'm not getting what you're aiming) is that setting the exclusive
fence through the old interface now sets both exclusive and shared fences.

I guess if that's all (I'm assuming I'm blind) we can just add a "give me
all the fences" interface, and use that for the drivers that want that.

> Afaiui we have the following to issues with the current fence semantics:
> - amdgpu came up with a totally different notion of implicit sync, using
>   the owner to figure out when to sync. I have no idea at all how that
>   meshes with multiple writers, but I guess there's a connection.
> - amdkfd does a very fancy eviction/preempt fence. Is that what the other
>   bucket is for?
> 
> I guess I could read the amdgpu/ttm code in very fine detail and figure
> this out, but I really don't see how that's moving stuff forward.
> 
> Also, I think it'd be really good to decouple semantic changes from
> implementation changes, because untangling them if we have to revert one
> or the other is going to be nigh impossible. And dma_* is not really an
> area where we can proudly claim that reverts don't happen.

I think we should go even further with this, and start earlier.

step 1: Document the current semantics.

Once we have that, we can look at the amdkfd and amdgpu vm stuff and
whatever else there is, and figure out what's missing. Maybe even throw in
the exact thing you're doign in amdkfd/gpu into the above documentation,
in an effort to cover what's done. I can add some entertaining things from
i915's side too :-)

And I mean actual real docs that explain stuff, not oneliner kerneldocs
for functions and that's it. Without that I think we'll just move in
circles and go nowhere at all.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
