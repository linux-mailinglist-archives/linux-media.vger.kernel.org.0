Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 281F52C2804
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 14:33:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388294AbgKXNdS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 08:33:18 -0500
Received: from verein.lst.de ([213.95.11.211]:54461 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388011AbgKXNdS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 08:33:18 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 4C5866736F; Tue, 24 Nov 2020 14:33:15 +0100 (CET)
Date:   Tue, 24 Nov 2020 14:33:15 +0100
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
Subject: Re: [PATCH] WIP! media: uvcvideo: Use dma_alloc_noncontiguos API
Message-ID: <20201124133315.GA30214@lst.de>
References: <20200930160917.1234225-9-hch@lst.de> <20201118142546.170621-1-ribalda@chromium.org> <20201124113512.GA21974@lst.de> <CANiDSCtLrqWBOmC9X91V8P-aahQr2=L-GQNjHM6YauT69_QcEg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCtLrqWBOmC9X91V8P-aahQr2=L-GQNjHM6YauT69_QcEg@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 24, 2020 at 01:01:33PM +0100, Ricardo Ribalda wrote:
> I was hoping that you could answer that question :).
> 
> Do you have other use-cases than linux-media in mind?
> 
> I think Sergey wants to experiment also with vb2, to figure out how
> much it affects it.
> His change will be much more complicated than mine thought, there are
> more cornercases there.

I don't have anything urgend lined up, although I think there are plenty
other potential use cases.

> > Can you respost a combined series to get started?
> 
> Sure. Shall I also include the profiling patch?

That is in the media code, right?  I don't really care too much.
