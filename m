Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8764A1832B1
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2020 15:19:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727446AbgCLOTb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Mar 2020 10:19:31 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:32883 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727123AbgCLOTb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 10:19:31 -0400
Received: by mail-qk1-f193.google.com with SMTP id p62so6439128qkb.0
        for <linux-media@vger.kernel.org>; Thu, 12 Mar 2020 07:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=/PiOEjdfEsvpkbgsNHwc4L+xx9dbsNuqU5VlQ2ohpBk=;
        b=ZonOAvybTTy9G0fas0xnfVjqsxzR6h2MsglRumsufuK5H0bPkKui9zy//gFhDEujcE
         rcu2rHdhYfAKlqzxn54gEygj4/mJ4Ngx76T7ejJOuWZDBrPO6KE3IdHGDNCIEW9j3X2b
         UT4A+6Wsw1o1w0H/GgVCefRWWDgwiYoBZZjCSvUgv5DiU+0cj1M0GWCqTmfbQme+YNE3
         Sz6416+QFbJT7u+ukLN2zRp02hSOCN1mU9w7OD1FEwy/fuh+qKAwyRvO1wIe+dnKqpiL
         dXA6u1L/iEBCrPtbuc/yvKCxoUdkoJusnyaYe5CW+K4XmJ71kSUgLp+06e8eIQZa4DJn
         JwzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=/PiOEjdfEsvpkbgsNHwc4L+xx9dbsNuqU5VlQ2ohpBk=;
        b=O8VQ9GYQkgTDD3yAgn64bxNGL0SRnOe2nxTScGm+ARfZh+q+JLJ5qBsQp3vwfrUBt6
         XgK0OYRByoOibpdYbHzBIcQqnYP5p2dNpyKbKvhTk+wD5BievTnmg2HPNRVRQo/BcFSf
         jPZICzYN1LNiCGYqcVlMTg2M+Tpv2JeVpPuMuaH+L/cJoPqZp5smoURs+u5e59ZzVulf
         UoUqYvjCSn5c+P0u4yWrJ91FQRKtiggpn+gDhnhP5YsTIKdtjciaiwAX2YUxdMKz2ShO
         Hzyk+LXkd98QpWPoaq547tn1jUyVTAKPr/dlis21opuB2/VP7XvTSQ9JYZISaZ/cIfDr
         W/0w==
X-Gm-Message-State: ANhLgQ0UP6stqyw1aYPu8p7VWHgzwzdrnwHCSl9YebQLl4lPQUpxP8lq
        kjbU6dk/nJopBpM3EC94vYPfeg==
X-Google-Smtp-Source: ADFU+vvXg4EGGVemK34kljHZQvgXNrPxNkZ51/3+Zl/oJQuvks201klMSzaKEE/bcFqFKbGz1GRKnQ==
X-Received: by 2002:a05:620a:388:: with SMTP id q8mr7659390qkm.488.1584022769797;
        Thu, 12 Mar 2020 07:19:29 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.57.212])
        by smtp.gmail.com with ESMTPSA id o7sm9510761qtg.63.2020.03.12.07.19.29
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Mar 2020 07:19:29 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1jCOgK-0006SS-L5; Thu, 12 Mar 2020 11:19:28 -0300
Date:   Thu, 12 Mar 2020 11:19:28 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        David1.Zhou@amd.com, daniel@ffwll.ch,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        Logan Gunthorpe <logang@deltatee.com>
Subject: Re: [PATCH 1/6] lib/scatterlist: add sg_set_dma_addr() function
Message-ID: <20200312141928.GK31668@ziepe.ca>
References: <20200311135158.3310-1-christian.koenig@amd.com>
 <20200311135158.3310-2-christian.koenig@amd.com>
 <20200311152838.GA24280@infradead.org>
 <f2b46f49-a8d0-9d43-3120-e1ed36fc3a80@gmail.com>
 <20200312101943.GA14618@infradead.org>
 <b5db44eb-1dde-1671-feb0-9e47d120f172@amd.com>
 <20200312104729.GA26031@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200312104729.GA26031@infradead.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Mar 12, 2020 at 03:47:29AM -0700, Christoph Hellwig wrote:
> On Thu, Mar 12, 2020 at 11:31:35AM +0100, Christian König wrote:
> > But how should we then deal with all the existing interfaces which already
> > take a scatterlist/sg_table ?
> >
> > The whole DMA-buf design and a lot of drivers are build around
> > scatterlist/sg_table and to me that actually makes quite a lot of sense.
> > 
> 
> Replace them with a saner interface that doesn't take a scatterlist.
> At very least for new functionality like peer to peer DMA, but
> especially this code would also benefit from a general move away
> from the scatterlist.

If dma buf can do P2P I'd like to see support for consuming a dmabuf
in RDMA. Looking at how.. there is an existing sgl based path starting
from get_user_pages through dma map to the drivers. (ib_umem)

I can replace the driver part with something else (dma_sg), but not
until we get a way to DMA map pages directly into that something
else..

The non-page scatterlist is also a big concern for RDMA as we have
drivers that want the page list, so even if we did as this series
contemplates I'd have still have to split the drivers and create the
notion of a dma-only SGL.

> > I mean we could come up with a new structure for this, but to me that just
> > looks like reinventing the wheel. Especially since drivers need to be able
> > to handle both I/O to system memory and I/O to PCIe BARs.
> 
> The structure for holding the struct page side of the scatterlist is
> called struct bio_vec, so far mostly used by the block and networking
> code.

I haven't used bio_vecs before, do they support chaining like SGL so
they can be very big? RDMA dma maps gigabytes of memory

> The structure for holding dma addresses doesn't really exist
> in a generic form, but would be an array of these structures:
> 
> struct dma_sg {
> 	dma_addr_t	addr;
> 	u32		len;
> };

Same question, RDMA needs to represent gigabytes of pages in a DMA
list, we will need some generic way to handle that. I suspect GPU has
a similar need? Can it be accomidated in some generic dma_sg?

So I'm guessing the path forward is something like

 - Add some generic dma_sg data structure and helper
 - Add dma mapping code to go from pages to dma_sg
 - Rework RDMA to use dma_sg and the new dma mapping code
 - Rework dmabuf to support dma mapping to a dma_sg
 - Rework GPU drivers to use dma_sg
 - Teach p2pdma to generate a dma_sg from a BAR page list
 - This series

?

Jason
