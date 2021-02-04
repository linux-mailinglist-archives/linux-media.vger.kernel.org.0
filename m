Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2D6830F774
	for <lists+linux-media@lfdr.de>; Thu,  4 Feb 2021 17:17:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237893AbhBDQPX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Feb 2021 11:15:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237809AbhBDQOW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Feb 2021 11:14:22 -0500
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54AB6C061788
        for <linux-media@vger.kernel.org>; Thu,  4 Feb 2021 08:13:41 -0800 (PST)
Received: by mail-qv1-xf2d.google.com with SMTP id j13so1938140qvu.10
        for <linux-media@vger.kernel.org>; Thu, 04 Feb 2021 08:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AdINSrul0jxHoqpecjG/aK/AQPWXH0qinrJ7WDX/N1E=;
        b=LSpoU7cl9e2rbcOscAQCUF5oo82hFT76e1i/LCG7AK7ECCAQQyhw5yG5tM37foZKsk
         H54Jh5ed4262z7S8K+Sptq1JkJPJoqxQmTOvQrwnjbdRWfOb1qbiqGIMobiXg9XRukBF
         JNTNGWrj9ckaMtxW6dImW//QrCA1WpDxrnQ8+IoSnw07yPeyv38VA+yd7sGGG9dZFTNN
         1Dy8eV4djxhKz1j3aBgk6C5V1NuaDTpQ5nAzfMs3SbP8ldp1/2jR3k21+bR71zJJxaXP
         fwfWgNUuVcGDr5IoKRshNfCDMqs8vBVQ26IzhS+zw+VJgua7i/+PhXG/Fw8WQ/2lrfpD
         m92A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AdINSrul0jxHoqpecjG/aK/AQPWXH0qinrJ7WDX/N1E=;
        b=OAA+edWgAXXUg5/cVo+3A8UPQo6+szwa/jRixU8P+TjszI0lg+DPenYupXXxqYXJ7e
         +XG/jW2e3XqqsZauOxb47zzXsmMLtdg5IqxxfmL5I6/WoQxWUB0Qppq69SmSgvrFIkXU
         0071tzkd7XrhPuJr+0AUrgXI9TETaOssKhq7BOcr3DG/4Rrf+2hMi5L5Kc3LV9C5YKWe
         AcKyTkjvpCdarBKD6ufnxdixsdngm5SmY60dUH3Kf51JqH76rofsfvBupL3GeyFUHRZ2
         JN+PFqamQigYzdhNV1T8Mznn0AjoUO2OC46xgme+svykDrUXdOw/BLKsUCJ5D6uNuuk4
         x7qg==
X-Gm-Message-State: AOAM532ZlrBfF2mcME9Cjf35/JIiUQaTlPVYMuLD7tqh3axzc53tVfas
        CaKowrAH4XwyrL5x3psp4Rj5oQ==
X-Google-Smtp-Source: ABdhPJxBWYsGlh0GFUj59qT9H98NmLKj9wdXTx1MMs/HM8XRMtGVSw+252D9rCVYiNi7Je0P31XC2w==
X-Received: by 2002:a0c:e442:: with SMTP id d2mr6605975qvm.43.1612455220609;
        Thu, 04 Feb 2021 08:13:40 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-115-133.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.115.133])
        by smtp.gmail.com with ESMTPSA id x74sm5226993qkb.55.2021.02.04.08.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 08:13:40 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1l7hGF-003Un7-HK; Thu, 04 Feb 2021 12:13:39 -0400
Date:   Thu, 4 Feb 2021 12:13:39 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        John Stultz <john.stultz@linaro.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH] RFC: dma-buf: Require VM_SPECIAL vma for mmap
Message-ID: <20210204161339.GX4718@ziepe.ca>
References: <20210203211948.2529297-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210203211948.2529297-1-daniel.vetter@ffwll.ch>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Feb 03, 2021 at 10:19:48PM +0100, Daniel Vetter wrote:
> tldr; DMA buffers aren't normal memory, expecting that you can use
> them like that (like calling get_user_pages works, or that they're
> accounting like any other normal memory) cannot be guaranteed.
> 
> Since some userspace only runs on integrated devices, where all
> buffers are actually all resident system memory, there's a huge
> temptation to assume that a struct page is always present and useable
> like for any more pagecache backed mmap. This has the potential to
> result in a uapi nightmare.
> 
> To stop this gap require that DMA buffer mmaps are VM_SPECIAL, which
> blocks get_user_pages and all the other struct page based
> infrastructure for everyone. In spirit this is the uapi counterpart to
> the kernel-internal CONFIG_DMABUF_DEBUG.

Fast gup needs the special flag set on the PTE as well.. Feels weird
to have a special VMA without also having special PTEs?

Jason
