Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A283C712D0
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2019 09:27:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388341AbfGWH1a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jul 2019 03:27:30 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:35359 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729058AbfGWH1a (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jul 2019 03:27:30 -0400
Received: by mail-ed1-f67.google.com with SMTP id w20so42830373edd.2
        for <linux-media@vger.kernel.org>; Tue, 23 Jul 2019 00:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1QlHARNuAEM55ng9LI2PK094YJbPBsPKwUhBWwwJxAE=;
        b=GNlo2z9/gRyz2tn6m0dlRs6mqPEnRbD/asUCRnl1aF44DAofjVcSqECn/MAtb7YBsK
         3kkr5Z7cG4HEpFGvQteQf8ss4x44lWI+LqVF6bIvIwIzNXpvPNckKyaTqNU1yNm8B3G4
         68CHD0Jycaot+EixnKORpvZMw2xDl8mRupMfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1QlHARNuAEM55ng9LI2PK094YJbPBsPKwUhBWwwJxAE=;
        b=Uwf6g40/LKAGI9lrippS4qXftyn+zpiU08Md419Y/uCdqxNJDzqihv03JHIDWln5yI
         +7AfxmIKskrX9tAdO76WkUyxBAZIBirBVc53hHi3EzkAAfe/EC+KIBm58/wkSCwcwch/
         5uZk6a4IUDxYH7oPH88KcHWhmd/h8w14lfj2NJcE0aoY/qpFykkg3n0HLE0A4xAO2cSc
         o7cpZtYlfrcO6XIWkcBcya2JP6sxML++osXEP48yMQnXJQ9HjeaZt+XJcHoS9VgYXn7Y
         kz34M/1m9xr39nA6MW0lkOQm36DA3peBZT05J2eSoG+egNag6mWV+jcNWkSWvg8F42og
         FzqQ==
X-Gm-Message-State: APjAAAU8zKvAcNaugPG/n8kiH5IpMkIj46GdAhDVQmdOXX3kAPew8vhl
        +qXtB4RyuMF2GLfL3e5NG7iOJuMAhMks1g==
X-Google-Smtp-Source: APXvYqzH4EGVTSZ2qLJXDPGxHRtcMYi8PlEE7CAhlY/NhIayStn/E1ePQpp/5MdcFkL08oeMrt2q8w==
X-Received: by 2002:a50:eb0b:: with SMTP id y11mr64371519edp.224.1563866847967;
        Tue, 23 Jul 2019 00:27:27 -0700 (PDT)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com. [209.85.128.49])
        by smtp.gmail.com with ESMTPSA id a6sm11346816eds.19.2019.07.23.00.27.27
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Jul 2019 00:27:27 -0700 (PDT)
Received: by mail-wm1-f49.google.com with SMTP id s15so16133625wmj.3
        for <linux-media@vger.kernel.org>; Tue, 23 Jul 2019 00:27:27 -0700 (PDT)
X-Received: by 2002:a7b:c7d8:: with SMTP id z24mr67945684wmk.10.1563866435393;
 Tue, 23 Jul 2019 00:20:35 -0700 (PDT)
MIME-Version: 1.0
References: <jungo.lin@mediatek.com> <20190611035344.29814-1-jungo.lin@mediatek.com>
 <20190611035344.29814-10-jungo.lin@mediatek.com> <20190701072532.GB137710@chromium.org>
 <1562297618.1212.46.camel@mtksdccf07> <CAAFQd5BaTQ-Q7gsE0X+d4_81OZq9WHaCYkmALt7_4A1JFo=_8g@mail.gmail.com>
 <1562313579.1212.73.camel@mtksdccf07>
In-Reply-To: <1562313579.1212.73.camel@mtksdccf07>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 23 Jul 2019 16:20:23 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AaNFpMGCVJREY85n8UetEwd99TOka8-ECoLzMbMkos_g@mail.gmail.com>
Message-ID: <CAAFQd5AaNFpMGCVJREY85n8UetEwd99TOka8-ECoLzMbMkos_g@mail.gmail.com>
Subject: Re: [RFC,v3 9/9] media: platform: Add Mediatek ISP P1 shared memory device
To:     Jungo Lin <jungo.lin@mediatek.com>
Cc:     devicetree@vger.kernel.org,
        =?UTF-8?B?U2VhbiBDaGVuZyAo6YSt5piH5byYKQ==?= 
        <sean.cheng@mediatek.com>,
        =?UTF-8?B?RnJlZGVyaWMgQ2hlbiAo6Zmz5L+K5YWDKQ==?= 
        <frederic.chen@mediatek.com>,
        =?UTF-8?B?UnlubiBXdSAo5ZCz6IKy5oGpKQ==?= <rynn.wu@mediatek.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Rob Herring <robh@kernel.org>,
        =?UTF-8?B?UnlhbiBZdSAo5L2Z5a2f5L+uKQ==?= <ryan.yu@mediatek.com>,
        =?UTF-8?B?RnJhbmtpZSBDaGl1ICjpgrHmloflh7Ep?= 
        <frankie.chiu@mediatek.com>, Hans Verkuil <hverkuil@xs4all.nl>,
        ddavenport@chromium.org, Sj Huang <sj.huang@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jungo,

On Fri, Jul 5, 2019 at 4:59 PM Jungo Lin <jungo.lin@mediatek.com> wrote:
>
> Hi Tomasz:
>
> On Fri, 2019-07-05 at 13:22 +0900, Tomasz Figa wrote:
> > Hi Jungo,
> >
> > On Fri, Jul 5, 2019 at 12:33 PM Jungo Lin <jungo.lin@mediatek.com> wrote:
> > >
> > > Hi Tomasz,
>
> [snip]
>
> > > After applying your suggestion in SCP device driver, we could remove
> > > mtk_cam-smem.h/c. Currently, we use dma_alloc_coherent with SCP device
> > > to get SCP address. We could touch the buffer with this SCP address in
> > > SCP processor.
> > >
> > > After that, we use dma_map_page_attrs with P1 device which supports
> > > IOMMU domain to get IOVA address. For this address, we will assign
> > > it to our ISP HW device to proceed.
> > >
> > > Below is the snippet for ISP P1 compose buffer initialization.
> > >
> > >         ptr = dma_alloc_coherent(p1_dev->cam_dev.smem_dev,
> > >                                  MAX_COMPOSER_SIZE, &addr, GFP_KERNEL);
> > >         if (!ptr) {
> > >                 dev_err(dev, "failed to allocate compose memory\n");
> > >                 return -ENOMEM;
> > >         }
> > >         isp_ctx->scp_mem_pa = addr;
> >
> > addr contains a DMA address, not a physical address. Could we call it
> > scp_mem_dma instead?
> >
> > >         dev_dbg(dev, "scp addr:%pad\n", &addr);
> > >
> > >         /* get iova address */
> > >         addr = dma_map_page_attrs(dev, phys_to_page(addr), 0,
> >
> > addr is a DMA address, so phys_to_page() can't be called on it. The
> > simplest thing here would be to use dma_map_single() with ptr as the
> > CPU address expected.
> >
>
> We have changed to use ma_map_single() with ptr, but encounter IOMMU
> error. From the debug log of iommu_dma_map_page[3], we got
> 0x0000000054800000 instead of expected address: 0x0000000050800000[2].
> There is a address offset(0x4000000). If we change to use
> dma_map_page_attrs with phys_to_page(addr), the address is correct as we
> expected[2]. Do you have any suggestion on this issue? Do we miss
> something?

Sorry for the late reply. Could you show me the code changes you made
to use dma_map_single()? It would sound like the virtual address
passed to dma_map_single() isn't correct.

Best regards,
Tomasz

>
> [1]
> [    1.344786] __dma_alloc_from_coherent: 0x800000 PAGE_SHIFT:12
> device_base:0x0000000050000000 dma:0x0000000050800000
> virt_base:ffffff8014000000 va:ffffff8014800000
>
> [    1.346890] mtk-cam 1a000000.camisp: scp addr:0x0000000050800000
> va:ffffff8014800000
>
> [    1.347864] iommu_dma_map_page:0x0000000054800000 offset:0
> [    1.348562] mtk-cam 1a000000.camisp: iova addr:0x00000000fde00000
>
> [2]
> [    1.346738] __dma_alloc_from_coherent: 0x800000 PAGE_SHIFT:12
> device_base:0x0000000050000000 dma:0x0000000050800000
> virt_base:ffffff8014000000 va:ffffff8014800000
> [    1.348841] mtk-cam 1a000000.camisp: scp addr:0x0000000050800000
> va:ffffff8014800000
> [    1.349816] iommu_dma_map_page:0x0000000050800000 offset:0
> [    1.350514] mtk-cam 1a000000.camisp: iova addr:0x00000000fde00000
>
>
> [3]
> dma_addr_t iommu_dma_map_page(struct device *dev, struct page *page,
>                 unsigned long offset, size_t size, int prot)
> {
>         phys_addr_t phys = page_to_phys(page);
>         pr_err("iommu_dma_map_page:%pa offset:%lu\n", &phys, offset);
>
>         return __iommu_dma_map(dev, page_to_phys(page) + offset, size, prot,
>                         iommu_get_dma_domain(dev));
> }
>
> [snip]
>
> Best regards,
>
> Jungo
>
