Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19257188B93
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2020 18:06:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726760AbgCQRGO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Mar 2020 13:06:14 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40603 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726388AbgCQRGL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Mar 2020 13:06:11 -0400
Received: by mail-wm1-f68.google.com with SMTP id z12so62552wmf.5
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2020 10:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X6QHkzV5BBkFfgyNZs6t/GKJbiMk0jnjw8C1dAu/YqA=;
        b=hxJgJ/CsEzZ4gWXbhwVkCscaWC4g9ZHYHHOoCzpnECMslLCAGScgK7zGzJV3JxKcgy
         0nqrSDECdp4yCB6zMNDu+pqFodd+/KOYXXn/AyCcEAmjnSzChD6YexgVL9wDssuvgft0
         G5LXQyTe0arN/FwTIgny0CU7fk+c4HU+frngE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X6QHkzV5BBkFfgyNZs6t/GKJbiMk0jnjw8C1dAu/YqA=;
        b=rH2roOWh/kvbiYi1OEhGE4Sgam3lhciavSNhvgCYRckedrnx21W9S0fXm+145FoEOD
         IyFuSJFA7KmCSN0qAG+JVgzh2LJXkchSaBko5QuwMlSKxXzdn1N81R73uysXGp1fDFN+
         fMoMbQ0GpyzhV3FbN/64MGmo/wem9RHcV05IQ/MrudtU/gyilC/MCIPfUya2PkMLHJo/
         KgAHb1+1E7XztCxV6miycA/ddoaHg350alcDJrjw9tgtQGvbj6DPhegUoffGHPFf7+TF
         hIpF+0lxqC4heZa4+NOvj6qaj35SAR2FOPjlbtI7zHq2Uaj1PKgMz8jZ3fsBz4vKmKye
         lmXg==
X-Gm-Message-State: ANhLgQ14eMJ4yJJQBhClgKPQoXYLcpFqtH2c8hJ+OMvZJinwTcHofrc+
        l69tXKu7bb+WXzVn/ylviAKxGQ==
X-Google-Smtp-Source: ADFU+vtEgUB27vopeq8X2Q5eJtXEH8LMvVllU0OTEgK/JvAgmr4x4sQcJhvU6XRVrE6Zq2zfHcOSww==
X-Received: by 2002:a05:600c:2105:: with SMTP id u5mr220153wml.163.1584464768185;
        Tue, 17 Mar 2020 10:06:08 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id x17sm61790wmi.28.2020.03.17.10.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2020 10:06:07 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, Joe Perches <joe@perches.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Daniel Vetter <daniel.vetter@intel.com>
Subject: [PATCH] MAINTAINERS: Better regex for dma_buf|fence|resv
Date:   Tue, 17 Mar 2020 18:06:02 +0100
Message-Id: <20200317170602.1021982-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We're getting some random other stuff that we're not relly interested
in, so match only word boundaries. Also avoid the capture group while
at it.

Suggested by Joe Perches.

Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: Joe Perches <joe@perches.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
v2: No single quotes in MAINTAINERS (Joe)
---
 MAINTAINERS                   |  2 +-
 drivers/gpu/drm/drm_managed.c | 27 +++++++++++++++++----------
 include/drm/drm_managed.h     |  2 +-
 3 files changed, 19 insertions(+), 12 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3005be638c2c..ed6088a01bfe 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5025,7 +5025,7 @@ F:	include/linux/dma-buf*
 F:	include/linux/reservation.h
 F:	include/linux/*fence.h
 F:	Documentation/driver-api/dma-buf.rst
-K:	dma_(buf|fence|resv)
+K:	\bdma_(?:buf|fence|resv)\b
 T:	git git://anongit.freedesktop.org/drm/drm-misc
 
 DMA-BUF HEAPS FRAMEWORK
diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
index 5148ef786c3b..c256c9679eb5 100644
--- a/drivers/gpu/drm/drm_managed.c
+++ b/drivers/gpu/drm/drm_managed.c
@@ -52,6 +52,12 @@ struct drmres {
 	u8 __aligned(ARCH_KMALLOC_MINALIGN) data[];
 };
 
+static void free_dr(struct drmres *dr)
+{
+	kfree_const(dr->node.name);
+	kfree(dr);
+}
+
 void drm_managed_release(struct drm_device *dev)
 {
 	struct drmres *dr, *tmp;
@@ -65,13 +71,13 @@ void drm_managed_release(struct drm_device *dev)
 			dr->node.release(dev, dr->node.size ? *(void **)&dr->data : NULL);
 
 		list_del(&dr->node.entry);
-		kfree(dr);
+		free_dr(dr);
 	}
 	drm_dbg_drmres(dev, "drmres release end\n");
 }
 
 /*
- * Always inline so that kmallc_track_caller tracks the actual interesting
+ * Always inline so that kmalloc_track_caller tracks the actual interesting
  * caller outside of drm_managed.c.
  */
 static __always_inline struct drmres * alloc_dr(drmres_release_t release,
@@ -120,7 +126,7 @@ static void add_dr(struct drm_device *dev, struct drmres *dr)
 /**
  * drmm_add_final_kfree - add release action for the final kfree()
  * @dev: DRM device
- * @parent: pointer to the kmalloc allocation containing @dev
+ * @container: pointer to the kmalloc allocation containing @dev
  *
  * Since the allocation containing the struct &drm_device must be allocated
  * before it can be initialized with drm_dev_init() there's no way to allocate
@@ -129,12 +135,13 @@ static void add_dr(struct drm_device *dev, struct drmres *dr)
  * will be released in the final drm_dev_put() for @dev, after all other release
  * actions installed through drmm_add_action() have been processed.
  */
-void drmm_add_final_kfree(struct drm_device *dev, void *parent)
+void drmm_add_final_kfree(struct drm_device *dev, void *container)
 {
 	WARN_ON(dev->managed.final_kfree);
-	WARN_ON(dev < (struct drm_device *) parent);
-	WARN_ON(dev + 1 >= (struct drm_device *) (parent + ksize(parent)));
-	dev->managed.final_kfree = parent;
+	WARN_ON(dev < (struct drm_device *) container);
+	WARN_ON(dev + 1 >=
+		(struct drm_device *) (container + ksize(container)));
+	dev->managed.final_kfree = container;
 }
 EXPORT_SYMBOL(drmm_add_final_kfree);
 
@@ -154,7 +161,7 @@ int __drmm_add_action(struct drm_device *dev,
 		return -ENOMEM;
 	}
 
-	dr->node.name = name;
+	dr->node.name = kstrdup_const(name, GFP_KERNEL);
 	if (data) {
 		void_ptr = (void **)&dr->data;
 		*void_ptr = data;
@@ -212,7 +219,7 @@ void drmm_remove_action(struct drm_device *dev,
 	if (WARN_ON(!dr))
 		return;
 
-	kfree(dr);
+	free_dr(dr);
 }
 EXPORT_SYMBOL(drmm_remove_action);
 
@@ -300,6 +307,6 @@ void drmm_kfree(struct drm_device *dev, void *data)
 	if (WARN_ON(!dr_match))
 		return;
 
-	kfree(dr_match);
+	free_dr(dr_match);
 }
 EXPORT_SYMBOL(drmm_kfree);
diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
index af152cfb173c..e4021484c78d 100644
--- a/include/drm/drm_managed.h
+++ b/include/drm/drm_managed.h
@@ -51,7 +51,7 @@ void drmm_remove_action(struct drm_device *dev,
 			drmres_release_t action,
 			void *data);
 
-void drmm_add_final_kfree(struct drm_device *dev, void *parent);
+void drmm_add_final_kfree(struct drm_device *dev, void *container);
 
 void *drmm_kmalloc(struct drm_device *dev, size_t size, gfp_t gfp) __malloc;
 
-- 
2.25.1

