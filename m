Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 673991F31F4
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2020 03:26:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726949AbgFIBZt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Jun 2020 21:25:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726860AbgFIBZs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Jun 2020 21:25:48 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99089C03E969
        for <linux-media@vger.kernel.org>; Mon,  8 Jun 2020 18:25:47 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id i4so643611pjd.0
        for <linux-media@vger.kernel.org>; Mon, 08 Jun 2020 18:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=COw8MsymzwRUQaCcvby30uu+ORzSh+2s4CK8yqEnGk0=;
        b=m4U6w8Hj6efLuU2XJFCP8IPM+30vKQRX8BKy4OU/D+DUTmyH9XKbfEELFpSz42f7a/
         a3V6e3lrKLFyYc13GVhfa4CdVD7sYJf2xvK5y5RWC823y9VUiUO/9hdCrABpETL9VLNp
         ypI6smgxA7gnRqgf3Gf8k99kM728ZEUHZIKPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=COw8MsymzwRUQaCcvby30uu+ORzSh+2s4CK8yqEnGk0=;
        b=ljNembMEjit5+K47pKaUEciNvtcWCGp53jQ9aEtil7VAkSJHbeSqP80+qSA9/oIOn8
         n/6voOvX2MO1HY1UBaoUaOKw4+65t5NHTyU9D/USnrOkcuuR7TPwPxSV/RzAllAX6q1u
         s6Fb/0rsgvC4pTqo3KQip3bqDI7epy/YTIWZQ+LW0PNNLR3gEs90ffx1vTCmPbt8eLLY
         32LDYGaWcUxKhXZTHghqnCG2MIUyROR8KbOGquCYM+HeRsxgcQNWHgsd6aJN/mnspb+g
         CabBfp8yoYykiyc0nDpdZJY6Jafg2e4lLbC/COwn3TPkUrkCS6hCGagZax/8QFM51fjI
         JLBw==
X-Gm-Message-State: AOAM530N6X+Q7cRxiId3afdL9lXq3rcyV0Fe8Th5wGo9ep2Fbps6O0qe
        mQ/Yh2HLk6BVwpLPWpvt/SrPWw==
X-Google-Smtp-Source: ABdhPJxxp3CZRZ++LaDq5ouPDTw2c1q5JXibsFXECAvthEk/ewMP/5LQ+XhXru1zBYVm40/rZfIFZw==
X-Received: by 2002:a17:902:9043:: with SMTP id w3mr1170254plz.250.1591665946907;
        Mon, 08 Jun 2020 18:25:46 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:30f2:7a9c:387e:6c7])
        by smtp.gmail.com with ESMTPSA id z23sm6716617pga.86.2020.06.08.18.25.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2020 18:25:46 -0700 (PDT)
From:   David Stevens <stevensd@chromium.org>
To:     Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "Michael S . Tsirkin" <mst@redhat.com>
Cc:     Jason Wang <jasowang@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Stevens <stevensd@chromium.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        virtio-dev@lists.oasis-open.org
Subject: [PATCH v5 0/3] Support virtio cross-device resources
Date:   Tue,  9 Jun 2020 10:25:15 +0900
Message-Id: <20200609012518.198908-1-stevensd@chromium.org>
X-Mailer: git-send-email 2.27.0.278.ge193c7cf3a9-goog
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

v4 -> v5 changes:
 - Remove virtio_dma_buf_export_info.

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
2.27.0.278.ge193c7cf3a9-goog

