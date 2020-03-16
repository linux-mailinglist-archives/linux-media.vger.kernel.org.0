Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADC06186834
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 10:52:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730504AbgCPJwT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 05:52:19 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:52120 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730088AbgCPJwT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 05:52:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Transfer-Encoding
        :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=9gN1jKXfKNPlMClYtkwzgjKMpTWUcxSWGH8Lo5JSl80=; b=RQY0032qpY4gKVGok/AN5IZj+2
        Ed429Gy/OgVbQDSoOHin0HFOSvtFDlSueccW3iBGk30zgEfYdPvXEdbvEtMBwMKjHBcV9xOoF5ZFP
        hzo1WJbMtDHWzU4LGYKeZVCTcLAhxSMp2nZQLbUPpwwTFiFUtK9GBdnsi3cDVqqTYqdJ6C0AXbn4k
        qUSLNhAm4dxEbX6LLjkHwS3xhgCrFrRa/4NU9LkzfIRK+CtsZM3MacOUYXr7enCcRiUxgWOrGBYsG
        kOwvQJ3qOS51mtF1atRsdbzYohMh0Z/cYATwznyk1AT5KgP6tkinFNo8TTilHA16NbVX6plpPsRxU
        fm7JDlIw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jDmPt-0006MG-C7; Mon, 16 Mar 2020 09:52:13 +0000
Date:   Mon, 16 Mar 2020 02:52:13 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Jason Gunthorpe <jgg@ziepe.ca>, David1.Zhou@amd.com,
        daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
        intel-gfx@lists.freedesktop.org,
        Logan Gunthorpe <logang@deltatee.com>
Subject: Re: [PATCH 1/6] lib/scatterlist: add sg_set_dma_addr() function
Message-ID: <20200316095213.GA29212@infradead.org>
References: <20200311152838.GA24280@infradead.org>
 <f2b46f49-a8d0-9d43-3120-e1ed36fc3a80@gmail.com>
 <20200312101943.GA14618@infradead.org>
 <b5db44eb-1dde-1671-feb0-9e47d120f172@amd.com>
 <20200312104729.GA26031@infradead.org>
 <20200312141928.GK31668@ziepe.ca>
 <20200313112139.GA4913@infradead.org>
 <20200313121742.GZ31668@ziepe.ca>
 <20200316085642.GC1831@infradead.org>
 <eb567569-426a-0845-b443-a20155897705@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eb567569-426a-0845-b443-a20155897705@amd.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Mar 16, 2020 at 10:41:42AM +0100, Christian König wrote:
> Well I would prefer if the drivers can somehow express their requirements
> and get IOVA structures already in the form they need.
> 
> Converting the IOVA data from one form to another is sometimes quite costly.
> Especially when it is only temporarily needed.

We basically have two ways to generate the IOVA:

  - a linear translation for the direct mapping case or some dumb IOMMU
    drivers - in that case case there is a 1:1 mapping between input
    segments and output segments in DMA mapping
  - a non-trivial IOMMU where all aligned segments are merged into
    a single IOVA range

So I don't really see how the dma layer could help much with any
limitation beyond existing max size and dma boundary ones.
