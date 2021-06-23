Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E52383B2142
	for <lists+linux-media@lfdr.de>; Wed, 23 Jun 2021 21:34:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229940AbhFWThQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Jun 2021 15:37:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229759AbhFWThQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Jun 2021 15:37:16 -0400
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F02FAC061756
        for <linux-media@vger.kernel.org>; Wed, 23 Jun 2021 12:34:57 -0700 (PDT)
Received: by mail-qt1-x82f.google.com with SMTP id g12so3027464qtb.2
        for <linux-media@vger.kernel.org>; Wed, 23 Jun 2021 12:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fGGtHhMjRxWC7q8u+QpLuSmAd2BS6BZvGpryakmPg+4=;
        b=C/ChLYKJjxWUduhsqQDH/y3KkPljvKtmE9gnR4RWqH26X4Hcl0BZhRk8uZJDDcRefS
         hGtO2MpvhYu1ncsQ4XftrvmDbf/mCW3wk2DupCuSLq+ie4Hyvpd20U48FGOE4dSGyEo0
         TmyxIGRf7/r6jILWVF9V3iqSjUzYoN6B2NHcRb+DpKV2v39TKfOUwHneZqFmzFyu8wZH
         aiub1NaEqGoa85Yu73CHqFp2wUJ1VM+8ZEE8HkUwdR6souayXVXN3DVtBP19SojfN0kr
         E2ju0T5nvVMTyB6NE6nPMbaB3NYTA1ab7ECOlaIw1r3lb29JeCcDEsxrLY1+NlKZ05e4
         b/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fGGtHhMjRxWC7q8u+QpLuSmAd2BS6BZvGpryakmPg+4=;
        b=rpP0SYM7Zy1HCfOX0aJf1YnZ7RUymlyv4nDi7q2SYizi+GxgyB6Br82hI8Tot8lAnK
         yLS+kdooOZY16cIwvahBvyj/27ECnsJL79/V0lWdSeHs5jPCPTvsGSBD4KTGl90tIVvJ
         mCMbdWARj1wkkQRH09KnmLtAX8lh6IAJ7WGueVPbuS2mor0So3S0CP+GcQV52S5CemMs
         gRmAhZQeNuMjmaGdn3BAy/EJ7py9cZ7dMJ00nDUTbSbAY8GXUFDRsID2J1td+hnEdmI3
         gg0Y7n4lreKiLoqxbndmvsc5C+LPv/xZqvddVoPSBjb2yoXsA35E748ayiFVT0OmtStd
         jukA==
X-Gm-Message-State: AOAM531aC7sKoK1hoQ/6rHVwTT118yTLRWJUHDK1eLQzRvrGfxOJTaUq
        LMprUTV1tvUHI12CHIi6ISe0BA==
X-Google-Smtp-Source: ABdhPJy4nm23YvC56EEKSx/Y/JuzrdTPRhd28eu5/vz3L6lZmXQMsZDuNXNFY8tXVtB6j1rc/ARD+w==
X-Received: by 2002:a05:622a:1051:: with SMTP id f17mr1494327qte.226.1624476897149;
        Wed, 23 Jun 2021 12:34:57 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-113-94.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.113.94])
        by smtp.gmail.com with ESMTPSA id x7sm598287qke.62.2021.06.23.12.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jun 2021 12:34:56 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1lw8eG-00BmnU-3D; Wed, 23 Jun 2021 16:34:56 -0300
Date:   Wed, 23 Jun 2021 16:34:56 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Oded Gabbay <oded.gabbay@gmail.com>
Cc:     Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Gal Pressman <galpress@amazon.com>, sleybo@amazon.com,
        linux-rdma <linux-rdma@vger.kernel.org>,
        Oded Gabbay <ogabbay@kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Doug Ledford <dledford@redhat.com>,
        Tomer Tayar <ttayar@habana.ai>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Leon Romanovsky <leonro@nvidia.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Subject: Re: [Linaro-mm-sig] [PATCH v3 1/2] habanalabs: define uAPI to export
 FD for DMA-BUF
Message-ID: <20210623193456.GZ1096940@ziepe.ca>
References: <20210622152343.GO1096940@ziepe.ca>
 <3fabe8b7-7174-bf49-5ffe-26db30968a27@amd.com>
 <20210622154027.GS1096940@ziepe.ca>
 <09df4a03-d99c-3949-05b2-8b49c71a109e@amd.com>
 <20210622160538.GT1096940@ziepe.ca>
 <d600a638-9e55-6249-b574-0986cd5cea1e@gmail.com>
 <20210623182435.GX1096940@ziepe.ca>
 <CAFCwf111O0_YB_tixzEUmaKpGAHMNvMaOes2AfMD4x68Am4Yyg@mail.gmail.com>
 <20210623185045.GY1096940@ziepe.ca>
 <CAFCwf12tW_WawFfAfrC8bgVhTRnDA7DuM+0V8w3JsUZpA2j84w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFCwf12tW_WawFfAfrC8bgVhTRnDA7DuM+0V8w3JsUZpA2j84w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 23, 2021 at 10:00:29PM +0300, Oded Gabbay wrote:
> On Wed, Jun 23, 2021 at 9:50 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >
> > On Wed, Jun 23, 2021 at 09:43:04PM +0300, Oded Gabbay wrote:
> >
> > > Can you please explain why it is so important to (allow) access them
> > > through the CPU ?
> >
> > It is not so much important, as it reflects significant design choices
> > that are already tightly baked into alot of our stacks.
> >
> > A SGL is CPU accessible by design - that is baked into this thing and
> > places all over the place assume it. Even in RDMA we have
> > RXE/SWI/HFI1/qib that might want to use the CPU side (grep for sg_page
> > to see)
> >
> > So, the thing at the top of the stack - in this case the gaudi driver
> > - simply can't assume what the rest of the stack is going to do and
> > omit the CPU side. It breaks everything.
> >
> > Logan's patch series is the most fully developed way out of this
> > predicament so far.
> 
> I understand the argument and I agree that for the generic case, the
> top of the stack can't assume anything.
> Having said that, in this case the SGL is encapsulated inside a dma-buf object.
>
> Maybe its a stupid/over-simplified suggestion, but can't we add a
> property to the dma-buf object,
> that will be set by the exporter, which will "tell" the importer it
> can't use any CPU fallback ? Only "real" p2p ?

The block stack has been trying to do something like this.

The flag doesn't solve the DMA API/IOMMU problems though.

Jason
