Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34CD91816A3
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2020 12:20:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbgCKLUT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 07:20:19 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:33946 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725834AbgCKLUT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 07:20:19 -0400
Received: by mail-pf1-f193.google.com with SMTP id 23so1159691pfj.1
        for <linux-media@vger.kernel.org>; Wed, 11 Mar 2020 04:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KxW/JHv7DCd6LJdHZguy7LpVn/rmry23ZMXy1XI084k=;
        b=fBOA7Z4/VSkvDegFBNVqp2pLUAlgBxRv5RhOTNT8p2xHiAPXkjWsHMTxUl1BPV00zJ
         vMY5dhyEKkfjXmFfYLzpD5a73p+KDdMSaC4nhV9dQ1R32BqiNxXeCSXBpA7Ii2Wer4pC
         VDfF4BA+tuEYJwFmE32LvvNq/AN2GVAmGN3hs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KxW/JHv7DCd6LJdHZguy7LpVn/rmry23ZMXy1XI084k=;
        b=D8NACIJxaLb05fxWhVxwMRJpRlhS+oFr+CR+IMf1kG8rkQJcQEERDCTONJYXOG/2Y8
         pXOzruXgL67YYeVpMiwSKmFt4DFKAagX1G/l+lyyxq7m9s0UrUFOL/3QpfkH8Bs1Pfvf
         LMVnQ96Lq1oNIKPsSuw/VLk7zyUDZSMMMCGu18LS17WKYI5I9rXMZM/VmmfEGTO3ZaD2
         6OxMoP9iTnt6CQtvAsWKe3QB5YAyBPapiL730YgvdVWk8RvmdLyYzEUBHh7pQdfOeazY
         bDWXVpApvLM9SHJ+ito6AQt4ZlHpYw5U+6bzYYvMI26VOhsZLXUuFc8osYuXYg0eIbvm
         qB3g==
X-Gm-Message-State: ANhLgQ11w+HTg5+gYUZQdj6B8blDS/hmfzyI89Q1fXPt6d3tA22TXvPp
        HlQ8lsqXYoEIQeUeI4d86TK79Q==
X-Google-Smtp-Source: ADFU+vvUUJsm4mKY+53aHHx0GkxoPfHJ2XfB3hmp2HvE1iN3ACnAA15TuK1aSNIfg+893OuM9NF9eQ==
X-Received: by 2002:a63:4d6:: with SMTP id 205mr2392870pge.10.1583925617855;
        Wed, 11 Mar 2020 04:20:17 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:30f2:7a9c:387e:6c7])
        by smtp.gmail.com with ESMTPSA id e12sm35842384pff.168.2020.03.11.04.20.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2020 04:20:17 -0700 (PDT)
From:   David Stevens <stevensd@chromium.org>
To:     Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@linux.ie>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Stevens <stevensd@chromium.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        virtio-dev@lists.oasis-open.org
Subject: [PATCH v3 0/4] Support virtio cross-device resources
Date:   Wed, 11 Mar 2020 20:20:00 +0900
Message-Id: <20200311112004.47138-1-stevensd@chromium.org>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patchset implements the current proposal for virtio cross-device
resource sharing [1], with minor changes based on recent comments. It
is expected that this will be used to import virtio resources into the
virtio-video driver currently under discussion [2].

This patchset adds a new hook to dma-buf, for querying the dma-buf's
underlying virtio UUID. This hook is then plumbed through DRM PRIME
buffers, and finally implemented in virtgpu.

[1] https://markmail.org/thread/jsaoqy7phrqdcpqu
[2] https://markmail.org/thread/p5d3k566srtdtute

v2 -> v3 changes:
 - Remove ifdefs.
 - Simplify virtgpu_gem_prime_export as it can only be called once.
 - Use virtio_gpu_vbuffer's objs field instead of abusing data_buf.

David Stevens (4):
  dma-buf: add support for virtio exported objects
  drm/prime: add support for virtio exported objects
  virtio-gpu: add VIRTIO_GPU_F_RESOURCE_UUID feature
  drm/virtio: Support virtgpu exported resources

 drivers/dma-buf/dma-buf.c              | 12 ++++++
 drivers/gpu/drm/drm_prime.c            | 23 +++++++++++
 drivers/gpu/drm/virtio/virtgpu_drv.c   |  3 ++
 drivers/gpu/drm/virtio/virtgpu_drv.h   | 18 +++++++++
 drivers/gpu/drm/virtio/virtgpu_kms.c   |  4 ++
 drivers/gpu/drm/virtio/virtgpu_prime.c | 41 +++++++++++++++++--
 drivers/gpu/drm/virtio/virtgpu_vq.c    | 55 ++++++++++++++++++++++++++
 include/drm/drm_drv.h                  | 10 +++++
 include/linux/dma-buf.h                | 18 +++++++++
 include/uapi/linux/virtio_gpu.h        | 19 +++++++++
 10 files changed, 200 insertions(+), 3 deletions(-)

-- 
2.25.1.481.gfbce0eb801-goog

