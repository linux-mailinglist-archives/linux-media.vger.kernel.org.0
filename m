Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B8513BF487
	for <lists+linux-media@lfdr.de>; Thu,  8 Jul 2021 06:21:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbhGHEYD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Jul 2021 00:24:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbhGHEYC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Jul 2021 00:24:02 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 815A4C061574;
        Wed,  7 Jul 2021 21:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=77m8A8TvwRFVR/JL6IH9OVAJZSv5m+xL9r+uut0gWrE=; b=XPt01X6UkV7rGd6LHEXZR1NKe4
        3yW7hiUcn60dUf2JhvwoW4h0q/Wu7LtxE+5EazlbwldAKTxr19PIvq+MCPol0O6DC8NjXFcqJ/WKX
        TjWv3OT6OB81SAXqjy4FsIVWSmxeCZ8FncVaHc540DT0r0OzOaawhAwnRSR4Ing9OSxJb8O0ke31Q
        YbpZeSn3Y3HtJdYkyZCRMqg70Qm53VTdYsIY/9aKL21jMOW9AMiOzicFQ3eg5LQGLrwYuPCM0z1pb
        5/1FxXV97+cOCmgWBHl2dZhNe9bXkjHSeMTkKYNk8A54+Y2fIJh3LoUeNvNUE8so8qyA82+kJq78O
        HiV1XAew==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m1LWv-00D4oo-4R; Thu, 08 Jul 2021 04:21:02 +0000
Date:   Thu, 8 Jul 2021 05:20:53 +0100
From:   Christoph Hellwig <hch@infradead.org>
To:     John Stultz <john.stultz@linaro.org>
Cc:     Christoph Hellwig <hch@infradead.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
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
        linux-media <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Mel Gorman <mgorman@suse.de>, linux-mm <linux-mm@kvack.org>
Subject: Re: page pools, was Re: [PATCH v9 1/5] drm: Add a sharable drm
 page-pool implementation
Message-ID: <YOZ9JZlwkjyDGti5@infradead.org>
References: <20210630013421.735092-1-john.stultz@linaro.org>
 <20210630013421.735092-2-john.stultz@linaro.org>
 <YOVL1f4m+8ly9fyM@infradead.org>
 <CALAqxLUubzuLkFxmWjfPQHaFU8EkWuGo7nDhfkgi4wPGHnBoVw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALAqxLUubzuLkFxmWjfPQHaFU8EkWuGo7nDhfkgi4wPGHnBoVw@mail.gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jul 07, 2021 at 12:35:23PM -0700, John Stultz wrote:
> So, as Christian mentioned, on the TTM side it's useful, as they are
> trying to avoid TLB flushes when changing caching attributes.
> 
> For the dmabuf system heap purposes, the main benefit is moving the
> page zeroing to the free path, rather than the allocation path. This
> on its own doesn't save much, but allows us to defer frees (and thus
> the zeroing) to the background, which can get that work out of the hot
> path.

I really do no think that is worth it to fragment the free pages.
