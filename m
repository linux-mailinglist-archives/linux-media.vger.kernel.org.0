Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68FCB1DB8E9
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2020 18:02:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726824AbgETQCg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 May 2020 12:02:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726596AbgETQCf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 May 2020 12:02:35 -0400
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com [IPv6:2607:f8b0:4864:20::a41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70851C061A0E
        for <linux-media@vger.kernel.org>; Wed, 20 May 2020 09:02:35 -0700 (PDT)
Received: by mail-vk1-xa41.google.com with SMTP id m18so886739vkk.9
        for <linux-media@vger.kernel.org>; Wed, 20 May 2020 09:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Oaxmms6S+D3RLKgoxkPRFXAUlOA5Vp3PgUPuvODNC54=;
        b=daN7Y6ZGJMO9M3WF8cQSS/i6Zxqgdb6eb7NdI6SDB/DGM9ng92rAMgE8ZXnaSzqwtp
         gD8MZODcyzF8xprMQq6ewSXbIO687gYkr9E51sB8aOCMVDjlJqCTB3M5jyXt1TmuJoc+
         ODyjcbBkQod3AkBXa0IuzaCZWHP1TcbXnafwVzBGQFNe9qiuqhKoeWVMbfsWi7+KudgI
         AOP/1mLtUZyGK5b/bd3tSVoLauPQCnK3QOAOxigyLPW2MF6amXGJiWVAXbM2/XHs7JDi
         lLfiR4hGoRt1bTlg9uiaEy7BzwHz2JGdKVtkYlqqF9BcC+X/2Ajp3HBLz4O32ZgCovWe
         O7WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Oaxmms6S+D3RLKgoxkPRFXAUlOA5Vp3PgUPuvODNC54=;
        b=iaecev7U95K0smLy8m7RYKxnUp32QG78j9MW/Ps/bACUiXSRr0JHkQoq6MiLqxDd3W
         3BmWtcoV0CX/D8RTUZfZwYJ1yUXorGLl9y9jkeINseGvCDtR/CfRS+rz7GNenA96h0Wm
         iM83WLqZm2qdma86U29keQpq2WrIUP+uDYBbOnbC1rY0q5Npd5ygXjjh8MJPSLkfSvig
         a4x+5GbQbHC1PLFSTcoL/MywbHeb6uCSus+i3nSHvk4O8rJT1IIJSplOjU7zACK04f5q
         LHmq4pAVn0WlQqlKmsBw/GBqWYPxM1xXsTQjajurc1WantoSUC4K0mCGlRMAaZm7y4Qj
         denA==
X-Gm-Message-State: AOAM5324WzgHcR5rfd1c4ft5FgIXLn7Kwg7OKM0x9kH9E3A0F5PFiq/4
        RGps5jrpZGEKUDgdJtUu3dQ2h9h6L9hoPVQAl0Orlw==
X-Google-Smtp-Source: ABdhPJx+vcAio0UMotr9EBZwqzsZZdGl/lJYDY+6mYhrnUnC2V51FJHVO0B2WWsbJDVMYI7Yp16fLaPIIekNZ0qmcs8=
X-Received: by 2002:a1f:fc06:: with SMTP id a6mr4282634vki.101.1589990553231;
 Wed, 20 May 2020 09:02:33 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200520090109eucas1p17270805f81f6958cd5084a7b910efc6c@eucas1p1.samsung.com>
 <a9df7155-dd7a-752b-6d1c-3426837756b1@ti.com> <e9674719-0c86-63be-04a3-ee98bd884901@samsung.com>
 <f3c58dcd-b806-95ef-2434-3084e65e1afb@ti.com> <e3fa0b35-7cca-1e37-c2fa-63cc07e6bfda@samsung.com>
 <227465a5-c6e6-5b4d-abbd-7789727843a6@ti.com> <29a21e64-a63f-6721-c938-d713488767c1@samsung.com>
 <CAPDyKFq8-JYA_tKZmUZOY3mT-jeoWMHNpdj8SDGkqYmX7jJHVQ@mail.gmail.com>
 <9f72aeab-8d63-7fc1-d5ff-7d5c4f11012b@samsung.com> <CAPDyKFpgzYJzWR3mc-4XQDijtHVibDrFXazY0=P7TUs6rvE_hQ@mail.gmail.com>
In-Reply-To: <CAPDyKFpgzYJzWR3mc-4XQDijtHVibDrFXazY0=P7TUs6rvE_hQ@mail.gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 20 May 2020 18:01:56 +0200
Message-ID: <CAPDyKFqMfbBU-_0gBfkgF3d2FZQH5cihXaOCxWUiT11aSHhWMg@mail.gmail.com>
Subject: Re: Bad kfree of dma_parms in v5.7-rc5
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Marek, Tomi, Greg

On Wed, 20 May 2020 at 17:14, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Wed, 20 May 2020 at 15:28, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> >
> > Hi Ulf,
> >
> > On 20.05.2020 15:12, Ulf Hansson wrote:
> > > + Greg
> > >
> > > On Wed, 20 May 2020 at 14:54, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> > >> On 20.05.2020 14:43, Tomi Valkeinen wrote:
> > >>> On 20/05/2020 12:22, Marek Szyprowski wrote:
> > >>>> On 20.05.2020 11:18, Tomi Valkeinen wrote:
> > >>>>> On 20/05/2020 12:13, Marek Szyprowski wrote:
> > >>>>>> On 20.05.2020 11:00, Tomi Valkeinen wrote:
> > >>>>>>> Commit 9495b7e92f716ab2bd6814fab5e97ab4a39adfdd ("driver core:
> > >>>>>>> platform: Initialize dma_parms for platform devices") v5.7-rc5 causes
> > >>>>>>> at least some v4l2 platform drivers to break when freeing resources.
> > >>>>>>>
> > >>>>>>> E.g. drivers/media/platform/ti-vpe/cal.c uses
> > >>>>>>> vb2_dma_contig_set_max_seg_size() and
> > >>>>>>> vb2_dma_contig_clear_max_seg_size() to manage the dma_params, and
> > >>>>>>> similar pattern is seen in other drivers too.
> > >>>>>>>
> > >>>>>>> After 9495b7e92f716ab2, vb2_dma_contig_set_max_seg_size() will not
> > >>>>>>> allocate anything, but vb2_dma_contig_clear_max_seg_size() will still
> > >>>>>>> kfree the dma_params.
> > >>>>>>>
> > >>>>>>> I'm not sure what's the proper fix here. A flag somewhere to indicate
> > >>>>>>> that vb2_dma_contig_set_max_seg_size() did allocate, and thus
> > >>>>>>> vb2_dma_contig_clear_max_seg_size() must free?
> > >>>>>>>
> > >>>>>>> Or drop the kzalloc and kfree totally, if dma_params is now supposed
> > >>>>>>> to always be there?
> > >>>>>> Thanks for reporting this issue!
> > >>>>>>
> > >>>>>> Once the mentioned commit has been merged, the code should assume that
> > >>>>>> the platform devices does have a struct dma_params allocated, so the
> > >>>>>> proper fix is to alloc dma_params only if the bus is not a platform
> > >>>>>> bus:
> > >>>>>>
> > >>>>>> if (!dev_is_platform(dev) && !dev->dma_parms) {
> > >>>>>>         dev->dma_parms = kzalloc(sizeof(*dev->dma_parms), GFP_KERNEL);
> > >>>>>>
> > >>>>>> same check for the free path.
> > >>>>> There is also "amba: Initialize dma_parms for amba devices". And the
> > >>>>> commit message says PCI devices do this too.
> > >>>>>
> > >>>>> Guessing this based on the device type doesn't sound like a good idea
> > >>>>> to me.
> > >>>> Indeed. Then replace the allocation with a simple check for NULL
> > >>>> dma_parms and return an error in such case. This should be enough for
> > >>>> v5.8. Later we can simply get rid of those helpers and inline setting
> > >>>> max segment size directly to the drivers.
> > > That seems like a good idea, in the long run.
> > >
> > >>> Is that valid either? Then we assume that dma_parms is always set up
> > >>> by someone else. That's true for platform devices and apparently some
> > >>> other devices, but is it true for all devices now?
> > >> # git grep vb2_dma_contig_set_max_seg_size | wc -l
> > >>
> > >> 18
> > >>
> > >> I've checked all clients of the vb2_dma_contig_set_max_seg_size
> > >> function. There are only 9 drivers, all of them are platform device
> > >> drivers. We don't care about off-tree users, so the proposed approach is
> > >> imho fine.
> > > Thanks for reporting and for looking into this. I apologize for the mess!
> > >
> > > There is one case, where the above solution could be a problem (unless
> > > I am wrong). That is, s5p_mfc_configure_2port_memory() that calls
> > > s5p_mfc_alloc_memdev(), which allocates/initializes an internal struct
> > > *device. Thus, this doesn't have the dev->dma_parms
> > > allocated/assigned.
> > Indeed, this one will fail.
> > > In other words, we would need to manage alloc/free for the
> > > dev->dma_parms to have a complete fix. Maybe in
> > > s5p_mfc_configure|unconfigure_2port_memory()!?
> > That would be the best place to allocate it.
> > > Additionally, I think reverting the offending commit, as discussed
> > > above, could cause even more issues, as it's even included for
> > > v5.6-stable kernels. I will go through all cases, more carefully this
> > > time, of how ->dma_parms is managed, to be sure there are no more
> > > conflicting cases.
> >
> > I've already posted a fix for ExynosDRM driver, which is also affected:
> > https://patchwork.kernel.org/patch/11559965/
>
> Alright, thanks for helping out!
>
> Please add a fixes/stable tag to it.
>
> Fixes: 9495b7e92f71 ("driver core: platform: Initialize dma_parms for
> platform devices")
> Cc: stable@vger.kernel.org
>

FYI:

I have now double checked all cases where ->dma_params are being
allocated/freed. Besides those you (Marek/Tomi) you have found and
sent fixes for (many thanks!)  - I haven't found any additional cases
to worry about.

However, of course there are cleanups and removal of redundant code
that can be made, for some drivers/devices, which are based upon a
platform device. For example, some have their own "struct
device_dma_parameters", such as drivers/dma/dma-axi-dmac.c for
example. This is not a problem, but deserves to be cleaned up. I have
started to prepare patches for it.

Kind regards
Uffe
