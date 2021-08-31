Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 278593FC1A5
	for <lists+linux-media@lfdr.de>; Tue, 31 Aug 2021 05:43:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239721AbhHaDoc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Aug 2021 23:44:32 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:47734 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S239719AbhHaDoa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Aug 2021 23:44:30 -0400
X-UUID: 4a0dc76cfe024ee08efc38d92901c77a-20210831
X-UUID: 4a0dc76cfe024ee08efc38d92901c77a-20210831
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
        (envelope-from <guangming.cao@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1749306869; Tue, 31 Aug 2021 11:43:33 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 31 Aug 2021 11:43:32 +0800
Received: from mszswglt01.gcn.mediatek.inc (10.16.20.20) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 31 Aug 2021 11:43:31 +0800
From:   <guangming.cao@mediatek.com>
To:     <christian.koenig@amd.com>
CC:     <Brian.Starkey@arm.com>, <benjamin.gaignard@linaro.org>,
        <dri-devel@lists.freedesktop.org>, <guangming.cao@mediatek.com>,
        <john.stultz@linaro.org>, <labbott@redhat.com>,
        <linaro-mm-sig@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <lmark@codeaurora.org>,
        <matthias.bgg@gmail.com>, <sumit.semwal@linaro.org>,
        <wsd_upstream@mediatek.com>,
        Guangming Cao <Guangming.Cao@mediatek.com>
Subject: Re: [PATCH] dma-buf: heaps: remove duplicated cache sync
Date:   Tue, 31 Aug 2021 11:44:05 +0800
Message-ID: <20210831034405.41916-1-guangming.cao@mediatek.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <dd5ba603-8c9d-f6a0-cbcc-dfb353fb6701@amd.com>
References: <dd5ba603-8c9d-f6a0-cbcc-dfb353fb6701@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Guangming Cao <Guangming.Cao@mediatek.com>

> Am 30.08.21 um 12:01 schrieb guangming.cao@mediatek.com:
> > From: Guangming Cao <Guangming.Cao@mediatek.com>
> >
> > Current flow, one dmabuf maybe call cache sync many times if
> > it has beed mapped more than one time.
>
> Well I'm not an expert on DMA heaps, but this will most likely not work 
> correctly.
>
All attachments of one dmabuf will add into a list, I think it means dmabuf
supports map more than one time. Could you tell me more about it?

> > Is there any case that attachments of one dmabuf will points to
> > different memory? If not, seems do sync only one time is more better.
>
> I think that this can happen, yes.
>
> Christian.
>
Seems it's a very special case on Android, if you don't mind, could you
tell me more about it?

>
> >
> > Signed-off-by: Guangming Cao <Guangming.Cao@mediatek.com>
> > ---
> >   drivers/dma-buf/heaps/system_heap.c | 14 ++++++++------
> >   1 file changed, 8 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
> > index 23a7e74ef966..909ef652a8c8 100644
> > --- a/drivers/dma-buf/heaps/system_heap.c
> > +++ b/drivers/dma-buf/heaps/system_heap.c
> > @@ -162,9 +162,10 @@ static int system_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
> >   		invalidate_kernel_vmap_range(buffer->vaddr, buffer->len);
> >   
> >   	list_for_each_entry(a, &buffer->attachments, list) {
> > -		if (!a->mapped)
> > -			continue;
> > -		dma_sync_sgtable_for_cpu(a->dev, a->table, direction);
> > +		if (a->mapped) {
> > +			dma_sync_sgtable_for_cpu(a->dev, a->table, direction);
> > +			break;
> > +		}
> >   	}
> >   	mutex_unlock(&buffer->lock);
> >   
> > @@ -183,9 +184,10 @@ static int system_heap_dma_buf_end_cpu_access(struct dma_buf *dmabuf,
> >   		flush_kernel_vmap_range(buffer->vaddr, buffer->len);
> >   
> >   	list_for_each_entry(a, &buffer->attachments, list) {
> > -		if (!a->mapped)
> > -			continue;
> > -		dma_sync_sgtable_for_device(a->dev, a->table, direction);
> > +		if (!a->mapped) {
> > +			dma_sync_sgtable_for_device(a->dev, a->table, direction);
> > +			break;
> > +		}
> >   	}
> >   	mutex_unlock(&buffer->lock);
> >   
