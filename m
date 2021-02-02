Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35F9430B84C
	for <lists+linux-media@lfdr.de>; Tue,  2 Feb 2021 08:06:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232250AbhBBHEi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 02:04:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232429AbhBBHEd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Feb 2021 02:04:33 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8A96C061573;
        Mon,  1 Feb 2021 23:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=tBP6AtIkMrM+Ev+R7wP7xBQMTerQ6VlEXrvmiPe+MLs=; b=MALRJpA5D6Md9oQRdFOJ2QLDzX
        6lrzxsVryKxlxjPJDrfyR08pgBFY2XL7QGu1RBfmVpjG9zvuMqQxneIaX9dZEnjyGefb6FcrzgxzE
        o3XxbovGKbOC4mJjqTkQOERYx2O5rk5P2gjCfoo2DAZe+vCxZV8g4DMxpN0qalCI/hpDhvOVm4lgN
        mxPa1gZptd7rhi3wN5/s8xy2skHCMadcF2yZBTOAUkOyE6CmrljZwmGI1XsoLCrOx4/AVZe/B95Cn
        88eo9tsaesh1izZGrAPszUYqrMbwdxhU+EOQJrX7ELc6q4vtMjs0Q4az36G/y7JpAsCm6MNnwc8ku
        HPXAWDzw==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1l6piq-00Epu1-L3; Tue, 02 Feb 2021 07:03:36 +0000
Date:   Tue, 2 Feb 2021 07:03:36 +0000
From:   Christoph Hellwig <hch@infradead.org>
To:     Suren Baghdasaryan <surenb@google.com>
Cc:     Minchan Kim <minchan@kernel.org>,
        Christoph Hellwig <hch@infradead.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "(Exiting) Benjamin Gaignard" <benjamin.gaignard@linaro.org>,
        Liam Mark <lmark@codeaurora.org>, labbott@redhat.com,
        Brian Starkey <Brian.Starkey@arm.com>,
        John Stultz <john.stultz@linaro.org>,
        Christian K??nig <christian.koenig@amd.com>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        ??rjan Eide <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        James Jones <jajones@nvidia.com>,
        Hridya Valsaraju <hridya@google.com>,
        Sandeep Patil <sspatil@google.com>,
        linux-media <linux-media@vger.kernel.org>,
        DRI mailing list <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-team <kernel-team@android.com>
Subject: Re: [PATCH 1/1] dma-buf: heaps: Map system heap pages as managed by
 linux vm
Message-ID: <20210202070336.GA3535861@infradead.org>
References: <20210128083817.314315-1-surenb@google.com>
 <20210128091348.GA1962975@infradead.org>
 <CAJuCfpFUhJozS98WJpH0KQKBzyGXvqS1fitu-mgSyhaJ1xL8SQ@mail.gmail.com>
 <YBMAGRIwcbPF17cU@google.com>
 <CAJuCfpF78RYedBoAgkDdgMdfSmNwC2AQk-zZxAqkhCdtBB9gtQ@mail.gmail.com>
 <CAJuCfpH5nwvtMR+32G0-xa_hY-b_Hnw=Figqq9xcsTGgJhOiww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJuCfpH5nwvtMR+32G0-xa_hY-b_Hnw=Figqq9xcsTGgJhOiww@mail.gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

IMHO the

	BUG_ON(vma->vm_flags & VM_PFNMAP);

in vm_insert_page should just become a WARN_ON_ONCE with an error
return, and then we just need to gradually fix up the callers that
trigger it instead of coming up with workarounds like this.
