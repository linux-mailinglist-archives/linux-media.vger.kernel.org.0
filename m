Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 065F02CA64D
	for <lists+linux-media@lfdr.de>; Tue,  1 Dec 2020 15:53:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391626AbgLAOuB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Dec 2020 09:50:01 -0500
Received: from verein.lst.de ([213.95.11.211]:50170 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389038AbgLAOuA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Dec 2020 09:50:00 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 8C8EB67373; Tue,  1 Dec 2020 15:49:16 +0100 (CET)
Date:   Tue, 1 Dec 2020 15:49:16 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Cc:     Christoph Hellwig <hch@lst.de>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
        Joerg Roedel <joro@8bytes.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@google.com>
Subject: Re: [PATCH v3 5/6] media: uvcvideo: Use dma_alloc_noncontiguos API
Message-ID: <20201201144916.GA14682@lst.de>
References: <20201125221917.150463-1-ribalda@chromium.org> <20201130083410.GD32234@lst.de> <20201201033658.GE3723071@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201201033658.GE3723071@google.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Dec 01, 2020 at 12:36:58PM +0900, Sergey Senozhatsky wrote:
> Not that I have any sound experience in this area, but the helper
> probably won't hurt. Do you also plan to add vmap() to that helper
> or dma_alloc_noncontiguous()/sg_alloc_table_from_pages() only?

Yes, I think adding the vmap is useful, and it probably makes sense
to do that unconditionally.  I'd also include the fallback to
dma_alloc_pages when the noncontig version isn't supported in the
helper.
