Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 635B230D149
	for <lists+linux-media@lfdr.de>; Wed,  3 Feb 2021 03:16:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231610AbhBCCOX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 21:14:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230208AbhBCCOT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Feb 2021 21:14:19 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 172B9C0613D6
        for <linux-media@vger.kernel.org>; Tue,  2 Feb 2021 18:13:39 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id m13so22464152wro.12
        for <linux-media@vger.kernel.org>; Tue, 02 Feb 2021 18:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+vYDps8/+IhHaSDG5kMjkWUxFJUq2DFUOYgi2VmWXtI=;
        b=QT34eaYNV8fBLXWs/JBogWNBxvdF8ywloFrclidxZLbMY42rIDA48Y8pWRzaRg5kyn
         cJA/Pz4LjH28NykDdh27Y+YDF2VA1ob27B9AmZ+b+y8eFiRD3fKog+kSs9ztUIQwluk5
         G5LsE1Hmui8HoXHVY8szdjd48rhhZA4JUPeSSoXEZMxzn3bocg+h4SnDsxruSuxRv9QT
         bTpIhgtjAyR+m3tKilxDCcEYtYANNdJ3CrpkPwfxvl9JzsXtY4jEpaPrHe4emg1kiNRY
         Tub23wpwxyjLb6730Xg39sU0NDx1RWY4HzKlBzNT+btC4Ta9Vj6gI7TYaH3+g8P5rtUU
         HPRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+vYDps8/+IhHaSDG5kMjkWUxFJUq2DFUOYgi2VmWXtI=;
        b=YOih3F4N5Z6sCi6bAWe6CorcprbvkZzfMReA2Sp7CLxZUlzd2ohkG2Pz08kwQJWO55
         trNMJ6CpekVB6Q3z2CeS79FG+wNSju7UU+MmiQele51n70h7YhJ8ag9nGFJfEArrEw5e
         uNiD75rNjJ4HSYHpREhR3mGvO6l4dGi9RZkr5sxP+LpKzY5DRVB1HjUVivad9oqjUVdm
         Jlej1PwQMWjz5NrwxKkB12NKJkfRYW1lBtseNTXFfOgultYIpp79XFyrPvrj0kUMmlS9
         xPO3Nb4WtjboZDw2Qfo4C2ZwBnWyXdx7k+SeB1rq/wh4U4L83mM8GmF3PJ199BfOG8Ue
         NOZw==
X-Gm-Message-State: AOAM530us8eqdnTSODBT0bajucKk0xCUzRly7CfnlUiLmmFFljEh7iGY
        lAXsw5wahu5AJZ99AZfYoQtt+9oeLEEqQp/u0XcQ6Q==
X-Google-Smtp-Source: ABdhPJzwvb53VryiSIObA9yOm78VKVx2cE/HoZ+IGvTixGvWum4punD5XJ9toA2haG1k35oBs/GNn0NjBEvmjKg7phM=
X-Received: by 2002:a5d:453b:: with SMTP id j27mr895948wra.92.1612318417595;
 Tue, 02 Feb 2021 18:13:37 -0800 (PST)
MIME-Version: 1.0
References: <20210203003134.2422308-1-surenb@google.com> <20210203003134.2422308-2-surenb@google.com>
 <CALAqxLWJNDDx_MFvYHszFXy=aV9bZGi50L3zDtuGaiYUbHKHSA@mail.gmail.com>
In-Reply-To: <CALAqxLWJNDDx_MFvYHszFXy=aV9bZGi50L3zDtuGaiYUbHKHSA@mail.gmail.com>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Tue, 2 Feb 2021 18:13:26 -0800
Message-ID: <CAJuCfpGJn9WLjs5N6m2WZ4CxgkZeHgGinoS_v2XhiqbOB90rfQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dma-buf: heaps: Map system heap pages as managed
 by linux vm
To:     John Stultz <john.stultz@linaro.org>
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

On Tue, Feb 2, 2021 at 6:07 PM John Stultz <john.stultz@linaro.org> wrote:
>
> On Tue, Feb 2, 2021 at 4:31 PM Suren Baghdasaryan <surenb@google.com> wrote:
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
>
> For consistency, do we need something similar for the cma heap as well?

Good question. Let me look closer into it.

>
> thanks
> -john
