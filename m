Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E97D180EAE
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2020 04:44:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728103AbgCKDoM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 23:44:12 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:42372 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727659AbgCKDoJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 23:44:09 -0400
Received: by mail-pf1-f194.google.com with SMTP id x2so124820pfn.9
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2020 20:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P16W7ep8HpZEZbf2VCVYHJ7H+KUUPSbN1YkIr+6sSlQ=;
        b=tCu4TDguooR4tfYyACvCoI7MEVLwPSOiIShWk5/IPARU5TQg0GCHpx5pvxZfZ/2jdb
         vz0gO9H8hR1jEQgMkpKTiBJoiS7EtJ5+Re21/zT/7+dEqFcH4QhtEq7iklHDQz8aZ4ED
         h5o+fe9jj8aLNJTdEiFpmQESnjguXQE+DxAy48m+ri2NqUj0ck/EJ53Od44WbappO0u6
         M5PMHUWsJ1AUzq32iKUreC8B7vS4OMjdorltjcDguKGnPO99on/KtQaiHpEBS1en5UC6
         brO2nCR/2wZiFp6/kxIWfN0gQg4kxueOlrX2kwHyBurpODi7jr2aWxqMP0R/7BccEPV3
         ysWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P16W7ep8HpZEZbf2VCVYHJ7H+KUUPSbN1YkIr+6sSlQ=;
        b=fQGEK1DyMFHvI0uoOXT/PrqQtwjbpkj6nQVwWAfMGxyt7kbC3S/kN14YgdLRuejcsT
         zbCrLnmeTSMMQHU5BFSM6bSECCHlPFca0R2Zp8dx+VVb324/jcrpsET3qg8bk7xZO6Fy
         wtx1WXK81OjeNQfHx2TIbdVm7aA7gxRBZa5QeEt1EKMv2f7xhv4U+PZMNLh0+birMqpY
         v8n04oKBaKVo3+1L2C681gwsw8REzQ2PvhFh7nYqHQVX/1ydtTR30+X8j5bTN9uAY+Zj
         jFOCwAtz3hXeiqDlmR8ivHWWWeJ+1l85PGIqFEmdr0aN9scwnOZy5cnquuTxSHPhEQvZ
         cTJQ==
X-Gm-Message-State: ANhLgQ2aP7mr9ULGe5uZpLyY0aJbqhxJgRniqNeSRGubz+3CKAj/VbRW
        7zlRo5deWOZ+RdPi490Dv9dbAQ==
X-Google-Smtp-Source: ADFU+vuNjXuDPqhg8zCHX7akIbl+E1cdU/rjV0v8i4t9fu91z6NCzwwYTmCz8DLIFQqRHKFy7riJrw==
X-Received: by 2002:a63:7e1a:: with SMTP id z26mr900050pgc.226.1583898247079;
        Tue, 10 Mar 2020 20:44:07 -0700 (PDT)
Received: from omlet.com ([2605:6000:1026:c273::ce4])
        by smtp.gmail.com with ESMTPSA id bb13sm3650846pjb.43.2020.03.10.20.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 20:44:06 -0700 (PDT)
From:   Jason Ekstrand <jason@jlekstrand.net>
Cc:     airlied@redhat.com, christian.koenig@amd.com, jessehall@google.com,
        jajones@nvidia.com, daniels@collabora.com, hoegsberg@google.com,
        daniel.vetter@ffwll.ch, bas@basnieuwenhuizen.nl,
        =?UTF-8?q?Christian=20K=C3=B6nig?= 
        <ckoenig.leichtzumerken@gmail.com>,
        Jason Ekstrand <jason@jlekstrand.net>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Richard Fontana <rfontana@redhat.com>,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Hackmann <ghackmann@google.com>,
        Chenbo Feng <fengc@google.com>, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dma-buf: add dma_fence_array_for_each (v2)
Date:   Tue, 10 Mar 2020 22:43:46 -0500
Message-Id: <20200311034351.1275197-1-jason@jlekstrand.net>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200303190318.522103-1-jason@jlekstrand.net>
References: <20200303190318.522103-1-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
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
---
 drivers/dma-buf/dma-fence-array.c | 27 +++++++++++++++++++++++++++
 include/linux/dma-fence-array.h   | 17 +++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index d3fbd950be94..2ac1afc697d0 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -201,3 +201,30 @@ bool dma_fence_match_context(struct dma_fence *fence, u64 context)
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
index 303dd712220f..588ac8089dd6 100644
--- a/include/linux/dma-fence-array.h
+++ b/include/linux/dma-fence-array.h
@@ -74,6 +74,19 @@ to_dma_fence_array(struct dma_fence *fence)
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
@@ -81,4 +94,8 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
 
 bool dma_fence_match_context(struct dma_fence *fence, u64 context);
 
+struct dma_fence *dma_fence_array_first(struct dma_fence *head);
+struct dma_fence *dma_fence_array_next(struct dma_fence *head,
+				       unsigned int index);
+
 #endif /* __LINUX_DMA_FENCE_ARRAY_H */
-- 
2.24.1

