Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 368D230D142
	for <lists+linux-media@lfdr.de>; Wed,  3 Feb 2021 03:12:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231576AbhBCCIi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 21:08:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230134AbhBCCIh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Feb 2021 21:08:37 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32921C061573
        for <linux-media@vger.kernel.org>; Tue,  2 Feb 2021 18:07:51 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id v24so31076420lfr.7
        for <linux-media@vger.kernel.org>; Tue, 02 Feb 2021 18:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ayzfcSfxCvzlRbstGP9hGkgIcQ5hx1YuU1pxX+bWuHs=;
        b=eGlil+w2DCwQD8KK1xRdq7AIVCuqHRf5q1ar8b/Fy9tkCbGJE8I1o9Qh9anhQO2hK9
         xZmfjyfzF11eyHCvfh+oppTiW9/Xd1whsALSsj6vTiIjxqVyHaq3TV6bPu9hHW0k9y4E
         Cr2aFpB7ctiPfw+uWvahloZr+9eLF1MS6oRzP9XcHmFnx5EJc5khMz4vtafLlo2Rttda
         mQsJCiB4acmtmbiR7l0NS4lcvNKZK7ks3LGsQhkW0ctj4/iD3jp2/yPnn21S2B/fvdvm
         k/9L97xrZ36XRy3b1hTg6XmL3zJNXAiUgdCzJG/Aw1DV2xr1LsWaEybvLB6qFi3fliAC
         PFXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ayzfcSfxCvzlRbstGP9hGkgIcQ5hx1YuU1pxX+bWuHs=;
        b=DoIUG+qRKSO6Gsa77uoTHz5A0JScNFDEU+RAd+ybmU9KdsMrZiLGd+cB4s917Ci53p
         wn9QqJKB7kg10mIu+Bjr7dpC0mCalMJIvp5P8e/5tFp0QnVNBNNjGBkdd/U8qGfqld+O
         3GEwePt0PskFVfdM+A24EPz22iPxBoZ8vrXddtnbBx+zkS9BpYkyAzAHPVzooME8Jjyr
         ip4vLkn1P4MLacp32QwvjDy0UfvyUPn8u5DIbx1cXih9z4SqYai7Aoh413t/K8zvEllt
         yy0KiDXBnKLXNFTcI8HQGhBF0sTMGyZ8IZ/WmpF2BaHFOh/pnZrO6SgGw11XpmePwvf/
         wxcg==
X-Gm-Message-State: AOAM533EuxxZSPgqOdu5MVeXD3fdmFHW6N9drvC+rNzFmm2ToTLJoSlx
        E4GdaYSC2ieb7yiSuDno1xDdD2kEpR4+/61RaQy81w==
X-Google-Smtp-Source: ABdhPJz/zm1PeC2ZluNB85wRkNtw1G6dZzG/v+ZbpRoZh6RdqPs9LSsJ6rK/g2cd13qi3PrT9YkluWDRlb8ciDHM4uI=
X-Received: by 2002:ac2:5590:: with SMTP id v16mr454568lfg.626.1612318069555;
 Tue, 02 Feb 2021 18:07:49 -0800 (PST)
MIME-Version: 1.0
References: <20210203003134.2422308-1-surenb@google.com> <20210203003134.2422308-2-surenb@google.com>
In-Reply-To: <20210203003134.2422308-2-surenb@google.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Tue, 2 Feb 2021 18:07:38 -0800
Message-ID: <CALAqxLWJNDDx_MFvYHszFXy=aV9bZGi50L3zDtuGaiYUbHKHSA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dma-buf: heaps: Map system heap pages as managed
 by linux vm
To:     Suren Baghdasaryan <surenb@google.com>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Christoph Hellwig <hch@infradead.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@redhat.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Christian Koenig <christian.koenig@amd.com>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        James Jones <jajones@nvidia.com>,
        Minchan Kim <minchan@kernel.org>,
        Hridya Valsaraju <hridya@google.com>,
        Sandeep Patil <sspatil@google.com>,
        linux-media <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, linux-mm <linux-mm@kvack.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Android Kernel Team <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Feb 2, 2021 at 4:31 PM Suren Baghdasaryan <surenb@google.com> wrote:
> Currently system heap maps its buffers with VM_PFNMAP flag using
> remap_pfn_range. This results in such buffers not being accounted
> for in PSS calculations because vm treats this memory as having no
> page structs. Without page structs there are no counters representing
> how many processes are mapping a page and therefore PSS calculation
> is impossible.
> Historically, ION driver used to map its buffers as VM_PFNMAP areas
> due to memory carveouts that did not have page structs [1]. That
> is not the case anymore and it seems there was desire to move away
> from remap_pfn_range [2].
> Dmabuf system heap design inherits this ION behavior and maps its
> pages using remap_pfn_range even though allocated pages are backed
> by page structs.
> Replace remap_pfn_range with vm_insert_page, following Laura's suggestion
> in [1]. This would allow correct PSS calculation for dmabufs.
>
> [1] https://driverdev-devel.linuxdriverproject.narkive.com/v0fJGpaD/using-ion-memory-for-direct-io
> [2] http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/2018-October/127519.html
> (sorry, could not find lore links for these discussions)
>
> Suggested-by: Laura Abbott <labbott@kernel.org>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>

For consistency, do we need something similar for the cma heap as well?

thanks
-john
