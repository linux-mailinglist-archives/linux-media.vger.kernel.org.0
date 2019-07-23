Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6D7C713D3
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2019 10:22:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733152AbfGWIWG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jul 2019 04:22:06 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:61532 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730607AbfGWIWG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jul 2019 04:22:06 -0400
X-UUID: 23e65561bb444eb98374601fb86d5bb5-20190723
X-UUID: 23e65561bb444eb98374601fb86d5bb5-20190723
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <jungo.lin@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 288121177; Tue, 23 Jul 2019 16:21:58 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 23 Jul 2019 16:21:57 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 23 Jul 2019 16:21:57 +0800
Message-ID: <1563870117.1212.455.camel@mtksdccf07>
Subject: Re: [RFC, v3 9/9] media: platform: Add Mediatek ISP P1 shared
 memory device
From:   Jungo Lin <jungo.lin@mediatek.com>
To:     Tomasz Figa <tfiga@chromium.org>
CC:     <devicetree@vger.kernel.org>,
        Sean Cheng =?UTF-8?Q?=28=E9=84=AD=E6=98=87=E5=BC=98=29?= 
        <sean.cheng@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rynn Wu =?UTF-8?Q?=28=E5=90=B3=E8=82=B2=E6=81=A9=29?= 
        <rynn.wu@mediatek.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Rob Herring <robh@kernel.org>,
        Ryan Yu =?UTF-8?Q?=28=E4=BD=99=E5=AD=9F=E4=BF=AE=29?= 
        <ryan.yu@mediatek.com>,
        Frankie Chiu =?UTF-8?Q?=28=E9=82=B1=E6=96=87=E5=87=B1=29?= 
        <frankie.chiu@mediatek.com>, Hans Verkuil <hverkuil@xs4all.nl>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sj Huang <sj.huang@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        <ddavenport@chromium.org>,
        Frederic Chen =?UTF-8?Q?=28=E9=99=B3=E4=BF=8A=E5=85=83=29?= 
        <frederic.chen@mediatek.com>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        "Linux Media Mailing List" <linux-media@vger.kernel.org>
Date:   Tue, 23 Jul 2019 16:21:57 +0800
In-Reply-To: <CAAFQd5AaNFpMGCVJREY85n8UetEwd99TOka8-ECoLzMbMkos_g@mail.gmail.com>
References: <jungo.lin@mediatek.com>
         <20190611035344.29814-1-jungo.lin@mediatek.com>
         <20190611035344.29814-10-jungo.lin@mediatek.com>
         <20190701072532.GB137710@chromium.org>
         <1562297618.1212.46.camel@mtksdccf07>
         <CAAFQd5BaTQ-Q7gsE0X+d4_81OZq9WHaCYkmALt7_4A1JFo=_8g@mail.gmail.com>
         <1562313579.1212.73.camel@mtksdccf07>
         <CAAFQd5AaNFpMGCVJREY85n8UetEwd99TOka8-ECoLzMbMkos_g@mail.gmail.com>
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

On Tue, 2019-07-23 at 16:20 +0900, Tomasz Figa wrote:
> Hi Jungo,
> 
> On Fri, Jul 5, 2019 at 4:59 PM Jungo Lin <jungo.lin@mediatek.com> wrote:
> >
> > Hi Tomasz:
> >
> > On Fri, 2019-07-05 at 13:22 +0900, Tomasz Figa wrote:
> > > Hi Jungo,
> > >
> > > On Fri, Jul 5, 2019 at 12:33 PM Jungo Lin <jungo.lin@mediatek.com> wrote:
> > > >
> > > > Hi Tomasz,
> >
> > [snip]
> >
> > > > After applying your suggestion in SCP device driver, we could remove
> > > > mtk_cam-smem.h/c. Currently, we use dma_alloc_coherent with SCP device
> > > > to get SCP address. We could touch the buffer with this SCP address in
> > > > SCP processor.
> > > >
> > > > After that, we use dma_map_page_attrs with P1 device which supports
> > > > IOMMU domain to get IOVA address. For this address, we will assign
> > > > it to our ISP HW device to proceed.
> > > >
> > > > Below is the snippet for ISP P1 compose buffer initialization.
> > > >
> > > >         ptr = dma_alloc_coherent(p1_dev->cam_dev.smem_dev,
> > > >                                  MAX_COMPOSER_SIZE, &addr, GFP_KERNEL);
> > > >         if (!ptr) {
> > > >                 dev_err(dev, "failed to allocate compose memory\n");
> > > >                 return -ENOMEM;
> > > >         }
> > > >         isp_ctx->scp_mem_pa = addr;
> > >
> > > addr contains a DMA address, not a physical address. Could we call it
> > > scp_mem_dma instead?
> > >
> > > >         dev_dbg(dev, "scp addr:%pad\n", &addr);
> > > >
> > > >         /* get iova address */
> > > >         addr = dma_map_page_attrs(dev, phys_to_page(addr), 0,
> > >
> > > addr is a DMA address, so phys_to_page() can't be called on it. The
> > > simplest thing here would be to use dma_map_single() with ptr as the
> > > CPU address expected.
> > >
> >
> > We have changed to use ma_map_single() with ptr, but encounter IOMMU
> > error. From the debug log of iommu_dma_map_page[3], we got
> > 0x0000000054800000 instead of expected address: 0x0000000050800000[2].
> > There is a address offset(0x4000000). If we change to use
> > dma_map_page_attrs with phys_to_page(addr), the address is correct as we
> > expected[2]. Do you have any suggestion on this issue? Do we miss
> > something?
> 
> Sorry for the late reply. Could you show me the code changes you made
> to use dma_map_single()? It would sound like the virtual address
> passed to dma_map_single() isn't correct.
> 
> Best regards,
> Tomasz
> 


Please check the below code snippet in today's testing.

	p1_dev->cam_dev.smem_dev = &p1_dev->scp_pdev->dev;
	ptr = dma_alloc_coherent(p1_dev->cam_dev.smem_dev,
				 MTK_ISP_COMPOSER_MEM_SIZE, &addr, GFP_KERNEL);
	if (!ptr) {
		dev_err(dev, "failed to allocate compose memory\n");
		return -ENOMEM;
	}
	p1_dev->composer_scp_addr = addr;
	p1_dev->composer_virt_addr = ptr;
	dev_info(dev, "scp addr:%pad va:%pK\n", &addr, ptr);

	/* get iova address */
	addr = dma_map_single(dev, ptr, MTK_ISP_COMPOSER_MEM_SIZE,
DMA_BIDIRECTIONAL);
	if (dma_mapping_error(dev, addr)) {
		dma_free_coherent(p1_dev->cam_dev.smem_dev,
				  MTK_ISP_COMPOSER_MEM_SIZE,
				  ptr, p1_dev->composer_scp_addr);
		dev_err(dev, "Failed to map scp iova\n");
		ret = -ENOMEM;
		goto fail_free_mem;
	}
	p1_dev->composer_iova = addr;
	dev_info(dev, "scp iova addr:%pad\n", &addr);

Moreover, below is extracted log[2].

We guess the virtual address which is returned by dma_alloc_coherent
function is not valid kernel logical address. It is actually returned by
memremap() in dma_init_coherent_memory(). Moreover, dma_map_single()
will call virt_to_page() function. For virt_to_page function, it
requires a logical address[1].

[1]https://www.oreilly.com/library/view/linux-device-drivers/0596005903/ch15.html

[2]
  322 [    1.238269] mtk-cam-p1 1a006000.camisp: scp
addr:0x0000000052000000 va:00000000a3adc471
  323 [    1.239582] mtk-cam-p1 1a006000.camisp: scp iova
addr:0x00000000fde00000
 7716 [    1.238963] mtk-cam-p1 1a006000.camisp: scp
addr:0x0000000052000000 va:0000000042ec580f
 7717 [    1.240276] mtk-cam-p1 1a006000.camisp: scp iova
addr:0x00000000fde00000
15088 [    1.239309] mtk-cam-p1 1a006000.camisp: scp
addr:0x0000000052000000 va:000000005e5b3462
15089 [    1.240626] mtk-cam-p1 1a006000.camisp: scp iova
addr:0x00000000fde00000

Best regards,

Jungo

> >
> > [1]
> > [    1.344786] __dma_alloc_from_coherent: 0x800000 PAGE_SHIFT:12
> > device_base:0x0000000050000000 dma:0x0000000050800000
> > virt_base:ffffff8014000000 va:ffffff8014800000
> >
> > [    1.346890] mtk-cam 1a000000.camisp: scp addr:0x0000000050800000
> > va:ffffff8014800000
> >
> > [    1.347864] iommu_dma_map_page:0x0000000054800000 offset:0
> > [    1.348562] mtk-cam 1a000000.camisp: iova addr:0x00000000fde00000
> >
> > [2]
> > [    1.346738] __dma_alloc_from_coherent: 0x800000 PAGE_SHIFT:12
> > device_base:0x0000000050000000 dma:0x0000000050800000
> > virt_base:ffffff8014000000 va:ffffff8014800000
> > [    1.348841] mtk-cam 1a000000.camisp: scp addr:0x0000000050800000
> > va:ffffff8014800000
> > [    1.349816] iommu_dma_map_page:0x0000000050800000 offset:0
> > [    1.350514] mtk-cam 1a000000.camisp: iova addr:0x00000000fde00000
> >
> >
> > [3]
> > dma_addr_t iommu_dma_map_page(struct device *dev, struct page *page,
> >                 unsigned long offset, size_t size, int prot)
> > {
> >         phys_addr_t phys = page_to_phys(page);
> >         pr_err("iommu_dma_map_page:%pa offset:%lu\n", &phys, offset);
> >
> >         return __iommu_dma_map(dev, page_to_phys(page) + offset, size, prot,
> >                         iommu_get_dma_domain(dev));
> > }
> >
> > [snip]
> >
> > Best regards,
> >
> > Jungo
> >
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek


