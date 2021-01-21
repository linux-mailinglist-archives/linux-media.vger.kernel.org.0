Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EC142FEEDD
	for <lists+linux-media@lfdr.de>; Thu, 21 Jan 2021 16:33:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732577AbhAUPbz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jan 2021 10:31:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733020AbhAUPbk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jan 2021 10:31:40 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1D0FC061793
        for <linux-media@vger.kernel.org>; Thu, 21 Jan 2021 07:30:09 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id a12so2147332wrv.8
        for <linux-media@vger.kernel.org>; Thu, 21 Jan 2021 07:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Gwp+mti/6unhnftOwEo6BpxjLR5MA6bqIJ8IUPn3cOs=;
        b=kMtnYpXoQilXJI5sJqSPob2bWQ55p5+duu6yonvEpHwrxCiLYrkz9LoR6T4Y1baDPd
         FGJf2OlyKMX3Z7fL7ZJe2b1Lapkr2531bNnpViLJ08xVV0OHJYCKwI2R9nwqEwb1t3BP
         RqQufrhio3x2IOAlgGI4AkmTTAcJHol406C4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gwp+mti/6unhnftOwEo6BpxjLR5MA6bqIJ8IUPn3cOs=;
        b=VojSnmX6a375aVnUZQ0a7ZqyAX3P2s2X9Ik/x7PAf7KkfZ941HIWcQLhcjFCNzzA6v
         2CnULBhZQu2hSBOWEyOQKNVk5g4a0oyN2gr3S+40EF9d0M3wOPz7db3soNmgygrKu5Lo
         Kt5Tk6L6cRofXy2qf3lhznJlrx7Sdb+DKQavLEFWD8te0nh7yNHpTYNUyTWaNhaMrL/v
         wVAZCibHSyR2tfuRa7PZbAlXMfd40MhayDXfD8VUmcghJybEaIUJgKgq/RFJVLq1O5Hc
         41/fD/bGBIbLhddUjCMR8D1ZBcogWpAa/fVPUbgIRUSE2AS7OOqfCUm5WUpYxDYdQE5e
         XjNA==
X-Gm-Message-State: AOAM533/Kgxd6iYO9aTKUXppbBfQMOTyw8kiDkx1Gw/C3+trlsH9GFPr
        HpZXXJFZ6wvH5EmdARAGSyX/fQ==
X-Google-Smtp-Source: ABdhPJy6GorVysk+oFoqONV7oZt+wQ1tAaWUjwMiKJzGDE0nLgBRPSvxY4+1neq9zorcHYOHV6OOMA==
X-Received: by 2002:a5d:440a:: with SMTP id z10mr8270wrq.266.1611243008784;
        Thu, 21 Jan 2021 07:30:08 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id f14sm8269866wre.69.2021.01.21.07.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 07:30:08 -0800 (PST)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel.vetter@intel.com>
Subject: [PATCH 03/11] drm/vblank: Annotate with dma-fence signalling section
Date:   Thu, 21 Jan 2021 16:29:51 +0100
Message-Id: <20210121152959.1725404-4-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210121152959.1725404-1-daniel.vetter@ffwll.ch>
References: <20210121152959.1725404-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
index 30912d8f82a5..f2aeb9bf325f 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -24,6 +24,7 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  */
 
+#include <linux/dma-fence.h>
 #include <linux/export.h>
 #include <linux/kthread.h>
 #include <linux/moduleparam.h>
@@ -1922,7 +1923,7 @@ bool drm_handle_vblank(struct drm_device *dev, unsigned int pipe)
 {
 	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
 	unsigned long irqflags;
-	bool disable_irq;
+	bool disable_irq, fence_cookie;
 
 	if (drm_WARN_ON_ONCE(dev, !drm_dev_has_vblank(dev)))
 		return false;
@@ -1930,6 +1931,8 @@ bool drm_handle_vblank(struct drm_device *dev, unsigned int pipe)
 	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
 		return false;
 
+	fence_cookie = dma_fence_begin_signalling();
+
 	spin_lock_irqsave(&dev->event_lock, irqflags);
 
 	/* Need timestamp lock to prevent concurrent execution with
@@ -1942,6 +1945,7 @@ bool drm_handle_vblank(struct drm_device *dev, unsigned int pipe)
 	if (!vblank->enabled) {
 		spin_unlock(&dev->vblank_time_lock);
 		spin_unlock_irqrestore(&dev->event_lock, irqflags);
+		dma_fence_end_signalling(fence_cookie);
 		return false;
 	}
 
@@ -1968,6 +1972,8 @@ bool drm_handle_vblank(struct drm_device *dev, unsigned int pipe)
 	if (disable_irq)
 		vblank_disable_fn(&vblank->disable_timer);
 
+	dma_fence_end_signalling(fence_cookie);
+
 	return true;
 }
 EXPORT_SYMBOL(drm_handle_vblank);
-- 
2.30.0

