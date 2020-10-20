Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD226293B28
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 14:20:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405877AbgJTMUz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 08:20:55 -0400
Received: from mx2.suse.de ([195.135.220.15]:53264 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405821AbgJTMUy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 08:20:54 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id C8365B1BF;
        Tue, 20 Oct 2020 12:20:51 +0000 (UTC)
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
Subject: [PATCH v5 03/10] drm/etnaviv: Remove empty etnaviv_gem_prime_vunmap()
Date:   Tue, 20 Oct 2020 14:20:39 +0200
Message-Id: <20201020122046.31167-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201020122046.31167-1-tzimmermann@suse.de>
References: <20201020122046.31167-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The function etnaviv_gem_prime_vunmap() is empty. Remove it before
changing the interface to use struct drm_buf_map.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Christian König <christian.koenig@amd.com>
Tested-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.h       | 1 -
 drivers/gpu/drm/etnaviv/etnaviv_gem.c       | 1 -
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c | 5 -----
 3 files changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.h b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
index 914f0867ff71..9682c26d89bb 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
@@ -52,7 +52,6 @@ int etnaviv_gem_mmap(struct file *filp, struct vm_area_struct *vma);
 int etnaviv_gem_mmap_offset(struct drm_gem_object *obj, u64 *offset);
 struct sg_table *etnaviv_gem_prime_get_sg_table(struct drm_gem_object *obj);
 void *etnaviv_gem_prime_vmap(struct drm_gem_object *obj);
-void etnaviv_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr);
 int etnaviv_gem_prime_mmap(struct drm_gem_object *obj,
 			   struct vm_area_struct *vma);
 struct drm_gem_object *etnaviv_gem_prime_import_sg_table(struct drm_device *dev,
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index 67d9a2b9ea6a..bbd235473645 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -571,7 +571,6 @@ static const struct drm_gem_object_funcs etnaviv_gem_object_funcs = {
 	.unpin = etnaviv_gem_prime_unpin,
 	.get_sg_table = etnaviv_gem_prime_get_sg_table,
 	.vmap = etnaviv_gem_prime_vmap,
-	.vunmap = etnaviv_gem_prime_vunmap,
 	.vm_ops = &vm_ops,
 };
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
index 135fbff6fecf..a6d9932a32ae 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
@@ -27,11 +27,6 @@ void *etnaviv_gem_prime_vmap(struct drm_gem_object *obj)
 	return etnaviv_gem_vmap(obj);
 }
 
-void etnaviv_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr)
-{
-	/* TODO msm_gem_vunmap() */
-}
-
 int etnaviv_gem_prime_mmap(struct drm_gem_object *obj,
 			   struct vm_area_struct *vma)
 {
-- 
2.28.0

