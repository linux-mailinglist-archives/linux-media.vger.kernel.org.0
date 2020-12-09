Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F5712D40D4
	for <lists+linux-media@lfdr.de>; Wed,  9 Dec 2020 12:17:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730553AbgLILRX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Dec 2020 06:17:23 -0500
Received: from verein.lst.de ([213.95.11.211]:49769 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726954AbgLILRX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 9 Dec 2020 06:17:23 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id B68FB68AFE; Wed,  9 Dec 2020 12:16:39 +0100 (CET)
Date:   Wed, 9 Dec 2020 12:16:39 +0100
From:   ". Christoph Hellwig" <hch@lst.de>
To:     Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        ". Christoph Hellwig" <hch@lst.de>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
        Joerg Roedel <joro@8bytes.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sergey Senozhatsky <senozhatsky@google.com>
Subject: Re: [PATCH v3 5/6] media: uvcvideo: Use dma_alloc_noncontiguos API
Message-ID: <20201209111639.GB22806@lst.de>
References: <20201125221917.150463-1-ribalda@chromium.org> <20201130083410.GD32234@lst.de> <20201201033658.GE3723071@google.com> <20201201144916.GA14682@lst.de> <CAAFQd5BBEbmENrrZ-vMK9cKOap19XWmfcxwrxKfjWx-wEew8rg@mail.gmail.com> <20201208071320.GA1667627@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201208071320.GA1667627@google.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Dec 08, 2020 at 04:13:20PM +0900, Sergey Senozhatsky wrote:
> On (20/12/08 13:54), Tomasz Figa wrote:
> > 
> > In any case, Sergey is going to share a preliminary patch on how the
> > current API would be used in the V4L2 videobuf2 framework. That should
> > give us more input on how such a helper could look.
> 
> HUGE apologies for the previous screw up! I replied in the
> gmail web-interface and that did not work out as expected
> (at all, big times).

Actually the previous mail was a mime multipart one, and the plain text
version displayed just fine here.  My the gmail engineers finally learned
something after all.

> Another thing to notice is that the new API requires us to have two execution branches
> in allocators - one for the current API; and one for the new API (if it's supported and
> if user-space requested non-coherent allocation).

So I think we do want these branches for coherent vs non-coherent as they
have very different semantics and I do not think that hiding them under
the same API helps people to understand those vastly different semantics.

OTOH we should look into a fallback for DMA API instances that do not
support the discontigous allocations.

I think between your comments and those from Ricardo I have a good idea
for a somewhat updated API.  I'll try to post something in the next days.
