Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F01584979A1
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 08:40:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241886AbiAXHkx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jan 2022 02:40:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235988AbiAXHkw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jan 2022 02:40:52 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88009C06173B
        for <linux-media@vger.kernel.org>; Sun, 23 Jan 2022 23:40:52 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id c2so22290822wml.1
        for <linux-media@vger.kernel.org>; Sun, 23 Jan 2022 23:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=dl1dUYcNTDp2GOm0X9C0j70YZVM11w1ghZ3iu9NNtok=;
        b=H++pXdsUq2N0QRGJum8gg0Y1t9HjPcUAL8BjYobm6XCmowSylvoYqIxWSzNkep2I+X
         572mKZoDd305g8tzdxrgrSTFlgkzoa+UB0AJaDI/K8WLOBKR4BBLkp2GtPF+GRJh16DW
         rRsyC5TCPibtzuM3he477LqBlMGRX4x92gtuYHtV6SpbHebvHI3zeA+oL2unBZu0wJZq
         /FB0BlH58IqSHO3V6435DEVHCSw7428W8Thm1VAoVRUY4E18jnrp9iEY9wlUlhugZvDY
         E/9HfKlSd2GXzQyZ4s8yyczU2nribKFSSvlfxccEgyWqrcr2pkUjoqEkgNiix23DPWsc
         a8Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dl1dUYcNTDp2GOm0X9C0j70YZVM11w1ghZ3iu9NNtok=;
        b=bsgi5wR4tNMSPVVjTuN1vM475bnY96Cl7lUqSf49C5qMBCqqI3z2SMJrFEPBeMbxr+
         UFodLT9oBxde7OoNoQ4rT1pj8qq1ll2UHi0qP4tKvsQxLkLPhK9cp11sw9QCsCHoysVt
         muLp0009vqrWwNIELnrgOyblGp8hcz4ITB1Hr8JexCJmvzKc7wThy+CMCzoLbUjbTSiV
         GW5p+/3R5aMigTtLCHy149D5As8s50SQE2/ycX6R6ieobnBb8OZJFvRpjXgn3FnpHm/k
         XXKky0Hs13sUmxXYr5rIMasdATNwkjfbRHs/CcpeOHS3F4Quz3Tv4zDr1jR/QZv5spl0
         Wl1g==
X-Gm-Message-State: AOAM533PV3nwWKPmbVPDzJBGGDslKSReOluKTcTqN+oafrOR4ZJb3GlY
        TEqs3WL3LVn9G5LQs6PA89E=
X-Google-Smtp-Source: ABdhPJy/Wnk6fYE1mYGlQVbnJ0NItvaQnYWhtE9i8fY/XOTtQFLywCS0XkfQzd06LyyQybG+YfTVNA==
X-Received: by 2002:a05:600c:2042:: with SMTP id p2mr592461wmg.167.1643010051206;
        Sun, 23 Jan 2022 23:40:51 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
        by smtp.gmail.com with ESMTPSA id u15sm516370wrs.17.2022.01.23.23.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 23:40:50 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     thomas.hellstrom@linux.intel.com, sumit.semwal@linaro.org,
        gustavo@padovan.org, daniel.vetter@ffwll.ch,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 5/9] dma-buf: Add dma_fence_array_for_each (v2)
Date:   Mon, 24 Jan 2022 08:40:42 +0100
Message-Id: <20220124074046.4865-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124074046.4865-1-christian.koenig@amd.com>
References: <20220124074046.4865-1-christian.koenig@amd.com>
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
index cb1bacb5a42b..52b85d292383 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -219,3 +219,30 @@ bool dma_fence_match_context(struct dma_fence *fence, u64 context)
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

