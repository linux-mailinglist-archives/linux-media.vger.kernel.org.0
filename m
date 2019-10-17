Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 879D4DA72C
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2019 10:24:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408211AbfJQIYF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Oct 2019 04:24:05 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:43541 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387581AbfJQIYF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Oct 2019 04:24:05 -0400
Received: by mail-ed1-f67.google.com with SMTP id r9so1023938edl.10
        for <linux-media@vger.kernel.org>; Thu, 17 Oct 2019 01:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EMtb6RxR3NIioeXGn4qhRnliwKyFeIZaT/dUZJyME6g=;
        b=bfb3BgZ1zirdOQocWLerH+3qrhQAJukLdt9f02Tj7S5lJ4fyEfXrnUZyrPb4gYZm1w
         VmtGsansHPyMyeePrdh9ZnQZ8gcuggKFGWRcNCnC7ZGQyTODuRk55nAdq/MyAiFE+ZGC
         UVGowYsXuKP8KbRuzFmCkEUs4szfrm4sLC5XQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EMtb6RxR3NIioeXGn4qhRnliwKyFeIZaT/dUZJyME6g=;
        b=o39gVAsfBYuZvhCS3husRGt2Euj9TDXmu5d8EfmPmYtpF6aLJTcvHfovklumZ7ZiaS
         1fX9dE/5VK3+1UPLbzo1rm4cVxnzgx8VzgbQnT8qSXZLJZdHwh545a//z3sQwY0BQpey
         LosDnmUJ91MifEeYR41j7hIqhcHyQfMu5kUvvFPyIlfegMBXTYfAfYftvO4iUA59b09j
         Ais0EG7GJ6DbWQzj7yLr3u1fh4DfC8xWI8YPHO9aBOxLugiv1mloynqdM0KVrxiw5Sla
         V8P54b4D1hf62c6tG8bbm/Eskc36kqGYk+QVHk4D4wym4DI7pd0DPl5ci4ygMjcac5wL
         dOUw==
X-Gm-Message-State: APjAAAUeg/rH3649PP0In7N7c9nhQUQBhwhpQbcMky2j6+D8oBE7rQzM
        J7zgE1zbsecyo3YDuSoZcpZg1uFUEec0tg==
X-Google-Smtp-Source: APXvYqzxTtmRO/WJ9gpDy9UrvKjyLIj4VhzteMxqz6fp3KP9cpbxd8Dc9RNgu488Hmb8KgB9Sr7I/g==
X-Received: by 2002:a17:906:e2ce:: with SMTP id gr14mr2226179ejb.229.1571300643243;
        Thu, 17 Oct 2019 01:24:03 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id r18sm69127edx.94.2019.10.17.01.24.01
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2019 01:24:02 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id l10so840791wrb.2
        for <linux-media@vger.kernel.org>; Thu, 17 Oct 2019 01:24:01 -0700 (PDT)
X-Received: by 2002:adf:dd8b:: with SMTP id x11mr1866183wrl.113.1571300640894;
 Thu, 17 Oct 2019 01:24:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190919093404.182015-1-keiichiw@chromium.org>
 <20190923085637.bsaevedklweijgya@sirius.home.kraxel.org> <CAAFQd5Ba-REZU9=rdm3J6NRqqeAUFdCV7SJ_WdO2BHyKNBN7TQ@mail.gmail.com>
 <20191014121914.lyptm3gdmekvcu6v@sirius.home.kraxel.org> <CAAFQd5CaxYoXQ6z4pmdTG3FDN8ccEk3sHMnSkoNwL2==hk6znQ@mail.gmail.com>
 <20191017074416.wrndxdwntynqmpm4@sirius.home.kraxel.org>
In-Reply-To: <20191017074416.wrndxdwntynqmpm4@sirius.home.kraxel.org>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 17 Oct 2019 17:23:49 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Dh-VE2v=uX1bqKywwELxrH1a9wsRAine2=AVe3gQFt4w@mail.gmail.com>
Message-ID: <CAAFQd5Dh-VE2v=uX1bqKywwELxrH1a9wsRAine2=AVe3gQFt4w@mail.gmail.com>
Subject: Re: [virtio-dev] [PATCH] [RFC RESEND] vdec: Add virtio video decode
 device specification
To:     Gerd Hoffmann <kraxel@redhat.com>
Cc:     Keiichi Watanabe <keiichiw@chromium.org>,
        virtio-dev@lists.oasis-open.org,
        Alexandre Courbot <acourbot@chromium.org>,
        alexlau@chromium.org, dgreid@chromium.org,
        =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        David Stevens <stevensd@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 17, 2019 at 4:44 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > > Also note that the guest manages the address space, so the host can't
> > > simply allocate guest page addresses.
> >
> > Is this really true? I'm not an expert in this area, but on a bare
> > metal system it's the hardware or firmware that sets up the various
> > physical address allocations on a hardware level and most of the time
> > most of the addresses are already pre-assigned in hardware (like the
> > DRAM base, various IOMEM spaces, etc.).
>
> Yes, the firmware does it.  Same in a VM, ovmf or seabios (which runs
> inside the guest) typically does it.  And sometimes the linux kernel
> too.
>
> > I think that means that we could have a reserved region that could be
> > used by the host for dynamic memory hot-plug-like operation. The
> > reference to memory hot-plug here is fully intentional, we could even
> > use this feature of Linux to get struct pages for such memory if we
> > really wanted.
>
> We try to avoid such quirks whenever possible.  Negotiating such things
> between qemu and firmware can be done if really needed (and actually is
> done for memory hotplug support), but it's an extra interface which
> needs maintenance.
>
> > > Mapping host virtio-gpu resources
> > > into guest address space is planned, it'll most likely use a pci memory
> > > bar to reserve some address space.  The host can map resources into that
> > > pci bar, on guest request.
> >
> > Sounds like a viable option too. Do you have a pointer to some
> > description on how this would work on both host and guest side?
>
> Some early code:
>   https://git.kraxel.org/cgit/qemu/log/?h=sirius/virtio-gpu-memory-v2
>   https://git.kraxel.org/cgit/linux/log/?h=drm-virtio-memory-v2
>
> Branches have other stuff too, look for "hostmem" commits.
>
> Not much code yet beyond creating a pci bar on the host and detecting
> presence in the guest.
>
> On the host side qemu would create subregions inside the hostmem memory
> region for the resources.
>
> Oh the guest side we can ioremap stuff, like vram.
>
> > > Hmm, well, pci memory bars are *not* backed by pages.  Maybe we can use
> > > Documentation/driver-api/pci/p2pdma.rst though.  With that we might be
> > > able to lookup buffers using device and dma address, without explicitly
> > > creating some identifier.  Not investigated yet in detail.
> >
> > Not backed by pages as in "struct page", but those are still regular
> > pages of the physical address space.
>
> Well, maybe not.  Host gem object could live in device memory, and if we
> map them into the guest ...

That's an interesting scenario, but in that case would we still want
to map it into the guest? I think in such case may need to have some
shadow buffer in regular RAM and that's already implemented in
virtio-gpu.

>
> > That said, currently the sg_table interface is only able to describe
> > physical memory using struct page pointers.  It's been a long standing
> > limitation affecting even bare metal systems, so perhaps it's just the
> > right time to make them possible to use some other identifiers, like
> > PFNs?
>
> I doubt you can handle pci memory bars like regular ram when it comes to
> dma and iommu support.  There is a reason we have p2pdma in the first
> place ...

The thing is that such bars would be actually backed by regular host
RAM. Do we really need the complexity of real PCI bar handling for
that?

Best regards,
Tomasz
