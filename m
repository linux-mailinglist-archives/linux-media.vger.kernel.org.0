Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 527993BE36C
	for <lists+linux-media@lfdr.de>; Wed,  7 Jul 2021 09:15:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230340AbhGGHSB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jul 2021 03:18:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230312AbhGGHSB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jul 2021 03:18:01 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0605CC061574;
        Wed,  7 Jul 2021 00:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=qgP4dqrgrNAWWYzN10vwwnL4jCkYS3ZFGuIkGEq6E6Q=; b=gtmh+CfiK9rsRm6VYrmNHuTvRm
        ARTQH0d1hYpQuDRcfmJgPi44o72pVtbs+wBK4UE1cq6IUzBnP1jr6fPRczUxDcfb6jNck4axxz90/
        L3/U9JouDFpeORcCICMtvyBmnvMsiCh6W4YyffyqahvDhc1HpBe1+/JuVvNVvGeGHB2IWmJr/7Ss+
        9V4waSHitW/XIWmSxAuhX7zNiZGlX26gIscWK6nnwKn/tHakF+xcXYOiOvPzpElSyp//yDog33hS0
        4rga9++ADk+dZkdfiEW0jf4QKum0GChNKiySl4V7/VVU5tb9VvGgreZOjT4gZ/aDXeyPyFqG4owXD
        e/hN2ZbQ==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m11lX-00C9Tz-Ir; Wed, 07 Jul 2021 07:14:43 +0000
Date:   Wed, 7 Jul 2021 08:14:39 +0100
From:   Christoph Hellwig <hch@infradead.org>
To:     Christian K??nig <christian.koenig@amd.com>
Cc:     Christoph Hellwig <hch@infradead.org>,
        John Stultz <john.stultz@linaro.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
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
        James Jones <jajones@nvidia.com>, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, Mel Gorman <mgorman@suse.de>,
        linux-mm@kvack.org
Subject: Re: page pools, was Re: [PATCH v9 1/5] drm: Add a sharable drm
 page-pool implementation
Message-ID: <YOVUX1ZmZ3YZpjic@infradead.org>
References: <20210630013421.735092-1-john.stultz@linaro.org>
 <20210630013421.735092-2-john.stultz@linaro.org>
 <YOVL1f4m+8ly9fyM@infradead.org>
 <afea8c13-ef8d-7eb1-c362-8d6d1649751d@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afea8c13-ef8d-7eb1-c362-8d6d1649751d@amd.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jul 07, 2021 at 09:10:26AM +0200, Christian K??nig wrote:
> Well, the original code all this is based on already had the comment that
> this really belong into the page allocator.
> 
> The key point is traditionally only GPUs used uncached and write-combined
> memory in such large quantities that having a pool for them makes sense.
> 
> Because of this we had this separately to reduce the complexity in the page
> allocator to handle another set of complexity of allocation types.
> 
> For the upside, for those use cases it means huge performance improvements
> for those drivers. See the numbers John provided in the cover letter.
> 
> But essentially at least I would be totally fine moving this into the page
> allocator, but moving it outside of TTM already helps with this goal. So
> this patch set is certainly a step into the right direction.

Unless I'm badly misreading the patch and this series there is nothing
about cache attributes in this code.  It just allocates pages, zeroes
them, eventually hands them out to a consumer and registers a shrinker
for its freelist.

If OTOH it actually dealt with cachability that should be documented
in the commit log and probably also the naming of the implementation.
