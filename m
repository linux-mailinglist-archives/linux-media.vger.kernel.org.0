Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF9F112BE9
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2019 12:59:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726724AbfECK7k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 May 2019 06:59:40 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:48865 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726396AbfECK7k (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 May 2019 06:59:40 -0400
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
        by metis.ext.pengutronix.de with esmtp (Exim 4.89)
        (envelope-from <l.stach@pengutronix.de>)
        id 1hMVuf-0001WY-8u; Fri, 03 May 2019 12:59:33 +0200
Message-ID: <1556881171.2590.20.camel@pengutronix.de>
Subject: Re: [PATCH] media: vb2-dc: skip CPU sync in map/unmap dma_buf
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Hans Verkuil <hverkuil@xs4all.nl>, Pawel Osciak <pawel@osciak.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        patchwork-lst@pengutronix.de, kernel@pengutronix.de,
        linux-media@vger.kernel.org
Date:   Fri, 03 May 2019 12:59:31 +0200
In-Reply-To: <1552384994.2453.27.camel@pengutronix.de>
References: <20190228071943.13072-1-l.stach@pengutronix.de>
         <74da532d-5490-0cd4-32a9-12606994775b@xs4all.nl>
         <1552384994.2453.27.camel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Am Dienstag, den 12.03.2019, 11:03 +0100 schrieb Lucas Stach:
> Hi Hans,
> 
> Am Dienstag, den 12.03.2019, 08:57 +0100 schrieb Hans Verkuil:
> > Pawel and/or Marek, can you take a look at this?

Seems nobody else is interested in this patch. Would you be willing to
take it without further review?

Regards,
Lucas

> > It looks sane to me, but I'd like to have a second opinion as well before
> > merging this.
> > 
> > On 2/28/19 8:19 AM, Lucas Stach wrote:
> > > This is rougly equivalent to ca0e68e21aae (drm/prime: skip CPU sync
> > > in map/unmap dma_buf). The contig memory allocated is already device
> > > coherent memory, so there is no point in doing a CPU sync when
> > > mapping it to another device. Also most importers currently cache
> > > the mapping so the CPU sync would only happen on the first import.
> > > With that in mind we are better off with not pretending to do a
> > > cache synchronization at all.
> > > 
> > > This gets rid of a lot of CPU overhead in uses where those dma-bufs
> > > are regularily imported and detached again, like Weston is currently
> > > doing in the DRM compositor.
> > 
> > Lucas, one question: shouldn't the same be done for dma-sg and vmalloc?
> 
> I think we should do it eventually, as the importer side caching of the
> mappings will undermine any cache maintenance we do in the dmabuf
> map/unmap calls. But then the argument is less clear cut for dma-sg and
> vmalloc as those buffers will most likely have valid allocations in the
> cache. dc is a very clear special case, as the device coherent
> allocations never have valid cache allocations, so dropping the
> synchronization is very low risk to break any existing use-case.
> 
> Both dma-sg and vmalloc require a bit more thought to make the cache
> maintenance both effective and low overhead, so this patch is only a
> start by picking the low-hanging fruit.
> 
> Regards,
> Lucas
> 
> > > 
> > > > > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > > 
> > > ---
> > >  drivers/media/common/videobuf2/videobuf2-dma-contig.c | 8 ++++----
> > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> > > index aff0ab7bf83d..d38f097c14ae 100644
> > > --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> > > +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> > > @@ -273,8 +273,8 @@ static void vb2_dc_dmabuf_ops_detach(struct dma_buf *dbuf,
> > >  
> > > > > >  	/* release the scatterlist cache */
> > > > > >  	if (attach->dma_dir != DMA_NONE)
> > > > > > -		dma_unmap_sg(db_attach->dev, sgt->sgl, sgt->orig_nents,
> > > > > > -			attach->dma_dir);
> > > > > > +		dma_unmap_sg_attrs(db_attach->dev, sgt->sgl, sgt->orig_nents,
> > > > > > +			attach->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
> > > > > >  	sg_free_table(sgt);
> > > > > >  	kfree(attach);
> > > > > >  	db_attach->priv = NULL;
> > > @@ -305,8 +305,8 @@ static struct sg_table *vb2_dc_dmabuf_ops_map(
> > > > > >  	}
> > >  
> > > > > >  	/* mapping to the client with new direction */
> > > > > > -	sgt->nents = dma_map_sg(db_attach->dev, sgt->sgl, sgt->orig_nents,
> > > > > > -				dma_dir);
> > > > > > +	sgt->nents = dma_map_sg_attrs(db_attach->dev, sgt->sgl, sgt->orig_nents,
> > > > > > +				dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
> > > > > >  	if (!sgt->nents) {
> > > > > >  		pr_err("failed to map scatterlist\n");
> > > > > >  		mutex_unlock(lock);
> > > 
> > 
> > 
> 
> 
