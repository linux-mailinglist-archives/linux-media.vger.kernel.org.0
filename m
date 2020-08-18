Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E13A247BDF
	for <lists+linux-media@lfdr.de>; Tue, 18 Aug 2020 03:37:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726689AbgHRBh4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 21:37:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726314AbgHRBhw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 21:37:52 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60EE8C061342
        for <linux-media@vger.kernel.org>; Mon, 17 Aug 2020 18:37:52 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id g15so4551274plj.6
        for <linux-media@vger.kernel.org>; Mon, 17 Aug 2020 18:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VKh9IL3wAtvMWfoyCMPIJCvNUxcYwDemhkEsAUpJ8lo=;
        b=PpDkXzwwJnQbFULXuaCZmFAzHkMYds94xj9YOEbRQIDZP94f5AIguahC9HLAqMzfqe
         HZo+oLLrI8WjWPoEUYBDKMzFALzRY0smgK2z8FhA0gTW6+15QKk+sBnRoiloCW4HD1Tg
         /lbl1EzXVpT9Bbqf4asPikFMaMTCUurQjIIik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VKh9IL3wAtvMWfoyCMPIJCvNUxcYwDemhkEsAUpJ8lo=;
        b=Y9U7nmhoMM8Pd8q9OmMlY4L1YPnp7DsHLuRNohRday6UnhjibJwEzjadLoZiFDc8rR
         oaGpM0dzARXC3ScwW4Mq+lRAMtoV30eLEORZMgSkXhSYjv8ul+cy9KaQMTZ0uU/UT9To
         BcUSBw0u90H+V8VxDDen9oM38oH3Bi5ENRJ/277SDrqaNTpNPHLOoZMY3iPKNumh67d4
         B9Vt64Ub1KtcjafiXUCx1JdA+fLuhiYBX47JgZBfBxOtfD9ZgDxRqlO5rkyKYftGKDzp
         J4WuvuZbp7UtdkYcBy0pRG8a9AolvNJAU/Kww8FcF0vZHH/b6xQzKSkNcodqs/O89JT2
         J97w==
X-Gm-Message-State: AOAM530UaXAnScUL0Xx1vRSTrrrVf8PyqumBOZ/JPj+S2uuLNsTGKLNH
        yd9IMfn6Tmk+kxb3cn9/zU4CFw==
X-Google-Smtp-Source: ABdhPJwBgf3Py2LgsmCVLyQWvxnS2N46UEoOPZjDMDI6aKwBwSdp/Daf1fAgtWB28KQKG/yQd4XxNg==
X-Received: by 2002:a17:90b:1c06:: with SMTP id oc6mr14032262pjb.182.1597714671684;
        Mon, 17 Aug 2020 18:37:51 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:f693:9fff:fef4:a930])
        by smtp.gmail.com with ESMTPSA id e8sm21616835pfd.34.2020.08.17.18.37.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2020 18:37:50 -0700 (PDT)
From:   David Stevens <stevensd@chromium.org>
To:     Gerd Hoffmann <kraxel@redhat.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Stevens <stevensd@chromium.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        virtio-dev@lists.oasis-open.org
Subject: [PATCH v6 0/3] Support virtio cross-device resources
Date:   Tue, 18 Aug 2020 10:37:41 +0900
Message-Id: <20200818013744.3327271-1-stevensd@chromium.org>
X-Mailer: git-send-email 2.28.0.220.ged08abb693-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patchset implements the current proposal for virtio cross-device
resource sharing [1]. It will be used to import virtio resources into
the virtio-video driver currently under discussion [2]. The patch
under consideration to add support in the virtio-video driver is [3].
It uses the APIs from v3 of this series, but the changes to update it
are relatively minor.

This patchset adds a new flavor of dma-bufs that supports querying the
underlying virtio object UUID, as well as adding support for exporting
resources from virtgpu.

[1] https://markmail.org/thread/2ypjt5cfeu3m6lxu
[2] https://markmail.org/thread/p5d3k566srtdtute
[3] https://markmail.org/thread/j4xlqaaim266qpks

v5 -> v6 changes:
 - Fix >80 character comment

David Stevens (3):
  virtio: add dma-buf support for exported objects
  virtio-gpu: add VIRTIO_GPU_F_RESOURCE_UUID feature
  drm/virtio: Support virtgpu exported resources

 drivers/gpu/drm/virtio/virtgpu_drv.c   |  3 +
 drivers/gpu/drm/virtio/virtgpu_drv.h   | 20 ++++++
 drivers/gpu/drm/virtio/virtgpu_kms.c   |  4 ++
 drivers/gpu/drm/virtio/virtgpu_prime.c | 96 +++++++++++++++++++++++++-
 drivers/gpu/drm/virtio/virtgpu_vq.c    | 55 +++++++++++++++
 drivers/virtio/Makefile                |  2 +-
 drivers/virtio/virtio.c                |  6 ++
 drivers/virtio/virtio_dma_buf.c        | 82 ++++++++++++++++++++++
 include/linux/virtio.h                 |  1 +
 include/linux/virtio_dma_buf.h         | 37 ++++++++++
 include/uapi/linux/virtio_gpu.h        | 19 +++++
 11 files changed, 321 insertions(+), 4 deletions(-)
 create mode 100644 drivers/virtio/virtio_dma_buf.c
 create mode 100644 include/linux/virtio_dma_buf.h

-- 
2.28.0.220.ged08abb693-goog

