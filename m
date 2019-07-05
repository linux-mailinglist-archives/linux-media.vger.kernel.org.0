Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DD03600AF
	for <lists+linux-media@lfdr.de>; Fri,  5 Jul 2019 07:44:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727586AbfGEFoj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Jul 2019 01:44:39 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:48730 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727212AbfGEFoj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Jul 2019 01:44:39 -0400
X-UUID: b1fdf8ee34ad435ca1edd69820101c9c-20190705
X-UUID: b1fdf8ee34ad435ca1edd69820101c9c-20190705
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by mailgw01.mediatek.com
        (envelope-from <jungo.lin@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 403666900; Fri, 05 Jul 2019 13:44:33 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 5 Jul 2019 13:44:31 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 5 Jul 2019 13:44:31 +0800
Message-ID: <1562305471.1212.58.camel@mtksdccf07>
Subject: Re: [RFC,v3 9/9] media: platform: Add Mediatek ISP P1 shared memory
 device
From:   Jungo Lin <jungo.lin@mediatek.com>
To:     Tomasz Figa <tfiga@chromium.org>
CC:     <devicetree@vger.kernel.org>,
        Sean Cheng =?UTF-8?Q?=28=E9=84=AD=E6=98=87=E5=BC=98=29?= 
        <sean.cheng@mediatek.com>,
        Frederic Chen =?UTF-8?Q?=28=E9=99=B3=E4=BF=8A=E5=85=83=29?= 
        <frederic.chen@mediatek.com>,
        Rynn Wu =?UTF-8?Q?=28=E5=90=B3=E8=82=B2=E6=81=A9=29?= 
        <rynn.wu@mediatek.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Rob Herring <robh@kernel.org>,
        Ryan Yu =?UTF-8?Q?=28=E4=BD=99=E5=AD=9F=E4=BF=AE=29?= 
        <ryan.yu@mediatek.com>,
        Frankie Chiu =?UTF-8?Q?=28=E9=82=B1=E6=96=87=E5=87=B1=29?= 
        <frankie.chiu@mediatek.com>, Hans Verkuil <hverkuil@xs4all.nl>,
        <ddavenport@chromium.org>, Sj Huang <sj.huang@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        "Linux Media Mailing List" <linux-media@vger.kernel.org>
Date:   Fri, 5 Jul 2019 13:44:31 +0800
In-Reply-To: <CAAFQd5BaTQ-Q7gsE0X+d4_81OZq9WHaCYkmALt7_4A1JFo=_8g@mail.gmail.com>
References: <jungo.lin@mediatek.com>
         <20190611035344.29814-1-jungo.lin@mediatek.com>
         <20190611035344.29814-10-jungo.lin@mediatek.com>
         <20190701072532.GB137710@chromium.org>
         <1562297618.1212.46.camel@mtksdccf07>
         <CAAFQd5BaTQ-Q7gsE0X+d4_81OZq9WHaCYkmALt7_4A1JFo=_8g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi, Tomasz:
On Fri, 2019-07-05 at 13:22 +0900, Tomasz Figa wrote:
> Hi Jungo,
> 
> On Fri, Jul 5, 2019 at 12:33 PM Jungo Lin <jungo.lin@mediatek.com> wrote:
> >
> > Hi Tomasz,
> >
> > On Mon, 2019-07-01 at 16:25 +0900, Tomasz Figa wrote:
> > > Hi Jungo,
> > >
> > > On Tue, Jun 11, 2019 at 11:53:44AM +0800, Jungo Lin wrote:
> > > > The purpose of this child device is to provide shared
> > > > memory management for exchanging tuning data between co-processor
> > > > and the Pass 1 unit of the camera ISP system, including cache
> > > > buffer handling.
> > > >
> > >
> > > Looks like we haven't really progressed on getting this replaced with
> > > something that doesn't require so much custom code. Let me propose something
> > > better then.
> > >
> > > We already have a reserved memory mode in DT. If it has a compatible string
> > > of "shared-dma-pool", it would be registered in the coherent DMA framework
> > > [1]. That would make it available for consumer devices to look-up.
> > >
> > > Now if we add a "memory-region" property to the SCP device node and point it
> > > to our reserved memory node, the SCP driver could look it up and hook to the
> > > DMA mapping API using of_reserved_mem_device_init_by_idx[2].
> > >
> > > That basically makes any dma_alloc_*(), dma_map_*(), etc. calls on the SCP
> > > struct device use the coherent DMA ops, which operate on the assigned memory
> > > pool. With that, the P1 driver could just directly use those calls to
> > > manage the memory, without any custom code.
> > >
> > > There is an example how this setup works in the s5p-mfc driver[3], but it
> > > needs to be noted that it creates child nodes, because it can have more than
> > > 1 DMA port, which may need its own memory pool. In our case, we wouldn't
> > > need child nodes and could just use the SCP device directly.
> > >
> > > [1] https://elixir.bootlin.com/linux/v5.2-rc7/source/kernel/dma/coherent.c#L345
> > > [2] https://elixir.bootlin.com/linux/v5.2-rc7/source/drivers/of/of_reserved_mem.c#L312
> > > [3] https://elixir.bootlin.com/linux/v5.2-rc7/source/drivers/media/platform/s5p-mfc/s5p_mfc.c#L1075
> > >
> > > Let me also post some specific comments below, in case we end up still
> > > needing any of the code.
> > >
> >
> > Thanks your suggestions.
> >
> > After applying your suggestion in SCP device driver, we could remove
> > mtk_cam-smem.h/c. Currently, we use dma_alloc_coherent with SCP device
> > to get SCP address. We could touch the buffer with this SCP address in
> > SCP processor.
> >
> > After that, we use dma_map_page_attrs with P1 device which supports
> > IOMMU domain to get IOVA address. For this address, we will assign
> > it to our ISP HW device to proceed.
> >
> > Below is the snippet for ISP P1 compose buffer initialization.
> >
> >         ptr = dma_alloc_coherent(p1_dev->cam_dev.smem_dev,
> >                                  MAX_COMPOSER_SIZE, &addr, GFP_KERNEL);
> >         if (!ptr) {
> >                 dev_err(dev, "failed to allocate compose memory\n");
> >                 return -ENOMEM;
> >         }
> >         isp_ctx->scp_mem_pa = addr;
> 
> addr contains a DMA address, not a physical address. Could we call it
> scp_mem_dma instead?
> 

Ok, we will rename this.

> >         dev_dbg(dev, "scp addr:%pad\n", &addr);
> >
> >         /* get iova address */
> >         addr = dma_map_page_attrs(dev, phys_to_page(addr), 0,
> 
> addr is a DMA address, so phys_to_page() can't be called on it. The
> simplest thing here would be to use dma_map_single() with ptr as the
> CPU address expected.
> 

Got it. We will revise to use dma_map_single() with ptr.

> >                                   MAX_COMPOSER_SIZE, DMA_BIDIRECTIONAL,
> >                                   DMA_ATTR_SKIP_CPU_SYNC);
> >         if (dma_mapping_error(dev, addr)) {
> >                 isp_ctx->scp_mem_pa = 0;
> 
> We also need to free the allocated memory.
> 

Ok, we will add the dma_unmap_single to free the allocated memory.

> >                 dev_err(dev, "Failed to map scp iova\n");
> >                 return -ENOMEM;
> >         }
> >         isp_ctx->scp_mem_iova = addr;
> >
> > Moreover, we have another meta input buffer usage.
> > For this kind of buffer, it will be allocated by V4L2 framework
> > with dma_alloc_coherent with SCP device. In order to get IOVA,
> > we will add dma_map_page_attrs in vb2_ops' buf_init function.
> > In buf_cleanup function, we will call dma_unmap_page_attrs function.
> 
> As per above, we don't have access to the struct page we want to map.
> We probably want to get the CPU VA using vb2_plane_vaddr() and call
> dma_map_single() instead.
> 

Got it. We will revise this to use dma_map_single() with CPU VA which is
got from vb2_plane_vaddr() function.

> >
> > Based on these current implementation, do you think it is correct?
> > If we got any wrong, please let us know.
> >
> > Btw, we also DMA_ATTR_NO_KERNEL_MAPPING DMA attribte to
> > avoid dma_sync_sg_for_device. Othewise, it will hit the KE.
> > Maybe we could not get the correct sg_table.
> > Do you think it is a bug and need to fix?
> 
> I think DMA_ATTR_NO_KERNEL_MAPPING is good to have for all the buffers
> that don't need to be accessed from the kernel anyway, to avoid
> unnecessary kernel mapping operations. However, for coherent memory
> pool, it doesn't change anything, because the memory always has a
> kernel mapping. We also need the kernel virtual address for
> dma_map_single(). Also the flag doesn't eliminate the need to do the
> sync, e.g. if the userspace accesses the buffer.
> 
> Could you give me more information about the failure you're seeing?
> Where is the dma_sync_sg_for_device() called from? Where do you get
> the sgtable from?
> 
> Best regards,
> Tomasz

Sorry. I forgot provide one information related to this issue.
Here is the call stack of panic KE if we enable DMA_ATTR_NON_CONSISTENT
DMA flag. Maybe we should not enable this flag for coherent memory pool.

[Function]
vb2_dc_alloc

[Code]
	if (!(buf->attrs & DMA_ATTR_NO_KERNEL_MAPPING) &&
	    (buf->attrs & DMA_ATTR_NON_CONSISTENT))
		buf->dma_sgt = vb2_dc_get_base_sgt(buf);

[KE]
[   59.234326] pstate: 80000005 (Nzcv daif -PAN -UAO)
[   59.234935] pc : __clean_dcache_area_poc+0x20/0x38
[   59.235537] lr : __swiotlb_sync_sg_for_device+0x74/0x9c
[   59.249430] Call trace:
[   59.249742]  __clean_dcache_area_poc+0x20/0x38
[   59.250303]  vb2_dc_prepare+0x5c/0x6c
[   59.250763]  __buf_prepare+0x790/0x8a4
[   59.251234]  vb2_req_prepare+0x38/0x68
[   59.251707]  vb2_request_validate+0x40/0x9c
[   59.252235]  media_request_ioctl+0x124/0x2a4
[   59.252774]  __arm64_compat_sys_ioctl+0xf4/0x25c
[   59.253356]  el0_svc_common+0xa4/0x154
[   59.253828]  el0_svc_compat_handler+0x2c/0x38
[   59.254377]  el0_svc_compat+0x8/0x18
[   59.254827] Code: 9ac32042 8b010001 d1000443 8a230000 (d50b7a20)
[   59.255592] ---[ end trace eb37ebade032c2fc ]---
[   59.256173] Kernel panic - not syncing: Fatal exception

Thanks,

Jungo


