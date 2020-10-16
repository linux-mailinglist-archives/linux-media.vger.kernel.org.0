Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF84A29096B
	for <lists+linux-media@lfdr.de>; Fri, 16 Oct 2020 18:13:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409430AbgJPQNN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Oct 2020 12:13:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406809AbgJPQNN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Oct 2020 12:13:13 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 406B4C061755
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2020 09:13:13 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id r4so4575709ioh.0
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2020 09:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=HoVWWsnJtF4ldfrPYdqvQFOpOJVhRuHffI82nRexcX8=;
        b=Jw6H43NWctaQWddG+pghAvq2p766POaPQK67OavH9mxQ2H9IpE074eMaq6fsdxm87u
         mYXexOncu0xIlG+cKVY1W4nYVRMtHcVLbnVI5ef52KknoCtpuRXs939C9jhj3B3QVAGP
         qfiE26X3OtR2LAb7NWdzedtO/V/g077FEU04FmbuSzrCBv/v9wW90J90qpihp8tcjaeB
         BMuwiJgKQny9OK6blmSzlTLIH1p+HFlRKXb7bO+x9vFGa38q/jaxdoIGKFnEIX4rMxBV
         Cp6qNmIpW8jf9j8J/TJSpcYFlWo65G2qZjzlvU/KYrv8Fq4w4DyRvZP1UTYbZ2JkzHfN
         983Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=HoVWWsnJtF4ldfrPYdqvQFOpOJVhRuHffI82nRexcX8=;
        b=knij5Ju2XPr2cJ9TRB2ZQU3WOWrZaXgRkS6zpwGS6hCzL/Km2c+YgyjbIGzQRH9pqW
         Z+xac05lcJ9SPvDOwTZ0Pb8ZZpcqYpCnC5Z5+TmiTUiyeFYjMPB3+xpNWHI3cyDze8cr
         eaVyfjQem5gFIg7f33Y5jQcCvqBZ32U4Skbsdtsx3mFh6bNa941WnY9xIi0CGals6AaY
         DIOJxmHZZoNurOLVPnqh1Ac7juHGdj6YNZ6WwQBvK4KHhGx3aIMDM2ctQmXrIBvjpN2R
         IlzLme2VlCC2S9B9Mu9tZVc+sv6hz0LbBrf6kC71YIaTMt6uHh40DTR9qaHlxffUoFzX
         45zA==
X-Gm-Message-State: AOAM533+arpVzjVMXa8BKpL4GI2TC/2UkrZx4rpfUPZuv8qazaPx/zwQ
        Pm15mC8D8gkyCA94zjk2VaFtLQ==
X-Google-Smtp-Source: ABdhPJwNXo7iyWJ77FT+/0CMo9tudCck82Xc2qlsaYhuPEdloUxNeSLOdR9y5ZI15zE7xNsqmPrhXQ==
X-Received: by 2002:a6b:b413:: with SMTP id d19mr3054559iof.10.1602864792525;
        Fri, 16 Oct 2020 09:13:12 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id m66sm2702327ill.69.2020.10.16.09.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 09:13:11 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kTSLu-000ecw-Lj; Fri, 16 Oct 2020 13:13:10 -0300
Date:   Fri, 16 Oct 2020 13:13:10 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>
Cc:     akpm@linux-foundation.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        chris@chris-wilson.co.uk, airlied@redhat.com, daniel@ffwll.ch,
        sumit.semwal@linaro.org, willy@infradead.org, jhubbard@nvidia.com,
        linmiaohe@huawei.com
Subject: Re: [PATCH 1/2] mm: mmap: fix fput in error path v2
Message-ID: <20201016161310.GE36674@ziepe.ca>
References: <20201012085203.56119-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201012085203.56119-1-christian.koenig@amd.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 12, 2020 at 10:52:02AM +0200, Christian König wrote:
> Patch "495c10cc1c0c CHROMIUM: dma-buf: restore args..."
> adds a workaround for a bug in mmap_region.
> 
> As the comment states ->mmap() callback can change
> vma->vm_file and so we might call fput() on the wrong file.
> 
> Revert the workaround and proper fix this in mmap_region.
> 
> v2: drop the extra if in dma_buf_mmap as well
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/dma-buf/dma-buf.c | 20 +++-----------------
>  mm/mmap.c                 |  2 +-
>  2 files changed, 4 insertions(+), 18 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Probably should Fixes that other patch Andrew pointed at

Jason
