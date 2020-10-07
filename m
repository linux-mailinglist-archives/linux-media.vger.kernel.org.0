Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45635285894
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 08:22:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727210AbgJGGVy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 02:21:54 -0400
Received: from verein.lst.de ([213.95.11.211]:36263 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726138AbgJGGVy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 7 Oct 2020 02:21:54 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 8B42F67373; Wed,  7 Oct 2020 08:21:50 +0200 (CEST)
Date:   Wed, 7 Oct 2020 08:21:50 +0200
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
Message-ID: <20201007062150.GA10601@lst.de>
References: <20200930160917.1234225-1-hch@lst.de> <20200930160917.1234225-9-hch@lst.de> <20201002175040.GA1131147@chromium.org> <20201005082629.GA13850@lst.de> <CAAFQd5DcFjTUpOYkaz4nGxozgOc9oGf9QngjbpXWdcwXTT=kmw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5DcFjTUpOYkaz4nGxozgOc9oGf9QngjbpXWdcwXTT=kmw@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 06, 2020 at 10:56:04PM +0200, Tomasz Figa wrote:
> > Yes.  And make sure the API isn't implemented when VIVT caches are
> > used, but that isn't really different from the current interface.
> 
> Okay, thanks. Let's see if we can make necessary changes to the videobuf2.
> 
> +Sergey Senozhatsky for awareness too.

I can defer the changes a bit to see if you'd really much prefer
the former interface.  I think for now the most important thing is
that it works properly for the potential users, and the prime one is
videobuf2 for now.  drm also seems like a big potential users, but I
had a really hard time getting the developers to engage in API
development.
