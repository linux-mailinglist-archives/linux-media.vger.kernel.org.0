Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DEF0F85A1
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2019 01:54:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726958AbfKLAyc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Nov 2019 19:54:32 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:40600 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726910AbfKLAyc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Nov 2019 19:54:32 -0500
Received: by mail-lj1-f196.google.com with SMTP id q2so15816350ljg.7
        for <linux-media@vger.kernel.org>; Mon, 11 Nov 2019 16:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GZou4lQN9AdmuzA4/W7pow7uT+4WHFOjtCVdWX0VDPo=;
        b=ejAHNRdXqEG280TqIhUoNOdKc94fDbil9FkD0sphy37JpdzdIoeeBuHU0jSE7oD8mb
         LpYjQ1/WLCEHEG/mcxT8mug01iZ6Gj6LkK7KhvWp/XrFL8URP5AdCSgMsQVeBjCU2kfu
         ut52kG9Zc8zYvcPqNEwrzSVVK6gkT1gf0UFrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GZou4lQN9AdmuzA4/W7pow7uT+4WHFOjtCVdWX0VDPo=;
        b=KRiqjGB+4MHsePjJIQ65BtYaKrnynuiHpGGceDGhr7IcdWJ8X4gHrP+EhNraz2vJVa
         N/JB5vk2ewmm0SrXjoFiVyHmNt7L9F5CSOikRvc6UHUAoOD8LgW/8YnUf+NSEW/q4WJb
         KQMn+ONvn1U/1We0rAjcuxA5dfLsjvTeMgYoxKjRDwpzshuCnwUSsKf4yUns8lD9ljHL
         K+X7o1G+Sy3VrGV23KqFiF0Vv+oL9OcFg+Lwu9YQ/NsWJRVvV07FgV4yW+fnQag//NJM
         vwTZx9n0H4Wcsf/07qKiLzBLNw3Jo1u3HuIixpckwoLblD2ppQXgJhyaoLhNVmnTBaL2
         MYWg==
X-Gm-Message-State: APjAAAXJLtQfsmXUzJAzf0yNoTD5IzMX/ACCZX/Oy0n3Syz/8BFPdOKI
        9qE26vb40CCOQmHY3OIYiAyBCRLzfos6ww==
X-Google-Smtp-Source: APXvYqwdNmz/ghWm0vxsc9fa32aFZ8jmkMDniw77Ha270YO2IgTri6s2wsnFbYTZAGMMsCOVybSxhQ==
X-Received: by 2002:a2e:9016:: with SMTP id h22mr17866026ljg.137.1573520068719;
        Mon, 11 Nov 2019 16:54:28 -0800 (PST)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id d5sm1834737lfl.2.2019.11.11.16.54.27
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2019 16:54:27 -0800 (PST)
Received: by mail-lj1-f178.google.com with SMTP id n21so15792601ljg.12
        for <linux-media@vger.kernel.org>; Mon, 11 Nov 2019 16:54:27 -0800 (PST)
X-Received: by 2002:a2e:b007:: with SMTP id y7mr17717532ljk.69.1573520066803;
 Mon, 11 Nov 2019 16:54:26 -0800 (PST)
MIME-Version: 1.0
References: <20191105105456.7xbhtistnbp272lj@sirius.home.kraxel.org>
 <20191106084344.GB189998@stefanha-x1.localdomain> <CAD=HUj41r8wHZ2-By8tLftkoqC5r_Bw=pr=zX2aZ7GTs1ESWhg@mail.gmail.com>
 <c8a6b6f35664ce036c2a48ec41eab97b0f40704d.camel@linux.intel.com>
In-Reply-To: <c8a6b6f35664ce036c2a48ec41eab97b0f40704d.camel@linux.intel.com>
From:   Gurchetan Singh <gurchetansingh@chromium.org>
Date:   Mon, 11 Nov 2019 16:54:14 -0800
X-Gmail-Original-Message-ID: <CAAfnVBkMWurTpseQFjcna5kk3__40n6M68=RTHLbQsu__2AFxg@mail.gmail.com>
Message-ID: <CAAfnVBkMWurTpseQFjcna5kk3__40n6M68=RTHLbQsu__2AFxg@mail.gmail.com>
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

On Tue, Nov 5, 2019 at 2:55 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
> Each buffer also has some properties to carry metadata, some fixed (id, size, application), but
> also allow free form (name = value, framebuffers would have
> width/height/stride/format for example).

Sounds a lot like the recently added DMA_BUF_SET_NAME ioctls:

https://patchwork.freedesktop.org/patch/310349/

For virtio-wayland + virtio-vdec, the problem is sharing -- not allocation.

As the buffer reaches a kernel boundary, it's properties devolve into
[fd, size].  Userspace can typically handle sharing metadata.  The
issue is the guest dma-buf fd doesn't mean anything on the host.

One scenario could be:

1) Guest userspace (say, gralloc) allocates using virtio-gpu.  When
allocating, we call uuidgen() and then pass that via RESOURCE_CREATE
hypercall to the host.
2) When exporting the dma-buf, we call DMA_BUF_SET_NAME (the buffer
name will be "virtgpu-buffer-${UUID}").
3) When importing, virtio-{vdec, video} reads the dma-buf name in
userspace, and calls fd to handle.  The name is sent to the host via a
hypercall, giving host virtio-{vdec, video} enough information to
identify the buffer.

This solution is entirely userspace -- we can probably come up with
something in kernel space [generate_random_uuid()] if need be.  We
only need two universal IDs: {device ID, buffer ID}.

> On Wed, Nov 6, 2019 at 2:28 PM Geoffrey McRae <geoff@hostfission.com> wrote:
> The entire point of this for our purposes is due to the fact that we can
> not allocate the buffer, it's either provided by the GPU driver or
> DirectX. If virtio-gpu were to allocate the buffer we might as well
> forget
> all this and continue using the ivshmem device.

We have a similar problem with closed source drivers.  As @lfy
mentioned, it's possible to map memory directory into virtio-gpu's PCI
bar and it's actually a planned feature.  Would that work for your use
case?
