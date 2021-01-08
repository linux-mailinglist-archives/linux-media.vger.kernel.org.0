Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91B502EEFF4
	for <lists+linux-media@lfdr.de>; Fri,  8 Jan 2021 10:46:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728018AbhAHJpK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jan 2021 04:45:10 -0500
Received: from mx2.suse.de ([195.135.220.15]:36774 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727956AbhAHJpJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 Jan 2021 04:45:09 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id BB9D9AFAC;
        Fri,  8 Jan 2021 09:43:47 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     sumit.semwal@linaro.org, christian.koenig@amd.com,
        airlied@redhat.com, daniel@ffwll.ch,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        kraxel@redhat.com, hdegoede@redhat.com, sean@poorly.run,
        eric@anholt.net, sam@ravnborg.org
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org,
        virtualization@lists.linux-foundation.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 06/13] drm/cirrus: Use drm_gem_shmem_vmap_local() in damage handling
Date:   Fri,  8 Jan 2021 10:43:33 +0100
Message-Id: <20210108094340.15290-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210108094340.15290-1-tzimmermann@suse.de>
References: <20210108094340.15290-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Damage handling in cirrus requires a short-term mapping of the source
BO. Use drm_gem_shmem_vmap_local().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/cirrus.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
index a043e602199e..21cd7056d45f 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus.c
@@ -315,6 +315,7 @@ static int cirrus_fb_blit_rect(struct drm_framebuffer *fb,
 			       struct drm_rect *rect)
 {
 	struct cirrus_device *cirrus = to_cirrus(fb->dev);
+	struct drm_gem_object *obj = fb->obj[0];
 	struct dma_buf_map map;
 	void *vmap;
 	int idx, ret;
@@ -323,9 +324,12 @@ static int cirrus_fb_blit_rect(struct drm_framebuffer *fb,
 	if (!drm_dev_enter(&cirrus->dev, &idx))
 		goto out;
 
-	ret = drm_gem_shmem_vmap(fb->obj[0], &map);
+	ret = dma_resv_lock(obj->resv, NULL);
 	if (ret)
 		goto out_dev_exit;
+	ret = drm_gem_shmem_vmap_local(fb->obj[0], &map);
+	if (ret)
+		goto out_dma_resv_unlock;
 	vmap = map.vaddr; /* TODO: Use mapping abstraction properly */
 
 	if (cirrus->cpp == fb->format->cpp[0])
@@ -345,9 +349,11 @@ static int cirrus_fb_blit_rect(struct drm_framebuffer *fb,
 	else
 		WARN_ON_ONCE("cpp mismatch");
 
-	drm_gem_shmem_vunmap(fb->obj[0], &map);
 	ret = 0;
 
+	drm_gem_shmem_vunmap_local(obj, &map);
+out_dma_resv_unlock:
+	dma_resv_unlock(obj->resv);
 out_dev_exit:
 	drm_dev_exit(idx);
 out:
-- 
2.29.2

