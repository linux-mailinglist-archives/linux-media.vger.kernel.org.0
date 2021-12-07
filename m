Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AAE846BB1D
	for <lists+linux-media@lfdr.de>; Tue,  7 Dec 2021 13:34:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236375AbhLGMhs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Dec 2021 07:37:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236372AbhLGMhs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Dec 2021 07:37:48 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5827C061574
        for <linux-media@vger.kernel.org>; Tue,  7 Dec 2021 04:34:17 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id t18so5247551wrg.11
        for <linux-media@vger.kernel.org>; Tue, 07 Dec 2021 04:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=X6ySwafYwpXOWfjGt/R2GvQ9sadn6tgCtihtrrGmV/M=;
        b=n3Gy/ka6VdwVP7M2WyGFmQXCIYUjd6zhDiH94PN4hUlhgnlMtv9QcHoLrguuBrEXhI
         zhTEwwlvW7KyHzd3CEWxkMucvQTjGjDQBBfhdW6zuX9rokj8TiaoDkFfXE72IqE5ZamK
         pi1H27XRVGM1S5lklqNxCY4QR70FYe9gxb9dgozRo4D8JPwoH7OdcJ+qPO1pU8CAP+ri
         OPy7MI/Pbc9f7xhnjqwVcNDQkpddupoZtaRIirzIYARaU4LHZGpCYpO76B0RBX8vwZzM
         onIznBCRx8Ft71ZpHGqrB8E7a9YkoykavkfBaITX2Ujunj/xHOcIhvUuD3MjDRsv3Z0E
         wwYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X6ySwafYwpXOWfjGt/R2GvQ9sadn6tgCtihtrrGmV/M=;
        b=ynVPqV+9A1ywrZ2PJszhWwvV4Jii+ax1mCo7dBySy0SB2vq5fmDecrEKg5AR1gjaPf
         7dGDIIixtXrCN9SGUN8msAuBpmqrzsOJTHdfThdBlMmgsGeoDSarH9GGxujNq/FwqJqy
         6iAbpeEtmQcSguDrw7GAqMn0FU6M2VO/fqLLmQkJnm6LFbfNd1yEiOOdbeN14iBRecEK
         dc0BLCDC4AEZgEhn1nY9J7KDCVfdNpEaf8CBx1/qBEGlurOBsm6AaXtHl4x9x8D/1FAD
         09thEOwwy8PP9T3Dlk3biMQWVhoXc5z3QuKLqOZUeQ94aaf6OnuKt5ICi5syPQqgkHIY
         te1A==
X-Gm-Message-State: AOAM533peoqEzBsIygOXydISGV3bF3Ht4ehpCDx08V+WjcHA0+qSjiSk
        31qSXXLCck8DpAKU8VswTEs=
X-Google-Smtp-Source: ABdhPJwYtW7hTK0a47mT2MpXFFjWvLhSE9MJhTafxEYBh5i6Oc9qOl2cwig0KjhomRynszJC3m7J3A==
X-Received: by 2002:a05:6000:1681:: with SMTP id y1mr50887742wrd.52.1638880456600;
        Tue, 07 Dec 2021 04:34:16 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
        by smtp.gmail.com with ESMTPSA id f19sm2802203wmq.34.2021.12.07.04.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 04:34:16 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 02/24] dma-buf: finally make the dma_resv_list private
Date:   Tue,  7 Dec 2021 13:33:49 +0100
Message-Id: <20211207123411.167006-3-christian.koenig@amd.com>
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
 drivers/dma-buf/dma-resv.c | 26 ++++++++++++++++++++++++++
 include/linux/dma-resv.h   | 26 +-------------------------
 2 files changed, 27 insertions(+), 25 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index a688dbded3d3..a12a3a39f280 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -56,6 +56,19 @@
 DEFINE_WD_CLASS(reservation_ww_class);
 EXPORT_SYMBOL(reservation_ww_class);
 
+/**
+ * struct dma_resv_list - a list of shared fences
+ * @rcu: for internal use
+ * @shared_count: table of shared fences
+ * @shared_max: for growing shared fence table
+ * @shared: shared fence table
+ */
+struct dma_resv_list {
+	struct rcu_head rcu;
+	u32 shared_count, shared_max;
+	struct dma_fence __rcu *shared[];
+};
+
 /**
  * dma_resv_list_alloc - allocate fence list
  * @shared_max: number of fences we need space for
@@ -133,6 +146,19 @@ void dma_resv_fini(struct dma_resv *obj)
 }
 EXPORT_SYMBOL(dma_resv_fini);
 
+/**
+ * dma_resv_shared_list - get the reservation object's shared fence list
+ * @obj: the reservation object
+ *
+ * Returns the shared fence list. Caller must either hold the objects
+ * through dma_resv_lock() or the RCU read side lock through rcu_read_lock(),
+ * or one of the variants of each
+ */
+static inline struct dma_resv_list *dma_resv_shared_list(struct dma_resv *obj)
+{
+	return rcu_dereference_check(obj->fence, dma_resv_held(obj));
+}
+
 /**
  * dma_resv_reserve_shared - Reserve space to add shared fences to
  * a dma_resv.
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index e0be34265eae..3baf2a4a9a0d 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -47,18 +47,7 @@
 
 extern struct ww_class reservation_ww_class;
 
-/**
- * struct dma_resv_list - a list of shared fences
- * @rcu: for internal use
- * @shared_count: table of shared fences
- * @shared_max: for growing shared fence table
- * @shared: shared fence table
- */
-struct dma_resv_list {
-	struct rcu_head rcu;
-	u32 shared_count, shared_max;
-	struct dma_fence __rcu *shared[];
-};
+struct dma_resv_list;
 
 /**
  * struct dma_resv - a reservation object manages fences for a buffer
@@ -440,19 +429,6 @@ dma_resv_excl_fence(struct dma_resv *obj)
 	return rcu_dereference_check(obj->fence_excl, dma_resv_held(obj));
 }
 
-/**
- * dma_resv_shared_list - get the reservation object's shared fence list
- * @obj: the reservation object
- *
- * Returns the shared fence list. Caller must either hold the objects
- * through dma_resv_lock() or the RCU read side lock through rcu_read_lock(),
- * or one of the variants of each
- */
-static inline struct dma_resv_list *dma_resv_shared_list(struct dma_resv *obj)
-{
-	return rcu_dereference_check(obj->fence, dma_resv_held(obj));
-}
-
 void dma_resv_init(struct dma_resv *obj);
 void dma_resv_fini(struct dma_resv *obj);
 int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences);
-- 
2.25.1

