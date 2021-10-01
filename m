Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8942441EFF8
	for <lists+linux-media@lfdr.de>; Fri,  1 Oct 2021 16:51:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354624AbhJAOwp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Oct 2021 10:52:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231764AbhJAOwj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Oct 2021 10:52:39 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0939C06177C
        for <linux-media@vger.kernel.org>; Fri,  1 Oct 2021 07:50:54 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id e16so9118856qte.13
        for <linux-media@vger.kernel.org>; Fri, 01 Oct 2021 07:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oMNtHpa9fOC6yHUao3VzpuzxSz0y+O1ZI66YcUTNbDE=;
        b=nPwDUL9pffjM/L5QBu2UuSP1A0QIAziR9mEhIiS0bbykKDNwFwDOCdZZPQRjytSfOl
         9664AO5c95SsAo845UWJ4llFoeGA34AMkf8JM8Jvz4IkmXmAVxiKZPf8ueKyZDj2nnhD
         7UMSgYwkQcaDxSswDKUHvCys3TK5Y5wkz2BXHjVliu2eyg29AZhT/OjKvCBrw1uscGKD
         3z+t3x/PORSTQiMEajcEoJWDN8W44+RDWzJ3OAr4hPg7SAnPZ5GisI2uKci8/QKl7Dj2
         HOKVC2LuGCjbjYvGuNPd82eSxLSRf0G3YcULGIl6j0TQwgvkOpcvnHfxonQ1DnaiELwg
         iLrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oMNtHpa9fOC6yHUao3VzpuzxSz0y+O1ZI66YcUTNbDE=;
        b=v1vmyB5f12yjuYiPvva37ApJEoxfIdSt3nCD/auGvd1rUQWQe/uuuG0bvuiPvbIuoD
         U6jxdlscnilgwPAI2SLcFX24J77SE6/wvEV1p6cOSHOwiML4T8PMkj+X+KV8K3CPLK/b
         Ta3ah9trWg+XwoAGHwSRE26mh9oj4BwEmmT6iRzEZ33492S1e9w5qsKHexauQU6J4LbO
         gphzCnFKWHDUS2tEeYg55RugcxF1Qlfu+WnhhGYriMFBe2eZ6UjpLOoBQIujLarAKjtj
         m89QHXB34PR5vpoVUucUaQPDKEwZqLyiR5Yw7Gzv2TImtr76/r2FJbOFtAr4uhA24by5
         TznA==
X-Gm-Message-State: AOAM532iDKCkMnMJD0oLSBhijDKClZ678+7YlwC15OgWrGo8ARBW//w1
        uF1Nu6RfboQFJPz9fN1daCdqSA==
X-Google-Smtp-Source: ABdhPJzIs8hTLztUjiDoh78mr4hOo7pek1hrPgd5bVCfeiCLQexgpwtMxfq7+czidzCd0A+vIMG+mg==
X-Received: by 2002:a05:622a:1a1c:: with SMTP id f28mr13416941qtb.346.1633099853922;
        Fri, 01 Oct 2021 07:50:53 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.113.129])
        by smtp.gmail.com with ESMTPSA id i20sm3149803qke.102.2021.10.01.07.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 07:50:53 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1mWJsC-008ctY-Nj; Fri, 01 Oct 2021 11:50:52 -0300
Date:   Fri, 1 Oct 2021 11:50:52 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Oded Gabbay <ogabbay@kernel.org>
Cc:     Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
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
        <linaro-mm-sig@lists.linaro.org>, Tomer Tayar <ttayar@habana.ai>
Subject: Re: [PATCH v6 2/2] habanalabs: add support for dma-buf exporter
Message-ID: <20211001145052.GO3544071@ziepe.ca>
References: <20210912165309.98695-1-ogabbay@kernel.org>
 <20210912165309.98695-3-ogabbay@kernel.org>
 <20210928173621.GG3544071@ziepe.ca>
 <CAFCwf10z-baRm8c-UD_=jcZYD0VAGrMiNo7Q5Fm-2txYmVWGcQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFCwf10z-baRm8c-UD_=jcZYD0VAGrMiNo7Q5Fm-2txYmVWGcQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 29, 2021 at 12:17:35AM +0300, Oded Gabbay wrote:
> On Tue, Sep 28, 2021 at 8:36 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >
> > On Sun, Sep 12, 2021 at 07:53:09PM +0300, Oded Gabbay wrote:
> > > From: Tomer Tayar <ttayar@habana.ai>
> > >
> > > Implement the calls to the dma-buf kernel api to create a dma-buf
> > > object backed by FD.
> > >
> > > We block the option to mmap the DMA-BUF object because we don't support
> > > DIRECT_IO and implicit P2P.
> >
> > This statement doesn't make sense, you can mmap your dmabuf if you
> > like. All dmabuf mmaps are supposed to set the special bit/etc to
> > exclude them from get_user_pages() anyhow - and since this is BAR
> > memory not struct page memory this driver would be doing it anyhow.
> >
> But we block mmap the dmabuf fd from user-space.
> If you try to do it, you will get MAP_FAILED.

You do, I'm saying the above paragraph explaining *why* that was done
is not correct.

> > > We check the p2p distance using pci_p2pdma_distance_many() and refusing
> > > to map dmabuf in case the distance doesn't allow p2p.
> >
> > Does this actually allow the p2p transfer for your intended use cases?
>
> It depends on the system. If we are working bare-metal, then yes, it allows.
> If inside a VM, then no. The virtualized root complex is not
> white-listed and the kernel can't know the distance.
> But I remember you asked me to add this check, in v3 of the review IIRC.
> I don't mind removing this check if you don't object.

Yes, i tis the right code, I was curious how far along things have
gotten

> > Don't write to the kernel log from user space triggered actions
> at all ?

At all.

> It's the first time I hear about this limitation...

Oh? It is a security issue, we don't want to allow userspace to DOS
the kerne logging.

> How do you tell the user it has done something wrong ?

dev_dbg is the usual way and then users doing debugging can opt in to
the logging.


> > Why doesn't this return a sg_table * and an ERR_PTR?
> Basically I modeled this function after amdgpu_vram_mgr_alloc_sgt()
> And in that function they also return int and pass the sg_table as **
> 
> If it's critical I can change.

Please follow the normal kernel style

Jason
