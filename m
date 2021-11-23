Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FA7F45A549
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 15:21:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237962AbhKWOYw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Nov 2021 09:24:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237830AbhKWOYw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Nov 2021 09:24:52 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B8FAC061574
        for <linux-media@vger.kernel.org>; Tue, 23 Nov 2021 06:21:44 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id k37-20020a05600c1ca500b00330cb84834fso2428193wms.2
        for <linux-media@vger.kernel.org>; Tue, 23 Nov 2021 06:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EIK2Rv95IimliWtAgRf2dZ+cHmRPtVUYQaZZCSFa3qI=;
        b=qpAC6sKMWV77V3k95KiVNbdd0UySTnLgi0VzWZv9Q/1SL/ZWKpsllwduR/ovq5Dr+J
         ywTgHzTZoIJgyj3ewsHXUd52Lzq9vtLBHP65/iyTjILANi35OpUnB0MS7/X9n9qaluZR
         V0kgzextpuq/SrBT5VTOBXSVJ6PXmByAkcuOy8kCpggQO50erPELeetj7+40NrV9E1EG
         4i6dlCW0c9FlpKe6LZuT/Oe402StZL6CSZuYYEA70wv/UjDtfYYhi3guOwdcvU/NBEc6
         BgvMAjSmJn8fnuXa0Iruw4M5bYZo7qKRc+Xa13ro30whfFd0JJpb1O172tloOWZDQ92R
         7pZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EIK2Rv95IimliWtAgRf2dZ+cHmRPtVUYQaZZCSFa3qI=;
        b=PF09Gx5UQdmDJcomD10hQuwzVikqE+YWqa/YWHXfIVP/kBRtLRBpZAhnjTBtVvVv/w
         FjtJ4TS+dj6MEtF6wKsjNvxdUtAs3ya3rolnkEXPwgZPw/zks5EpglsQ7rz5rGSi8bd9
         F8HLZ3MqbQ/FEPuJHGC5jlXsjdiLd6Xl1k2vtgKsh/DxlxLPShe1ooG2O0ZSbHTHUGv4
         ZHBDoyhHledeWRfx2wj6CvItmBlzSwt18l/iqNNFqj4OPgHaurPNfx4lEGpz8Cw4dO2F
         H6ETpZV/YyzzmNgE3E7sMEJwkuL4KyYSUwfozHsV8/RREK+xIacmxaJpUyvK0efSm2UZ
         2mlQ==
X-Gm-Message-State: AOAM533HGI1qEsOY9zKYZpw6yXzEouZsxPgWAk3XRLrjvANxC6WazWXG
        3hyMPvxsgWDUnfgM9I94bfs=
X-Google-Smtp-Source: ABdhPJwBWMzR4LY8DWWvZwbJbBOfuTy7fXUYMxmrzrxW3z5zk3L6f+uEC9yCYX+eJ8XMwLU9hUdRXg==
X-Received: by 2002:a05:600c:1f17:: with SMTP id bd23mr3678317wmb.57.1637677302713;
        Tue, 23 Nov 2021 06:21:42 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
        by smtp.gmail.com with ESMTPSA id t8sm1645928wmq.32.2021.11.23.06.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 06:21:42 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     sumit.semwal@linaro.org, daniel@ffwll.ch
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 16/26] dma-buf: finally make dma_resv_excl_fence private
Date:   Tue, 23 Nov 2021 15:21:01 +0100
Message-Id: <20211123142111.3885-17-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123142111.3885-1-christian.koenig@amd.com>
References: <20211123142111.3885-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Drivers should never touch this directly.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 17 +++++++++++++++++
 include/linux/dma-resv.h   | 17 -----------------
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index f91ca023b550..539b9b1df640 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -175,6 +175,23 @@ void dma_resv_fini(struct dma_resv *obj)
 }
 EXPORT_SYMBOL(dma_resv_fini);
 
+/**
+ * dma_resv_excl_fence - return the object's exclusive fence
+ * @obj: the reservation object
+ *
+ * Returns the exclusive fence (if any). Caller must either hold the objects
+ * through dma_resv_lock() or the RCU read side lock through rcu_read_lock(),
+ * or one of the variants of each
+ *
+ * RETURNS
+ * The exclusive fence or NULL
+ */
+static inline struct dma_fence *
+dma_resv_excl_fence(struct dma_resv *obj)
+{
+	return rcu_dereference_check(obj->fence_excl, dma_resv_held(obj));
+}
+
 /**
  * dma_resv_shared_list - get the reservation object's shared fence list
  * @obj: the reservation object
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index 082f77b7bc63..062571c04bca 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -412,23 +412,6 @@ static inline void dma_resv_unlock(struct dma_resv *obj)
 	ww_mutex_unlock(&obj->lock);
 }
 
-/**
- * dma_resv_excl_fence - return the object's exclusive fence
- * @obj: the reservation object
- *
- * Returns the exclusive fence (if any). Caller must either hold the objects
- * through dma_resv_lock() or the RCU read side lock through rcu_read_lock(),
- * or one of the variants of each
- *
- * RETURNS
- * The exclusive fence or NULL
- */
-static inline struct dma_fence *
-dma_resv_excl_fence(struct dma_resv *obj)
-{
-	return rcu_dereference_check(obj->fence_excl, dma_resv_held(obj));
-}
-
 void dma_resv_init(struct dma_resv *obj);
 void dma_resv_fini(struct dma_resv *obj);
 int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences);
-- 
2.25.1

