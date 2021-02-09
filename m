Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EBAB3151F1
	for <lists+linux-media@lfdr.de>; Tue,  9 Feb 2021 15:48:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232119AbhBIOrN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Feb 2021 09:47:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230043AbhBIOrH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Feb 2021 09:47:07 -0500
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA304C061788
        for <linux-media@vger.kernel.org>; Tue,  9 Feb 2021 06:46:26 -0800 (PST)
Received: by mail-il1-x12e.google.com with SMTP id o7so11776885ils.2
        for <linux-media@vger.kernel.org>; Tue, 09 Feb 2021 06:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qVmduRDg6ZoezGmMc2NOjO9dKMtO5r7SHhLDuNpUA1w=;
        b=WFrX2nLmj6lzLxXwwRLmHplG+/4tGaqXd5F9tKmrpv0+CO88dg427I0RaNJUHcUdtl
         s+UXjDspolANS3R9Rg9KKCc/sy5aAZFcT22cgFhNe08kUqAs0wzlF+V6nniyL9Nz/4ff
         ABijo72HwNtukB2a0YkAo0BBqtLdSTQT9enFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qVmduRDg6ZoezGmMc2NOjO9dKMtO5r7SHhLDuNpUA1w=;
        b=mr3QeEa5EZcpREwNekX2bbQdzECuYxn066Y8PyR9jLQBzDOCjGZrEIOUXtb7bI5Sm7
         yXqhfAIttblc24pzrWXdD+ohyFPOex3iyUf43u+czW+hr27j+nwC6CqK9ZASONnQUq2r
         5uFOut3bIsh1KpMQX02FkUc1lCby31RZcMGrD8aaPN2IZOwZgdF51SvPAWW6HwhHk4D7
         457BCFKfEAsARjtFmT87frhFZZuZ2LZOMtec5JDCDugbz8LacfPqPyEt0yJ6ayFg2dkO
         I6LxrMgxbhDS2VAlqca9PuD3BMjErtevFOfI9CYwpDELfYfmiQfBf3wPFh3inGL7jgO+
         ESTA==
X-Gm-Message-State: AOAM532XFjUw2GPo/rkwdjx9H5ITJ7kex6aY3fWCHpVbSRK9xNxc0wFr
        xuyZQCEHEr8zt/6+xM76hu6R2SyiYJo7Zl7b
X-Google-Smtp-Source: ABdhPJxm6p0pUkSKZTLXO1HYSCpFAI/FRhpA+hpTR/eMuxR+A/bCcngshfwv58E+ob1g0m9Ibp9ucw==
X-Received: by 2002:a05:6e02:1066:: with SMTP id q6mr2229782ilj.137.1612881986061;
        Tue, 09 Feb 2021 06:46:26 -0800 (PST)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com. [209.85.166.175])
        by smtp.gmail.com with ESMTPSA id c6sm10624571ioc.26.2021.02.09.06.46.24
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Feb 2021 06:46:25 -0800 (PST)
Received: by mail-il1-f175.google.com with SMTP id y5so16304405ilg.4
        for <linux-media@vger.kernel.org>; Tue, 09 Feb 2021 06:46:24 -0800 (PST)
X-Received: by 2002:a05:6e02:1d0e:: with SMTP id i14mr18857395ila.69.1612881984309;
 Tue, 09 Feb 2021 06:46:24 -0800 (PST)
MIME-Version: 1.0
References: <20210202095110.1215346-1-hch@lst.de> <20210207184855.GA27553@lst.de>
 <CAAFQd5BzAvgiTLGFse+ZWUrFtZ1Ysf+p+e-4rW8gq_iP0xhWEA@mail.gmail.com>
 <20210209082213.GA31902@lst.de> <CANiDSCuzKczCnAdC9b0r-6WVBFYXYnvQHKbxSeYq2QW1uVsDLQ@mail.gmail.com>
In-Reply-To: <CANiDSCuzKczCnAdC9b0r-6WVBFYXYnvQHKbxSeYq2QW1uVsDLQ@mail.gmail.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 9 Feb 2021 15:46:13 +0100
X-Gmail-Original-Message-ID: <CANiDSCvPodsmcOi1fMwvZsyMxWsRQWNT7VkbZs4=XePYXfiXow@mail.gmail.com>
Message-ID: <CANiDSCvPodsmcOi1fMwvZsyMxWsRQWNT7VkbZs4=XePYXfiXow@mail.gmail.com>
Subject: Re: add a new dma_alloc_noncontiguous API v2
To:     Christoph Hellwig <hch@lst.de>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sergey Senozhatsky <senozhatsky@google.com>,
        "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Christoph

I have tested it in both arm and x86, since there are not significant
changes with the previous version I did not do a performance test.

Thanks!


On Tue, Feb 9, 2021 at 9:29 AM Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Hi Christoph
>
> On Tue, Feb 9, 2021 at 9:22 AM Christoph Hellwig <hch@lst.de> wrote:
> >
> > On Mon, Feb 08, 2021 at 08:33:50PM +0900, Tomasz Figa wrote:
> > > Sorry for the delay. The whole series looks very good to me. Thanks a lot.
> > >
> > > Reviewed-by: Tomasz Figa <tfiga@chromium.org>
> >
> > Thanks.
> >
> > Ricardo, do the uvcvideo changes look good to you?  I'd like to queue
> > the series up for this merge window.

Tested-by: Ricardo Ribalda <ribalda@chromium.org>

>
> Let me test them in real hardware today.
>
> Thanks!
>
>
> --
> Ricardo Ribalda



-- 
Ricardo Ribalda
