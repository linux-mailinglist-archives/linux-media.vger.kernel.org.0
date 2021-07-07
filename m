Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 885343BE825
	for <lists+linux-media@lfdr.de>; Wed,  7 Jul 2021 14:42:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231572AbhGGMpP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jul 2021 08:45:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231546AbhGGMpP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jul 2021 08:45:15 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4429C06175F
        for <linux-media@vger.kernel.org>; Wed,  7 Jul 2021 05:42:34 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id nd37so3065899ejc.3
        for <linux-media@vger.kernel.org>; Wed, 07 Jul 2021 05:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1r1cMb5IuUabwy6ufnOUx/1ARsY6RZ8tdA97vkp9E0A=;
        b=jlsNoDpvpRCWC7QypzC3JPWQcjf8ZHOhkIKeaatKYesEPW3wWTNizbkKYxd4y/tVg3
         kVVSZDCmtCeGugvyv4otWf7HJYbtWj3dOzbTzlGnMXgAsgAtq14+dvRPtYs8hVHgtEr/
         j764X5VIu9mhAFK3+BrNo1Qkv4m/tude+exeA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1r1cMb5IuUabwy6ufnOUx/1ARsY6RZ8tdA97vkp9E0A=;
        b=rs68ZeaTvNMQgQrbOjXIV8dx5KDbWobqV/PZhiRHGCxj5OyZN24EceuiaDRAPpsVd3
         LWW/Yiq/lVrL21WiqTh95j3vJAI/GB36ERU3V2V2nRh7Q1sTsQqxMa6i4Nf2Lrxi/uqs
         54dGu8WdEPW/19muGER0R/Apo8HqOCOT229Pr89i+VQW6CrhT2sAUfMdMfUv3PaFat/F
         uwJsRcMT86xyAsrczQVim2sJAsTePwWGGES6qS0RfVzaGQOLqVaZPsqDYffu8y22KM04
         Zx1b66jB5/th3GX4znk4nDwQw2TSSCaMo5R+T0G2E79IrlhOvjBur4PJcaa28vDzibrT
         Lw0w==
X-Gm-Message-State: AOAM532rI/pi5xitqfkuO97Kb2Hn6ExV8MRZyOKxEqY06IeKU4XZWQlf
        i8Z+Q3qjsGyC06SfDR4nbnsaQ+PHGBJTPQ==
X-Google-Smtp-Source: ABdhPJzWP8Y6h/Cp7oZX6Zo91Jqg9TcHdLyJXbSSiPYG79I6tt0MBECNQr7xRqTsksNqClbE0ZoXsg==
X-Received: by 2002:a17:907:7295:: with SMTP id dt21mr8188399ejc.357.1625661752777;
        Wed, 07 Jul 2021 05:42:32 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id k14sm1661265edq.79.2021.07.07.05.42.31
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jul 2021 05:42:31 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id l7so1964009wrv.7
        for <linux-media@vger.kernel.org>; Wed, 07 Jul 2021 05:42:31 -0700 (PDT)
X-Received: by 2002:a5d:4001:: with SMTP id n1mr28151059wrp.159.1625661751106;
 Wed, 07 Jul 2021 05:42:31 -0700 (PDT)
MIME-Version: 1.0
References: <10a0903a-e295-5cba-683a-1eb89a0804ed@xs4all.nl>
 <YMsAIVs7G2hUDR2F@google.com> <20210617080107.GA1422@lst.de>
 <CAAFQd5DiPstn-s+yQM3iMd=G9oaag39qCyX483a7-Jrn=gxWCA@mail.gmail.com>
 <20210617085233.GA4702@lst.de> <CAAFQd5DqK2gSTGjfo-vahXwMzzO9gv26cY=vV6urn3viDLPE7g@mail.gmail.com>
 <20210617100656.GA11107@lst.de> <CAAFQd5CgLDkJ3t1aU2PRcGu6cGFjLXOnvMqDg62Z7Zuc8ABVHg@mail.gmail.com>
 <20210618042526.GA17794@lst.de> <CAAFQd5Bt9TJ87Yk5ZpqTqrX9rmP0Uq8VNwx_rwFHakWP850Axw@mail.gmail.com>
 <20210622073308.GA32231@lst.de>
In-Reply-To: <20210622073308.GA32231@lst.de>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 7 Jul 2021 21:42:19 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AARvjrxh962oVKM7OGLvVtvs0iea_2QAWGZ2K4HQe5qA@mail.gmail.com>
Message-ID: <CAAFQd5AARvjrxh962oVKM7OGLvVtvs0iea_2QAWGZ2K4HQe5qA@mail.gmail.com>
Subject: Re: [PATCHv2 8/8] videobuf2: handle non-contiguous DMA allocations
To:     Christoph Hellwig <hch@lst.de>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 22, 2021 at 4:33 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Fri, Jun 18, 2021 at 01:44:08PM +0900, Tomasz Figa wrote:
> > > Well, dma_alloc_coherent users want a non-cached mapping.  And while
> > > some architectures provide that using a vmap with "uncached" bits in the
> > > PTE to provide that, this:
> > >
> > >  a) is not possibly everywhere
> > >  b) even where possible is not always the best idea as it creates mappings
> > >     with differnet cachability bets
> >
> > I think this could be addressed by having a dma_vmap() helper that
> > does the right thing, whether it's vmap() or dma_common_pages_remap()
> > as appropriate. Or would be this still insufficient for some
> > architectures?
>
> It can't always do the right thing.  E.g. for the case where uncached
> memory needs to be allocated from a special boot time fixed pool.
>

Fair enough. Thanks for elaborating.

> > > And even without that dma_alloc_noncoherent causes less overhead than
> > > dma_alloc_noncontigious if you only need a single contiguous range.
> > >
> >
> > Given that behind the scenes dma_alloc_noncontiguous() would also just
> > call __dma_alloc_pages() for devices that need contiguous pages, would
> > the overhead be basically the creation of a single-entry sgtable?
>
> In the best case: yes.
>
> > > So while I'm happy we have something useful for more complex drivers like
> > > v4l I think the simple dma_alloc_coherent API, including some of the less
> > > crazy flags for dma_alloc_attrs is the right thing to use for more than
> > > 90% of the use cases.
> >
> > One thing to take into account here is that many drivers use the
> > existing "simple" way, just because there wasn't a viable alternative
> > to do something better. Agreed, though, that we shouldn't optimize for
> > the rare cases.
>
> While that might be true for a few drivers, it is absolutely not true
> for the wide majority.  I think you media people are a little special,
> with only the GPU folks contending for "specialness" :)  (although
> media handles it way better, gpu folks just create local hacks that
> can't work portably).

I don't have the evidence to argue, so let's just leave it at "time
will tell". I think it's great that we have the possibility to do the
more special things and we can see where it goes from now on. :)

Best regards,
Tomasz
