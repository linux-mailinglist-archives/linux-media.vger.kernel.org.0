Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 613A83AF50E
	for <lists+linux-media@lfdr.de>; Mon, 21 Jun 2021 20:27:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231910AbhFUSaA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Jun 2021 14:30:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231241AbhFUS37 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Jun 2021 14:29:59 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B5BBC061756
        for <linux-media@vger.kernel.org>; Mon, 21 Jun 2021 11:27:45 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id s17so12129354oij.11
        for <linux-media@vger.kernel.org>; Mon, 21 Jun 2021 11:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O9i28EclvSZx+uiFhNgb+3CTRZV2qMxp0Q3wXipsI8Q=;
        b=K0UUo78vVrHTzSDrMgj0jT+MLT+AozMScbVhmJ6rhysrPfzfwQKb0T9CTxpGrXfVIc
         t5jj9sX3IfqrbDRI8CthGXRxYKpUQX+02UsBeDhQ6gGIxzzzrj03gPnZr1/CyOuvjIls
         QcmPSnajwhf1oF905MYpKHACKSXHp6adH5P4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O9i28EclvSZx+uiFhNgb+3CTRZV2qMxp0Q3wXipsI8Q=;
        b=KbqIoiKLnUO5G7APegKg1EfHSCj8l/Th2rZZjRHiomildpqjAnSyWvXbSXMJmu80vX
         SUhXghvAXwihHpjlkSYWj5l9Dp/il1JBWjTwxg3byWY3ZwSuk2Jpr7i5vM+vqo0mH5iF
         PeIaTIrRadUi++8X7fQG/SN/fGZHAN607k0JPRtrqGvM9GYT2A4n24bWSXwVVn2Kehjs
         Yp5lSIml+EVMInJF/J/2VSVx3K/p7RTLbMEZ2M8KyPt8Xx48cQYO0zwWeGm/u4zQv5bS
         dwNbUfGZniI8qNIE6GxacIFil0zIk/fo4629Q/40Ypvw4sJYkvC0+FLy38l3mA9bLNQU
         ivXQ==
X-Gm-Message-State: AOAM530x30otzFL88/M9RGoJmrW/TQqvNjIvxKd/R6an25kf9+lo1Gvy
        XicEMDCKbCKTFLeRqkfJYiqDSMkt1kZvSRKEGV5jJg==
X-Google-Smtp-Source: ABdhPJwgGuTgLpKPpXIxr+AX3ujExHAGAGTWRhPWtYA2l25rchz9pzcPelTwjoCbaEdcWSxXHh9lYgsv8xRxuaFrFw8=
X-Received: by 2002:a54:4889:: with SMTP id r9mr11213515oic.101.1624300063935;
 Mon, 21 Jun 2021 11:27:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210618123615.11456-1-ogabbay@kernel.org> <CAKMK7uFOfoxbD2Z5mb-qHFnUe5rObGKQ6Ygh--HSH9M=9bziGg@mail.gmail.com>
 <YNCN0ulL6DQiRJaB@kroah.com> <20210621141217.GE1096940@ziepe.ca>
 <CAFCwf10KvCh0zfHEHqYR-Na6KJh4j+9i-6+==QaMdHHpLH1yEA@mail.gmail.com> <20210621175511.GI1096940@ziepe.ca>
In-Reply-To: <20210621175511.GI1096940@ziepe.ca>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Mon, 21 Jun 2021 20:27:32 +0200
Message-ID: <CAKMK7uEO1_B59DtM7N2g7kkH7pYtLM_WAkn+0f3FU3ps=XEjZQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] habanalabs: define uAPI to export FD for DMA-BUF
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     Oded Gabbay <oded.gabbay@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Oded Gabbay <ogabbay@kernel.org>,
        linux-rdma <linux-rdma@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>, Doug Ledford <dledford@redhat.com>,
        "airlied@gmail.com" <airlied@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Gal Pressman <galpress@amazon.com>, sleybo@amazon.com,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Tomer Tayar <ttayar@habana.ai>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Leon Romanovsky <leonro@nvidia.com>,
        Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jun 21, 2021 at 7:55 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> On Mon, Jun 21, 2021 at 07:26:14PM +0300, Oded Gabbay wrote:
> > On Mon, Jun 21, 2021 at 5:12 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > >
> > > On Mon, Jun 21, 2021 at 03:02:10PM +0200, Greg KH wrote:
> > > > On Mon, Jun 21, 2021 at 02:28:48PM +0200, Daniel Vetter wrote:
> > >
> > > > > Also I'm wondering which is the other driver that we share buffers
> > > > > with. The gaudi stuff doesn't have real struct pages as backing
> > > > > storage, it only fills out the dma_addr_t. That tends to blow up with
> > > > > other drivers, and the only place where this is guaranteed to work is
> > > > > if you have a dynamic importer which sets the allow_peer2peer flag.
> > > > > Adding maintainers from other subsystems who might want to chime in
> > > > > here. So even aside of the big question as-is this is broken.
> > > >
> > > > From what I can tell this driver is sending the buffers to other
> > > > instances of the same hardware,
> > >
> > > A dmabuf is consumed by something else in the kernel calling
> > > dma_buf_map_attachment() on the FD.
> > >
> > > What is the other side of this? I don't see any
> > > dma_buf_map_attachment() calls in drivers/misc, or added in this patch
> > > set.
> >
> > This patch-set is only to enable the support for the exporter side.
> > The "other side" is any generic RDMA networking device that will want
> > to perform p2p communication over PCIe with our GAUDI accelerator.
> > An example is indeed the mlnx5 card which has already integrated
> > support for being an "importer".
>
> It raises the question of how you are testing this if you aren't using
> it with the only intree driver: mlx5.

For p2p dma-buf there's also amdgpu as a possible in-tree candiate
driver, that's why I added amdgpu folks. Otoh I'm not aware of AI+GPU
combos being much in use, at least with upstream gpu drivers (nvidia
blob is a different story ofc, but I don't care what they do in their
own world).
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
