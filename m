Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11B8C327835
	for <lists+linux-media@lfdr.de>; Mon,  1 Mar 2021 08:22:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232447AbhCAHWM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Mar 2021 02:22:12 -0500
Received: from verein.lst.de ([213.95.11.211]:52575 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232441AbhCAHWM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Mar 2021 02:22:12 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 2651568BEB; Mon,  1 Mar 2021 08:21:29 +0100 (CET)
Date:   Mon, 1 Mar 2021 08:21:28 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Cc:     Christoph Hellwig <hch@lst.de>, Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Sergey Senozhatsky <senozhatsky@google.com>,
        "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH 6/7] dma-iommu: implement ->alloc_noncontiguous
Message-ID: <20210301072128.GA27039@lst.de>
References: <20210202095110.1215346-1-hch@lst.de> <20210202095110.1215346-7-hch@lst.de> <CAAFQd5BXAWeB2h4RvqsF1q8ip-Rhew80c7y1_og22-x3rS8KOQ@mail.gmail.com> <20210216084947.GA23897@lst.de> <YDyVFi26RPz5RrJB@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YDyVFi26RPz5RrJB@google.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Mar 01, 2021 at 04:17:42PM +0900, Sergey Senozhatsky wrote:
> > > Do you think we could add the attrs parameter to the
> > > dma_alloc_noncontiguous() API?
> > 
> > Yes, we could probably do that.
> 
> I can cook a patch, unless somebody is already looking into it.

I plan to resend the whole series with the comments very soon.
