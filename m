Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6270A33AC5D
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 08:36:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230151AbhCOHgP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 03:36:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230131AbhCOHfp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 03:35:45 -0400
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C096C06175F
        for <linux-media@vger.kernel.org>; Mon, 15 Mar 2021 00:35:45 -0700 (PDT)
Received: by mail-io1-xd30.google.com with SMTP id m7so13276751iow.7
        for <linux-media@vger.kernel.org>; Mon, 15 Mar 2021 00:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qvhzd78JFcrVgfmlvFEjQlY3MhKPukXzd21KEKGnhww=;
        b=WPXVk3F7SA4y4Nef8rJie6Wi/p9PQeGdCHaSp5I1F/sH2CtRCHSyg3Mniin5qndmyx
         owDJSvOtd/CYMCnwsSQPLt3OyDJqXeoxmitkYCAq1yTLfQ/SztFPc9kk5eZat5r143GM
         gjjURblzzz8moUhqvmiT6jt7NRQO/ocAOGPEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qvhzd78JFcrVgfmlvFEjQlY3MhKPukXzd21KEKGnhww=;
        b=arOJC8Pe1PsYcd7stM+KJ2SfOCFYk8ImUiYpdxIAB6w1VnDzy3o7crmxbx4s0nIygC
         KapMIo4ERlQQzHMyOeRsZtHTXagNFraQgkV+wtXdS//eajVgWFM3bQbQFgypXEihE7Yy
         0QFtKNevq6qOEfqzGaG8QqgNDbzaT3Hk5lRxeEkCTsGw/cYL+GjJUUq/0yWmB1aRlxmf
         +vqF5Qz99hwE1FtXaET/4DHe7Q8b1npSbQyyC4AK82amD9E9+080GJdx/hLVKBY0+aFP
         U8u/e6CLDLsfprf7ZUIMOaMnjIKWIZSIvRVN5lr+BolwbVKiPzZql3A0eAStpt8PAOkf
         hoQQ==
X-Gm-Message-State: AOAM533qjFg1HtDUgBp0MwhUmGC8wj8GclDVHUjvuQtG7oR5YHBA0P+Z
        PBxYzLnHvfv99uZAToJYPdLNvhzJ+zKd2Q==
X-Google-Smtp-Source: ABdhPJzW5wv1Bv2W/H0xVirZKxiGkG6natYuqGF9AGGgVFvg8W1BVeYCgUMAdcJdjvEKYza0JAnfqQ==
X-Received: by 2002:a02:3c01:: with SMTP id m1mr8115914jaa.87.1615793744509;
        Mon, 15 Mar 2021 00:35:44 -0700 (PDT)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com. [209.85.166.46])
        by smtp.gmail.com with ESMTPSA id p13sm7421595ilp.1.2021.03.15.00.35.43
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Mar 2021 00:35:44 -0700 (PDT)
Received: by mail-io1-f46.google.com with SMTP id y20so13999878iot.4
        for <linux-media@vger.kernel.org>; Mon, 15 Mar 2021 00:35:43 -0700 (PDT)
X-Received: by 2002:a05:6602:722:: with SMTP id g2mr6345139iox.1.1615793743446;
 Mon, 15 Mar 2021 00:35:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210312235521.1408503-1-ribalda@chromium.org>
 <CANiDSCvK8AD7RUYGN-7e1zH9cMGTqGnwn4fJ+ZfKtktuJC14Nw@mail.gmail.com> <20210315073416.GA25860@lst.de>
In-Reply-To: <20210315073416.GA25860@lst.de>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Mon, 15 Mar 2021 08:35:36 +0100
X-Gmail-Original-Message-ID: <CANiDSCtAXmGjjN3OZVOdtquAnOW7emk_HYvQqJQtnvVAcsmRHQ@mail.gmail.com>
Message-ID: <CANiDSCtAXmGjjN3OZVOdtquAnOW7emk_HYvQqJQtnvVAcsmRHQ@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] media: uvcvideo: Use dma_alloc_noncontiguous API
To:     Christoph Hellwig <hch@lst.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@google.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Mar 15, 2021 at 8:34 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Mon, Mar 15, 2021 at 08:30:57AM +0100, Ricardo Ribalda wrote:
> > Hi Christoph
> >
> > I guess you can merge this patch from your tree. I hope it is not too
> > late in this release cycle.
>
> The timing is perfectly fine, I haven't even started the dma-mapping tree
> for v5.13 yet.

Awesome!

Thanks Laurent for the review!


-- 
Ricardo Ribalda
