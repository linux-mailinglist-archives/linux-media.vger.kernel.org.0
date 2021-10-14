Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2226D42D72D
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 12:35:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229994AbhJNKhf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Oct 2021 06:37:35 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:53058 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229513AbhJNKhe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Oct 2021 06:37:34 -0400
X-UUID: 34d48e2b00494444a414e17f88bf18b1-20211014
X-UUID: 34d48e2b00494444a414e17f88bf18b1-20211014
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <guangming.cao@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 67651227; Thu, 14 Oct 2021 18:35:26 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Thu, 14 Oct 2021 18:35:25 +0800
Received: from mszswglt01.gcn.mediatek.inc (10.16.20.20) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 14 Oct 2021 18:35:24 +0800
From:   <guangming.cao@mediatek.com>
To:     <christian.koenig@amd.com>, <sumit.semwal@linaro.org>
CC:     <guangming.cao@mediatek.com>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
        <rdunlap@infradead.org>, <wsd_upstream@mediatek.com>,
        Guangming Cao <Guangming.Cao@mediatek.com>
Subject: [PATCH v3] dma-buf: remove restriction of IOCTL:DMA_BUF_SET_NAME
Date:   Thu, 14 Oct 2021 18:35:24 +0800
Message-ID: <20211014103524.55368-1-guangming.cao@mediatek.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211014102551.54983-1-guangming.cao@mediatek.com>
References: <20211014102551.54983-1-guangming.cao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Guangming Cao <Guangming.Cao@mediatek.com>

On Wed, 2021-10-13 at 14:20 +0200, Christian König wrote:
> Am 13.10.21 um 01:56 schrieb Sumit Semwal:
> > Hello Guangming, Christian,
> > 
> > 
> > 
> > On Tue, 12 Oct 2021, 14:09 , <guangming.cao@mediatek.com> wrote:
> > > From: Guangming Cao <Guangming.Cao@mediatek.com>
> > > 
> > > > Am 09.10.21 um 07:55 schrieb guangming.cao@mediatek.com:
> > > > From: Guangming Cao <Guangming.Cao@mediatek.com>
> > > > >
> > > > > If dma-buf don't want userspace users to touch the dmabuf
> > > buffer,
> > > > > it seems we should add this restriction into
> > > dma_buf_ops.mmap,
> > > > > not in this IOCTL:DMA_BUF_SET_NAME.
> > > > >
> > > > > With this restriction, we can only know the kernel users of
> > > the dmabuf
> > > > > by attachments.
> > > > > However, for many userspace users, such as userpsace users of
> > > dma_heap,
> > > > > they also need to mark the usage of dma-buf, and they don't
> > > care about
> > > > > who attached to this dmabuf, and seems it's no meaning to be
> > > waiting for
> > > > > IOCTL:DMA_BUF_SET_NAME rather than mmap.
> > > > 
> > > > Sounds valid to me, but I have no idea why this restriction was
> > > added in 
> > > > the first place.
> > > > 
> > > > Can you double check the git history and maybe identify when
> > > that was 
> > > > added? Mentioning this change in the commit message then might
> > > make 
> > > > things a bit easier to understand.
> > > > 
> > > > Thanks,
> > > > Christian.
> > > It was add in this patch: 
> > > https://patchwork.freedesktop.org/patch/310349/.
> > > However, there is no illustration about it.
> > > I guess it wants users to set_name when no attachments on the
> > > dmabuf,
> > > for case with attachments, we can find owner by device in
> > > attachments.
> > > But just I said in commit message, this is might not a good idea.
> > > 
> > > Do you have any idea?
> > > 
> > 
> > For the original series, the idea was that allowing name change
> > mid-use could confuse the users about the dma-buf. However, the
> > rest of the series also makes sure each dma-buf have a unique
> > inode, and any accounting should probably use that, without relying
> > on the name as much.
> > So I don't have an objection to this change.
>  
> I suggest to add that explanation and the original commit id into the
> commit message.
> 
> With that changed the patch has my rb as well.
> 
> Regards,
> Christian.
>
updated, thanks!
Guangming.

> > Best,
> > Sumit.
> > > > 
> > > > >
> > > > > Signed-off-by: Guangming Cao <Guangming.Cao@mediatek.com>
> > > > > ---
> > > > >   drivers/dma-buf/dma-buf.c | 14 ++------------
> > > > >   1 file changed, 2 insertions(+), 12 deletions(-)
> > > > >
> > > > > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-
> > > buf.c
> > > > > index 511fe0d217a0..db2f4efdec32 100644
> > > > > --- a/drivers/dma-buf/dma-buf.c
> > > > > +++ b/drivers/dma-buf/dma-buf.c
> > > > > @@ -325,10 +325,8 @@ static __poll_t dma_buf_poll(struct file
> > > *file, poll_table *poll)
> > > > >   
> > > > >   /**
> > > > >    * dma_buf_set_name - Set a name to a specific dma_buf to
> > > track the usage.
> > > > > - * The name of the dma-buf buffer can only be set when the
> > > dma-buf is not
> > > > > - * attached to any devices. It could theoritically support
> > > changing the
> > > > > - * name of the dma-buf if the same piece of memory is used
> > > for multiple
> > > > > - * purpose between different devices.
> > > > > + * It could theoretically support changing the name of the
> > > dma-buf if the same
> > > > > + * piece of memory is used for multiple purpose between
> > > different devices.
> > > > >    *
> > > > >    * @dmabuf: [in]     dmabuf buffer that will be renamed.
> > > > >    * @buf:    [in]     A piece of userspace memory that
> > > contains the name of
> > > > > @@ -346,19 +344,11 @@ static long dma_buf_set_name(struct
> > > dma_buf *dmabuf, const char __user *buf)
> > > > >     if (IS_ERR(name))
> > > > >             return PTR_ERR(name);
> > > > >   
> > > > > -   dma_resv_lock(dmabuf->resv, NULL);
> > > > > -   if (!list_empty(&dmabuf->attachments)) {
> > > > > -           ret = -EBUSY;
> > > > > -           kfree(name);
> > > > > -           goto out_unlock;
> > > > > -   }
> > > > >     spin_lock(&dmabuf->name_lock);
> > > > >     kfree(dmabuf->name);
> > > > >     dmabuf->name = name;
> > > > >     spin_unlock(&dmabuf->name_lock);
> > > > >   
> > > > > -out_unlock:
> > > > > -   dma_resv_unlock(dmabuf->resv);
> > > > >     return ret;
> > > > >   }
> > > > >   
> > > 
>  
