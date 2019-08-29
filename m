Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0EA4A1CB5
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2019 16:29:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727362AbfH2O3X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Aug 2019 10:29:23 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:34799 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727115AbfH2O3X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Aug 2019 10:29:23 -0400
Received: by mail-wr1-f65.google.com with SMTP id s18so3697802wrn.1
        for <linux-media@vger.kernel.org>; Thu, 29 Aug 2019 07:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ZzOxEmWrlpWLkJKzR6m7M662G9ObzfXyzQYji+wuxQ8=;
        b=r2MEk5kSlTLEoE7bc+KRz0hBxEpb6lQhgWKAQaHyHnuGDaGA7/fjFGxuPUvVzCLvHO
         yr9JEO7LhW5DSrdNxki6aW2E2fuyJ87VJ6Wb2saRPDIW0l8C1JcNb/Xn5uIN7BcXq4Hj
         /EbiVuMX2wiMpb1p6fqrdIXdC1v9VPb5IH1cBk4AY75d6zxILYvOr5/MdvQkexFjq7ZD
         c5GtMjsGsvfg1RGwu/UTCba4+aqCl2kY+0veb1ulKDw3xZGVQFAgIHZdXq2P104Qxm77
         jpXkL6MINLvl4mX4ALHbG1+QahsCvNah+EKnE59mew9abbVVH8YW231qdOSAKhIkXmyr
         khmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZzOxEmWrlpWLkJKzR6m7M662G9ObzfXyzQYji+wuxQ8=;
        b=uQ9g/PEWN+r1dx+QejfaUkODhbFCr5VKH2ZHSAUEVfeZPLZnJ7wu4WaxN33b10Au9L
         hsh0mPwili+iNWWC6G9vGf4BSKLQZtkySw3lhQBwPZncrNPX3UaMghTr+uHq1Fvm8t9O
         onowH/+4fAN7Id7aPXOG58Skt5VqawiOTPmMtFzgrTaIoyY62pwnMetowVsXsTXyV2hI
         qBMPlnfh4sIGyYovaY/R4aRzDSAlEdVBTSyWFPOSABBDtTS7LT0Hmik2pGkth62xukM9
         KTdjlkOK75+DkU/AQt4IMNRQ2J7edE6mLDOA8XVN2quIrriGFWCXo/kYwu9Up9G6K5F6
         WTqw==
X-Gm-Message-State: APjAAAUvOYpAQuZ035oiiylWv89zarvZd7YxE807pD0YDoqnCpHh+ntW
        HxISm5sJykezwYg3pnMQryRPxJg8
X-Google-Smtp-Source: APXvYqzsXyvTtkcvt1CZbpIKEV1RoHlIJWXYGy8P29L/68cg11pTSGkyi03i+0NcRqZdlezcrXVEmA==
X-Received: by 2002:adf:82cd:: with SMTP id 71mr11266080wrc.265.1567088960757;
        Thu, 29 Aug 2019 07:29:20 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:d57:5a0b:4833:fc9f])
        by smtp.gmail.com with ESMTPSA id w13sm6188214wre.44.2019.08.29.07.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 07:29:20 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        sumit.semwal@linaro.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/4] dma-buf: change DMA-buf locking convention
Date:   Thu, 29 Aug 2019 16:29:14 +0200
Message-Id: <20190829142917.13058-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190829142917.13058-1-christian.koenig@amd.com>
References: <20190829142917.13058-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch is a stripped down version of the locking changes
necessary to support dynamic DMA-buf handling.

For compatibility we cache the DMA-buf mapping as soon as
exporter/importer disagree on the dynamic handling.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-buf.c | 90 ++++++++++++++++++++++++++++++++++++---
 include/linux/dma-buf.h   | 51 +++++++++++++++++++++-
 2 files changed, 133 insertions(+), 8 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 433d91d710e4..65052d52602b 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -525,6 +525,10 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
 		return ERR_PTR(-EINVAL);
 	}
 
+	if (WARN_ON(exp_info->ops->cache_sgt_mapping &&
+		    exp_info->ops->dynamic_mapping))
+		return ERR_PTR(-EINVAL);
+
 	if (!try_module_get(exp_info->owner))
 		return ERR_PTR(-ENOENT);
 
@@ -645,10 +649,11 @@ void dma_buf_put(struct dma_buf *dmabuf)
 EXPORT_SYMBOL_GPL(dma_buf_put);
 
 /**
- * dma_buf_attach - Add the device to dma_buf's attachments list; optionally,
+ * dma_buf_dynamic_attach - Add the device to dma_buf's attachments list; optionally,
  * calls attach() of dma_buf_ops to allow device-specific attach functionality
- * @dmabuf:	[in]	buffer to attach device to.
- * @dev:	[in]	device to be attached.
+ * @dmabuf:		[in]	buffer to attach device to.
+ * @dev:		[in]	device to be attached.
+ * @dynamic_mapping:	[in]	calling convention for map/unmap
  *
  * Returns struct dma_buf_attachment pointer for this attachment. Attachments
  * must be cleaned up by calling dma_buf_detach().
@@ -662,8 +667,9 @@ EXPORT_SYMBOL_GPL(dma_buf_put);
  * accessible to @dev, and cannot be moved to a more suitable place. This is
  * indicated with the error code -EBUSY.
  */
-struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
-					  struct device *dev)
+struct dma_buf_attachment *
+dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
+		       bool dynamic_mapping)
 {
 	struct dma_buf_attachment *attach;
 	int ret;
@@ -677,6 +683,7 @@ struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
 
 	attach->dev = dev;
 	attach->dmabuf = dmabuf;
+	attach->dynamic_mapping = dynamic_mapping;
 
 	mutex_lock(&dmabuf->lock);
 
@@ -685,16 +692,64 @@ struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
 		if (ret)
 			goto err_attach;
 	}
+	dma_resv_lock(dmabuf->resv, NULL);
 	list_add(&attach->node, &dmabuf->attachments);
+	dma_resv_unlock(dmabuf->resv);
 
 	mutex_unlock(&dmabuf->lock);
 
+	/* When either the importer or the exporter can't handle dynamic
+	 * mappings we cache the mapping here to avoid issues with the
+	 * reservation object lock.
+	 */
+	if (dma_buf_attachment_is_dynamic(attach) !=
+	    dma_buf_is_dynamic(dmabuf)) {
+		struct sg_table *sgt;
+
+		if (dma_buf_is_dynamic(attach->dmabuf))
+			dma_resv_lock(attach->dmabuf->resv, NULL);
+
+		sgt = dmabuf->ops->map_dma_buf(attach, DMA_BIDIRECTIONAL);
+		if (!sgt)
+			sgt = ERR_PTR(-ENOMEM);
+		if (IS_ERR(sgt)) {
+			ret = PTR_ERR(sgt);
+			goto err_unlock;
+		}
+		if (dma_buf_is_dynamic(attach->dmabuf))
+			dma_resv_unlock(attach->dmabuf->resv);
+		attach->sgt = sgt;
+		attach->dir = DMA_BIDIRECTIONAL;
+	}
+
 	return attach;
 
 err_attach:
 	kfree(attach);
 	mutex_unlock(&dmabuf->lock);
 	return ERR_PTR(ret);
+
+err_unlock:
+	if (dma_buf_is_dynamic(attach->dmabuf))
+		dma_resv_unlock(attach->dmabuf->resv);
+
+	dma_buf_detach(dmabuf, attach);
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL_GPL(dma_buf_dynamic_attach);
+
+/**
+ * dma_buf_attach - Wrapper for dma_buf_dynamic_attach
+ * @dmabuf:	[in]	buffer to attach device to.
+ * @dev:	[in]	device to be attached.
+ *
+ * Wrapper to call dma_buf_dynamic_attach() for drivers which still use a static
+ * mapping.
+ */
+struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
+					  struct device *dev)
+{
+	return dma_buf_dynamic_attach(dmabuf, dev, false);
 }
 EXPORT_SYMBOL_GPL(dma_buf_attach);
 
@@ -711,11 +766,20 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
 	if (WARN_ON(!dmabuf || !attach))
 		return;
 
-	if (attach->sgt)
+	if (attach->sgt) {
+		if (dma_buf_is_dynamic(attach->dmabuf))
+			dma_resv_lock(attach->dmabuf->resv, NULL);
+
 		dmabuf->ops->unmap_dma_buf(attach, attach->sgt, attach->dir);
 
+		if (dma_buf_is_dynamic(attach->dmabuf))
+			dma_resv_unlock(attach->dmabuf->resv);
+	}
+
 	mutex_lock(&dmabuf->lock);
+	dma_resv_lock(dmabuf->resv, NULL);
 	list_del(&attach->node);
+	dma_resv_unlock(dmabuf->resv);
 	if (dmabuf->ops->detach)
 		dmabuf->ops->detach(dmabuf, attach);
 
@@ -749,6 +813,9 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
 	if (WARN_ON(!attach || !attach->dmabuf))
 		return ERR_PTR(-EINVAL);
 
+	if (dma_buf_attachment_is_dynamic(attach))
+		dma_resv_assert_held(attach->dmabuf->resv);
+
 	if (attach->sgt) {
 		/*
 		 * Two mappings with different directions for the same
@@ -761,6 +828,9 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
 		return attach->sgt;
 	}
 
+	if (dma_buf_is_dynamic(attach->dmabuf))
+		dma_resv_assert_held(attach->dmabuf->resv);
+
 	sg_table = attach->dmabuf->ops->map_dma_buf(attach, direction);
 	if (!sg_table)
 		sg_table = ERR_PTR(-ENOMEM);
@@ -793,9 +863,15 @@ void dma_buf_unmap_attachment(struct dma_buf_attachment *attach,
 	if (WARN_ON(!attach || !attach->dmabuf || !sg_table))
 		return;
 
+	if (dma_buf_attachment_is_dynamic(attach))
+		dma_resv_assert_held(attach->dmabuf->resv);
+
 	if (attach->sgt == sg_table)
 		return;
 
+	if (dma_buf_is_dynamic(attach->dmabuf))
+		dma_resv_assert_held(attach->dmabuf->resv);
+
 	attach->dmabuf->ops->unmap_dma_buf(attach, sg_table, direction);
 }
 EXPORT_SYMBOL_GPL(dma_buf_unmap_attachment);
@@ -1219,10 +1295,12 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
 		seq_puts(s, "\tAttached Devices:\n");
 		attach_count = 0;
 
+		dma_resv_lock(buf_obj->resv, NULL);
 		list_for_each_entry(attach_obj, &buf_obj->attachments, node) {
 			seq_printf(s, "\t%s\n", dev_name(attach_obj->dev));
 			attach_count++;
 		}
+		dma_resv_unlock(buf_obj->resv);
 
 		seq_printf(s, "Total %d devices attached\n\n",
 				attach_count);
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index ec212cb27fdc..a8f8b2b812fd 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -42,6 +42,17 @@ struct dma_buf_ops {
 	  */
 	bool cache_sgt_mapping;
 
+	/**
+	 * @dynamic_mapping:
+	 *
+	 * If true the framework makes sure that the map/unmap_dma_buf
+	 * callbacks are always called with the dma_resv object locked.
+	 *
+	 * If false the framework makes ure that the map/unmap_dma_buf
+	 * callbacks are always called without the dma_resv object locked.
+	 */
+	bool dynamic_mapping;
+
 	/**
 	 * @attach:
 	 *
@@ -109,6 +120,9 @@ struct dma_buf_ops {
 	 * any other kind of sharing that the exporter might wish to make
 	 * available to buffer-users.
 	 *
+	 * This is always called with the dmabuf->resv object locked when
+	 * the dynamic_mapping flag is true.
+	 *
 	 * Returns:
 	 *
 	 * A &sg_table scatter list of or the backing storage of the DMA buffer,
@@ -327,6 +341,8 @@ struct dma_buf {
  * @sgt: cached mapping.
  * @dir: direction of cached mapping.
  * @priv: exporter specific attachment data.
+ * @dynamic_mapping: true if dma_buf_map/unmap_attachment() is called with the
+ * dma_resv lock held.
  *
  * This structure holds the attachment information between the dma_buf buffer
  * and its user device(s). The list contains one attachment struct per device
@@ -343,6 +359,7 @@ struct dma_buf_attachment {
 	struct list_head node;
 	struct sg_table *sgt;
 	enum dma_data_direction dir;
+	bool dynamic_mapping;
 	void *priv;
 };
 
@@ -394,10 +411,39 @@ static inline void get_dma_buf(struct dma_buf *dmabuf)
 	get_file(dmabuf->file);
 }
 
+/**
+ * dma_buf_is_dynamic - check if a DMA-buf uses dynamic mappings.
+ * @dmabuf: the DMA-buf to check
+ *
+ * Returns true if a DMA-buf exporter wants to be called with the dma_resv
+ * locked, false if it doesn't wants to be called with the lock held.
+ */
+static inline bool dma_buf_is_dynamic(struct dma_buf *dmabuf)
+{
+	return dmabuf->ops->dynamic_mapping;
+}
+
+/**
+ * dma_buf_attachment_is_dynamic - check if a DMA-buf attachment uses dynamic
+ * mappinsg
+ * @attach: the DMA-buf attachment to check
+ *
+ * Returns true if a DMA-buf importer wants to call the map/unmap functions with
+ * the dma_resv lock held.
+ */
+static inline bool
+dma_buf_attachment_is_dynamic(struct dma_buf_attachment *attach)
+{
+	return attach->dynamic_mapping;
+}
+
 struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
-							struct device *dev);
+					  struct device *dev);
+struct dma_buf_attachment *
+dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
+		       bool dynamic_mapping);
 void dma_buf_detach(struct dma_buf *dmabuf,
-				struct dma_buf_attachment *dmabuf_attach);
+		    struct dma_buf_attachment *attach);
 
 struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info);
 
@@ -409,6 +455,7 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *,
 					enum dma_data_direction);
 void dma_buf_unmap_attachment(struct dma_buf_attachment *, struct sg_table *,
 				enum dma_data_direction);
+void dma_buf_move_notify(struct dma_buf *dma_buf);
 int dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
 			     enum dma_data_direction dir);
 int dma_buf_end_cpu_access(struct dma_buf *dma_buf,
-- 
2.17.1

