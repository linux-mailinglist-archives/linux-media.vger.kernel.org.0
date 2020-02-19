Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93A8A163E8B
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2020 09:08:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726604AbgBSIIR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Feb 2020 03:08:17 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:51659 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726480AbgBSIIR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Feb 2020 03:08:17 -0500
Received: by mail-pj1-f65.google.com with SMTP id fa20so2238750pjb.1
        for <linux-media@vger.kernel.org>; Wed, 19 Feb 2020 00:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eDEEn06gGe3wz7Pt5Sy7Iqux/1AIKbtlqlkTn71Oy4k=;
        b=Nb0J2Xyp5yfAHRANQeHIM9Bhe1mDPndS/8VRCMtVIO7WP2mPoXO7nq0sWc55gXRTfK
         faA/psEl79dEmvXeFu/v0EqEL7MiOU0dNsB+D97gDKuHmJhxcDJ4lXeJb/HjVRFWehHy
         ADEkYgAsVtcvH2QNrCYYERUN/CgxqKAr88vWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eDEEn06gGe3wz7Pt5Sy7Iqux/1AIKbtlqlkTn71Oy4k=;
        b=R5qs2g5kkPJuBKxSswYwmSdKdnpxRZrWuCipIysSd5uay4HxPZzdPKLt6SmY7B5nlX
         +tkRKhlWFL9qsi79NNVvDa2CsZd1OdP9X8oBDA9rmqvvRDSdGNqtbWKdCUm1ssC8Gg4l
         1j37AU8zQ+1UxCH1OI6RflbQfhLntK+Bf6CkLfJyi2KqtgjEMHzsZVtl2FSm0WeT64Cz
         iAiZ2IZx0/s0KERR3RzkhS5OMUZjjA/KRMxriZzj4GjgbXa24X+uQFjiFspIRNj17WOP
         1ZA+JMxNPfPAEcH1dsacvyurBjAQJtgMx2qAiMlRnbMEh+wBKK682+Gr8G62p9Qi/7St
         bBAg==
X-Gm-Message-State: APjAAAWLWN2eaQ5GbKUFchKvj9OLX+fE6fA+h3jwmr1IQcekOGamOq64
        HE78B5FbOOoafGc1ZMvoXDWxWA==
X-Google-Smtp-Source: APXvYqzOZKpamAABfdMJ/fDZQ0VlsPGfT9UmaFnev4sLY13+z4pxoduWq15xXgZAbVThF3gN2BNn5g==
X-Received: by 2002:a17:902:7406:: with SMTP id g6mr25130286pll.103.1582099696282;
        Wed, 19 Feb 2020 00:08:16 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:1f16:51f4:8631:68b2])
        by smtp.gmail.com with ESMTPSA id ci5sm1484267pjb.5.2020.02.19.00.08.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2020 00:08:15 -0800 (PST)
From:   David Stevens <stevensd@chromium.org>
To:     Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@linux.ie>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        David Stevens <stevensd@chromium.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        virtio-dev@lists.oasis-open.org
Subject: [PATCH 0/2] Support virtio cross-device resources
Date:   Wed, 19 Feb 2020 17:06:35 +0900
Message-Id: <20200219080637.61312-1-stevensd@chromium.org>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patchset implements the current proposal for virtio cross-device
resource sharing [1], with minor changes based on recent comments (i.e.
renumbering the new virtio gpu command and adding a feature flag).

The patchset adds a new flavor of dma-bufs that supports querying the
underlying virtio object UUID, as well as adding support for exporting
resources from virtgpu. It is expected that this will be used to import
virtgpu resources into the virtio-video driver currently under
discussion [2].

[1] https://markmail.org/thread/jsaoqy7phrqdcpqu
[2] https://markmail.org/thread/p5d3k566srtdtute

David Stevens (2):
  virtio: add dma-buf support for exported objects
  drm/virtio: Support virtgpu exported resources

 drivers/gpu/drm/virtio/virtgpu_drv.c   |   3 +
 drivers/gpu/drm/virtio/virtgpu_drv.h   |  21 +++++
 drivers/gpu/drm/virtio/virtgpu_kms.c   |   4 +
 drivers/gpu/drm/virtio/virtgpu_prime.c | 109 ++++++++++++++++++++++++-
 drivers/gpu/drm/virtio/virtgpu_vq.c    |  58 +++++++++++++
 drivers/virtio/Makefile                |   2 +-
 drivers/virtio/virtio.c                |   6 ++
 drivers/virtio/virtio_dma_buf.c        |  97 ++++++++++++++++++++++
 include/linux/virtio.h                 |   1 +
 include/linux/virtio_dma_buf.h         |  62 ++++++++++++++
 include/uapi/linux/virtio_gpu.h        |  19 +++++
 11 files changed, 378 insertions(+), 4 deletions(-)
 create mode 100644 drivers/virtio/virtio_dma_buf.c
 create mode 100644 include/linux/virtio_dma_buf.h

-- 
2.25.0.265.gbab2e86ba0-goog

