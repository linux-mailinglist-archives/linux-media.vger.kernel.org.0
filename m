Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3A1330D188
	for <lists+linux-media@lfdr.de>; Wed,  3 Feb 2021 03:29:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230083AbhBCC10 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 21:27:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229881AbhBCC1U (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Feb 2021 21:27:20 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED5C4C061573
        for <linux-media@vger.kernel.org>; Tue,  2 Feb 2021 18:26:34 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id z6so22416442wrq.10
        for <linux-media@vger.kernel.org>; Tue, 02 Feb 2021 18:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Uc4Qty+5tEkUX3Oy4yRHsOTw3F10hKVAPg2EbH1/158=;
        b=RsYuDkkjXxaWE8kw/n+kzBzlYdKiQ17h3HXujdu00oj/DBl5tpK/+tbtqtVKSbg0aQ
         K84VvjMxpwhMsx9QCpdfEmalSWpry53eknjWVRW2ZtzszFvkGzuijhora5Zg0IN2hARc
         Q3e2sT6/kCvOu5hHd+6oMNslcg6fz/ukZdn2FY8IyekWHSUF3ILilPxAF7Du7kRomgjh
         mswhSMsTitGj64T88bkD4pR3RwXt96GMUQWWBeN9kJSeE4PLkcprxlugFDRXKHecP/ja
         SOnz509daLDVsJiZQM1E0gtyBcpH6wRBXbGA37hGcEUdrKdqqm74qYFIYAbGCsXlh5Dy
         Z1AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Uc4Qty+5tEkUX3Oy4yRHsOTw3F10hKVAPg2EbH1/158=;
        b=JK7gKYDsaEN7wLrK5t25c7H7mPl0osTL2O95BzHCDWaMXKOcXuw3rFslA2PkZSkJcE
         jSVEI1WPkaKTUB0xE0Kzfp+h2LF8krdbgr6ylDGzvEt6dZ6clV6LH3p859ALFR/et6og
         kqpRlFfEK6zUNfYuJ+cwY5mAjlyzfNErlHDkLFGGdy4wbFe1TuLh59sBljwmfDR50k+R
         KBzaMZWMiFJ1fMuOweRAE+U42MDl1hwZ+hofXpKuBM+YzAeQaS1l+ykssrt4SsvACIJC
         mOIfvKfnu7irKwX/P9o4mxf33Jtfhth4aCoJocgUD5dWeN88fWGH71B6rWZ0ywmvDivu
         SJtg==
X-Gm-Message-State: AOAM5332EZIhRnblIGW1SL1fClVYQceY0gQDUGgaZER6aW/EQYH52m2E
        vOdGITwNvfzi+i9VI7ouPIkibb9PE7VRr+/jCjDUzQ==
X-Google-Smtp-Source: ABdhPJy6fGFUBvfPcPkeOCTJpRJofvPTFjYyVYvrOMlWx5vJKlJpzyy3HdXZL3OGYGKpL/SuZw5CvuxZEEfSKXife4g=
X-Received: by 2002:a5d:453b:: with SMTP id j27mr930767wra.92.1612319193577;
 Tue, 02 Feb 2021 18:26:33 -0800 (PST)
MIME-Version: 1.0
References: <20210203003134.2422308-1-surenb@google.com> <20210203015553.GX308988@casper.infradead.org>
In-Reply-To: <20210203015553.GX308988@casper.infradead.org>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Tue, 2 Feb 2021 18:26:22 -0800
Message-ID: <CAJuCfpGUTBcEkdaF68hQhwRfHSgdv9+KF5MBZqA86rBYhzhFXg@mail.gmail.com>
Subject: Re: [PATCH 1/2] mm: replace BUG_ON in vm_insert_page with a return of
 an error
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Christoph Hellwig <hch@infradead.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@redhat.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        John Stultz <john.stultz@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        James Jones <jajones@nvidia.com>,
        Minchan Kim <minchan@kernel.org>,
        Hridya Valsaraju <hridya@google.com>,
        Sandeep Patil <sspatil@google.com>,
        linux-media <linux-media@vger.kernel.org>,
        DRI mailing list <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, linux-mm <linux-mm@kvack.org>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-team <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Feb 2, 2021 at 5:55 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Tue, Feb 02, 2021 at 04:31:33PM -0800, Suren Baghdasaryan wrote:
> > Replace BUG_ON(vma->vm_flags & VM_PFNMAP) in vm_insert_page with
> > WARN_ON_ONCE and returning an error. This is to ensure users of the
> > vm_insert_page that set VM_PFNMAP are notified of the wrong flag usage
> > and get an indication of an error without panicing the kernel.
> > This will help identifying drivers that need to clear VM_PFNMAP before
> > using dmabuf system heap which is moving to use vm_insert_page.
>
> NACK.
>
> The system may not _panic_, but it is clearly now _broken_.  The device
> doesn't work, and so the system is useless.  You haven't really improved
> anything here.  Just bloated the kernel with yet another _ONCE variable
> that in a normal system will never ever ever be triggered.

We had a discussion in https://lore.kernel.org/patchwork/patch/1372409
about how some DRM drivers set up their VMAs with VM_PFNMAP before
mapping them. We want to use vm_insert_page instead of remap_pfn_range
in the dmabuf heaps so that this memory is visible in PSS. However if
a driver that sets VM_PFNMAP tries to use a dmabuf heap, it will step
into this BUG_ON. We wanted to catch and gradually fix such drivers
but without causing a panic in the process. I hope this clarifies the
reasons why I'm making this change and I'm open to other ideas if they
would address this issue in a better way.
