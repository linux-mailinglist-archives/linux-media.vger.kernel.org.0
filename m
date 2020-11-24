Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E0682C252C
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 13:02:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733187AbgKXMBt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 07:01:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733212AbgKXMBs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 07:01:48 -0500
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69633C0613D6
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 04:01:47 -0800 (PST)
Received: by mail-il1-x144.google.com with SMTP id y9so19042203ilb.0
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 04:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=OtTStFZ1K4vG9mf1OSlywjo0WPS9A+qPTfMdwg+0WeU=;
        b=B3BwzQbaXFU3fhtDdHR+Fmv8MKnhR2mxgOp2ryIc5wuXL4rXiS85tpU6q5H3eR6qE+
         6qzQoaoL8DgM+BofPoZTBWmfryCnozhhBT+EEK6ATwmvGtVQzE0xjmM4qt+tQ5k0iE0J
         0hdGRkNaK/blbkiRCF/yNOj+MFI3+N1/U+yak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=OtTStFZ1K4vG9mf1OSlywjo0WPS9A+qPTfMdwg+0WeU=;
        b=HVmwIAZiYoOHTK59ekT3PoM8RGcGji75+ICeBr7t83/7JSIHiKedyH3uNufZsqUvCH
         pVDq6oT3WzvgT7CVuSAJH8HRorMgY9T4/pGGnblMoxV9d0boXHzmslhZcJcnGyCWxN+Q
         +X15ckGjUYnJMsfLvldCyGaSHUb286SIL6PnsK/SW98qUq1dHMBfwbc1LWN82vwWSGvq
         NcnxS9bhqc5oELhtu7m5zrzq3p8Jhq+UwopFpRRPcryl2t4J43Thvco5C8KCdkdx+WLt
         BV/+Fhvxpt0OfBwRhObCeqd8zqYVLFQZq1tNil0NLiwS1TxQqFklr68NT4m92PxzrEj8
         Btzg==
X-Gm-Message-State: AOAM5303npemS0F6Ailp8NJS7WJ60cT4eauICAVeSCOEXYG0MmEGBjr2
        XAnYlfgo6tt69ru9WW+R/u9RYjv8c3Ifgw==
X-Google-Smtp-Source: ABdhPJxOcHV0TCWy0eFyliCL3iHag/Dr9N+03d14QFyBcXRS1wdhp+3fDzGlXB28CE5SKOmnGVA9gQ==
X-Received: by 2002:a05:6e02:13a3:: with SMTP id h3mr3922778ilo.164.1606219306652;
        Tue, 24 Nov 2020 04:01:46 -0800 (PST)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com. [209.85.166.176])
        by smtp.gmail.com with ESMTPSA id s26sm7659016ioe.2.2020.11.24.04.01.45
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2020 04:01:46 -0800 (PST)
Received: by mail-il1-f176.google.com with SMTP id q1so19022843ilt.6
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 04:01:45 -0800 (PST)
X-Received: by 2002:a05:6e02:12ab:: with SMTP id f11mr757703ilr.89.1606219305436;
 Tue, 24 Nov 2020 04:01:45 -0800 (PST)
MIME-Version: 1.0
References: <20200930160917.1234225-9-hch@lst.de> <20201118142546.170621-1-ribalda@chromium.org>
 <20201124113512.GA21974@lst.de>
In-Reply-To: <20201124113512.GA21974@lst.de>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 24 Nov 2020 13:01:33 +0100
X-Gmail-Original-Message-ID: <CANiDSCtLrqWBOmC9X91V8P-aahQr2=L-GQNjHM6YauT69_QcEg@mail.gmail.com>
Message-ID: <CANiDSCtLrqWBOmC9X91V8P-aahQr2=L-GQNjHM6YauT69_QcEg@mail.gmail.com>
Subject: Re: [PATCH] WIP! media: uvcvideo: Use dma_alloc_noncontiguos API
To:     Christoph Hellwig <hch@lst.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
        Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

HI Christoph

On Tue, Nov 24, 2020 at 12:35 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Wed, Nov 18, 2020 at 03:25:46PM +0100, Ricardo Ribalda wrote:
> > On architectures where the is no coherent caching such as ARM use the
> > dma_alloc_noncontiguos API and handle manually the cache flushing using
> > dma_sync_single().
> >
> > With this patch on the affected architectures we can measure up to 20x
> > performance improvement in uvc_video_copy_data_work().
>
> This has a bunch of crazy long lines, but otherwise looks fine to me.

That is easy to solve :)

https://github.com/ribalda/linux/commit/17ab65a08302e845ad7ae7775ce54b387a5=
8a887

>
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >
> > This patch depends on dma_alloc_contiguous API=EF=BF=BC1315351diffmboxs=
eries
>
> How do we want to proceed?  Do the media maintainers want to pick up
> that patch?  Should I pick up the media patch in the dma-mapping tree?

I was hoping that you could answer that question :).

Do you have other use-cases than linux-media in mind?

I think Sergey wants to experiment also with vb2, to figure out how
much it affects it.
His change will be much more complicated than mine thought, there are
more cornercases there.

>
> Can you respost a combined series to get started?

Sure. Shall I also include the profiling patch?


Best regards
--=20
Ricardo Ribalda
