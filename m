Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD8CD408E31
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 15:31:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241939AbhIMNbO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 09:31:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236024AbhIMNTs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 09:19:48 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25586C0613DF
        for <linux-media@vger.kernel.org>; Mon, 13 Sep 2021 06:17:16 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id t18so14700044wrb.0
        for <linux-media@vger.kernel.org>; Mon, 13 Sep 2021 06:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YErPkwK3P1MRDtjuzNu0YD+XcPHeEcSK9BW/6kjgcgQ=;
        b=aI7u6ePrlaVBwjcvHme3l65TDkeFtzDFReeDD+NIEBaV2b6wP8WVsJNG+Jd6jhGH3H
         IYAI4NTEcxFI3zJZvYzACBhEwp/KTVkyi3/ncV29HGpguPc3QyHWYh+ebbsQlEwR7UJb
         HLav+sYECom69JE+rZDSGGEzpNUqp77Yo/WH4gPCHujy8oX7ANVK6lInVXdnUJptJPx6
         TDKeqhX2F0OhBdvP3qPRD7+8LFc9lu+gm88+bkF5IptseHUcI9wB+teW1jD69Cgpig8w
         5K0I3kxJuqFAxCnFI6DiffGhs1e9dZa56wSVaV96IDS76V4WbsPtOQXEHHymaLTnNiNc
         7Jkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YErPkwK3P1MRDtjuzNu0YD+XcPHeEcSK9BW/6kjgcgQ=;
        b=On+JMV+IVbN93ne5g04bjar8h7Efo1jqMqzJ2MTbxzqxFdMlfYL4Vob6U1I+YQIceg
         Q88plAe6yRgwA30411DDiXXtpqVnmwWEC+2oe+QRsibit7d0Z/BfOhI+UqR2JGL/DEyT
         kfMNsgZjGdFKE/w47TNqdZfo+c4u18MQhTEhVOGWMk8kisqY3qJ1jDxZSngmXbq1UFGF
         uMHX/1/D7bxylkFw/7+WAl0IGPMQK0CKoZtVF0S++zxDg9hd3vCtgLO9unQxrkBirGaF
         M+vaU2afxLFjhaWx7plRnd6fMA+s6OVUpT0MMm+Wj9L0KPHVPfRApDXx7lqRuBSJ8k89
         9Tgw==
X-Gm-Message-State: AOAM533XM75wxiJWgw7Pv9laxMoNM5J/KzqNGCOJkp9JBBe6n05RJDFX
        uCjf71u0FVA9yAZVdzOYrm8=
X-Google-Smtp-Source: ABdhPJxR0j0LPIb7QmV+bkBlSx7RlW4/4SWmjy0z74lyAHxDZk/wGLXvDeVmyCjZkLFBMYX1H/FhaA==
X-Received: by 2002:a5d:4e47:: with SMTP id r7mr12626192wrt.417.1631539034765;
        Mon, 13 Sep 2021 06:17:14 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id h18sm7602834wrb.33.2021.09.13.06.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 06:17:13 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org
Cc:     daniel@ffwll.ch, intel-gfx@lists.freedesktop.org
Subject: [PATCH 02/26] dma-buf: add dma_resv_for_each_fence
Date:   Mon, 13 Sep 2021 15:16:43 +0200
Message-Id: <20210913131707.45639-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210913131707.45639-1-christian.koenig@amd.com>
References: <20210913131707.45639-1-christian.koenig@amd.com>
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
 drivers/dma-buf/dma-resv.c | 38 ++++++++++++++++++++++++++++++++++++++
 include/linux/dma-resv.h   | 18 ++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 213a9b7251ca..8cbccaae169d 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -323,6 +323,44 @@ void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
 }
 EXPORT_SYMBOL(dma_resv_add_excl_fence);
 
+/**
+ * dma_resv_walk - walk over fences in a dma_resv obj
+ * @obj: the dma_resv object
+ * @cursor: cursor to record the current position
+ * @all_fences: true returns also the shared fences
+ * @first: if we should start over
+ *
+ * Return all the fences in the dma_resv object while holding the
+ * dma_resv::lock.
+ */
+struct dma_fence *dma_resv_walk(struct dma_resv *obj,
+				struct dma_resv_cursor *cursor,
+				bool all_fences, bool first)
+{
+	dma_resv_assert_held(obj);
+
+	cursor->is_first = first;
+	if (first) {
+		struct dma_fence *fence;
+
+		cursor->index = -1;
+		cursor->fences = dma_resv_shared_list(obj);
+		cursor->is_exclusive = true;
+
+		fence = dma_resv_excl_fence(obj);
+		if (fence)
+			return fence;
+	}
+
+	if (!all_fences || !cursor->fences ||
+	    ++cursor->index >= cursor->fences->shared_count)
+		return NULL;
+
+	return rcu_dereference_protected(cursor->fences->shared[cursor->index],
+					 dma_resv_held(obj));
+}
+EXPORT_SYMBOL_GPL(dma_resv_walk);
+
 /**
  * dma_resv_walk_unlocked - walk over fences in a dma_resv obj
  * @obj: the dma_resv object
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index f5b91c292ee0..6f9bb7e4c538 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -165,6 +165,21 @@ struct dma_resv_cursor {
 	bool is_exclusive;
 };
 
+/**
+ * dma_resv_for_each_fence - fence iterator
+ * @obj: a dma_resv object pointer
+ * @cursor: a struct dma_resv_cursor pointer
+ * @all_fences: true if all fences should be returned
+ * @fence: the current fence
+ *
+ * Iterate over the fences in a struct dma_resv object while holding the
+ * dma_resv::lock. @all_fences controls if the shared fences are returned as
+ * well.
+ */
+#define dma_resv_for_each_fence(obj, cursor, all_fences, fence)		  \
+	for (fence = dma_resv_walk(obj, cursor, all_fences, true); fence; \
+	     fence = dma_resv_walk(obj, cursor, all_fences, false))
+
 /**
  * dma_resv_for_each_fence_unlocked - fence iterator
  * @obj: a dma_resv object pointer
@@ -399,6 +414,9 @@ void dma_resv_fini(struct dma_resv *obj);
 int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences);
 void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence);
 void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence);
+struct dma_fence *dma_resv_walk(struct dma_resv *obj,
+				struct dma_resv_cursor *cursor,
+				bool first, bool all_fences);
 struct dma_fence *dma_resv_walk_unlocked(struct dma_resv *obj,
 					 struct dma_resv_cursor *cursor,
 					 bool first, bool all_fences);
-- 
2.25.1

