Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37ACD13BE4F
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2020 12:23:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729010AbgAOLXU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jan 2020 06:23:20 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:46847 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726045AbgAOLXU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jan 2020 06:23:20 -0500
Received: by mail-lf1-f68.google.com with SMTP id f15so12393664lfl.13
        for <linux-media@vger.kernel.org>; Wed, 15 Jan 2020 03:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CAQZB6CCogimCuEdhKe+d6uz9DHg8JzbK/0iEvaEtt8=;
        b=RwJgRjG2ONv6W0Vh7ym+Up0ytgBuW8ykosk6g2ERitrwhvjmnvzvsjRRh6nohlo9qt
         dgB+fxVyR5SHQl9Y3+8WbxkRjMyZweST5rGKtFHIF03oQ+QdFXkRB8SFbj+W8E7PNgf6
         30asshwKTpGVcnNs7mVixshNLCxppTlEdZ98U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CAQZB6CCogimCuEdhKe+d6uz9DHg8JzbK/0iEvaEtt8=;
        b=kjFQJWXzEJDG4QntnFYVKjBHvlC7QHsAwnxJRM3fGpwTH9VprLE0go0uRDVwo4LbP9
         /56JCFNj93vJk+a0zJy77bNoWId1XwSV3pTHL5E7ohYdqBtuCw+ofnypkCgACsgBYMlE
         qbw8/rpL3DFhdmj1QrPEPD6KusQMIz3hhV88qkAyDfulMt18iWdMaF7lTR/FWUs9SKJQ
         WBzHCUos7c/w5gxXss+D7KCeo2Kf3oHXEGL8wxJ0oS2Hg7MiQ2/qGsUU53lxT/0sdyFQ
         VVRNi4TnR/KTjP5e2+wXssDomdgNK6ccehvWY5iMEulRA3+G1ntF3hlIrkrM01oGflXE
         Zyeg==
X-Gm-Message-State: APjAAAVU4d16U3LLMMQV7lSo7WGr78arKm90EF0LOZ7+c8m5xi49eoHe
        kdFO3rJZfIWhB+qvWT4ma9vbfpArF862D2nve5wmdxrTG5cRlw==
X-Google-Smtp-Source: APXvYqxtyjTFEJAEZt0k5ICWvgC3C/QWRTPqKW4IM+THV1XuV+JaZZG4r1enr3NqmHrCu1W4irmY/cAoAHQ7PSyDzbs=
X-Received: by 2002:ac2:5337:: with SMTP id f23mr4338748lfh.192.1579087397739;
 Wed, 15 Jan 2020 03:23:17 -0800 (PST)
MIME-Version: 1.0
References: <20191218130214.170703-1-keiichiw@chromium.org>
 <7740094.NyiUUSuA9g@os-lin-dmo> <20200113095636.blov62o4gbf27om5@sirius.home.kraxel.org>
 <12433898.dW097sEU6C@os-lin-dmo> <20200113110521.5ogc3fcy4zq32yzg@sirius.home.kraxel.org>
 <CAAFQd5D16G0E85BCZVx1LXd1TauQH8Lbgs5-0gLv7tNpm4sp_A@mail.gmail.com>
 <20200113132654.r4lhspfx2z7zse2v@sirius.home.kraxel.org> <CAAFQd5A3=4JC+3bRf2iw8RwsoB1jJz8p5afi6KaHO6ML2LC0Rg@mail.gmail.com>
In-Reply-To: <CAAFQd5A3=4JC+3bRf2iw8RwsoB1jJz8p5afi6KaHO6ML2LC0Rg@mail.gmail.com>
From:   Keiichi Watanabe <keiichiw@chromium.org>
Date:   Wed, 15 Jan 2020 20:23:06 +0900
Message-ID: <CAD90VcYnUin-4VXMeTi+4LvrBDRRZoLBT=Zf-0sZhPmLu8Bz=g@mail.gmail.com>
Subject: Re: [virtio-dev] Re: [PATCH v2 0/1] VirtIO video device specification
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Gerd Hoffmann <kraxel@redhat.com>,
        Dmitry Sepp <dmitry.sepp@opensynergy.com>,
        spice-devel@lists.freedesktop.org, virtio-dev@lists.oasis-open.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dylan Reid <dgreid@chromium.org>,
        Enrico Granata <egranata@google.com>,
        Frediano Ziglio <fziglio@redhat.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        David Stevens <stevensd@chromium.org>, uril@redhat.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Wed, Jan 15, 2020 at 8:00 PM Tomasz Figa <tfiga@chromium.org> wrote:
>
> On Mon, Jan 13, 2020 at 10:27 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
> >
> >   Hi,
> >
> > > > Well, no.  Tomasz Figa had splitted the devices into three groups:
> > > >
> > > >   (1) requires single buffer.
> > > >   (2) allows any layout (including the one (1) devices want).
> > > >   (3) requires per-plane buffers.
> > > >
> > > > Category (3) devices are apparently rare and old.  Both category (1)+(2)
> > > > devices can handle single buffers just fine.  So maybe support only
> > > > that?
> > >
> > > From the guest implementation point of view, Linux V4L2 currently
> > > supports 2 cases, if used in allocation-mode (i.e. the buffers are
> > > allocated locally by V4L2):
> > >
> > > i) single buffer with plane offsets predetermined by the format, (can
> > > be handled by devices from category 1) and 2))
> > > ii) per-plane buffers with planes at the beginning of their own
> > > buffers. (can be handled by devices from category 2) and 3))
> > >
> > > Support for ii) is required if one wants to be able to import buffers
> > > with arbitrary plane offsets, so I'd consider it unavoidable.
> >
> > If you have (1) hardware you simply can't import buffers with arbitrary
> > plane offsets, so I'd expect software would prefer the single buffer
> > layout (i) over (ii), even when using another driver + dmabuf
> > export/import, to be able to support as much hardware as possible.
> > So (ii) might end up being unused in practice.
> >
> > But maybe not, was just an idea, feel free to scratch it.
>
> That's true, simple user space would often do that. However, if more
> devices are in the game, often some extra alignment or padding between
> planes is needed and that is not allowed by (1), even though all the
> planes are in the same buffer.
>
> My suggestion, based on the latest V4L2 discussion on unifying the
> UAPI of i) and ii), is that we may want to instead always specify
> buffers on a per-plane basis. Any additional requirements would be
> then validated by the host, which could check if the planes end up in
> the same buffer (or different buffers for (3)) and/or at the right
> offsets.
>

It sounds reasonable. Even in the protocol design we discussed so far,
the driver sends an array of struct virtio_video_mem_entry in the
RESOURE_CREATE command:
struct virtio_video_mem_entry {
  le64 addr;
  le32 length;
  u8 padding[4];
};

struct virtio_video_resource_create {
  struct virtio_video_cmd_hdr hdr;
  le32 queue_type;
  le32 resource_id;
  le32 num_planes;
  le32 num_entries[VIRTIO_VIDEO_MAX_PLANES];
  u8 padding[4];
  /* Followed by struct virtio_video_mem_entry entries[] */
};

Does it match with your idea? We may need an |offset| in virtio_video_mem_entry?

Also, we should redesign "enum virtio_video_planes_layout" that we
originally discussed.
How about changing it like this?

enum virtio_video_planes_layout {
        VIRTIO_VIDEO_PLANES_LAYOUT_SINGLE_BUFFER = 1 << 0,
        VIRTIO_VIDEO_PLANES_LAYOUT_PER_PLANE = 1 << 1,
};

So, the device can combine flags to tell which (1), (2) or (3) it is.
Then, the device check if an incoming RESOURE_CREATE request violates
the requirement.
Does it make sense?

Best regards,
Keiichi

> WDYT?
>
> Best regards,
> Tomasz
