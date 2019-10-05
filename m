Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD5A1CC852
	for <lists+linux-media@lfdr.de>; Sat,  5 Oct 2019 08:08:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726840AbfJEGI3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 5 Oct 2019 02:08:29 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:33298 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726125AbfJEGI3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 5 Oct 2019 02:08:29 -0400
Received: by mail-ed1-f67.google.com with SMTP id c4so7934297edl.0
        for <linux-media@vger.kernel.org>; Fri, 04 Oct 2019 23:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MpjTGvzz1BwPgOLGtV5eXFWqs+NVgtRS8IFSI+3/lzE=;
        b=WrVicPb0wXUD7ws2yuUQnxUXc1rDJs/gOv3iMtwLb1awfuVd7yNXfBP5442xgLuHPM
         NgLXl8oQFcUZONOIoqaXRedu9G0suzNsRRKo4a6koYWvD32pOpRfsFMQDkquBZyK3fDa
         47+tEjWOPavTEHGPUtgX91vwWIrS6yXSVeM1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MpjTGvzz1BwPgOLGtV5eXFWqs+NVgtRS8IFSI+3/lzE=;
        b=iAsvZZo1w1sPvvgbj4LpsZnD7EOjijYMHlIRcbnXQoilXVeJntjZfatmt35zuXKy0A
         fx2v3huk5zXoOJpWMHefah2DL9nhvvJZ+inc3KGndiJKHGCRinUSQVprP/7hbiG42aw4
         /XZJJ+bNqkrKpgTeeUC8TnFb6rb7DapiRCTkwUNuGpFoKNIsQ2Y7sNBf35sOLtfGOe2C
         Jg9m4yuFAm9esahpXiyNT3XBr9WUbgWODjvT1FsqMkUxlyOjhhmYKEL6ceW0y0aNgVMu
         WyJ3M9G7jIhHPJL9K32ldUIa87sFNdN4IdkPD7PhvmhYji10Q+/cEFC72S9gvEz+1Df+
         wumg==
X-Gm-Message-State: APjAAAX9SNT/7R4QfvveIQDvQhiGFIaEpkgU4mfIvleiaHbYH6NlC0tf
        Ye0py2bSLA3B6VORszZwOWkWL1kHDDNjow==
X-Google-Smtp-Source: APXvYqxCKz7WPvq8JhrTP5KoH1PF7z96qbRKTx4+WGTOhIs7lKqWDgZg4ZWvF+sRXnvc1P6jKS63/A==
X-Received: by 2002:a50:c052:: with SMTP id u18mr19076796edd.88.1570255706592;
        Fri, 04 Oct 2019 23:08:26 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id f36sm1653302ede.28.2019.10.04.23.08.24
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Oct 2019 23:08:25 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id b9so9490052wrs.0
        for <linux-media@vger.kernel.org>; Fri, 04 Oct 2019 23:08:24 -0700 (PDT)
X-Received: by 2002:a5d:4751:: with SMTP id o17mr14250871wrs.113.1570255704189;
 Fri, 04 Oct 2019 23:08:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190919093404.182015-1-keiichiw@chromium.org> <20190923085637.bsaevedklweijgya@sirius.home.kraxel.org>
In-Reply-To: <20190923085637.bsaevedklweijgya@sirius.home.kraxel.org>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Sat, 5 Oct 2019 15:08:12 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Ba-REZU9=rdm3J6NRqqeAUFdCV7SJ_WdO2BHyKNBN7TQ@mail.gmail.com>
Message-ID: <CAAFQd5Ba-REZU9=rdm3J6NRqqeAUFdCV7SJ_WdO2BHyKNBN7TQ@mail.gmail.com>
Subject: Re: [virtio-dev] [PATCH] [RFC RESEND] vdec: Add virtio video decode
 device specification
To:     Gerd Hoffmann <kraxel@redhat.com>
Cc:     Keiichi Watanabe <keiichiw@chromium.org>,
        virtio-dev@lists.oasis-open.org,
        Alexandre Courbot <acourbot@chromium.org>,
        alexlau@chromium.org, dgreid@chromium.org,
        =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>, stevensd@chromium.org,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Gerd,

On Mon, Sep 23, 2019 at 5:56 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > Our prototype implementation uses [4], which allows the virtio-vdec
> > device to use buffers allocated by virtio-gpu device.
>
> > [4] https://lkml.org/lkml/2019/9/12/157

First of all, thanks for taking a look at this RFC and for valuable
feedback. Sorry for the late reply.

For reference, Keiichi is working with me and David Stevens on
accelerated video support for virtual machines and integration with
other virtual devices, like virtio-gpu for rendering or our
currently-downstream virtio-wayland for display (I believe there is
ongoing work to solve this problem in upstream too).

>
> Well.  I think before even discussing the protocol details we need a
> reasonable plan for buffer handling.  I think using virtio-gpu buffers
> should be an optional optimization and not a requirement.  Also the
> motivation for that should be clear (Let the host decoder write directly
> to virtio-gpu resources, to display video without copying around the
> decoded framebuffers from one device to another).

Just to make sure we're on the same page, what would the buffers come
from if we don't use this optimization?

I can imagine a setup like this;
 1) host device allocates host memory appropriate for usage with host
video decoder,
 2) guest driver allocates arbitrary guest pages for storage
accessible to the guest software,
 3) guest userspace writes input for the decoder to guest pages,
 4) guest driver passes the list of pages for the input and output
buffers to the host device
 5) host device copies data from input guest pages to host buffer
 6) host device runs the decoding
 7) host device copies decoded frame to output guest pages
 8) guest userspace can access decoded frame from those pages; back to 3

Is that something you have in mind?

>
> Referencing virtio-gpu buffers needs a better plan than just re-using
> virtio-gpu resource handles.  The handles are device-specific.  What if
> there are multiple virtio-gpu devices present in the guest?
>
> I think we need a framework for cross-device buffer sharing.  One
> possible option would be to have some kind of buffer registry, where
> buffers can be registered for cross-device sharing and get a unique
> id (a uuid maybe?).  Drivers would typically register buffers on
> dma-buf export.

This approach could possibly let us handle this transparently to
importers, which would work for guest kernel subsystems that rely on
the ability to handle buffers like native memory (e.g. having a
sgtable or DMA address) for them.

How about allocating guest physical addresses for memory corresponding
to those buffers? On the virtio-gpu example, that could work like
this:
 - by default a virtio-gpu buffer has only a resource handle,
 - VIRTIO_GPU_RESOURCE_EXPORT command could be called to have the
virtio-gpu device export the buffer to a host framework (inside the
VMM) that would allocate guest page addresses for it, which the
command would return in a response to the guest,
 - virtio-gpu driver could then create a regular DMA-buf object for
such memory, because it's just backed by pages (even though they may
not be accessible to the guest; just like in the case of TrustZone
memory protection on bare metal systems),
 - any consumer would be able to handle such buffer like a regular
guest memory, passing low-level scatter-gather tables to the host as
buffer descriptors - this would nicely integrate with the basic case
without buffer sharing, as described above.

Another interesting side effect of the above approach would be the
ease of integration with virtio-iommu. If the virtio master device is
put behind a virtio-iommu, the guest page addresses become the input
to iommu page tables and IOVA addresses go to the host via the virtio
master device protocol, inside the low-level scatter-gather tables.

What do you think?

Best regards,
Tomasz

>
> Another option would be to pass around both buffer handle and buffer
> owner, i.e. instead of "u32 handle" have something like this:
>
> struct buffer_reference {
>         enum device_type; /* pci, virtio-mmio, ... */
>         union device_address {
>                 struct pci_address pci_addr;
>                 u64 virtio_mmio_addr;
>                 [ ... ]
>         };
>         u64 device_buffer_handle; /* device-specific, virtio-gpu could use resource ids here */
> };
>
> cheers,
>   Gerd
>
