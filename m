Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DE42285F1B
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 14:24:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728265AbgJGMYY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 08:24:24 -0400
Received: from verein.lst.de ([213.95.11.211]:37192 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728214AbgJGMYY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 7 Oct 2020 08:24:24 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 8D0B768B02; Wed,  7 Oct 2020 14:24:19 +0200 (CEST)
Date:   Wed, 7 Oct 2020 14:24:18 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Christoph Hellwig <hch@lst.de>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH 8/8] WIP: add a dma_alloc_contiguous API
Message-ID: <20201007122418.GA31318@lst.de>
References: <20200930160917.1234225-1-hch@lst.de> <20200930160917.1234225-9-hch@lst.de> <20201002175040.GA1131147@chromium.org> <20201005082629.GA13850@lst.de> <CAAFQd5DcFjTUpOYkaz4nGxozgOc9oGf9QngjbpXWdcwXTT=kmw@mail.gmail.com> <20201007062150.GA10601@lst.de> <CAAFQd5AtN-ykAF_2mAqGxVugeEegYxfYdS6gD4O3zCY1jznNYA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5AtN-ykAF_2mAqGxVugeEegYxfYdS6gD4O3zCY1jznNYA@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 07, 2020 at 02:21:43PM +0200, Tomasz Figa wrote:
> My initial feeling is that it should work, but we'll give you a
> definitive answer once we prototype it. :)
> 
> We might actually give it a try in the USB HCD subsystem as well, to
> implement usb_alloc_noncoherent(), as an optimization for drivers
> which have to perform multiple random accesses to the URB buffers. I
> think you might recall discussing this by the way of the pwc and
> uvcvideo camera drivers.

Yes.  I guess for usb the dma_alloc_noncoherent as-is in linux-next
might be better.   So if you have the cycles please prototype it
either way, although for that we'd also need at least a
mmap_noncoherent method, and probaby a get_sgtable_noncoherent one.
