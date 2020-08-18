Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9737247F16
	for <lists+linux-media@lfdr.de>; Tue, 18 Aug 2020 09:13:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726370AbgHRHNv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Aug 2020 03:13:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726228AbgHRHNu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Aug 2020 03:13:50 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D909C061342
        for <linux-media@vger.kernel.org>; Tue, 18 Aug 2020 00:13:50 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id f10so8785624plj.8
        for <linux-media@vger.kernel.org>; Tue, 18 Aug 2020 00:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BgH1OQJe0vDcind90faXlTgA3YjOyLHfHtqyBUp1Czc=;
        b=jBhQriRwN1E1G4yJ7yJ5QVDbR3yI60qfxFdNsiw1JCtEbsa6GBtVj3rXYqfrkw1aRi
         BBFDqgJ42hRBKauGzagAsCP9lo2zL3e6eFXcUOdjV3WZq3DzR1tibyoqkNwHzvl0SAos
         v5Yv2iK3XSVROgT7Y2Z9jT9El0Eh8HaHTb83E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BgH1OQJe0vDcind90faXlTgA3YjOyLHfHtqyBUp1Czc=;
        b=mGVosMO5QpcMQ7Wa/ZyldK4sqSJyI2LtcbwVpJYPhXLQIQQCsy5VRXX5xrJuF1BjCF
         VInaiS8zqUNQb+Pyzyim0zGUx0x6MDIJLj5VtxcMxsZ37jp9L7zQP/uazfpPUWftJubC
         DzRy33qttvwexAVaP8Za0S6KMq8B1rLpRkyBCtkZjPeNohrJ5jc3gFEMUTDYMH7Yp/WO
         xaYInyXI8xT1KJUGRAMtjLM6Y7RIXtNSTtbXCByFxfa9D0yq0M5osOCCPZOZDAg/TbNE
         yqBersFx1BTL4FNGiXM6exxNHyUAOLtZOxbsCYBwLiJwZJ5ZEqzkUTWRWfGeQzOF1u5b
         XsHg==
X-Gm-Message-State: AOAM530zXmO/L0qVjxAbrmrH8aagDHwJsll5RLX20foX6A0KlqKk9rOM
        0L7PsGaTv0oWQBA1B8sUTF/rHw==
X-Google-Smtp-Source: ABdhPJxuueydVbd6bk9DsX+V9TjGBCXpTewyWvogJZRb7m1T+Taz+F9x0MJK+8gr+vU6zEAzQBkJ7Q==
X-Received: by 2002:a17:90b:1c06:: with SMTP id oc6mr14823420pjb.182.1597734829705;
        Tue, 18 Aug 2020 00:13:49 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:f693:9fff:fef4:a930])
        by smtp.gmail.com with ESMTPSA id g33sm15709005pgg.46.2020.08.18.00.13.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2020 00:13:49 -0700 (PDT)
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
Subject: [PATCH v7 0/3] Support virtio cross-device resources
Date:   Tue, 18 Aug 2020 16:13:40 +0900
Message-Id: <20200818071343.3461203-1-stevensd@chromium.org>
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

v6 -> v7 changes:
 - Fix most strict checkpatch comments

David Stevens (3):
  virtio: add dma-buf support for exported objects
  virtio-gpu: add VIRTIO_GPU_F_RESOURCE_UUID feature
  drm/virtio: Support virtgpu exported resources

 drivers/gpu/drm/virtio/virtgpu_drv.c   |  3 +
 drivers/gpu/drm/virtio/virtgpu_drv.h   | 21 ++++++
 drivers/gpu/drm/virtio/virtgpu_kms.c   |  4 ++
 drivers/gpu/drm/virtio/virtgpu_prime.c | 96 +++++++++++++++++++++++++-
 drivers/gpu/drm/virtio/virtgpu_vq.c    | 55 +++++++++++++++
 drivers/virtio/Makefile                |  2 +-
 drivers/virtio/virtio.c                |  6 ++
 drivers/virtio/virtio_dma_buf.c        | 85 +++++++++++++++++++++++
 include/linux/virtio.h                 |  1 +
 include/linux/virtio_dma_buf.h         | 37 ++++++++++
 include/uapi/linux/virtio_gpu.h        | 19 +++++
 11 files changed, 325 insertions(+), 4 deletions(-)
 create mode 100644 drivers/virtio/virtio_dma_buf.c
 create mode 100644 include/linux/virtio_dma_buf.h

-- 
2.28.0.220.ged08abb693-goog

