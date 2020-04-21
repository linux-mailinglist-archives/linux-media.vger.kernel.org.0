Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 825AB1B24E9
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2020 13:21:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728571AbgDULVa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Apr 2020 07:21:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728316AbgDULV3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Apr 2020 07:21:29 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CA68C061A0F
        for <linux-media@vger.kernel.org>; Tue, 21 Apr 2020 04:21:29 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id g16so9975033eds.1
        for <linux-media@vger.kernel.org>; Tue, 21 Apr 2020 04:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s/ZKt1QsY+s5TFtb7WFmhUkcWp4v5hTkDaDBAF3oOQM=;
        b=P6R6j28SYh+z+pH4O0HBcIa7GGF3sMHeYZK2cJ9Pbx/XlxHbSvDCTL2CCa1pwbYTDw
         1iogg6Bquq1DtRNbEK57f6NFECXcr7flECD+TrC4vok7oaKH/qwaIJ5ZUnuDqogV+8AG
         hxUr2NlPWQbw6fI57Dqfh2dbw7FeyFGTdkCec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s/ZKt1QsY+s5TFtb7WFmhUkcWp4v5hTkDaDBAF3oOQM=;
        b=XVuLISCFiAGDUJM1/vLG2GN/EPJjrEw7W7NzhXwQu2yUBEJvpUXtnlUTCKm4KOe3Bp
         pSWGsD+Ctf4avVtmJFqpSuj2xZI1pun+KNHGuGwKYK63sRXz/nZa+GuAypwivIaoWGUh
         PcAyQ70GVEmniZ65HdwJj1VsDzfafPuYnKhGpFrCOerKOjVcUI15oVYTZrxCs+ZqDm8l
         WLud+A5cZ7vVn5JSwTxlCPD4CDBxgVZPohTCmVuAzhepDSFWJaEhQZ0PGhkFnb2i3j1z
         p+03ZZJl559/vCCOkOuPUqptZsDqTrwraNwdCJgp9ZIdZThGuCi44r87YKGMtzqwsXgk
         HD/Q==
X-Gm-Message-State: AGi0PubLOR0MWU0wbWcarMNIGh8tbTMPJsQCGoE6BZkZXH2+nYZfrTKS
        68PJnEVrKWDcr57vUQMQLkJR6JfHEp3TGg==
X-Google-Smtp-Source: APiQypI6IT+9wXcnvol8oQDwJ8r2ZRPULYd5I5jNoTkOlwgRu5EHgei/jWWpN5xone3Tklvp1e7SaQ==
X-Received: by 2002:a05:6402:712:: with SMTP id w18mr18564959edx.386.1587468087967;
        Tue, 21 Apr 2020 04:21:27 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id o17sm447380ejr.76.2020.04.21.04.21.26
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2020 04:21:26 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id u16so3222708wmc.5
        for <linux-media@vger.kernel.org>; Tue, 21 Apr 2020 04:21:26 -0700 (PDT)
X-Received: by 2002:a05:600c:2f88:: with SMTP id t8mr4271980wmn.46.1587468086147;
 Tue, 21 Apr 2020 04:21:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190802131226.123800-1-shik@chromium.org> <CANMq1KD3Pth7LNnVqxSesx3kSFte0eR5JqEBETv45s_9_YKWHw@mail.gmail.com>
 <20190930082310.GA1750@infradead.org> <20191001063744.GA10402@infradead.org> <CAAFQd5BN63Y-zufQo9_b6kKVX7-1Qf1LwCOKQpMKkQ5KTOf2hw@mail.gmail.com>
In-Reply-To: <CAAFQd5BN63Y-zufQo9_b6kKVX7-1Qf1LwCOKQpMKkQ5KTOf2hw@mail.gmail.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 21 Apr 2020 13:21:15 +0200
X-Gmail-Original-Message-ID: <CAAFQd5A3iazOo+MordCqKk4+5nfSOT-rFu1ypGXF+geRec0aow@mail.gmail.com>
Message-ID: <CAAFQd5A3iazOo+MordCqKk4+5nfSOT-rFu1ypGXF+geRec0aow@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Use streaming DMA APIs to transfer buffers
To:     Christoph Hellwig <hch@infradead.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Nicolas Boichat <drinkcat@chromium.org>,
        Shik Chen <shik@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        notify@kernel.org, Keiichi Watanabe <keiichiw@chromium.org>,
        Ricky Liang <jcliang@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        lkml <linux-kernel@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Christoph Lameter <cl@linux.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Feb 27, 2020 at 7:28 AM Tomasz Figa <tfiga@chromium.org> wrote:
>
> +Sergey Senozhatsky who's going to be looking into this.
>
> Hi Christoph,
>
> On Tue, Oct 1, 2019 at 3:37 PM Christoph Hellwig <hch@infradead.org> wrote:
> >
> > On Mon, Sep 30, 2019 at 01:23:10AM -0700, Christoph Hellwig wrote:
> > > And drivers really have no business looking at the dma mask.  I have
> > > a plan for dma_alloc_pages API that could replace that cruft, but
> > > until then please use GFP_KERNEL and let the dma subsystem bounce
> > > buffer if needed.
> >
> > Can you try this series:
> >
> > http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/dma_alloc_pages
> >
> > and see if it does whay you need for usb?
>
> Reviving this thread. Sorry for no updates for a long time.
>
> dma_alloc_pages() still wouldn't be an equivalent replacement of the
> existing dma_alloc_coherent() (used behind the scenes by
> usb_alloc_coherent()). That's because the latter can allocate
> non-contiguous memory if the DMA device can handle it (i.e. is behind
> an IOMMU), but the former can only allocate a contiguous range of
> pages.
>
> That said, I noticed that you also put a lot of effort into making the
> NONCONSISTENT attribute more usable. Perhaps that's the way to go here
> then? Of course we would need to make sure that the attribute is
> handled properly on ARM and ARM64, which are the most affected
> platforms. Right now neither handles them. The former doesn't use the
> generic DMA mapping ops, while the latter does, but doesn't enable a
> Kconfig option needed to allow generic inconsistent allocations.
>
> Any hints would be appreciated.

Hi Christoph, would you have some time to check the above?

Hi Catalin, Will, do you know why CONFIG_DMA_NONCOHERENT_CACHE_SYNC is
not enabled on arm64?

Thanks in advance. :)

Best regards,
Tomasz
