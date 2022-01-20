Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A3C4494EF1
	for <lists+linux-media@lfdr.de>; Thu, 20 Jan 2022 14:28:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235715AbiATN14 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jan 2022 08:27:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235180AbiATN1z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jan 2022 08:27:55 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEF5EC061574
        for <linux-media@vger.kernel.org>; Thu, 20 Jan 2022 05:27:54 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id f202-20020a1c1fd3000000b0034dd403f4fbso10435878wmf.1
        for <linux-media@vger.kernel.org>; Thu, 20 Jan 2022 05:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=hl1UMcxmP8FLB7cw6V/gbH+Ejf4SrQDiUJfaKHttF6Q=;
        b=Txl7wMMQ3BoEO4cPZl65D2wlNQrEaK4pg0+zuA1PPU6G2IraDAOZgenSijzgUfH8ch
         hH4J7nAzlyeNUQ76HSSrQrMW+YztkehT47S4LVl30rX+9pAwQmt8OyQcxh7XyIs2akct
         O6hn5yQm+C/OwbBpSMipNOf0ovonJdoQWRTjij8cj1SiouhPengkWdEX4nrLtFCs6r57
         JpDRp0jBrEU9i7x5uxV+ze4zk3iZ7SX8sHAQ+xmz2+rqF0gn5eWBnFhIusL1EJveprxE
         +PAHBejnZeM/34u3Cn6xt++/px/V6XbWxIeMvwwGpFl6+QLqWiVBhUMIHklmONALkKIj
         a9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hl1UMcxmP8FLB7cw6V/gbH+Ejf4SrQDiUJfaKHttF6Q=;
        b=JdKbuXY95gZ69Lamgr45ddkYcGc47aiwrQcLmS9vpH/d/WjxseLJqQwzyAUIXl5YkQ
         P13OXhJZdwH+YECEsSEAM7LFjy/5wDNusZoA+VfxMxZI5Y+o/LL+2k0oSv+FrsKZPF8H
         VZAxYV6B3mtC9qhVLpGSNnjUF+XpHqaKi8Jj+FwyKorWxuD+HyxTweHTymioFbDpfQta
         USqMGNLsP8Nn4re+fv/8GDp/Ak4wrYHALiwbxmPoPqgMoPqV3ay9pG888Q9RMCjPG3O4
         N3j9+m/GHuOznRrT8HQvbenEQfi6oRLBfnmG4QeQpHvTYua9fOZgHOwi5awqtZ2gb7aE
         chYQ==
X-Gm-Message-State: AOAM530Zqtxf4RdOnn7jVjhR1tbIpUnfVXarXQJbzkVK5npNr9/bjLWN
        vt53VxrlwJTEUDx37xjyZ5c=
X-Google-Smtp-Source: ABdhPJwUUA420JOIPmLu0OB5fMKudNXZNoroit0+VxJhZJ3dVkASmGV6wlLZ7btbcydXz4OaXnNu5w==
X-Received: by 2002:a05:6000:1886:: with SMTP id a6mr29359225wri.158.1642685273502;
        Thu, 20 Jan 2022 05:27:53 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
        by smtp.gmail.com with ESMTPSA id a9sm2658454wmm.32.2022.01.20.05.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jan 2022 05:27:53 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     sumit.semwal@linaro.org, gustavo@padovan.org,
        daniel.vetter@ffwll.ch, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 5/9] dma-buf: Add dma_fence_array_for_each (v2)
Date:   Thu, 20 Jan 2022 14:27:43 +0100
Message-Id: <20220120132747.2348-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120132747.2348-1-christian.koenig@amd.com>
References: <20220120132747.2348-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Christian König <ckoenig.leichtzumerken@gmail.com>

Add a helper to iterate over all fences in a dma_fence_array object.

v2 (Jason Ekstrand)
 - Return NULL from dma_fence_array_first if head == NULL.  This matches
   the iterator behavior of dma_fence_chain_for_each in that it iterates
   zero times if head == NULL.
 - Return NULL from dma_fence_array_next if index > array->num_fences.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Christian König <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/dma-buf/dma-fence-array.c | 27 +++++++++++++++++++++++++++
 include/linux/dma-fence-array.h   | 17 +++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index 4bfbcb885bbc..eb517b3914f7 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -218,3 +218,30 @@ bool dma_fence_match_context(struct dma_fence *fence, u64 context)
 	return true;
 }
 EXPORT_SYMBOL(dma_fence_match_context);
+
+struct dma_fence *dma_fence_array_first(struct dma_fence *head)
+{
+	struct dma_fence_array *array;
+
+	if (!head)
+		return NULL;
+
+	array = to_dma_fence_array(head);
+	if (!array)
+		return head;
+
+	return array->fences[0];
+}
+EXPORT_SYMBOL(dma_fence_array_first);
+
+struct dma_fence *dma_fence_array_next(struct dma_fence *head,
+				       unsigned int index)
+{
+	struct dma_fence_array *array = to_dma_fence_array(head);
+
+	if (!array || index >= array->num_fences)
+		return NULL;
+
+	return array->fences[index];
+}
+EXPORT_SYMBOL(dma_fence_array_next);
diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-array.h
index fec374f69e12..e34dcb0bb462 100644
--- a/include/linux/dma-fence-array.h
+++ b/include/linux/dma-fence-array.h
@@ -61,6 +61,19 @@ to_dma_fence_array(struct dma_fence *fence)
 	return container_of(fence, struct dma_fence_array, base);
 }
 
+/**
+ * dma_fence_array_for_each - iterate over all fences in array
+ * @fence: current fence
+ * @index: index into the array
+ * @head: potential dma_fence_array object
+ *
+ * Test if @array is a dma_fence_array object and if yes iterate over all fences
+ * in the array. If not just iterate over the fence in @array itself.
+ */
+#define dma_fence_array_for_each(fence, index, head)			\
+	for (index = 0, fence = dma_fence_array_first(head); fence;	\
+	     ++(index), fence = dma_fence_array_next(head, index))
+
 struct dma_fence_array *dma_fence_array_create(int num_fences,
 					       struct dma_fence **fences,
 					       u64 context, unsigned seqno,
@@ -68,4 +81,8 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
 
 bool dma_fence_match_context(struct dma_fence *fence, u64 context);
 
+struct dma_fence *dma_fence_array_first(struct dma_fence *head);
+struct dma_fence *dma_fence_array_next(struct dma_fence *head,
+				       unsigned int index);
+
 #endif /* __LINUX_DMA_FENCE_ARRAY_H */
-- 
2.25.1

