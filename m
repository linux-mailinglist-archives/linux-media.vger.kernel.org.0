Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00F99624B5C
	for <lists+linux-media@lfdr.de>; Thu, 10 Nov 2022 21:15:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231528AbiKJUO5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Nov 2022 15:14:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbiKJUOz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Nov 2022 15:14:55 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A64D49B65;
        Thu, 10 Nov 2022 12:14:54 -0800 (PST)
Received: from dimapc.. (unknown [109.252.117.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dmitry.osipenko)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 504D16602A38;
        Thu, 10 Nov 2022 20:14:51 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1668111293;
        bh=0G+VWzBJRZewI6CJdj0Q8Ky11O2aqS9atLUTpdObBfc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Z3qMS6fbkoFYTShp/wAKU+h+Pybco7gCrFuaxBN0Hdql0Ieikfdb4pWDV2JRVWL1P
         2HgO1lp8SeQLFvMEHfOsIodkJ8ALATaDTxPzo7dtAIFrMX16iqeXH/my9+HoQWv/mo
         pQrLUk6FBLWewtnmKIR81HisCFLn9vymuYfGpPULCXa1Je9WMV2vA7zh6ZaTtZnhbV
         lCtiK4JrhtFcaAHKbY1DTC7ecUHAG3IJ37XmKDSedObDeMLijEUwD0SOeH1DrZlcvx
         klJQa/472frF0E5dmXAZf7xo8sB4QyNb8lKu1h42opeFniOc1VnVXrzJuxZT3AS95g
         5xKZtfKBZ1rMQ==
From:   Dmitry Osipenko <dmitry.osipenko@collabora.com>
To:     Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Liam Mark <lmark@codeaurora.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        John Stultz <jstultz@google.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Tomi Valkeinen <tomba@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        kernel@collabora.com
Subject: [PATCH v1 2/6] drm: Assert held reservation lock for dma-buf mmapping
Date:   Thu, 10 Nov 2022 23:13:45 +0300
Message-Id: <20221110201349.351294-3-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221110201349.351294-1-dmitry.osipenko@collabora.com>
References: <20221110201349.351294-1-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When userspace mmaps dma-buf's fd, the dma-buf reservation lock must be
held. Add locking sanity checks to the dma-buf mmaping callbacks of DRM
drivers to ensure that the locking assumptions won't regress in future.

Suggested-by: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_prime.c                | 2 ++
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c | 2 ++
 drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c  | 2 ++
 drivers/gpu/drm/tegra/gem.c                | 2 ++
 4 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 20e109a802ae..f924b8b4ab6b 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -781,6 +781,8 @@ int drm_gem_dmabuf_mmap(struct dma_buf *dma_buf, struct vm_area_struct *vma)
 	struct drm_gem_object *obj = dma_buf->priv;
 	struct drm_device *dev = obj->dev;
 
+	dma_resv_assert_held(dma_buf->resv);
+
 	if (!dev->driver->gem_prime_mmap)
 		return -ENOSYS;
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index ec6f7ae47783..9322ac29008b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -97,6 +97,8 @@ static int i915_gem_dmabuf_mmap(struct dma_buf *dma_buf, struct vm_area_struct *
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
 	int ret;
 
+	dma_resv_assert_held(dma_buf->resv);
+
 	if (obj->base.size < vma->vm_end - vma->vm_start)
 		return -EINVAL;
 
diff --git a/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c b/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
index 8e194dbc9506..3abc47521b2c 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
+++ b/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
@@ -66,6 +66,8 @@ static int omap_gem_dmabuf_mmap(struct dma_buf *buffer,
 	struct drm_gem_object *obj = buffer->priv;
 	int ret = 0;
 
+	dma_resv_assert_held(buffer->resv);
+
 	ret = drm_gem_mmap_obj(obj, omap_gem_mmap_size(obj), vma);
 	if (ret < 0)
 		return ret;
diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index b09b8ab40ae4..979e7bc902f6 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -694,6 +694,8 @@ static int tegra_gem_prime_mmap(struct dma_buf *buf, struct vm_area_struct *vma)
 	struct drm_gem_object *gem = buf->priv;
 	int err;
 
+	dma_resv_assert_held(buf->resv);
+
 	err = drm_gem_mmap_obj(gem, gem->size, vma);
 	if (err < 0)
 		return err;
-- 
2.37.3

