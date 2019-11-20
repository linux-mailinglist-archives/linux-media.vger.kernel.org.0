Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E2DD1030D8
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2019 01:43:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727405AbfKTAnK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Nov 2019 19:43:10 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:45529 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727222AbfKTAnK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Nov 2019 19:43:10 -0500
Received: by mail-lf1-f68.google.com with SMTP id 203so2790543lfa.12
        for <linux-media@vger.kernel.org>; Tue, 19 Nov 2019 16:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SuCiKSsIRDKTbEIrlKuHNFUxZMf3N0BWgvOBBoTFOxg=;
        b=aatNqWaL0QyzhfFvsyJVZNwE0B3j5uWP4gtCcj8hIO+DL3zX4s+xOfl1Pb2PHnepNb
         YAAhjnh9lsk5gVv4jY4LAKfHk5UEtn+Aqq76ly7inUWooSmlMUp4o+Ozp+DPyrFCXoad
         R2JSfxtSpuaY4HTG9QFIXSei5hjZJA573tT6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SuCiKSsIRDKTbEIrlKuHNFUxZMf3N0BWgvOBBoTFOxg=;
        b=E29BN+jKUAJDOWA0k0t0wiVBrII0ci1FAJk12AifW26kX9lOhkR6AZeO0xo59zkPa4
         ZRlGpHvqVQVj54p5KUDsuLN5kf29Ez7zvX7oK9QE6qTS321K53Dv8BMkUSLE462fK1/n
         P5dpuEikKyKGYpEy/oYiVhcoTBwBrI8vb42O2mrEP3DzOC6aMoT/CkoNQ7a45ANhKdVt
         ttVnvXbsvFaLu9v5ItAUpxuazdEmnUTMIQ4w81FCoxe3G7DLD0IKA0lP/6tLl6d5BHlZ
         481PKYjfYT+P0WMXG/RPsanxJ8PUF1/05O1/xMzILobja/sFEprUQUsmXQ0GwrxdBcf2
         z9zQ==
X-Gm-Message-State: APjAAAWYyc9GOzodcD9eG4eWOwhBpBoHNvpAtJg4Ec+FpKPiycaRjTfa
        rWGKPviMN9OcSBgZYLOcJ7ssns6jKpkkNg==
X-Google-Smtp-Source: APXvYqxwjFVb9TJ1oMcCifUNYi0KrbeEX9P6Z8nQJXfKiRsZiqZPL4P+NKm6XGw8XK2+xkJlg+ZcBw==
X-Received: by 2002:a19:911c:: with SMTP id t28mr332354lfd.84.1574210585185;
        Tue, 19 Nov 2019 16:43:05 -0800 (PST)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id h16sm10934747ljb.10.2019.11.19.16.43.02
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Nov 2019 16:43:04 -0800 (PST)
Received: by mail-lj1-f171.google.com with SMTP id 139so25499146ljf.1
        for <linux-media@vger.kernel.org>; Tue, 19 Nov 2019 16:43:02 -0800 (PST)
X-Received: by 2002:a2e:2e03:: with SMTP id u3mr209839lju.115.1574210581666;
 Tue, 19 Nov 2019 16:43:01 -0800 (PST)
MIME-Version: 1.0
References: <20191105105456.7xbhtistnbp272lj@sirius.home.kraxel.org>
 <20191106084344.GB189998@stefanha-x1.localdomain> <CAD=HUj41r8wHZ2-By8tLftkoqC5r_Bw=pr=zX2aZ7GTs1ESWhg@mail.gmail.com>
 <c8a6b6f35664ce036c2a48ec41eab97b0f40704d.camel@linux.intel.com>
 <CAAfnVBkMWurTpseQFjcna5kk3__40n6M68=RTHLbQsu__2AFxg@mail.gmail.com>
 <4a5dd822e86757f004d04af62fb7dd35ba75392d.camel@linux.intel.com>
 <CAAfnVB=F+HeQrrn23c=rZeOa5BfHo=9ArcG--gLf87gqBXfZ9A@mail.gmail.com> <bee3aae13f6cf69ee909aa9884926853d6123b25.camel@linux.intel.com>
In-Reply-To: <bee3aae13f6cf69ee909aa9884926853d6123b25.camel@linux.intel.com>
From:   Gurchetan Singh <gurchetansingh@chromium.org>
Date:   Tue, 19 Nov 2019 16:42:49 -0800
X-Gmail-Original-Message-ID: <CAAfnVBmcBWWpvTAijg8AY-6RoKGJ84AS_qo2WqF6sgLHVsHJsw@mail.gmail.com>
Message-ID: <CAAfnVBmcBWWpvTAijg8AY-6RoKGJ84AS_qo2WqF6sgLHVsHJsw@mail.gmail.com>
Subject: Re: [virtio-dev] Re: guest / host buffer sharing ...
To:     Liam Girdwood <liam.r.girdwood@linux.intel.com>
Cc:     David Stevens <stevensd@chromium.org>,
        Stefan Hajnoczi <stefanha@gmail.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        geoff@hostfission.com, virtio-dev@lists.oasis-open.org,
        Alex Lau <alexlau@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        qemu-devel@nongnu.org, Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Daniel Vetter <daniel@ffwll.ch>,
        =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
        Dylan Reid <dgreid@chromium.org>,
        Dmitry Morozov <dmitry.morozov@opensynergy.com>,
        Pawel Osciak <posciak@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 19, 2019 at 7:31 AM Liam Girdwood
<liam.r.girdwood@linux.intel.com> wrote:
>
> On Tue, 2019-11-12 at 14:55 -0800, Gurchetan Singh wrote:
> > On Tue, Nov 12, 2019 at 5:56 AM Liam Girdwood
> > <liam.r.girdwood@linux.intel.com> wrote:
> > >
> > > On Mon, 2019-11-11 at 16:54 -0800, Gurchetan Singh wrote:
> > > > On Tue, Nov 5, 2019 at 2:55 AM Gerd Hoffmann <kraxel@redhat.com>
> > > > wrote:
> > > > > Each buffer also has some properties to carry metadata, some
> > > > > fixed
> > > > > (id, size, application), but
> > > > > also allow free form (name = value, framebuffers would have
> > > > > width/height/stride/format for example).
> > > >
> > > > Sounds a lot like the recently added DMA_BUF_SET_NAME ioctls:
> > > >
> > > > https://patchwork.freedesktop.org/patch/310349/
> > > >
> > > > For virtio-wayland + virtio-vdec, the problem is sharing -- not
> > > > allocation.
> > > >
> > >
> > > Audio also needs to share buffers with firmware running on DSPs.
> > >
> > > > As the buffer reaches a kernel boundary, it's properties devolve
> > > > into
> > > > [fd, size].  Userspace can typically handle sharing
> > > > metadata.  The
> > > > issue is the guest dma-buf fd doesn't mean anything on the host.
> > > >
> > > > One scenario could be:
> > > >
> > > > 1) Guest userspace (say, gralloc) allocates using virtio-
> > > > gpu.  When
> > > > allocating, we call uuidgen() and then pass that via
> > > > RESOURCE_CREATE
> > > > hypercall to the host.
> > > > 2) When exporting the dma-buf, we call DMA_BUF_SET_NAME (the
> > > > buffer
> > > > name will be "virtgpu-buffer-${UUID}").
> > > > 3) When importing, virtio-{vdec, video} reads the dma-buf name in
> > > > userspace, and calls fd to handle.  The name is sent to the host
> > > > via
> > > > a
> > > > hypercall, giving host virtio-{vdec, video} enough information to
> > > > identify the buffer.
> > > >
> > > > This solution is entirely userspace -- we can probably come up
> > > > with
> > > > something in kernel space [generate_random_uuid()] if need
> > > > be.  We
> > > > only need two universal IDs: {device ID, buffer ID}.
> > > >
> > >
> > > I need something where I can take a guest buffer and then convert
> > > it to
> > > physical scatter gather page list. I can then either pass the SG
> > > page
> > > list to the DSP firmware (for DMAC IP programming) or have the host
> > > driver program the DMAC directly using the page list (who programs
> > > DMAC
> > > depends on DSP architecture).
> >
> > So you need the HW address space from a guest allocation?
>
> Yes.
>
> >  Would your
> > allocation hypercalls use something like the virtio_gpu_mem_entry
> > (virtio_gpu.h) and the draft virtio_video_mem_entry (draft)?
>
> IIUC, this looks like generic SG buffer allocation ?
>
> >
> > struct {
> >         __le64 addr;
> >         __le32 length;
> >         __le32 padding;
> > };
> >
> > /* VIRTIO_GPU_CMD_RESOURCE_ATTACH_BACKING */
> > struct virtio_gpu_resource_attach_backing {
> >         struct virtio_gpu_ctrl_hdr hdr;
> >         __le32 resource_id;
> >         __le32 nr_entries;
> >       *struct struct virtio_gpu_mem_entry */
> > };
> >
> > struct virtio_video_mem_entry {
> >     __le64 addr;
> >     __le32 length;
> >     __u8 padding[4];
> > };
> >
> > struct virtio_video_resource_attach_backing {
> >     struct virtio_video_ctrl_hdr hdr;
> >     __le32 resource_id;
> >     __le32 nr_entries;
> > };
> >
> > >
> > > DSP FW has no access to userspace so we would need some additional
> > > API
> > > on top of DMA_BUF_SET_NAME etc to get physical hardware pages ?
> >
> > The dma-buf api currently can share guest memory sg-lists.
>
> Ok, IIUC buffers can either be shared using the GPU proposed APIs
> (above) or using the dma-buf API to share via userspace ?

If we restrict ourselves to guest-sg lists only, then the current
dma-buf API is sufficient to share buffers.  From example, virtio-gpu
can allocate with the following hypercall (as it does now):

struct virtio_gpu_resource_attach_backing {
         struct virtio_gpu_ctrl_hdr hdr;
         __le32 resource_id;
         __le32 nr_entries;
       *struct struct virtio_gpu_mem_entry */
};

Then in the guest kernel, virtio-{video, snd} can get the sg-list via
dma_buf_map_attachment, and then have a hypercall of it's own:

struct virtio_video_resource_import {
         struct virtio_video_ctrl_hdr hdr;
         __le32 video_resource_id;
         __le32 nr_entries;
       *struct struct virtio_gpu_mem_entry */
};

Then it can create dmabuf on the host or get the HW address from the SG list.

The complications come in from sharing host allocated buffers ... for
that we may need a method to translate from guest fds to universal
"virtualized" resource IDs.  I've heard talk about the need to
translate from guest fence fds to host fence fds as well.

> My preference
> would be to use teh more direct GPU APIs sending physical page
> addresses from Guest to device driver. I guess this is your use case
> too ?

For my use case, guest memory is sufficient, especially given the
direction towards modifiers + system memory.  For closed source
drivers, we may need to directly map host buffers.  However, that use
case is restricted to virtio-gpu and won't work with other virtio
devices.


>
> Thanks
>
> Liam
>
> >
> > >
> > > Liam
> > >
> > >
> > >
> > > -----------------------------------------------------------------
> > > ----
> > > To unsubscribe, e-mail: virtio-dev-unsubscribe@lists.oasis-open.org
> > > For additional commands, e-mail:
> > > virtio-dev-help@lists.oasis-open.org
> > >
> >
> > ---------------------------------------------------------------------
> > To unsubscribe, e-mail: virtio-dev-unsubscribe@lists.oasis-open.org
> > For additional commands, e-mail: virtio-dev-help@lists.oasis-open.org
> >
>
>
> ---------------------------------------------------------------------
> To unsubscribe, e-mail: virtio-dev-unsubscribe@lists.oasis-open.org
> For additional commands, e-mail: virtio-dev-help@lists.oasis-open.org
>
