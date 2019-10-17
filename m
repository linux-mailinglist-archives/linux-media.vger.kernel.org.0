Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34933DA5F0
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2019 09:06:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407892AbfJQHG2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Oct 2019 03:06:28 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:36464 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403842AbfJQHG1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Oct 2019 03:06:27 -0400
Received: by mail-qt1-f194.google.com with SMTP id o12so2128434qtf.3
        for <linux-media@vger.kernel.org>; Thu, 17 Oct 2019 00:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+v0ASx+tAjdms4kpjMWbb8JvErh/BOsKx+LhhPzmtK8=;
        b=aF7xoKgzuJowFa4vOhq7pqeXJQiEbMpwChoc0mDI0F8Aa/SAoD7+OOZmjIIKXjlTbq
         3IL+KCneqbiAUpJBBQXMdRNeehm5biWgh/cZ5XVVzFu3ER2i1s8qOt+KIkG+zDUWj4kj
         RYSYFKK6g6vtRjjG9f8eXl5Kfr9gAMEnCjl1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+v0ASx+tAjdms4kpjMWbb8JvErh/BOsKx+LhhPzmtK8=;
        b=XDph+g26YSE6sz+Jj9jhbEGSWSt2/CtW4cIQpSnS8IDW0rc4Mk+fMnbXvB0nh3aML1
         I7ZQ/beNOtg5D2o1Rlqdla3rweh7j7seAzTBZOkfhL3BmB88fvA8dVtQScNJlcr3P7vQ
         xhjRihdP0eyVr3gQw96IZg/M83bT49xMs2ojeLp+hPtlGOCyk9wTBHwgkFL9IdUHF5So
         4drw3yuXeNJSrkH9E1KBL2t8mSe3dKjreZXxjMBvtkDevKSXa8ExaQpGgVEdJbBkX0Vi
         ynMl0aKTtTlV9L3s/LfkF0cr21LLb7b4b/da88PZ6NL0pJwOpeGnGMkm1+scd+iG11jw
         uI7g==
X-Gm-Message-State: APjAAAUO/9d30QBssylW79wFhLnlaggcUcQ+b2Ydeg0Ujh94/9/wSMSl
        KCz2lAknfYO8VvArllxz01JViTsQwQZ1jm/SPDpk3EtzdF0OSA==
X-Google-Smtp-Source: APXvYqz9DpsTtl9dIYVg2BC+bVyEUQGML5Rs/CMl4u+1dOo9yyHOhYxjJh5D+/3NCBthBJLadi9yEs2repa0iI8XBdo=
X-Received: by 2002:ac8:529a:: with SMTP id s26mr2364187qtn.234.1571295987098;
 Thu, 17 Oct 2019 00:06:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190919093404.182015-1-keiichiw@chromium.org>
 <20190923085637.bsaevedklweijgya@sirius.home.kraxel.org> <CAAFQd5Ba-REZU9=rdm3J6NRqqeAUFdCV7SJ_WdO2BHyKNBN7TQ@mail.gmail.com>
 <20191014121914.lyptm3gdmekvcu6v@sirius.home.kraxel.org>
In-Reply-To: <20191014121914.lyptm3gdmekvcu6v@sirius.home.kraxel.org>
From:   David Stevens <stevensd@chromium.org>
Date:   Thu, 17 Oct 2019 16:06:16 +0900
Message-ID: <CAD=HUj75TLESpKRk-TXVjKzFNUAQZFRxjMk3cQVA5u=pBkxX=w@mail.gmail.com>
Subject: Re: [virtio-dev] [PATCH] [RFC RESEND] vdec: Add virtio video decode
 device specification
To:     Gerd Hoffmann <kraxel@redhat.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        virtio-dev@lists.oasis-open.org,
        Alexandre Courbot <acourbot@chromium.org>,
        alexlau@chromium.org, dgreid@chromium.org,
        =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> Hmm, the cross-device buffer sharing framework I have in mind would
> basically be a buffer registry.  virtio-gpu would create buffers as
> usual, create a identifier somehow (details to be hashed out), attach
> the identifier to the dma-buf so it can be used as outlined above.

Using physical addresses to identify buffers is using the guest
physical address space as the buffer registry. Especially if every
device should be able to operate in isolation, then each virtio
protocol will have some way to allocate buffers that are accessible to
the guest and host. This requires guest physical addresses, and the
guest physical address of the start of the buffer can serve as the
unique identifier for the buffer in both the guest and the host. Even
with buffers that are only accessible to the host, I think it's
reasonable to allocate guest physical addresses since the pages still
exist (in the same way physical addresses for secure physical memory
make sense).

This approach also sidesteps the need for explicit registration. With
explicit registration, either there would need to be some centralized
buffer exporter device or each protocol would need to have its own
export function. Using guest physical addresses means that buffers get
a unique identifier during creation. For example, in the virtio-gpu
protocol, buffers would get this identifier through
VIRTIO_GPU_CMD_RESOURCE_ATTACH_BACKING, or through
VIRTIO_GPU_CMD_RESOURCE_CREATE_V2 with impending additions to resource
creation.

> Also note that the guest manages the address space, so the host can't
> simply allocate guest page addresses.  Mapping host virtio-gpu resources
> into guest address space is planned, it'll most likely use a pci memory
> bar to reserve some address space.  The host can map resources into that
> pci bar, on guest request.
>
> >  - virtio-gpu driver could then create a regular DMA-buf object for
> > such memory, because it's just backed by pages (even though they may
> > not be accessible to the guest; just like in the case of TrustZone
> > memory protection on bare metal systems),
>
> Hmm, well, pci memory bars are *not* backed by pages.  Maybe we can use
> Documentation/driver-api/pci/p2pdma.rst though.  With that we might be
> able to lookup buffers using device and dma address, without explicitly
> creating some identifier.  Not investigated yet in detail.

For the linux guest implementation, mapping a dma-buf doesn't
necessarily require actual pages. The exporting driver's map_dma_buf
function just needs to provide a sg_table with populated dma_addres
fields, it doesn't actually need to populate the sg_table with pages.
At the very least, there are places such as i915_gem_stolen.c and
(some situations of) videobuf-dma-sg.c that take this approach.

Cheers,
David
