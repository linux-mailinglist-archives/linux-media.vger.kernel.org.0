Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 236E5517499
	for <lists+linux-media@lfdr.de>; Mon,  2 May 2022 18:38:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386321AbiEBQla (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 May 2022 12:41:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386332AbiEBQlQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 May 2022 12:41:16 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26DB511A26
        for <linux-media@vger.kernel.org>; Mon,  2 May 2022 09:37:39 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id p189so8550700wmp.3
        for <linux-media@vger.kernel.org>; Mon, 02 May 2022 09:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8ZMKLCUiF3qKPGX/LGoVOBpR7s+bcNprDSVbEKMvDkc=;
        b=Jp7rT8vS95BqwTwX7NsyZ5WkldjBFw8Wz1EkLvh1Kl2SA7MHWkTMAB/rlyQ3KG3v4n
         buaPRJHFD0KPGI8tMR5ZQmAJny9w7VO31u5URg4N9aYxcHt3yYR2stvowos66Dafzc2R
         3vTOVGi+0LX1bRYlQACKn/Zv6gGPcd0zBwNjLgreQSpTZ1cJcFxMV1L2ezXr9Bp+hAbF
         CYYeoR+j4rklzzf+0vktNuMIo08df2EbJ8QT/EMWxsB2gNQ1450/d8uKroUbIuTT72TR
         GKK30kzV7V6ez2UkLqtwV66X4u7OoxdVRtBdcSmSgG25aLXPkCDOg4oINsKYw8CZSnQM
         hWZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8ZMKLCUiF3qKPGX/LGoVOBpR7s+bcNprDSVbEKMvDkc=;
        b=foUqiy7u+2U9wpu4gHzRWXqIpVi86RptNj1shyZ+NdMsjk3edMmbx8L6Ij/1zvz2tV
         xuI0nc+5O2grCIpSEwaiZzYZCoN057ARTUzs14LmiCJ6/q4LL6BdW416NJ3RFi2b5OBJ
         8IWqKhVJ6cSCJ3sH/WXkBstpDfkmGpyKJBcFUXPi9/DsTvzST+pjjIf6aaU/5v24H/xq
         TQaDu18pM+S72bbMpVxmxuquCWhZMAf18TRLWH/bfA6RNkG5ey3yie4tjq2pOGPZUhj3
         nja7ommcp47zdLY00P6KL0jydaJAqxgwsjqIc7qhJGsw2uHp24vicWuebuuSb5YtqWOf
         KY+w==
X-Gm-Message-State: AOAM530J6b1sK6elMD7dHdKx4wAmOkA/2ZV9NNuos+IhiG5OhSJG9aUF
        XMYZd17qgZ9GzZcZD8fTdrI=
X-Google-Smtp-Source: ABdhPJxHqWm8EIEp8tsJmKMJ1X16WfhjsyQ0RVhMr8rBHA2/S+1qvIoC83uW/mXOKYOKnHyqwvoRpQ==
X-Received: by 2002:a1c:5459:0:b0:394:1191:a1ff with SMTP id p25-20020a1c5459000000b003941191a1ffmr7038wmi.96.1651509457676;
        Mon, 02 May 2022 09:37:37 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
        by smtp.gmail.com with ESMTPSA id p14-20020adfaa0e000000b0020c5253d8f6sm7294694wrd.66.2022.05.02.09.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 09:37:37 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, jason@jlekstrand.net, daniels@collabora.com,
        skhawaja@google.com, maad.aldabagh@amd.com, sergemetral@google.com,
        sumit.semwal@linaro.org, gustavo@padovan.org,
        Felix.Kuehling@amd.com, alexander.deucher@amd.com,
        tzimmermann@suse.de, tvrtko.ursulin@linux.intel.com,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Cc:     =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH 07/15] dma-buf: add user fence utility functions
Date:   Mon,  2 May 2022 18:37:14 +0200
Message-Id: <20220502163722.3957-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502163722.3957-1-christian.koenig@amd.com>
References: <20220502163722.3957-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Allows to filter user fences from a dma_fence_chain and wait for user
fences in containers.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence-unwrap.c | 47 ++++++++++++++++++++++++++++++
 include/linux/dma-fence-unwrap.h   |  3 ++
 2 files changed, 50 insertions(+)

diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fence-unwrap.c
index dd3c43aba8f1..4e9eda0b65c5 100644
--- a/drivers/dma-buf/dma-fence-unwrap.c
+++ b/drivers/dma-buf/dma-fence-unwrap.c
@@ -157,3 +157,50 @@ struct dma_fence *__dma_fence_merge(unsigned int num_fences,
 	return tmp;
 }
 EXPORT_SYMBOL_GPL(__dma_fence_merge);
+
+/**
+ * dma_fence_filter_user - filter user fences
+ * @fence: entry point into the chain
+ *
+ * Check @fence and if it's a dma_fence_chain advance it until it doesn't depend
+ * on any user fence any more.
+ *
+ * Returns the advanced fence or NULL if no none user fence could be found.
+ */
+struct dma_fence *dma_fence_filter_user(struct dma_fence *fence)
+{
+
+	while (fence && test_bit(DMA_FENCE_FLAG_USER, &fence->flags))
+		fence = dma_fence_chain_walk(fence);
+
+	return fence;
+}
+EXPORT_SYMBOL(dma_fence_filter_user);
+
+/**
+ * dma_fence_wait_user - wait for all user fences to signal
+ * @fence: entry point
+ * @timeout: timeout for the wait
+ *
+ * Unwrap the potential container in @fence and wait for all the user fences to
+ * signal.
+ * Returns: Either negative error code or the remaining timeout.
+ */
+long dma_fence_wait_user(struct dma_fence *fence, unsigned long timeout)
+{
+	struct dma_fence_unwrap iter;
+	long res;
+
+	dma_fence_unwrap_for_each(fence, &iter, fence) {
+		if (!test_bit(DMA_FENCE_FLAG_USER, &fence->flags))
+			continue;
+
+		res = dma_fence_wait(fence, timeout);
+		if (res <= 0)
+			return res;
+		if (timeout)
+			timeout = res;
+	}
+	return timeout;
+}
+EXPORT_SYMBOL(dma_fence_wait_user);
diff --git a/include/linux/dma-fence-unwrap.h b/include/linux/dma-fence-unwrap.h
index 7c0fab318301..2a786f5a7819 100644
--- a/include/linux/dma-fence-unwrap.h
+++ b/include/linux/dma-fence-unwrap.h
@@ -72,4 +72,7 @@ struct dma_fence *__dma_fence_merge(unsigned int num_fences,
 		__dma_fence_merge(ARRAY_SIZE(__f), __f, __c);	\
 	})
 
+struct dma_fence *dma_fence_filter_user(struct dma_fence *fence);
+long dma_fence_wait_user(struct dma_fence *fence, unsigned long timeout);
+
 #endif
-- 
2.25.1

