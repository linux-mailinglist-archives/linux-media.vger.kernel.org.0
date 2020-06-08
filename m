Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1562C1F16CC
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2020 12:37:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729316AbgFHKhJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Jun 2020 06:37:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729263AbgFHKhH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Jun 2020 06:37:07 -0400
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com [IPv6:2607:f8b0:4864:20::f43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88661C08C5C3
        for <linux-media@vger.kernel.org>; Mon,  8 Jun 2020 03:37:07 -0700 (PDT)
Received: by mail-qv1-xf43.google.com with SMTP id x16so2351344qvr.3
        for <linux-media@vger.kernel.org>; Mon, 08 Jun 2020 03:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=37datdXl0TF4cHt39unBvjQQpavQ7FoeHgZeTkd6cVo=;
        b=jWuBi3gBOqpp71BpWC1WbZEGMxzH3MTotBqy+CTTW/ii1+t6JbNX14i+Didnl9fYdQ
         Lx0RoE/Q0B9pQPdESBuGWf8PRHudkFPbAcjQedMq516IZ67SaJAww/fKkHBB/Kvfcjck
         9dJZvpSfyrEnPN5YuRX7giecTXFlZnZXkJ1vY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=37datdXl0TF4cHt39unBvjQQpavQ7FoeHgZeTkd6cVo=;
        b=HSJu8d85LGjoM1BlCpXorX2swsFzcNWRwJxBeMGL6/o++2/AMPZBRDoAruonPhY8VT
         msKRF+S4en3jTdULjAf1Wc6mHUsSBKjNpt9mAkXdJrmIt1gJ1uNa0QMfvIHaSs6ryPsz
         8CdpZemqgul7W+NuPz7C126ykCwwAP5FuSl5g+AOvZYcvP3mbWTrE9s62guLo7d0Wmjv
         CzszF48KWfnKt2VzpOnVPr/GdNTOadQd8gxNI3JELWc7+JTXGXQdOgTiw9VBq3QQJQ5U
         mNGJoDwg1QsRKO6Pby4otUjxbwrKyEMu2u3RQSe7Fkc8tK8V80azpvgNOn+H1OPus6pY
         AKhw==
X-Gm-Message-State: AOAM530GdWUJC51gSnU/4Q2A67UFW+BgRGcWEQcInXM5IgZg15AE3ayV
        yZuPn1E4B1qr6wPxCIwGcgj5B59NVHScSZI5nzquyQ==
X-Google-Smtp-Source: ABdhPJx0Js9UlOjOlvsu2+uMuuX1LzgiViihJEZNtsxnEp5BP9jZ39vgEHbdMa7JtxuwcBbI76XV/X/JfEUXZ0ddD1Q=
X-Received: by 2002:a0c:aed6:: with SMTP id n22mr1149105qvd.70.1591612626754;
 Mon, 08 Jun 2020 03:37:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200311112004.47138-1-stevensd@chromium.org> <20200311112004.47138-5-stevensd@chromium.org>
 <20200513123326-mutt-send-email-mst@kernel.org> <CAD=HUj5qcMLw__LfJizR6nzCR9Qmu21Sjk3i0j_8+=rxt1Hk=w@mail.gmail.com>
 <20200608054234-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200608054234-mutt-send-email-mst@kernel.org>
From:   David Stevens <stevensd@chromium.org>
Date:   Mon, 8 Jun 2020 19:36:55 +0900
Message-ID: <CAD=HUj6kF2JFyC9c0CY5_f-cv6r97501Z2f8D9x0VhQpRen+bw@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] drm/virtio: Support virtgpu exported resources
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jason Wang <jasowang@redhat.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        open list <linux-kernel@vger.kernel.org>,
        ML dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:VIRTIO GPU DRIVER" 
        <virtualization@lists.linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, virtio-dev@lists.oasis-open.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jun 8, 2020 at 6:43 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Fri, May 15, 2020 at 04:26:15PM +0900, David Stevens wrote:
> > > > +     if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_RESOURCE_UUID)) {
> > > > +             vgdev->has_resource_assign_uuid = true;
> > > > +     }
> > >
> > >
> > > Just a question: this relies on DMA bufs so I assume it is
> > > not really assumed to work when DMA API is bypassed, right?
> > > Rather than worry what does it mean, how about just
> > > disabling  this feature without PLATFORM_DMA for now?
> >
> > By PLATFORM_DMA, do you mean CONFIG_DMA_SHARED_BUFFER?
>
> Sorry, no. I mean VIRTIO_F_IOMMU_PLATFORM which in the
> future will be renamed to VIRTIO_F_PLATFORM_ACCESS.

Shouldn't things work independent of whether or not that feature is
set? If a virtio driver properly uses the dma_buf APIs (which virtgpu
seems to), then that should take care of any mapping/synchronization
related to VIRTIO_F_IOMMU_PLATFORM. If anything, the case where
VIRTIO_F_IOMMU_PLATFORM isn't set is easier, since then we know that
the "the device has same access [sic] to memory addresses supplied to
it as the driver has", according to the specification.

-David
