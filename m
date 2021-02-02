Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A43730BA59
	for <lists+linux-media@lfdr.de>; Tue,  2 Feb 2021 09:53:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232631AbhBBIwQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 03:52:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231621AbhBBIwL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Feb 2021 03:52:11 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCD28C061573;
        Tue,  2 Feb 2021 00:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=FViyHdjUfYiPSPWgGhgWx2i7ISbpBjSz7lj18u2QJ8c=; b=o8BF2/rSSVljt5i8n6qbO/QXkX
        uTDow7BL1VRjIjeNTYduv6qpazB3bUBKMLHOBj7URIf0/QWr57A1PDKoiNiwbmRc+yUb4PPwFtI6e
        qSD2LIFGI1gFs5gBUwxcMHsWFqKbnme6PjxGzqEtWqno5TS1vkPy1DBH6iHJUoH7YVYWENUAMvP+V
        Rs/OJdurrfpD+TrMiS6OL3o1yhBgj8Zc1nEaFh1EtmvXZuoYTnBSt55gELYpUPEhTJDd6qmeBcliT
        QgWqwpuk8K3Gyf6r2ipRWREvVg72kZO/EOhtumjXBvnb1RPc/CeKYG3hnJjaExk0Kh0+F92N7D5zf
        HIFR8YuA==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1l6rP0-00Ewuo-Sx; Tue, 02 Feb 2021 08:51:15 +0000
Date:   Tue, 2 Feb 2021 08:51:14 +0000
From:   Christoph Hellwig <hch@infradead.org>
To:     Suren Baghdasaryan <surenb@google.com>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Minchan Kim <minchan@kernel.org>,
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
Message-ID: <20210202085114.GA3562876@infradead.org>
References: <20210128083817.314315-1-surenb@google.com>
 <20210128091348.GA1962975@infradead.org>
 <CAJuCfpFUhJozS98WJpH0KQKBzyGXvqS1fitu-mgSyhaJ1xL8SQ@mail.gmail.com>
 <YBMAGRIwcbPF17cU@google.com>
 <CAJuCfpF78RYedBoAgkDdgMdfSmNwC2AQk-zZxAqkhCdtBB9gtQ@mail.gmail.com>
 <CAJuCfpH5nwvtMR+32G0-xa_hY-b_Hnw=Figqq9xcsTGgJhOiww@mail.gmail.com>
 <20210202070336.GA3535861@infradead.org>
 <CAJuCfpHWVcL1Cw=nm4THf0EzEan0jyVgLRNOdKr2ZbXex3DUcg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJuCfpHWVcL1Cw=nm4THf0EzEan0jyVgLRNOdKr2ZbXex3DUcg@mail.gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Feb 02, 2021 at 12:44:44AM -0800, Suren Baghdasaryan wrote:
> On Mon, Feb 1, 2021 at 11:03 PM Christoph Hellwig <hch@infradead.org> wrote:
> >
> > IMHO the
> >
> >         BUG_ON(vma->vm_flags & VM_PFNMAP);
> >
> > in vm_insert_page should just become a WARN_ON_ONCE with an error
> > return, and then we just need to gradually fix up the callers that
> > trigger it instead of coming up with workarounds like this.
> 
> For the existing vm_insert_page users this should be fine since
> BUG_ON() guarantees that none of them sets VM_PFNMAP.

Even for them WARN_ON_ONCE plus an actual error return is a way
better assert that is much developer friendly.

> However, for the
> system_heap_mmap I have one concern. When vm_insert_page returns an
> error due to VM_PFNMAP flag, the whole mmap operation should fail
> (system_heap_mmap returning an error leading to dma_buf_mmap failure).
> Could there be cases when a heap user (DRM driver for example) would
> be expected to work with a heap which requires VM_PFNMAP and at the
> same time with another heap which requires !VM_PFNMAP? IOW, this
> introduces a dependency between the heap and its
> user. The user would have to know expectations of the heap it uses and
> can't work with another heap that has the opposite expectation. This
> usecase is purely theoretical and maybe I should not worry about it
> for now?

If such a case ever arises we can look into it.
