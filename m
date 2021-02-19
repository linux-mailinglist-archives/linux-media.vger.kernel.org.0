Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F2A431F714
	for <lists+linux-media@lfdr.de>; Fri, 19 Feb 2021 11:08:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230345AbhBSKHt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Feb 2021 05:07:49 -0500
Received: from mga05.intel.com ([192.55.52.43]:63079 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230255AbhBSKHW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Feb 2021 05:07:22 -0500
IronPort-SDR: y4n1H27/mQ4Kec+x5WBpydxH+9mX65aep/Ct9YziCFnpwmNBnUYNUm6y5qJlWCB5Bct4vzWuj8
 mrp3F3dwLKow==
X-IronPort-AV: E=McAfee;i="6000,8403,9899"; a="268652363"
X-IronPort-AV: E=Sophos;i="5.81,189,1610438400"; 
   d="scan'208";a="268652363"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2021 02:05:58 -0800
IronPort-SDR: bjdkVHXtWeKd80fZnrzav8VkhggKjFeE3yCJ1ND/sZEpNMwPloc1z2uMKoYDgHA+54uYLQQEee
 8esaIGs2X4/g==
X-IronPort-AV: E=Sophos;i="5.81,189,1610438400"; 
   d="scan'208";a="513624313"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2021 02:05:58 -0800
From:   Vivek Kasireddy <vivek.kasireddy@intel.com>
To:     virtualization@lists.linux-foundation.org,
        dri-devel@lists.freedesktop.org
Cc:     kraxel@redhat.com, daniel.vetter@intel.com, daniel.vetter@ffwll.ch,
        dongwon.kim@intel.com, sumit.semwal@linaro.org,
        christian.koenig@amd.com, stevensd@chromium.org,
        linux-media@vger.kernel.org,
        Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [RFC v4 3/3] vhost: Add Vdmabuf backend
Date:   Fri, 19 Feb 2021 01:55:23 -0800
Message-Id: <20210219095523.2621884-4-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210219095523.2621884-1-vivek.kasireddy@intel.com>
References: <20210219095523.2621884-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This backend acts as the counterpart to the Vdmabuf Virtio frontend.
When it receives a new export event from the frontend, it raises an
event to alert the Qemu UI/userspace. Qemu then "imports" this buffer
using the Unique ID.

As part of the import step, a new dmabuf is created on the Host using
the page information obtained from the Guest. The fd associated with
this dmabuf is made available to Qemu UI/userspace which then creates
a texture from it for the purpose of displaying it.

Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/vhost/Kconfig      |    9 +
 drivers/vhost/Makefile     |    3 +
 drivers/vhost/vdmabuf.c    | 1372 ++++++++++++++++++++++++++++++++++++
 include/uapi/linux/vhost.h |    3 +
 4 files changed, 1387 insertions(+)
 create mode 100644 drivers/vhost/vdmabuf.c

diff --git a/drivers/vhost/Kconfig b/drivers/vhost/Kconfig
index 587fbae06182..9a99cc2611ca 100644
--- a/drivers/vhost/Kconfig
+++ b/drivers/vhost/Kconfig
@@ -89,4 +89,13 @@ config VHOST_CROSS_ENDIAN_LEGACY
 
 	  If unsure, say "N".
 
+config VHOST_VDMABUF
+	bool "Vhost backend for the Vdmabuf driver"
+	depends on KVM && EVENTFD
+	select VHOST
+	default n
+	help
+	  This driver works in pair with the Virtio Vdmabuf frontend. It can
+	  be used to create a dmabuf using the pages shared by the Guest.
+
 endif
diff --git a/drivers/vhost/Makefile b/drivers/vhost/Makefile
index f3e1897cce85..5c2cea4a7eaf 100644
--- a/drivers/vhost/Makefile
+++ b/drivers/vhost/Makefile
@@ -17,3 +17,6 @@ obj-$(CONFIG_VHOST)	+= vhost.o
 
 obj-$(CONFIG_VHOST_IOTLB) += vhost_iotlb.o
 vhost_iotlb-y := iotlb.o
+
+obj-$(CONFIG_VHOST_VDMABUF) += vhost_vdmabuf.o
+vhost_vdmabuf-y := vdmabuf.o
diff --git a/drivers/vhost/vdmabuf.c b/drivers/vhost/vdmabuf.c
new file mode 100644
index 000000000000..fe0efe82683d
--- /dev/null
+++ b/drivers/vhost/vdmabuf.c
@@ -0,0 +1,1372 @@
+// SPDX-License-Identifier: (MIT OR GPL-2.0)
+
+/*
+ * Copyright © 2021 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ * Authors:
+ *    Dongwon Kim <dongwon.kim@intel.com>
+ *    Mateusz Polrola <mateusz.polrola@gmail.com>
+ *    Vivek Kasireddy <vivek.kasireddy@intel.com>
+ */
+
+#include <linux/kernel.h>
+#include <linux/errno.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/miscdevice.h>
+#include <linux/workqueue.h>
+#include <linux/slab.h>
+#include <linux/device.h>
+#include <linux/hashtable.h>
+#include <linux/uaccess.h>
+#include <linux/poll.h>
+#include <linux/dma-buf.h>
+#include <linux/vhost.h>
+#include <linux/vfio.h>
+#include <linux/kvm_host.h>
+#include <linux/virtio_vdmabuf.h>
+
+#include "vhost.h"
+
+#define REFS_PER_PAGE (PAGE_SIZE/sizeof(long))
+
+enum {
+	VHOST_VDMABUF_FEATURES = VHOST_FEATURES,
+};
+
+static struct virtio_vdmabuf_info *drv_info;
+
+struct kvm_instance {
+	struct kvm *kvm;
+	struct list_head link;
+};
+
+struct vhost_vdmabuf {
+	struct vhost_dev dev;
+	struct vhost_virtqueue vqs[VDMABUF_VQ_MAX];
+	struct vhost_work send_work;
+	struct virtio_vdmabuf_event_queue *evq;
+	u64 vmid;
+
+	struct list_head msg_list;
+	struct list_head list;
+	struct kvm *kvm;
+};
+
+static inline void vhost_vdmabuf_add(struct vhost_vdmabuf *new)
+{
+	list_add_tail(&new->list, &drv_info->head_vdmabuf_list);
+}
+
+static inline struct vhost_vdmabuf *vhost_vdmabuf_find(u64 vmid)
+{
+	struct vhost_vdmabuf *found;
+
+	list_for_each_entry(found, &drv_info->head_vdmabuf_list, list)
+		if (found->vmid == vmid)
+			return found;
+
+	return NULL;
+}
+
+static inline bool vhost_vdmabuf_del(struct vhost_vdmabuf *vdmabuf)
+{
+	struct vhost_vdmabuf *iter, *temp;
+
+	list_for_each_entry_safe(iter, temp,
+				 &drv_info->head_vdmabuf_list,
+				 list)
+		if (iter == vdmabuf) {
+			list_del(&iter->list);
+			return true;
+		}
+
+	return false;
+}
+
+static inline void vhost_vdmabuf_del_all(void)
+{
+	struct vhost_vdmabuf *iter, *temp;
+
+	list_for_each_entry_safe(iter, temp,
+				 &drv_info->head_vdmabuf_list,
+				 list) {
+		list_del(&iter->list);
+		kfree(iter);
+	}
+}
+
+static void *map_gpa(struct kvm_vcpu *vcpu, gpa_t gpa)
+{
+	struct kvm_host_map map;
+	int ret;
+
+	ret = kvm_vcpu_map(vcpu, gpa_to_gfn(gpa), &map);
+	if (ret < 0)
+		return ERR_PTR(ret);
+	else
+		return map.hva;
+}
+
+static void unmap_hva(struct kvm_vcpu *vcpu, gpa_t hva)
+{
+	struct page *page = virt_to_page(hva);
+	struct kvm_host_map map;
+
+	map.hva = (void *)hva;
+	map.page = page;
+
+	kvm_vcpu_unmap(vcpu, &map, true);
+}
+
+/* mapping guest's pages for the vdmabuf */
+static int
+vhost_vdmabuf_map_pages(u64 vmid,
+		        struct virtio_vdmabuf_shared_pages *pages_info)
+{
+	struct vhost_vdmabuf *vdmabuf = vhost_vdmabuf_find(vmid);
+	struct kvm_vcpu *vcpu;
+	void *paddr;
+	int npgs = REFS_PER_PAGE;
+	int last_nents, n_l2refs;
+	int i, j = 0, k = 0;
+
+	if (!vdmabuf || !vdmabuf->kvm || !pages_info || pages_info->pages)
+		return -EINVAL;
+
+	vcpu = kvm_get_vcpu_by_id(vdmabuf->kvm, 0);
+	if (!vcpu)
+		return -EINVAL;
+
+	last_nents = (pages_info->nents - 1) % npgs + 1;
+	n_l2refs = (pages_info->nents / npgs) + ((last_nents > 0) ? 1 : 0) -
+		   (last_nents == npgs);
+
+	pages_info->pages = kcalloc(pages_info->nents, sizeof(struct page *),
+				    GFP_KERNEL);
+	if (!pages_info->pages)
+		goto fail_page_alloc;
+
+	pages_info->l2refs = kcalloc(n_l2refs, sizeof(gpa_t *), GFP_KERNEL);
+	if (!pages_info->l2refs)
+		goto fail_l2refs;
+
+	pages_info->l3refs = (gpa_t *)map_gpa(vcpu, pages_info->ref);
+	if (IS_ERR(pages_info->l3refs))
+		goto fail_l3refs;
+
+	for (i = 0; i < n_l2refs; i++) {
+		pages_info->l2refs[i] = (gpa_t *)map_gpa(vcpu,
+							 pages_info->l3refs[i]);
+
+		if (IS_ERR(pages_info->l2refs[i]))
+			goto fail_mapping_l2;
+
+		/* last level-2 ref */
+		if (i == n_l2refs - 1)
+			npgs = last_nents;
+
+		for (j = 0; j < npgs; j++) {
+			paddr = map_gpa(vcpu, pages_info->l2refs[i][j]);
+			if (IS_ERR(paddr))
+				goto fail_mapping_l1;
+
+			pages_info->pages[k] = virt_to_page(paddr);
+			k++;
+		}
+		unmap_hva(vcpu, pages_info->l3refs[i]);
+	}
+
+	unmap_hva(vcpu, pages_info->ref);
+
+	return 0;
+
+fail_mapping_l1:
+	for (k = 0; k < j; k++)
+		unmap_hva(vcpu, pages_info->l2refs[i][k]);
+
+fail_mapping_l2:
+	for (j = 0; j < i; j++) {
+		for (k = 0; k < REFS_PER_PAGE; k++)
+			unmap_hva(vcpu, pages_info->l2refs[i][k]);
+	}
+
+	unmap_hva(vcpu, pages_info->l3refs[i]);
+	unmap_hva(vcpu, pages_info->ref);
+
+fail_l3refs:
+	kfree(pages_info->l2refs);
+
+fail_l2refs:
+	kfree(pages_info->pages);
+
+fail_page_alloc:
+	return -ENOMEM;
+}
+
+/* unmapping mapped pages */
+static int
+vhost_vdmabuf_unmap_pages(u64 vmid,
+			  struct virtio_vdmabuf_shared_pages *pages_info)
+{
+	struct vhost_vdmabuf *vdmabuf = vhost_vdmabuf_find(vmid);
+	struct kvm_vcpu *vcpu;
+	int last_nents = (pages_info->nents - 1) % REFS_PER_PAGE + 1;
+	int n_l2refs = (pages_info->nents / REFS_PER_PAGE) +
+		       ((last_nents > 0) ? 1 : 0) -
+		       (last_nents == REFS_PER_PAGE);
+	int i, j;
+
+	if (!vdmabuf || !vdmabuf->kvm || !pages_info || pages_info->pages)
+		return -EINVAL;
+
+	vcpu = kvm_get_vcpu_by_id(vdmabuf->kvm, 0);
+	if (!vcpu)
+		return -EINVAL;
+
+	for (i = 0; i < n_l2refs - 1; i++) {
+		for (j = 0; j < REFS_PER_PAGE; j++)
+			unmap_hva(vcpu, pages_info->l2refs[i][j]);
+	}
+
+	for (j = 0; j < last_nents; j++)
+		unmap_hva(vcpu, pages_info->l2refs[i][j]);
+
+	kfree(pages_info->l2refs);
+	kfree(pages_info->pages);
+	pages_info->pages = NULL;
+
+	return 0;
+}
+
+/* create sg_table with given pages and other parameters */
+static struct sg_table *new_sgt(struct page **pgs,
+				int first_ofst, int last_len,
+				int nents)
+{
+	struct sg_table *sgt;
+	struct scatterlist *sgl;
+	int i, ret;
+
+	sgt = kmalloc(sizeof(struct sg_table), GFP_KERNEL);
+	if (!sgt)
+		return NULL;
+
+	ret = sg_alloc_table(sgt, nents, GFP_KERNEL);
+	if (ret) {
+		kfree(sgt);
+		return NULL;
+	}
+
+	sgl = sgt->sgl;
+	sg_set_page(sgl, pgs[0], PAGE_SIZE-first_ofst, first_ofst);
+
+	for (i = 1; i < nents-1; i++) {
+		sgl = sg_next(sgl);
+		sg_set_page(sgl, pgs[i], PAGE_SIZE, 0);
+	}
+
+	/* more than 1 page */
+	if (nents > 1) {
+		sgl = sg_next(sgl);
+		sg_set_page(sgl, pgs[i], last_len, 0);
+	}
+
+	return sgt;
+}
+
+static struct sg_table
+*vhost_vdmabuf_dmabuf_map(struct dma_buf_attachment *attachment,
+			  enum dma_data_direction dir)
+{
+	struct virtio_vdmabuf_buf *imp;
+
+	if (!attachment->dmabuf || !attachment->dmabuf->priv)
+		return NULL;
+
+	imp = (struct virtio_vdmabuf_buf *)attachment->dmabuf->priv;
+
+	/* if buffer has never been mapped */
+	if (!imp->sgt) {
+		imp->sgt = new_sgt(imp->pages_info->pages,
+				   imp->pages_info->first_ofst,
+				   imp->pages_info->last_len,
+				   imp->pages_info->nents);
+
+		if (!imp->sgt)
+			return NULL;
+	}
+
+	if (!dma_map_sg(attachment->dev, imp->sgt->sgl,
+			imp->sgt->nents, dir)) {
+		sg_free_table(imp->sgt);
+		kfree(imp->sgt);
+		return NULL;
+	}
+
+	return imp->sgt;
+}
+
+static void
+vhost_vdmabuf_dmabuf_unmap(struct dma_buf_attachment *attachment,
+	   	           struct sg_table *sg,
+			   enum dma_data_direction dir)
+{
+	dma_unmap_sg(attachment->dev, sg->sgl, sg->nents, dir);
+
+	sg_free_table(sg);
+	kfree(sg);
+}
+
+static int vhost_vdmabuf_dmabuf_mmap(struct dma_buf *dmabuf,
+				     struct vm_area_struct *vma)
+{
+	struct virtio_vdmabuf_buf *imp;
+	u64 uaddr;
+	int i, err;
+
+	if (!dmabuf->priv)
+		return -EINVAL;
+
+	imp = (struct virtio_vdmabuf_buf *)dmabuf->priv;
+
+	if (!imp->pages_info)
+		return -EINVAL;
+
+	vma->vm_flags |= VM_DONTEXPAND | VM_DONTDUMP;
+
+	uaddr = vma->vm_start;
+	for (i = 0; i < imp->pages_info->nents; i++) {
+		err = vm_insert_page(vma, uaddr,
+				     imp->pages_info->pages[i]);
+		if (err)
+			return err;
+
+		uaddr += PAGE_SIZE;
+	}
+
+	return 0;
+}
+
+static int vhost_vdmabuf_dmabuf_vmap(struct dma_buf *dmabuf,
+				     struct dma_buf_map *map)
+{
+	struct virtio_vdmabuf_buf *imp;
+	void *addr;
+
+	if (!dmabuf->priv)
+		return -EINVAL;
+
+	imp = (struct virtio_vdmabuf_buf *)dmabuf->priv;
+
+	if (!imp->pages_info)
+		return -EINVAL;
+
+	addr = vmap(imp->pages_info->pages, imp->pages_info->nents,
+                    0, PAGE_KERNEL);
+	if (IS_ERR(addr))
+		return PTR_ERR(addr);
+
+	return 0;
+}
+
+static void vhost_vdmabuf_dmabuf_release(struct dma_buf *dma_buf)
+{
+	struct virtio_vdmabuf_buf *imp;
+
+	if (!dma_buf->priv)
+		return;
+
+	imp = (struct virtio_vdmabuf_buf *)dma_buf->priv;
+	imp->dma_buf = NULL;
+	imp->valid = false;
+
+	vhost_vdmabuf_unmap_pages(imp->vmid, imp->pages_info);
+	virtio_vdmabuf_del_buf(drv_info, &imp->buf_id);
+
+	kfree(imp->priv);
+	kfree(imp->pages_info);
+	kfree(imp);
+}
+
+static const struct dma_buf_ops vhost_vdmabuf_dmabuf_ops = {
+	.map_dma_buf = vhost_vdmabuf_dmabuf_map,
+	.unmap_dma_buf = vhost_vdmabuf_dmabuf_unmap,
+	.release = vhost_vdmabuf_dmabuf_release,
+	.mmap = vhost_vdmabuf_dmabuf_mmap,
+	.vmap = vhost_vdmabuf_dmabuf_vmap,
+};
+
+/* exporting dmabuf as fd */
+static int vhost_vdmabuf_exp_fd(struct virtio_vdmabuf_buf *imp, int flags)
+{
+	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
+
+	exp_info.ops = &vhost_vdmabuf_dmabuf_ops;
+
+	/* multiple of PAGE_SIZE, not considering offset */
+	exp_info.size = imp->pages_info->nents * PAGE_SIZE;
+	exp_info.flags = O_CLOEXEC;
+	exp_info.priv = imp;
+
+	if (!imp->dma_buf) {
+		imp->dma_buf = dma_buf_export(&exp_info);
+		if (IS_ERR_OR_NULL(imp->dma_buf)) {
+			imp->dma_buf = NULL;
+			return -EINVAL;
+		}
+	}
+
+	return dma_buf_fd(imp->dma_buf, flags);
+}
+
+static int vhost_vdmabuf_add_event(struct vhost_vdmabuf *vdmabuf,
+				   struct virtio_vdmabuf_buf *buf_info)
+{
+	struct virtio_vdmabuf_event *e_oldest, *e_new;
+	struct virtio_vdmabuf_event_queue *evq = vdmabuf->evq;
+	unsigned long irqflags;
+
+	e_new = kzalloc(sizeof(*e_new), GFP_KERNEL);
+	if (!e_new)
+		return -ENOMEM;
+
+	e_new->e_data.hdr.buf_id = buf_info->buf_id;
+	e_new->e_data.data = (void *)buf_info->priv;
+	e_new->e_data.hdr.size = buf_info->sz_priv;
+
+	spin_lock_irqsave(&evq->e_lock, irqflags);
+
+	/* check current number of event then if it hits the max num (32)
+	 * then remove the oldest event in the list
+	 */
+	if (evq->pending > 31) {
+		e_oldest = list_first_entry(&evq->e_list,
+					    struct virtio_vdmabuf_event, link);
+		list_del(&e_oldest->link);
+		evq->pending--;
+		kfree(e_oldest);
+	}
+
+	list_add_tail(&e_new->link, &evq->e_list);
+
+	evq->pending++;
+
+	wake_up_interruptible(&evq->e_wait);
+	spin_unlock_irqrestore(&evq->e_lock, irqflags);
+
+	return 0;
+}
+
+static int send_msg_to_guest(u64 vmid, enum virtio_vdmabuf_cmd cmd, int *op)
+{
+	struct virtio_vdmabuf_msg *msg;
+	struct vhost_vdmabuf *vdmabuf;
+
+	vdmabuf = vhost_vdmabuf_find(vmid);
+	if (!vdmabuf) {
+		dev_err(drv_info->dev,
+			"can't find vdmabuf for : vmid = %llu\n", vmid);
+		return -EINVAL;
+	}
+
+	if (cmd != VIRTIO_VDMABUF_CMD_DMABUF_REL)
+		return -EINVAL;
+
+	msg = kvcalloc(1, sizeof(struct virtio_vdmabuf_msg),
+		       GFP_KERNEL);
+	if (!msg)
+		return -ENOMEM;
+
+	memcpy(&msg->op[0], &op[0], 8 * sizeof(int));
+	msg->cmd = cmd;
+
+	list_add_tail(&msg->list, &vdmabuf->msg_list);
+	vhost_work_queue(&vdmabuf->dev, &vdmabuf->send_work);
+
+	return 0;
+}
+
+static int register_exported(struct vhost_vdmabuf *vdmabuf,
+			     virtio_vdmabuf_buf_id_t *buf_id, int *ops)
+{
+	struct virtio_vdmabuf_buf *imp;
+	int ret;
+
+	imp = kcalloc(1, sizeof(*imp), GFP_KERNEL);
+	if (!imp)
+		return -ENOMEM;
+
+	imp->pages_info = kcalloc(1, sizeof(struct virtio_vdmabuf_shared_pages),
+				  GFP_KERNEL);
+	if (!imp->pages_info) {
+		kfree(imp);
+		return -ENOMEM;
+	}
+
+	imp->sz_priv = ops[VIRTIO_VDMABUF_PRIVATE_DATA_SIZE];
+	if (imp->sz_priv) {
+		imp->priv = kcalloc(1, ops[VIRTIO_VDMABUF_PRIVATE_DATA_SIZE],
+				    GFP_KERNEL);
+		if (!imp->priv) {
+			kfree(imp->pages_info);
+			kfree(imp);
+			return -ENOMEM;
+		}
+	}
+
+	memcpy(&imp->buf_id, buf_id, sizeof(*buf_id));
+
+	imp->pages_info->nents = ops[VIRTIO_VDMABUF_NUM_PAGES_SHARED];
+	imp->pages_info->first_ofst = ops[VIRTIO_VDMABUF_FIRST_PAGE_DATA_OFFSET];
+	imp->pages_info->last_len = ops[VIRTIO_VDMABUF_LAST_PAGE_DATA_LENGTH];
+	imp->pages_info->ref = *(gpa_t *)&ops[VIRTIO_VDMABUF_REF_ADDR_UPPER_32BIT];
+	imp->vmid = vdmabuf->vmid;
+	imp->valid = true;
+
+	virtio_vdmabuf_add_buf(drv_info, imp);
+
+	/* transferring private data */
+	memcpy(imp->priv, &ops[VIRTIO_VDMABUF_PRIVATE_DATA_START],
+	       imp->sz_priv);
+
+	/* generate import event */
+	ret = vhost_vdmabuf_add_event(vdmabuf, imp);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static void send_to_recvq(struct vhost_vdmabuf *vdmabuf,
+			  struct vhost_virtqueue *vq)
+{
+	struct virtio_vdmabuf_msg *msg;
+	int head, in, out, in_size;
+	bool added = false;
+	int ret;
+
+	mutex_lock(&vq->mutex);
+
+	if (!vhost_vq_get_backend(vq))
+		goto out;
+
+	vhost_disable_notify(&vdmabuf->dev, vq);
+
+	for (;;) {
+		if (list_empty(&vdmabuf->msg_list))
+			break;
+
+		head = vhost_get_vq_desc(vq, vq->iov, ARRAY_SIZE(vq->iov),
+					 &out, &in, NULL, NULL);
+
+		if (head < 0 || head == vq->num)
+			break;
+
+		in_size = iov_length(&vq->iov[out], in);
+		if (in_size != sizeof(struct virtio_vdmabuf_msg)) {
+			dev_err(drv_info->dev, "rx msg with wrong size\n");
+			break;
+		}
+
+		msg = list_first_entry(&vdmabuf->msg_list,
+				       struct virtio_vdmabuf_msg, list);
+		list_del_init(&msg->list);
+
+		ret = __copy_to_user(vq->iov[out].iov_base, msg,
+				     sizeof(struct virtio_vdmabuf_msg));
+		if (ret) {
+			dev_err(drv_info->dev,
+				"fail to copy tx msg\n");
+			break;
+		}
+
+		vhost_add_used(vq, head, in_size);
+		added = true;
+
+		//kfree(msg);
+	}
+
+	vhost_enable_notify(&vdmabuf->dev, vq);
+	if (added)
+		vhost_signal(&vdmabuf->dev, vq);
+out:
+	mutex_unlock(&vq->mutex);
+}
+
+static void vhost_send_msg_work(struct vhost_work *work)
+{
+	struct vhost_vdmabuf *vdmabuf = container_of(work,
+					             struct vhost_vdmabuf,
+					             send_work);
+	struct vhost_virtqueue *vq = &vdmabuf->vqs[VDMABUF_VQ_RECV];
+
+	send_to_recvq(vdmabuf, vq);
+}
+
+/* parse incoming message from a guest */
+static int parse_msg(struct vhost_vdmabuf *vdmabuf,
+		     struct virtio_vdmabuf_msg *msg)
+{
+	virtio_vdmabuf_buf_id_t *buf_id;
+	struct virtio_vdmabuf_msg *vmid_msg;
+	int ret = 0;
+
+	switch (msg->cmd) {
+	case VIRTIO_VDMABUF_CMD_EXPORT:
+		buf_id = (virtio_vdmabuf_buf_id_t *)msg->op;
+		ret = register_exported(vdmabuf, buf_id, msg->op);
+
+		break;
+	case VIRTIO_VDMABUF_CMD_NEED_VMID:
+		vmid_msg = kvcalloc(1, sizeof(struct virtio_vdmabuf_msg),
+				    GFP_KERNEL);
+		if (!vmid_msg) {
+			ret = -ENOMEM;
+			break;
+		}
+
+		vmid_msg->cmd = msg->cmd;
+		vmid_msg->op[0] = vdmabuf->vmid;
+		list_add_tail(&vmid_msg->list, &vdmabuf->msg_list);
+		vhost_work_queue(&vdmabuf->dev, &vdmabuf->send_work);
+
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
+static void vhost_vdmabuf_handle_send_kick(struct vhost_work *work)
+{
+	struct vhost_virtqueue *vq = container_of(work,
+						  struct vhost_virtqueue,
+						  poll.work);
+	struct vhost_vdmabuf *vdmabuf = container_of(vq->dev,
+					      	     struct vhost_vdmabuf,
+					      	     dev);
+	struct virtio_vdmabuf_msg msg;
+	int head, in, out, in_size;
+	bool added = false;
+	int ret;
+
+	mutex_lock(&vq->mutex);
+
+	if (!vhost_vq_get_backend(vq))
+		goto out;
+
+	vhost_disable_notify(&vdmabuf->dev, vq);
+
+	/* Make sure we will process all pending requests */
+	for (;;) {
+		head = vhost_get_vq_desc(vq, vq->iov, ARRAY_SIZE(vq->iov),
+					 &out, &in, NULL, NULL);
+
+		if (head < 0 || head == vq->num)
+			break;
+
+		in_size = iov_length(&vq->iov[in], out);
+		if (in_size != sizeof(struct virtio_vdmabuf_msg)) {
+			dev_err(drv_info->dev, "rx msg with wrong size\n");
+			break;
+		}
+
+		if (__copy_from_user(&msg, vq->iov[in].iov_base, in_size)) {
+			dev_err(drv_info->dev,
+				"err: can't get the msg from vq\n");
+			break;
+		}
+
+		ret = parse_msg(vdmabuf, &msg);
+		if (ret) {
+			dev_err(drv_info->dev,
+				"msg parse error: %d",
+				ret);
+			dev_err(drv_info->dev,
+				" cmd: %d\n", msg.cmd);
+
+			break;
+		}
+
+		vhost_add_used(vq, head, in_size);
+		added = true;
+	}
+
+	vhost_enable_notify(&vdmabuf->dev, vq);
+	if (added)
+		vhost_signal(&vdmabuf->dev, vq);
+out:
+	mutex_unlock(&vq->mutex);
+}
+
+static void vhost_vdmabuf_handle_recv_kick(struct vhost_work *work)
+{
+	struct vhost_virtqueue *vq = container_of(work,
+						  struct vhost_virtqueue,
+						  poll.work);
+	struct vhost_vdmabuf *vdmabuf = container_of(vq->dev,
+					      	     struct vhost_vdmabuf,
+					      	     dev);
+
+	send_to_recvq(vdmabuf, vq);
+}
+
+static int vhost_vdmabuf_get_kvm(struct notifier_block *nb,
+				 unsigned long event, void *data)
+{
+	struct kvm_instance *instance;
+	struct virtio_vdmabuf_info *drv = container_of(nb,
+						struct virtio_vdmabuf_info,
+						kvm_notifier);
+
+	instance = kzalloc(sizeof(*instance), GFP_KERNEL);
+	if (instance && event == KVM_EVENT_CREATE_VM) {
+		if (data) {
+			instance->kvm = data;
+			list_add_tail(&instance->link,
+				      &drv->kvm_instances);
+		}
+	}
+
+	return NOTIFY_OK;
+}
+
+static struct kvm *find_kvm_instance(u64 vmid)
+{
+	struct kvm_instance *instance, *tmp;
+	struct kvm *kvm = NULL;
+
+	list_for_each_entry_safe(instance, tmp, &drv_info->kvm_instances,
+                                 link) {
+		if (instance->kvm->userspace_pid == vmid) {
+			kvm = instance->kvm;
+
+			list_del(&instance->link);
+			kfree(instance);
+			break;
+		}
+	}
+
+	return kvm;
+}
+
+static int vhost_vdmabuf_open(struct inode *inode, struct file *filp)
+{
+	struct vhost_vdmabuf *vdmabuf;
+	struct vhost_virtqueue **vqs;
+	int ret = 0;
+
+	if (!drv_info) {
+		pr_err("vhost-vdmabuf: can't open misc device\n");
+		return -EINVAL;
+	}
+
+	vdmabuf = kzalloc(sizeof(*vdmabuf), GFP_KERNEL |
+			   __GFP_RETRY_MAYFAIL);
+	if (!vdmabuf)
+		return -ENOMEM;
+
+	vqs = kmalloc_array(ARRAY_SIZE(vdmabuf->vqs), sizeof(*vqs),
+			    GFP_KERNEL);
+	if (!vqs) {
+		kfree(vdmabuf);
+		return -ENOMEM;
+	}
+
+	vdmabuf->evq = kcalloc(1, sizeof(*(vdmabuf->evq)), GFP_KERNEL);
+	if (!vdmabuf->evq) {
+		kfree(vdmabuf);
+		kfree(vqs);
+		return -ENOMEM;
+	}
+
+	vqs[VDMABUF_VQ_SEND] = &vdmabuf->vqs[VDMABUF_VQ_SEND];
+	vqs[VDMABUF_VQ_RECV] = &vdmabuf->vqs[VDMABUF_VQ_RECV];
+	vdmabuf->vqs[VDMABUF_VQ_SEND].handle_kick = vhost_vdmabuf_handle_send_kick;
+	vdmabuf->vqs[VDMABUF_VQ_RECV].handle_kick = vhost_vdmabuf_handle_recv_kick;
+
+	vhost_dev_init(&vdmabuf->dev, vqs, ARRAY_SIZE(vdmabuf->vqs),
+		       UIO_MAXIOV, 0, 0, true, NULL);
+
+	INIT_LIST_HEAD(&vdmabuf->msg_list);
+	vhost_work_init(&vdmabuf->send_work, vhost_send_msg_work);
+	vdmabuf->vmid = task_pid_nr(current);
+	vdmabuf->kvm = find_kvm_instance(vdmabuf->vmid);
+	vhost_vdmabuf_add(vdmabuf);
+
+	mutex_init(&vdmabuf->evq->e_readlock);
+	spin_lock_init(&vdmabuf->evq->e_lock);
+
+	/* Initialize event queue */
+	INIT_LIST_HEAD(&vdmabuf->evq->e_list);
+	init_waitqueue_head(&vdmabuf->evq->e_wait);
+
+	/* resetting number of pending events */
+	vdmabuf->evq->pending = 0;
+	filp->private_data = vdmabuf;
+
+	return ret;
+}
+
+static void vhost_vdmabuf_flush(struct vhost_vdmabuf *vdmabuf)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(vdmabuf->vqs); i++)
+		if (vdmabuf->vqs[i].handle_kick)
+			vhost_poll_flush(&vdmabuf->vqs[i].poll);
+
+	vhost_work_flush(&vdmabuf->dev, &vdmabuf->send_work);
+}
+
+static int vhost_vdmabuf_release(struct inode *inode, struct file *filp)
+{
+	struct vhost_vdmabuf *vdmabuf = filp->private_data;
+	struct virtio_vdmabuf_event *e, *et;
+
+	if (!vhost_vdmabuf_del(vdmabuf))
+		return -EINVAL;
+
+	mutex_lock(&drv_info->g_mutex);
+
+	list_for_each_entry_safe(e, et, &vdmabuf->evq->e_list,
+				 link) {
+		list_del(&e->link);
+		kfree(e);
+		vdmabuf->evq->pending--;
+	}
+
+	vhost_vdmabuf_flush(vdmabuf);
+	vhost_dev_cleanup(&vdmabuf->dev);
+
+	kfree(vdmabuf->dev.vqs);
+	kvfree(vdmabuf);
+
+	filp->private_data = NULL;
+	mutex_unlock(&drv_info->g_mutex);
+
+	return 0;
+}
+
+static unsigned int vhost_vdmabuf_event_poll(struct file *filp,
+				    	     struct poll_table_struct *wait)
+{
+	struct vhost_vdmabuf *vdmabuf = filp->private_data;
+
+	poll_wait(filp, &vdmabuf->evq->e_wait, wait);
+
+	if (!list_empty(&vdmabuf->evq->e_list))
+		return POLLIN | POLLRDNORM;
+
+	return 0;
+}
+
+static ssize_t vhost_vdmabuf_event_read(struct file *filp, char __user *buf,
+			       		size_t cnt, loff_t *ofst)
+{
+	struct vhost_vdmabuf *vdmabuf = filp->private_data;
+	int ret;
+
+	if (task_pid_nr(current) != vdmabuf->vmid) {
+		dev_err(drv_info->dev, "current process cannot read events\n");
+		return -EPERM;
+	}
+
+	/* make sure user buffer can be written */
+	if (!access_ok(buf, sizeof(*buf))) {
+		dev_err(drv_info->dev, "user buffer can't be written.\n");
+		return -EINVAL;
+	}
+
+	ret = mutex_lock_interruptible(&vdmabuf->evq->e_readlock);
+	if (ret)
+		return ret;
+
+	for (;;) {
+		struct virtio_vdmabuf_event *e = NULL;
+
+		spin_lock_irq(&vdmabuf->evq->e_lock);
+		if (!list_empty(&vdmabuf->evq->e_list)) {
+			e = list_first_entry(&vdmabuf->evq->e_list,
+					     struct virtio_vdmabuf_event, link);
+			list_del(&e->link);
+		}
+		spin_unlock_irq(&vdmabuf->evq->e_lock);
+
+		if (!e) {
+			if (ret)
+				break;
+
+			if (filp->f_flags & O_NONBLOCK) {
+				ret = -EAGAIN;
+				break;
+			}
+
+			mutex_unlock(&vdmabuf->evq->e_readlock);
+			ret = wait_event_interruptible(vdmabuf->evq->e_wait,
+					!list_empty(&vdmabuf->evq->e_list));
+
+			if (ret == 0)
+				ret = mutex_lock_interruptible(
+						&vdmabuf->evq->e_readlock);
+
+			if (ret)
+				return ret;
+		} else {
+			unsigned int len = (sizeof(e->e_data.hdr) +
+					    e->e_data.hdr.size);
+
+			if (len > cnt - ret) {
+put_back_event:
+				spin_lock_irq(&vdmabuf->evq->e_lock);
+				list_add(&e->link, &vdmabuf->evq->e_list);
+				spin_unlock_irq(&vdmabuf->evq->e_lock);
+				break;
+			}
+
+			if (copy_to_user(buf + ret, &e->e_data.hdr,
+					 sizeof(e->e_data.hdr))) {
+				if (ret == 0)
+					ret = -EFAULT;
+
+				goto put_back_event;
+			}
+
+			ret += sizeof(e->e_data.hdr);
+
+			if (copy_to_user(buf + ret, e->e_data.data,
+					 e->e_data.hdr.size)) {
+
+				struct virtio_vdmabuf_e_hdr dummy_hdr = {0};
+
+				ret -= sizeof(e->e_data.hdr);
+
+				/* nullifying hdr of the event in user buffer */
+				if (copy_to_user(buf + ret, &dummy_hdr,
+						 sizeof(dummy_hdr)))
+					dev_err(drv_info->dev,
+					   "fail to nullify invalid hdr\n");
+
+				ret = -EFAULT;
+
+				goto put_back_event;
+			}
+
+			ret += e->e_data.hdr.size;
+
+			spin_lock_irq(&vdmabuf->evq->e_lock);
+			vdmabuf->evq->pending--;
+			spin_unlock_irq(&vdmabuf->evq->e_lock);
+			kfree(e);
+		}
+	}
+
+	mutex_unlock(&vdmabuf->evq->e_readlock);
+
+	return ret;
+}
+
+static int vhost_vdmabuf_start(struct vhost_vdmabuf *vdmabuf)
+{
+        struct vhost_virtqueue *vq;
+        int i, ret;
+
+	mutex_lock(&vdmabuf->dev.mutex);
+
+        ret = vhost_dev_check_owner(&vdmabuf->dev);
+        if (ret)
+                goto err;
+
+	for (i = 0; i < ARRAY_SIZE(vdmabuf->vqs); i++) {
+		vq = &vdmabuf->vqs[i];
+
+		mutex_lock(&vq->mutex);
+
+		if (!vhost_vq_access_ok(vq)) {
+			ret = -EFAULT;
+			goto err_vq;
+		}
+
+		if (!vhost_vq_get_backend(vq)) {
+			vhost_vq_set_backend(vq, vdmabuf);
+			ret = vhost_vq_init_access(vq);
+			if (ret)
+				goto err_vq;
+		}
+
+		mutex_unlock(&vq->mutex);
+	}
+
+	mutex_unlock(&vdmabuf->dev.mutex);
+        return 0;
+
+err_vq:
+        vhost_vq_set_backend(vq, NULL);
+        mutex_unlock(&vq->mutex);
+
+	for (i = 0; i < ARRAY_SIZE(vdmabuf->vqs); i++) {
+		vq = &vdmabuf->vqs[i];
+
+		mutex_lock(&vq->mutex);
+		vhost_vq_set_backend(vq, NULL);
+		mutex_unlock(&vq->mutex);
+	}
+
+err:
+	mutex_unlock(&vdmabuf->dev.mutex);
+        return ret;
+}
+
+static int vhost_vdmabuf_stop(struct vhost_vdmabuf *vdmabuf)
+{
+        struct vhost_virtqueue *vq;
+        int i, ret;
+
+	mutex_lock(&vdmabuf->dev.mutex);
+
+        ret = vhost_dev_check_owner(&vdmabuf->dev);
+        if (ret)
+                goto err;
+
+	for (i = 0; i < ARRAY_SIZE(vdmabuf->vqs); i++) {
+		vq = &vdmabuf->vqs[i];
+
+		mutex_lock(&vq->mutex);
+		vhost_vq_set_backend(vq, NULL);
+		mutex_unlock(&vq->mutex);
+	}
+
+err:
+	mutex_unlock(&vdmabuf->dev.mutex);
+        return ret;
+}
+
+static int vhost_vdmabuf_set_features(struct vhost_vdmabuf *vdmabuf,
+				      u64 features)
+{
+	struct vhost_virtqueue *vq;
+	int i;
+
+	if (features & ~VHOST_VDMABUF_FEATURES)
+		return -EOPNOTSUPP;
+
+	mutex_lock(&vdmabuf->dev.mutex);
+	if ((features & (1 << VHOST_F_LOG_ALL)) &&
+	    !vhost_log_access_ok(&vdmabuf->dev)) {
+		mutex_unlock(&vdmabuf->dev.mutex);
+		return -EFAULT;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(vdmabuf->vqs); i++) {
+		vq = &vdmabuf->vqs[i];
+		mutex_lock(&vq->mutex);
+		vq->acked_features = features;
+		mutex_unlock(&vq->mutex);
+	}
+
+	mutex_unlock(&vdmabuf->dev.mutex);
+	return 0;
+}
+
+/* wrapper ioctl for vhost interface control */
+static int vhost_core_ioctl(struct file *filp, unsigned int cmd,
+			    unsigned long param)
+{
+	struct vhost_vdmabuf *vdmabuf = filp->private_data;
+	void __user *argp = (void __user *)param;
+	u64 features;
+	int ret, start;
+
+	switch (cmd) {
+	case VHOST_GET_FEATURES:
+		features = VHOST_VDMABUF_FEATURES;
+		if (copy_to_user(argp, &features, sizeof(features)))
+			return -EFAULT;
+		return 0;
+	case VHOST_SET_FEATURES:
+		if (copy_from_user(&features, argp, sizeof(features)))
+			return -EFAULT;
+		return vhost_vdmabuf_set_features(vdmabuf, features);
+	case VHOST_VDMABUF_SET_RUNNING:
+		if (copy_from_user(&start, argp, sizeof(start)))
+                        return -EFAULT;
+
+		if (start)
+                	return vhost_vdmabuf_start(vdmabuf);
+                else
+                        return vhost_vdmabuf_stop(vdmabuf);
+	default:
+		mutex_lock(&vdmabuf->dev.mutex);
+		ret = vhost_dev_ioctl(&vdmabuf->dev, cmd, argp);
+		if (ret == -ENOIOCTLCMD) {
+			ret = vhost_vring_ioctl(&vdmabuf->dev, cmd, argp);
+		} else {
+			vhost_vdmabuf_flush(vdmabuf);
+		}
+		mutex_unlock(&vdmabuf->dev.mutex);
+	}
+
+	return ret;
+}
+
+/*
+ * ioctl - importing vdmabuf from guest OS
+ *
+ * user parameters:
+ *
+ *	virtio_vdmabuf_buf_id_t buf_id - vdmabuf ID of imported buffer
+ *	int flags - flags
+ *	int fd - file handle of	the imported buffer
+ *
+ */
+static int import_ioctl(struct file *filp, void *data)
+{
+	struct vhost_vdmabuf *vdmabuf = filp->private_data;
+	struct virtio_vdmabuf_import *attr = data;
+	struct virtio_vdmabuf_buf *imp;
+	int ret = 0;
+
+	mutex_lock(&vdmabuf->dev.mutex);
+
+	/* look for dmabuf for the id */
+	imp = virtio_vdmabuf_find_buf(drv_info, &attr->buf_id);
+	if (!imp || !imp->valid) {
+		mutex_unlock(&vdmabuf->dev.mutex);
+		dev_err(drv_info->dev,
+			"no valid buf found with id = %llu\n", attr->buf_id.id);
+		return -ENOENT;
+	}
+
+	/* only if mapped pages are not present */
+	if (!imp->pages_info->pages) {
+		ret = vhost_vdmabuf_map_pages(vdmabuf->vmid, imp->pages_info);
+		if (ret < 0) {
+			dev_err(drv_info->dev,
+				"failed to map guest pages\n");
+			goto fail_map;
+		}
+	}
+
+	attr->fd = vhost_vdmabuf_exp_fd(imp, attr->flags);
+	if (attr->fd < 0) {
+		dev_err(drv_info->dev, "failed to get file descriptor\n");
+		goto fail_import;
+	}
+
+	imp->imported = true;
+
+	mutex_unlock(&vdmabuf->dev.mutex);
+	goto success;
+
+fail_import:
+	/* not imported yet? */
+	if (!imp->imported) {
+		vhost_vdmabuf_unmap_pages(vdmabuf->vmid, imp->pages_info);
+		if (imp->dma_buf)
+			kfree(imp->dma_buf);
+
+		if (imp->sgt) {
+			sg_free_table(imp->sgt);
+			kfree(imp->sgt);
+			imp->sgt = NULL;
+		}
+	}
+
+fail_map:
+	/* Check if buffer is still valid and if not remove it
+	 * from imported list.
+	 */
+	if (!imp->valid && !imp->imported) {
+		virtio_vdmabuf_del_buf(drv_info, &imp->buf_id);
+		kfree(imp->priv);
+		kfree(imp->pages_info);
+		kfree(imp);
+	}
+
+	ret =  attr->fd;
+	mutex_unlock(&vdmabuf->dev.mutex);
+
+success:
+	return ret;
+}
+
+static int release_ioctl(struct file *filp, void *data)
+{
+	struct vhost_vdmabuf *vdmabuf = filp->private_data;
+	struct virtio_vdmabuf_import *attr = data;
+	struct virtio_vdmabuf_buf *imp;
+	virtio_vdmabuf_buf_id_t buf_id = attr->buf_id;
+	int *op;
+	int ret = 0;
+
+	op = kcalloc(1, sizeof(int) * 65, GFP_KERNEL);
+	if (!op)
+		return -ENOMEM;
+
+	imp = virtio_vdmabuf_find_buf(drv_info, &buf_id);
+	if (!imp)
+		return -EINVAL;
+
+	imp->imported = false;
+
+	memcpy(op, &imp->buf_id, sizeof(imp->buf_id));
+
+	ret = send_msg_to_guest(vdmabuf->vmid, VIRTIO_VDMABUF_CMD_DMABUF_REL,
+				op);
+	if (ret < 0) {
+		dev_err(drv_info->dev, "fail to send release cmd\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct virtio_vdmabuf_ioctl_desc vhost_vdmabuf_ioctls[] = {
+	VIRTIO_VDMABUF_IOCTL_DEF(VIRTIO_VDMABUF_IOCTL_IMPORT, import_ioctl, 0),
+	VIRTIO_VDMABUF_IOCTL_DEF(VIRTIO_VDMABUF_IOCTL_RELEASE, release_ioctl, 0),
+};
+
+static long vhost_vdmabuf_ioctl(struct file *filp, unsigned int cmd,
+				unsigned long param)
+{
+	const struct virtio_vdmabuf_ioctl_desc *ioctl;
+	virtio_vdmabuf_ioctl_t func;
+	unsigned int nr;
+	int ret;
+	char *kdata;
+
+	/* check if cmd is vhost's */
+	if (_IOC_TYPE(cmd) == VHOST_VIRTIO) {
+		ret = vhost_core_ioctl(filp, cmd, param);
+		return ret;
+	}
+
+	nr = _IOC_NR(cmd);
+
+	if (nr >= ARRAY_SIZE(vhost_vdmabuf_ioctls)) {
+		dev_err(drv_info->dev, "invalid ioctl\n");
+		return -EINVAL;
+	}
+
+	ioctl = &vhost_vdmabuf_ioctls[nr];
+
+	func = ioctl->func;
+
+	if (unlikely(!func)) {
+		dev_err(drv_info->dev, "no function\n");
+		return -EINVAL;
+	}
+
+	kdata = kmalloc(_IOC_SIZE(cmd), GFP_KERNEL);
+	if (!kdata)
+		return -ENOMEM;
+
+	if (copy_from_user(kdata, (void __user *)param,
+			   _IOC_SIZE(cmd)) != 0) {
+		dev_err(drv_info->dev,
+			"failed to copy args from userspace\n");
+		ret = -EFAULT;
+		goto ioctl_error;
+	}
+
+	ret = func(filp, kdata);
+
+	if (copy_to_user((void __user *)param, kdata,
+			 _IOC_SIZE(cmd)) != 0) {
+		dev_err(drv_info->dev,
+			"failed to copy args back to userspace\n");
+		ret = -EFAULT;
+		goto ioctl_error;
+	}
+
+ioctl_error:
+	kfree(kdata);
+	return ret;
+}
+
+static const struct file_operations vhost_vdmabuf_fops = {
+	.owner = THIS_MODULE,
+	.open = vhost_vdmabuf_open,
+	.release = vhost_vdmabuf_release,
+	.read = vhost_vdmabuf_event_read,
+	.poll = vhost_vdmabuf_event_poll,
+	.unlocked_ioctl = vhost_vdmabuf_ioctl,
+};
+
+static struct miscdevice vhost_vdmabuf_miscdev = {
+	.minor = MISC_DYNAMIC_MINOR,
+	.name = "vhost-vdmabuf",
+	.fops = &vhost_vdmabuf_fops,
+};
+
+static int __init vhost_vdmabuf_init(void)
+{
+	int ret = 0;
+
+	ret = misc_register(&vhost_vdmabuf_miscdev);
+	if (ret) {
+		pr_err("vhost-vdmabuf: driver can't be registered\n");
+		return ret;
+	}
+
+	dma_coerce_mask_and_coherent(vhost_vdmabuf_miscdev.this_device,
+				     DMA_BIT_MASK(64));
+
+	drv_info = kcalloc(1, sizeof(*drv_info), GFP_KERNEL);
+	if (!drv_info) {
+		misc_deregister(&vhost_vdmabuf_miscdev);
+		return -ENOMEM;
+	}
+
+	drv_info->dev = vhost_vdmabuf_miscdev.this_device;
+
+	hash_init(drv_info->buf_list);
+	mutex_init(&drv_info->g_mutex);
+
+	INIT_LIST_HEAD(&drv_info->head_vdmabuf_list);
+	INIT_LIST_HEAD(&drv_info->kvm_instances);
+
+	drv_info->kvm_notifier.notifier_call = vhost_vdmabuf_get_kvm;
+	ret = kvm_vm_register_notifier(&drv_info->kvm_notifier);
+
+	return ret;
+}
+
+static void __exit vhost_vdmabuf_deinit(void)
+{
+	misc_deregister(&vhost_vdmabuf_miscdev);
+	vhost_vdmabuf_del_all();
+
+	kvm_vm_unregister_notifier(&drv_info->kvm_notifier);
+	kfree(drv_info);
+	drv_info = NULL;
+}
+
+module_init(vhost_vdmabuf_init);
+module_exit(vhost_vdmabuf_deinit);
+
+MODULE_DESCRIPTION("Vhost Vdmabuf Driver");
+MODULE_LICENSE("GPL and additional rights");
diff --git a/include/uapi/linux/vhost.h b/include/uapi/linux/vhost.h
index c998860d7bbc..2b7b37669af4 100644
--- a/include/uapi/linux/vhost.h
+++ b/include/uapi/linux/vhost.h
@@ -150,4 +150,7 @@
 /* Get the valid iova range */
 #define VHOST_VDPA_GET_IOVA_RANGE	_IOR(VHOST_VIRTIO, 0x78, \
 					     struct vhost_vdpa_iova_range)
+
+/* VHOST_VDMABUF specific defines */
+#define VHOST_VDMABUF_SET_RUNNING       _IOW(VHOST_VIRTIO, 0x79, int)
 #endif
-- 
2.26.2

