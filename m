Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15E2B181B79
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2020 15:38:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729794AbgCKOii (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 10:38:38 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:33434 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729718AbgCKOii (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 10:38:38 -0400
Received: by mail-qk1-f196.google.com with SMTP id p62so2299093qkb.0
        for <linux-media@vger.kernel.org>; Wed, 11 Mar 2020 07:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=PSztimMeir0ZgjSVqMD6MDxbcT2ircpEjh/pBUCcxkE=;
        b=FqfCvHapVnhq0xpRTYom+2RXHtw7BJZ1GSWjsT5QgRWp5xKKUn/ynSLhJ1BU3W8k4g
         MvjeU/FL2p3j21fqNCQ/0VFYKMxCgO8Tpn6vVtaZDrU9v+7ZI6bQx7w31p4IEtdSE0BP
         O/xmclvaX+H+Nr+2ROKTGBT9c+aP3OJDWq0En3wPLiW39rAOyOLkaR0tHRMaaGAWO/HX
         JfE41JbIGBB2NppZaIoyMakVi23plnH4dsOKBiwOHDlAY2ySolghrhuMA0dZJoH4UPj2
         fIaogi+yGs2hq+RmzAl9rUHjMUt2qyc6fMxdayyYAM7qoF+upz6aqEoRlRJfNT47hsz2
         QNvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=PSztimMeir0ZgjSVqMD6MDxbcT2ircpEjh/pBUCcxkE=;
        b=Ugt2PIJFLiRQORSC20TIhva9M02xg0lLyvhbt9XxGC7f8OkIFkhnfog5n7I35NyFFD
         0/l/EZNTPRWHD6nMWFiY2+11nMreJAju2oOlYwaZhbUNd16SxJtXp/D9HYovMcou4hbT
         FHrhLI4DgvXuODdbAUcE/hddZTlhCFtFZioVNQkTM+Wpy0T841aBtiZejYj2bEzxESSG
         X+/ijRgudEMa1EXVzBCFzLoqlTEjWE/ZoB0yWASCNq/szt+UZaoTa9IwID7IawDxd7+A
         QD6Jj2v0BGMzNrHf05UdjbdI+ihm9Z63RQjMutHOgWd20GONGSQc4+izlvgzY/s/dCub
         TNJg==
X-Gm-Message-State: ANhLgQ1JyhF1QLSE+fQ5SHJ1QBd/LYLMSPyxc9gJuAwxBCTHV11l5SKF
        HxKLCGQAjMcV+6NYZ3NyGhx4FQ==
X-Google-Smtp-Source: ADFU+vtrYi8syGwRALzru/6pjS/74XrJyzkc1WPhc99FqeQUk8Mp5gEOoHSzyQHoCPd/niKYP+gD2w==
X-Received: by 2002:a37:b944:: with SMTP id j65mr3045791qkf.374.1583937516721;
        Wed, 11 Mar 2020 07:38:36 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.57.212])
        by smtp.gmail.com with ESMTPSA id w132sm3269729qkb.96.2020.03.11.07.38.36
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Mar 2020 07:38:36 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1jC2VH-0004r9-NZ; Wed, 11 Mar 2020 11:38:35 -0300
Date:   Wed, 11 Mar 2020 11:38:35 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     christian.koenig@amd.com
Cc:     David1.Zhou@amd.com, hch@infradead.org, daniel@ffwll.ch,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        Logan Gunthorpe <logang@deltatee.com>
Subject: Re: [PATCH 4/6] drm/amdgpu: add checks if DMA-buf P2P is supported
Message-ID: <20200311143835.GD31668@ziepe.ca>
References: <20200311135158.3310-1-christian.koenig@amd.com>
 <20200311135158.3310-5-christian.koenig@amd.com>
 <20200311140415.GB31668@ziepe.ca>
 <848c2f50-1529-f036-69cd-5104b7ebe27b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <848c2f50-1529-f036-69cd-5104b7ebe27b@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Mar 11, 2020 at 03:33:01PM +0100, Christian König wrote:
> Am 11.03.20 um 15:04 schrieb Jason Gunthorpe:
> > On Wed, Mar 11, 2020 at 02:51:56PM +0100, Christian König wrote:
> > > Check if we can do peer2peer on the PCIe bus.
> > > 
> > > Signed-off-by: Christian König <christian.koenig@amd.com>
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 4 ++++
> > >   1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> > > index aef12ee2f1e3..bbf67800c8a6 100644
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> > > @@ -38,6 +38,7 @@
> > >   #include <drm/amdgpu_drm.h>
> > >   #include <linux/dma-buf.h>
> > >   #include <linux/dma-fence-array.h>
> > > +#include <linux/pci-p2pdma.h>
> > >   /**
> > >    * amdgpu_gem_prime_vmap - &dma_buf_ops.vmap implementation
> > > @@ -179,6 +180,9 @@ static int amdgpu_dma_buf_attach(struct dma_buf *dmabuf,
> > >   	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
> > >   	int r;
> > > +	if (pci_p2pdma_distance_many(adev->pdev, &attach->dev, 1, true) < 0)
> > > +		attach->peer2peer = false;
> > > +
> > Are there other related patches than this series?
> > 
> > p2p dma mapping needs to be done in common code, in p2pdma.c - ie this
> > open coding is missing the bus_offset stuff, at least.
> 
> Yeah, I'm aware of this. But I couldn't find a better way for now.

Well, it isn't optional :)
 
> > I really do not want to see drivers open code this stuff.
> > 
> > We already have a p2pdma API for handling the struct page case, so I
> > suggest adding some new p2pdma API to handle this for non-struct page
> > cases.
> > 
> > ie some thing like:
> > 
> > int 'p2pdma map bar'(
> >     struct pci_device *source,
> >     unsigned int source_bar_number,
> >     struct pci_device *dest,
> >     physaddr&len *array_of_offsets & length pairs into source bar,
> >     struct scatterlist *output_sgl)
> 
> Well that's exactly what I have to avoid since I don't have the array of
> offsets around and want to avoid constructing it.

Maybe it doesn't need an array of offsets - just a single offset and
callers can iterate the API?

> Similar problem for dma_map_resource(). My example does this on demand, but
> essentially we also have use cases where this is done only once.

I'm not sure if this is portable. Does any IOMMU HW need to know P2P
is happening to setup successfully? We currently support such a narrow
scope of HW for P2P..

> Ideally we would have some function to create an sgl based on some arbitrary
> collection of offsets and length inside a BAR.

Isn't that what I just proposed above ?

Jason
