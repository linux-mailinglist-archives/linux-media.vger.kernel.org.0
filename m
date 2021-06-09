Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D67FA3A126D
	for <lists+linux-media@lfdr.de>; Wed,  9 Jun 2021 13:20:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238976AbhFILW0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Jun 2021 07:22:26 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:36858 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238881AbhFILWM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Jun 2021 07:22:12 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
        (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 72A051FD5E;
        Wed,  9 Jun 2021 11:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1623237617; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DKNzmpUMnKGetW9gWSfXN0fWNO4Ill+y5d1BrTMC3Bc=;
        b=Rq55TcomPGhMXwpeFyESUm3GDvlg7OmaZX/qRaxtJN732EyZeijE7CTgQQ81HFu+nOAnWo
        Z+WU7zDsm0G3ahHPlWoKBpb5pqwby6nzNTPZ1PS16fXw3BOYMdf/6A8Nsq4lS+x0+pYTRj
        GUC+kQK64wYiUp8guoJ8SnsSvgqFYrw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1623237617;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DKNzmpUMnKGetW9gWSfXN0fWNO4Ill+y5d1BrTMC3Bc=;
        b=UohKZc2F4Ut9lh/4Tyt67jSW7I9hMjqHQGWVvsSXRh0Vw7JlrrpjYo8yCJSaYDQ6uGjzTJ
        H4WzmfaRgb3bONBg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
        by imap.suse.de (Postfix) with ESMTP id C7C0311A98;
        Wed,  9 Jun 2021 11:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1623237617; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DKNzmpUMnKGetW9gWSfXN0fWNO4Ill+y5d1BrTMC3Bc=;
        b=Rq55TcomPGhMXwpeFyESUm3GDvlg7OmaZX/qRaxtJN732EyZeijE7CTgQQ81HFu+nOAnWo
        Z+WU7zDsm0G3ahHPlWoKBpb5pqwby6nzNTPZ1PS16fXw3BOYMdf/6A8Nsq4lS+x0+pYTRj
        GUC+kQK64wYiUp8guoJ8SnsSvgqFYrw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1623237617;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DKNzmpUMnKGetW9gWSfXN0fWNO4Ill+y5d1BrTMC3Bc=;
        b=UohKZc2F4Ut9lh/4Tyt67jSW7I9hMjqHQGWVvsSXRh0Vw7JlrrpjYo8yCJSaYDQ6uGjzTJ
        H4WzmfaRgb3bONBg==
Received: from director2.suse.de ([192.168.254.72])
        by imap3-int with ESMTPSA
        id UPnRL/CjwGBTUgAALh3uQQ
        (envelope-from <tzimmermann@suse.de>); Wed, 09 Jun 2021 11:20:16 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, mripard@kernel.org,
        maarten.lankhorst@linux.intel.com, l.stach@pengutronix.de,
        linux+etnaviv@armlinux.org.uk, christian.gmeiner@gmail.com,
        inki.dae@samsung.com, jy0922.shim@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com,
        krzysztof.kozlowski@canonical.com, chunkuang.hu@kernel.org,
        p.zabel@pengutronix.de, matthias.bgg@gmail.com,
        robdclark@gmail.com, sean@poorly.run, airlied@redhat.com,
        kraxel@redhat.com, hjc@rock-chips.com, heiko@sntech.de,
        oleksandr_andrushchenko@epam.com, sumit.semwal@linaro.org,
        christian.koenig@amd.com
Cc:     dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        spice-devel@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org, xen-devel@lists.xenproject.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 5/9] drm/qxl: Remove empty qxl_gem_prime_mmap()
Date:   Wed,  9 Jun 2021 13:20:08 +0200
Message-Id: <20210609112012.10019-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609112012.10019-1-tzimmermann@suse.de>
References: <20210609112012.10019-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The function qxl_gem_prime_mmap() returns an error. The two callers
of gem_prime_mmap are drm_fbdev_fb_mmap() and drm_gem_dmabuf_mmap(),
which both already handle NULL-callbacks with an error code. So clear
gem_prime_mmap in qxl and remove qxl_gem_prime_mmap().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/qxl/qxl_drv.c   | 1 -
 drivers/gpu/drm/qxl/qxl_drv.h   | 2 --
 drivers/gpu/drm/qxl/qxl_prime.c | 6 ------
 3 files changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
index 854e6c5a563f..b3d75ea7e6b3 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.c
+++ b/drivers/gpu/drm/qxl/qxl_drv.c
@@ -281,7 +281,6 @@ static struct drm_driver qxl_driver = {
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_import_sg_table = qxl_gem_prime_import_sg_table,
-	.gem_prime_mmap = qxl_gem_prime_mmap,
 	.fops = &qxl_fops,
 	.ioctls = qxl_ioctls,
 	.irq_handler = qxl_irq_handler,
diff --git a/drivers/gpu/drm/qxl/qxl_drv.h b/drivers/gpu/drm/qxl/qxl_drv.h
index dd6abee55f56..f95885a8bd2b 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.h
+++ b/drivers/gpu/drm/qxl/qxl_drv.h
@@ -434,8 +434,6 @@ struct drm_gem_object *qxl_gem_prime_import_sg_table(
 int qxl_gem_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
 void qxl_gem_prime_vunmap(struct drm_gem_object *obj,
 			  struct dma_buf_map *map);
-int qxl_gem_prime_mmap(struct drm_gem_object *obj,
-				struct vm_area_struct *vma);
 
 /* qxl_irq.c */
 int qxl_irq_init(struct qxl_device *qdev);
diff --git a/drivers/gpu/drm/qxl/qxl_prime.c b/drivers/gpu/drm/qxl/qxl_prime.c
index 0628d1cc91fe..4a10cb0a413b 100644
--- a/drivers/gpu/drm/qxl/qxl_prime.c
+++ b/drivers/gpu/drm/qxl/qxl_prime.c
@@ -73,9 +73,3 @@ void qxl_gem_prime_vunmap(struct drm_gem_object *obj,
 
 	qxl_bo_vunmap(bo);
 }
-
-int qxl_gem_prime_mmap(struct drm_gem_object *obj,
-		       struct vm_area_struct *area)
-{
-	return -ENOSYS;
-}
-- 
2.31.1

