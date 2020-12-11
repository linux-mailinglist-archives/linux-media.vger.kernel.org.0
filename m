Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 164422D7A71
	for <lists+linux-media@lfdr.de>; Fri, 11 Dec 2020 17:02:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406661AbgLKQAr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Dec 2020 11:00:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406345AbgLKP7i (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Dec 2020 10:59:38 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 536EDC061793
        for <linux-media@vger.kernel.org>; Fri, 11 Dec 2020 07:58:54 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id q75so9047193wme.2
        for <linux-media@vger.kernel.org>; Fri, 11 Dec 2020 07:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=243Gvg3EOSmTTvBu4o4RKVn/UX2SWUWrVcKX752oh38=;
        b=Id21eySxih7XsO5kncW+YAXadbd1FJRP3AnY8TzDzyRyz5vVVokfWt6LARnKv+mD6i
         xuXPXb4DkBzcRfsCwW9KZQ9udP/p+NrzbHAjO1Qv2ykiye5kdGDuJOGNzC/uPI1NH/0R
         gPKG1sdfMW2SydMRmu4eAZjGA3/gSSRFu/ySs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=243Gvg3EOSmTTvBu4o4RKVn/UX2SWUWrVcKX752oh38=;
        b=iYp42eROacNZwaOCfNuxWtYZsguygyU5wZ2QlKkiH5yWcvCBHYipfpD1vlV4y3fyrL
         I4fyquFlC/ms5S0++A46YcfHcTVHe5J40q4+oJzYwwKi3DGTISsXCrLYmUoE+GMk4uQH
         ld+XHyztnKzq0jc0Q2APbRwu3GvaJSMv4sVCH/03d4vkW4QX6f8XRzIuFZ7HkSSyN1lf
         NSiZ8bpDvejoMq2W8XTZLi1DlwrPB18Zup7Osia7VkBlRxRe+uEjkzaTQFuAmpEGlWJf
         KkvmqLuJqtpnhoH3/YBeLAyi11tsPYJyc2blBpPXd2QaFZv7M3/VzdFmgME7g7Xb6YT2
         XvYg==
X-Gm-Message-State: AOAM533DHh9qs911qbWCP3ETYp3cC1keouAi9u+Ra0OY9wkSdTZ8ZGZH
        xYPsmct6uEOlEAa95dosoQmucg==
X-Google-Smtp-Source: ABdhPJyuJvI2Mjy8AtPGb0Iyw00NTdMFlmVvHC+yg+8Gjr8dEU+KJmhpBUiwqBVmfmlnpv1AVmn/+w==
X-Received: by 2002:a1c:4904:: with SMTP id w4mr13987630wma.140.1607702333034;
        Fri, 11 Dec 2020 07:58:53 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id z21sm14828241wmk.20.2020.12.11.07.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 07:58:52 -0800 (PST)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 4/4] dma-buf: doc polish for pin/unpin
Date:   Fri, 11 Dec 2020 16:58:43 +0100
Message-Id: <20201211155843.3348718-4-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201211155843.3348718-1-daniel.vetter@ffwll.ch>
References: <20201211155843.3348718-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Motivated by a discussion with Christian and Thomas: Try to untangle a
bit what's relevant for importers and what's relevant for exporters.

Also add an assert that really only dynamic importers use the api
function, anything else doesn't make sense.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
---
 drivers/dma-buf/dma-buf.c | 19 ++++++++++++++++---
 include/linux/dma-buf.h   |  8 +++++---
 2 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 00d5afe904cc..1065545e9ca1 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -809,9 +809,15 @@ EXPORT_SYMBOL_GPL(dma_buf_detach);
 
 /**
  * dma_buf_pin - Lock down the DMA-buf
- *
  * @attach:	[in]	attachment which should be pinned
  *
+ * Only dynamic importers (who set up @attach with dma_buf_dynamic_attach()) may
+ * call this, and only for limited use cases like scanout and not for temporary
+ * pin operations. It is not permitted to allow userspace to pin arbitrary
+ * amounts of buffers through this interface.
+ *
+ * Buffers must be unpinned by calling dma_buf_unpin().
+ *
  * Returns:
  * 0 on success, negative error code on failure.
  */
@@ -820,6 +826,8 @@ int dma_buf_pin(struct dma_buf_attachment *attach)
 	struct dma_buf *dmabuf = attach->dmabuf;
 	int ret = 0;
 
+	WARN_ON(!dma_buf_attachment_is_dynamic(attach));
+
 	dma_resv_assert_held(dmabuf->resv);
 
 	if (dmabuf->ops->pin)
@@ -830,14 +838,19 @@ int dma_buf_pin(struct dma_buf_attachment *attach)
 EXPORT_SYMBOL_GPL(dma_buf_pin);
 
 /**
- * dma_buf_unpin - Remove lock from DMA-buf
- *
+ * dma_buf_unpin - Unpin a DMA-buf
  * @attach:	[in]	attachment which should be unpinned
+ *
+ * This unpins a buffer pinned by dma_buf_pin() and allows the exporter to move
+ * any mapping of @attach again and inform the importer through
+ * &dma_buf_attach_ops.move_notify.
  */
 void dma_buf_unpin(struct dma_buf_attachment *attach)
 {
 	struct dma_buf *dmabuf = attach->dmabuf;
 
+	WARN_ON(!dma_buf_attachment_is_dynamic(attach));
+
 	dma_resv_assert_held(dmabuf->resv);
 
 	if (dmabuf->ops->unpin)
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 43802a31b25d..628681bf6c99 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -86,13 +86,15 @@ struct dma_buf_ops {
 	 * @pin:
 	 *
 	 * This is called by dma_buf_pin() and lets the exporter know that the
-	 * DMA-buf can't be moved any more.
+	 * DMA-buf can't be moved any more. The exporter should pin the buffer
+	 * into system memory to make sure it is generally accessible by other
+	 * devices.
 	 *
 	 * This is called with the &dmabuf.resv object locked and is mutual
 	 * exclusive with @cache_sgt_mapping.
 	 *
-	 * This callback is optional and should only be used in limited use
-	 * cases like scanout and not for temporary pin operations.
+	 * This is called automatically for non-dynamic importers from
+	 * dma_buf_attach().
 	 *
 	 * Returns:
 	 *
-- 
2.29.2

