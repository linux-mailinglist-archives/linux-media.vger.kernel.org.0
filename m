Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD8371F374F
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2020 11:53:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728564AbgFIJxL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Jun 2020 05:53:11 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:48510 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728198AbgFIJxJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Jun 2020 05:53:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591696388;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=oMvGLtRSljs2Zi0kyxH/VTEK52jN8HKOE/cbjLGX1jw=;
        b=NfxwTDtr2hYwtsM4JGksjbMs9ieba7Mpydv1/npkOfbiz8RprilQ/YOlPPk91+J00ESSo/
        NcTcFtCgXgeIz0k3XUxViuNgpZMQCglXW0wzUGlo8LKaV/5nWTidmUEP9y7ue6/++mtGTu
        2BJ3W/QvoWaIvvtOHJag1ghV9MchFRw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-mj8P1YhYMJuBCEnvTi8-RA-1; Tue, 09 Jun 2020 05:53:03 -0400
X-MC-Unique: mj8P1YhYMJuBCEnvTi8-RA-1
Received: by mail-wr1-f69.google.com with SMTP id l18so8445852wrm.0
        for <linux-media@vger.kernel.org>; Tue, 09 Jun 2020 02:53:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oMvGLtRSljs2Zi0kyxH/VTEK52jN8HKOE/cbjLGX1jw=;
        b=blLWKD/Ht4FcF759WU5pFjM19Kb1IJhAJkJIIfg+1piESQAcA+NQnOBC9Rmhszl2DQ
         ABiovtA3rXrjqavuRtb09dMq1MNkMSdm5aQHIRSVgFhj4RN5TqEPssNNgE5LxYiJWsiw
         vnLnaSohkLJQsutpUOtBtf3fqCm6zlS1uyBcHnz9wsrY8CDj4XZtF7dMwjFQJF2JI+cS
         l7/34aDodSI07oZrbi3ZM/pJxgIH/ZpGwDEstXryV1A1ccmsGTuvkiYLqWmMth3IhBP4
         8FwDOrWpLjK1lhTPIZAVu25d/K/1/dHTxY8aliKrkZUGT9t4SKTZSTxZnHEyvoNqZjHg
         3bfQ==
X-Gm-Message-State: AOAM531ic28QSV7ZTlAPHstrLKuTqVgspc/GwN5Q9ScB4lV0gFBz+Ozf
        VWIVbulmSYh/TbnLJCwNvttADcVSQMZ3DeQWBn9fnuu8sdhz1uyFXeXNQcGcevfXqiMdSyEmuJs
        GpcIRvga5pw1WQErd96vsvwA=
X-Received: by 2002:a5d:6b8c:: with SMTP id n12mr3491107wrx.61.1591696382278;
        Tue, 09 Jun 2020 02:53:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTG/Rft+RF7BlhKs9JeSNR5jpou7mamttZASGBrZIBust8+KQxMGXJalHNlqYd1izJlcOHBg==
X-Received: by 2002:a5d:6b8c:: with SMTP id n12mr3491075wrx.61.1591696382101;
        Tue, 09 Jun 2020 02:53:02 -0700 (PDT)
Received: from redhat.com (bzq-79-181-55-232.red.bezeqint.net. [79.181.55.232])
        by smtp.gmail.com with ESMTPSA id 67sm2834452wrk.49.2020.06.09.02.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 02:53:01 -0700 (PDT)
Date:   Tue, 9 Jun 2020 05:52:58 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     David Stevens <stevensd@chromium.org>
Cc:     Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Jason Wang <jasowang@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        virtio-dev@lists.oasis-open.org, alex.williamson@redhat.com
Subject: Re: [PATCH v5 0/3] Support virtio cross-device resources
Message-ID: <20200609055021-mutt-send-email-mst@kernel.org>
References: <20200609012518.198908-1-stevensd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200609012518.198908-1-stevensd@chromium.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 09, 2020 at 10:25:15AM +0900, David Stevens wrote:
> This patchset implements the current proposal for virtio cross-device
> resource sharing [1]. It will be used to import virtio resources into
> the virtio-video driver currently under discussion [2]. The patch
> under consideration to add support in the virtio-video driver is [3].
> It uses the APIs from v3 of this series, but the changes to update it
> are relatively minor.
> 
> This patchset adds a new flavor of dma-bufs that supports querying the
> underlying virtio object UUID, as well as adding support for exporting
> resources from virtgpu.

Gerd, David, if possible, please test this in configuration with
virtual VTD enabled but with iommu_platform=off
to make sure we didn't break this config.


Besides that, for virtio parts:

Acked-by: Michael S. Tsirkin <mst@redhat.com>


> [1] https://markmail.org/thread/2ypjt5cfeu3m6lxu
> [2] https://markmail.org/thread/p5d3k566srtdtute
> [3] https://markmail.org/thread/j4xlqaaim266qpks
> 
> v4 -> v5 changes:
>  - Remove virtio_dma_buf_export_info.
> 
> David Stevens (3):
>   virtio: add dma-buf support for exported objects
>   virtio-gpu: add VIRTIO_GPU_F_RESOURCE_UUID feature
>   drm/virtio: Support virtgpu exported resources
> 
>  drivers/gpu/drm/virtio/virtgpu_drv.c   |  3 +
>  drivers/gpu/drm/virtio/virtgpu_drv.h   | 20 ++++++
>  drivers/gpu/drm/virtio/virtgpu_kms.c   |  4 ++
>  drivers/gpu/drm/virtio/virtgpu_prime.c | 96 +++++++++++++++++++++++++-
>  drivers/gpu/drm/virtio/virtgpu_vq.c    | 55 +++++++++++++++
>  drivers/virtio/Makefile                |  2 +-
>  drivers/virtio/virtio.c                |  6 ++
>  drivers/virtio/virtio_dma_buf.c        | 82 ++++++++++++++++++++++
>  include/linux/virtio.h                 |  1 +
>  include/linux/virtio_dma_buf.h         | 37 ++++++++++
>  include/uapi/linux/virtio_gpu.h        | 19 +++++
>  11 files changed, 321 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/virtio/virtio_dma_buf.c
>  create mode 100644 include/linux/virtio_dma_buf.h
> 
> -- 
> 2.27.0.278.ge193c7cf3a9-goog

