Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A61EA2CBEB9
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 14:54:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730104AbgLBNvv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 08:51:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726023AbgLBNvu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Dec 2020 08:51:50 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6DC6C0613D4;
        Wed,  2 Dec 2020 05:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=HTpUrPcIYJd48XoC2O+vr1XJ7fM5ADU8xkYFkpaEXss=; b=VLe6X5a0R0cAk5RGhUyxCTm58a
        EJ0qPdjTQUFvkf43cniSjL8g2Y++3DP+NoE1PuAmUXTxpE0kzDQ9HpmHCelZ7g3DKmWe4dRSYzm0M
        JjhIhBmarD5tjqlMEBNICAV3i8LyyHDzGuIBNlZwEB1CFd9tTqAHn8DLRrvMCZohQPS51Lvvi7KVs
        oK+A/BJuhehyX1yJgnyzekqx38ujuCd7a4l7E8lkdWTE6oNQEZH2sgWhKfOHF4cvqM4NLntNjQA4V
        OcyIIxZ6ImINhoQ8gK52pwbXVLbiKeK51hEknmAhmcwmAc1+lIr4lF19l0JijmzTyJxjnx0msMkES
        YPf5UrFw==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kkSX9-0001iK-JN; Wed, 02 Dec 2020 13:51:03 +0000
Date:   Wed, 2 Dec 2020 13:51:03 +0000
From:   Christoph Hellwig <hch@infradead.org>
To:     Minchan Kim <minchan@kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>, hyesoo.yu@samsung.com,
        willy@infradead.org, david@redhat.com, iamjoonsoo.kim@lge.com,
        vbabka@suse.cz, surenb@google.com, pullip.cho@samsung.com,
        joaodias@google.com, hridya@google.com, sumit.semwal@linaro.org,
        john.stultz@linaro.org, Brian.Starkey@arm.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        robh@kernel.org, christian.koenig@amd.com,
        linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v2 3/4] dma-buf: add export symbol for dma-heap
Message-ID: <20201202135103.GA5902@infradead.org>
References: <20201201175144.3996569-1-minchan@kernel.org>
 <20201201175144.3996569-4-minchan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201201175144.3996569-4-minchan@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Dec 01, 2020 at 09:51:43AM -0800, Minchan Kim wrote:
> From: Hyesoo Yu <hyesoo.yu@samsung.com>
> 
> The heaps could be added as module, so some functions should
> be exported to register dma-heaps. And dma-heap of module can use
> cma area to allocate and free. However the function related cma
> is not exported now. Let's export them for next patches.
> 
> Signed-off-by: Hyesoo Yu <hyesoo.yu@samsung.com>
> Signed-off-by: Minchan Kim <minchan@kernel.org>

NAK.  I really don't think any module has business gaining that
kind of low-level access to the various symbols.  I think in general
your heap can just be built-in and we should be fine.
