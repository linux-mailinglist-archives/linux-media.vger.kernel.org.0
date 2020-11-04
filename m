Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8B3C2A6E8F
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 21:12:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731688AbgKDUM3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 15:12:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731012AbgKDUM3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Nov 2020 15:12:29 -0500
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B50FC061A4C
        for <linux-media@vger.kernel.org>; Wed,  4 Nov 2020 12:12:28 -0800 (PST)
Received: by mail-qt1-x842.google.com with SMTP id m14so13102734qtc.12
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2020 12:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rEEEXt1os4uvlr5FpRnmuBcc7L7msKpqjcsUXwjQF/c=;
        b=DLnfeD9J1ORdQ1bfs5+3AntXSfjpW/03OlgMKpfMczcb0Yo31gAQmfKmU/MxwQ17Tz
         p8ZagfXHFsC1dHS6FW5fSkhChMKNOPBoZuaf0P1ssilDHMYkmfYcvMK/N4bu0vQXK3wy
         c2tGk1nId5n4tetbAX3T+IoXKixnSiRJU2P+RgF0i9/MzM9vLJQC4pR4SHkQIDhJjOCm
         nI9uYdoL8DUDIOHzXzueS+XUGj/Xv/0E4OLEq6oqPKUHmkx/sfooqnKn5e06EiNpsCvu
         pIeS4Ja9kfYHVEpTmDFGZ6rRJqSaQZ+CUMbWPT9DrPeXAPhB8c08+nN3zrd9Xy424Dsr
         vK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rEEEXt1os4uvlr5FpRnmuBcc7L7msKpqjcsUXwjQF/c=;
        b=AwZw/yxJFbAYvAZ/FDl3Z45xE4e+yFGeXiZcaOSn2Dt+KvsdTBzMNo+MQrw71blzBA
         Yb0sVbwI57NkE35tR/DRnEzizImbqujvaTVmYkitwbHFfscUOIS5CvT5HkXQrWN4IyxQ
         dfVs92S9J1gKd4o8JdkaB5Udl9+f2JB2QSczhVHZIE41jYWdFeOIRJVpJB6EzvBUmLB5
         P7C42XI9vs8QVQbsr9j1hl3NuCNA7Wesqs7tFMfTWYZ1vrjLPftBkp2eG06FQRqmvS8c
         rg8Y5H8QK/XEV7SnpmJdxCdBGQ46sJqcaZ+CKMibxvpcRKHkRSKpg9qaVIFVJVqGG0jX
         Xplg==
X-Gm-Message-State: AOAM530H11V9z5acBIouqdpoL44bGJxSnoOuOz3tceF7ZzQjy20A3xYP
        Ysm+DpNL+6bsrY0Q73Xknu+1X680JPoCc2BZhCOrVg==
X-Google-Smtp-Source: ABdhPJyImQ0VMkgJ13gDdAbq5pEtNIjA5jffxfB/P+jRlJioL0jIF2z8jDtJ1zF31+FQiHcdLBXSWIzDRip6n19HrNg=
X-Received: by 2002:ac8:4b79:: with SMTP id g25mr21823130qts.19.1604520747497;
 Wed, 04 Nov 2020 12:12:27 -0800 (PST)
MIME-Version: 1.0
References: <CAKMK7uF0QjesaNs97N-G8cZkXuAmFgcmTfHvoCP94br_WVcV6Q@mail.gmail.com>
 <20201104165017.GA352206@bjorn-Precision-5520>
In-Reply-To: <20201104165017.GA352206@bjorn-Precision-5520>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Wed, 4 Nov 2020 12:12:15 -0800
Message-ID: <CAPcyv4idORJzHVD2vCOnO3REqWHKVn_-otOzTBf0HhcWq4iJRQ@mail.gmail.com>
Subject: Re: [PATCH v5 11/15] PCI: Obey iomem restrictions for procfs mmap
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        KVM list <kvm@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>, Bjorn Helgaas <bhelgaas@google.com>,
        Linux PCI <linux-pci@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 4, 2020 at 8:50 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Wed, Nov 04, 2020 at 09:44:04AM +0100, Daniel Vetter wrote:
> > On Tue, Nov 3, 2020 at 11:09 PM Dan Williams <dan.j.williams@intel.com> wrote:
> > > On Tue, Nov 3, 2020 at 1:28 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > > On Fri, Oct 30, 2020 at 11:08:11AM +0100, Daniel Vetter wrote:
> > > > > There's three ways to access PCI BARs from userspace: /dev/mem, sysfs
> > > > > files, and the old proc interface. Two check against
> > > > > iomem_is_exclusive, proc never did. And with CONFIG_IO_STRICT_DEVMEM,
> > > > > this starts to matter, since we don't want random userspace having
> > > > > access to PCI BARs while a driver is loaded and using it.
> > > > >
> > > > > Fix this by adding the same iomem_is_exclusive() check we already have
> > > > > on the sysfs side in pci_mmap_resource().
> > > > >
> > > > > References: 90a545e98126 ("restrict /dev/mem to idle io memory ranges")
> > > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > >
> > > > This is OK with me but it looks like IORESOURCE_EXCLUSIVE is currently
> > > > only used in a few places:
> > > >
> > > >   e1000_probe() calls pci_request_selected_regions_exclusive(),
> > > >   ne_pci_probe() calls pci_request_regions_exclusive(),
> > > >   vmbus_allocate_mmio() calls request_mem_region_exclusive()
> > > >
> > > > which raises the question of whether it's worth keeping
> > > > IORESOURCE_EXCLUSIVE at all.  I'm totally fine with removing it
> > > > completely.
> > >
> > > Now that CONFIG_IO_STRICT_DEVMEM upgrades IORESOURCE_BUSY to
> > > IORESOURCE_EXCLUSIVE semantics the latter has lost its meaning so I'd
> > > be in favor of removing it as well.
> >
> > Still has some value since it enforces exclusive access even if the
> > config isn't enabled, and iirc e1000 had some fun with userspace tools
> > clobbering the firmware and bricking the chip.
>
> There's *some* value; I'm just skeptical since only three drivers use
> it.
>
> IORESOURCE_EXCLUSIVE is from e8de1481fd71 ("resource: allow MMIO
> exclusivity for device drivers"), and the commit message says this is
> only active when CONFIG_STRICT_DEVMEM is set.  I didn't check to see
> whether that's still true.
>
> That commit adds a bunch of wrappers and "__"-prefixed functions to
> pass the IORESOURCE_EXCLUSIVE flag around.  That's a fair bit of
> uglification for three drivers.
>
> > Another thing I kinda wondered, since pci maintainer is here: At least
> > in drivers/gpu I see very few drivers explicitly requestion regions
> > (this might be a historical artifact due to the shadow attach stuff
> > before we had real modesetting drivers). And pci core doesn't do that
> > either, even when a driver is bound. Is this intentional, or
> > should/could we do better? Since drivers work happily without
> > reserving regions I don't think "the drivers need to remember to do
> > this" will ever really work out well.
>
> You're right, many drivers don't call pci_request_regions().  Maybe we
> could do better, but I haven't looked into that recently.  There is a
> related note in Documentation/PCI/pci.rst that's been there for a long
> time (it refers to "pci_request_resources()", which has never existed
> AFAICT).  I'm certainly open to proposals.

It seems a bug that the kernel permits MMIO regions with side effects
to be ioremap()'ed without request_mem_region() on the resource. I
wonder how much log spam would happen if ioremap() reported whenever a
non-IORESOURE_BUSY range was passed to it? The current state of
affairs to trust *remap users to have claimed their remap target seems
too ingrained to unwind now.
