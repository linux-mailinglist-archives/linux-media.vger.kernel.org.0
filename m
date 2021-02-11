Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C239F318BA6
	for <lists+linux-media@lfdr.de>; Thu, 11 Feb 2021 14:12:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231244AbhBKNKg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Feb 2021 08:10:36 -0500
Received: from verein.lst.de ([213.95.11.211]:55322 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231868AbhBKNHS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Feb 2021 08:07:18 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 6F35F6736F; Thu, 11 Feb 2021 14:06:25 +0100 (CET)
Date:   Thu, 11 Feb 2021 14:06:25 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Christoph Hellwig <hch@lst.de>, Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sergey Senozhatsky <senozhatsky@google.com>,
        "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: add a new dma_alloc_noncontiguous API v2
Message-ID: <20210211130625.GA20155@lst.de>
References: <20210202095110.1215346-1-hch@lst.de> <20210207184855.GA27553@lst.de> <CAAFQd5BzAvgiTLGFse+ZWUrFtZ1Ysf+p+e-4rW8gq_iP0xhWEA@mail.gmail.com> <20210209082213.GA31902@lst.de> <CANiDSCuzKczCnAdC9b0r-6WVBFYXYnvQHKbxSeYq2QW1uVsDLQ@mail.gmail.com> <CANiDSCvPodsmcOi1fMwvZsyMxWsRQWNT7VkbZs4=XePYXfiXow@mail.gmail.com> <20210209170217.GA10199@lst.de> <CANiDSCs8dXVoWuwkVs=v+=s770MpzH1xiDuj-080-98ynuz97g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCs8dXVoWuwkVs=v+=s770MpzH1xiDuj-080-98ynuz97g@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Feb 11, 2021 at 10:08:18AM +0100, Ricardo Ribalda wrote:
> Hi Christoph
> 
> What are your merge plans for the uvc change?
> http://git.infradead.org/users/hch/dma-mapping.git/commit/3dc47131f8aacc2093f68a9971d24c754e435520
> 
> Are you going to remove the patch on your Merge request and then send
> it for review to Laurent? or merge it through your tree with a S-o-B
> him?

I though I had all the ACKs to queue it up.  Is that not what was
intended?  Queueing up the API without a user is generally a bad idea.

