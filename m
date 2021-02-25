Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F612324E87
	for <lists+linux-media@lfdr.de>; Thu, 25 Feb 2021 11:50:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235097AbhBYKtB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Feb 2021 05:49:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233765AbhBYKqa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Feb 2021 05:46:30 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C489C061574
        for <linux-media@vger.kernel.org>; Thu, 25 Feb 2021 02:45:47 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id n4so2957844wmq.3
        for <linux-media@vger.kernel.org>; Thu, 25 Feb 2021 02:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=3idtwS6zYmBRk0u2V+/NLyjIX5bD4fwV71S/p31/Emk=;
        b=GY2kulOW8cXMjk6JFjNY+kK4D0HnSV/CRAjloRweHgCc60nXzEPiSlW9Y7rbNpdmGv
         TGCH9qNwv8zEUUnjcgDGLf5AoImmiBhF3hUPKbvfSz2vXQcl2wI33AuaEqppJvxhdWdM
         rMecDg/tiLISxBtWnG62/bS4yLn6+Xrf8myeg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=3idtwS6zYmBRk0u2V+/NLyjIX5bD4fwV71S/p31/Emk=;
        b=F7nXZytbqb4NwSA1GbSytwVcdOShfsDehFnAaFLzKYpj8YO8PJwH0uSi6Mu9SGzaiW
         F1J+aNxgAaQpe3uATiGLEED3JLfUKVdgpGeh6/a5EiRHDgetVOZG/0e2NcemD9kKQV+O
         yjPcFZVKRCyZ9hW7m2H73UGsXIzPqNaRZqLQ3BBq2HB+lLL6VgaSwXloo9R+79Zah1gm
         tWQ4g9QIwXCSJjHpd3BT5ebuRtFDoOWnSNdu7qYGOotmYkp/llMAncWQcwvHD1yNBzDj
         y4kneDWX716+TMpdmjbZc+o72yXl0LOgaN/Lg4sXRRM/VhieI838auiz/Nmapg/bnH8v
         YRWg==
X-Gm-Message-State: AOAM532trRuKTXULuv3a5rsIKzPg/HoB/7wOj0AVuWykyM/WESFgyE1j
        t+X2Giz34bkoXH2co+ka4f4lKw==
X-Google-Smtp-Source: ABdhPJxiL7xIc7cnoY5mDWFeLwU9JFNqQVi3g5zMbx77RZ3f+ZhOBSDI2s6aRAhBEpxtlkq3F4PzzA==
X-Received: by 2002:a05:600c:350a:: with SMTP id h10mr2644384wmq.142.1614249945915;
        Thu, 25 Feb 2021 02:45:45 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id a14sm9232064wrg.84.2021.02.25.02.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 02:45:45 -0800 (PST)
Date:   Thu, 25 Feb 2021 11:45:43 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc:     Jason Gunthorpe <jgg@ziepe.ca>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Thomas =?iso-8859-1?Q?Hellstr=F6m_=28Intel=29?= 
        <thomas_os@shipmail.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Matthew Wilcox <willy@infradead.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Suren Baghdasaryan <surenb@google.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] dma-buf: Require VM_PFNMAP vma for
 mmap
Message-ID: <YDd/1xvDoctHWgdD@phenom.ffwll.local>
References: <20210223105951.912577-1-daniel.vetter@ffwll.ch>
 <1a7c2295-6241-f2bf-4a78-6cadd43bc248@shipmail.org>
 <CAKMK7uHzRb6Q_LgPUrrHn18sorYo7ysTgB+PNE36LDUUsJpHDg@mail.gmail.com>
 <20210224184657.GR2643399@ziepe.ca>
 <b364d7e9-b323-e590-359d-32e067f3f5ee@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b364d7e9-b323-e590-359d-32e067f3f5ee@amd.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Feb 25, 2021 at 11:30:23AM +0100, Christian König wrote:
> 
> 
> Am 24.02.21 um 19:46 schrieb Jason Gunthorpe:
> > On Wed, Feb 24, 2021 at 09:45:51AM +0100, Daniel Vetter wrote:
> > 
> > > Hm I figured everyone just uses MAP_SHARED for buffer objects since
> > > COW really makes absolutely no sense. How would we enforce this?
> > In RDMA we test
> > 
> > drivers/infiniband/core/ib_core_uverbs.c:       if (!(vma->vm_flags & VM_SHARED))
> > 
> > During mmap to reject use of MAP_PRIVATE on BAR pages.
> 
> That's a really good idea. MAP_PRIVATE and any driver mappings doesn't
> really work at all.

Yeah I feel like this is the next patch we need to add on this little
series of locking down dma-buf mmap semantics. Probably should also push
these into drm gem mmap code (and maybe ttm can switch over to that, it's
really the same).

One at a time.
-Daniel
> 
> Christian.
> 
> > 
> > Jason
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
