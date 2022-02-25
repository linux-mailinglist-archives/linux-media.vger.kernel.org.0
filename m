Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9FE94C3F17
	for <lists+linux-media@lfdr.de>; Fri, 25 Feb 2022 08:34:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237403AbiBYHea (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Feb 2022 02:34:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231272AbiBYHe3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Feb 2022 02:34:29 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C1CF261482
        for <linux-media@vger.kernel.org>; Thu, 24 Feb 2022 23:33:58 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id s1so6120865edd.13
        for <linux-media@vger.kernel.org>; Thu, 24 Feb 2022 23:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l/9Kn8DIMro5KQ5cQHJ53iCwxNb13sp8neXcQyO5UH4=;
        b=fsqWr9Z1SGRU+M7pEO1mrUt28/apHuCcsfcCbpJAbNkdUWwYsezcRpA1IuYrGKVJaS
         V1H795+330Ty687r4dYp9GoQm0gESlWG2i1I2yTeVneT2NRWUSb5QWBTkMVb6i5GOAEV
         fcdUmLejO6XfWMpHfkqcyDSoQ6eP6OAzKiNfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l/9Kn8DIMro5KQ5cQHJ53iCwxNb13sp8neXcQyO5UH4=;
        b=AoMVkmcfuDbIqskCn0Mnv8sm9BabRJWPg7YsH6J9OgLrHeT3JWbxRhOOGogRmq+t1k
         qpCvQ5ajZ+WbSP9wOZHMQt+Z+xhCB2ckL+eQDVXirz0zb7UExTIP588OUVpd4wJ1nF6E
         3ygx2qVCMfsqPorHS72gpwl6RuHSKdAeLhOKZ5ZSgwYasPBI0JE1XPOG4mcGB7ujQuTU
         6FhLJoT1v8MhRpNxOXvVMQUf0dZPiTmAvKfXVLonz++YZctsmvJl2VqEim5+JDUOMGo+
         11zJdRODS/zE3AEi3PRieZEVYdk92uELF3rLvrJN1/RLkilT9evP3cgJtVPOjTV3XbY/
         krZA==
X-Gm-Message-State: AOAM532Ugdu/xeZozO/CaccGsl/9orxWJHjDC5aJiX7DyrO3dkinEZFQ
        TgUJ4XopI+XBxZqL9AQsQaDUYlEKL7eK7Q==
X-Google-Smtp-Source: ABdhPJxQESFELbwzX1YUYJHYKC0uL3v2ozopjTtnXK/VT/TH3zJ4w2ygo8youOg391P+370tqX3xaQ==
X-Received: by 2002:a05:6402:1914:b0:412:d9ae:f057 with SMTP id e20-20020a056402191400b00412d9aef057mr5881556edz.446.1645774436628;
        Thu, 24 Feb 2022 23:33:56 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id dn14-20020a05640222ee00b00410b88abd6fsm944342edb.45.2022.02.24.23.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 23:33:56 -0800 (PST)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Matthew Brost <matthew.brost@intel.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH] dma-fance: Add dma_fence_assert_in_signalling_section
Date:   Fri, 25 Feb 2022 08:33:51 +0100
Message-Id: <20220225073351.3565619-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Useful for checking for dma-fence signalling annotations since they
don't quite nest as freely as we'd like to.

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Gustavo Padovan <gustavo@padovan.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
---
 drivers/dma-buf/dma-fence.c | 19 +++++++++++++++++++
 include/linux/dma-fence.h   |  2 ++
 2 files changed, 21 insertions(+)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 066400ed8841..2b7c3fc965e6 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -307,6 +307,25 @@ bool dma_fence_begin_signalling(void)
 }
 EXPORT_SYMBOL(dma_fence_begin_signalling);
 
+/**
+ * dma_fence_assert_in_signalling_section - check fence signalling annotations
+ *
+ * Since dma_fence_begin_signalling() and dma_fence_end_signalling() are built
+ * using lockdep annotations they have limitations on how freely they can be
+ * nested. Specifically, they cannot be on both inside and outside of locked
+ * sections, which in practice means the annotations often have to be pushed out
+ * to the top level callers.
+ *
+ * To ensure low-level functions are only called with the correction
+ * annotations, this function can be used to check for that.
+ */
+void dma_fence_assert_in_signalling_section(void)
+{
+	if (!in_atomic())
+		lockdep_assert(lock_is_held(&dma_fence_lockdep_map));
+}
+EXPORT_SYMBOL(dma_fence_assert_in_signalling_section);
+
 /**
  * dma_fence_end_signalling - end a critical DMA fence signalling section
  * @cookie: opaque cookie from dma_fence_begin_signalling()
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 775cdc0b4f24..7179a5692f72 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -356,6 +356,7 @@ dma_fence_get_rcu_safe(struct dma_fence __rcu **fencep)
 
 #ifdef CONFIG_LOCKDEP
 bool dma_fence_begin_signalling(void);
+void dma_fence_assert_in_signalling_section(void);
 void dma_fence_end_signalling(bool cookie);
 void __dma_fence_might_wait(void);
 #else
@@ -363,6 +364,7 @@ static inline bool dma_fence_begin_signalling(void)
 {
 	return true;
 }
+static inline void dma_fence_assert_in_signalling_section(void) {}
 static inline void dma_fence_end_signalling(bool cookie) {}
 static inline void __dma_fence_might_wait(void) {}
 #endif
-- 
2.34.1

