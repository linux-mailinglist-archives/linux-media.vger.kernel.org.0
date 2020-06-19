Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 566802002A9
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2020 09:22:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730584AbgFSHWZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Jun 2020 03:22:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730599AbgFSHWW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Jun 2020 03:22:22 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61044C0613EF
        for <linux-media@vger.kernel.org>; Fri, 19 Jun 2020 00:22:22 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id j189so7605775oih.10
        for <linux-media@vger.kernel.org>; Fri, 19 Jun 2020 00:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DqEsfHHZMDjVjBSRzofGz02dqQOVqzrxROmLfkgGgfU=;
        b=A5HUcVec8RYu1bZm00Qb0nJy7vZOa/JILGkLgAuTZ8La1+bbfcPUqNdntXVxb3kR5C
         Pun8MPh8/elm4LjPbSFd8pHjYzxyAljbGO8JxS8ebVDq1mtIlkNyW1F1f57hRQ1lpcHC
         J28+KzCYOCc4U1wxOh8Jq++Bii/KSrEjFghhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DqEsfHHZMDjVjBSRzofGz02dqQOVqzrxROmLfkgGgfU=;
        b=hYFHwsu1vZhI96uvCk1FvLjTizbZ82hq8tuU/qTciqRWac+zoYodfJmuPXcnHNKtzN
         8dwKBq55aeelkroByrP/XXw6kE5BIzNqzjoI2xzr379JJuRBEdyTVBIcYGyDRX0DDyhb
         TraQk0YtHKF7XnXb5M3Dd6CmYrVPPzG8aDWydZFCPeP6zJWxWUSaJahmnANn3I+ulMa3
         ACHxxUo4lzAYZhJLaH+19SecJKjvqFocXVLY9Gbo6A6c1U7mzkucD5nRUXmNTG2VaSXb
         Z8RoNpal99BspQa4noERLgfQ50kdQraNlSoC2HSj2jQsUOetLUatWRrMJvLW+7bICvkf
         WNSw==
X-Gm-Message-State: AOAM530s3lTQZgd550XILBdJkvASraB/aLu1BGqaj7aLXgD/cbxuITEA
        hRwHH/dhgJtBKhf9CUhH/S1Z7zoahbMNNyf6T078J/Vh
X-Google-Smtp-Source: ABdhPJzUUv7A3YRtNgpCeUlEiMcyk3Jq4GEcOu2c5HObmsMsz8k+i9bAqj56TkqNTZ0MhscUp+R1cXMiit1pfYTZUok=
X-Received: by 2002:aca:ad97:: with SMTP id w145mr2091861oie.128.1592551341034;
 Fri, 19 Jun 2020 00:22:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200604081224.863494-1-daniel.vetter@ffwll.ch>
 <20200604081224.863494-5-daniel.vetter@ffwll.ch> <b11c2140-1b9c-9013-d9bb-9eb2c1906710@shipmail.org>
 <20200611083430.GD20149@phenom.ffwll.local> <20200611141515.GW6578@ziepe.ca>
 <20200616120719.GL20149@phenom.ffwll.local> <CAKMK7uE7DKUo9Z+yCpY+mW5gmKet8ugbF3yZNyHGqsJ=e-g_hA@mail.gmail.com>
 <20200617152835.GF6578@ziepe.ca> <20200618150051.GS20149@phenom.ffwll.local> <20200618172338.GM6578@ziepe.ca>
In-Reply-To: <20200618172338.GM6578@ziepe.ca>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Fri, 19 Jun 2020 09:22:09 +0200
Message-ID: <CAKMK7uEbqTu4q-amkLXyd1i8KNtLaoO2ZFoGqYiG6D0m0FKpOg@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH 04/18] dma-fence: prime lockdep annotations
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     =?UTF-8?Q?Thomas_Hellstr=C3=B6m_=28Intel=29?= 
        <thomas_os@shipmail.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        linux-rdma <linux-rdma@vger.kernel.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        LKML <linux-kernel@vger.kernel.org>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Thomas Hellstrom <thomas.hellstrom@intel.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Mika Kuoppala <mika.kuoppala@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jun 19, 2020 at 8:58 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Thu, Jun 18, 2020 at 05:00:51PM +0200, Daniel Vetter wrote:
> > On Wed, Jun 17, 2020 at 12:28:35PM -0300, Jason Gunthorpe wrote:
> > > On Wed, Jun 17, 2020 at 08:48:50AM +0200, Daniel Vetter wrote:
> > >
> > > > Now my understanding for rdma is that if you don't have hw page fault
> > > > support,
> > >
> > > The RDMA ODP feature is restartable HW page faulting just like nouveau
> > > has. The classical MR feature doesn't have this. Only mlx5 HW supports
> > > ODP today.
> > >
> > > > It's only gpus (I think) which are in this awkward in-between spot
> > > > where dynamic memory management really is much wanted, but the hw
> > > > kinda sucks. Aside, about 10+ years ago we had a similar problem with
> > > > gpu hw, but for security: Many gpu didn't have any kinds of page
> > > > tables to isolate different clients from each another. drivers/gpu
> > > > fixed this by parsing&validating what userspace submitted to make sure
> > > > it's only every accessing its own buffers. Most gpus have become
> > > > reasonable nowadays and do have proper per-process pagetables (gpu
> > > > process, not the pasid stuff), but even today there's still some of
> > > > the old model left in some of the smallest SoC.
> > >
> > > But I still don't understand why a dma fence is needed inside the GPU
> > > driver itself in the notifier.
> > >
> > > Surely the GPU driver can block and release the notifier directly from
> > > its own command processing channel?
> > >
> > > Why does this fence and all it entails need to leak out across
> > > drivers?
> >
> > So 10 years ago we had this world of every gpu driver is its own bucket,
> > nothing leaks out to the world. But the world had a different idea how
> > gpus where supposed to work, with stuff like:
>
> Sure, I understand DMA fence, but why does a *notifier* need it?
>
> The job of the notifier is to guarentee that the device it is
> connected to is not doing DMA before it returns.
>
> That just means you need to prove that device is done with the buffer.
>
> As I've understood GPU that means you need to show that the commands
> associated with the buffer have completed. This is all local stuff
> within the driver, right? Why use fence (other than it already exists)

Because that's the end-of-dma thing. And it's cross-driver for the
above reasons, e.g.
- device A renders some stuff. Userspace gets dma_fence A out of that
(well sync_file or one of the other uapi interfaces, but you get the
idea)
- userspace (across process or just different driver) issues more
rendering for device B, which depends upon the rendering done on
device A. So dma_fence A is an dependency and will block this dma
operation. Userspace (and the kernel) gets dma_fence B out of this
- because unfortunate reasons, the same rendering on device B also
needs a userptr buffer, which means that dma_fence B is also the one
that the mmu_range_notifier needs to wait on before it can tell core
mm that it can go ahead and release those pages
- unhappiness ensues, because now the mmu notifier from device B can
get hung up on the dma operation device A is doing

If you want to avoid this either a) have less shitty hw (not an
option, gpus are gpus, it is slowly getting better though) or b) force
userspace to stall before handing over to next device (about as
uncool) or c) just pin all the memory always, who cares (also rather
unpopular, gpus tend to use all the memory they can get).

I guess the thing with gpus is that dma operations aren't like
read/writes for pretty much everything else, but essentially compute
contexts (usually implemented as ringbuffers where you stream stuff
into) with cross everything dependencies. This even holds within a
single gpu, since pretty much all modern gpus have multiple different
engines special on different things. And yup that's directly exposed
to userspace, for vulkan and other low-level gpu apis even directly to
applications. So dma operation for gpu isn't just "done when the
read/write finishes", but pulls in an entire chain of dependencies and
ordering that needs to happen before it can even start.

-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
