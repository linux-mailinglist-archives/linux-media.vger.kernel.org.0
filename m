Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84F8A29F7F9
	for <lists+linux-media@lfdr.de>; Thu, 29 Oct 2020 23:28:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726021AbgJ2W2u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Oct 2020 18:28:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725901AbgJ2W2s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Oct 2020 18:28:48 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 375B4C0613CF
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2020 15:28:47 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id f7so4720407oib.4
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2020 15:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pORN0SH7QqUY2pgx+SZRHw+Mnitatq+9tw1I93zAlH4=;
        b=wh9YQtv6zPoV31qgT+D3UcESNbQz/2y1481tB+ajPENkhIBeDrlQi+hzlb3S90JtxZ
         4dlKOB321wDEyTTtW8E6nLVswj8tk8US8rxyQ1Dta+FQqkadP2fp4Y0XWauBkkl7FNVl
         XmNr1W1V5C5Ix8byi+0EOeuvdvA35WLmDjMSk5je59wRPdfQ8WTqafaD6bg1sk/puJ9B
         sAbm+hf9d8wYImZquo0ieS/2pLQ4yLME3Vt3THAhclLSgMt9Ypk+57UAPsrM6rzBUe6o
         mCB9Yq+i+9gtx6VpNDuQxGuOX8prdAtGQcwwT0y6Bopesy2rf4bgI72vVtjQZxm7GfG5
         ReTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pORN0SH7QqUY2pgx+SZRHw+Mnitatq+9tw1I93zAlH4=;
        b=gDRvgTbTKjzlWn7LzFwpVdNfnylAYlrvHI4nWSr1x/+qH4ge7o3oOOF1vd9jgFq188
         MnCQBZWQmA6UZWeB1mALuQ+SYqJOcAdxaxFXkd/vCL6mjjHQdnqTN82NMgFXGm2F2la6
         QM7QNJFZRoDPzAVZKPjBXrPToB0pj57GQzeoMKMW7ifSoHRMYpBOcQyJfUwexu/DWZFj
         yLoj7QcwtIytd7MMpyhohXE5g3a7/9+dNO/itkuaEhHXeBayI8BdwMcGvph1EkeQe+KI
         VXANNtnxUFOgZ+c5BTUFmhcv8Bm5E6lSDJpIVMAivvqNVD2szFrhpGeHBrpX9zwdsttl
         10sw==
X-Gm-Message-State: AOAM531KWxMYLBVA6S/s5Vn0OjT8PoXT1VG/gLDmLqrc6uNn7gdbuZH+
        1mt7TzzlqoPox3unPmPNi+nO+6fQZdagdcshaIVTng==
X-Google-Smtp-Source: ABdhPJzsdV1oz4gvSBDqVBieGnuJjbIML/oDST4HPTwI72RnBseK/ArAlpSmIcJVKJ5xxatPFTwiTSkDIwrFG/oucIA=
X-Received: by 2002:aca:1a07:: with SMTP id a7mr983142oia.169.1604010526631;
 Thu, 29 Oct 2020 15:28:46 -0700 (PDT)
MIME-Version: 1.0
References: <20201029001624.17513-1-john.stultz@linaro.org>
 <20201029001624.17513-8-john.stultz@linaro.org> <20201029071037.2913-1-hdanton@sina.com>
In-Reply-To: <20201029071037.2913-1-hdanton@sina.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Thu, 29 Oct 2020 15:28:34 -0700
Message-ID: <CALAqxLWUhugbjOGMnSciUN+nSR48u+ph07BRp7US7w+ix6fT+A@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] dma-buf: system_heap: Add a system-uncached heap
 re-using the system heap
To:     Hillf Danton <hdanton@sina.com>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>,
        Christoph Hellwig <hch@infradead.org>,
        James Jones <jajones@nvidia.com>,
        linux-media <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 29, 2020 at 12:10 AM Hillf Danton <hdanton@sina.com> wrote:
> On Thu, 29 Oct 2020 00:16:24 +0000 John Stultz wrote:
> > @@ -194,6 +210,9 @@ static int system_heap_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
> >       struct sg_page_iter piter;
> >       int ret;
> >
> > +     if (buffer->uncached)
> > +             vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
> > +
>
> Wonder why you turn back to dma_mmap_wc() and friends?

Sorry, can you expand on what you are proposing here instead?  I'm not
sure I see how dma_alloc/mmap/*_wc() quite fits here.

thanks
-john
