Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1162F1127
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2019 09:36:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729951AbfKFIgg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Nov 2019 03:36:36 -0500
Received: from mail-qt1-f174.google.com ([209.85.160.174]:45994 "EHLO
        mail-qt1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729818AbfKFIgg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Nov 2019 03:36:36 -0500
Received: by mail-qt1-f174.google.com with SMTP id x21so32819948qto.12
        for <linux-media@vger.kernel.org>; Wed, 06 Nov 2019 00:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D288lyijPXwamjKxXMPNTuJhKFkBSR4imFrkU4/G3RA=;
        b=JZ18dPikwE7MF0VWSE2olCmAPIHJ16CZwNMa0ZG5+0DiJtIhVWhjSM5hcYipBDGzKC
         byL6wCyjc6yqct77kf/SuryK2kUiERMZwmLCuytfgVgAfKtP13JckHxdWhv8VG0t+J44
         yk1TGtJCNBu2PUMWNKRdhuzC0ojmSKBcLO8Cc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D288lyijPXwamjKxXMPNTuJhKFkBSR4imFrkU4/G3RA=;
        b=fzOgiNfhPY9dkvqgGuWOsyUoY4B5gnUF8uaNOgJpr6AUlo8Iyv4rZg/X+CZvF3wNmP
         2PYfua0JCf+y8erb79V4AI40Pa917iE54DMUhGZrNE8CHWf6BkMKRU4fAR0I+uEa2r2b
         2wkapmqkPNnJSJoOD0upKbJvt1yS3soyFEi6kDEpQgWXIv9LJjgRKi5fJpIaQF8bxKlh
         I/ejehc7yBfEKPLJVo9I9HfyaFU/EgDhtLfr2maVaQo8pUAFg11jJO6i0konOJyM2PtT
         AJaJlsr/Y5aKgdwvYovAAMV5YBNBiFLh0GLXhtA2MBkCPs917prrdRcQWNNzU/kok99t
         sjBg==
X-Gm-Message-State: APjAAAV5E5A9GY+IyPQwaCjjhTzP/MOh4xd1n4YoLD/0iWZRN5qcLMGz
        c2h1jKvKSUjq1KH6msbgXyumexC9f455ONalkPML7A==
X-Google-Smtp-Source: APXvYqzr/oTuJVWFtg55xeb32V3dy0sTrZaPlfsggUy15MdQTndaWW0MlrbdefS0roopbd9zUwA2Ih85DU0W+kBq2Fo=
X-Received: by 2002:aed:3f57:: with SMTP id q23mr1338619qtf.116.1573029393500;
 Wed, 06 Nov 2019 00:36:33 -0800 (PST)
MIME-Version: 1.0
References: <20191105105456.7xbhtistnbp272lj@sirius.home.kraxel.org>
In-Reply-To: <20191105105456.7xbhtistnbp272lj@sirius.home.kraxel.org>
From:   David Stevens <stevensd@chromium.org>
Date:   Wed, 6 Nov 2019 17:36:22 +0900
Message-ID: <CAD=HUj7EsxrkSubmY6HE4aYJOykVKtmGXjMjeGqnoJw1KZUc5Q@mail.gmail.com>
Subject: Re: guest / host buffer sharing ...
To:     Gerd Hoffmann <kraxel@redhat.com>
Cc:     Keiichi Watanabe <keiichiw@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Dmitry Morozov <dmitry.morozov@opensynergy.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        Dylan Reid <dgreid@chromium.org>,
        =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Daniel Vetter <daniel@ffwll.ch>, geoff@hostfission.com,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        virtio-dev@lists.oasis-open.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> (1) The virtio device
> =====================
>
> Has a single virtio queue, so the guest can send commands to register
> and unregister buffers.  Buffers are allocated in guest ram.  Each buffer
> has a list of memory ranges for the data. Each buffer also has some

Allocating from guest ram would work most of the time, but I think
it's insufficient for many use cases. It doesn't really support things
such as contiguous allocations, allocations from carveouts or <4GB,
protected buffers, etc.

> properties to carry metadata, some fixed (id, size, application), but

What exactly do you mean by application?

> also allow free form (name = value, framebuffers would have
> width/height/stride/format for example).

Is this approach expected to handle allocating buffers with
hardware-specific constraints such as stride/height alignment or
tiling? Or would there need to be some alternative channel for
determining those values and then calculating the appropriate buffer
size?

-David

On Tue, Nov 5, 2019 at 7:55 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi folks,
>
> The issue of sharing buffers between guests and hosts keeps poping
> up again and again in different contexts.  Most recently here:
>
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg656685.html
>
> So, I'm grabbing the recipient list of the virtio-vdec thread and some
> more people I know might be interested in this, hoping to have everyone
> included.
>
> Reason is:  Meanwhile I'm wondering whenever "just use virtio-gpu
> resources" is really a good answer for all the different use cases
> we have collected over time.  Maybe it is better to have a dedicated
> buffer sharing virtio device?  Here is the rough idea:
>
>
> (1) The virtio device
> =====================
>
> Has a single virtio queue, so the guest can send commands to register
> and unregister buffers.  Buffers are allocated in guest ram.  Each buffer
> has a list of memory ranges for the data.  Each buffer also has some
> properties to carry metadata, some fixed (id, size, application), but
> also allow free form (name = value, framebuffers would have
> width/height/stride/format for example).
>
>
> (2) The linux guest implementation
> ==================================
>
> I guess I'd try to make it a drm driver, so we can re-use drm
> infrastructure (shmem helpers for example).  Buffers are dumb drm
> buffers.  dma-buf import and export is supported (shmem helpers
> get us that for free).  Some device-specific ioctls to get/set
> properties and to register/unregister the buffers on the host.
>
>
> (3) The qemu host implementation
> ================================
>
> qemu (likewise other vmms) can use the udmabuf driver to create
> host-side dma-bufs for the buffers.  The dma-bufs can be passed to
> anyone interested, inside and outside qemu.  We'll need some protocol
> for communication between qemu and external users interested in those
> buffers, to receive dma-bufs (via unix file descriptor passing) and
> update notifications.  Dispatching updates could be done based on the
> application property, which could be "virtio-vdec" or "wayland-proxy"
> for example.
>
>
> commments?
>
> cheers,
>   Gerd
>
