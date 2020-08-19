Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D000F24A0DA
	for <lists+linux-media@lfdr.de>; Wed, 19 Aug 2020 15:58:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728125AbgHSN6a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Aug 2020 09:58:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728133AbgHSN6S (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Aug 2020 09:58:18 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68BF5C061343
        for <linux-media@vger.kernel.org>; Wed, 19 Aug 2020 06:58:18 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id g19so26372861ejc.9
        for <linux-media@vger.kernel.org>; Wed, 19 Aug 2020 06:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6xkguvOzsgzZf/2nZcmiUdLktaalZbMKG8kwCTKJnbQ=;
        b=m4IkKgPlDJh9Ow/m1Q5dtgZrYLnaRCS7od5vd7CevPl4aSkNJcXDYSbofI9IVrnSM1
         T0Nk8lAEv28vGxYfqJpLVc+ygPg3eNS610ZSiKpYmXTIZXUzbw+fr6qoGPkql89ad0SH
         sz82upHUpsjkfyqDK6oYGAHuFg3NLWv3KpWnw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6xkguvOzsgzZf/2nZcmiUdLktaalZbMKG8kwCTKJnbQ=;
        b=JU7hoVT7oF0rR648Bff6TUVUCefg4GuW46VMUrS1lOFEyaCqPVzvMM8KKP8+YaRySp
         AlzlBsny6sQVIVq3VU2tMyYGIe1v7DIKzMD/SUyBJ3rQi0DLvrE1tB2HAUoCqrXigRfs
         JY/lWlSsVCO76Q24RIVAC2S1c93Eceh70pRpaESaWM8LgVHaVNcRHsWP0w44heu+m6eY
         prCXfsjo/LKv+Wl1lkCqhWmSMAaulXX7qMWcFGH8wsILvAAJOhhnMnS4nDQph5lFUVAV
         j+oLG3rQxOHr7yria4y6EmaWr2xG9qBA92tXGF7PpVC+wk8Rmd4tGoy/s9YzwaNWxX3M
         L/Jg==
X-Gm-Message-State: AOAM531clRN1fBcx4Ik9zJm0L/8prXtsWN4O1SpStr/BrKiRRbQdtuTn
        yy6FbxIEuVG2SCjAOi447Rzr2GGryj4nrw==
X-Google-Smtp-Source: ABdhPJz6Xlypd47ZkF9b1jkJmCSFdd0AVTf1ZsGdcSYMTwWnW/tFdf2VOTzNW32u5ZuDCP/Mn2f3ZA==
X-Received: by 2002:a17:906:3756:: with SMTP id e22mr26279059ejc.487.1597845496039;
        Wed, 19 Aug 2020 06:58:16 -0700 (PDT)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com. [209.85.128.41])
        by smtp.gmail.com with ESMTPSA id t6sm18761642ejc.40.2020.08.19.06.58.11
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2020 06:58:11 -0700 (PDT)
Received: by mail-wm1-f41.google.com with SMTP id 184so2321957wmb.0
        for <linux-media@vger.kernel.org>; Wed, 19 Aug 2020 06:58:11 -0700 (PDT)
X-Received: by 2002:a1c:5581:: with SMTP id j123mr5137250wmb.11.1597845489930;
 Wed, 19 Aug 2020 06:58:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200819065555.1802761-1-hch@lst.de> <20200819065555.1802761-6-hch@lst.de>
 <CAAFQd5COLxjydDYrfx47ht8tj-aNPiaVnC+WyQA7nvpW4gs=ww@mail.gmail.com> <20200819135454.GA17098@lst.de>
In-Reply-To: <20200819135454.GA17098@lst.de>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 19 Aug 2020 15:57:53 +0200
X-Gmail-Original-Message-ID: <CAAFQd5BuXP7t3d-Rwft85j=KTyXq7y4s24mQxLr=VoY9krEGZw@mail.gmail.com>
Message-ID: <CAAFQd5BuXP7t3d-Rwft85j=KTyXq7y4s24mQxLr=VoY9krEGZw@mail.gmail.com>
Subject: Re: [PATCH 05/28] media/v4l2: remove V4L2-FLAG-MEMORY-NON-CONSISTENT
To:     Christoph Hellwig <hch@lst.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Ben Skeggs <bskeggs@redhat.com>,
        Pawel Osciak <pawel@osciak.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Matt Porter <mporter@kernel.crashing.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        alsa-devel@alsa-project.org,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-ia64@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-parisc@vger.kernel.org,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        nouveau@lists.freedesktop.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-nvme@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-mm@kvack.org, netdev@vger.kernel.org,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Aug 19, 2020 at 3:55 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Wed, Aug 19, 2020 at 01:16:51PM +0200, Tomasz Figa wrote:
> > Hi Christoph,
> >
> > On Wed, Aug 19, 2020 at 8:56 AM Christoph Hellwig <hch@lst.de> wrote:
> > >
> > > The V4L2-FLAG-MEMORY-NON-CONSISTENT flag is entirely unused,
> >
> > Could you explain what makes you think it's unused? It's a feature of
> > the UAPI generally supported by the videobuf2 framework and relied on
> > by Chromium OS to get any kind of reasonable performance when
> > accessing V4L2 buffers in the userspace.
>
> Because it doesn't do anything except on PARISC and non-coherent MIPS,
> so by definition it isn't used by any of these media drivers.

It's still an UAPI feature, so we can't simply remove the flag, it
must stay there as a no-op, until the problem is resolved.

Also, it of course might be disputable as an out-of-tree usage, but
selecting CONFIG_DMA_NONCOHERENT_CACHE_SYNC makes the flag actually do
something on other platforms, including ARM64.

Best regards,
Tomasz
