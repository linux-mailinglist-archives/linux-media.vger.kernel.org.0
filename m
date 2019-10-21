Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85D9DDEA95
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2019 13:15:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728324AbfJULPc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Oct 2019 07:15:32 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33117 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726767AbfJULPb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Oct 2019 07:15:31 -0400
Received: by mail-wr1-f65.google.com with SMTP id s1so4721740wro.0
        for <linux-media@vger.kernel.org>; Mon, 21 Oct 2019 04:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l5kZ6eJpVfLJBcQupT4Lazwgm6cKRgHlf0S9bM0ieRc=;
        b=pKCfjq9Mt7EK/GAR1x7xlXQqEbq/gJCVmKZnowCqtJaXG7JS+c+DINqiLvath7brjp
         gRRiuSjlKHFdrzyc2uUFV/bB0wWnP+Qedi7ss1Yp7GTXut4sPIwGKoY0K43gPcPcJt+A
         cyZvEDBwDaNdf8X3Eifsqu4/7btnh1NJW56kw5CsCW99ob6cL+ZjVPztd1hIjjGk4DMZ
         1LqYu3zW83JoKIAtlZG4rMx3+19i+uPO3SFXI47dp4E/M005pG+0CDL+c0U6g0HOlNBl
         5PZRzka1rZdHdv0VDO8AcB0YLrOhIRG+i2Pm3xQWDkfzqGsUFOejRaYo/Z9g2rU+828S
         bJug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l5kZ6eJpVfLJBcQupT4Lazwgm6cKRgHlf0S9bM0ieRc=;
        b=SyASK4xvP07u4jUZzgiWtbycZVV4tGDfkhxXSXGjmGOap1zY7WA9LWIgRrJchA8nzW
         k6w0ESz4nMzp34mg42TCLI/1QPhymy7giEZN7bMApryQ2Jim6mUHrO8ZBRPk69Ht8WdS
         4Cv3XNeB3YMeoInFtmoIZhSEMpKdKgkTNJCpkm2xZ88sMq3uCzTqY7USGks7SvRHRVJ9
         cByFXyDyfnxXEWeeiEgjo78myAjC7p7X+AjD94sivyddMjUWiZz/GDr9iduoH+2C17a/
         lzsA7F4cA7Ucns40XWzrbQ3IwaZ8owroHRHwzEb/7PreuAghIMAhJPGaiNFFq9SFEE0d
         QZIA==
X-Gm-Message-State: APjAAAUJHT6ZTSIVxWM5ZUyHPIhASIOGbeTzjNYewzIdRpzHey5WB8t0
        UbKfrb5IcgNMU7AKWI8Hveo=
X-Google-Smtp-Source: APXvYqxp/vYKCrkXKrowLtxNRDfzE3ys4U2Kyc5wYjGju0uwFNJlRxpV4IfhX88e08wQ77TlU3so+Q==
X-Received: by 2002:adf:f342:: with SMTP id e2mr20538782wrp.61.1571656527798;
        Mon, 21 Oct 2019 04:15:27 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:c194:dd41:4bef:70cc])
        by smtp.gmail.com with ESMTPSA id l9sm13152415wme.45.2019.10.21.04.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2019 04:15:25 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     dri-devel@lists.freedesktop.org, sumit.semwal@linaro.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, daniel@ffwll.ch
Subject: [PATCH 1/4] dma-buf: change DMA-buf locking convention v2
Date:   Mon, 21 Oct 2019 13:15:21 +0200
Message-Id: <20191021111524.14793-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch is a stripped down version of the locking changes
necessary to support dynamic DMA-buf handling.

It adds a dynamic flag for both importers as well as exporters
so that drivers can choose if they want the reservation object
locked or unlocked during mapping of attachments.

For compatibility between drivers we cache the DMA-buf mapping
during attaching an importer as soon as exporter/importer
disagree on the dynamic handling.

This change has gone through a lengthy discussion on dri-devel
and other mailing lists with at least 3-4 different attempts and
dead-ends until we settled on this solution. Please refer to the
mailing lists archives for full background on the history of
this change.

v2: cleanup set_name merge, improve kerneldoc

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-buf.c | 102 +++++++++++++++++++++++++++++++++-----
 include/linux/dma-buf.h   |  57 +++++++++++++++++++--
 2 files changed, 143 insertions(+), 16 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 433d91d710e4..753be84b5fd6 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -45,10 +45,10 @@ static char *dmabuffs_dname(struct dentry *dentry, char *buffer, int buflen)
 	size_t ret = 0;
 
 	dmabuf = dentry->d_fsdata;
-	mutex_lock(&dmabuf->lock);
+	dma_resv_lock(dmabuf->resv, NULL);
 	if (dmabuf->name)
 		ret = strlcpy(name, dmabuf->name, DMA_BUF_NAME_LEN);
-	mutex_unlock(&dmabuf->lock);
+	dma_resv_unlock(dmabuf->resv);
 
 	return dynamic_dname(dentry, buffer, buflen, "/%s:%s",
 			     dentry->d_name.name, ret > 0 ? name : "");
@@ -334,7 +334,7 @@ static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
 	if (IS_ERR(name))
 		return PTR_ERR(name);
 
-	mutex_lock(&dmabuf->lock);
+	dma_resv_lock(dmabuf->resv, NULL);
 	if (!list_empty(&dmabuf->attachments)) {
 		ret = -EBUSY;
 		kfree(name);
@@ -344,7 +344,7 @@ static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
 	dmabuf->name = name;
 
 out_unlock:
-	mutex_unlock(&dmabuf->lock);
+	dma_resv_unlock(dmabuf->resv);
 	return ret;
 }
 
@@ -403,10 +403,10 @@ static void dma_buf_show_fdinfo(struct seq_file *m, struct file *file)
 	/* Don't count the temporary reference taken inside procfs seq_show */
 	seq_printf(m, "count:\t%ld\n", file_count(dmabuf->file) - 1);
 	seq_printf(m, "exp_name:\t%s\n", dmabuf->exp_name);
-	mutex_lock(&dmabuf->lock);
+	dma_resv_lock(dmabuf->resv, NULL);
 	if (dmabuf->name)
 		seq_printf(m, "name:\t%s\n", dmabuf->name);
-	mutex_unlock(&dmabuf->lock);
+	dma_resv_unlock(dmabuf->resv);
 }
 
 static const struct file_operations dma_buf_fops = {
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
index ec212cb27fdc..bcc0f4d0b678 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -42,6 +42,18 @@ struct dma_buf_ops {
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
+	 * Mutual exclusive with @cache_sgt_mapping.
+	 */
+	bool dynamic_mapping;
+
 	/**
 	 * @attach:
 	 *
@@ -109,6 +121,9 @@ struct dma_buf_ops {
 	 * any other kind of sharing that the exporter might wish to make
 	 * available to buffer-users.
 	 *
+	 * This is always called with the dmabuf->resv object locked when
+	 * the dynamic_mapping flag is true.
+	 *
 	 * Returns:
 	 *
 	 * A &sg_table scatter list of or the backing storage of the DMA buffer,
@@ -267,7 +282,8 @@ struct dma_buf_ops {
  * struct dma_buf - shared buffer object
  * @size: size of the buffer
  * @file: file pointer used for sharing buffers across, and for refcounting.
- * @attachments: list of dma_buf_attachment that denotes all devices attached.
+ * @attachments: list of dma_buf_attachment that denotes all devices attached,
+ *               protected by dma_resv lock.
  * @ops: dma_buf_ops associated with this buffer object.
  * @lock: used internally to serialize list manipulation, attach/detach and
  *        vmap/unmap, and accesses to name
@@ -323,10 +339,12 @@ struct dma_buf {
  * struct dma_buf_attachment - holds device-buffer attachment data
  * @dmabuf: buffer for this attachment.
  * @dev: device attached to the buffer.
- * @node: list of dma_buf_attachment.
+ * @node: list of dma_buf_attachment, protected by dma_resv lock of the dmabuf.
  * @sgt: cached mapping.
  * @dir: direction of cached mapping.
  * @priv: exporter specific attachment data.
+ * @dynamic_mapping: true if dma_buf_map/unmap_attachment() is called with the
+ * dma_resv lock held.
  *
  * This structure holds the attachment information between the dma_buf buffer
  * and its user device(s). The list contains one attachment struct per device
@@ -343,6 +361,7 @@ struct dma_buf_attachment {
 	struct list_head node;
 	struct sg_table *sgt;
 	enum dma_data_direction dir;
+	bool dynamic_mapping;
 	void *priv;
 };
 
@@ -394,10 +413,39 @@ static inline void get_dma_buf(struct dma_buf *dmabuf)
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
 
@@ -409,6 +457,7 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *,
 					enum dma_data_direction);
 void dma_buf_unmap_attachment(struct dma_buf_attachment *, struct sg_table *,
 				enum dma_data_direction);
+void dma_buf_move_notify(struct dma_buf *dma_buf);
 int dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
 			     enum dma_data_direction dir);
 int dma_buf_end_cpu_access(struct dma_buf *dma_buf,
-- 
2.17.1

