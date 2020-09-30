Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2084D27E7ED
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 13:53:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729665AbgI3Lxk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 07:53:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729584AbgI3Lxf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 07:53:35 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CA5FC0613D0
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 04:53:34 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id k18so1429308wmj.5
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 04:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T2Y+pNuqVsK+FbuwU/EbDVlcgIqq7Iyg6VQ71g5Knek=;
        b=1utYACZaDjLbenSzPmyC5rwV6iA7yc96UVnWd5PvkcCtmuD6F/qK598LDiCUt1sOfH
         LtGFNs9/4mR48S2XqaWyA0LWgtnHk4RjGiO36e9jlQiVLyvRTxUDTf1uZVPscVtROe9K
         yXtZGIUPztRHee05Lgyxa4ywE1gKZp9q5LpQHaJ85UYVDbVHK+3qMphJT9so8/b5m4OM
         UhB5AFNUssA4MgH2jGGYrqSS0WISlgInIFc9gikA7PEnU1Mtrv0nfwLkLYG92KptpYg+
         6VYclqiyrY897ybdNKCRjzHoxjTHsC7b9F+RuOSwj8avgR7Xx13srDQprU0Ms0/+Ka1D
         oIrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T2Y+pNuqVsK+FbuwU/EbDVlcgIqq7Iyg6VQ71g5Knek=;
        b=YYrunzUoZEhFWwhvVvvjtkTBtctzrnoYWG4ZXXGD+jNxrvphSe49byZCTL7E4xdP8Y
         sHazixjN0bDdRMRFMLp2arztyP+Qgj+7va/dPSW6DXJio5Doh+sdiMN8TS/jQBDTob3a
         IA/Y6U+NRVmkcGxygt1xB5PzH6H14jjLbY74O3ZO36J8bWePVtEAcCVMT2kFat0utwcu
         peo1xNs2DE/xkA3wWEzYyGvgF5xGcqIkD/8I5Cb9nPIdv1W9WttTGDCmvcTdeOLR5/oE
         hutn0PsnlWlbYDNfjOfgx9B2beABhJP7B53RIkTvO57c38VrENLhk0tWMOtMIwwsB+9i
         zXsQ==
X-Gm-Message-State: AOAM532ujAU3+ez5YyoE1qzzzJQepU0fs2CEmCCw9hCkvNisosSk+O6U
        FlJS0c2YPOLNohf9qaENaoO9SQ==
X-Google-Smtp-Source: ABdhPJxrcXbvhGgqI6QyeODxiAuxuOEgBZMaiJ8AgouysauN7kMXGrHwT0+FtODMHs8Uk65CM5xOUg==
X-Received: by 2002:a05:600c:1046:: with SMTP id 6mr2615468wmx.178.1601466813163;
        Wed, 30 Sep 2020 04:53:33 -0700 (PDT)
Received: from alex-xps13.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id s12sm2222353wmd.20.2020.09.30.04.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 04:53:32 -0700 (PDT)
From:   Alexandre Bailon <abailon@baylibre.com>
To:     linux-remoteproc@vger.kernel.org
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        sumit.semwal@linaro.org, christian.koenig@amd.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        jstephan@baylibre.com, stephane.leprovost@mediatek.com,
        gpain@baylibre.com, mturquette@baylibre.com,
        Alexandre Bailon <abailon@baylibre.com>
Subject: [RFC PATCH 1/4] Add a RPMSG driver for the APU in the mt8183
Date:   Wed, 30 Sep 2020 13:53:47 +0200
Message-Id: <20200930115350.5272-2-abailon@baylibre.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200930115350.5272-1-abailon@baylibre.com>
References: <20200930115350.5272-1-abailon@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This adds a driver to communicate with the APU available
in the mt8183. The driver is generic and could be used for other APU.
It mostly provides a userspace interface to send messages and
and share big buffers with the APU.

Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
---
 drivers/rpmsg/Kconfig          |   9 +
 drivers/rpmsg/Makefile         |   1 +
 drivers/rpmsg/apu_rpmsg.c      | 606 +++++++++++++++++++++++++++++++++
 drivers/rpmsg/apu_rpmsg.h      |  52 +++
 include/uapi/linux/apu_rpmsg.h |  36 ++
 5 files changed, 704 insertions(+)
 create mode 100644 drivers/rpmsg/apu_rpmsg.c
 create mode 100644 drivers/rpmsg/apu_rpmsg.h
 create mode 100644 include/uapi/linux/apu_rpmsg.h

diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
index f96716893c2a..3437c6fc8647 100644
--- a/drivers/rpmsg/Kconfig
+++ b/drivers/rpmsg/Kconfig
@@ -64,4 +64,13 @@ config RPMSG_VIRTIO
 	select RPMSG
 	select VIRTIO
 
+config RPMSG_APU
+	tristate "APU RPMSG driver"
+	help
+	  This provides a RPMSG driver that provides some facilities to
+	  communicate with an accelerated processing unit (APU).
+	  This creates one or more char files that could be used by userspace
+	  to send a message to an APU. In addition, this also take care of
+	  sharing the memory buffer with the APU.
+
 endmenu
diff --git a/drivers/rpmsg/Makefile b/drivers/rpmsg/Makefile
index ffe932ef6050..93e0f3de99c9 100644
--- a/drivers/rpmsg/Makefile
+++ b/drivers/rpmsg/Makefile
@@ -8,3 +8,4 @@ obj-$(CONFIG_RPMSG_QCOM_GLINK_RPM) += qcom_glink_rpm.o
 obj-$(CONFIG_RPMSG_QCOM_GLINK_SMEM) += qcom_glink_smem.o
 obj-$(CONFIG_RPMSG_QCOM_SMD)	+= qcom_smd.o
 obj-$(CONFIG_RPMSG_VIRTIO)	+= virtio_rpmsg_bus.o
+obj-$(CONFIG_RPMSG_APU)		+= apu_rpmsg.o
diff --git a/drivers/rpmsg/apu_rpmsg.c b/drivers/rpmsg/apu_rpmsg.c
new file mode 100644
index 000000000000..5131b8b8e1f2
--- /dev/null
+++ b/drivers/rpmsg/apu_rpmsg.c
@@ -0,0 +1,606 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright 2020 BayLibre SAS
+
+#include <linux/cdev.h>
+#include <linux/dma-buf.h>
+#include <linux/iommu.h>
+#include <linux/iova.h>
+#include <linux/types.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/remoteproc.h>
+#include <linux/rpmsg.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include "rpmsg_internal.h"
+
+#include <uapi/linux/apu_rpmsg.h>
+
+#include "apu_rpmsg.h"
+
+/* Maximum of APU devices supported */
+#define APU_DEV_MAX 2
+
+#define dev_to_apu(dev) container_of(dev, struct rpmsg_apu, dev)
+#define cdev_to_apu(i_cdev) container_of(i_cdev, struct rpmsg_apu, cdev)
+
+struct rpmsg_apu {
+	struct rpmsg_device *rpdev;
+	struct cdev cdev;
+	struct device dev;
+
+	struct rproc *rproc;
+	struct iommu_domain *domain;
+	struct iova_domain *iovad;
+	int iova_limit_pfn;
+};
+
+struct rpmsg_request {
+	struct completion completion;
+	struct list_head node;
+	void *req;
+};
+
+struct apu_buffer {
+	int fd;
+	struct dma_buf *dma_buf;
+	struct dma_buf_attachment *attachment;
+	struct sg_table *sg_table;
+	u32 iova;
+};
+
+/*
+ * Shared IOVA domain.
+ * The MT8183 has two VP6 core but they are sharing the IOVA.
+ * They could be used alone, or together. In order to avoid conflict,
+ * create an IOVA domain that could be shared by those two core.
+ * @iovad: The IOVA domain to share between the APU cores
+ * @refcount: Allow to automatically release the IOVA domain once all the APU
+ *            cores has been stopped
+ */
+struct apu_iova_domain {
+	struct iova_domain iovad;
+	struct kref refcount;
+};
+
+static dev_t rpmsg_major;
+static DEFINE_IDA(rpmsg_ctrl_ida);
+static DEFINE_IDA(rpmsg_minor_ida);
+static DEFINE_IDA(req_ida);
+static LIST_HEAD(requests);
+static struct apu_iova_domain *apu_iovad;
+
+static int apu_rpmsg_callback(struct rpmsg_device *dev, void *data, int count,
+			      void *priv, u32 addr)
+{
+	struct rpmsg_request *rpmsg_req;
+	struct apu_dev_request *hdr = data;
+
+	list_for_each_entry(rpmsg_req, &requests, node) {
+		struct apu_dev_request *tmp_hdr = rpmsg_req->req;
+
+		if (hdr->id == tmp_hdr->id) {
+			memcpy(rpmsg_req->req, data, count);
+			complete(&rpmsg_req->completion);
+
+			return 0;
+		}
+	}
+
+	return 0;
+}
+
+static int apu_device_memory_map(struct rpmsg_apu *apu,
+				 struct apu_buffer *buffer)
+{
+	struct rpmsg_device *rpdev = apu->rpdev;
+	phys_addr_t phys;
+	int total_buf_space;
+	int iova_pfn;
+	int ret;
+
+	if (!buffer->fd)
+		return 0;
+
+	buffer->dma_buf = dma_buf_get(buffer->fd);
+	if (IS_ERR(buffer->dma_buf)) {
+		dev_err(&rpdev->dev, "Failed to get dma_buf from fd: %ld\n",
+			PTR_ERR(buffer->dma_buf));
+		return PTR_ERR(buffer->dma_buf);
+	}
+
+	buffer->attachment = dma_buf_attach(buffer->dma_buf, &rpdev->dev);
+	if (IS_ERR(buffer->attachment)) {
+		dev_err(&rpdev->dev, "Failed to attach dma_buf\n");
+		ret = PTR_ERR(buffer->attachment);
+		goto err_dma_buf_put;
+	}
+
+	buffer->sg_table = dma_buf_map_attachment(buffer->attachment,
+						   DMA_BIDIRECTIONAL);
+	if (IS_ERR(buffer->sg_table)) {
+		dev_err(&rpdev->dev, "Failed to map attachment\n");
+		ret = PTR_ERR(buffer->sg_table);
+		goto err_dma_buf_detach;
+	}
+	phys = page_to_phys(sg_page(buffer->sg_table->sgl));
+	total_buf_space = sg_dma_len(buffer->sg_table->sgl);
+
+	iova_pfn = alloc_iova_fast(apu->iovad, total_buf_space >> PAGE_SHIFT,
+				   apu->iova_limit_pfn, true);
+	if (!iova_pfn) {
+		dev_err(&rpdev->dev, "Failed to allocate iova address\n");
+		ret = -ENOMEM;
+		goto err_dma_unmap_attachment;
+	}
+
+	buffer->iova = PFN_PHYS(iova_pfn);
+	ret = iommu_map(apu->rproc->domain, buffer->iova, phys, total_buf_space,
+			IOMMU_READ | IOMMU_WRITE | IOMMU_CACHE);
+	if (ret) {
+		dev_err(&rpdev->dev, "Failed to iommu map\n");
+		goto err_free_iova;
+	}
+
+	return 0;
+
+err_free_iova:
+	free_iova(apu->iovad, iova_pfn);
+err_dma_unmap_attachment:
+	dma_buf_unmap_attachment(buffer->attachment,
+				 buffer->sg_table,
+				 DMA_BIDIRECTIONAL);
+err_dma_buf_detach:
+	dma_buf_detach(buffer->dma_buf, buffer->attachment);
+err_dma_buf_put:
+	dma_buf_put(buffer->dma_buf);
+
+	return ret;
+}
+
+static void apu_device_memory_unmap(struct rpmsg_apu *apu,
+				    struct apu_buffer *buffer)
+{
+	int total_buf_space;
+
+	if (!buffer->fd)
+		return;
+
+	total_buf_space = sg_dma_len(buffer->sg_table->sgl);
+	iommu_unmap(apu->rproc->domain, buffer->iova, total_buf_space);
+	free_iova(apu->iovad, PHYS_PFN(buffer->iova));
+	dma_buf_unmap_attachment(buffer->attachment,
+				 buffer->sg_table,
+				 DMA_BIDIRECTIONAL);
+	dma_buf_detach(buffer->dma_buf, buffer->attachment);
+	dma_buf_put(buffer->dma_buf);
+}
+
+static int _apu_send_request(struct rpmsg_apu *apu,
+			     struct rpmsg_device *rpdev,
+			     struct apu_dev_request *req, int len)
+{
+
+	struct rpmsg_request *rpmsg_req;
+	int ret = 0;
+
+	req->id = ida_simple_get(&req_ida, 0, 0xffff, GFP_KERNEL);
+	if (req->id < 0)
+		return ret;
+
+	rpmsg_req = kzalloc(sizeof(*rpmsg_req), GFP_KERNEL);
+	if (!rpmsg_req)
+		return -ENOMEM;
+
+	rpmsg_req->req = req;
+	init_completion(&rpmsg_req->completion);
+	list_add(&rpmsg_req->node, &requests);
+
+	ret = rpmsg_send(rpdev->ept, req, len);
+	if (ret)
+		goto free_req;
+
+	/* be careful with race here between timeout and callback*/
+	ret = wait_for_completion_timeout(&rpmsg_req->completion,
+					  msecs_to_jiffies(1000));
+	if (!ret)
+		ret = -ETIMEDOUT;
+	else
+		ret = 0;
+
+	ida_simple_remove(&req_ida, req->id);
+
+free_req:
+
+	list_del(&rpmsg_req->node);
+	kfree(rpmsg_req);
+
+	return ret;
+}
+
+static int apu_send_request(struct rpmsg_apu *apu,
+			    struct apu_request *req)
+{
+	int ret;
+	struct rpmsg_device *rpdev = apu->rpdev;
+	struct apu_dev_request *dev_req;
+	struct apu_buffer *buffer;
+
+	int size = req->size_in + req->size_out +
+		sizeof(u32) * req->count * 2 + sizeof(*dev_req);
+	u32 *fd = (u32 *)(req->data + req->size_in + req->size_out);
+	u32 *buffer_size = (u32 *)(fd + req->count);
+	u32 *dev_req_da;
+	u32 *dev_req_buffer_size;
+	int i;
+
+	dev_req = kmalloc(size, GFP_KERNEL);
+	if (!dev_req)
+		return -ENOMEM;
+
+	dev_req->cmd = req->cmd;
+	dev_req->size_in = req->size_in;
+	dev_req->size_out = req->size_out;
+	dev_req->count = req->count;
+	dev_req_da = (u32 *)(dev_req->data + req->size_in + req->size_out);
+	dev_req_buffer_size = (u32 *)(dev_req_da + dev_req->count);
+	memcpy(dev_req->data, req->data, req->size_in);
+
+	buffer = kmalloc_array(req->count, sizeof(*buffer), GFP_KERNEL);
+	for (i = 0; i < req->count; i++) {
+		buffer[i].fd = fd[i];
+		ret = apu_device_memory_map(apu, &buffer[i]);
+		if (ret)
+			goto err_free_memory;
+		dev_req_da[i] = buffer[i].iova;
+		dev_req_buffer_size[i] = buffer_size[i];
+	}
+
+	ret = _apu_send_request(apu, rpdev, dev_req, size);
+
+err_free_memory:
+	for (i--; i >= 0; i--)
+		apu_device_memory_unmap(apu, &buffer[i]);
+
+	req->result = dev_req->result;
+	req->size_in = dev_req->size_in;
+	req->size_out = dev_req->size_out;
+	memcpy(req->data, dev_req->data, dev_req->size_in + dev_req->size_out +
+	       sizeof(u32) * req->count);
+
+	kfree(buffer);
+	kfree(dev_req);
+
+	return ret;
+}
+
+
+static long rpmsg_eptdev_ioctl(struct file *fp, unsigned int cmd,
+			       unsigned long arg)
+{
+	struct rpmsg_apu *apu = fp->private_data;
+	struct apu_request apu_req;
+	struct apu_request *apu_req_full;
+	void __user *argp = (void __user *)arg;
+	int len;
+	int ret;
+
+	switch (cmd) {
+	case APU_SEND_REQ_IOCTL:
+		/* Get the header */
+		if (copy_from_user(&apu_req, argp,
+				   sizeof(apu_req)))
+			return -EFAULT;
+
+		len = sizeof(*apu_req_full) + apu_req.size_in +
+			apu_req.size_out + apu_req.count * sizeof(u32) * 2;
+		apu_req_full = kzalloc(len, GFP_KERNEL);
+		if (!apu_req_full)
+			return -ENOMEM;
+
+		/* Get the whole request */
+		if (copy_from_user(apu_req_full, argp, len)) {
+			kfree(apu_req_full);
+			return -EFAULT;
+		}
+
+		ret = apu_send_request(apu, apu_req_full);
+		if (ret) {
+			kfree(apu_req_full);
+			return ret;
+		}
+
+		if (copy_to_user(argp, apu_req_full, sizeof(apu_req) +
+				 sizeof(u32) * apu_req_full->count +
+				 apu_req_full->size_in + apu_req_full->size_out))
+			ret = -EFAULT;
+
+		kfree(apu_req_full);
+		return ret;
+
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
+{
+	struct rpmsg_apu *apu = cdev_to_apu(inode->i_cdev);
+
+	get_device(&apu->dev);
+	filp->private_data = apu;
+
+	return 0;
+}
+
+static int rpmsg_eptdev_release(struct inode *inode, struct file *filp)
+{
+	struct rpmsg_apu *apu = cdev_to_apu(inode->i_cdev);
+
+	put_device(&apu->dev);
+
+	return 0;
+}
+
+static const struct file_operations rpmsg_eptdev_fops = {
+	.owner = THIS_MODULE,
+	.open = rpmsg_eptdev_open,
+	.release = rpmsg_eptdev_release,
+	.unlocked_ioctl = rpmsg_eptdev_ioctl,
+	.compat_ioctl = rpmsg_eptdev_ioctl,
+};
+
+static void iova_domain_release(struct kref *ref)
+{
+	put_iova_domain(&apu_iovad->iovad);
+	kfree(apu_iovad);
+	apu_iovad = NULL;
+}
+
+static struct fw_rsc_iova *apu_find_rcs_iova(struct rpmsg_apu *apu)
+{
+	struct rproc *rproc = apu->rproc;
+	struct resource_table *table;
+	struct fw_rsc_iova *rsc;
+	int i;
+
+	table = rproc->table_ptr;
+	for (i = 0; i < table->num; i++) {
+		int offset = table->offset[i];
+		struct fw_rsc_hdr *hdr = (void *)table + offset;
+
+		switch (hdr->type) {
+		case RSC_VENDOR_IOVA:
+			rsc = (void *)hdr + sizeof(*hdr);
+				return rsc;
+			break;
+		default:
+			continue;
+		}
+	}
+
+	return NULL;
+}
+
+static int apu_reserve_iova(struct rpmsg_apu *apu, struct iova_domain *iovad)
+{
+	struct rproc *rproc = apu->rproc;
+	struct resource_table *table;
+	struct fw_rsc_carveout *rsc;
+	int i;
+
+	table = rproc->table_ptr;
+	for (i = 0; i < table->num; i++) {
+		int offset = table->offset[i];
+		struct fw_rsc_hdr *hdr = (void *)table + offset;
+
+		if (hdr->type == RSC_CARVEOUT) {
+			struct iova *iova;
+
+			rsc = (void *)hdr + sizeof(*hdr);
+			iova = reserve_iova(iovad, PHYS_PFN(rsc->da),
+					    PHYS_PFN(rsc->da + rsc->len));
+			if (!iova) {
+				dev_err(&apu->dev, "failed to reserve iova\n");
+				return -ENOMEM;
+			}
+			dev_dbg(&apu->dev, "Reserve: %x - %x\n",
+				rsc->da, rsc->da + rsc->len);
+		}
+	}
+
+	return 0;
+}
+
+static int apu_init_iovad(struct rpmsg_apu *apu)
+{
+	struct fw_rsc_iova *rsc;
+
+	if (!apu->rproc->table_ptr) {
+		dev_err(&apu->dev,
+			"No resource_table: has the firmware been loaded ?\n");
+		return -ENODEV;
+	}
+
+	rsc = apu_find_rcs_iova(apu);
+	if (!rsc) {
+		dev_err(&apu->dev, "No iova range defined in resource_table\n");
+		return -ENOMEM;
+	}
+
+	if (!apu_iovad) {
+		apu_iovad = kzalloc(sizeof(*apu_iovad), GFP_KERNEL);
+		if (!apu_iovad)
+			return -ENOMEM;
+
+		init_iova_domain(&apu_iovad->iovad, PAGE_SIZE,
+				 PHYS_PFN(rsc->da));
+		apu_reserve_iova(apu, &apu_iovad->iovad);
+		kref_init(&apu_iovad->refcount);
+	} else
+		kref_get(&apu_iovad->refcount);
+
+	apu->iovad = &apu_iovad->iovad;
+	apu->iova_limit_pfn = PHYS_PFN(rsc->da + rsc->len) - 1;
+
+	return 0;
+}
+
+static struct rproc *apu_get_rproc(struct rpmsg_device *rpdev)
+{
+	/*
+	 * To work, the APU RPMsg driver need to get the rproc device.
+	 * Currently, we only use virtio so we could use that to find the
+	 * remoteproc parent.
+	 */
+	if (!rpdev->dev.parent && rpdev->dev.parent->bus) {
+		dev_err(&rpdev->dev, "invalid rpmsg device\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (strcmp(rpdev->dev.parent->bus->name, "virtio")) {
+		dev_err(&rpdev->dev, "unsupported bus\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	return vdev_to_rproc(dev_to_virtio(rpdev->dev.parent));
+}
+
+static void rpmsg_apu_release_device(struct device *dev)
+{
+	struct rpmsg_apu *apu = dev_to_apu(dev);
+
+	ida_simple_remove(&rpmsg_ctrl_ida, dev->id);
+	ida_simple_remove(&rpmsg_minor_ida, MINOR(dev->devt));
+	cdev_del(&apu->cdev);
+	kfree(apu);
+}
+
+static int apu_rpmsg_probe(struct rpmsg_device *rpdev)
+{
+	struct rpmsg_apu *apu;
+	struct device *dev;
+	int ret;
+
+	apu = devm_kzalloc(&rpdev->dev, sizeof(*apu), GFP_KERNEL);
+	if (!apu)
+		return -ENOMEM;
+	apu->rpdev = rpdev;
+
+	apu->rproc = apu_get_rproc(rpdev);
+	if (IS_ERR_OR_NULL(apu->rproc))
+		return PTR_ERR(apu->rproc);
+
+	dev = &apu->dev;
+	device_initialize(dev);
+	dev->parent = &rpdev->dev;
+
+	cdev_init(&apu->cdev, &rpmsg_eptdev_fops);
+	apu->cdev.owner = THIS_MODULE;
+
+	ret = ida_simple_get(&rpmsg_minor_ida, 0, APU_DEV_MAX, GFP_KERNEL);
+	if (ret < 0)
+		goto free_apu;
+	dev->devt = MKDEV(MAJOR(rpmsg_major), ret);
+
+	ret = ida_simple_get(&rpmsg_ctrl_ida, 0, 0, GFP_KERNEL);
+	if (ret < 0)
+		goto free_minor_ida;
+	dev->id = ret;
+	dev_set_name(&apu->dev, "apu%d", ret);
+
+	ret = cdev_add(&apu->cdev, dev->devt, 1);
+	if (ret)
+		goto free_ctrl_ida;
+
+	/* We can now rely on the release function for cleanup */
+	dev->release = rpmsg_apu_release_device;
+
+	ret = device_add(dev);
+	if (ret) {
+		dev_err(&rpdev->dev, "device_add failed: %d\n", ret);
+		put_device(dev);
+	}
+
+	/* Make device dma capable by inheriting from parent's capabilities */
+	set_dma_ops(&rpdev->dev, get_dma_ops(apu->rproc->dev.parent));
+
+	ret = dma_coerce_mask_and_coherent(&rpdev->dev,
+					   dma_get_mask(apu->rproc->dev.parent));
+	if (ret)
+		goto err_put_device;
+
+	rpdev->dev.iommu_group = apu->rproc->dev.parent->iommu_group;
+
+	ret = apu_init_iovad(apu);
+
+	dev_set_drvdata(&rpdev->dev, apu);
+
+	return ret;
+
+err_put_device:
+	put_device(dev);
+free_ctrl_ida:
+	ida_simple_remove(&rpmsg_ctrl_ida, dev->id);
+free_minor_ida:
+	ida_simple_remove(&rpmsg_minor_ida, MINOR(dev->devt));
+free_apu:
+	put_device(dev);
+	kfree(apu);
+
+	return ret;
+}
+
+static void apu_rpmsg_remove(struct rpmsg_device *rpdev)
+{
+	struct rpmsg_apu *apu = dev_get_drvdata(&rpdev->dev);
+
+	if (apu_iovad)
+		kref_put(&apu_iovad->refcount, iova_domain_release);
+
+	device_del(&apu->dev);
+	put_device(&apu->dev);
+	kfree(apu);
+}
+
+static const struct rpmsg_device_id apu_rpmsg_match[] = {
+	{ APU_RPMSG_SERVICE_MT8183 },
+	{}
+};
+
+static struct rpmsg_driver apu_rpmsg_driver = {
+	.probe = apu_rpmsg_probe,
+	.remove = apu_rpmsg_remove,
+	.callback = apu_rpmsg_callback,
+	.id_table = apu_rpmsg_match,
+	.drv  = {
+		.name  = "apu_rpmsg",
+	},
+};
+
+static int __init apu_rpmsg_init(void)
+{
+	int ret;
+
+	ret = alloc_chrdev_region(&rpmsg_major, 0, APU_DEV_MAX, "apu");
+	if (ret < 0) {
+		pr_err("apu: failed to allocate char dev region\n");
+		return ret;
+	}
+
+	return register_rpmsg_driver(&apu_rpmsg_driver);
+}
+arch_initcall(apu_rpmsg_init);
+
+static void __exit apu_rpmsg_exit(void)
+{
+	unregister_rpmsg_driver(&apu_rpmsg_driver);
+}
+module_exit(apu_rpmsg_exit);
+
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("APU RPMSG driver");
diff --git a/drivers/rpmsg/apu_rpmsg.h b/drivers/rpmsg/apu_rpmsg.h
new file mode 100644
index 000000000000..54b5b7880750
--- /dev/null
+++ b/drivers/rpmsg/apu_rpmsg.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright 2020 BayLibre SAS
+ */
+
+#ifndef __APU_RPMSG_H__
+#define __APU_RPMSG_H__
+
+/*
+ * Firmware request, must be aligned with the one defined in firmware.
+ * @id: Request id, used in the case of reply, to find the pending request
+ * @cmd: The command id to execute in the firmware
+ * @result: The result of the command executed on the firmware
+ * @size: The size of the data available in this request
+ * @count: The number of shared buffer
+ * @data: Contains the data attached with the request if size is greater than
+ *        zero, and the addresses of shared buffers if count is greater than
+ *        zero. Both the data and the shared buffer could be read and write
+ *        by the APU.
+ */
+struct  apu_dev_request {
+	u16 id;
+	u16 cmd;
+	u16 result;
+	u16 size_in;
+	u16 size_out;
+	u16 count;
+	u8 data[0];
+} __packed;
+
+#define APU_RPMSG_SERVICE_MT8183 "rpmsg-mt8183-apu0"
+#define APU_CTRL_SRC 1
+#define APU_CTRL_DST 1
+
+/* Vendor specific resource table entry */
+#define RSC_VENDOR_IOVA 128
+
+/*
+ * Firmware IOVA resource table entry
+ * Define a range of virtual device address that could mapped using the IOMMU.
+ * @da: Start virtual device address
+ * @len: Length of the virtual device address
+ * @name: name of the resource
+ */
+struct fw_rsc_iova {
+	u32 da;
+	u32 len;
+	u32 reserved;
+	u8 name[32];
+} __packed;
+
+#endif /* __APU_RPMSG_H__ */
diff --git a/include/uapi/linux/apu_rpmsg.h b/include/uapi/linux/apu_rpmsg.h
new file mode 100644
index 000000000000..81c9e4af9a94
--- /dev/null
+++ b/include/uapi/linux/apu_rpmsg.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * Copyright (c) 2020 BayLibre
+ */
+
+#ifndef _UAPI_RPMSG_APU_H_
+#define _UAPI_RPMSG_APU_H_
+
+#include <linux/ioctl.h>
+#include <linux/types.h>
+
+/*
+ * Structure containing the APU request from userspace application
+ * @cmd: The id of the command to execute on the APU
+ * @result: The result of the command executed on the APU
+ * @size: The size of the data available in this request
+ * @count: The number of shared buffer
+ * @data: Contains the data attached with the request if size is greater than
+ *        zero, and the files descriptors of shared buffers if count is greater
+ *        than zero. Both the data and the shared buffer could be read and write
+ *        by the APU.
+ */
+struct apu_request {
+	__u16 cmd;
+	__u16 result;
+	__u16 size_in;
+	__u16 size_out;
+	__u16 count;
+	__u16 reserved;
+	__u8 data[0];
+};
+
+/* Send synchronous request to an APU */
+#define APU_SEND_REQ_IOCTL	_IOWR(0xb7, 0x2, struct apu_request)
+
+#endif
-- 
2.26.2

