Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACBA02A4006
	for <lists+linux-media@lfdr.de>; Tue,  3 Nov 2020 10:30:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727665AbgKCJaX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Nov 2020 04:30:23 -0500
Received: from mx2.suse.de ([195.135.220.15]:37260 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725988AbgKCJaW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 3 Nov 2020 04:30:22 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id A7AA5B135;
        Tue,  3 Nov 2020 09:30:20 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org,
        alexander.deucher@amd.com, christian.koenig@amd.com,
        kraxel@redhat.com, l.stach@pengutronix.de,
        linux+etnaviv@armlinux.org.uk, christian.gmeiner@gmail.com,
        inki.dae@samsung.com, jy0922.shim@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com,
        kgene@kernel.org, krzk@kernel.org, yuq825@gmail.com,
        bskeggs@redhat.com, robh@kernel.org, tomeu.vizoso@collabora.com,
        steven.price@arm.com, alyssa.rosenzweig@collabora.com,
        hjc@rock-chips.com, heiko@sntech.de, hdegoede@redhat.com,
        sean@poorly.run, eric@anholt.net, oleksandr_andrushchenko@epam.com,
        ray.huang@amd.com, sumit.semwal@linaro.org,
        emil.velikov@collabora.com, luben.tuikov@amd.com, apaneers@amd.com,
        linus.walleij@linaro.org, melissa.srw@gmail.com,
        chris@chris-wilson.co.uk, miaoqinglang@huawei.com
Cc:     dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        etnaviv@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
        nouveau@lists.freedesktop.org, spice-devel@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org, xen-devel@lists.xenproject.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v7 04/10] drm/exynos: Remove empty exynos_drm_gem_prime_{vmap,vunmap}()
Date:   Tue,  3 Nov 2020 10:30:09 +0100
Message-Id: <20201103093015.1063-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201103093015.1063-1-tzimmermann@suse.de>
References: <20201103093015.1063-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The functions exynos_drm_gem_prime_{vmap,vunmap}() are empty. Remove
them before changing the interface to use struct drm_buf_map. As a side
effect of removing drm_gem_prime_vmap(), the error code changes from
ENOMEM to EOPNOTSUPP.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Christian König <christian.koenig@amd.com>
Tested-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/exynos/exynos_drm_gem.c | 12 ------------
 drivers/gpu/drm/exynos/exynos_drm_gem.h |  2 --
 2 files changed, 14 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
index 4afbf5109cbf..4396224227d1 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
@@ -135,8 +135,6 @@ static const struct vm_operations_struct exynos_drm_gem_vm_ops = {
 static const struct drm_gem_object_funcs exynos_drm_gem_object_funcs = {
 	.free = exynos_drm_gem_free_object,
 	.get_sg_table = exynos_drm_gem_prime_get_sg_table,
-	.vmap = exynos_drm_gem_prime_vmap,
-	.vunmap	= exynos_drm_gem_prime_vunmap,
 	.vm_ops = &exynos_drm_gem_vm_ops,
 };
 
@@ -469,16 +467,6 @@ exynos_drm_gem_prime_import_sg_table(struct drm_device *dev,
 	return &exynos_gem->base;
 }
 
-void *exynos_drm_gem_prime_vmap(struct drm_gem_object *obj)
-{
-	return NULL;
-}
-
-void exynos_drm_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr)
-{
-	/* Nothing to do */
-}
-
 int exynos_drm_gem_prime_mmap(struct drm_gem_object *obj,
 			      struct vm_area_struct *vma)
 {
diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.h b/drivers/gpu/drm/exynos/exynos_drm_gem.h
index 74e926abeff0..a23272fb96fb 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.h
@@ -107,8 +107,6 @@ struct drm_gem_object *
 exynos_drm_gem_prime_import_sg_table(struct drm_device *dev,
 				     struct dma_buf_attachment *attach,
 				     struct sg_table *sgt);
-void *exynos_drm_gem_prime_vmap(struct drm_gem_object *obj);
-void exynos_drm_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr);
 int exynos_drm_gem_prime_mmap(struct drm_gem_object *obj,
 			      struct vm_area_struct *vma);
 
-- 
2.29.0

