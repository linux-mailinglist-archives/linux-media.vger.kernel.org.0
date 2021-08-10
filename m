Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2144B3E55AE
	for <lists+linux-media@lfdr.de>; Tue, 10 Aug 2021 10:40:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233318AbhHJIko (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Aug 2021 04:40:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231860AbhHJIko (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Aug 2021 04:40:44 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B63AC061798
        for <linux-media@vger.kernel.org>; Tue, 10 Aug 2021 01:40:22 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id m12so25132781wru.12
        for <linux-media@vger.kernel.org>; Tue, 10 Aug 2021 01:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=cKbU9FcikmLQJ8ei5FqM01XsNg7Lhvb/CqBLRSs+e6Y=;
        b=dyIuT2n2VcPiM/RBZyvglfDmYnDB6Khh/nbdE68r8gYpY/a2NOrDaGfZLTs1W/+53t
         vXS/cZ/tC1I9/7dqHtnrmgMvWpGq9dGx95D1TIug5tn0JH7x68v/1Ix3ehVQ3mzJinRI
         GUr9/F01AqBZbk8e0i4kbq2w26FwQ6BX+66Fo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=cKbU9FcikmLQJ8ei5FqM01XsNg7Lhvb/CqBLRSs+e6Y=;
        b=oK8CXEzlXKyHWAiBj+Dd5Cnk/tv0hsZHBRWElXyH/qmnFr1gEvXwhD7xEbfv+1KBGd
         9mFGoYrT/WwR1ohz21ZcaG4KGxJAWYnyXo0ceNRvmoEEKgLEYo+doLq0lpX3QvFvpTjA
         hYkLgUvCWxCIgknB0fLD9o5W6fm6dHO6IhFrz8Uab0DAacp5lH793Vz/EOiGd3dDjrkL
         o/DylAIDXPSC0tvK5c6i497EBRhUdp0mSKSsgfCWTWaDiJR6E+Gt9f3/copGAWOxegeK
         nDfGexV56mxhfJJpKTdWKPqZ1HxVVxnu2D0fBorBV/1xt/qe3cy6i8EfIQtzySnlUZ8P
         Qhcw==
X-Gm-Message-State: AOAM531dtS/np5uXosoJLqwqLMRy91JKbJZMaBrdErbSlj2VIXXxmblt
        RUvscj+pfv495xPjGelSmoiUmw==
X-Google-Smtp-Source: ABdhPJza6SgqUQMLMWRHmcm7FQ9wXAO72W40L4Idi8UXF8r5IQoBj3uhgCeKhzBt6M/C31Jpx7GRDw==
X-Received: by 2002:adf:ee4e:: with SMTP id w14mr29754692wro.15.1628584821138;
        Tue, 10 Aug 2021 01:40:21 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id c15sm22801342wrw.93.2021.08.10.01.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 01:40:20 -0700 (PDT)
Date:   Tue, 10 Aug 2021 10:40:18 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Sumit Semwal <sumit.semwal@linaro.org>
Cc:     Hridya Valsaraju <hridya@google.com>,
        John Stultz <john.stultz@linaro.org>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@redhat.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        linux-media <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Android Kernel Team <kernel-team@android.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] dma-buf: heaps: Set allocation limit for system heap
Message-ID: <YRI7cqWXM545iMzO@phenom.ffwll.local>
Mail-Followup-To: Sumit Semwal <sumit.semwal@linaro.org>,
        Hridya Valsaraju <hridya@google.com>,
        John Stultz <john.stultz@linaro.org>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@redhat.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        linux-media <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Android Kernel Team <kernel-team@android.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20210722190747.1986614-1-hridya@google.com>
 <CALAqxLVLMt7rbJBQtFBw-ikBAjKrVgfS8=Nu6NFQbp_gq1m22Q@mail.gmail.com>
 <CA+wgaPOQmY4H9n302YspKuLk9iq9vBzdWBTu19EUUsiQYTUOzQ@mail.gmail.com>
 <CAO_48GFS5SsdNCwOp6Jb+nmZJ+SdNkQkq628VhxXRGSLVeP0Yg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAO_48GFS5SsdNCwOp6Jb+nmZJ+SdNkQkq628VhxXRGSLVeP0Yg@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Aug 10, 2021 at 01:54:41PM +0530, Sumit Semwal wrote:
> Hi Hridya,
> 
> Apologies for the delay in responding.
> 
> On Wed, 4 Aug 2021 at 03:09, Hridya Valsaraju <hridya@google.com> wrote:
> 
> > On Mon, Aug 2, 2021 at 7:18 PM John Stultz <john.stultz@linaro.org> wrote:
> > >
> > > On Thu, Jul 22, 2021 at 12:07 PM Hridya Valsaraju <hridya@google.com>
> > wrote:
> > > > This patch limits the size of total memory that can be requested in a
> > > > single allocation from the system heap. This would prevent a
> > > > buggy/malicious client from depleting system memory by requesting for
> > an
> > > > extremely large allocation which might destabilize the system.
> > > >
> > > > The limit is set to half the size of the device's total RAM which is
> > the
> > > > same as what was set by the deprecated ION system heap.
> > > >
> > > > Signed-off-by: Hridya Valsaraju <hridya@google.com>
> > >
> > > Seems sane to me, unless folks have better suggestions for allocation
> > limits.
> > >
> > > Reviewed-by: John Stultz <john.stultz@linaro.org>
> >
> > Thank you for taking a look John!
> >
> Looks good to me; I will apply it to drm-misc today.

Please don't, this doesn't really solve anything:
- it's easy to bypass, just allocate more buffers to get over the limit
- resource limit plan is cgroups, not hand-rolled limits in every
  allocator
- the ttm "max half of system memory" is for pinned memory, to work around
  locking inversion issues between dma_resv_lock and core mm shrinkers. It
  does not actually impose an overall allocation limit, you can allocate
  ttm bo until your entire memory (and swap) are full. Christian König has
  merged a patch set to lift this by reworking the shrinker interaction,
  but it had to be reverted again because of some fallout I can't remember
  offhand. dma_resv_lock vs shrinkers is very tricky.

So if you want resource limits then you really want cgroups here.

Cheers, Daniel

> 
> 
> >
> > Regards,
> > Hridya
> >
> > >
> > > thanks
> > > -john
> >
> Best,
> Sumit.
> 
> -- 
> Thanks and regards,
> 
> Sumit Semwal (he / him)
> Tech Lead - LCG, Vertical Technologies
> Linaro.org │ Open source software for ARM SoCs

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
