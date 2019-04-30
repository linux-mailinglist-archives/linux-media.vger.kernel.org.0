Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BBA4F517
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2019 13:10:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727106AbfD3LKI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Apr 2019 07:10:08 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:43835 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726646AbfD3LKH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Apr 2019 07:10:07 -0400
Received: by mail-wr1-f65.google.com with SMTP id a12so20494504wrq.10;
        Tue, 30 Apr 2019 04:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y5E07ktx+efLbvKumCSiATFdG/oguBNyyr/c6YqsUm4=;
        b=H3cwQiS7R8tTn5g1BZMWHEDPNM9bNWbntC4ZvoAvID01wIvqI9bmUOOFUv15v91scb
         C1qpbqahmiRQuJC8Aq5n6xtgghIKF1RYqKzur6ohFahwy6Cdfz9P3FAtI3pdiYVLYnD6
         DT/LkuXa+dLWeK8qnAhpdl8YHrvSqbDQ4fNbXJ2nmmcMyvTg+gMq3KXZ43xoUruVL9+V
         GbatAPnbwBIh4x9nE9P9hvQZTdFz1g357wwG74Ob7SFF32JS8Wl6s3x5ok6S16Aybse2
         BkZQBqc0XCZI2NCf8++VOa+Eth0PBtDKQGZKox/X3KRxrYLYvGVIh7FaHlrFCsgTs88s
         OE+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y5E07ktx+efLbvKumCSiATFdG/oguBNyyr/c6YqsUm4=;
        b=TFRaD4PeRqS9+1GrRlwu+Sy4Kp61c26v5MY2ol/7E2K+6Eia1eogkyFLg8njKJ3ZY/
         bJKSrxskVtD+2qXJCS3ZuMwuZGV+z2ixC+cvBZhFuAb/8CRYnQbdzkPpkFoKAdiGL8rW
         eNM4+BA/kOmS99thqxnAwrjkUV5XpWhFfBuwqKKe2E0DFibxQfI5Dtv7KabRESEOLQUp
         LJKpUs3jUnDh5XukRV3aKKHr885o2z6CdrPbd2+5cBz2YgB/hvtSuPDeCWNQ9RG3HzvX
         k+vhZkIIdgwphuXpCt2RB1oBhjRXVBmNVkNq5+BW/shZNdghqmg9re11ya0lAwVdl037
         aWyg==
X-Gm-Message-State: APjAAAUSYYOQuZYvPlWA6MPVsTWrUXO/XJL6q+4aECFgPuA2ycS/CvGN
        N6cKbYAxyGw711RzA24ugkk=
X-Google-Smtp-Source: APXvYqw5NjFWgrzkTp4ICzt9MaEfnm+UdHYperSOCojD9VbG3ZptOkkp0G4PjTwuTp0ClIkR3IeVGw==
X-Received: by 2002:a05:6000:104:: with SMTP id o4mr3851621wrx.106.1556622604773;
        Tue, 30 Apr 2019 04:10:04 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:b40a:677f:72fa:b9f5])
        by smtp.gmail.com with ESMTPSA id o6sm69900182wre.60.2019.04.30.04.10.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Apr 2019 04:10:03 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     xen-devel@lists.xenproject.org, devel@driverdev.osuosl.org,
        linux-tegra@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, sstabellini@kernel.org,
        jgross@suse.com, boris.ostrovsky@oracle.com, digetx@gmail.com,
        gregkh@linuxfoundation.org, arnd@arndb.de, mchehab@kernel.org,
        kyungmin.park@samsung.com, m.szyprowski@samsung.com,
        pawel@osciak.com, jonathanh@nvidia.com, thierry.reding@gmail.com,
        tomi.valkeinen@ti.com, rodrigo.vivi@intel.com,
        joonas.lahtinen@linux.intel.com, jani.nikula@linux.intel.com,
        sean@poorly.run, maxime.ripard@bootlin.com,
        maarten.lankhorst@linux.intel.com, linux@armlinux.org.uk,
        sumit.semwal@linaro.org
Subject: [PATCH] dma-buf: add struct dma_buf_attach_info v2
Date:   Tue, 30 Apr 2019 13:10:02 +0200
Message-Id: <20190430111002.106168-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a structure for the parameters of dma_buf_attach, this makes it much easier
to add new parameters later on.

v2: rebase cleanup and fix all new implementations as well

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-buf.c                       | 13 +++++++------
 drivers/gpu/drm/armada/armada_gem.c             |  6 +++++-
 drivers/gpu/drm/drm_prime.c                     |  6 +++++-
 drivers/gpu/drm/i915/i915_gem_dmabuf.c          |  6 +++++-
 drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c       |  6 +++++-
 drivers/gpu/drm/tegra/gem.c                     |  6 +++++-
 drivers/gpu/drm/udl/udl_dmabuf.c                |  6 +++++-
 .../common/videobuf2/videobuf2-dma-contig.c     |  6 +++++-
 .../media/common/videobuf2/videobuf2-dma-sg.c   |  6 +++++-
 drivers/misc/fastrpc.c                          |  6 +++++-
 drivers/staging/media/tegra-vde/tegra-vde.c     |  6 +++++-
 drivers/xen/gntdev-dmabuf.c                     |  4 ++++
 include/linux/dma-buf.h                         | 17 +++++++++++++++--
 13 files changed, 76 insertions(+), 18 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 3ae6c0c2cc02..e295e76a8c57 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -535,8 +535,9 @@ EXPORT_SYMBOL_GPL(dma_buf_put);
 /**
  * dma_buf_attach - Add the device to dma_buf's attachments list; optionally,
  * calls attach() of dma_buf_ops to allow device-specific attach functionality
- * @dmabuf:	[in]	buffer to attach device to.
- * @dev:	[in]	device to be attached.
+ * @info:	[in]	holds all the attach related information provided
+ *			by the importer. see &struct dma_buf_attach_info
+ *			for further details.
  *
  * Returns struct dma_buf_attachment pointer for this attachment. Attachments
  * must be cleaned up by calling dma_buf_detach().
@@ -550,20 +551,20 @@ EXPORT_SYMBOL_GPL(dma_buf_put);
  * accessible to @dev, and cannot be moved to a more suitable place. This is
  * indicated with the error code -EBUSY.
  */
-struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
-					  struct device *dev)
+struct dma_buf_attachment *dma_buf_attach(const struct dma_buf_attach_info *info)
 {
+	struct dma_buf *dmabuf = info->dmabuf;
 	struct dma_buf_attachment *attach;
 	int ret;
 
-	if (WARN_ON(!dmabuf || !dev))
+	if (WARN_ON(!dmabuf || !info->dev))
 		return ERR_PTR(-EINVAL);
 
 	attach = kzalloc(sizeof(*attach), GFP_KERNEL);
 	if (!attach)
 		return ERR_PTR(-ENOMEM);
 
-	attach->dev = dev;
+	attach->dev = info->dev;
 	attach->dmabuf = dmabuf;
 
 	mutex_lock(&dmabuf->lock);
diff --git a/drivers/gpu/drm/armada/armada_gem.c b/drivers/gpu/drm/armada/armada_gem.c
index 642d0e70d0f8..19c47821032f 100644
--- a/drivers/gpu/drm/armada/armada_gem.c
+++ b/drivers/gpu/drm/armada/armada_gem.c
@@ -501,6 +501,10 @@ armada_gem_prime_export(struct drm_device *dev, struct drm_gem_object *obj,
 struct drm_gem_object *
 armada_gem_prime_import(struct drm_device *dev, struct dma_buf *buf)
 {
+	struct dma_buf_attach_info attach_info = {
+		.dev = dev->dev,
+		.dmabuf = buf
+	};
 	struct dma_buf_attachment *attach;
 	struct armada_gem_object *dobj;
 
@@ -516,7 +520,7 @@ armada_gem_prime_import(struct drm_device *dev, struct dma_buf *buf)
 		}
 	}
 
-	attach = dma_buf_attach(buf, dev->dev);
+	attach = dma_buf_attach(&attach_info);
 	if (IS_ERR(attach))
 		return ERR_CAST(attach);
 
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index dc079efb3b0f..1dd70fc095ee 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -710,6 +710,10 @@ struct drm_gem_object *drm_gem_prime_import_dev(struct drm_device *dev,
 					    struct dma_buf *dma_buf,
 					    struct device *attach_dev)
 {
+	struct dma_buf_attach_info attach_info = {
+		.dev = attach_dev,
+		.dmabuf = dma_buf
+	};
 	struct dma_buf_attachment *attach;
 	struct sg_table *sgt;
 	struct drm_gem_object *obj;
@@ -730,7 +734,7 @@ struct drm_gem_object *drm_gem_prime_import_dev(struct drm_device *dev,
 	if (!dev->driver->gem_prime_import_sg_table)
 		return ERR_PTR(-EINVAL);
 
-	attach = dma_buf_attach(dma_buf, attach_dev);
+	attach = dma_buf_attach(&attach_info);
 	if (IS_ERR(attach))
 		return ERR_CAST(attach);
 
diff --git a/drivers/gpu/drm/i915/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/i915_gem_dmabuf.c
index 5a101a9462d8..978054157c64 100644
--- a/drivers/gpu/drm/i915/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/i915_gem_dmabuf.c
@@ -277,6 +277,10 @@ static const struct drm_i915_gem_object_ops i915_gem_object_dmabuf_ops = {
 struct drm_gem_object *i915_gem_prime_import(struct drm_device *dev,
 					     struct dma_buf *dma_buf)
 {
+	struct dma_buf_attach_info attach_info = {
+		.dev = dev->dev,
+		.dmabuf = dma_buf
+	};
 	struct dma_buf_attachment *attach;
 	struct drm_i915_gem_object *obj;
 	int ret;
@@ -295,7 +299,7 @@ struct drm_gem_object *i915_gem_prime_import(struct drm_device *dev,
 	}
 
 	/* need to attach */
-	attach = dma_buf_attach(dma_buf, dev->dev);
+	attach = dma_buf_attach(&attach_info);
 	if (IS_ERR(attach))
 		return ERR_CAST(attach);
 
diff --git a/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c b/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
index 0f8b597ccd10..38d06574b251 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
+++ b/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
@@ -156,6 +156,10 @@ struct dma_buf *omap_gem_prime_export(struct drm_device *dev,
 struct drm_gem_object *omap_gem_prime_import(struct drm_device *dev,
 					     struct dma_buf *dma_buf)
 {
+	struct dma_buf_attach_info attach_info = {
+		.dev = dev->dev,
+		.dmabuf = dma_buf
+	};
 	struct dma_buf_attachment *attach;
 	struct drm_gem_object *obj;
 	struct sg_table *sgt;
@@ -173,7 +177,7 @@ struct drm_gem_object *omap_gem_prime_import(struct drm_device *dev,
 		}
 	}
 
-	attach = dma_buf_attach(dma_buf, dev->dev);
+	attach = dma_buf_attach(&attach_info);
 	if (IS_ERR(attach))
 		return ERR_CAST(attach);
 
diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 4f80100ff5f3..8e6b6c879add 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -332,6 +332,10 @@ struct tegra_bo *tegra_bo_create_with_handle(struct drm_file *file,
 static struct tegra_bo *tegra_bo_import(struct drm_device *drm,
 					struct dma_buf *buf)
 {
+	struct dma_buf_attach_info attach_info = {
+		.dev = drm->dev,
+		.dmabuf = buf
+	};
 	struct tegra_drm *tegra = drm->dev_private;
 	struct dma_buf_attachment *attach;
 	struct tegra_bo *bo;
@@ -341,7 +345,7 @@ static struct tegra_bo *tegra_bo_import(struct drm_device *drm,
 	if (IS_ERR(bo))
 		return bo;
 
-	attach = dma_buf_attach(buf, drm->dev);
+	attach = dma_buf_attach(&attach_info);
 	if (IS_ERR(attach)) {
 		err = PTR_ERR(attach);
 		goto free;
diff --git a/drivers/gpu/drm/udl/udl_dmabuf.c b/drivers/gpu/drm/udl/udl_dmabuf.c
index 556f62662aa9..86b928f9742f 100644
--- a/drivers/gpu/drm/udl/udl_dmabuf.c
+++ b/drivers/gpu/drm/udl/udl_dmabuf.c
@@ -226,6 +226,10 @@ static int udl_prime_create(struct drm_device *dev,
 struct drm_gem_object *udl_gem_prime_import(struct drm_device *dev,
 				struct dma_buf *dma_buf)
 {
+	struct dma_buf_attach_info attach_info = {
+		.dev = dev->dev,
+		.dmabuf = dma_buf
+	};
 	struct dma_buf_attachment *attach;
 	struct sg_table *sg;
 	struct udl_gem_object *uobj;
@@ -233,7 +237,7 @@ struct drm_gem_object *udl_gem_prime_import(struct drm_device *dev,
 
 	/* need to attach */
 	get_device(dev->dev);
-	attach = dma_buf_attach(dma_buf, dev->dev);
+	attach = dma_buf_attach(&attach_info);
 	if (IS_ERR(attach)) {
 		put_device(dev->dev);
 		return ERR_CAST(attach);
diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
index 82389aead6ed..b2d844d45ea6 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
@@ -653,6 +653,10 @@ static void vb2_dc_detach_dmabuf(void *mem_priv)
 static void *vb2_dc_attach_dmabuf(struct device *dev, struct dma_buf *dbuf,
 	unsigned long size, enum dma_data_direction dma_dir)
 {
+	struct dma_buf_attach_info attach_info = {
+		.dev = dev,
+		.dmabuf = dbuf
+	};
 	struct vb2_dc_buf *buf;
 	struct dma_buf_attachment *dba;
 
@@ -668,7 +672,7 @@ static void *vb2_dc_attach_dmabuf(struct device *dev, struct dma_buf *dbuf,
 
 	buf->dev = dev;
 	/* create attachment for the dmabuf with the user device */
-	dba = dma_buf_attach(dbuf, buf->dev);
+	dba = dma_buf_attach(&attach_info);
 	if (IS_ERR(dba)) {
 		pr_err("failed to attach dmabuf\n");
 		kfree(buf);
diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
index 270c3162fdcb..ddd5f36a8ec7 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
@@ -608,6 +608,10 @@ static void vb2_dma_sg_detach_dmabuf(void *mem_priv)
 static void *vb2_dma_sg_attach_dmabuf(struct device *dev, struct dma_buf *dbuf,
 	unsigned long size, enum dma_data_direction dma_dir)
 {
+	struct dma_buf_attach_info attach_info = {
+		.dev = dev,
+		.dmabuf = dbuf
+	};
 	struct vb2_dma_sg_buf *buf;
 	struct dma_buf_attachment *dba;
 
@@ -623,7 +627,7 @@ static void *vb2_dma_sg_attach_dmabuf(struct device *dev, struct dma_buf *dbuf,
 
 	buf->dev = dev;
 	/* create attachment for the dmabuf with the user device */
-	dba = dma_buf_attach(dbuf, buf->dev);
+	dba = dma_buf_attach(&attach_info);
 	if (IS_ERR(dba)) {
 		pr_err("failed to attach dmabuf\n");
 		kfree(buf);
diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 39f832d27288..93d0aac05715 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -482,6 +482,7 @@ static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
 			      u64 len, struct fastrpc_map **ppmap)
 {
 	struct fastrpc_session_ctx *sess = fl->sctx;
+	struct dma_buf_attach_info attach_info;
 	struct fastrpc_map *map = NULL;
 	int err = 0;
 
@@ -501,7 +502,10 @@ static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
 		goto get_err;
 	}
 
-	map->attach = dma_buf_attach(map->buf, sess->dev);
+	memset(&attach_info, 0, sizeof(attach_info));
+	attach_info.dev = sess->dev;
+	attach_info.dmabuf = map->buf;
+	map->attach = dma_buf_attach(&attach_info);
 	if (IS_ERR(map->attach)) {
 		dev_err(sess->dev, "Failed to attach dmabuf\n");
 		err = PTR_ERR(map->attach);
diff --git a/drivers/staging/media/tegra-vde/tegra-vde.c b/drivers/staging/media/tegra-vde/tegra-vde.c
index aa6c6bba961e..5a10c1facc27 100644
--- a/drivers/staging/media/tegra-vde/tegra-vde.c
+++ b/drivers/staging/media/tegra-vde/tegra-vde.c
@@ -568,6 +568,10 @@ static int tegra_vde_attach_dmabuf(struct device *dev,
 				   size_t *size,
 				   enum dma_data_direction dma_dir)
 {
+	struct dma_buf_attach_info attach_info = {
+		.dev = dev,
+		.dmabuf = dmabuf
+	};
 	struct dma_buf_attachment *attachment;
 	struct dma_buf *dmabuf;
 	struct sg_table *sgt;
@@ -591,7 +595,7 @@ static int tegra_vde_attach_dmabuf(struct device *dev,
 		return -EINVAL;
 	}
 
-	attachment = dma_buf_attach(dmabuf, dev);
+	attachment = dma_buf_attach(&attach_info);
 	if (IS_ERR(attachment)) {
 		dev_err(dev, "Failed to attach dmabuf\n");
 		err = PTR_ERR(attachment);
diff --git a/drivers/xen/gntdev-dmabuf.c b/drivers/xen/gntdev-dmabuf.c
index 2c4f324f8626..cacca830b482 100644
--- a/drivers/xen/gntdev-dmabuf.c
+++ b/drivers/xen/gntdev-dmabuf.c
@@ -608,6 +608,7 @@ dmabuf_imp_to_refs(struct gntdev_dmabuf_priv *priv, struct device *dev,
 		   int fd, int count, int domid)
 {
 	struct gntdev_dmabuf *gntdev_dmabuf, *ret;
+	struct dma_buf_attach_info attach_info;
 	struct dma_buf *dma_buf;
 	struct dma_buf_attachment *attach;
 	struct sg_table *sgt;
@@ -627,6 +628,9 @@ dmabuf_imp_to_refs(struct gntdev_dmabuf_priv *priv, struct device *dev,
 	gntdev_dmabuf->priv = priv;
 	gntdev_dmabuf->fd = fd;
 
+	memset(&attach_info, 0, sizeof(attach_info));
+	attach_info.dev = dev;
+	attach_info.dmabuf = dma_buf;
 	attach = dma_buf_attach(dma_buf, dev);
 	if (IS_ERR(attach)) {
 		ret = ERR_CAST(attach);
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index a0bd071466fc..b5b0f5e3f186 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -375,6 +375,19 @@ struct dma_buf_export_info {
 	struct dma_buf_export_info name = { .exp_name = KBUILD_MODNAME, \
 					 .owner = THIS_MODULE }
 
+/**
+ * struct dma_buf_attach_info - holds information needed to attach to a dma_buf
+ * @dmabuf:	the exported dma_buf
+ * @dev:	the device which wants to import the attachment
+ *
+ * This structure holds the information required to attach to a buffer. Used
+ * with dma_buf_attach() only.
+ */
+struct dma_buf_attach_info {
+	struct dma_buf *dmabuf;
+	struct device *dev;
+};
+
 /**
  * get_dma_buf - convenience wrapper for get_file.
  * @dmabuf:	[in]	pointer to dma_buf
@@ -389,8 +402,8 @@ static inline void get_dma_buf(struct dma_buf *dmabuf)
 	get_file(dmabuf->file);
 }
 
-struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
-							struct device *dev);
+struct dma_buf_attachment *
+dma_buf_attach(const struct dma_buf_attach_info *info);
 void dma_buf_detach(struct dma_buf *dmabuf,
 				struct dma_buf_attachment *dmabuf_attach);
 
-- 
2.17.1

