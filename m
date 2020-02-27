Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 160641710F8
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2020 07:28:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726798AbgB0G2V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Feb 2020 01:28:21 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:45357 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726378AbgB0G2U (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Feb 2020 01:28:20 -0500
Received: by mail-ed1-f68.google.com with SMTP id v28so1851701edw.12
        for <linux-media@vger.kernel.org>; Wed, 26 Feb 2020 22:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qc/8gjwoSjhv1WAaPphN4gG7vMp46r7eAyhBiGEqLNs=;
        b=npI8N/06lMSjD76Xcc/BTWLlQT34lMDfw3GeZ58xWNJ/dhjfX4cJcHqhnYAfRrwMGr
         LPb5I8MHPsPEpf2j+kjjnkLdm8FNl5MfQtq+AbsEdOOBGKNg+gXW3/3mQSDUno7qspET
         QfGdFEYcQnKlfIjSUH4HN6s5OYzN1k0UHSvRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qc/8gjwoSjhv1WAaPphN4gG7vMp46r7eAyhBiGEqLNs=;
        b=XYBZVcT1ZSy/aGVi/yEHzscKtZBDg1RhgXiOoWq+P2QyqO3+XT2zWhfU+Giev0YG1P
         3kKiD1l9N+YTNQfAEtb22hxOQ3miayMDOUO4NO9uh9wttsyRE46wGw08b7ddfkWiFreh
         v6zYOc2PpWiR3Cv6xck6gZiOYxJwVBeJa8LWI4Bf/TZ+ic4zet4SgmjbxP7Jc3JLculh
         m+FFaRu/TM9/9qfNPtGk+NmD3ItCyNDPT2KUFOuudl++W8BqGoRBwazLgobQZBEejiSK
         xaZ/AWwmzds+pqzgn/3cOfhYCYgm8uwUIQguc/zaKN8VTRmDopVu4TgH6/jJRgySB6SF
         ABGQ==
X-Gm-Message-State: APjAAAVgQOm6UOHx2SxqoDpeq3AZtzwe3SvqnChw0/jvJ/6tpKlPpt/O
        V9MV3UZMXhIfWgFk3uyCqgpmZOtjsTf+dQ==
X-Google-Smtp-Source: APXvYqyKQvTRxsxl6NsOmDBuMH6xEsvO5XfxNr5H2x1WtW/hSJVjrUeRfFNRq1x6hXOs3C5hNrDfug==
X-Received: by 2002:aa7:c552:: with SMTP id s18mr2272599edr.331.1582784898654;
        Wed, 26 Feb 2020 22:28:18 -0800 (PST)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com. [209.85.128.41])
        by smtp.gmail.com with ESMTPSA id u10sm200396ejx.20.2020.02.26.22.28.17
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2020 22:28:17 -0800 (PST)
Received: by mail-wm1-f41.google.com with SMTP id f15so2135341wml.3
        for <linux-media@vger.kernel.org>; Wed, 26 Feb 2020 22:28:17 -0800 (PST)
X-Received: by 2002:a05:600c:2c48:: with SMTP id r8mr3065839wmg.183.1582784896863;
 Wed, 26 Feb 2020 22:28:16 -0800 (PST)
MIME-Version: 1.0
References: <20190802131226.123800-1-shik@chromium.org> <CANMq1KD3Pth7LNnVqxSesx3kSFte0eR5JqEBETv45s_9_YKWHw@mail.gmail.com>
 <20190930082310.GA1750@infradead.org> <20191001063744.GA10402@infradead.org>
In-Reply-To: <20191001063744.GA10402@infradead.org>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 27 Feb 2020 15:28:05 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BN63Y-zufQo9_b6kKVX7-1Qf1LwCOKQpMKkQ5KTOf2hw@mail.gmail.com>
Message-ID: <CAAFQd5BN63Y-zufQo9_b6kKVX7-1Qf1LwCOKQpMKkQ5KTOf2hw@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Use streaming DMA APIs to transfer buffers
To:     Christoph Hellwig <hch@infradead.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
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
        Christoph Lameter <cl@linux.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

+Sergey Senozhatsky who's going to be looking into this.

Hi Christoph,

On Tue, Oct 1, 2019 at 3:37 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Mon, Sep 30, 2019 at 01:23:10AM -0700, Christoph Hellwig wrote:
> > And drivers really have no business looking at the dma mask.  I have
> > a plan for dma_alloc_pages API that could replace that cruft, but
> > until then please use GFP_KERNEL and let the dma subsystem bounce
> > buffer if needed.
>
> Can you try this series:
>
> http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/dma_alloc_pages
>
> and see if it does whay you need for usb?

Reviving this thread. Sorry for no updates for a long time.

dma_alloc_pages() still wouldn't be an equivalent replacement of the
existing dma_alloc_coherent() (used behind the scenes by
usb_alloc_coherent()). That's because the latter can allocate
non-contiguous memory if the DMA device can handle it (i.e. is behind
an IOMMU), but the former can only allocate a contiguous range of
pages.

That said, I noticed that you also put a lot of effort into making the
NONCONSISTENT attribute more usable. Perhaps that's the way to go here
then? Of course we would need to make sure that the attribute is
handled properly on ARM and ARM64, which are the most affected
platforms. Right now neither handles them. The former doesn't use the
generic DMA mapping ops, while the latter does, but doesn't enable a
Kconfig option needed to allow generic inconsistent allocations.

Any hints would be appreciated.

Best regards,
Tomasz
