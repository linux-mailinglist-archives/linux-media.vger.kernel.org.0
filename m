Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F095C175A31
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2020 13:15:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727762AbgCBMPh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Mar 2020 07:15:37 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:37802 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727708AbgCBMPg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Mar 2020 07:15:36 -0500
Received: by mail-pj1-f67.google.com with SMTP id o2so2437532pjp.2
        for <linux-media@vger.kernel.org>; Mon, 02 Mar 2020 04:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lZGpFs/2Hpvp5EBjhtEPYFMiCDK4EwWNSDCEw0ZF9yM=;
        b=YdktfZqsllSe62wYX660jiqDRS+EalzZnMQ1BeqTSt6UePbz+K0FicX2SsE/V0cujA
         5xWBPQ/CoyG8cCbk0OYdp++ETje+/Zb3758uFx7Qekbu/aW/7Z9P7O5b1yiYOpyhmqGv
         lokSV/Y8mwFqiA+CYWGVKLnJYUt+R77uSUoac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lZGpFs/2Hpvp5EBjhtEPYFMiCDK4EwWNSDCEw0ZF9yM=;
        b=AiiVJysb8oCcXAUJLC+AzEWsCHzWw02eKLgF1z/FdqwgKUGaMoyHWDzIyclfidkFax
         5n6TLni/xzItoWQzPDtcNZ4HYb4VCIM7b0vlyF8h4L14TXGkHLoSTaH3yh+l0HSVRB+R
         MfYS+6UViUauVt9RVUHP6kzFvUAr/VQ0glIT40r7nFJ5d++kDKDeMseVPI3jP2ZIZxZg
         i76H9WTSaAz993g9vWahajj4DQEHCRHQ8D6rpoRrP9Nal1UtfMXZ8mAHlJ3+qcyKgfXC
         SEokDDzcNCDrrMBZX+X3+oAE66FO++0+VOnKpVFlsvlNpIq88vlJZbQgd1+irOzKG0hh
         3JpA==
X-Gm-Message-State: APjAAAX4CP+oQ3V9yF7jEgUs//34/f3lzwtocw1U+0xZMObfUf/NwV5I
        mh+d9iZWxIpxBY6LRI7kIDQvYg==
X-Google-Smtp-Source: APXvYqwRMn3OTkeHmnSwspvfRaPVPBDR27JwwVPH2eKLlGUxm3/qGiUC5qrtz1TVnCC2dlGf61Hqxg==
X-Received: by 2002:a17:902:c203:: with SMTP id 3mr18521523pll.261.1583151334258;
        Mon, 02 Mar 2020 04:15:34 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:30f2:7a9c:387e:6c7])
        by smtp.gmail.com with ESMTPSA id g4sm2291857pgk.24.2020.03.02.04.15.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2020 04:15:33 -0800 (PST)
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
Subject: [PATCH v2 0/4] Support virtio cross-device resources
Date:   Mon,  2 Mar 2020 21:15:20 +0900
Message-Id: <20200302121524.7543-1-stevensd@chromium.org>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
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

v1 -> v2 changes:
 - Move get_uuid callback into main dma-buf ops (instead of placing it
   in a new flavor of dma-buf).
 - Rename new virtio commands and feature flag, and pull uapi changes
   into their own patch.

David Stevens (4):
  dma-buf: add support for virtio exported objects
  drm/prime: add support for virtio exported objects
  virtio-gpu: add VIRTIO_GPU_F_RESOURCE_UUID feature
  drm/virtio: Support virtgpu exported resources

 drivers/dma-buf/dma-buf.c              | 14 ++++++
 drivers/gpu/drm/drm_prime.c            | 27 +++++++++++
 drivers/gpu/drm/virtio/virtgpu_drv.c   |  3 ++
 drivers/gpu/drm/virtio/virtgpu_drv.h   | 19 ++++++++
 drivers/gpu/drm/virtio/virtgpu_kms.c   |  4 ++
 drivers/gpu/drm/virtio/virtgpu_prime.c | 48 ++++++++++++++++++--
 drivers/gpu/drm/virtio/virtgpu_vq.c    | 62 ++++++++++++++++++++++++++
 include/drm/drm_drv.h                  | 15 +++++++
 include/linux/dma-buf.h                | 22 +++++++++
 include/uapi/linux/virtio_gpu.h        | 19 ++++++++
 10 files changed, 230 insertions(+), 3 deletions(-)

-- 
2.25.0.265.gbab2e86ba0-goog

