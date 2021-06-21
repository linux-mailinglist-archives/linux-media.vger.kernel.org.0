Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85DF03AF94F
	for <lists+linux-media@lfdr.de>; Tue, 22 Jun 2021 01:29:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231680AbhFUXbc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Jun 2021 19:31:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231268AbhFUXba (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Jun 2021 19:31:30 -0400
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3F8EC061756
        for <linux-media@vger.kernel.org>; Mon, 21 Jun 2021 16:29:14 -0700 (PDT)
Received: by mail-qv1-xf2e.google.com with SMTP id h10so314000qvz.2
        for <linux-media@vger.kernel.org>; Mon, 21 Jun 2021 16:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WGIQy0LtKLkIE/rK0/0LmxIf0Yhw3y7s+bpYX0ZTb4E=;
        b=XkURmaeBNxY2KNIu+e3I7r7c8Mw2wNE/2QAVf2JLvg6H3Ao6a1CHuNZ3vZ9RBTFdKx
         H3HDY9NRafLjynlaVkG4PxqZXZk/v2PZSf4FNAtjAaDZ+6ONvHcsFIGONwVDeOf17HrF
         h4Z5tocnUYIAKpC3IQtgBEC1vGg2T8esb9cF9sxkRyXpR+nn2OjKipQdc2qiNBCYtMp5
         8yt3ntQEIkDMB6fEEsB9d5jku+rDz/qbvQ2tZqk6+/0aRqBqq05Onc+pKKb0R8HJo8Ai
         55y54osBIrECu/xwViWlwG2EaBg82LCP+kuA9VXzH9FS9l7AMz909JQzyaOkpt0gKptG
         0naA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WGIQy0LtKLkIE/rK0/0LmxIf0Yhw3y7s+bpYX0ZTb4E=;
        b=CmHVw1r3iD6jgrR9h01sc651RKybepPy6myXG+m4CeP8m7HtZOQyFj6zROIZOOJ5k6
         zzTddLQzt5I13z1FqpcVaFfAXCZFcM6gdVpBfH88h3Qsi+FkMrVkgVct2beJdglzd9Hr
         T7Y+7NAPrDuhzkkiwE6FdZXXMPZ9Vq76bq8UlOLQLTlN3mCzyq9x2eNGOwKml4ae8Bob
         33cNl5T/nRYyXEeZXVgZ6x1gP3vjgUy1vZ5leeIn1ZL2uutg8yekNspAv2rhwTkXHwO8
         PEjfEausWNoRbAZjI7WIZiywWK7OM6AMpA7AbAwAeNJRxmxk7cvXV0VOQln7MoZpDMyO
         loSw==
X-Gm-Message-State: AOAM532RSP5T5HxF9rm/EwQakBXxGkS9ZZBaHcOKltXq+MkrTmrHo+To
        VVQq7rGoNNDy25bBNiEuR06X2g==
X-Google-Smtp-Source: ABdhPJzRTPsxAjXcsN31fYToN1kshtwgii2JxLBC8O2dnJ4kI8UL0Km8hvy0yekYsKCtQzKfourLAQ==
X-Received: by 2002:a0c:fd44:: with SMTP id j4mr22797061qvs.12.1624318153681;
        Mon, 21 Jun 2021 16:29:13 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-113-94.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.113.94])
        by smtp.gmail.com with ESMTPSA id t30sm10969084qkm.11.2021.06.21.16.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 16:29:13 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1lvTLs-009tun-DJ; Mon, 21 Jun 2021 20:29:12 -0300
Date:   Mon, 21 Jun 2021 20:29:12 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Oded Gabbay <oded.gabbay@gmail.com>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Greg KH <gregkh@linuxfoundation.org>,
        Oded Gabbay <ogabbay@kernel.org>,
        linux-rdma <linux-rdma@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>, Doug Ledford <dledford@redhat.com>,
        "airlied@gmail.com" <airlied@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Gal Pressman <galpress@amazon.com>, sleybo@amazon.com,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Tomer Tayar <ttayar@habana.ai>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Leon Romanovsky <leonro@nvidia.com>,
        Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v3 1/2] habanalabs: define uAPI to export FD for DMA-BUF
Message-ID: <20210621232912.GK1096940@ziepe.ca>
References: <20210618123615.11456-1-ogabbay@kernel.org>
 <CAKMK7uFOfoxbD2Z5mb-qHFnUe5rObGKQ6Ygh--HSH9M=9bziGg@mail.gmail.com>
 <YNCN0ulL6DQiRJaB@kroah.com>
 <20210621141217.GE1096940@ziepe.ca>
 <CAFCwf10KvCh0zfHEHqYR-Na6KJh4j+9i-6+==QaMdHHpLH1yEA@mail.gmail.com>
 <20210621175511.GI1096940@ziepe.ca>
 <CAKMK7uEO1_B59DtM7N2g7kkH7pYtLM_WAkn+0f3FU3ps=XEjZQ@mail.gmail.com>
 <CAFCwf11jOnewkbLuxUESswCJpyo7C0ovZj80UrnwUOZkPv2JYQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFCwf11jOnewkbLuxUESswCJpyo7C0ovZj80UrnwUOZkPv2JYQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jun 21, 2021 at 10:24:16PM +0300, Oded Gabbay wrote:

> Another thing I want to emphasize is that we are doing p2p only
> through the export/import of the FD. We do *not* allow the user to
> mmap the dma-buf as we do not support direct IO. So there is no access
> to these pages through the userspace.

Arguably mmaping the memory is a better choice, and is the direction
that Logan's series goes in. Here the use of DMABUF was specifically
designed to allow hitless revokation of the memory, which this isn't
even using.

So you are taking the hit of very limited hardware support and reduced
performance just to squeeze into DMABUF..

Jason
