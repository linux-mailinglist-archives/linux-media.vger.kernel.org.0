Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56E0F3BE339
	for <lists+linux-media@lfdr.de>; Wed,  7 Jul 2021 08:38:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230297AbhGGGlO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jul 2021 02:41:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229696AbhGGGlO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jul 2021 02:41:14 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 458F7C061574;
        Tue,  6 Jul 2021 23:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=bc4Z0xsNZ+Qib25Sb0XowG/YW6Uaak0wMUKXosyWUSc=; b=VVAbl5BoRPxb4NyG3wYR3XHH84
        js9nmtGeUMcyPETf1DqawXv1d9riVJBY1fKovhK9jXHYOkoRU4ebXu2jZqmjDu4lgqPaNs6SeR+/A
        z/JhLRTrred07bqtmWNcnS8f/5j7C3EjJEcMx5h7FExrcrnLAPbjl2VdNCvCdAo39ZN8pUbNAGreq
        LdwCiPCOxZIEHZbWI+ymmJePW+BTJLid0hqmr6SZg3++ZLTT9J8W2j046jvY8x9+A/jecwIyUFsiO
        s3fD6fbV9D0xXdz7WZGGIWJKtRNk1PRZpabt8RJKou7JgZxNddHi8/fhTmYa8ftIgMYxZ3dcGlwJB
        +FpEkujQ==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m11CH-00C7za-Sn; Wed, 07 Jul 2021 06:38:19 +0000
Date:   Wed, 7 Jul 2021 07:38:13 +0100
From:   Christoph Hellwig <hch@infradead.org>
To:     John Stultz <john.stultz@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
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
        James Jones <jajones@nvidia.com>, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, Mel Gorman <mgorman@suse.de>,
        linux-mm@kvack.org
Subject: page pools, was Re: [PATCH v9 1/5] drm: Add a sharable drm page-pool
 implementation
Message-ID: <YOVL1f4m+8ly9fyM@infradead.org>
References: <20210630013421.735092-1-john.stultz@linaro.org>
 <20210630013421.735092-2-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210630013421.735092-2-john.stultz@linaro.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 30, 2021 at 01:34:17AM +0000, John Stultz wrote:
> This adds a shrinker controlled page pool, extracted
> out of the ttm_pool logic, and abstracted out a bit
> so it can be used by other non-ttm drivers.

Can you explain in detail why you need a differnt page pool over the one
maintained by the page allocator?  Fragmenting the memory into all kinds
of pools has lots of downsides, so the upsides need to be explained in
detail.
