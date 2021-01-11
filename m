Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAAEF2F0E47
	for <lists+linux-media@lfdr.de>; Mon, 11 Jan 2021 09:37:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727850AbhAKIg6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jan 2021 03:36:58 -0500
Received: from verein.lst.de ([213.95.11.211]:49754 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727240AbhAKIg5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jan 2021 03:36:57 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 7111E67373; Mon, 11 Jan 2021 09:36:14 +0100 (CET)
Date:   Mon, 11 Jan 2021 09:36:14 +0100
From:   ". Christoph Hellwig" <hch@lst.de>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     ". Christoph Hellwig" <hch@lst.de>,
        Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>,
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
Message-ID: <20210111083614.GA27589@lst.de>
References: <20201125221917.150463-1-ribalda@chromium.org> <20201130083410.GD32234@lst.de> <20201201033658.GE3723071@google.com> <20201201144916.GA14682@lst.de> <CAAFQd5BBEbmENrrZ-vMK9cKOap19XWmfcxwrxKfjWx-wEew8rg@mail.gmail.com> <20201208071320.GA1667627@google.com> <20201209111639.GB22806@lst.de> <CANiDSCtsOdJUK3r_t8UNKhh7Px0ANNFJkuwM1fBgZ7wnVh0JFA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCtsOdJUK3r_t8UNKhh7Px0ANNFJkuwM1fBgZ7wnVh0JFA@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 07, 2021 at 03:14:08PM +0100, Ricardo Ribalda wrote:
> > So I think we do want these branches for coherent vs non-coherent as they
> > have very different semantics and I do not think that hiding them under
> > the same API helps people to understand those vastly different semantics.
> >
> > OTOH we should look into a fallback for DMA API instances that do not
> > support the discontigous allocations.
> >
> > I think between your comments and those from Ricardo I have a good idea
> > for a somewhat updated API.  I'll try to post something in the next days.
> 
> Did you have time to look into this?
> 
> No hurry, I just want to make sure that I didn't miss anything ;)

Haven't managed to get to it, sorry.

> 
> Best regards!
> 
> 
> 
> -- 
> Ricardo Ribalda
---end quoted text---
