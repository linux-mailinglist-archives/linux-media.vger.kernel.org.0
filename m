Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FD8B70B083
	for <lists+linux-media@lfdr.de>; Sun, 21 May 2023 23:00:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230502AbjEUVAT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 May 2023 17:00:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231231AbjEUVAP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 May 2023 17:00:15 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E85A9E4;
        Sun, 21 May 2023 14:00:13 -0700 (PDT)
Received: from workpc.. (109-252-147-95.dynamic.spd-mgts.ru [109.252.147.95])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dmitry.osipenko)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id B53F66606D86;
        Sun, 21 May 2023 22:00:10 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1684702812;
        bh=8TkX+3yzYriWDfAoZpN97fKff9Eu7aGGb57AmcxWsyQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RE15xoFHsSJZ3bml9agY32KRPEYTBotH1u9BVpkR/8RwqVSTHfenyGsF/zzZzPlWg
         JL2z5KVAEf5dkct3SFsKO7/O9VdoBtbK4wcPvo8uqT2yY3QSYdXennbtL4zm9XHvwR
         FdgV/CS97NAjkhsZ0IYt1s3896tpr4NCH12wjsprwPq02OpxRgUFFBxGJRl5Vf6Pfd
         KsTsOXP24KLvlTpT87qqKvLN7Z1tbvksZwnepyRrl4NZuA6/Sks9R65rJDB1bsxIRj
         szsBC9h/ZMc9A49DRRVnU38RPiqsLG0FnyuDrsThTdN/OLIGplkh2FQFZtgqRzhPjZ
         KSEogO7VrnsXQ==
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
        Arnd Bergmann <arnd@arndb.de>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Tomi Valkeinen <tomba@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Emil Velikov <emil.l.velikov@gmail.com>
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, kernel@collabora.com
Subject: [PATCH v3 4/6] drm: Don't assert held reservation lock for dma-buf mmapping
Date:   Sun, 21 May 2023 23:51:10 +0300
Message-Id: <20230521205112.150206-5-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230521205112.150206-1-dmitry.osipenko@collabora.com>
References: <20230521205112.150206-1-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Don't assert held dma-buf reservation lock on memory mapping of exported
buffer.

We're going to change dma-buf mmap() locking policy such that exporters
will have to handle the lock. The previous locking policy caused deadlock
problem for DRM drivers in a case of self-imported dma-bufs once these
drivers are moved to use reservation lock universally. The problem is
solved by moving the lock down to exporters. This patch prepares DRM
drivers for the locking policy update.

Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
Acked-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_prime.c                | 2 --
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c | 2 --
 drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c  | 2 --
 drivers/gpu/drm/tegra/gem.c                | 2 --
 4 files changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index d29dafce9bb0..ccb2bfb29f14 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -785,8 +785,6 @@ int drm_gem_dmabuf_mmap(struct dma_buf *dma_buf, struct vm_area_struct *vma)
 	struct drm_gem_object *obj = dma_buf->priv;
 	struct drm_device *dev = obj->dev;
 
-	dma_resv_assert_held(dma_buf->resv);
-
 	if (!dev->driver->gem_prime_mmap)
 		return -ENOSYS;
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index fd556a076d05..1df74f7aa3dc 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -97,8 +97,6 @@ static int i915_gem_dmabuf_mmap(struct dma_buf *dma_buf, struct vm_area_struct *
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
 	int ret;
 
-	dma_resv_assert_held(dma_buf->resv);
-
 	if (obj->base.size < vma->vm_end - vma->vm_start)
 		return -EINVAL;
 
diff --git a/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c b/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
index 3abc47521b2c..8e194dbc9506 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
+++ b/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
@@ -66,8 +66,6 @@ static int omap_gem_dmabuf_mmap(struct dma_buf *buffer,
 	struct drm_gem_object *obj = buffer->priv;
 	int ret = 0;
 
-	dma_resv_assert_held(buffer->resv);
-
 	ret = drm_gem_mmap_obj(obj, omap_gem_mmap_size(obj), vma);
 	if (ret < 0)
 		return ret;
diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index dea38892d6e6..a4023163493d 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -694,8 +694,6 @@ static int tegra_gem_prime_mmap(struct dma_buf *buf, struct vm_area_struct *vma)
 	struct drm_gem_object *gem = buf->priv;
 	int err;
 
-	dma_resv_assert_held(buf->resv);
-
 	err = drm_gem_mmap_obj(gem, gem->size, vma);
 	if (err < 0)
 		return err;
-- 
2.40.1

