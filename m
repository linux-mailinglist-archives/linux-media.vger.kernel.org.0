Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A7EB2AD287
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 10:33:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727046AbgKJJdU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Nov 2020 04:33:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726213AbgKJJdT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Nov 2020 04:33:19 -0500
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76F08C0613D3
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2020 01:33:19 -0800 (PST)
Received: by mail-oi1-x244.google.com with SMTP id m143so13594876oig.7
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2020 01:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4UkFzS0xqfoJt9doPeSUXNjV1Z9m4QzgZeqM5Nk8Yss=;
        b=i7K+5/+7cLZ5ZRdhNEamXRcWw2QQ5XKCYG2d+/ImIPCzSBjpmq/0TvrywlA9n7NxpH
         B766buJa+ieQ3fgGJlGjHosI3xzo0781KmeChVDqeRbxFFNxJfRC7WWIFV7adexCwpx+
         NTIuE0Bpoi0kHCRsaU97HNjA1Reud/62RUqaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4UkFzS0xqfoJt9doPeSUXNjV1Z9m4QzgZeqM5Nk8Yss=;
        b=Ky0d8blhGhUEwX+vY+xp+x7g+EbbKP8Xmic6qVehj7j6SW0/C1poXmIcu1+u7oIJPX
         /LNc1fLmO3S4fClhNvinobUAbE3YHcSNu8jGBk7LOZyycM15IrhlqiU6XSB3rcucb2Eo
         E0223tT/SWK9NEG9EDvLHohqI59yTk/YVSs0oRjTLiQ8H4i8yKW+dPolxpHMOP3ws8QT
         tUGVsasfeieMEqxMYVVkAmEYPaj3Q1nYvUfutDqvB4GmltU9naLYibJm8Ivq4P3PiGm7
         4cphqL93eU8b4PN4jxLLbKGqo1H1m/BVf83tJFuY80n/RAMFolmDT9zwLt6m7y3SLhNP
         OlyA==
X-Gm-Message-State: AOAM530OEMpwHM5L+sHRgZovKhzmwK7S/oM6tZh5Dp+imXkgZ6EYeWt0
        wB1MgNQpZ2X9qNEFCF1S56xRG3xNy6CrNkZp
X-Google-Smtp-Source: ABdhPJx/U1lHUQRnae1YcE6rLyFIK6iI5+dNc672E33LYlkT2KX73wjxooXrNIhyFRcbaHevIkO21w==
X-Received: by 2002:aca:c4c3:: with SMTP id u186mr2314432oif.4.1605000798554;
        Tue, 10 Nov 2020 01:33:18 -0800 (PST)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com. [209.85.167.174])
        by smtp.gmail.com with ESMTPSA id u4sm106942oib.0.2020.11.10.01.33.17
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2020 01:33:17 -0800 (PST)
Received: by mail-oi1-f174.google.com with SMTP id c80so13602534oib.2
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2020 01:33:17 -0800 (PST)
X-Received: by 2002:aca:3c54:: with SMTP id j81mr551270oia.11.1605000796616;
 Tue, 10 Nov 2020 01:33:16 -0800 (PST)
MIME-Version: 1.0
References: <20200930160917.1234225-1-hch@lst.de> <20200930160917.1234225-9-hch@lst.de>
 <CAAFQd5CttttqMXb=iDPb+Z0WGUa2g=W6JwXJ-5HbhmrDyxP+cQ@mail.gmail.com>
 <CANiDSCtefXKw-xC3bskyggW-BzCmVPj6GGLvO=cCPZHbS1oTDA@mail.gmail.com> <20201110092506.GA24469@lst.de>
In-Reply-To: <20201110092506.GA24469@lst.de>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 10 Nov 2020 10:33:05 +0100
X-Gmail-Original-Message-ID: <CANiDSCsBUBV1WA2To9x26Uhc5SU-4xuh3m4wUwXBcGwA6n8now@mail.gmail.com>
Message-ID: <CANiDSCsBUBV1WA2To9x26Uhc5SU-4xuh3m4wUwXBcGwA6n8now@mail.gmail.com>
Subject: Re: [PATCH 8/8] WIP: add a dma_alloc_contiguous API
To:     Christoph Hellwig <hch@lst.de>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Christoph

On Tue, Nov 10, 2020 at 10:25 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Mon, Nov 09, 2020 at 03:53:55PM +0100, Ricardo Ribalda wrote:
> > Hi Christoph
> >
> > I have started now to give a try to your patchset. Sorry for the delay.
> >
> > For uvc I have prepared this patch:
> > https://github.com/ribalda/linux/commit/9094fe223fe38f8c8ff21366d893b43cbbdf0113
> >
> > I have tested successfully in a x86_64 noteboot..., yes I know there
> > is no change for that platform :).
> > I am trying to get hold of an arm device that can run the latest
> > kernel from upstream.
> >
> > On the meanwhile if you could take a look to the patch to verify that
> > this the way that you expect the drivers to use your api I would
> > appreciate it
>
> This looks pretty reaosnable.
>

Great

Also FYI, I managed to boot an ARM device with that tree. But I could
not test the uvc driver (it was a remote device with no usb device
attached)

Hopefully I will be able to test it for real this week.

Any suggestions for how to measure performance difference?

Thanks!

> Note that ifdef  CONFIG_DMA_NONCOHERENT in the old code doesn't actually
> work, as that option is an internal thing just for mips and sh..



-- 
Ricardo Ribalda
