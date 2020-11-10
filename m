Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB1272AD261
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 10:25:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729417AbgKJJZM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Nov 2020 04:25:12 -0500
Received: from verein.lst.de ([213.95.11.211]:35272 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726213AbgKJJZL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Nov 2020 04:25:11 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 4D1126736F; Tue, 10 Nov 2020 10:25:07 +0100 (CET)
Date:   Tue, 10 Nov 2020 10:25:06 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Tomasz Figa <tfiga@chromium.org>, Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH 8/8] WIP: add a dma_alloc_contiguous API
Message-ID: <20201110092506.GA24469@lst.de>
References: <20200930160917.1234225-1-hch@lst.de> <20200930160917.1234225-9-hch@lst.de> <CAAFQd5CttttqMXb=iDPb+Z0WGUa2g=W6JwXJ-5HbhmrDyxP+cQ@mail.gmail.com> <CANiDSCtefXKw-xC3bskyggW-BzCmVPj6GGLvO=cCPZHbS1oTDA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCtefXKw-xC3bskyggW-BzCmVPj6GGLvO=cCPZHbS1oTDA@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 09, 2020 at 03:53:55PM +0100, Ricardo Ribalda wrote:
> Hi Christoph
> 
> I have started now to give a try to your patchset. Sorry for the delay.
> 
> For uvc I have prepared this patch:
> https://github.com/ribalda/linux/commit/9094fe223fe38f8c8ff21366d893b43cbbdf0113
> 
> I have tested successfully in a x86_64 noteboot..., yes I know there
> is no change for that platform :).
> I am trying to get hold of an arm device that can run the latest
> kernel from upstream.
> 
> On the meanwhile if you could take a look to the patch to verify that
> this the way that you expect the drivers to use your api I would
> appreciate it

This looks pretty reaosnable.

Note that ifdef  CONFIG_DMA_NONCOHERENT in the old code doesn't actually
work, as that option is an internal thing just for mips and sh..
