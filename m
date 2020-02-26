Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E84A16FB95
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2020 11:05:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727574AbgBZKFb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Feb 2020 05:05:31 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:36979 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726494AbgBZKFa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Feb 2020 05:05:30 -0500
Received: by mail-wr1-f68.google.com with SMTP id l5so2202512wrx.4
        for <linux-media@vger.kernel.org>; Wed, 26 Feb 2020 02:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Al3H6KZgkGIqfcdoyxiez7m9SAUTRWEuD27a6Q2autQ=;
        b=j0M98yjaogcYjsgzW0y5ZqhH0fbl9VDStEvkaeoC/Q8KpdrZBUdsjqGDvtlGHy73Yv
         MbhkBqhePnuoVrcclW+uiVBJNmeFp5GrtpeC47jAkJa/XoMRzzcdwu/+jc3KPbbb7QYN
         s7YEp+3QBxlkwANz8hrslsSbxbtlszU3kIxWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=Al3H6KZgkGIqfcdoyxiez7m9SAUTRWEuD27a6Q2autQ=;
        b=svAVbHqeOFY4rKgpkWxfkkxtgvOzUKD+7uxtKCn1D844u74oX/ZmBVNqnPC8Vsr37s
         wpougeEolVv8rTt5qVJLUs813VPX9ggk/l1G4ILkwPXxrpGOZS//cb7F/rVYcENrPLOd
         Fi/F/pXjTbfbU9J9cPeLr7VkzVcY7/7DpgFjKwrgfhlpghQVbYnG1MpA8da2cy4zeG4c
         JLmNTc9m54xSOBzpAo40aumPEClEQwe78Cc1THflzxnNwOX0ooaxbDomjzFCM0LhdV3Y
         g0y6V4AqOgr1HcjnZFNoo0ZK7q1jgll8svUVOMkqHODa7mHB4jUeeX8+y+UGw2ng2ytu
         Um0w==
X-Gm-Message-State: APjAAAWV40Yk4kLW9DTlkzX8YXo3qmKdcRr38e0P77CE6yibn7a1i9OS
        jwUysrs+lXPAe6IuppVfw7Sy3Q==
X-Google-Smtp-Source: APXvYqx4YFv94SVwpTw1EAbdnPvzNbZqxL94kJt3jNH24FAyl1JpVrm+58bVHWDTC6hYHA1gQNGYMQ==
X-Received: by 2002:adf:a114:: with SMTP id o20mr3560754wro.7.1582711526516;
        Wed, 26 Feb 2020 02:05:26 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id w1sm2607819wro.72.2020.02.26.02.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 02:05:25 -0800 (PST)
Date:   Wed, 26 Feb 2020 11:05:23 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc:     Jason Ekstrand <jason@jlekstrand.net>, airlied@redhat.com,
        daniel.vetter@ffwll.ch, jessehall@google.com, jajones@nvidia.com,
        bas@basnieuwenhuizen.nl, daniels@collabora.com,
        hoegsberg@google.com, Sumit Semwal <sumit.semwal@linaro.org>,
        Chenbo Feng <fengc@google.com>,
        Greg Hackmann <ghackmann@google.com>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RFC: dma-buf: Add an API for importing and exporting
 sync files
Message-ID: <20200226100523.GQ2363188@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Jason Ekstrand <jason@jlekstrand.net>, airlied@redhat.com,
        jessehall@google.com, jajones@nvidia.com, bas@basnieuwenhuizen.nl,
        daniels@collabora.com, hoegsberg@google.com,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Chenbo Feng <fengc@google.com>,
        Greg Hackmann <ghackmann@google.com>, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-kernel@vger.kernel.org
References: <20200225235856.975366-1-jason@jlekstrand.net>
 <8066d8b2-dd6a-10ef-a7bb-2c18a0661912@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8066d8b2-dd6a-10ef-a7bb-2c18a0661912@amd.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Feb 26, 2020 at 10:16:05AM +0100, Christian König wrote:
> Hi Jason,
> 
> Am 26.02.20 um 00:58 schrieb Jason Ekstrand:
> > Explicit synchronization is the future.  At least, that seems to be what
> > most userspace APIs are agreeing on at this point.  However, most of our
> > Linux APIs (both userspace and kernel UAPI) are currently built around
> > implicit synchronization with dma-buf.  While work is ongoing to change
> > many of the userspace APIs and protocols to an explicit synchronization
> > model, switching over piecemeal is difficult due to the number of
> > potential components involved.  On the kernel side, many drivers use
> > dma-buf including GPU (3D/compute), display, v4l, and others.  In
> > userspace, we have X11, several Wayland compositors, 3D drivers, compute
> > drivers (OpenCL etc.), media encode/decode, and the list goes on.
> > 
> > This patch provides a path forward by allowing userspace to manually
> > manage the fences attached to a dma-buf.  Alternatively, one can think
> > of this as making dma-buf's implicit synchronization simply a carrier
> > for an explicit fence.  This is accomplished by adding two IOCTLs to
> > dma-buf for importing and exporting a sync file to/from the dma-buf.
> > This way a userspace component which is uses explicit synchronization,
> > such as a Vulkan driver, can manually set the write fence on a buffer
> > before handing it off to an implicitly synchronized component such as a
> > Wayland compositor or video encoder.  In this way, each of the different
> > components can be upgraded to an explicit synchronization model one at a
> > time as long as the userspace pieces connecting them are aware of it and
> > import/export fences at the right times.
> > 
> > There is a potential race condition with this API if userspace is not
> > careful.  A typical use case for implicit synchronization is to wait for
> > the dma-buf to be ready, use it, and then signal it for some other
> > component.  Because a sync_file cannot be created until it is guaranteed
> > to complete in finite time, userspace can only signal the dma-buf after
> > it has already submitted the work which uses it to the kernel and has
> > received a sync_file back.  There is no way to atomically submit a
> > wait-use-signal operation.  This is not, however, really a problem with
> > this API so much as it is a problem with explicit synchronization
> > itself.  The way this is typically handled is to have very explicit
> > ownership transfer points in the API or protocol which ensure that only
> > one component is using it at any given time.  Both X11 (via the PRESENT
> > extension) and Wayland provide such ownership transfer points via
> > explicit present and idle messages.
> > 
> > The decision was intentionally made in this patch to make the import and
> > export operations IOCTLs on the dma-buf itself rather than as a DRM
> > IOCTL.  This makes it the import/export operation universal across all
> > components which use dma-buf including GPU, display, v4l, and others.
> > It also means that a userspace component can do the import/export
> > without access to the DRM fd which may be tricky to get in cases where
> > the client communicates with DRM via a userspace API such as OpenGL or
> > Vulkan.  At a future date we may choose to add direct import/export APIs
> > to components such as drm_syncobj to avoid allocating a file descriptor
> > and going through two ioctls.  However, that seems to be something of a
> > micro-optimization as import/export operations are likely to happen at a
> > rate of a few per frame of rendered or decoded video.
> > 
> > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > ---
> > 
> > This is marked as an RFC because I intend it to start a discussion about
> > how to solve a problem.  The current patch compiles but that's it for now.
> > I'll be writing IGT tests and Vulkan driver patches which exercise it over
> > the next couple of days.  In the mean time, feel free to tell me why you
> > think this is a great and/or terrible idea. :-)
> 
> For the exporting part I think it is an absolutely great idea because it
> simplifies compatibility with explicit sync quite a bit.
> 
> But for the importing part it is a clear NAK at the moment. See we can't
> allow userspace to mess with DMA-buf fences in that way because it rips open
> a security hole you can push an elephant through.
> 
> Just imagine that you access some DMA-buf with a shader and that operation
> is presented as a fence on the DMA-bufs reservation object. And now you can
> go ahead and replace that fence and free up the memory.
> 
> Tricking the Linux kernel into allocating page tables in that freed memory
> is trivial and that's basically it you can overwrite page tables with your
> shader and gain access to all of system memory :)
> 
> What we could do is to always make sure that the added fences will complete
> later than the already existing ones, but that is also rather tricky to get
> right. I wouldn't do that if we don't have a rather big use case for this.

I think the main use-case for adding a fence is adding a write fence for
vk winsys buffers, which run without any sync at all. So essentially what
we'd do is promote one of the read fences which are already attached to be
the write fence.

But yeah making sure we don't break any of the dma_resv guarantees about
how these fences works is going to be somewhat tricky. Probably can reuse
a big chunk of the fence container work we've done for syncobj timelines,
since they have some of the same issues of having to chain fences to not
break the world.
-Daniel

> 
> Regards,
> Christian.
> 
> > 
> > --Jason
> [SNIP]

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
