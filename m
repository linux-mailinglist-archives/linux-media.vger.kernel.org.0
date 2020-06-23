Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D58F2046BD
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2020 03:31:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731933AbgFWBbl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jun 2020 21:31:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731820AbgFWBbk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jun 2020 21:31:40 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D4CBC061573
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2020 18:31:39 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id 80so5610641qko.7
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2020 18:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eHCbxa4yLLq+0pOhVBKweZwAtR1jWaAM46jnceQkpwE=;
        b=lzk/L5n62mkf/Wo6a6zH8O6wr3Zw88adM8VMgiuL8jPiS//Hx1thymfjN6+oEGvYz3
         3bAJFxPc+ArHIAW7wLZuNUJaKeeSdo4HxIYoAC6F64avprFgnqqC7pbUc4IFCsjrKAHh
         gKgi9bb6RSIig4GQna3l0IIkjp+zf3Z+VI2pY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eHCbxa4yLLq+0pOhVBKweZwAtR1jWaAM46jnceQkpwE=;
        b=SMxaAesOJximGh27hbr0rhiLt9Wx/nJ6WE9bWhth7XKFK4CIlW79wDk9bw6M+2FoB1
         /tSlmecW1Kd/9EeSTKZHSp3ivfteFS7pfgXC1Hjyrtr0nNl0QGWLcsIeZcNFVMkIJr13
         4XRbDf2R6t1Zn1B1bSg1Ospuy6/5iNHJk9dCmLb/5KsbeqZmh5VzzIZ1WmW2ARsMlfXK
         cD/XTMBpXmz3yosEpp89YuXnP8JXeqN+T4447bK6fxjevjc80IShUA48L3dM7MTsFrhC
         k16zyF5YQjmvejvH51bkTHHg6sc9jMQBC3OlN2XOvI4WFaYk4NhJBsGIZ9gCo/vKfhq3
         Y/jw==
X-Gm-Message-State: AOAM533+sCLcpBNRpKiuIQm40bvupBfVoElxgZMZ+fWodaA2j3b3kEen
        NWwdSUmfEKX14N4yJq+W5NN3KzLZVKrVMkbZ8gOoUbCk
X-Google-Smtp-Source: ABdhPJwMJlxh1gtY97I2kVKm9OIAts8GWq+RuGfGOUmzRWY4SAjkUqzw8u1O4Yn7AgYcPbJZ0Vsm0B2frMtXAAEZyiE=
X-Received: by 2002:a05:620a:40c1:: with SMTP id g1mr12395512qko.391.1592875898709;
 Mon, 22 Jun 2020 18:31:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200609012518.198908-1-stevensd@chromium.org> <20200609055021-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200609055021-mutt-send-email-mst@kernel.org>
From:   David Stevens <stevensd@chromium.org>
Date:   Tue, 23 Jun 2020 10:31:28 +0900
Message-ID: <CAD=HUj7wJfoKj_K44Cs9eEmh=OQHZ1+qz7ZHxoscHjYgOMXvZQ@mail.gmail.com>
Subject: Re: [virtio-dev] Re: [PATCH v5 0/3] Support virtio cross-device resources
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Jason Wang <jasowang@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        open list <linux-kernel@vger.kernel.org>,
        ML dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:VIRTIO GPU DRIVER" 
        <virtualization@lists.linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, virtio-dev@lists.oasis-open.org,
        alex.williamson@redhat.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Unless there are any remaining objections to these patches, what are
the next steps towards getting these merged? Sorry, I'm not familiar
with the workflow for contributing patches to Linux.

Thanks,
David

On Tue, Jun 9, 2020 at 6:53 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, Jun 09, 2020 at 10:25:15AM +0900, David Stevens wrote:
> > This patchset implements the current proposal for virtio cross-device
> > resource sharing [1]. It will be used to import virtio resources into
> > the virtio-video driver currently under discussion [2]. The patch
> > under consideration to add support in the virtio-video driver is [3].
> > It uses the APIs from v3 of this series, but the changes to update it
> > are relatively minor.
> >
> > This patchset adds a new flavor of dma-bufs that supports querying the
> > underlying virtio object UUID, as well as adding support for exporting
> > resources from virtgpu.
>
> Gerd, David, if possible, please test this in configuration with
> virtual VTD enabled but with iommu_platform=off
> to make sure we didn't break this config.
>
>
> Besides that, for virtio parts:
>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>
>
> > [1] https://markmail.org/thread/2ypjt5cfeu3m6lxu
> > [2] https://markmail.org/thread/p5d3k566srtdtute
> > [3] https://markmail.org/thread/j4xlqaaim266qpks
> >
> > v4 -> v5 changes:
> >  - Remove virtio_dma_buf_export_info.
> >
> > David Stevens (3):
> >   virtio: add dma-buf support for exported objects
> >   virtio-gpu: add VIRTIO_GPU_F_RESOURCE_UUID feature
> >   drm/virtio: Support virtgpu exported resources
> >
> >  drivers/gpu/drm/virtio/virtgpu_drv.c   |  3 +
> >  drivers/gpu/drm/virtio/virtgpu_drv.h   | 20 ++++++
> >  drivers/gpu/drm/virtio/virtgpu_kms.c   |  4 ++
> >  drivers/gpu/drm/virtio/virtgpu_prime.c | 96 +++++++++++++++++++++++++-
> >  drivers/gpu/drm/virtio/virtgpu_vq.c    | 55 +++++++++++++++
> >  drivers/virtio/Makefile                |  2 +-
> >  drivers/virtio/virtio.c                |  6 ++
> >  drivers/virtio/virtio_dma_buf.c        | 82 ++++++++++++++++++++++
> >  include/linux/virtio.h                 |  1 +
> >  include/linux/virtio_dma_buf.h         | 37 ++++++++++
> >  include/uapi/linux/virtio_gpu.h        | 19 +++++
> >  11 files changed, 321 insertions(+), 4 deletions(-)
> >  create mode 100644 drivers/virtio/virtio_dma_buf.c
> >  create mode 100644 include/linux/virtio_dma_buf.h
> >
> > --
> > 2.27.0.278.ge193c7cf3a9-goog
>
>
> ---------------------------------------------------------------------
> To unsubscribe, e-mail: virtio-dev-unsubscribe@lists.oasis-open.org
> For additional commands, e-mail: virtio-dev-help@lists.oasis-open.org
>
