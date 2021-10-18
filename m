Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5BA4431075
	for <lists+linux-media@lfdr.de>; Mon, 18 Oct 2021 08:25:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230103AbhJRG1U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Oct 2021 02:27:20 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:53768 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229708AbhJRG1T (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Oct 2021 02:27:19 -0400
X-UUID: 4abdf5926bd348d49b111988a4e947ab-20211018
X-UUID: 4abdf5926bd348d49b111988a4e947ab-20211018
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <guangming.cao@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 164250816; Mon, 18 Oct 2021 14:25:04 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 18 Oct 2021 14:25:03 +0800
Received: from mszswglt01.gcn.mediatek.inc (10.16.20.20) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Mon, 18 Oct 2021 14:25:02 +0800
From:   <guangming.cao@mediatek.com>
To:     <daniel@ffwll.ch>
CC:     <Brian.Starkey@arm.com>, <benjamin.gaignard@linaro.org>,
        <christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>,
        <guangming.cao@mediatek.com>, <hridya@google.com>,
        <isaacm@codeaurora.org>, <john.stultz@linaro.org>,
        <labbott@redhat.com>, <linaro-mm-sig@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <lmark@codeaurora.org>,
        <matthias.bgg@gmail.com>, <sspatil@google.com>,
        <sumit.semwal@linaro.org>, <wsd_upstream@mediatek.com>,
        Guangming Cao <Guangming.Cao@mediatek.com>
Subject: Re: [PATCH] dma-buf: Add support for mapping buffers with DMA attributes
Date:   Mon, 18 Oct 2021 14:25:04 +0800
Message-ID: <20211018062504.116652-1-guangming.cao@mediatek.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <YS4kx3thdJOu3uHX@phenom.ffwll.local>
References: <YS4kx3thdJOu3uHX@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Guangming Cao <Guangming.Cao@mediatek.com>

On Tue, 2021-08-31 at 14:47 +0200, Daniel Vetter wrote:
> On Mon, Aug 30, 2021 at 10:39:11AM +0800, guangming.cao@mediatek.com
> wrote:
> > From: Guangming Cao <Guangming.Cao@mediatek.com>
> > 
> > When mapping the memory represented by a dma-buf into a device's
> > address space, it might be desireable to map the memory with
> > certain DMA attributes. Thus, introduce the dma_mapping_attrs
> > field in the dma_buf_attachment structure so that when
> > the memory is mapped with dma_buf_map_attachment, it is mapped
> > with the desired DMA attributes.
> > 
> > Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
> > Signed-off-by: Sandeep Patil <sspatil@google.com>
> > Signed-off-by: Guangming Cao <Guangming.Cao@mediatek.com>
> 
> Can you pls include the code that's going to use this here too?
> 
> At a glance all the attributes you might want to set are supposed to
> be
> under the control of the exporter, not the importer.
> -Daniel
> 
Hi Daniel,

Sorry for the late. Currently I couldn't upload the coding going to use
this part because of some miscellaneous reasons.

Just as I said in commit message, for dma_heap, users can't skip cache
sync or other opetrations when map iova[dma_buf_map_attachment] by
fill (struct dma_buf_attachment).dma_map_attrs, it's not dma_map_attrs
expected(link: 
https://github.com/torvalds/linux/blob/master/Documentation/core-api/dma-attributes.rst#dma_attr_skip_cpu_sync
).

Correspondingly, if they use dma_buf to map iova[dma_buf_map_attrs],
they will not meet this issue. So, I think it's a design flaw for
dma_heap.

BRs!
Guangming
> > ---
> >  drivers/dma-buf/heaps/cma_heap.c    | 6 ++++--
> >  drivers/dma-buf/heaps/system_heap.c | 6 ++++--
> >  include/linux/dma-buf.h             | 3 +++
> >  3 files changed, 11 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-
> > buf/heaps/cma_heap.c
> > index 0c05b79870f9..2c9feb3bfc3e 100644
> > --- a/drivers/dma-buf/heaps/cma_heap.c
> > +++ b/drivers/dma-buf/heaps/cma_heap.c
> > @@ -99,9 +99,10 @@ static struct sg_table
> > *cma_heap_map_dma_buf(struct dma_buf_attachment *attachme
> >  {
> >     struct dma_heap_attachment *a = attachment->priv;
> >     struct sg_table *table = &a->table;
> > +   int attrs = attachment->dma_map_attrs;
> >     int ret;
> >  
> > -   ret = dma_map_sgtable(attachment->dev, table, direction, 0);
> > +   ret = dma_map_sgtable(attachment->dev, table, direction,
> > attrs);
> >     if (ret)
> >             return ERR_PTR(-ENOMEM);
> >     a->mapped = true;
> > @@ -113,9 +114,10 @@ static void cma_heap_unmap_dma_buf(struct
> > dma_buf_attachment *attachment,
> >                                enum dma_data_direction direction)
> >  {
> >     struct dma_heap_attachment *a = attachment->priv;
> > +   int attrs = attachment->dma_map_attrs;
> >  
> >     a->mapped = false;
> > -   dma_unmap_sgtable(attachment->dev, table, direction, 0);
> > +   dma_unmap_sgtable(attachment->dev, table, direction, attrs);
> >  }
> >  
> >  static int cma_heap_dma_buf_begin_cpu_access(struct dma_buf
> > *dmabuf,
> > diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-
> > buf/heaps/system_heap.c
> > index 23a7e74ef966..fc7b1e02988e 100644
> > --- a/drivers/dma-buf/heaps/system_heap.c
> > +++ b/drivers/dma-buf/heaps/system_heap.c
> > @@ -130,9 +130,10 @@ static struct sg_table
> > *system_heap_map_dma_buf(struct dma_buf_attachment *attac
> >  {
> >     struct dma_heap_attachment *a = attachment->priv;
> >     struct sg_table *table = a->table;
> > +   int attrs = attachment->dma_map_attrs;
> >     int ret;
> >  
> > -   ret = dma_map_sgtable(attachment->dev, table, direction, 0);
> > +   ret = dma_map_sgtable(attachment->dev, table, direction,
> > attrs);
> >     if (ret)
> >             return ERR_PTR(ret);
> >  
> > @@ -145,9 +146,10 @@ static void system_heap_unmap_dma_buf(struct
> > dma_buf_attachment *attachment,
> >                                   enum dma_data_direction
> > direction)
> >  {
> >     struct dma_heap_attachment *a = attachment->priv;
> > +   int attrs = attachment->dma_map_attrs;
> >  
> >     a->mapped = false;
> > -   dma_unmap_sgtable(attachment->dev, table, direction, 0);
> > +   dma_unmap_sgtable(attachment->dev, table, direction, attrs);
> >  }
> >  
> >  static int system_heap_dma_buf_begin_cpu_access(struct dma_buf
> > *dmabuf,
> > diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> > index efdc56b9d95f..4d650731766e 100644
> > --- a/include/linux/dma-buf.h
> > +++ b/include/linux/dma-buf.h
> > @@ -379,6 +379,8 @@ struct dma_buf_attach_ops {
> >   * @importer_ops: importer operations for this attachment, if
> > provided
> >   * dma_buf_map/unmap_attachment() must be called with the dma_resv
> > lock held.
> >   * @importer_priv: importer specific attachment data.
> > + * @dma_map_attrs: DMA attributes to be used when the exporter
> > maps the buffer
> > + * through dma_buf_map_attachment.
> >   *
> >   * This structure holds the attachment information between the
> > dma_buf buffer
> >   * and its user device(s). The list contains one attachment struct
> > per device
> > @@ -399,6 +401,7 @@ struct dma_buf_attachment {
> >     const struct dma_buf_attach_ops *importer_ops;
> >     void *importer_priv;
> >     void *priv;
> > +   unsigned long dma_map_attrs;
> >  };
> >  
> >  /**
> > -- 
> > 2.17.1
> > 
> 
> 
