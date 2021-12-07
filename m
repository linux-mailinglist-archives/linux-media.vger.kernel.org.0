Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4761546BB2B
	for <lists+linux-media@lfdr.de>; Tue,  7 Dec 2021 13:34:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236411AbhLGMh7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Dec 2021 07:37:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236409AbhLGMh6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Dec 2021 07:37:58 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6610EC061574
        for <linux-media@vger.kernel.org>; Tue,  7 Dec 2021 04:34:28 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id d24so29319655wra.0
        for <linux-media@vger.kernel.org>; Tue, 07 Dec 2021 04:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ao0QlwnIR0BPrNFzKmnkW6LgKGwtPEdX/Cj9AXAbbyo=;
        b=lFiBNhuCOTWa1JmB8pVxFfIV376b05LFMBtL6k6esixehcvwxOYwCSY1wJ531gxsyI
         1ODDU3bSOCvguGl0n25Wk1Y9Y+URe1PfTrAJ36ANqQLiKDiQUCPhipWUOhrg5Vlr4QqD
         4GrCjm0c5zOlcifmlWUpe9oKRrhdUJ7TH/D4q+OEbzojeVJcX67JZ4vu/mbVzKbhQBLL
         yj2EjbuTupYL0cAGLjzhzO8iOENJfKXjWkDyoFwAfi8N8M4y4YhIaVg/4aAhlzRaBe94
         qwtAOgetxq+4DIcrFm9Nfqzpvht+T2lKmrVo/CLMoWmj6dcMkCUNOug2fcx2ttcpXVqA
         StSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ao0QlwnIR0BPrNFzKmnkW6LgKGwtPEdX/Cj9AXAbbyo=;
        b=rJ4h2QB7z+PzUDU730XdMKGHzYQjximXy1OdNMx+xzKajP/U/Ex/7QnKo71GjkXO2q
         YHzx22PrCFxW9nIxEN7FoGfYn8QCY/IiPrYpmTdRca5RBXZvi5DlVcogF1zIh2kfSibY
         V1jhfm4SO5tnMsdEaDZTePQKzcFs41g/cBy/80HVG5dy3rWyfPgTQGi/+KL6SDq5I3BF
         Q5jUOUo2iV1rXDv5NyqhpFLMxu/i8ZHAKy+WVF0JU08osat0/qfrsuUhGOccBPfBYkqx
         vyTOBfkKD3p8d6g4ncXFBsNopVj41Y5wLBzgTFhCipVAwkC4btka++kdBOfsY4akHGF+
         IrYQ==
X-Gm-Message-State: AOAM533bf8zSQtFMAB8wbunzotupOqfEfHPVglKMVV9DiRSH0Hy5jF9/
        FvyM73Zp7dhTiLoG4hIXnQ0=
X-Google-Smtp-Source: ABdhPJzQ5FO8Kp/E6suVibkttAQSH1UhF+nOw1hpGKlA3Yx/YaL++9C1S6lYcCLgs2UJf88YOoKUaw==
X-Received: by 2002:adf:f990:: with SMTP id f16mr48996757wrr.128.1638880467050;
        Tue, 07 Dec 2021 04:34:27 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
        by smtp.gmail.com with ESMTPSA id f19sm2802203wmq.34.2021.12.07.04.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 04:34:26 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 12/24] dma-buf: finally make dma_resv_excl_fence private
Date:   Tue,  7 Dec 2021 13:33:59 +0100
Message-Id: <20211207123411.167006-13-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207123411.167006-1-christian.koenig@amd.com>
References: <20211207123411.167006-1-christian.koenig@amd.com>
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
index 694716a3d66d..9acceabc9399 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -147,6 +147,23 @@ void dma_resv_fini(struct dma_resv *obj)
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
index cdfbbda6f600..40ac9d486f8f 100644
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

