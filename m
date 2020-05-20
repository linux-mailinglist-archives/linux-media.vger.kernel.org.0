Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3787E1DB4B1
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2020 15:13:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726443AbgETNNZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 May 2020 09:13:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726435AbgETNNY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 May 2020 09:13:24 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92904C061A0E
        for <linux-media@vger.kernel.org>; Wed, 20 May 2020 06:13:24 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id 62so1788118vsi.2
        for <linux-media@vger.kernel.org>; Wed, 20 May 2020 06:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xkbaa594c8hv+diM8KSwVgXKuqqnjj5zKvkKBeTJ7Y8=;
        b=bIQJC7j5R8fNWSzcDnZyiArEu05iGkkV808NYTZQsP9ZndMtm0jSwoxGTbP1wEWlWS
         xRvVuUoC+ICgjPaSL9GOuBMvRvhCz/oV11aDNMykz7McJBAePHxFzcKEm2csk/abeviv
         D3/0I/daBMJyLnVyrTZXwrFlsu6Qr030DDT0pm/tTkAog+FNfcyyKnrcz7kUH4hSQVk/
         shmMRTf+d19IX2eqzvEZZYNj2OAevUZTfFu4jEivt8IjMA8fzzIJVvzJtEPJSWpi1EAk
         CzAit9S+UCd0ryi7WKOLuuzIQJyTdbAPBwV3Oql+f+L7D1hgLkcYWjM8GYghy4CBAvv9
         C1jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xkbaa594c8hv+diM8KSwVgXKuqqnjj5zKvkKBeTJ7Y8=;
        b=DItA8G9L3rDu0b2+ky44lu340NNTjK4tbeB9XJ1V6Y7ya7rkrwX5xb9tO1CtAQAK7y
         LW/f7iEG9iiEGRhC/3de1FH9hnw4mdeqwZesD1IOaEmA9ZO7boovghp7CoGQHB5u4KWd
         lhS74oL5vvml+c6s9Zh1UmlgJN9NmnEL/Nx47jz7cvgAnAzPfhFjW8Y7eAmaPsGkRycK
         SmKs6hancQE2PNX8hToKyo5tMiHtgj6Ypzj6l/QWh+cLdFQhmjkjUwOBDk2oBmGd0QqM
         saQ/fO4vjfWe7ps1BFUPzzbB7+ge4UhEv0UJwIE5elQAPxPWftJCrf5qVmhB5vGQI718
         iNnw==
X-Gm-Message-State: AOAM531S6gkZUoW/qbpyYPDq/aG2OLx2sreRedhrRpGp/EDWFdOA8k3r
        p5MH71YLram0tvBbtwcriVqr8aLVtf97/2TxIroRjQ==
X-Google-Smtp-Source: ABdhPJyBnsXW7Elj1e8OEgBZBEgxJLFpJTtMLDkfQr6wABx8JXZgMSvMsz5k8oJKRDs/Q8pbKQxMRDH70/p2o51PWso=
X-Received: by 2002:a67:be05:: with SMTP id x5mr3092492vsq.35.1589980403704;
 Wed, 20 May 2020 06:13:23 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200520090109eucas1p17270805f81f6958cd5084a7b910efc6c@eucas1p1.samsung.com>
 <a9df7155-dd7a-752b-6d1c-3426837756b1@ti.com> <e9674719-0c86-63be-04a3-ee98bd884901@samsung.com>
 <f3c58dcd-b806-95ef-2434-3084e65e1afb@ti.com> <e3fa0b35-7cca-1e37-c2fa-63cc07e6bfda@samsung.com>
 <227465a5-c6e6-5b4d-abbd-7789727843a6@ti.com> <29a21e64-a63f-6721-c938-d713488767c1@samsung.com>
In-Reply-To: <29a21e64-a63f-6721-c938-d713488767c1@samsung.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 20 May 2020 15:12:47 +0200
Message-ID: <CAPDyKFq8-JYA_tKZmUZOY3mT-jeoWMHNpdj8SDGkqYmX7jJHVQ@mail.gmail.com>
Subject: Re: Bad kfree of dma_parms in v5.7-rc5
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

+ Greg

On Wed, 20 May 2020 at 14:54, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> Hi Tomi,
>
> On 20.05.2020 14:43, Tomi Valkeinen wrote:
> > On 20/05/2020 12:22, Marek Szyprowski wrote:
> >> On 20.05.2020 11:18, Tomi Valkeinen wrote:
> >>> On 20/05/2020 12:13, Marek Szyprowski wrote:
> >>>> On 20.05.2020 11:00, Tomi Valkeinen wrote:
> >>>>> Commit 9495b7e92f716ab2bd6814fab5e97ab4a39adfdd ("driver core:
> >>>>> platform: Initialize dma_parms for platform devices") v5.7-rc5 causes
> >>>>> at least some v4l2 platform drivers to break when freeing resources.
> >>>>>
> >>>>> E.g. drivers/media/platform/ti-vpe/cal.c uses
> >>>>> vb2_dma_contig_set_max_seg_size() and
> >>>>> vb2_dma_contig_clear_max_seg_size() to manage the dma_params, and
> >>>>> similar pattern is seen in other drivers too.
> >>>>>
> >>>>> After 9495b7e92f716ab2, vb2_dma_contig_set_max_seg_size() will not
> >>>>> allocate anything, but vb2_dma_contig_clear_max_seg_size() will still
> >>>>> kfree the dma_params.
> >>>>>
> >>>>> I'm not sure what's the proper fix here. A flag somewhere to indicate
> >>>>> that vb2_dma_contig_set_max_seg_size() did allocate, and thus
> >>>>> vb2_dma_contig_clear_max_seg_size() must free?
> >>>>>
> >>>>> Or drop the kzalloc and kfree totally, if dma_params is now supposed
> >>>>> to always be there?
> >>>>
> >>>> Thanks for reporting this issue!
> >>>>
> >>>> Once the mentioned commit has been merged, the code should assume that
> >>>> the platform devices does have a struct dma_params allocated, so the
> >>>> proper fix is to alloc dma_params only if the bus is not a platform
> >>>> bus:
> >>>>
> >>>> if (!dev_is_platform(dev) && !dev->dma_parms) {
> >>>>        dev->dma_parms = kzalloc(sizeof(*dev->dma_parms), GFP_KERNEL);
> >>>>
> >>>> same check for the free path.
> >>>
> >>> There is also "amba: Initialize dma_parms for amba devices". And the
> >>> commit message says PCI devices do this too.
> >>>
> >>> Guessing this based on the device type doesn't sound like a good idea
> >>> to me.
> >>
> >> Indeed. Then replace the allocation with a simple check for NULL
> >> dma_parms and return an error in such case. This should be enough for
> >> v5.8. Later we can simply get rid of those helpers and inline setting
> >> max segment size directly to the drivers.

That seems like a good idea, in the long run.

> >
> > Is that valid either? Then we assume that dma_parms is always set up
> > by someone else. That's true for platform devices and apparently some
> > other devices, but is it true for all devices now?
>
> # git grep vb2_dma_contig_set_max_seg_size | wc -l
>
> 18
>
> I've checked all clients of the vb2_dma_contig_set_max_seg_size
> function. There are only 9 drivers, all of them are platform device
> drivers. We don't care about off-tree users, so the proposed approach is
> imho fine.

Thanks for reporting and for looking into this. I apologize for the mess!

There is one case, where the above solution could be a problem (unless
I am wrong). That is, s5p_mfc_configure_2port_memory() that calls
s5p_mfc_alloc_memdev(), which allocates/initializes an internal struct
*device. Thus, this doesn't have the dev->dma_parms
allocated/assigned.

In other words, we would need to manage alloc/free for the
dev->dma_parms to have a complete fix. Maybe in
s5p_mfc_configure|unconfigure_2port_memory()!?

Additionally, I think reverting the offending commit, as discussed
above, could cause even more issues, as it's even included for
v5.6-stable kernels. I will go through all cases, more carefully this
time, of how ->dma_parms is managed, to be sure there are no more
conflicting cases.

Kind regards
Uffe
