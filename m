Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 180B597968
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2019 14:31:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728278AbfHUMb4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Aug 2019 08:31:56 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:52154 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728239AbfHUMbz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Aug 2019 08:31:55 -0400
Received: by mail-wm1-f66.google.com with SMTP id k1so1947703wmi.1
        for <linux-media@vger.kernel.org>; Wed, 21 Aug 2019 05:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=aBOdo7ngpKvLwB2R8F0YqDeLvUKQK/TUC/pYnwwKah8=;
        b=AT2N1Av231M7+QMYsNQRMtThUPT37JcPbuDiN+n/sf4fodmTNsAnQtRnffYDXw4r+E
         yQcR+oJ4JsOuUxnpTBES197pmFrFncSMBPm0t5qBayyPUaN+NbySpIMmEfcEBykfvt0p
         7Q10n4R//r4hoytphNEjuIW+5IUMQz28kGHx7sLy5MM/A4sDQ23C0r7Hzpz2gsO/h/EN
         lHR+MrsHM6Gwy4pSjXIsK7w0H+TdjjvrNoMZKnEzLwUB0h+sRZy2Mufo9F+l4tyRpIbP
         sI9ZoQELUh8IkUedSed+3/3D/Tklx4KX9IJVn2SaytD3pjm+9ZT4TQZ/vUhdcNH7Lm0T
         b91Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aBOdo7ngpKvLwB2R8F0YqDeLvUKQK/TUC/pYnwwKah8=;
        b=FFFShMKGiYv/yVkzNny8+xZmUi84r57zEcWWakZSJkT85lwwoSMOQ7oXu2VRTu2Vnn
         G1lEb1AB3BaLskzsOUYpTrvrg0gqceE8nJyYgLQtzZrX9PDzRycJ6myd+F5uTI1bl7CZ
         80EramK1H1vFMkwGaEL28crVLW0hz6BwrZywNUXRSzCyJk10JCnNZbhci7ViRFekhHYR
         BgiZWatNUkFPQQnfMHwbd92N2OcwNIq9UTldqavIjBr4iF1JtnRQzel+JifoUPP8wY0z
         des9p3v1zFUayAaANYoEFCMuY/EF4PQf31NUjgn0q912x/8KwzwgiHMdwseuERK6EMdr
         Nwgw==
X-Gm-Message-State: APjAAAV9zL84N4YVioyQ+62Kmt1B2JiycXnWPq0dnRr7EyiRu9ceYrC/
        xyCKvI4BjkcaaPdzL2KHUIopeKCC
X-Google-Smtp-Source: APXvYqwEuIEXphvxpxYjDhq20FOa/v6eaOdT1hVDgfkrSbpNzJBD+iwrLeB+e+ZWQMlBkQWb+tOyIA==
X-Received: by 2002:a1c:f106:: with SMTP id p6mr5432870wmh.148.1566390712855;
        Wed, 21 Aug 2019 05:31:52 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8189:dd33:a934:c4fa])
        by smtp.gmail.com with ESMTPSA id v3sm23084571wrq.34.2019.08.21.05.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2019 05:31:52 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
        daniel.vetter@ffwll.ch, sumit.semwal@linaro.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 04/10] dma-buf: add dma_fence_array_for_each
Date:   Wed, 21 Aug 2019 14:31:41 +0200
Message-Id: <20190821123147.110736-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190821123147.110736-1-christian.koenig@amd.com>
References: <20190821123147.110736-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Makes it easier to extract the fences in a dma_fence_array.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence-array.c | 42 +++++++++++++++++++++++++++++++
 include/linux/dma-fence-array.h   | 24 ++++++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index 314cf0e881d9..887e32e89269 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -265,3 +265,45 @@ bool dma_fence_match_context(struct dma_fence *fence, u64 context)
 	return true;
 }
 EXPORT_SYMBOL(dma_fence_match_context);
+
+/**
+ * dma_fence_array_first - return the first fence in an array
+ * @cursor: cursor for the current position
+ * @array: array with the fences
+ *
+ * Returns the first fence in the array or NULL if the array is empty.
+ * If the array parameter isn't a dma_fence_array return it unmodified.
+ */
+struct dma_fence *dma_fence_array_first(struct dma_fence_array_cursor *cursor,
+					struct dma_fence *array)
+{
+	cursor->array = to_dma_fence_array(array);
+	if (!cursor->array)
+		return array;
+
+	if (!cursor->array->num_fences)
+		return NULL;
+
+	cursor->index = 0;
+	return cursor->array->fences[cursor->index++];
+
+}
+EXPORT_SYMBOL(dma_fence_array_first);
+
+/**
+ * dma_fence_array_next - return the next fence in the array
+ * @cursor: cursor for the current position
+ *
+ * Returns the next fence from the array or NULL if we don't have any more
+ */
+struct dma_fence *dma_fence_array_next(struct dma_fence_array_cursor *cursor)
+{
+	if (!cursor->array)
+		return NULL;
+
+	if (cursor->index >= cursor->array->num_fences)
+		return NULL;
+
+	return cursor->array->fences[cursor->index++];
+}
+EXPORT_SYMBOL(dma_fence_array_next);
diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-array.h
index 35d1d1e7c93b..2a71fd003dfa 100644
--- a/include/linux/dma-fence-array.h
+++ b/include/linux/dma-fence-array.h
@@ -124,4 +124,28 @@ dma_fence_array_create(int num_fences, struct dma_fence **fences, u64 context,
 
 bool dma_fence_match_context(struct dma_fence *fence, u64 context);
 
+/**
+ * struct dma_fence_array_cursor - cursor for the fences in an array
+ */
+struct dma_fence_array_cursor {
+	struct dma_fence_array *array;
+	unsigned int index;
+};
+
+struct dma_fence *dma_fence_array_first(struct dma_fence_array_cursor *cursor,
+					struct dma_fence *array);
+struct dma_fence *dma_fence_array_next(struct dma_fence_array_cursor *cursor);
+
+/**
+ * dma_fence_array_for_each - walk over all fences in a fence array
+ * @fence: the current fence
+ * @cursor: cursor for the walk
+ * @array: potentitally fence array
+ *
+ * Walk over all the fences in the array.
+ */
+#define dma_fence_array_for_each(fence, cursor, array)		\
+	for (fence = dma_fence_array_first(&(cursor), array);	\
+	     fence; fence = dma_fence_array_next(&(cursor)))
+
 #endif /* __LINUX_DMA_FENCE_ARRAY_H */
-- 
2.17.1

