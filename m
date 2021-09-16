Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D96A540D8BE
	for <lists+linux-media@lfdr.de>; Thu, 16 Sep 2021 13:31:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238271AbhIPLc2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Sep 2021 07:32:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238258AbhIPLc2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Sep 2021 07:32:28 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE880C061764
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 04:31:07 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 192-20020a1c04c9000000b002f7a4ab0a49so5630365wme.0
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 04:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pzZPh7XEKFX9DQzQoersnh2LelUn+sP83XNXRaX1Isg=;
        b=cFKsiKGlG/f3eiSwtPbleVuyqrn0pPzIM4OcXD5nXC8MRfH2xZayXCNGMJwpidt5fn
         6sX7NSsk8TCwNLhVtDlNDcw0StcrF4OwN/6HX2VMcoCWr3psAdgH6pC0Ygvp94kGwsu/
         4t2USnodUSc3oGYa6Vf+hfWuL7AHuiDozepdTTZwOl5IpJ9ucTniOKAvXiUj+l+om43m
         2F/ajuVbIMAcrlI19avwyOly20KlNh3enijkzZZm5ICKBzayBJ4VF6g0+LfGUOBBe/s3
         c1oLkrvrxtIcVbnmjatuVIeBQxUThsN6ZyneT6OJP95VDQqgNB2n+rf8Rqq7ErYwF0eH
         xWWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pzZPh7XEKFX9DQzQoersnh2LelUn+sP83XNXRaX1Isg=;
        b=0DbREPFpOKQ5UhIZtbNSw0xSJDBKMRh6AIo5HrpYAS8jpRkYbSB8eyI27Ak/MYCNcA
         n8/L/tDQUhqempmzwiKQK3TLRsKHX9RJxcX3C1V2lPMthGW75dpbzEw6N1nSZWty6l64
         YvwrpPs1DEVTemJR++86+bXaD3+cCXfhXF+y0EK/dGda0ZaY2l8F8WoJwSdlX8kp5DLF
         MqS5dKtRTH3YIVCOX5uyjl1eL89Z29TDGhFwtRYe8Tvr3HEemSKgzVebO/jMAEwvkP/I
         2r48fGr1s/BhGw/dpq4HrHarHbKZi3ixmcVpzO5W9qXyLHsvgUDxJhQt9aOak2iCRR/u
         51/A==
X-Gm-Message-State: AOAM533EUUZ8OBIkvtJ2DMAAGiQNsu1nv6E5AjrfKfWRQIB8XBPgcdn/
        RaI+fGgZ+grlPHSNNL9OybA=
X-Google-Smtp-Source: ABdhPJyitUIgIRzXAmim8/WliKeWbdpvyqFeJqK2QTXfN7K8jT5S9EqdRoSfGLjOHSpocHOx1rsuzQ==
X-Received: by 2002:a05:600c:1c9e:: with SMTP id k30mr4429372wms.74.1631791866397;
        Thu, 16 Sep 2021 04:31:06 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id c17sm3803674wrn.54.2021.09.16.04.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 04:31:06 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 23/26] drm/nouveau: use the new interator in nv50_wndw_prepare_fb v2
Date:   Thu, 16 Sep 2021 13:30:39 +0200
Message-Id: <20210916113042.3631-24-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916113042.3631-1-christian.koenig@amd.com>
References: <20210916113042.3631-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Makes the handling a bit more complex, but avoids the use of
dma_resv_get_excl_unlocked().

v2: add missing rcu_read_lock()/unlock()

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/nouveau/dispnv50/wndw.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index 8d048bacd6f0..0f5cdb897f06 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -539,6 +539,8 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 	struct nouveau_bo *nvbo;
 	struct nv50_head_atom *asyh;
 	struct nv50_wndw_ctxdma *ctxdma;
+	struct dma_resv_iter cursor;
+	struct dma_fence *fence;
 	int ret;
 
 	NV_ATOMIC(drm, "%s prepare: %p\n", plane->name, fb);
@@ -561,7 +563,14 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 			asyw->image.handle[0] = ctxdma->object.handle;
 	}
 
-	asyw->state.fence = dma_resv_get_excl_unlocked(nvbo->bo.base.resv);
+	rcu_read_lock();
+	dma_resv_for_each_fence_unlocked(nvbo->bo.base.resv, &cursor, false,
+					 fence) {
+		/* TODO: We only use the first writer here */
+		asyw->state.fence = fence;
+		break;
+	}
+	rcu_read_unlock();
 	asyw->image.offset[0] = nvbo->offset;
 
 	if (wndw->func->prepare) {
-- 
2.25.1

