Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED3291F1BDE
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2020 17:17:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730224AbgFHPRn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Jun 2020 11:17:43 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:41649 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730187AbgFHPRl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Jun 2020 11:17:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591629459;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=hGKEH1dhLlDad944CTVO7vApiXCC7og9k/LEAwnlxtw=;
        b=D2ZA3ZYDPDAuE3NdntUBli62wGxCZE92KHwTiPAPPAL0FcC3QZ2n6/1VngOw0yu87n8N8d
        81+vCBJZcSv2n0yf7XuTC1NelSC3u7NzHDE2N/gxsvcYiE+o1dXTFrXKtscoFTSuFxa7YK
        Rmtiqr+tbOFjZiD/DT5okHgjwYUXh+c=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-K46ezx-RP7-REyUvxTLwhQ-1; Mon, 08 Jun 2020 11:17:23 -0400
X-MC-Unique: K46ezx-RP7-REyUvxTLwhQ-1
Received: by mail-wr1-f69.google.com with SMTP id s7so7308278wrm.16
        for <linux-media@vger.kernel.org>; Mon, 08 Jun 2020 08:17:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hGKEH1dhLlDad944CTVO7vApiXCC7og9k/LEAwnlxtw=;
        b=ZS32yxplRsYB1dttzZcurjOJQt3fLKKgI7Gv/emmmgwQqE+j/i1UbD56d4TiveoDGv
         0XahUaZ+KtNS37+PcyqgSQrGD1+en/hMnIWtKAzB2TdGu6wbOyrbHkCtkT7dwA3+z7C1
         OEXijf5TCDw9T00To/vUg1H0RfGObRNF16gKYj5Gdv/VqEmACGXqoFKmI5PzVkbF2t02
         SlbQ9n7gdukG9lDuya4xa6gih92bmxRNnF8N6R4UQjwWW0Z/RNPmHcApKj5gk2noE60l
         pXnhNSckiH5rMMA5VsfEPqGnpuSK1SyxDMyzGezInLA4gIsQMqWBMOZ/ibjOvB4NY5sm
         gm5g==
X-Gm-Message-State: AOAM5327Y8DHo/ZSYfUjFLtNtqztIYBZOaktn33+5PWzQqhZysEdq16U
        wZ0+I2mSP4zf0pukOrvi1jykqJmaBgasaEM8x2kAq5JyTtNHev/KECSTzqHnedGwHT3ZPR5Nywj
        ghIN8w7GkRFg1MO32qhUMxYs=
X-Received: by 2002:adf:fdcc:: with SMTP id i12mr25340205wrs.313.1591629442392;
        Mon, 08 Jun 2020 08:17:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXf+wDGo8rFUPMEZIpkA8dnO+aIv3ypXkkQNVdstQgDrqG+2iMjbON1WrY0DIT27qSEK9x+g==
X-Received: by 2002:adf:fdcc:: with SMTP id i12mr25340181wrs.313.1591629442198;
        Mon, 08 Jun 2020 08:17:22 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
        by smtp.gmail.com with ESMTPSA id h29sm24085wrc.78.2020.06.08.08.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 08:17:21 -0700 (PDT)
Date:   Mon, 8 Jun 2020 11:17:18 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     David Stevens <stevensd@chromium.org>
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
Subject: Re: [PATCH v3 4/4] drm/virtio: Support virtgpu exported resources
Message-ID: <20200608111647-mutt-send-email-mst@kernel.org>
References: <20200311112004.47138-1-stevensd@chromium.org>
 <20200311112004.47138-5-stevensd@chromium.org>
 <20200513123326-mutt-send-email-mst@kernel.org>
 <CAD=HUj5qcMLw__LfJizR6nzCR9Qmu21Sjk3i0j_8+=rxt1Hk=w@mail.gmail.com>
 <20200608054234-mutt-send-email-mst@kernel.org>
 <CAD=HUj6kF2JFyC9c0CY5_f-cv6r97501Z2f8D9x0VhQpRen+bw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=HUj6kF2JFyC9c0CY5_f-cv6r97501Z2f8D9x0VhQpRen+bw@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jun 08, 2020 at 07:36:55PM +0900, David Stevens wrote:
> On Mon, Jun 8, 2020 at 6:43 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Fri, May 15, 2020 at 04:26:15PM +0900, David Stevens wrote:
> > > > > +     if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_RESOURCE_UUID)) {
> > > > > +             vgdev->has_resource_assign_uuid = true;
> > > > > +     }
> > > >
> > > >
> > > > Just a question: this relies on DMA bufs so I assume it is
> > > > not really assumed to work when DMA API is bypassed, right?
> > > > Rather than worry what does it mean, how about just
> > > > disabling  this feature without PLATFORM_DMA for now?
> > >
> > > By PLATFORM_DMA, do you mean CONFIG_DMA_SHARED_BUFFER?
> >
> > Sorry, no. I mean VIRTIO_F_IOMMU_PLATFORM which in the
> > future will be renamed to VIRTIO_F_PLATFORM_ACCESS.
> 
> Shouldn't things work independent of whether or not that feature is
> set? If a virtio driver properly uses the dma_buf APIs (which virtgpu
> seems to), then that should take care of any mapping/synchronization
> related to VIRTIO_F_IOMMU_PLATFORM. If anything, the case where
> VIRTIO_F_IOMMU_PLATFORM isn't set is easier, since then we know that
> the "the device has same access [sic] to memory addresses supplied to
> it as the driver has", according to the specification.
> 
> -David

I don't know much about drm so I can't tell, I was hoping Gerd can
explain.

-- 
MST

