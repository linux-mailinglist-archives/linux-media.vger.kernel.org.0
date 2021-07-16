Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FBCC3CB27A
	for <lists+linux-media@lfdr.de>; Fri, 16 Jul 2021 08:25:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234791AbhGPG2p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Jul 2021 02:28:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231778AbhGPG2p (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Jul 2021 02:28:45 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34D6FC06175F;
        Thu, 15 Jul 2021 23:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=nUjvHWwQzpb8v3JLLhXC0gHnxeaBdGyJCLTEJYo+tDU=; b=huSKh0okN6XoYJ0y+dNAPgyNBm
        F7FXsLDRcvDHuySrVPIHVbyStwyItZ/mdSW3L/fqeJJ47c6kBdo/N6Poo2g0iLZB8JaYtHz8Pz2FR
        aF0dgTJomsYvCIKwL6zIjvxUHCQZVJ8bhRZeAG44PSQ4CKcVEXxGf6aM4lt8rptgyJLFsw3ryiGSE
        231k4bokw+Cu6nOyqGfOabFJNNlO6dr/gzmeQIwo5Yqcsx4WM/Nj2H1DHuNNlJVHayhmrjC+8KUyb
        dstirsS0SKabaihWxuTE6mv8KdQ0UMLkuM7hdYgi4xIsWblap+VguVBQB6wwRahw5mGKn3GUSlZeH
        07nz0j9w==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m4HGV-004DCm-CL; Fri, 16 Jul 2021 06:24:28 +0000
Date:   Fri, 16 Jul 2021 07:24:03 +0100
From:   Christoph Hellwig <hch@infradead.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Sven Peter <sven@svenpeter.dev>, Will Deacon <will@kernel.org>,
        Joerg Roedel <joro@8bytes.org>,
        Arnd Bergmann <arnd@kernel.org>, devicetree@vger.kernel.org,
        Hector Martin <marcan@marcan.st>, linux-kernel@vger.kernel.org,
        Marc Zyngier <maz@kernel.org>,
        Mohamed Mediouni <mohamed.mediouni@caramail.com>,
        Stan Skowronek <stan@corellium.com>,
        linux-arm-kernel@lists.infradead.org,
        Mark Kettenis <mark.kettenis@xs4all.nl>,
        iommu@lists.linux-foundation.org, Alexander Graf <graf@amazon.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Rob Herring <robh+dt@kernel.org>, r.czerwinski@pengutronix.de,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v4 0/3] Apple M1 DART IOMMU driver
Message-ID: <YPEmA0rdXHiGtHSx@infradead.org>
References: <20210627143405.77298-1-sven@svenpeter.dev>
 <7261df01-34a9-4e53-37cd-ae1aa15b1fb4@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7261df01-34a9-4e53-37cd-ae1aa15b1fb4@arm.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jul 14, 2021 at 07:19:50PM +0100, Robin Murphy wrote:
> Even at the DMA API level you could hide *some* of it (at the cost of
> effectively only having 1/4 of the usable address space), but there are
> still cases like where v4l2 has a hard requirement that a page-aligned
> scatterlist can be mapped into a contiguous region of DMA addresses.

Where does v4l2 make that broken assumption?  Plenty of dma mapping
implementations including dma-direct do not support that.

Drivers need to call dma_get_merge_boundary() to check for that kind of
behavior.
