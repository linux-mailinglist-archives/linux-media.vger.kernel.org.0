Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8893130D137
	for <lists+linux-media@lfdr.de>; Wed,  3 Feb 2021 03:03:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231725AbhBCCDA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 21:03:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231329AbhBCCCz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Feb 2021 21:02:55 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06612C0613D6
        for <linux-media@vger.kernel.org>; Tue,  2 Feb 2021 18:02:14 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id b3so4308906wrj.5
        for <linux-media@vger.kernel.org>; Tue, 02 Feb 2021 18:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k1d6YTsPbefNP98n7kugOKyTm/5Jjwmgp6qDjgryobQ=;
        b=YTpxuQQ56VEKPyP5QRwFOXD5rzq90h+zb0bL5zaHyoZAGpubAhVDWr6tVquoLfUHXY
         8Bgskv29OXx/jlR9EGtJIj2o0B36+WZncwc30a96duFnTOR6NIS20pOkUXRH1YLOzXjx
         rd796bWXm93rjoNLs5XewciYkKHyTn0eFOpN5IkEe8j0OFbNs/YrOetNsTJ6nmGccTFF
         ppqnrLaeHkAtN+jfTW3sILXbMs+y+eKWJtYUCP90lE6ejamVvj0wYtOVvAMo/jMCTtxl
         VNobZKCa1yOaQeNS8a2B0xxWxeuJgYXvbwrr101FjA/2VRquOyZZ58akT0yeyVEGoY5c
         ac0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k1d6YTsPbefNP98n7kugOKyTm/5Jjwmgp6qDjgryobQ=;
        b=fcIIDqZfqzZp4zBvHmkbfJVV1h6RDjB4Xjk4elzQKrmG83LrkQ/xSTdrURCR6KgRbE
         OkQJFlIUPfosKQLaQx7M2V6dLMQa4i7MHdDSnEPvRuDDqZjV+fr5ciJzn1TYihIcewL8
         Wk8aZx4qg8RkzMw4fBaaHjSLuegUfuXpROXXr0lXZrNIv0ZCJy9KB7alTwWAVWVmTprN
         41qSoA0c1IWwY1IJmvuFNKU7BkZDCId2Z4HIsOGsrqtBiH2xemxfyKCR0zi3RinJSaEQ
         6R4A6uOhmUdRtEKjVF6+VUKwAUkg8WC3Bz6Jt3cirg5bRz0s+F0ObgqpzN3wOeu/Pwhf
         /wjQ==
X-Gm-Message-State: AOAM532JBFKQojYuqscLOsXI7OvOo6U1q3XW1gQP7beYogfLcu2sMfyS
        qGww+tVW+n2nKyg5IaJ0e4uN9UvIgPvW3+ko98biVw==
X-Google-Smtp-Source: ABdhPJyQn6YddfkLVWiIGgY37mm6xAPU8tZAWB5sXAvWUT2z2eLAGdHnF+0pzujgGtm+uL0SK+Mb5ISJFicsxp8PRdg=
X-Received: by 2002:adf:e50e:: with SMTP id j14mr860530wrm.162.1612317733369;
 Tue, 02 Feb 2021 18:02:13 -0800 (PST)
MIME-Version: 1.0
References: <20210203003134.2422308-1-surenb@google.com> <20210203003134.2422308-2-surenb@google.com>
 <YBn+yWIE9eXbgQ2K@google.com>
In-Reply-To: <YBn+yWIE9eXbgQ2K@google.com>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Tue, 2 Feb 2021 18:02:01 -0800
Message-ID: <CAJuCfpHCCD6ruxQAZP8pTZxz44F7pDKY59QznxFv0nQ+-9VaQA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dma-buf: heaps: Map system heap pages as managed
 by linux vm
To:     Minchan Kim <minchan@kernel.org>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Christoph Hellwig <hch@infradead.org>,
        Liam Mark <lmark@codeaurora.org>, labbott@redhat.com,
        Brian Starkey <Brian.Starkey@arm.com>,
        John Stultz <john.stultz@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        James Jones <jajones@nvidia.com>,
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

On Tue, Feb 2, 2021 at 5:39 PM Minchan Kim <minchan@kernel.org> wrote:
>
> On Tue, Feb 02, 2021 at 04:31:34PM -0800, Suren Baghdasaryan wrote:
> > Currently system heap maps its buffers with VM_PFNMAP flag using
> > remap_pfn_range. This results in such buffers not being accounted
> > for in PSS calculations because vm treats this memory as having no
> > page structs. Without page structs there are no counters representing
> > how many processes are mapping a page and therefore PSS calculation
> > is impossible.
> > Historically, ION driver used to map its buffers as VM_PFNMAP areas
> > due to memory carveouts that did not have page structs [1]. That
> > is not the case anymore and it seems there was desire to move away
> > from remap_pfn_range [2].
> > Dmabuf system heap design inherits this ION behavior and maps its
> > pages using remap_pfn_range even though allocated pages are backed
> > by page structs.
> > Replace remap_pfn_range with vm_insert_page, following Laura's suggestion
> > in [1]. This would allow correct PSS calculation for dmabufs.
> >
> > [1] https://driverdev-devel.linuxdriverproject.narkive.com/v0fJGpaD/using-ion-memory-for-direct-io
> > [2] http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/2018-October/127519.html
> > (sorry, could not find lore links for these discussions)
> >
> > Suggested-by: Laura Abbott <labbott@kernel.org>
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> Reviewed-by: Minchan Kim <minchan@kernel.org>
>
> A note: This patch makes dmabuf system heap accounted as PSS so
> if someone has relies on the size, they will see the bloat.
> IIRC, there was some debate whether PSS accounting for their
> buffer is correct or not. If it'd be a problem, we need to
> discuss how to solve it(maybe, vma->vm_flags and reintroduce
> remap_pfn_range for them to be respected).

I did not see debates about not including *mapped* dmabufs into PSS
calculation. I remember people were discussing how to account dmabufs
referred only by the FD but that is a different discussion. If the
buffer is mapped into the address space of a process then IMHO
including it into PSS of that process is not controversial.
