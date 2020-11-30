Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED26C2C7FD6
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 09:28:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726671AbgK3I2b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 03:28:31 -0500
Received: from verein.lst.de ([213.95.11.211]:43347 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726332AbgK3I2b (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 03:28:31 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 371E668AFE; Mon, 30 Nov 2020 09:27:47 +0100 (CET)
Date:   Mon, 30 Nov 2020 09:27:46 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
        Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@google.com>
Subject: Re: [PATCH 2/6] dma-direct: use __GFP_ZERO in
 dma_direct_alloc_pages
Message-ID: <20201130082746.GA32234@lst.de>
References: <20201124153845.132207-1-ribalda@chromium.org> <20201124153845.132207-2-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201124153845.132207-2-ribalda@chromium.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 24, 2020 at 04:38:41PM +0100, Ricardo Ribalda wrote:
> From: Christoph Hellwig <hch@lst.de>
> 
> Prepare for supporting the DMA_ATTR_NO_KERNEL_MAPPING flag in
> dma_alloc_pages.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

FYI, this patch should be dropped as I've implemented the functionality
differently.
