Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8244533AC55
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 08:35:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229663AbhCOHek (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 03:34:40 -0400
Received: from verein.lst.de ([213.95.11.211]:52581 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230113AbhCOHeT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 03:34:19 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id D61A668C4E; Mon, 15 Mar 2021 08:34:16 +0100 (CET)
Date:   Mon, 15 Mar 2021 08:34:16 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@google.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH v4 6/6] media: uvcvideo: Use dma_alloc_noncontiguous API
Message-ID: <20210315073416.GA25860@lst.de>
References: <20210312235521.1408503-1-ribalda@chromium.org> <CANiDSCvK8AD7RUYGN-7e1zH9cMGTqGnwn4fJ+ZfKtktuJC14Nw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCvK8AD7RUYGN-7e1zH9cMGTqGnwn4fJ+ZfKtktuJC14Nw@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Mar 15, 2021 at 08:30:57AM +0100, Ricardo Ribalda wrote:
> Hi Christoph
> 
> I guess you can merge this patch from your tree. I hope it is not too
> late in this release cycle.

The timing is perfectly fine, I haven't even started the dma-mapping tree
for v5.13 yet.
