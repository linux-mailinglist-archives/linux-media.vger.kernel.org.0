Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2A6E161681
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2020 16:45:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729391AbgBQPpR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Feb 2020 10:45:17 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:36119 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729349AbgBQPpR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Feb 2020 10:45:17 -0500
Received: by mail-wr1-f68.google.com with SMTP id z3so20351514wru.3
        for <linux-media@vger.kernel.org>; Mon, 17 Feb 2020 07:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=UJYLvYhU/BqgpOkWhQ0m0kEeKCv5RPci/PQtxcc6Sms=;
        b=Tx/CYjxZEk0/Xevp7mrQ/aP9gQWxxotISyfE7+iXMWlxL4mR1huTeWDicC+HbvMp9s
         2lZq5FIMoXIZHCZBG4sbo9yv1FOmkXwLR+3YZNd1eFEZeK4R7rC3zcSIGNyJYUkBl++o
         EfxRgGhwAyVPvDen838UkNKRs8JLHMC2RHoUprlOpajNkkzu6iE0M133jKQ77ZKX3zTv
         ANSGQrlqWnaozEFu2eSq2jdOT4upTnU5+cGfNlVPDnWdaTZepolm3aV0rmTqj0tJfHxP
         MsN/mgmaSMXFBwhRHXXRrz8G9gLpR/W8xzYAZXTXiuNPjTTDhApfN9lQui8JDywexSn9
         2YXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UJYLvYhU/BqgpOkWhQ0m0kEeKCv5RPci/PQtxcc6Sms=;
        b=s3w9oqoN6DbbyHtUosjPLClbX7o6d3inNPpVwaVFRhI86MrwjXz6buIWzyhdfB5pMv
         nJ2eN2Sk1k9krJMnLXZcqusTc0Noiu9EkIcKbEMIcoX8grC5RcB325Z8TkSwyqL3nn9b
         DvWnwK6sQCCGZUKlJt7nDvtcEtRn8sMgP72aSA5qfvNucl8/d8ZxJlhBJEl1uJMmVTUa
         SWLZwQy//+/QprqGmshjw2JflIQ7mUQXJjoVk16pE71SYWtBpDX/AVDTboP4jT2mvaz1
         V1YUtviE1qYeuLApUOgjr+DHfjq3nYeXr67fXTrc/CrrpHAFtdSf0q90ll+C1R7a2iOo
         QhpQ==
X-Gm-Message-State: APjAAAXnL0zHQcPJoUaeEiEendlET2qqKVaOD2KC1rmMJ0ZK7D1QBVpr
        WhOQ68jA7e5YD3AQlBowRxU=
X-Google-Smtp-Source: APXvYqzWsqZUjs2VfoAK40fa2+bWQXMLfMfldGRsgRQDRhkQNwkjAkKFE6JVhwiXEpPZ1HGtVCvxYw==
X-Received: by 2002:a5d:4b88:: with SMTP id b8mr23030241wrt.343.1581954313942;
        Mon, 17 Feb 2020 07:45:13 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:180d:d2d6:6ff9:a6cb])
        by smtp.gmail.com with ESMTPSA id r6sm1372658wrq.92.2020.02.17.07.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2020 07:45:13 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        daniel@ffwll.ch
Subject: [PATCH 1/5] dma-buf: add dynamic DMA-buf handling v14
Date:   Mon, 17 Feb 2020 16:45:05 +0100
Message-Id: <20200217154509.2265-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200217154509.2265-1-christian.koenig@amd.com>
References: <20200217154509.2265-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On the exporter side we add optional explicit pinning callbacks. Which are
called when the importer doesn't implement dynamic handling, move notification
or need the DMA-buf locked in place for its use case.

On the importer side we add an optional move_notify callback. This callback is
used by the exporter to inform the importers that their mappings should be
destroyed as soon as possible.

This allows the exporter to provide the mappings without the need to pin
the backing store.

v2: don't try to invalidate mappings when the callback is NULL,
    lock the reservation obj while using the attachments,
    add helper to set the callback
v3: move flag for invalidation support into the DMA-buf,
    use new attach_info structure to set the callback
v4: use importer_priv field instead of mangling exporter priv.
v5: drop invalidation_supported flag
v6: squash together with pin/unpin changes
v7: pin/unpin takes an attachment now
v8: nuke dma_buf_attachment_(map|unmap)_locked,
    everything is now handled backward compatible
v9: always cache when export/importer don't agree on dynamic handling
v10: minimal style cleanup
v11: drop automatically re-entry avoidance
v12: rename callback to move_notify
v13: add might_lock in appropriate places
v14: rebase on separated locking change

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-buf.c                   | 106 ++++++++++++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c |   6 +-
 include/linux/dma-buf.h                     |  78 ++++++++++++--
 3 files changed, 170 insertions(+), 20 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index d377b4ca66bf..ce293cee76ed 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -529,6 +529,10 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
 		    exp_info->ops->dynamic_mapping))
 		return ERR_PTR(-EINVAL);
 
+	if (WARN_ON(!exp_info->ops->dynamic_mapping &&
+		    (exp_info->ops->pin || exp_info->ops->unpin)))
+		return ERR_PTR(-EINVAL);
+
 	if (!try_module_get(exp_info->owner))
 		return ERR_PTR(-ENOENT);
 
@@ -653,7 +657,8 @@ EXPORT_SYMBOL_GPL(dma_buf_put);
  * calls attach() of dma_buf_ops to allow device-specific attach functionality
  * @dmabuf:		[in]	buffer to attach device to.
  * @dev:		[in]	device to be attached.
- * @dynamic_mapping:	[in]	calling convention for map/unmap
+ * @importer_ops	[in]	importer operations for the attachment
+ * @importer_priv	[in]	importer private pointer for the attachment
  *
  * Returns struct dma_buf_attachment pointer for this attachment. Attachments
  * must be cleaned up by calling dma_buf_detach().
@@ -669,7 +674,8 @@ EXPORT_SYMBOL_GPL(dma_buf_put);
  */
 struct dma_buf_attachment *
 dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
-		       bool dynamic_mapping)
+		       const struct dma_buf_attach_ops *importer_ops,
+		       void *importer_priv)
 {
 	struct dma_buf_attachment *attach;
 	int ret;
@@ -683,7 +689,8 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
 
 	attach->dev = dev;
 	attach->dmabuf = dmabuf;
-	attach->dynamic_mapping = dynamic_mapping;
+	attach->importer_ops = importer_ops;
+	attach->importer_priv = importer_priv;
 
 	if (dmabuf->ops->attach) {
 		ret = dmabuf->ops->attach(dmabuf, attach);
@@ -702,15 +709,19 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
 	    dma_buf_is_dynamic(dmabuf)) {
 		struct sg_table *sgt;
 
-		if (dma_buf_is_dynamic(attach->dmabuf))
+		if (dma_buf_is_dynamic(attach->dmabuf)) {
 			dma_resv_lock(attach->dmabuf->resv, NULL);
+			ret = dma_buf_pin(attach);
+			if (ret)
+				goto err_unlock;
+		}
 
 		sgt = dmabuf->ops->map_dma_buf(attach, DMA_BIDIRECTIONAL);
 		if (!sgt)
 			sgt = ERR_PTR(-ENOMEM);
 		if (IS_ERR(sgt)) {
 			ret = PTR_ERR(sgt);
-			goto err_unlock;
+			goto err_unpin;
 		}
 		if (dma_buf_is_dynamic(attach->dmabuf))
 			dma_resv_unlock(attach->dmabuf->resv);
@@ -724,6 +735,10 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
 	kfree(attach);
 	return ERR_PTR(ret);
 
+err_unpin:
+	if (dma_buf_is_dynamic(attach->dmabuf))
+		dma_buf_unpin(attach);
+
 err_unlock:
 	if (dma_buf_is_dynamic(attach->dmabuf))
 		dma_resv_unlock(attach->dmabuf->resv);
@@ -744,7 +759,7 @@ EXPORT_SYMBOL_GPL(dma_buf_dynamic_attach);
 struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
 					  struct device *dev)
 {
-	return dma_buf_dynamic_attach(dmabuf, dev, false);
+	return dma_buf_dynamic_attach(dmabuf, dev, NULL, NULL);
 }
 EXPORT_SYMBOL_GPL(dma_buf_attach);
 
@@ -767,8 +782,10 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
 
 		dmabuf->ops->unmap_dma_buf(attach, attach->sgt, attach->dir);
 
-		if (dma_buf_is_dynamic(attach->dmabuf))
+		if (dma_buf_is_dynamic(attach->dmabuf)) {
+			dma_buf_unpin(attach);
 			dma_resv_unlock(attach->dmabuf->resv);
+		}
 	}
 
 	dma_resv_lock(dmabuf->resv, NULL);
@@ -781,6 +798,44 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
 }
 EXPORT_SYMBOL_GPL(dma_buf_detach);
 
+/**
+ * dma_buf_pin - Lock down the DMA-buf
+ *
+ * @attach:	[in]	attachment which should be pinned
+ *
+ * Returns:
+ * 0 on success, negative error code on failure.
+ */
+int dma_buf_pin(struct dma_buf_attachment *attach)
+{
+	struct dma_buf *dmabuf = attach->dmabuf;
+	int ret = 0;
+
+	dma_resv_assert_held(dmabuf->resv);
+
+	if (dmabuf->ops->pin)
+		ret = dmabuf->ops->pin(attach);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(dma_buf_pin);
+
+/**
+ * dma_buf_unpin - Remove lock from DMA-buf
+ *
+ * @attach:	[in]	attachment which should be unpinned
+ */
+void dma_buf_unpin(struct dma_buf_attachment *attach)
+{
+	struct dma_buf *dmabuf = attach->dmabuf;
+
+	dma_resv_assert_held(dmabuf->resv);
+
+	if (dmabuf->ops->unpin)
+		dmabuf->ops->unpin(attach);
+}
+EXPORT_SYMBOL_GPL(dma_buf_unpin);
+
 /**
  * dma_buf_map_attachment - Returns the scatterlist table of the attachment;
  * mapped into _device_ address space. Is a wrapper for map_dma_buf() of the
@@ -800,6 +855,7 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
 					enum dma_data_direction direction)
 {
 	struct sg_table *sg_table;
+	int r;
 
 	might_sleep();
 
@@ -821,13 +877,23 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
 		return attach->sgt;
 	}
 
-	if (dma_buf_is_dynamic(attach->dmabuf))
+	if (dma_buf_is_dynamic(attach->dmabuf)) {
 		dma_resv_assert_held(attach->dmabuf->resv);
+		if (!attach->importer_ops->move_notify) {
+			r = dma_buf_pin(attach);
+			if (r)
+				return ERR_PTR(r);
+		}
+	}
 
 	sg_table = attach->dmabuf->ops->map_dma_buf(attach, direction);
 	if (!sg_table)
 		sg_table = ERR_PTR(-ENOMEM);
 
+	if (IS_ERR(sg_table) && dma_buf_is_dynamic(attach->dmabuf) &&
+	    !attach->importer_ops->move_notify)
+		dma_buf_unpin(attach);
+
 	if (!IS_ERR(sg_table) && attach->dmabuf->ops->cache_sgt_mapping) {
 		attach->sgt = sg_table;
 		attach->dir = direction;
@@ -866,9 +932,33 @@ void dma_buf_unmap_attachment(struct dma_buf_attachment *attach,
 		dma_resv_assert_held(attach->dmabuf->resv);
 
 	attach->dmabuf->ops->unmap_dma_buf(attach, sg_table, direction);
+
+	if (dma_buf_is_dynamic(attach->dmabuf) &&
+	    !attach->importer_ops->move_notify)
+		dma_buf_unpin(attach);
 }
 EXPORT_SYMBOL_GPL(dma_buf_unmap_attachment);
 
+/**
+ * dma_buf_move_notify - notify attachments that DMA-buf is moving
+ *
+ * @dmabuf:	[in]	buffer which is moving
+ *
+ * Informs all attachmenst that they need to destroy and recreated all their
+ * mappings.
+ */
+void dma_buf_move_notify(struct dma_buf *dmabuf)
+{
+	struct dma_buf_attachment *attach;
+
+	dma_resv_assert_held(dmabuf->resv);
+
+	list_for_each_entry(attach, &dmabuf->attachments, node)
+		if (attach->importer_ops && attach->importer_ops->move_notify)
+			attach->importer_ops->move_notify(attach);
+}
+EXPORT_SYMBOL_GPL(dma_buf_move_notify);
+
 /**
  * DOC: cpu access
  *
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index e2eec7b66334..b2ca78b6abce 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -414,6 +414,9 @@ amdgpu_dma_buf_create_obj(struct drm_device *dev, struct dma_buf *dma_buf)
 	return ERR_PTR(ret);
 }
 
+static const struct dma_buf_attach_ops amdgpu_dma_buf_attach_ops = {
+};
+
 /**
  * amdgpu_gem_prime_import - &drm_driver.gem_prime_import implementation
  * @dev: DRM device
@@ -446,7 +449,8 @@ struct drm_gem_object *amdgpu_gem_prime_import(struct drm_device *dev,
 	if (IS_ERR(obj))
 		return obj;
 
-	attach = dma_buf_dynamic_attach(dma_buf, dev->dev, true);
+	attach = dma_buf_dynamic_attach(dma_buf, dev->dev,
+					&amdgpu_dma_buf_attach_ops, NULL);
 	if (IS_ERR(attach)) {
 		drm_gem_object_put(obj);
 		return ERR_CAST(attach);
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index af73f835c51c..7456bb937635 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -93,14 +93,40 @@ struct dma_buf_ops {
 	 */
 	void (*detach)(struct dma_buf *, struct dma_buf_attachment *);
 
+	/**
+	 * @pin:
+	 *
+	 * This is called by dma_buf_pin and lets the exporter know that the
+	 * DMA-buf can't be moved any more.
+	 *
+	 * This is called with the dmabuf->resv object locked.
+	 *
+	 * This callback is optional.
+	 *
+	 * Returns:
+	 *
+	 * 0 on success, negative error code on failure.
+	 */
+	int (*pin)(struct dma_buf_attachment *attach);
+
+	/**
+	 * @unpin:
+	 *
+	 * This is called by dma_buf_unpin and lets the exporter know that the
+	 * DMA-buf can be moved again.
+	 *
+	 * This is called with the dmabuf->resv object locked.
+	 *
+	 * This callback is optional.
+	 */
+	void (*unpin)(struct dma_buf_attachment *attach);
+
 	/**
 	 * @map_dma_buf:
 	 *
 	 * This is called by dma_buf_map_attachment() and is used to map a
 	 * shared &dma_buf into device address space, and it is mandatory. It
-	 * can only be called if @attach has been called successfully. This
-	 * essentially pins the DMA buffer into place, and it cannot be moved
-	 * any more
+	 * can only be called if @attach has been called successfully.
 	 *
 	 * This call may sleep, e.g. when the backing storage first needs to be
 	 * allocated, or moved to a location suitable for all currently attached
@@ -141,9 +167,6 @@ struct dma_buf_ops {
 	 *
 	 * This is called by dma_buf_unmap_attachment() and should unmap and
 	 * release the &sg_table allocated in @map_dma_buf, and it is mandatory.
-	 * It should also unpin the backing storage if this is the last mapping
-	 * of the DMA buffer, it the exporter supports backing storage
-	 * migration.
 	 */
 	void (*unmap_dma_buf)(struct dma_buf_attachment *,
 			      struct sg_table *,
@@ -336,6 +359,34 @@ struct dma_buf {
 	} cb_excl, cb_shared;
 };
 
+/**
+ * struct dma_buf_attach_ops - importer operations for an attachment
+ * @move_notify: [optional] notification that the DMA-buf is moving
+ *
+ * Attachment operations implemented by the importer.
+ */
+struct dma_buf_attach_ops {
+	/**
+	 * @move_notify
+	 *
+	 * If this callback is provided the framework can avoid pinning the
+	 * backing store while mappings exists.
+	 *
+	 * This callback is called with the lock of the reservation object
+	 * associated with the dma_buf held and the mapping function must be
+	 * called with this lock held as well. This makes sure that no mapping
+	 * is created concurrently with an ongoing move operation.
+	 *
+	 * Mappings stay valid and are not directly affected by this callback.
+	 * But the DMA-buf can now be in a different physical location, so all
+	 * mappings should be destroyed and re-created as soon as possible.
+	 *
+	 * New mappings can be created after this callback returns, and will
+	 * point to the new location of the DMA-buf.
+	 */
+	void (*move_notify)(struct dma_buf_attachment *attach);
+};
+
 /**
  * struct dma_buf_attachment - holds device-buffer attachment data
  * @dmabuf: buffer for this attachment.
@@ -344,8 +395,9 @@ struct dma_buf {
  * @sgt: cached mapping.
  * @dir: direction of cached mapping.
  * @priv: exporter specific attachment data.
- * @dynamic_mapping: true if dma_buf_map/unmap_attachment() is called with the
- * dma_resv lock held.
+ * @importer_ops: importer operations for this attachment, if provided
+ * dma_buf_map/unmap_attachment() must be called with the dma_resv lock held.
+ * @importer_priv: importer specific attachment data.
  *
  * This structure holds the attachment information between the dma_buf buffer
  * and its user device(s). The list contains one attachment struct per device
@@ -362,7 +414,8 @@ struct dma_buf_attachment {
 	struct list_head node;
 	struct sg_table *sgt;
 	enum dma_data_direction dir;
-	bool dynamic_mapping;
+	const struct dma_buf_attach_ops *importer_ops;
+	void *importer_priv;
 	void *priv;
 };
 
@@ -438,16 +491,19 @@ static inline bool dma_buf_is_dynamic(struct dma_buf *dmabuf)
 static inline bool
 dma_buf_attachment_is_dynamic(struct dma_buf_attachment *attach)
 {
-	return attach->dynamic_mapping;
+	return !!attach->importer_ops;
 }
 
 struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
 					  struct device *dev);
 struct dma_buf_attachment *
 dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
-		       bool dynamic_mapping);
+		       const struct dma_buf_attach_ops *importer_ops,
+		       void *importer_priv);
 void dma_buf_detach(struct dma_buf *dmabuf,
 		    struct dma_buf_attachment *attach);
+int dma_buf_pin(struct dma_buf_attachment *attach);
+void dma_buf_unpin(struct dma_buf_attachment *attach);
 
 struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info);
 
-- 
2.17.1

