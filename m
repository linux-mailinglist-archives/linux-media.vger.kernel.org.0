Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F19140F77D
	for <lists+linux-media@lfdr.de>; Fri, 17 Sep 2021 14:30:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239203AbhIQMb3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Sep 2021 08:31:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235483AbhIQMb1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Sep 2021 08:31:27 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 660FCC061766
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 05:30:04 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id x6so14856998wrv.13
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 05:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=ohehD+AgX2cOYuT0Vdlc+XEexxlJP7h+rPjbbPGV0JI=;
        b=R10SS4VV0BCpiZybmOMrjaWEfv3d2ZD+2k6TYKYqIZCusUIZXiqYs5rTuV6bruYLls
         zYGmlZhSOPyZgErxGr8GftAAzypBiEQnXw94kdl46vb10zeP8O7zkrXWklJipXggLivr
         Ihoa4mj+eAbhnzb6QO020N9VvyKryVDicfnPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=ohehD+AgX2cOYuT0Vdlc+XEexxlJP7h+rPjbbPGV0JI=;
        b=SheCbzGmfy0GZh+HMZkwcv3t3kjeUIkXMjAdzmXXGtFgF9YfvQRPVfyVXol6gn+EQK
         MTWgzLa/TJ2Bp4+4gAdzMO+Q2wu83yrrZlJMMUVCwLE6wLkmAz/0yCYXU2/Lb08dd80b
         4+elQVwRky0674YmkgTaMhwBqHWMK5Kdtotq96I/3EkPOIhlHcnMQwfRUTCVKOF7mOKT
         9rnF50uNbZfE6gTHdYomn4nhvkcKMXNHJtaLhh4bEJgLycLgBVrYimSPRNFMAVf8Q3fr
         xYGc4QS9i2WdqbSW1/HA8xfGluFcifKtcwGQQxRcRcdc4AfOfgdR9b2DEcS+HN3Q6lrR
         Scgg==
X-Gm-Message-State: AOAM532oKW9lzcYsvPeZ2IkByaPKa2LWE7BD90657PYqfYfwaogiPScR
        2ewobFggCgXfy+lg+U5TzHwbbw==
X-Google-Smtp-Source: ABdhPJxbi7SvIHU6eF4mLO2NNjFKYkKbUTWnBTtOPShG0ZBGp4wQE5JGTFm/UZzjlZerlKL7ilx7Kg==
X-Received: by 2002:a05:6000:124b:: with SMTP id j11mr11906176wrx.147.1631881802837;
        Fri, 17 Sep 2021 05:30:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id z6sm6483202wmp.1.2021.09.17.05.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 05:30:02 -0700 (PDT)
Date:   Fri, 17 Sep 2021 14:30:00 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     Oded Gabbay <ogabbay@kernel.org>,
        "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Gal Pressman <galpress@amazon.com>,
        Yossi Leybovich <sleybo@amazon.com>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        linux-rdma <linux-rdma@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Doug Ledford <dledford@redhat.com>,
        Dave Airlie <airlied@gmail.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Leon Romanovsky <leonro@nvidia.com>,
        Christoph Hellwig <hch@lst.de>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>
Subject: Re: [PATCH v6 0/2] Add p2p via dmabuf to habanalabs
Message-ID: <YUSKSHBC9uI49wZZ@phenom.ffwll.local>
Mail-Followup-To: Jason Gunthorpe <jgg@ziepe.ca>,
        Oded Gabbay <ogabbay@kernel.org>,
        "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Gal Pressman <galpress@amazon.com>,
        Yossi Leybovich <sleybo@amazon.com>,
        Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
        linux-rdma <linux-rdma@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Doug Ledford <dledford@redhat.com>, Dave Airlie <airlied@gmail.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Leon Romanovsky <leonro@nvidia.com>, Christoph Hellwig <hch@lst.de>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>
References: <20210912165309.98695-1-ogabbay@kernel.org>
 <YUCvNzpyC091KeaJ@phenom.ffwll.local>
 <20210914161218.GF3544071@ziepe.ca>
 <CAFCwf13322953Txr3Afa_MomuD148vnfpEog0xzW7FPWH9=6fg@mail.gmail.com>
 <YUM5JoMMK7gceuKZ@phenom.ffwll.local>
 <20210916131014.GK3544071@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210916131014.GK3544071@ziepe.ca>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 16, 2021 at 10:10:14AM -0300, Jason Gunthorpe wrote:
> On Thu, Sep 16, 2021 at 02:31:34PM +0200, Daniel Vetter wrote:
> > On Wed, Sep 15, 2021 at 10:45:36AM +0300, Oded Gabbay wrote:
> > > On Tue, Sep 14, 2021 at 7:12 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > > >
> > > > On Tue, Sep 14, 2021 at 04:18:31PM +0200, Daniel Vetter wrote:
> > > > > On Sun, Sep 12, 2021 at 07:53:07PM +0300, Oded Gabbay wrote:
> > > > > > Hi,
> > > > > > Re-sending this patch-set following the release of our user-space TPC
> > > > > > compiler and runtime library.
> > > > > >
> > > > > > I would appreciate a review on this.
> > > > >
> > > > > I think the big open we have is the entire revoke discussions. Having the
> > > > > option to let dma-buf hang around which map to random local memory ranges,
> > > > > without clear ownership link and a way to kill it sounds bad to me.
> > > > >
> > > > > I think there's a few options:
> > > > > - We require revoke support. But I've heard rdma really doesn't like that,
> > > > >   I guess because taking out an MR while holding the dma_resv_lock would
> > > > >   be an inversion, so can't be done. Jason, can you recap what exactly the
> > > > >   hold-up was again that makes this a no-go?
> > > >
> > > > RDMA HW can't do revoke.
> > 
> > Like why? I'm assuming when the final open handle or whatever for that MR
> > is closed, you do clean up everything? Or does that MR still stick around
> > forever too?
> 
> It is a combination of uAPI and HW specification.
> 
> revoke here means you take a MR object and tell it to stop doing DMA
> without causing the MR object to be destructed.
> 
> All the drivers can of course destruct the MR, but doing such a
> destruction without explicit synchronization with user space opens
> things up to a serious use-after potential that could be a security
> issue.
> 
> When the open handle closes the userspace is synchronized with the
> kernel and we can destruct the HW objects safely.
> 
> So, the special HW feature required is 'stop doing DMA but keep the
> object in an error state' which isn't really implemented, and doesn't
> extend very well to other object types beyond simple MRs.

Yeah revoke without destroying the MR doesn't work, and it sounds like
revoke by destroying the MR just moves the can of worms around to another
place.

> > 1. User A opens gaudi device, sets up dma-buf export
> > 
> > 2. User A registers that with RDMA, or anything else that doesn't support
> > revoke.
> > 
> > 3. User A closes gaudi device
> > 
> > 4. User B opens gaudi device, assumes that it has full control over the
> > device and uploads some secrets, which happen to end up in the dma-buf
> > region user A set up
> 
> I would expect this is blocked so long as the DMABUF exists - eg the
> DMABUF will hold a fget on the FD of #1 until the DMABUF is closed, so
> that #3 can't actually happen.
> 
> > It's not mlocked memory, it's mlocked memory and I can exfiltrate
> > it.
> 
> That's just bug, don't make buggy drivers :)

Well yeah, but given that habanalabs hand rolled this I can't just check
for the usual things we have to enforce this in drm. And generally you can
just open chardevs arbitrarily, and multiple users fighting over each
another. The troubles only start when you have private state or memory
allocations of some kind attached to the struct file (instead of the
underlying device), or something else that requires device exclusivity.
There's no standard way to do that.

Plus in many cases you really want revoke on top (can't get that here
unfortunately it seems), and the attempts to get towards a generic
revoke() just never went anywhere. So again it's all hand-rolled
per-subsystem. *insert lament about us not having done this through a
proper subsystem*

Anyway it sounds like the code takes care of that.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
