Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D03D01EDF2A
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 10:12:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727061AbgFDIMn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 04:12:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727031AbgFDIMm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jun 2020 04:12:42 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03DD8C08C5C5
        for <linux-media@vger.kernel.org>; Thu,  4 Jun 2020 01:12:41 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id c3so5008974wru.12
        for <linux-media@vger.kernel.org>; Thu, 04 Jun 2020 01:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+tjBPalwpvfaI2TJsBD2Z0Z3ZUY/HUiWjYFdKsCw83k=;
        b=gE8sqqdhi+ZYNpSwpwhah5KEVl5ccYRDpPqBoxZhhBcosuxdUUBujJlkR2DqFrVMMb
         SHhTPvm1cFszlQjqvdRcNdZIe628+AaiwXuD9C5umUghpDpDj2u5g6Zm/nnu8nPXkam7
         hk6PoZYcpGdN71cpcxHDgPkUd9FGT9iRwxbMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+tjBPalwpvfaI2TJsBD2Z0Z3ZUY/HUiWjYFdKsCw83k=;
        b=eNwPTXhgE6caNqbwoSmBrAd/gZOW7OUdqM9UwRY2M5Nt6cIxsMhB8hlC/L4oKf5d/q
         7RlUcy7zotwsC7atS8+G+k90r3D2Ehzc7Lb2LTR6VTTFzM7L5tm257o4Jg7TBfNDfHSF
         0dud0VfT1SOBFQVsiI8/erK9wyGKknWSBiGOh8tsc/iG0vQpxigBU+76lNEWSi1Qv+JJ
         Y1VsKJsRmlG7KCFhPuiNGbjlR8sx85sgPq74TAbN81xXk29EiRPLNHySMo4a23WPuYL+
         IQCmIS4kor+ryYqxISYfGfNxXxp8vGUd66s+1IanNx6tiu8v+oBwgctu37WaCQ8jVB4F
         FIlw==
X-Gm-Message-State: AOAM533cOKEgYq0wH3sL+qKdW3HuqrQbayXydm9yhN4i27Ql+AjJqId6
        6+SSfMMw8BmOQw8Mtgh2L96YNg==
X-Google-Smtp-Source: ABdhPJwyNPXbNijhsqAaAQsM5v0tMhjUWaBKp4ap7N+trIcZ19JD/P6xXjcKeG1ExDIrDg6JX8QemA==
X-Received: by 2002:a5d:6144:: with SMTP id y4mr3357789wrt.185.1591258359734;
        Thu, 04 Jun 2020 01:12:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id f11sm6873305wrj.2.2020.06.04.01.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 01:12:39 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-rdma@vger.kernel.org,
        amd-gfx@lists.freedesktop.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel.vetter@intel.com>
Subject: [PATCH 06/18] drm/vblank: Annotate with dma-fence signalling section
Date:   Thu,  4 Jun 2020 10:12:12 +0200
Message-Id: <20200604081224.863494-7-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200604081224.863494-1-daniel.vetter@ffwll.ch>
References: <20200604081224.863494-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is rather overkill since currently all drivers call this from
hardirq (or at least timers). But maybe in the future we're going to
have thread irq handlers and what not, doesn't hurt to be prepared.
Plus this is an easy start for sprinkling these fence annotations into
shared code.

Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: linux-rdma@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/drm_vblank.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 85e5f2db1608..93a5bba5f665 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -24,6 +24,7 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  */
 
+#include <linux/dma-fence.h>
 #include <linux/export.h>
 #include <linux/moduleparam.h>
 
@@ -1908,7 +1909,7 @@ bool drm_handle_vblank(struct drm_device *dev, unsigned int pipe)
 {
 	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
 	unsigned long irqflags;
-	bool disable_irq;
+	bool disable_irq, fence_cookie;
 
 	if (drm_WARN_ON_ONCE(dev, !drm_dev_has_vblank(dev)))
 		return false;
@@ -1916,6 +1917,8 @@ bool drm_handle_vblank(struct drm_device *dev, unsigned int pipe)
 	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
 		return false;
 
+	fence_cookie = dma_fence_begin_signalling();
+
 	spin_lock_irqsave(&dev->event_lock, irqflags);
 
 	/* Need timestamp lock to prevent concurrent execution with
@@ -1928,6 +1931,7 @@ bool drm_handle_vblank(struct drm_device *dev, unsigned int pipe)
 	if (!vblank->enabled) {
 		spin_unlock(&dev->vblank_time_lock);
 		spin_unlock_irqrestore(&dev->event_lock, irqflags);
+		dma_fence_end_signalling(fence_cookie);
 		return false;
 	}
 
@@ -1953,6 +1957,8 @@ bool drm_handle_vblank(struct drm_device *dev, unsigned int pipe)
 	if (disable_irq)
 		vblank_disable_fn(&vblank->disable_timer);
 
+	dma_fence_end_signalling(fence_cookie);
+
 	return true;
 }
 EXPORT_SYMBOL(drm_handle_vblank);
-- 
2.26.2

