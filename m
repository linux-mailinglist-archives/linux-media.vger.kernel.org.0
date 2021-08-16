Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 969AC3ED963
	for <lists+linux-media@lfdr.de>; Mon, 16 Aug 2021 17:01:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232608AbhHPPCR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Aug 2021 11:02:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232467AbhHPPCQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Aug 2021 11:02:16 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB900C0613C1
        for <linux-media@vger.kernel.org>; Mon, 16 Aug 2021 08:01:44 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id q11-20020a7bce8b0000b02902e6880d0accso15309671wmj.0
        for <linux-media@vger.kernel.org>; Mon, 16 Aug 2021 08:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=EIvyFOw8mvTuFM5hQZVVCU0qrPNdbh5I2Bj4X1kA7WQ=;
        b=gaIEOtqqYuS833blYihl+7Iw8shk8qt6AL+mzGViyi8f8QC+lwDDgt2IPH0q/+dU1H
         7bt+Sommo3MR9FY/VLoTpOo31XeUdpFogGaA5qZ+DqMM99khdni6FgnfyUVd+TFjIo38
         JMiVpBCDkbCHGobEnCzL8wiQge+z3+GJsAPmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=EIvyFOw8mvTuFM5hQZVVCU0qrPNdbh5I2Bj4X1kA7WQ=;
        b=HtkfRko9wrZcgwtPMCI3FWpQAbnzctqti9KTGP5rMzg5uH2YYonkkWCGoumAG2fgel
         NMikufnfH8HECZ1kB6Ew2mXtOQJThR7U/8cmq6cmUUny8IkG1orV8wTJXmg9BTkH0EPo
         5jEgvoJkfk+wmGX3ZkFxFdS/Zni+npHsosJXZ7jjDm1HDcwJOtj4T1aGmUhdt/8vKAtX
         L9LkWOp+n94fJMJh7jZ4V+30tMFKs1UWv+zyA34zi3fGlvgyfCZ0M3QQMKp+2LKuK6tT
         ofj05j0MSnGfk7sXxLiGQnyFuTxf1ThgVuBXDuOFEV+mo6B3B3Nxp58CHFMhZ4+ZE/ur
         8oqw==
X-Gm-Message-State: AOAM531HnHmp0fPi3wvWwLvfyPbDcC6SfDBI6W8MhdhqWiMW+CoZlECF
        IDUsU1YCVxYwpRrPtnsz6IrDHQ==
X-Google-Smtp-Source: ABdhPJzDF9KrfED8TEN39f2b9tbP/JkFe6bbQZq2+vcczHGvaS+YoEUQW9Mj8qPAjLla1rzX+sS+zA==
X-Received: by 2002:a1c:9ace:: with SMTP id c197mr15858085wme.170.1629126103289;
        Mon, 16 Aug 2021 08:01:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id y3sm11936525wma.32.2021.08.16.08.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 08:01:42 -0700 (PDT)
Date:   Mon, 16 Aug 2021 17:01:40 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Paul Cercueil <paul@crapouillou.net>,
        Michael Hennerich <Michael.Hennerich@analog.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        Alexandru Ardelean <ardeleanalex@gmail.com>,
        io-uring@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [Linaro-mm-sig] IIO, dmabuf, io_uring
Message-ID: <YRp91OUTpjpw7rnE@phenom.ffwll.local>
Mail-Followup-To: Christoph Hellwig <hch@lst.de>,
        Paul Cercueil <paul@crapouillou.net>,
        Michael Hennerich <Michael.Hennerich@analog.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        Alexandru Ardelean <ardeleanalex@gmail.com>,
        io-uring@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
        linux-media@vger.kernel.org
References: <2H0SXQ.2KIK2PBVRFWH2@crapouillou.net>
 <20210814073019.GC21175@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210814073019.GC21175@lst.de>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Aug 14, 2021 at 09:30:19AM +0200, Christoph Hellwig wrote:
> On Fri, Aug 13, 2021 at 01:41:26PM +0200, Paul Cercueil wrote:
> > Hi,
> >
> > A few months ago we (ADI) tried to upstream the interface we use with our 
> > high-speed ADCs and DACs. It is a system with custom ioctls on the iio 
> > device node to dequeue and enqueue buffers (allocated with 
> > dma_alloc_coherent), that can then be mmap'd by userspace applications. 
> > Anyway, it was ultimately denied entry [1]; this API was okay in ~2014 when 
> > it was designed but it feels like re-inventing the wheel in 2021.
> >
> > Back to the drawing table, and we'd like to design something that we can 
> > actually upstream. This high-speed interface looks awfully similar to 
> > DMABUF, so we may try to implement a DMABUF interface for IIO, unless 
> > someone has a better idea.
> 
> To me this does sound a lot like a dma buf use case.  The interesting
> question to me is how to signal arrival of new data, or readyness to
> consume more data.  I suspect that people that are actually using
> dmabuf heavily at the moment (dri/media folks) might be able to chime
> in a little more on that.

One option is to just block in userspace (on poll, or an ioctl, or
whatever) and then latch the next stage in the pipeline. That's what media
does right now (because the dma-fence proposal never got anywhere).

In drm we use dma_fences to tie up the stages, and the current
recommendation for uapi is to use the drm_syncobj container (not the
sync_file container, that was a bit an awkward iteration on that problem).
With that you can tie together all the pipeline stages within the kernel
(and at least sometimes directly in hw).

The downside is (well imo it's not a downside, but some people see it as
hta) that once you use dma-fence dri-devel folks really consider your
stuff a gpu driver and expect all the gpu driver review/merge criteria to
be fulfilled. Specifically about the userspace side too:

https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-userspace-requirements

At least one driver is trying to play some very clever games here and
that's not a solid way to make friends ...
-Daniel

> 
> > Our first usecase is, we want userspace applications to be able to dequeue 
> > buffers of samples (from ADCs), and/or enqueue buffers of samples (for 
> > DACs), and to be able to manipulate them (mmapped buffers). With a DMABUF 
> > interface, I guess the userspace application would dequeue a dma buffer 
> > from the driver, mmap it, read/write the data, unmap it, then enqueue it to 
> > the IIO driver again so that it can be disposed of. Does that sound sane?
> >
> > Our second usecase is - and that's where things get tricky - to be able to 
> > stream the samples to another computer for processing, over Ethernet or 
> > USB. Our typical setup is a high-speed ADC/DAC on a dev board with a FPGA 
> > and a weak soft-core or low-power CPU; processing the data in-situ is not 
> > an option. Copying the data from one buffer to another is not an option 
> > either (way too slow), so we absolutely want zero-copy.
> >
> > Usual userspace zero-copy techniques (vmsplice+splice, MSG_ZEROCOPY etc) 
> > don't really work with mmapped kernel buffers allocated for DMA [2] and/or 
> > have a huge overhead, so the way I see it, we would also need DMABUF 
> > support in both the Ethernet stack and USB (functionfs) stack. However, as 
> > far as I understood, DMABUF is mostly a DRM/V4L2 thing, so I am really not 
> > sure we have the right idea here.
> >
> > And finally, there is the new kid in town, io_uring. I am not very literate 
> > about the topic, but it does not seem to be able to handle DMA buffers 
> > (yet?). The idea that we could dequeue a buffer of samples from the IIO 
> > device and send it over the network in one single syscall is appealing, 
> > though.
> 
> Think of io_uring really just as an async syscall layer.  It doesn't
> replace DMA buffers, but can be used as a different and for some
> workloads more efficient way to dispatch syscalls.
> _______________________________________________
> Linaro-mm-sig mailing list
> Linaro-mm-sig@lists.linaro.org
> https://lists.linaro.org/mailman/listinfo/linaro-mm-sig

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
