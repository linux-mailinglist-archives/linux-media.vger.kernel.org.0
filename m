Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FC6DF9D86
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2019 23:56:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726959AbfKLW4K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Nov 2019 17:56:10 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:40817 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726912AbfKLW4K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Nov 2019 17:56:10 -0500
Received: by mail-lj1-f194.google.com with SMTP id q2so292514ljg.7
        for <linux-media@vger.kernel.org>; Tue, 12 Nov 2019 14:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NRg/lnQIqsyAlkrMrDDQKffDJgYxXaKEgCFpr2Rfv3M=;
        b=aL75rscQiiD8cD6SexzGZExzdpBOv6yvnXOJXgPhpIuMsXo6Hiu19CCN9vFSeTLN7a
         XOywR7beF3VKHxHITOF/gIWFo5Ca7IkfyHk9VLRXsTD43xuyrcvZlYAjfp5trGMbOvOR
         P6T8Uow7jlnoLSoTfkr7WcD7MgT6ln+ssAb3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NRg/lnQIqsyAlkrMrDDQKffDJgYxXaKEgCFpr2Rfv3M=;
        b=ug1nCrrJsmO8/ZcC1ZWqRpwtxbtK2B1hxCf5CEE31Qw8Az7slHG55FsdNa1OI5ZYq8
         Aip8/r4g/YorgPCvkHfHBDAP/TFKmscpkMVf3Bq3jnLM2GVGOFWmCpIIioU6d4M6a4ZW
         RBw5zdIoH4w4DA/RhucTGx0J19jDjkFhmA68gzXY/bqa9lYVWi6jLxaSqcE+gvBgCsHg
         hZRYjZSlAAF3yoYMBZgZRw2L2Sl54RdGlmpjvlJRMlriIi6N1AKBoypcqJjB+aopdb9o
         kNI2KebWHOFUJlLWjzed8FXABm8ej1qzzKNHPRLFab5tFVVqtBKSwKoQCTzKdAwCnsLW
         i0+w==
X-Gm-Message-State: APjAAAWQfYUrcWshAElRrocs8PRTmSj9Yh+Ik8oFTt9YzNKdz2mexsH1
        f5dBHMzUY6/E4ZW/Z/1iQ11mE3IHR6ts5A==
X-Google-Smtp-Source: APXvYqza3nNhKc8eRAyv2tyx0JqhzOczxSlkHx/686nDmGLv+z7lf4jHkFYdRPUWo88PMxRs+1gWwQ==
X-Received: by 2002:a2e:88c3:: with SMTP id a3mr160948ljk.92.1573599364377;
        Tue, 12 Nov 2019 14:56:04 -0800 (PST)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id d4sm84569lfi.32.2019.11.12.14.56.04
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Nov 2019 14:56:04 -0800 (PST)
Received: by mail-lj1-f169.google.com with SMTP id p18so298084ljc.6
        for <linux-media@vger.kernel.org>; Tue, 12 Nov 2019 14:56:04 -0800 (PST)
X-Received: by 2002:a05:651c:1136:: with SMTP id e22mr151566ljo.182.1573599361718;
 Tue, 12 Nov 2019 14:56:01 -0800 (PST)
MIME-Version: 1.0
References: <20191105105456.7xbhtistnbp272lj@sirius.home.kraxel.org>
 <20191106084344.GB189998@stefanha-x1.localdomain> <CAD=HUj41r8wHZ2-By8tLftkoqC5r_Bw=pr=zX2aZ7GTs1ESWhg@mail.gmail.com>
 <c8a6b6f35664ce036c2a48ec41eab97b0f40704d.camel@linux.intel.com>
 <CAAfnVBkMWurTpseQFjcna5kk3__40n6M68=RTHLbQsu__2AFxg@mail.gmail.com> <4a5dd822e86757f004d04af62fb7dd35ba75392d.camel@linux.intel.com>
In-Reply-To: <4a5dd822e86757f004d04af62fb7dd35ba75392d.camel@linux.intel.com>
From:   Gurchetan Singh <gurchetansingh@chromium.org>
Date:   Tue, 12 Nov 2019 14:55:49 -0800
X-Gmail-Original-Message-ID: <CAAfnVB=F+HeQrrn23c=rZeOa5BfHo=9ArcG--gLf87gqBXfZ9A@mail.gmail.com>
Message-ID: <CAAfnVB=F+HeQrrn23c=rZeOa5BfHo=9ArcG--gLf87gqBXfZ9A@mail.gmail.com>
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

On Tue, Nov 12, 2019 at 5:56 AM Liam Girdwood
<liam.r.girdwood@linux.intel.com> wrote:
>
> On Mon, 2019-11-11 at 16:54 -0800, Gurchetan Singh wrote:
> > On Tue, Nov 5, 2019 at 2:55 AM Gerd Hoffmann <kraxel@redhat.com>
> > wrote:
> > > Each buffer also has some properties to carry metadata, some fixed
> > > (id, size, application), but
> > > also allow free form (name = value, framebuffers would have
> > > width/height/stride/format for example).
> >
> > Sounds a lot like the recently added DMA_BUF_SET_NAME ioctls:
> >
> > https://patchwork.freedesktop.org/patch/310349/
> >
> > For virtio-wayland + virtio-vdec, the problem is sharing -- not
> > allocation.
> >
>
> Audio also needs to share buffers with firmware running on DSPs.
>
> > As the buffer reaches a kernel boundary, it's properties devolve into
> > [fd, size].  Userspace can typically handle sharing metadata.  The
> > issue is the guest dma-buf fd doesn't mean anything on the host.
> >
> > One scenario could be:
> >
> > 1) Guest userspace (say, gralloc) allocates using virtio-gpu.  When
> > allocating, we call uuidgen() and then pass that via RESOURCE_CREATE
> > hypercall to the host.
> > 2) When exporting the dma-buf, we call DMA_BUF_SET_NAME (the buffer
> > name will be "virtgpu-buffer-${UUID}").
> > 3) When importing, virtio-{vdec, video} reads the dma-buf name in
> > userspace, and calls fd to handle.  The name is sent to the host via
> > a
> > hypercall, giving host virtio-{vdec, video} enough information to
> > identify the buffer.
> >
> > This solution is entirely userspace -- we can probably come up with
> > something in kernel space [generate_random_uuid()] if need be.  We
> > only need two universal IDs: {device ID, buffer ID}.
> >
>
> I need something where I can take a guest buffer and then convert it to
> physical scatter gather page list. I can then either pass the SG page
> list to the DSP firmware (for DMAC IP programming) or have the host
> driver program the DMAC directly using the page list (who programs DMAC
> depends on DSP architecture).

So you need the HW address space from a guest allocation?  Would your
allocation hypercalls use something like the virtio_gpu_mem_entry
(virtio_gpu.h) and the draft virtio_video_mem_entry (draft)?

struct {
        __le64 addr;
        __le32 length;
        __le32 padding;
};

/* VIRTIO_GPU_CMD_RESOURCE_ATTACH_BACKING */
struct virtio_gpu_resource_attach_backing {
        struct virtio_gpu_ctrl_hdr hdr;
        __le32 resource_id;
        __le32 nr_entries;
      *struct struct virtio_gpu_mem_entry */
};

struct virtio_video_mem_entry {
    __le64 addr;
    __le32 length;
    __u8 padding[4];
};

struct virtio_video_resource_attach_backing {
    struct virtio_video_ctrl_hdr hdr;
    __le32 resource_id;
    __le32 nr_entries;
};

>
> DSP FW has no access to userspace so we would need some additional API
> on top of DMA_BUF_SET_NAME etc to get physical hardware pages ?

The dma-buf api currently can share guest memory sg-lists.

>
> Liam
>
>
>
> ---------------------------------------------------------------------
> To unsubscribe, e-mail: virtio-dev-unsubscribe@lists.oasis-open.org
> For additional commands, e-mail: virtio-dev-help@lists.oasis-open.org
>
