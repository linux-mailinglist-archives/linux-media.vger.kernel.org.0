Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 943D8DA69E
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2019 09:44:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438445AbfJQHoT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Oct 2019 03:44:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49334 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389017AbfJQHoS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Oct 2019 03:44:18 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 58BD851EF6;
        Thu, 17 Oct 2019 07:44:18 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-43.ams2.redhat.com [10.36.116.43])
        by smtp.corp.redhat.com (Postfix) with ESMTP id BD472100EBDD;
        Thu, 17 Oct 2019 07:44:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id EF04A11AAA; Thu, 17 Oct 2019 09:44:16 +0200 (CEST)
Date:   Thu, 17 Oct 2019 09:44:16 +0200
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Keiichi Watanabe <keiichiw@chromium.org>,
        virtio-dev@lists.oasis-open.org,
        Alexandre Courbot <acourbot@chromium.org>,
        alexlau@chromium.org, dgreid@chromium.org,
        =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        David Stevens <stevensd@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [virtio-dev] [PATCH] [RFC RESEND] vdec: Add virtio video decode
 device specification
Message-ID: <20191017074416.wrndxdwntynqmpm4@sirius.home.kraxel.org>
References: <20190919093404.182015-1-keiichiw@chromium.org>
 <20190923085637.bsaevedklweijgya@sirius.home.kraxel.org>
 <CAAFQd5Ba-REZU9=rdm3J6NRqqeAUFdCV7SJ_WdO2BHyKNBN7TQ@mail.gmail.com>
 <20191014121914.lyptm3gdmekvcu6v@sirius.home.kraxel.org>
 <CAAFQd5CaxYoXQ6z4pmdTG3FDN8ccEk3sHMnSkoNwL2==hk6znQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5CaxYoXQ6z4pmdTG3FDN8ccEk3sHMnSkoNwL2==hk6znQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Thu, 17 Oct 2019 07:44:18 +0000 (UTC)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

  Hi,

> > Also note that the guest manages the address space, so the host can't
> > simply allocate guest page addresses.
> 
> Is this really true? I'm not an expert in this area, but on a bare
> metal system it's the hardware or firmware that sets up the various
> physical address allocations on a hardware level and most of the time
> most of the addresses are already pre-assigned in hardware (like the
> DRAM base, various IOMEM spaces, etc.).

Yes, the firmware does it.  Same in a VM, ovmf or seabios (which runs
inside the guest) typically does it.  And sometimes the linux kernel
too.

> I think that means that we could have a reserved region that could be
> used by the host for dynamic memory hot-plug-like operation. The
> reference to memory hot-plug here is fully intentional, we could even
> use this feature of Linux to get struct pages for such memory if we
> really wanted.

We try to avoid such quirks whenever possible.  Negotiating such things
between qemu and firmware can be done if really needed (and actually is
done for memory hotplug support), but it's an extra interface which
needs maintenance.

> > Mapping host virtio-gpu resources
> > into guest address space is planned, it'll most likely use a pci memory
> > bar to reserve some address space.  The host can map resources into that
> > pci bar, on guest request.
> 
> Sounds like a viable option too. Do you have a pointer to some
> description on how this would work on both host and guest side?

Some early code:
  https://git.kraxel.org/cgit/qemu/log/?h=sirius/virtio-gpu-memory-v2
  https://git.kraxel.org/cgit/linux/log/?h=drm-virtio-memory-v2

Branches have other stuff too, look for "hostmem" commits.

Not much code yet beyond creating a pci bar on the host and detecting
presence in the guest.

On the host side qemu would create subregions inside the hostmem memory
region for the resources.

Oh the guest side we can ioremap stuff, like vram.

> > Hmm, well, pci memory bars are *not* backed by pages.  Maybe we can use
> > Documentation/driver-api/pci/p2pdma.rst though.  With that we might be
> > able to lookup buffers using device and dma address, without explicitly
> > creating some identifier.  Not investigated yet in detail.
> 
> Not backed by pages as in "struct page", but those are still regular
> pages of the physical address space.

Well, maybe not.  Host gem object could live in device memory, and if we
map them into the guest ...

> That said, currently the sg_table interface is only able to describe
> physical memory using struct page pointers.  It's been a long standing
> limitation affecting even bare metal systems, so perhaps it's just the
> right time to make them possible to use some other identifiers, like
> PFNs?

I doubt you can handle pci memory bars like regular ram when it comes to
dma and iommu support.  There is a reason we have p2pdma in the first
place ...

cheers,
  Gerd

