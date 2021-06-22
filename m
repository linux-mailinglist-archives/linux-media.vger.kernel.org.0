Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEF763B0856
	for <lists+linux-media@lfdr.de>; Tue, 22 Jun 2021 17:11:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232116AbhFVPOC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Jun 2021 11:14:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230510AbhFVPOB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Jun 2021 11:14:01 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1A67C061574
        for <linux-media@vger.kernel.org>; Tue, 22 Jun 2021 08:11:44 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id d5so1550269qtd.5
        for <linux-media@vger.kernel.org>; Tue, 22 Jun 2021 08:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GfBcan5Oq/+F6rqd3wteDDUo+4mA0t9y3pSH6r/kVdI=;
        b=oQKSqDMY5ui7ysN6RXa17KyJ2Wzpm89WOS/VTDpLsBMmjFt0xKup1/rN3Iu2Ysn7kj
         0o4QpiviU+XCzwAjOmd3ASe2G50DR4wQM1cxJ/IcnSoJE+UREjasIpFci4SAI/zjLeO4
         BaVYbbQSqm0nAX/Y00oQm+1Fl/s1cHNEiBtnrRSnwG+/c0ZPfPFGw36xuMKNGuUPMk6/
         S9czK9NLULrCof4fVnQi6scmnRJl9iMhmlDxM2xpQloNB9qi5QwwBnyh0jFdiD4S4nEx
         BNdzQik55X4yiVc76B5/N6HeFax4G1G02Yo0H2X2M1eLLt5C2jCamVulCHYNUMYd6Nkl
         GXvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GfBcan5Oq/+F6rqd3wteDDUo+4mA0t9y3pSH6r/kVdI=;
        b=pPOuk3hZXPEwssMde/slRQ/Z2MBpcCwzMq30g9HkPyzRGrwIoLkErtl7F73HfhrPQy
         mk7V28Ah/Z7nYb8c7ULN1Vht7hjP5akgKY+cHhT853yFxY3DLbWcko1sCyFFH0+4c2ng
         qw7nZaQYm0n5bXBtsB+7dNE55L85A2xyUEVI8ANDtRd9iIBgXMkvXHU9/27x/Dcifm9w
         uOKlpsu01vKHNumtsTfMR1OhJlCyYSlSg8x639u8pwTBywxXhL0F3RDM3rz8RtXGtj3X
         sddXz5bsKzgZVVyPv872CUZTryfeaQRCqB15v/NsKre2C21aVM1ZzxR7PU43U6MhxKUi
         fqGg==
X-Gm-Message-State: AOAM5300WGYs+uE/6Ei9IBi7MHUCyArGdoszv0bBKR0fdFL75ZJhjHaJ
        AvGIKYZ55OVEYNFfwTKkwjVCTw==
X-Google-Smtp-Source: ABdhPJyIvo3ZVkwIuidF8Fxvcg1uTF/rMIUzGf5xwZlLSDUGqkiRqy7l/P12S4XnoNrAjy14Ik1xNg==
X-Received: by 2002:ac8:5dd2:: with SMTP id e18mr3979783qtx.263.1624374704154;
        Tue, 22 Jun 2021 08:11:44 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-113-94.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.113.94])
        by smtp.gmail.com with ESMTPSA id m3sm10504480qkk.27.2021.06.22.08.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 08:11:43 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1lvi3y-00AD4o-Si; Tue, 22 Jun 2021 12:11:42 -0300
Date:   Tue, 22 Jun 2021 12:11:42 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Oded Gabbay <oded.gabbay@gmail.com>
Cc:     Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
        Gal Pressman <galpress@amazon.com>, sleybo@amazon.com,
        linux-rdma <linux-rdma@vger.kernel.org>,
        Oded Gabbay <ogabbay@kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Doug Ledford <dledford@redhat.com>,
        Tomer Tayar <ttayar@habana.ai>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Leon Romanovsky <leonro@nvidia.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Subject: Re: [Linaro-mm-sig] [PATCH v3 1/2] habanalabs: define uAPI to export
 FD for DMA-BUF
Message-ID: <20210622151142.GA2431880@ziepe.ca>
References: <20210621175511.GI1096940@ziepe.ca>
 <CAKMK7uEO1_B59DtM7N2g7kkH7pYtLM_WAkn+0f3FU3ps=XEjZQ@mail.gmail.com>
 <CAFCwf11jOnewkbLuxUESswCJpyo7C0ovZj80UrnwUOZkPv2JYQ@mail.gmail.com>
 <20210621232912.GK1096940@ziepe.ca>
 <d358c740-fd3a-9ecd-7001-676e2cb44ec9@gmail.com>
 <CAFCwf11h_Nj_GEdCdeTzO5jgr-Y9em+W-v_pYUfz64i5Ac25yg@mail.gmail.com>
 <20210622120142.GL1096940@ziepe.ca>
 <CAFCwf10GmBjeJAFp0uJsMLiv-8HWAR==RqV9ZdMQz+iW9XWdTA@mail.gmail.com>
 <20210622121546.GN1096940@ziepe.ca>
 <CAFCwf13BuS+U3Pko_62hFPuvZPG26HQXuu-cxPmcADNPO22g9g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFCwf13BuS+U3Pko_62hFPuvZPG26HQXuu-cxPmcADNPO22g9g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 22, 2021 at 04:12:26PM +0300, Oded Gabbay wrote:

> > 1) Setting sg_page to NULL
> > 2) 'mapping' pages for P2P DMA without going through the iommu
> > 3) Allowing P2P DMA without using the p2p dma API to validate that it
> >    can work at all in the first place.
> >
> > All of these result in functional bugs in certain system
> > configurations.
> >
> > Jason
> 
> Hi Jason,
> Thanks for the feedback.
> Regarding point 1, why is that a problem if we disable the option to
> mmap the dma-buf from user-space ? 

Userspace has nothing to do with needing struct pages or not

Point 1 and 2 mostly go together, you supporting the iommu is not nice
if you dont have struct pages.

You should study Logan's patches I pointed you at as they are solving
exactly this problem.

> In addition, I didn't see any problem with sg_page being NULL in the
> RDMA p2p dma-buf code. Did I miss something here ?

No, the design of the dmabuf requires the exporter to do the dma maps
and so it is only the exporter that is wrong to omit all the iommu and
p2p logic.

RDMA is OK today only because nobody has implemented dma buf support
in rxe/si - mainly because the only implementations of exporters don't
set the struct page and are thus buggy.

> I will take two GAUDI devices and use one as an exporter and one as an
> importer. I want to see that the solution works end-to-end, with real
> device DMA from importer to exporter.

I can tell you it doesn't. Stuffing physical addresses directly into
the sg list doesn't involve any of the IOMMU code so any configuration
that requires IOMMU page table setup will not work.

Jason
