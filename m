Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 728123AF489
	for <lists+linux-media@lfdr.de>; Mon, 21 Jun 2021 20:11:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233483AbhFUSN5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Jun 2021 14:13:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233868AbhFUSL7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Jun 2021 14:11:59 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7087C08EB22
        for <linux-media@vger.kernel.org>; Mon, 21 Jun 2021 10:55:13 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id j62so32629864qke.10
        for <linux-media@vger.kernel.org>; Mon, 21 Jun 2021 10:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nBnKqoan/yrGPxWBtod3It942s1tDX9/KE30/nusiX8=;
        b=WI6BslfMAmPAqlkgxzowSTflY7NQA3y+CUwTBvzVDCcyYTXaN/gVqCKCtZW3jBhDN/
         0UzGYA3yDHe8J6UKE756wt/UmywXplBJNkqd/etU27xo1mO2WcN+0DrSqjZoZ+QPjDhS
         gtInLkqOGVngBO5q/TzqPGZVWNWqmcspxboYPMyc17oi9+q8RPluz/FOJMrDD5spXkMZ
         iB3ThgOIG9nqb9dMH7zmbRl6/U4PWyQ3U7jviIiuXx5UY++auipiO/9dA1mjIvhEVDLu
         +ivFKrO9f2updS9rAE06d5iBXYJjqkZkzVL8gtnViXv9FIeNh163yuySS3rCWa1ZKLjN
         1K9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nBnKqoan/yrGPxWBtod3It942s1tDX9/KE30/nusiX8=;
        b=UF0zAA7YOAu/8kz7yT0gYiTn+QT4e5pebRUKRcCoXsfMSeaPoYeNfNCQlTBMWNF397
         K6dm809p0rpOg2zqWmu2jCgefhw7VeBFpdFR1N2OlePOeXwIyA2q6HP6itzvSvCHNiNG
         ME9Bf912LDAdIgb4o+7t+NwNkpTfLYrDDrs7Dgb7cEnJv1kri9NCtjY9kXsTKugFOW67
         aP2ZGTxqjve70vcEW1LiDqgwuZOy1qjj1O5fnmbRHU69Fw1Z5zTYwQ2L/8kdY9tpgRDA
         grDO70AO7hoW8sFkB6p++FI1OzDZqNC5bugGccQ3UxVXqLl9w2A3ZZMkDwOJUN9uOM4S
         2wHg==
X-Gm-Message-State: AOAM530R2ajx9VDfvX4GXvLsSfnn9McM9hkmWFKVDMjZ0ljyy5YEgdZX
        DFrCKeOyJ9GdTGx3r5YIfLUZ7Q==
X-Google-Smtp-Source: ABdhPJwrj+wsvI3VpgV3YyLo+IiwAhCuCLTr6OeqWh9+LVOcQqnKD9F9Tz10eaB52w7tWL0Ya535tw==
X-Received: by 2002:a05:620a:440f:: with SMTP id v15mr15727716qkp.199.1624298112852;
        Mon, 21 Jun 2021 10:55:12 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-113-94.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.113.94])
        by smtp.gmail.com with ESMTPSA id d20sm4960737qtw.92.2021.06.21.10.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 10:55:12 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1lvO8d-009kwS-Ip; Mon, 21 Jun 2021 14:55:11 -0300
Date:   Mon, 21 Jun 2021 14:55:11 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Oded Gabbay <oded.gabbay@gmail.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
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
Message-ID: <20210621175511.GI1096940@ziepe.ca>
References: <20210618123615.11456-1-ogabbay@kernel.org>
 <CAKMK7uFOfoxbD2Z5mb-qHFnUe5rObGKQ6Ygh--HSH9M=9bziGg@mail.gmail.com>
 <YNCN0ulL6DQiRJaB@kroah.com>
 <20210621141217.GE1096940@ziepe.ca>
 <CAFCwf10KvCh0zfHEHqYR-Na6KJh4j+9i-6+==QaMdHHpLH1yEA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFCwf10KvCh0zfHEHqYR-Na6KJh4j+9i-6+==QaMdHHpLH1yEA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jun 21, 2021 at 07:26:14PM +0300, Oded Gabbay wrote:
> On Mon, Jun 21, 2021 at 5:12 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >
> > On Mon, Jun 21, 2021 at 03:02:10PM +0200, Greg KH wrote:
> > > On Mon, Jun 21, 2021 at 02:28:48PM +0200, Daniel Vetter wrote:
> >
> > > > Also I'm wondering which is the other driver that we share buffers
> > > > with. The gaudi stuff doesn't have real struct pages as backing
> > > > storage, it only fills out the dma_addr_t. That tends to blow up with
> > > > other drivers, and the only place where this is guaranteed to work is
> > > > if you have a dynamic importer which sets the allow_peer2peer flag.
> > > > Adding maintainers from other subsystems who might want to chime in
> > > > here. So even aside of the big question as-is this is broken.
> > >
> > > From what I can tell this driver is sending the buffers to other
> > > instances of the same hardware,
> >
> > A dmabuf is consumed by something else in the kernel calling
> > dma_buf_map_attachment() on the FD.
> >
> > What is the other side of this? I don't see any
> > dma_buf_map_attachment() calls in drivers/misc, or added in this patch
> > set.
> 
> This patch-set is only to enable the support for the exporter side.
> The "other side" is any generic RDMA networking device that will want
> to perform p2p communication over PCIe with our GAUDI accelerator.
> An example is indeed the mlnx5 card which has already integrated
> support for being an "importer".

It raises the question of how you are testing this if you aren't using
it with the only intree driver: mlx5.

Jason
