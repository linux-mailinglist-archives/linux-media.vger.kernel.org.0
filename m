Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D976540F7A6
	for <lists+linux-media@lfdr.de>; Fri, 17 Sep 2021 14:35:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244187AbhIQMgo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Sep 2021 08:36:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244176AbhIQMgl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Sep 2021 08:36:41 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D150C061764
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 05:35:19 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id i23so14966408wrb.2
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 05:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Hq6P+apu5QddcJBxT2CG/al9Lr42cPbE+iNSMYU+UVY=;
        b=amvRmOwHV67bbo1i+CVbkv10A+JbdSkOSB1vD0Q1i6Fx+68k/VvP9QGuBbtA06pg9B
         9h/qsezNPrrjHikRUslbltcjZ1ODeSAOCjnY8h7trNOvVO14eqAT5nTy4uW/qJnB9NSq
         NDHp14nzFIwrG1ib5yXZLdkrV12J3+E3WisTbv2avlR7RPEdh0nmi9gE76xBfekVkGIV
         djOHOKL/coO1fqbtMScS5VlQhPuH/x1Aa0twErApdU5OQvwNm6NNkNsi2RAEBrz5kOvh
         iXNIjU4SsLTkwoyr/zV0zv1191nCM78wB4rYUiyg7QwI6XT3LSVohzWBYjdZLpJOK3yn
         oIKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Hq6P+apu5QddcJBxT2CG/al9Lr42cPbE+iNSMYU+UVY=;
        b=cr/zp18cJlyv69qbI1lV1Nhazgki2zktb13hTI5baDjy4WqUJY8ID++1YFNsCriOfV
         XDO1k42r1ikczL3x7yG5XNpM0fPSGT0qO1rhYkDObgssbBNyPSuRHXa3zFO6K0TBIhHK
         TbMRa40/y1nwPRgA5cLxif0kUnhmfE6g76qfy1isHB5M8CZZG37HOxCX03fCd13mPXow
         6lxzWoUYe53vTxptQRkedtmMY2I0lK/CpIN8wrtsA9/3YLUOH5yj1ZmGtdahlRimhz2V
         NQE+7hSTb3cXTvyjOUrIuNuwQgght40tgHKJCVrvdfHRRsUVJhltqJ4BiJkMSg1rXNX6
         K/KA==
X-Gm-Message-State: AOAM533uVMaVPdOeGveXcW3BB7Hy3f48BxHIabZrjf3eFHS1RUzIfU/M
        okKd7d5VRRHsMo//Sng/Xjg=
X-Google-Smtp-Source: ABdhPJznMU/ayLHx4F7nt7nhyCxToln+2iLehyrTsiU79E0Izma7IDO7C0N5XoW+cItVQWTWHK5pVQ==
X-Received: by 2002:a5d:4d92:: with SMTP id b18mr11979933wru.245.1631882117877;
        Fri, 17 Sep 2021 05:35:17 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id l21sm6122049wmh.31.2021.09.17.05.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 05:35:17 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch
Subject: [PATCH 02/26] dma-buf: add dma_resv_for_each_fence
Date:   Fri, 17 Sep 2021 14:34:49 +0200
Message-Id: <20210917123513.1106-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210917123513.1106-1-christian.koenig@amd.com>
References: <20210917123513.1106-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A simpler version of the iterator to be used when the dma_resv object is
locked.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 33 +++++++++++++++++++++++++++++++++
 include/linux/dma-resv.h   | 17 +++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 3e77cad2c9d4..a3c79a99fb44 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -384,6 +384,39 @@ struct dma_fence *dma_resv_iter_walk_unlocked(struct dma_resv_iter *cursor,
 }
 EXPORT_SYMBOL_GPL(dma_resv_iter_walk_unlocked);
 
+/**
+ * dma_resv_iter_walk - walk over fences in a dma_resv obj
+ * @cursor: cursor to record the current position
+ * @first: if we should start over
+ *
+ * Return all the fences in the dma_resv object while holding the
+ * dma_resv::lock.
+ */
+struct dma_fence *dma_resv_iter_walk(struct dma_resv_iter *cursor, bool first)
+{
+	dma_resv_assert_held(cursor->obj);
+
+	cursor->is_first = first;
+	if (first) {
+		struct dma_fence *fence;
+
+		cursor->index = -1;
+		cursor->fences = dma_resv_shared_list(cursor->obj);
+
+		fence = dma_resv_excl_fence(cursor->obj);
+		if (fence)
+			return fence;
+	}
+
+	if (!cursor->all_fences || !cursor->fences ||
+	    ++cursor->index >= cursor->fences->shared_count)
+		return NULL;
+
+	return rcu_dereference_protected(cursor->fences->shared[cursor->index],
+					 dma_resv_held(cursor->obj));
+}
+EXPORT_SYMBOL_GPL(dma_resv_iter_walk);
+
 /**
  * dma_resv_copy_fences - Copy all fences from src to dst.
  * @dst: the destination reservation object
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index 693d16117153..8c968f8c9d33 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -179,6 +179,7 @@ struct dma_resv_iter {
 
 struct dma_fence *dma_resv_iter_walk_unlocked(struct dma_resv_iter *cursor,
 					      bool first);
+struct dma_fence *dma_resv_iter_walk(struct dma_resv_iter *cursor, bool first);
 
 /**
  * dma_resv_iter_begin - initialize a dma_resv_iter object
@@ -233,6 +234,22 @@ static inline bool dma_resv_iter_is_exclusive(struct dma_resv_iter *cursor)
 	for (fence = dma_resv_iter_walk_unlocked(cursor, true);		\
 	     fence; fence = dma_resv_iter_walk_unlocked(cursor, false))
 
+/**
+ * dma_resv_for_each_fence - fence iterator
+ * @cursor: a struct dma_resv_iter pointer
+ * @obj: a dma_resv object pointer
+ * @all_fences: true if all fences should be returned
+ * @fence: the current fence
+ *
+ * Iterate over the fences in a struct dma_resv object while holding the
+ * dma_resv::lock. @all_fences controls if the shared fences are returned as
+ * well. The cursor initialisation is part of the iterator.
+ */
+#define dma_resv_for_each_fence(cursor, obj, all_fences, fence)	\
+	for (dma_resv_iter_begin(cursor, obj, all_fences),	\
+	     fence = dma_resv_iter_walk(cursor, true); fence;	\
+	     fence = dma_resv_iter_walk(cursor, false))
+
 #define dma_resv_held(obj) lockdep_is_held(&(obj)->lock.base)
 #define dma_resv_assert_held(obj) lockdep_assert_held(&(obj)->lock.base)
 
-- 
2.25.1

