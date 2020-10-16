Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7719F29096E
	for <lists+linux-media@lfdr.de>; Fri, 16 Oct 2020 18:13:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409841AbgJPQNZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Oct 2020 12:13:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2409713AbgJPQNY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Oct 2020 12:13:24 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 503FEC061755
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2020 09:13:23 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id m17so4564220ioo.1
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2020 09:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=SzfzkDBitQIi0dWl8hQ69VYetsUqJh1EpiO/PjfBVJ4=;
        b=jYFxSj0G8MEyNA6azgjTlI3p9WfsDHDEmQs6T3SvBZ2nPAHKqlNsKge/SQ531tHmcc
         AKcp/SO2BB1Fkw4uqOgO4xPcvAuls/is8lUdMvYQC/f3NKFiu0nmtm+Bn/y3IMI27SdB
         EVv/SiDOsylMgzjjUSuVh2dBkVf+OTtUjnLp3EDWRYIFPsNAVbZ7XEPR1ge5yEo9tPvw
         1/WhhUZywzgh4WCtd9LFge+gy+I3UA6EWus/7VeckFhN9Wh36+DPxt+JU+rla7OrDvof
         UEOc4BTCnqfvCbZ6fIrXvMvG72jUwxm1v/fpGdA22meHccsaDiS5CqNvbuhFAWPV/aO9
         7jZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=SzfzkDBitQIi0dWl8hQ69VYetsUqJh1EpiO/PjfBVJ4=;
        b=R5EQbrjTqX6Cm/ufhHynKlQQUcVnI9cctZctL+DV4P/mjD9DVNymOOCS11hGg5721/
         0qvteeZc/5CQFX9Idl1xOk/c+q+3bsh7fMbFaVCphdI7fGvU7hY7eCH5VXsd06LBIBno
         ivpm44XLi0KcnnKOFL1mQnqXTDU2q9Ag6cgs+2CEazOtDCYrb9CTBDtRj9apo6ARfCpN
         LWBQtTHYd9rIVcw1/G98GhgXuP9DdezHABkJOynbysRMdQ4/s1pmQtobOa5mGWpr1KJ1
         OWc316q9YzMRwIBefqQb3QSNDgxDb0sZMosGfqm0hjjMgk/5SgEVV3bHGAR536F80MQv
         ANYg==
X-Gm-Message-State: AOAM533WP7Hfv5xbPnVtYJW5wdNqB3ofEMTDAa6zyWRTuxmqZb18avfj
        0Z4s0EORlt+DU60+WYYMYqloHw==
X-Google-Smtp-Source: ABdhPJzTc2rLvv4IerCZW/tHbEy8NKIi/ATblrGysyjzLvEYe0ppftMeHbv9aVUT0VxOy6SpaKvMQQ==
X-Received: by 2002:a02:b80f:: with SMTP id o15mr3153369jam.103.1602864802734;
        Fri, 16 Oct 2020 09:13:22 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id g17sm2378255ilq.15.2020.10.16.09.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 09:13:22 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kTSM5-000edC-4i; Fri, 16 Oct 2020 13:13:21 -0300
Date:   Fri, 16 Oct 2020 13:13:21 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>
Cc:     akpm@linux-foundation.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        chris@chris-wilson.co.uk, airlied@redhat.com, daniel@ffwll.ch,
        sumit.semwal@linaro.org, willy@infradead.org, jhubbard@nvidia.com,
        linmiaohe@huawei.com
Subject: Re: [PATCH 2/2] mm: introduce vma_set_file function v4
Message-ID: <20201016161321.GF36674@ziepe.ca>
References: <20201012085203.56119-1-christian.koenig@amd.com>
 <20201012085203.56119-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201012085203.56119-2-christian.koenig@amd.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 12, 2020 at 10:52:03AM +0200, Christian König wrote:
> Add the new vma_set_file() function to allow changing
> vma->vm_file with the necessary refcount dance.
> 
> v2: add more users of this.
> v3: add missing EXPORT_SYMBOL, rebase on mmap cleanup,
>     add comments why we drop the reference on two occasions.
> v4: make it clear that changing an anonymous vma is illegal.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch> (v2)
> ---
>  drivers/dma-buf/dma-buf.c                  |  3 +--
>  drivers/gpu/drm/etnaviv/etnaviv_gem.c      |  4 +---
>  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c |  3 +--
>  drivers/gpu/drm/i915/gem/i915_gem_mman.c   |  5 +++--
>  drivers/gpu/drm/msm/msm_gem.c              |  4 +---
>  drivers/gpu/drm/omapdrm/omap_gem.c         |  3 +--
>  drivers/gpu/drm/vgem/vgem_drv.c            |  3 +--
>  drivers/staging/android/ashmem.c           |  6 +++---
>  include/linux/mm.h                         |  2 ++
>  mm/mmap.c                                  | 12 ++++++++++++
>  10 files changed, 26 insertions(+), 19 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
