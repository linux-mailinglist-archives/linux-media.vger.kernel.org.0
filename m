Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E04861835FF
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2020 17:19:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727175AbgCLQTg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Mar 2020 12:19:36 -0400
Received: from mail-qv1-f67.google.com ([209.85.219.67]:44654 "EHLO
        mail-qv1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727001AbgCLQTg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 12:19:36 -0400
Received: by mail-qv1-f67.google.com with SMTP id w5so2888600qvp.11
        for <linux-media@vger.kernel.org>; Thu, 12 Mar 2020 09:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=2pBw5NHij8N3HJpajFNPowoAaCy8Dhl2IuKbDIhiU44=;
        b=GSXMOg8u4rz3Q17cfu0KqadQLC7wfggLdfWHGmZHzhi89s12eCFewau2YcieZ+/Ugb
         Fz+aWTHi27R8osOi9eAHqp2A9NCEYEytHqOPrCHCo/1WBwMJGJQge3tpBFfidUuAytrI
         MVbLnu0+USXs0LNA0DlqyHvjTM1qADv/+uilmTTwW0nmU5EpQ7N/Z6I33ILnNY6jIqNr
         jCpOETLbCQ9GzyzQMY3/NYUvMXZEMyboJU/OajO0dZxv2TYDUMfZndKEf9ayTANWEk7j
         49KrHIO5Le/rh5z2+GhpYmsNB0f3Fde5xnW439+E/Yud341o3DSD65dGrghYTyKDMy+9
         tp4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=2pBw5NHij8N3HJpajFNPowoAaCy8Dhl2IuKbDIhiU44=;
        b=l0LA6EcXxJ6Kknv9juk/v6CuZywqOK32SWfh4jIeQ1VZ549S7W7ImwxUC5NaeYLNtj
         pVRGG4+aB2Ktbp6DO+I+joke3C+SOYGOUc98TjXZ51j3kmUIg+K37WDoP2n2UAZu9uZN
         tbTXdq2VUXfU7FRZoJ+mtitYrHOfbF7P2TDTOzGJu7cxfsiJsWfiPe4zISA0EcX43Vi3
         vhrTXNebozKKvYjKHFhu2RefSItE8xVoLhbHGTKg6mnwWIGHtOF02WQu7cr+U87Zefwj
         q5vwqtM42VU5TkZYCY8YCzz35XtscNdqEffkAsP9Kw/htsVZetgU+lagjp/5dF1bNGqr
         +w0A==
X-Gm-Message-State: ANhLgQ2z5aN5TMw1FYyjbeR9QctAn+mwEi+PsSok2GkzLosGHCR0mk7t
        yeTBR5pNC2yHAPn9yuTf/HXcnw==
X-Google-Smtp-Source: ADFU+vsmQ/FsmpeRJiVtuUFT93ljDpyB7+aErB9kxbpf0WybzT6k0L+1tJ88lRmkuiqknEqAJzQGmw==
X-Received: by 2002:ad4:40c7:: with SMTP id x7mr8281046qvp.176.1584029972649;
        Thu, 12 Mar 2020 09:19:32 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.57.212])
        by smtp.gmail.com with ESMTPSA id x203sm13973376qkb.44.2020.03.12.09.19.32
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Mar 2020 09:19:32 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1jCQYV-0008Fw-Lk; Thu, 12 Mar 2020 13:19:31 -0300
Date:   Thu, 12 Mar 2020 13:19:31 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc:     Christoph Hellwig <hch@infradead.org>, David1.Zhou@amd.com,
        daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
        intel-gfx@lists.freedesktop.org,
        Logan Gunthorpe <logang@deltatee.com>
Subject: Re: [PATCH 1/6] lib/scatterlist: add sg_set_dma_addr() function
Message-ID: <20200312161931.GQ31668@ziepe.ca>
References: <20200311135158.3310-1-christian.koenig@amd.com>
 <20200311135158.3310-2-christian.koenig@amd.com>
 <20200311152838.GA24280@infradead.org>
 <f2b46f49-a8d0-9d43-3120-e1ed36fc3a80@gmail.com>
 <20200312101943.GA14618@infradead.org>
 <b5db44eb-1dde-1671-feb0-9e47d120f172@amd.com>
 <20200312104729.GA26031@infradead.org>
 <20200312141928.GK31668@ziepe.ca>
 <5383c8de-4e2c-dc8c-363d-a35d671abfc3@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5383c8de-4e2c-dc8c-363d-a35d671abfc3@amd.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Mar 12, 2020 at 04:39:02PM +0100, Christian König wrote:
> > > The structure for holding dma addresses doesn't really exist
> > > in a generic form, but would be an array of these structures:
> > > 
> > > struct dma_sg {
> > > 	dma_addr_t	addr;
> > > 	u32		len;
> > > };
> > Same question, RDMA needs to represent gigabytes of pages in a DMA
> > list, we will need some generic way to handle that. I suspect GPU has
> > a similar need? Can it be accomidated in some generic dma_sg?
> 
> Yes, we easily have ranges of >1GB. So I would certainly say u64 for the len
> here.

To be clear, I mean specifically 1GB of dma map composed of 262k
pages, mapped into 262k dma_sg's that take around some 4M of memory to
represent as struct dma_dg.

Really prefer some scheme that doesn't rely on vmalloc..

Some approach to have a single dma_sg > 4G seems less commonly needed?
I don't think any RDMA HW today can handle a single SGL that large at
least.

> >   - Add some generic dma_sg data structure and helper
> >   - Add dma mapping code to go from pages to dma_sg
> >   - Rework RDMA to use dma_sg and the new dma mapping code
> >   - Rework dmabuf to support dma mapping to a dma_sg
> >   - Rework GPU drivers to use dma_sg
> >   - Teach p2pdma to generate a dma_sg from a BAR page list
> >   - This series
> > 
> > ?
> 
> Sounds pretty much like a plan to me, but unfortunately like a rather huge
> one.

I know parts of this have been advancing.. CH has been working on
fixing up the DMA layer enough to do #1 and #2, I think.

> Because of this and cause I don't know if all drivers can live with dma_sg
> I'm not sure if we shouldn't have the switch from scatterlist to dma_sg
> separately to this peer2peer work.

So far any attempts to make sgls without struct page have failed for
various reasons. Too often obscure stuff does actually want the struct
page.

Stuffing BAR memory pages into the SGL is bad enough already. :(

One pragmatic path might be to define this new 'dma_sg' in a way where
it would have the same memory layout as a 'struct scatterlist'

Something like

struct dma_scatterlist {
        unsigned long   link;
        unsigned int    reserved1;
#ifndef CONFIG_NEED_SG_DMA_LENGTH
        unsigned int    dma_length;
#else
        unsigned int    reserved2;
#endif
        dma_addr_t      dma_address;
#ifdef CONFIG_NEED_SG_DMA_LENGTH
        unsigned int    dma_length;
#endif
};

struct dma_sg_table {
     union {
         struct dma_scatterlist *dma_sgl;
         struct future_more_efficient_structure *future;
     }
     unsigned int nents;
};

Then a dma_map_sg could be 

struct dma_sg_table *dma_map_sg_attrs_to_dma(
       struct device *dev, struct scatterlist *sg,
       int nents, enum dma_data_direction dir,
       unsigned long attrs)
{
   ret = dma_map_sg_attrs(dev, sg, nents, dir, attrs);
   res = kmalloc(sizeof(dma_sg_table));
   res->dma_sgl = sg;
   return res;
}

Then at least the work can get gets split up, I can switch RDMA
drivers to use dma_sg_table, then I can switch the subsystem to call
dma_map_sg_attrs_to_dma, then when we get dma_map_biovec_attrs() I can
work on switching the input sgl to a biovec without changing the
drivers.

After enough conversions are done we can optimize the memory layout
inside dma_sg_table, after everything is done we can drop support for
'dma_scatterlist'

It doesn't feel objectionable to build a 'dma_sg_table' without a
struct page.

Jason
