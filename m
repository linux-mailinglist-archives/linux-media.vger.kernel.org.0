Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CC4A326C8C
	for <lists+linux-media@lfdr.de>; Sat, 27 Feb 2021 10:46:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229990AbhB0Jp0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Feb 2021 04:45:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229835AbhB0JpZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Feb 2021 04:45:25 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39571C06174A;
        Sat, 27 Feb 2021 01:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=VM97Uq4A/bCQIc/VoHqSqFkNPx4rjzARqOagWBxiges=; b=SKkxTFVQGBEexrjxqtvuYKWWED
        aAQ8DzdHIn0tLqrmToW8ZXHVMYFIwYEx7wi8Ex29ZliP2FIwM9UeXgfxISkr4wt+zJrxbVfQiF0JD
        pRk8z/HTstagvSa0jQAT6a5xA700xOBEG1+ykRjF5o4b2aDAnVO3yZ3fuYgrHzYZ+Fi0/zAlPXqqz
        J8o9NZ/vX0+N5e3HX6QMy81r/ZrNh6nVHXEx9aSAQUwtzlTOqHtV7D+00NX9c1mlKJ82e4V54KPKs
        xlPTSrn+LWw0YWNPIwEYroc1iy8Jb7zPLnxtM+MqbI0e3AYj/sedUodrc8j7sAzocxflolvpkla7k
        bVbVxCJA==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1lFw9M-00D9J5-Lf; Sat, 27 Feb 2021 09:44:37 +0000
Date:   Sat, 27 Feb 2021 09:44:36 +0000
From:   Christoph Hellwig <hch@infradead.org>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     John Stultz <john.stultz@linaro.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Christian Koenig <christian.koenig@amd.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Sandeep Patil <sspatil@google.com>,
        Daniel Mentz <danielmentz@google.com>,
        ??rjan Eide <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>,
        James Jones <jajones@nvidia.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] dma-buf: heaps: Set VM_PFNMAP in mmap for system and cma
 heaps
Message-ID: <20210227094436.GA3130571@infradead.org>
References: <20210226040908.3274666-1-john.stultz@linaro.org>
 <CAKMK7uHGutJiZ879NAweTHka=gZQBw9zWQSDJn6bTLS6bJwvvg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uHGutJiZ879NAweTHka=gZQBw9zWQSDJn6bTLS6bJwvvg@mail.gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Feb 26, 2021 at 08:36:55AM +0100, Daniel Vetter wrote:
> Also given that both deal with struct page there's a ton of divergence
> between these two that doesn't make much sense. Maybe could even share
> the code fully, aside from how you allocate the struct pages.

I've been saying that since the code was first submitted.  Once pages
are allocated from CMA they should be treated not different from normal
pages.

Please take a look at how the DMA contigous allocator manages to share
all code for handling CMA vs alloc_pages pages.
