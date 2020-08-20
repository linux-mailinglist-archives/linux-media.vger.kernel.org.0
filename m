Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2B3224C66E
	for <lists+linux-media@lfdr.de>; Thu, 20 Aug 2020 21:56:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728092AbgHTT4u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 15:56:50 -0400
Received: from retiisi.org.uk ([95.216.213.190]:40364 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726841AbgHTT4u (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 15:56:50 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 914F6634C87;
        Thu, 20 Aug 2020 22:55:36 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1k8qeu-0002rH-B7; Thu, 20 Aug 2020 22:55:36 +0300
Date:   Thu, 20 Aug 2020 22:55:36 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     hch@lst.de, joro@8bytes.org, linux@armlinux.org.uk,
        will@kernel.org, inki.dae@samsung.com, sw0312.kim@samsung.com,
        kyungmin.park@samsung.com, m.szyprowski@samsung.com,
        agross@kernel.org, bjorn.andersson@linaro.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com, vdumpa@nvidia.com,
        digetx@gmail.com, matthias.bgg@gmail.com, yong.wu@mediatek.com,
        geert+renesas@glider.be, magnus.damm@gmail.com, t-kristo@ti.com,
        s-anna@ti.com, laurent.pinchart@ideasonboard.com,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 17/18] media/omap3isp: Clean up IOMMU workaround
Message-ID: <20200820195536.GL7145@valkosipuli.retiisi.org.uk>
References: <cover.1597931875.git.robin.murphy@arm.com>
 <11d8419744e4e744a9448180801b0c4683328afd.1597931876.git.robin.murphy@arm.com>
 <20200820165339.GK7145@valkosipuli.retiisi.org.uk>
 <be010209-4abc-ba48-4e31-185427776a13@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be010209-4abc-ba48-4e31-185427776a13@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 20, 2020 at 06:25:19PM +0100, Robin Murphy wrote:
> On 2020-08-20 17:53, Sakari Ailus wrote:
> > Hi Robin,
> > 
> > On Thu, Aug 20, 2020 at 04:08:36PM +0100, Robin Murphy wrote:
> > > Now that arch/arm is wired up for default domains and iommu-dma, devices
> > > behind IOMMUs will get mappings set up automatically as appropriate, so
> > > there is no need for drivers to do so manually.
> > > 
> > > Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> > 
> > Thanks for the patch.
> 
> Many thanks for testing so quickly!
> 
> > I haven't looked at the details but it seems that this causes the buffer
> > memory allocation to be physically contiguous, which causes a failure to
> > allocate video buffers of entirely normal size. I guess that was not
> > intentional?
> 
> Hmm, it looks like the device ends up with the wrong DMA ops, which implies
> something didn't go as expected with the earlier IOMMU setup and default
> domain creation. Chances are that either I missed some subtlety in the
> omap_iommu change, or I've fundamentally misjudged how the ISP probing works
> and it never actually goes down the of_iommu_configure() path in the first
> place. Do you get any messages from the IOMMU layer earlier on during boot?

I do get these:

[    2.934936] iommu: Default domain type: Translated 
[    2.940917] omap-iommu 480bd400.mmu: 480bd400.mmu registered
[    2.946899] platform 480bc000.isp: Adding to iommu group 0

-- 
Sakari Ailus
