Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28880395D6
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2019 21:35:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730701AbfFGTfs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jun 2019 15:35:48 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:58100 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729943AbfFGTfs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Jun 2019 15:35:48 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x57JZT6K085446;
        Fri, 7 Jun 2019 14:35:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559936129;
        bh=cAAtY/BJUn7iO79jToVtIHll/5ZQdyNmALRTaYjK+7U=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=fOCL+ce0w2H8xNelRB5QL8rqp5d7b5keq5sMXBCnQK0sz46tcG8LJ8UxUqwvIfKpI
         Jfvrkt9C/IIT6q9TXXDIYUu9kYVVggthejZ2sNosS/mguHF67Gs9QbYWPgCrQ2u9SA
         NK8JnV45EjO7o5AQNHf+B/3I+gR5Hs6sUX0OKD0g=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x57JZTc5029112
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 7 Jun 2019 14:35:29 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 7 Jun
 2019 14:35:29 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 7 Jun 2019 14:35:29 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com [128.247.22.53])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x57JZTgU130558;
        Fri, 7 Jun 2019 14:35:29 -0500
Received: from localhost ([10.250.68.219])
        by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id x57JZRm20302;
        Fri, 7 Jun 2019 14:35:27 -0500 (CDT)
From:   "Andrew F. Davis" <afd@ti.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Will Deacon <will.deacon@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Tero Kristo <t-kristo@ti.com>,
        William Mills <wmills@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>
CC:     <devicetree@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <iommu@lists.linux-foundation.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>,
        <linux-kernel@vger.kernel.org>, "Andrew F . Davis" <afd@ti.com>
Subject: [RFC PATCH 2/2] soc: ti: Add Support for the TI Page-based Address Translator (PAT)
Date:   Fri, 7 Jun 2019 15:35:23 -0400
Message-ID: <20190607193523.25700-3-afd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190607193523.25700-1-afd@ti.com>
References: <20190607193523.25700-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds a driver for the Page-based Address Translator (PAT)
present on various TI SoCs. A PAT device performs address translation
using tables stored in an internal SRAM. Each PAT supports a set number
of pages, each occupying a programmable 4KB, 16KB, 64KB, or 1MB of
addresses in a window for which an incoming transaction will be
translated.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 drivers/soc/ti/Kconfig      |   9 +
 drivers/soc/ti/Makefile     |   1 +
 drivers/soc/ti/ti-pat.c     | 569 ++++++++++++++++++++++++++++++++++++
 include/uapi/linux/ti-pat.h |  44 +++
 4 files changed, 623 insertions(+)
 create mode 100644 drivers/soc/ti/ti-pat.c
 create mode 100644 include/uapi/linux/ti-pat.h

diff --git a/drivers/soc/ti/Kconfig b/drivers/soc/ti/Kconfig
index f0be35d3dcba..b838ae74d01f 100644
--- a/drivers/soc/ti/Kconfig
+++ b/drivers/soc/ti/Kconfig
@@ -86,4 +86,13 @@ config TI_SCI_INTA_MSI_DOMAIN
 	help
 	  Driver to enable Interrupt Aggregator specific MSI Domain.
 
+config TI_PAT
+	tristate "TI PAT DMA-BUF exporter"
+	select REGMAP
+	help
+	  Driver for TI Page-based Address Translator (PAT). This driver
+	  provides the an API allowing the remapping of a non-contiguous
+	  DMA-BUF into a contiguous one that is sutable for devices needing
+	  coniguous memory.
+
 endif # SOC_TI
diff --git a/drivers/soc/ti/Makefile b/drivers/soc/ti/Makefile
index b3868d392d4f..1369642b40c3 100644
--- a/drivers/soc/ti/Makefile
+++ b/drivers/soc/ti/Makefile
@@ -9,3 +9,4 @@ obj-$(CONFIG_AMX3_PM)			+= pm33xx.o
 obj-$(CONFIG_WKUP_M3_IPC)		+= wkup_m3_ipc.o
 obj-$(CONFIG_TI_SCI_PM_DOMAINS)		+= ti_sci_pm_domains.o
 obj-$(CONFIG_TI_SCI_INTA_MSI_DOMAIN)	+= ti_sci_inta_msi.o
+obj-$(CONFIG_TI_PAT)			+= ti-pat.o
diff --git a/drivers/soc/ti/ti-pat.c b/drivers/soc/ti/ti-pat.c
new file mode 100644
index 000000000000..7359ea0f7ccf
--- /dev/null
+++ b/drivers/soc/ti/ti-pat.c
@@ -0,0 +1,569 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * TI PAT mapped DMA-BUF memory re-exporter
+ *
+ * Copyright (C) 2018-2019 Texas Instruments Incorporated - http://www.ti.com/
+ *	Andrew F. Davis <afd@ti.com>
+ */
+
+#include <linux/fs.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/mod_devicetable.h>
+#include <linux/uaccess.h>
+#include <linux/miscdevice.h>
+#include <linux/regmap.h>
+#include <linux/dma-buf.h>
+#include <linux/genalloc.h>
+#include <linux/vmalloc.h>
+#include <linux/slab.h>
+
+#include <linux/ti-pat.h>
+
+#define TI_PAT_DRIVER_NAME	"ti-pat"
+
+/* TI PAT MMRS registers */
+#define TI_PAT_MMRS_PID		0x0 /* Revision Register */
+#define TI_PAT_MMRS_CONFIG	0x4 /* Config Register */
+#define TI_PAT_MMRS_CONTROL	0x10 /* Control Register */
+
+/* TI PAT CONTROL register field values */
+#define TI_PAT_CONTROL_ARB_MODE_UF	0x0 /* Updates first */
+#define TI_PAT_CONTROL_ARB_MODE_RR	0x2 /* Round-robin */
+
+#define TI_PAT_CONTROL_PAGE_SIZE_4KB	0x0
+#define TI_PAT_CONTROL_PAGE_SIZE_16KB	0x1
+#define TI_PAT_CONTROL_PAGE_SIZE_64KB	0x2
+#define TI_PAT_CONTROL_PAGE_SIZE_1MB	0x3
+
+static unsigned int ti_pat_page_sizes[] = {
+	[TI_PAT_CONTROL_PAGE_SIZE_4KB]  = 4 * 1024,
+	[TI_PAT_CONTROL_PAGE_SIZE_16KB] = 16 * 1024,
+	[TI_PAT_CONTROL_PAGE_SIZE_64KB] = 64 * 1024,
+	[TI_PAT_CONTROL_PAGE_SIZE_1MB]  = 1024 * 1024,
+};
+
+enum ti_pat_mmrs_fields {
+	/* Revision */
+	F_PID_MAJOR,
+	F_PID_MINOR,
+
+	/* Controls */
+	F_CONTROL_ARB_MODE,
+	F_CONTROL_PAGE_SIZE,
+	F_CONTROL_REPLACE_OID_EN,
+	F_CONTROL_EN,
+
+	/* sentinel */
+	F_MAX_FIELDS
+};
+
+static const struct reg_field ti_pat_mmrs_reg_fields[] = {
+	/* Revision */
+	[F_PID_MAJOR]			= REG_FIELD(TI_PAT_MMRS_PID, 8, 10),
+	[F_PID_MINOR]			= REG_FIELD(TI_PAT_MMRS_PID, 0, 5),
+	/* Controls */
+	[F_CONTROL_ARB_MODE]		= REG_FIELD(TI_PAT_MMRS_CONTROL, 6, 7),
+	[F_CONTROL_PAGE_SIZE]		= REG_FIELD(TI_PAT_MMRS_CONTROL, 4, 5),
+	[F_CONTROL_REPLACE_OID_EN]	= REG_FIELD(TI_PAT_MMRS_CONTROL, 1, 1),
+	[F_CONTROL_EN]			= REG_FIELD(TI_PAT_MMRS_CONTROL, 0, 0),
+};
+
+/**
+ * struct ti_pat_data - PAT device instance data
+ * @dev: PAT device structure
+ * @mdev: misc device
+ * @mmrs_map: Register map of MMRS region
+ * @table_base: Base address of TABLE region
+ */
+struct ti_pat_data {
+	struct device *dev;
+	struct miscdevice mdev;
+	struct regmap *mmrs_map;
+	struct regmap_field *mmrs_fields[F_MAX_FIELDS];
+	void __iomem *table_base;
+	unsigned int page_count;
+	unsigned int page_size;
+	phys_addr_t window_base;
+	struct gen_pool *pool;
+};
+
+struct ti_pat_dma_buf_attachment {
+	struct device *dev;
+	struct sg_table *table;
+	struct ti_pat_buffer *buffer;
+	struct list_head list;
+};
+
+struct ti_pat_buffer {
+	struct ti_pat_data *pat;
+	struct dma_buf *i_dma_buf;
+	size_t size;
+	unsigned long offset;
+	struct dma_buf *e_dma_buf;
+
+	struct dma_buf_attachment *attachment;
+	struct sg_table *sgt;
+
+	struct list_head attachments;
+	int map_count;
+
+	struct mutex lock;
+};
+
+static const struct regmap_config ti_pat_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+};
+
+static int ti_pat_dma_buf_attach(struct dma_buf *dmabuf,
+				 struct dma_buf_attachment *attachment)
+{
+	struct ti_pat_dma_buf_attachment *a;
+	struct ti_pat_buffer *buffer = dmabuf->priv;
+
+	a = kzalloc(sizeof(*a), GFP_KERNEL);
+	if (!a)
+		return -ENOMEM;
+
+	a->dev = attachment->dev;
+	a->buffer = buffer;
+	INIT_LIST_HEAD(&a->list);
+
+	a->table = kzalloc(sizeof(*a->table), GFP_KERNEL);
+	if (!a->table) {
+		kfree(a);
+		return -ENOMEM;
+	}
+
+	if (sg_alloc_table(a->table, 1, GFP_KERNEL)) {
+		kfree(a->table);
+		kfree(a);
+		return -ENOMEM;
+	}
+
+	sg_set_page(a->table->sgl, pfn_to_page(PFN_DOWN(buffer->offset)), buffer->size, 0);
+
+	attachment->priv = a;
+
+	mutex_lock(&buffer->lock);
+	/* First time attachment we attach to parent */
+	if (list_empty(&buffer->attachments)) {
+		buffer->attachment = dma_buf_attach(buffer->i_dma_buf, buffer->pat->dev);
+		if (IS_ERR(buffer->attachment)) {
+			dev_err(buffer->pat->dev, "Unable to attach to parent DMA-BUF\n");
+			mutex_unlock(&buffer->lock);
+			kfree(a->table);
+			kfree(a);
+			return PTR_ERR(buffer->attachment);
+		}
+	}
+	list_add(&a->list, &buffer->attachments);
+	mutex_unlock(&buffer->lock);
+
+	return 0;
+}
+
+static void ti_pat_dma_buf_detatch(struct dma_buf *dmabuf,
+				   struct dma_buf_attachment *attachment)
+{
+	struct ti_pat_dma_buf_attachment *a = attachment->priv;
+	struct ti_pat_buffer *buffer = dmabuf->priv;
+
+	mutex_lock(&buffer->lock);
+	list_del(&a->list);
+	/* Last attachment we detach from parent */
+	if (list_empty(&buffer->attachments)) {
+		dma_buf_detach(buffer->i_dma_buf, buffer->attachment);
+		buffer->attachment = NULL;
+	}
+	mutex_unlock(&buffer->lock);
+
+	kfree(a);
+}
+
+static void ti_pat_set_page(struct ti_pat_data *pat, size_t page_id, dma_addr_t dma_address)
+{
+	unsigned int j = page_id >> 8;
+	unsigned int k = page_id & 0xff;
+	dma_addr_t offset = (j * 0x1000) + (k * 0x8);
+	void __iomem *table_base_l = pat->table_base + offset;
+	void __iomem *table_base_h = table_base_l + 0x4;
+
+	u32 base_l = dma_address >> 12;
+	u32 base_h = (dma_address >> 44) & GENMASK(3, 0);
+
+	dev_dbg(pat->dev, "Enabling PAT index: %zu pointing to %pad\n", page_id, &dma_address);
+
+	writel(base_l, table_base_l);
+	writel(BIT(31) | base_h, table_base_h);
+}
+
+static void ti_pat_unset_page(struct ti_pat_data *pat, size_t page_id)
+{
+	unsigned int j = page_id >> 8;
+	unsigned int k = page_id & 0xff;
+	dma_addr_t offset = (j * 0x1000) + (k * 0x8);
+	void __iomem *table_base_l = pat->table_base + offset;
+	void __iomem *table_base_h = table_base_l + 0x4;
+
+	dev_dbg(pat->dev, "Disabling PAT index: %zu\n", page_id);
+
+	writel(0, table_base_h);
+}
+
+static struct sg_table *ti_pat_map_dma_buf(struct dma_buf_attachment *attachment,
+					   enum dma_data_direction direction)
+{
+	struct ti_pat_dma_buf_attachment *a = attachment->priv;
+	struct ti_pat_buffer *buffer = a->buffer;
+	struct ti_pat_data *pat = buffer->pat;
+	struct sg_table *table = a->table;
+	struct scatterlist *s;
+	unsigned int i, s_len;
+	size_t page_id;
+	int ret;
+
+	mutex_lock(&buffer->lock);
+	/* First time mapping we map to parent */
+	if (!buffer->map_count) {
+		buffer->sgt = dma_buf_map_attachment(buffer->attachment, DMA_BIDIRECTIONAL);
+		if (IS_ERR(buffer->sgt)) {
+			dev_err(pat->dev, "Unable to map parent DMA-BUF\n");
+			return buffer->sgt;
+		}
+
+		/* And program PAT area for this set of pages */
+		page_id = (buffer->offset - pat->window_base) / pat->page_size;
+		for_each_sg(buffer->sgt->sgl, s, buffer->sgt->nents, i) {
+			if (s->offset) {
+				dev_err(pat->dev, "Cannot use offset buffers\n");
+				ret = -EINVAL;
+				goto unmap;
+			}
+
+			if (s->length % pat->page_size) {
+				dev_err(pat->dev, "Cannot use buffers not a multiple of page size\n");
+				ret = -EINVAL;
+				goto unmap;
+			}
+
+			for (s_len = 0; s_len < s->length; s_len += pat->page_size)
+				ti_pat_set_page(pat, page_id++, s->dma_address + s_len);
+		}
+	}
+	buffer->map_count++;
+	mutex_unlock(&buffer->lock);
+
+	/* Map the attached device's table to get DMA addresses */
+	if (!dma_map_sg_attrs(attachment->dev, table->sgl, table->nents, direction, DMA_ATTR_SKIP_CPU_SYNC))
+		return ERR_PTR(-ENOMEM);
+
+	return table;
+
+unmap:
+	dma_buf_unmap_attachment(buffer->attachment, buffer->sgt, DMA_BIDIRECTIONAL);
+	return ERR_PTR(ret);
+}
+
+static void ti_pat_unmap_dma_buf(struct dma_buf_attachment *attachment,
+				 struct sg_table *table,
+				 enum dma_data_direction direction)
+{
+	struct ti_pat_dma_buf_attachment *a = attachment->priv;
+	struct ti_pat_buffer *buffer = a->buffer;
+	struct ti_pat_data *pat = buffer->pat;
+
+	/* Unmap the attached device's table */
+	dma_unmap_sg_attrs(attachment->dev, table->sgl, table->nents, direction, DMA_ATTR_SKIP_CPU_SYNC);
+
+	mutex_lock(&buffer->lock);
+	buffer->map_count--;
+	/* Last mapping we unmap from parent */
+	if (!buffer->map_count) {
+		/* Disable PAT pages for this area */
+		size_t page_start = (buffer->offset - pat->window_base) / pat->page_size;
+		size_t page_end = page_start + (buffer->size / pat->page_size);
+		for (; page_start < page_end; page_start++)
+			ti_pat_unset_page(pat, page_start);
+
+		dma_buf_unmap_attachment(buffer->attachment, buffer->sgt, DMA_BIDIRECTIONAL);
+		buffer->sgt = NULL;
+	}
+	mutex_unlock(&buffer->lock);
+}
+
+static void ti_pat_dma_buf_release(struct dma_buf *dmabuf)
+{
+	struct ti_pat_buffer *buffer = dmabuf->priv;
+
+	if (buffer->attachment && buffer->sgt)
+		dma_buf_unmap_attachment(buffer->attachment, buffer->sgt, DMA_BIDIRECTIONAL);
+	if (buffer->i_dma_buf && !IS_ERR_OR_NULL(buffer->attachment))
+		dma_buf_detach(buffer->i_dma_buf, buffer->attachment);
+	if (buffer->i_dma_buf)
+		dma_buf_put(buffer->i_dma_buf);
+
+	if (buffer->offset)
+		gen_pool_free(buffer->pat->pool, buffer->offset, buffer->size);
+
+	kfree(buffer);
+}
+
+void *ti_pat_dma_buf_map(struct dma_buf *dma_buf, unsigned long page_num)
+{
+	return NULL;
+}
+
+int ti_pat_dma_buf_mmap(struct dma_buf *dma_buf, struct vm_area_struct *vma)
+{
+	return -EINVAL;
+}
+
+static const struct dma_buf_ops dma_buf_ops = {
+	.attach = ti_pat_dma_buf_attach,
+	.detach = ti_pat_dma_buf_detatch,
+
+	.map_dma_buf = ti_pat_map_dma_buf,
+	.unmap_dma_buf = ti_pat_unmap_dma_buf,
+
+	.release = ti_pat_dma_buf_release,
+
+	.map = ti_pat_dma_buf_map,
+	.mmap = ti_pat_dma_buf_mmap,
+};
+
+int ti_pat_export(struct ti_pat_data *pat,
+		  struct dma_buf *i_dma_buf,
+		  struct dma_buf **e_dma_buf)
+{
+	struct ti_pat_buffer *buffer;
+	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
+	int ret;
+
+	buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
+	if (!buffer)
+		return -ENOMEM;
+
+	buffer->pat = pat;
+	buffer->i_dma_buf = i_dma_buf;
+	buffer->size = buffer->i_dma_buf->size;
+	mutex_init(&buffer->lock);
+	INIT_LIST_HEAD(&buffer->attachments);
+	buffer->map_count = 0;
+
+	/* Reserve PAT space */
+	buffer->offset = gen_pool_alloc(buffer->pat->pool, buffer->size);
+	if (!buffer->offset) {
+		ret = -ENOMEM;
+		goto free_buffer;
+	}
+
+	exp_info.ops = &dma_buf_ops;
+	exp_info.size = buffer->size;
+	exp_info.flags = O_RDWR;
+	exp_info.priv = buffer;
+
+	*e_dma_buf = dma_buf_export(&exp_info);
+	if (IS_ERR(*e_dma_buf)) {
+		ret = PTR_ERR(*e_dma_buf);
+		goto free_pool;
+	}
+
+	return 0;
+
+free_pool:
+	gen_pool_free(buffer->pat->pool, buffer->offset, buffer->size);
+free_buffer:
+	kfree(buffer);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(ti_pat_export);
+
+static long ti_pat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
+{
+	struct ti_pat_data *pat = container_of(file->private_data, struct ti_pat_data, mdev);
+
+	switch (cmd) {
+	case TI_PAT_IOC_EXPORT:
+	{
+		struct ti_pat_export_data export;
+		struct dma_buf *i_dma_buf;
+		struct dma_buf *e_dma_buf;
+		int ret;
+
+		if (_IOC_SIZE(cmd) > sizeof(export))
+			return -EINVAL;
+
+		if (copy_from_user(&export, (void __user *)arg, _IOC_SIZE(cmd)))
+			return -EFAULT;
+
+		i_dma_buf = dma_buf_get(export.fd);
+		if (IS_ERR(i_dma_buf))
+			return PTR_ERR(i_dma_buf);
+
+		ret = ti_pat_export(pat, i_dma_buf, &e_dma_buf);
+		if (ret) {
+			dma_buf_put(i_dma_buf);
+			return ret;
+		}
+
+		export.fd = dma_buf_fd(e_dma_buf, O_CLOEXEC);
+		if (export.fd < 0) {
+			dma_buf_put(e_dma_buf);
+			dma_buf_put(i_dma_buf);
+			return export.fd;
+		}
+
+		if (copy_to_user((void __user *)arg, &export, _IOC_SIZE(cmd)))
+			return -EFAULT;
+
+		break;
+	}
+	default:
+		return -ENOTTY;
+	}
+
+	return 0;
+}
+
+static const struct file_operations ti_pat_fops = {
+	.owner          = THIS_MODULE,
+	.unlocked_ioctl = ti_pat_ioctl,
+#ifdef CONFIG_COMPAT
+	.compat_ioctl	= ti_pat_ioctl,
+#endif
+};
+
+static const struct of_device_id ti_pat_of_match[] = {
+	{ .compatible = "ti,j721e-pat", },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, ti_pat_of_match);
+
+static int ti_pat_probe(struct platform_device *pdev)
+{
+	struct ti_pat_data *pat;
+	struct resource *res;
+	void __iomem *base;
+	unsigned int revision_major;
+	unsigned int revision_minor;
+	resource_size_t size;
+	size_t page_size;
+	int i, ret;
+
+	pat = devm_kzalloc(&pdev->dev, sizeof(*pat), GFP_KERNEL);
+	if (!pat)
+		return -ENOMEM;
+	platform_set_drvdata(pdev, pat);
+	pat->dev = &pdev->dev;
+
+	/* MMRS */
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	base = devm_ioremap_resource(pat->dev, res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	pat->mmrs_map = devm_regmap_init_mmio(pat->dev, base, &ti_pat_regmap_config);
+	if (IS_ERR(pat->mmrs_map)) {
+		dev_err(pat->dev, "Unable to allocate MMRS register map\n");
+		return PTR_ERR(pat->mmrs_map);
+	}
+
+	for (i = 0; i < F_MAX_FIELDS; i++) {
+		pat->mmrs_fields[i] = devm_regmap_field_alloc(pat->dev, pat->mmrs_map, ti_pat_mmrs_reg_fields[i]);
+		if (IS_ERR(pat->mmrs_fields[i])) {
+			dev_err(pat->dev, "Unable to allocate Regmap fields\n");
+			return PTR_ERR(pat->mmrs_fields[i]);
+		}
+	}
+
+	ret = regmap_read(pat->mmrs_map, TI_PAT_MMRS_CONFIG, &pat->page_count);
+	if (ret) {
+		dev_err(pat->dev, "Unable to read device page count\n");
+		return ret;
+	}
+
+	ret = regmap_field_read(pat->mmrs_fields[F_PID_MAJOR], &revision_major);
+	if (ret) {
+		dev_err(pat->dev, "Unable to read device major revision\n");
+		return ret;
+	}
+
+	ret = regmap_field_read(pat->mmrs_fields[F_PID_MINOR], &revision_minor);
+	if (ret) {
+		dev_err(pat->dev, "Unable to read device minor revision\n");
+		return ret;
+	}
+
+	dev_info(pat->dev, "Found PAT Rev %d.%d with %d pages\n", revision_major, revision_minor, pat->page_count);
+
+	/* TABLE */
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	if (!res) {
+		dev_err(pat->dev, "Unable to find TABLE IO resource\n");
+		return -ENOENT;
+	}
+	size = resource_size(res);
+
+	/* 256 pages per 4KB of table space */
+	if (size != (pat->page_count << 4))
+		dev_warn(pat->dev, "TABLE region size (%llu) does not match reported page count\n", size);
+
+	pat->table_base = devm_ioremap_resource(pat->dev, res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	/* WINDOW */
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 2);
+	if (!res) {
+		dev_err(pat->dev, "Unable to find WINDOW IO resource\n");
+		return -ENOENT;
+	}
+	pat->window_base = res->start;
+	size = resource_size(res);
+
+	pat->page_size = PAGE_SIZE;
+	for (page_size = 0; page_size < ARRAY_SIZE(ti_pat_page_sizes); page_size++)
+		if (ti_pat_page_sizes[page_size] == pat->page_size)
+			break;
+	if (page_size == ARRAY_SIZE(ti_pat_page_sizes)) {
+		dev_err(pat->dev, "Unsupported PAGE_SIZE (%d)\n", pat->page_size);
+		return -EINVAL;
+	}
+	regmap_field_write(pat->mmrs_fields[F_CONTROL_PAGE_SIZE], page_size);
+
+	/* Enable this PAT module */
+	regmap_field_write(pat->mmrs_fields[F_CONTROL_EN], 1);
+
+	pat->pool = gen_pool_create(PAGE_SHIFT, -1);
+	if (!pat->pool)
+		return -ENOMEM;
+	gen_pool_add(pat->pool, pat->window_base, size, -1);
+
+	pat->mdev.minor = MISC_DYNAMIC_MINOR;
+	pat->mdev.name = pdev->name;
+	pat->mdev.fops = &ti_pat_fops;
+	pat->mdev.parent = NULL;
+	ret = misc_register(&pat->mdev);
+	if (ret) {
+		dev_err(pat->dev, "Unable to register misc device\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static struct platform_driver ti_pat_driver = {
+	.probe = ti_pat_probe,
+	.driver = {
+		.name = TI_PAT_DRIVER_NAME,
+		.of_match_table = ti_pat_of_match,
+	},
+};
+module_platform_driver(ti_pat_driver);
+
+MODULE_AUTHOR("Andrew F. Davis <afd@ti.com>");
+MODULE_DESCRIPTION("TI PAT mapped DMA-BUF memory exporter");
+MODULE_LICENSE("GPL v2");
diff --git a/include/uapi/linux/ti-pat.h b/include/uapi/linux/ti-pat.h
new file mode 100644
index 000000000000..b06d79454815
--- /dev/null
+++ b/include/uapi/linux/ti-pat.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * TI PAT mapped DMA-BUF memory exporter UAPI
+ *
+ * Copyright (C) 2018 Texas Instruments Incorporated - http://www.ti.com/
+ *	Andrew F. Davis <afd@ti.com>
+ */
+
+#ifndef _UAPI_LINUX_TI_PAT_H
+#define _UAPI_LINUX_TI_PAT_H
+
+#include <linux/ioctl.h>
+#include <linux/types.h>
+
+/**
+ * DOC: TI PAT Userspace API
+ *
+ * create a client by opening /dev/ti-pat
+ * most operations handled via following ioctls
+ */
+
+/**
+ * struct ti_pat_allocation_data - metadata passed from userspace for allocations
+ * @fd:			populated with DMA-BUF FD for this allocation
+ * @flags:		flags for the allocation
+ *
+ * Provided by userspace as an argument to the ioctl
+ */
+struct ti_pat_export_data {
+	__u32 fd;
+	__u32 flags;
+};
+
+#define TI_PAT_IOC_MAGIC 'P'
+
+/**
+ * DOC: TI_PAT_IOC_EXPORT - Re-export DMA-BUF through TI PAT
+ *
+ * Takes an ti_pat_export_data struct and returns it with the fd field
+ * populated with the DMA-BUF handle for the new export.
+ */
+#define TI_PAT_IOC_EXPORT _IOWR(TI_PAT_IOC_MAGIC, 0, struct ti_pat_export_data)
+
+#endif /* _UAPI_LINUX_TI_PAT_H */
-- 
2.17.1

