Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 290A7461642
	for <lists+linux-media@lfdr.de>; Mon, 29 Nov 2021 14:25:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240573AbhK2N3K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Nov 2021 08:29:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377842AbhK2N1J (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Nov 2021 08:27:09 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC968C09B059
        for <linux-media@vger.kernel.org>; Mon, 29 Nov 2021 04:07:09 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id u1so36211119wru.13
        for <linux-media@vger.kernel.org>; Mon, 29 Nov 2021 04:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X6ySwafYwpXOWfjGt/R2GvQ9sadn6tgCtihtrrGmV/M=;
        b=UeZryZJHfTmF8fPhMaF6TBuRW/W96jpGtczNhEPhy1TYcEbhpyZSwD0kUioV/HHryK
         LFEL6CI2FTynk+RGLVIunP2cldCN8EFuB0S8nGuYB5TtBukEaWa44B12cfKAopZgn4mU
         e+Ma0ud5GWGG0xHNn6ALSyUy8tD0Sdck2FyxeqGSIAMpzllXtOdxVQmixwAgTArdZpDK
         q0h+dS2DoRCWyUmQeNAXWiSCIXlnEiBRbeLZrFzg6odhr4EMPMoUhan3If2f5nHdLl6Z
         wAYJ8Yng0qGxR+xvEYsl8EvjOEQ+Ut8bRfmEWKPe5sAW/sYmOC5s5haH0RPPFg8fZVom
         1bjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X6ySwafYwpXOWfjGt/R2GvQ9sadn6tgCtihtrrGmV/M=;
        b=x+QqjcoUzYKPg0x0+8F7nAs64jeqJeTeXSEMwbLHAsujxLmpEpI/TMmcNuXQe7ODom
         B8/EuON8Dtw9C2XJF3Vypa8e7qlAjhS69NJW/xDe73ao71yf0JnkL7FwNkk0bLWTiPLa
         Dy9MNiuCFO6HKZVQPMyUsg6rUKHGBgyZALl0Smv1dBEe4FK5+dRmCuuvyafuupuDXoyJ
         qKgVlP+V4+d275SldKVrGjruF2LZR3GVk2yIIJaahyBkf5gExKYmlHbnyEykJ5hX7FE5
         1JKBa/GnfZ/AuZOkwOAX5jiGGFWKNdjVWAvley9O0Rdu4hQIyczVCCzm4aPz4bV21qDV
         TioA==
X-Gm-Message-State: AOAM532W37K6DWeIZprG3FGntwoUkdioknhhijkN6L5v86GocNI1HL7p
        krw362uJ+bwO1XGvl4L3tO8=
X-Google-Smtp-Source: ABdhPJwsfjTSI+Z+n7IWuo7CoBW7/ZRoSaoue71ExheG8op170QO+gs/hv21daWUTwzXUtMnI0feIg==
X-Received: by 2002:a05:6000:2ae:: with SMTP id l14mr33386653wry.142.1638187628520;
        Mon, 29 Nov 2021 04:07:08 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
        by smtp.gmail.com with ESMTPSA id b6sm20415234wmq.45.2021.11.29.04.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 04:07:08 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 06/28] dma-buf: finally make the dma_resv_list private
Date:   Mon, 29 Nov 2021 13:06:37 +0100
Message-Id: <20211129120659.1815-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129120659.1815-1-christian.koenig@amd.com>
References: <20211129120659.1815-1-christian.koenig@amd.com>
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

