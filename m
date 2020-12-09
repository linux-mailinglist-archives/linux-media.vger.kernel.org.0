Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B862B2D443C
	for <lists+linux-media@lfdr.de>; Wed,  9 Dec 2020 15:26:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732954AbgLIO02 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Dec 2020 09:26:28 -0500
Received: from mx2.suse.de ([195.135.220.15]:39592 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732951AbgLIO0M (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 9 Dec 2020 09:26:12 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 31844AD5C;
        Wed,  9 Dec 2020 14:25:31 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, christian.koenig@amd.com, airlied@linux.ie,
        sumit.semwal@linaro.org, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, kraxel@redhat.com, hdegoede@redhat.com,
        sean@poorly.run, eric@anholt.net, sam@ravnborg.org
Cc:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        virtualization@lists.linux-foundation.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 1/8] drm/ast: Don't pin cursor source BO explicitly during update
Date:   Wed,  9 Dec 2020 15:25:20 +0100
Message-Id: <20201209142527.26415-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201209142527.26415-1-tzimmermann@suse.de>
References: <20201209142527.26415-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Vmapping the cursor source BO contains an implicit pin operation,
so there's no need to do this manually.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_cursor.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_cursor.c b/drivers/gpu/drm/ast/ast_cursor.c
index 742d43a7edf4..68bf3d33f1ed 100644
--- a/drivers/gpu/drm/ast/ast_cursor.c
+++ b/drivers/gpu/drm/ast/ast_cursor.c
@@ -180,12 +180,9 @@ int ast_cursor_blit(struct ast_private *ast, struct drm_framebuffer *fb)
 
 	gbo = drm_gem_vram_of_gem(fb->obj[0]);
 
-	ret = drm_gem_vram_pin(gbo, 0);
-	if (ret)
-		return ret;
 	ret = drm_gem_vram_vmap(gbo, &map);
 	if (ret)
-		goto err_drm_gem_vram_unpin;
+		return ret;
 	src = map.vaddr; /* TODO: Use mapping abstraction properly */
 
 	dst = ast->cursor.map[ast->cursor.next_index].vaddr_iomem;
@@ -194,13 +191,8 @@ int ast_cursor_blit(struct ast_private *ast, struct drm_framebuffer *fb)
 	update_cursor_image(dst, src, fb->width, fb->height);
 
 	drm_gem_vram_vunmap(gbo, &map);
-	drm_gem_vram_unpin(gbo);
 
 	return 0;
-
-err_drm_gem_vram_unpin:
-	drm_gem_vram_unpin(gbo);
-	return ret;
 }
 
 static void ast_cursor_set_base(struct ast_private *ast, u64 address)
-- 
2.29.2

