Return-Path: <linux-media+bounces-15707-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78308944AE3
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2024 14:06:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 329D928703F
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2024 12:06:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F373B19F487;
	Thu,  1 Aug 2024 12:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gvfiWWaE"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56680189B90;
	Thu,  1 Aug 2024 12:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722513951; cv=none; b=Snalk4DrzOnUn19E+7VEm91JOsn1IfTTGi0ouq1QafvZRnpJpM2dkhBhdZ85LmrtUaWpWIKhyRBa4OlDYJzoU0PFITMxZ9VKfr/QT7t46N4IHsWR2M2+baxnGiwq6qSQCU90a6EfqyD+ArdFS4ljKzZlylbbpCW0js8mgQU5cAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722513951; c=relaxed/simple;
	bh=tmgwM3dgC5/IejCxV/AIPdrvW4LX0UJNSQHZ02gdLW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JfRrxAUszYFgsNyxbUj12/cjdspGnlhOcz8vtGV4hKZ26+J+bhs/R1DNq8s6yU7F2F8/mdCsUuJZwxg/n5blYBXMaHFLb7Sw5yekgV0FKDbUejThp9Ir7AV5ffGlWIAXZN+T4FkZ2CjkUxfqvWn/vua2+FAaGhuS4dBm8IWDz4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gvfiWWaE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54545C4AF0A;
	Thu,  1 Aug 2024 12:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722513950;
	bh=tmgwM3dgC5/IejCxV/AIPdrvW4LX0UJNSQHZ02gdLW4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gvfiWWaEChlbMPz+AfspkLZ61MuYBS7G+wsFCQGbi6P0yjWyI2HNKdfHGs4lmN1/v
	 lGn98TonRKMkPC+XvCJ8ar0fnRGygm60hoAJRGmTD392OLrnmsbfJWxFhXJe8JM2tK
	 xJtCQt44Vu3jzdXZWnrxuQEfj3pmdIFSXmTM62twE2bp7cuUfwQafCSZk60FfPZtkn
	 nBgyt0ey7zigfvljc/cePxmzfcduMf8vexja7jP8SdAnfk1ENZ1fEXyd6QJif6XsG7
	 LUzIIOws25GfY9NrGqbdiOe3JuvoJFohiJZjNcloecJNpMm75lxItomAJPaq1t5Agt
	 /9Cdrq2lFMS4w==
From: Leon Romanovsky <leon@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Yishai Hadas <yishaih@nvidia.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-media@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	Michael Margolin <mrgolin@amazon.com>,
	Mustafa Ismail <mustafa.ismail@intel.com>,
	netdev@vger.kernel.org,
	Saeed Mahameed <saeedm@nvidia.com>,
	Selvin Xavier <selvin.xavier@broadcom.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Tariq Toukan <tariqt@nvidia.com>,
	Tatyana Nikolova <tatyana.e.nikolova@intel.com>
Subject: [PATCH rdma-next 2/8] RDMA/mlx5: Introduce the 'data direct' driver
Date: Thu,  1 Aug 2024 15:05:11 +0300
Message-ID: <b77edecfd476c3f445da96ab6aef499ae47b2829.1722512548.git.leon@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1722512548.git.leon@kernel.org>
References: <cover.1722512548.git.leon@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yishai Hadas <yishaih@nvidia.com>

Introduce the 'data direct' driver for a ConnectX-8 Data Direct device.

The 'data direct' driver functions as the affiliated DMA device for one
or more capable mlx5_ib devices. This DMA device, as the name suggests,
is used exclusively for DMA operations. It can be considered a DMA engine
managed by a PF/VF, lacking network capabilities and having minimal overall
capabilities.

Consequently, the DMA NIC PF will not be exposed to or directly used by
software applications. The driver will not have any direct interface or
interaction with the firmware (no command interface, no capabilities,
etc.). It will operate solely over PCI to enable its DMA functionality.

Registration and un-registration of the driver are handled as part of
the mlx5_ib initialization and exit processes, as the mlx5_ib devices
will effectively be its clients.

The driver will serve as the DMA device for accessing another PCI device
to achieve optimal performance (both on the same NUMA node, P2P access,
etc.).

Upon probing, it will read its VUID over PCI to handle mlx5_ib device
registrations with the same VUID.

Upon removal, it will notify its clients to allow them to clean up the
resources that were mmaped with its DMA device.

Signed-off-by: Yishai Hadas <yishaih@nvidia.com>
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/infiniband/hw/mlx5/Makefile      |   1 +
 drivers/infiniband/hw/mlx5/data_direct.c | 227 +++++++++++++++++++++++
 drivers/infiniband/hw/mlx5/data_direct.h |  23 +++
 drivers/infiniband/hw/mlx5/main.c        |  24 +++
 drivers/infiniband/hw/mlx5/mlx5_ib.h     |   6 +
 5 files changed, 281 insertions(+)
 create mode 100644 drivers/infiniband/hw/mlx5/data_direct.c
 create mode 100644 drivers/infiniband/hw/mlx5/data_direct.h

diff --git a/drivers/infiniband/hw/mlx5/Makefile b/drivers/infiniband/hw/mlx5/Makefile
index 72a526236c2e..b38961f5058e 100644
--- a/drivers/infiniband/hw/mlx5/Makefile
+++ b/drivers/infiniband/hw/mlx5/Makefile
@@ -6,6 +6,7 @@ mlx5_ib-y := ah.o \
 	     cong.o \
 	     counters.o \
 	     cq.o \
+	     data_direct.o \
 	     dm.o \
 	     doorbell.o \
 	     gsi.o \
diff --git a/drivers/infiniband/hw/mlx5/data_direct.c b/drivers/infiniband/hw/mlx5/data_direct.c
new file mode 100644
index 000000000000..b9ba84afaae2
--- /dev/null
+++ b/drivers/infiniband/hw/mlx5/data_direct.c
@@ -0,0 +1,227 @@
+// SPDX-License-Identifier: GPL-2.0 OR Linux-OpenIB
+/*
+ * Copyright (c) 2024, NVIDIA CORPORATION & AFFILIATES. All rights reserved
+ */
+
+#include "mlx5_ib.h"
+#include "data_direct.h"
+
+static LIST_HEAD(mlx5_data_direct_dev_list);
+static LIST_HEAD(mlx5_data_direct_reg_list);
+
+/*
+ * This mutex should be held when accessing either of the above lists
+ */
+static DEFINE_MUTEX(mlx5_data_direct_mutex);
+
+struct mlx5_data_direct_registration {
+	struct mlx5_ib_dev *ibdev;
+	char vuid[MLX5_ST_SZ_BYTES(array1024_auto) + 1];
+	struct list_head list;
+};
+
+static const struct pci_device_id mlx5_data_direct_pci_table[] = {
+	{ PCI_VDEVICE(MELLANOX, 0x2100) }, /* ConnectX-8 Data Direct */
+	{ 0, }
+};
+
+static int mlx5_data_direct_vpd_get_vuid(struct mlx5_data_direct_dev *dev)
+{
+	struct pci_dev *pdev = dev->pdev;
+	unsigned int vpd_size, kw_len;
+	u8 *vpd_data;
+	int start;
+	int ret;
+
+	vpd_data = pci_vpd_alloc(pdev, &vpd_size);
+	if (IS_ERR(vpd_data)) {
+		pci_err(pdev, "Unable to read VPD, err=%ld\n", PTR_ERR(vpd_data));
+		return PTR_ERR(vpd_data);
+	}
+
+	start = pci_vpd_find_ro_info_keyword(vpd_data, vpd_size, "VU", &kw_len);
+	if (start < 0) {
+		ret = start;
+		pci_err(pdev, "VU keyword not found, err=%d\n", ret);
+		goto end;
+	}
+
+	dev->vuid = kmemdup_nul(vpd_data + start, kw_len, GFP_KERNEL);
+	ret = dev->vuid ? 0 : -ENOMEM;
+
+end:
+	kfree(vpd_data);
+	return ret;
+}
+
+static void mlx5_data_direct_shutdown(struct pci_dev *pdev)
+{
+	pci_disable_device(pdev);
+}
+
+static int mlx5_data_direct_set_dma_caps(struct pci_dev *pdev)
+{
+	int err;
+
+	err = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
+	if (err) {
+		dev_warn(&pdev->dev,
+			 "Warning: couldn't set 64-bit PCI DMA mask, err=%d\n", err);
+		err = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
+		if (err) {
+			dev_err(&pdev->dev, "Can't set PCI DMA mask, err=%d\n", err);
+			return err;
+		}
+	}
+
+	dma_set_max_seg_size(&pdev->dev, SZ_2G);
+	return 0;
+}
+
+int mlx5_data_direct_ib_reg(struct mlx5_ib_dev *ibdev, char *vuid)
+{
+	struct mlx5_data_direct_registration *reg;
+	struct mlx5_data_direct_dev *dev;
+
+	reg = kzalloc(sizeof(*reg), GFP_KERNEL);
+	if (!reg)
+		return -ENOMEM;
+
+	reg->ibdev = ibdev;
+	strcpy(reg->vuid, vuid);
+
+	mutex_lock(&mlx5_data_direct_mutex);
+	list_for_each_entry(dev, &mlx5_data_direct_dev_list, list) {
+		if (strcmp(dev->vuid, vuid) == 0) {
+			mlx5_ib_data_direct_bind(ibdev, dev);
+			break;
+		}
+	}
+
+	/* Add the registration to its global list, to be used upon bind/unbind
+	 * of its affiliated data direct device
+	 */
+	list_add_tail(&reg->list, &mlx5_data_direct_reg_list);
+	mutex_unlock(&mlx5_data_direct_mutex);
+	return 0;
+}
+
+void mlx5_data_direct_ib_unreg(struct mlx5_ib_dev *ibdev)
+{
+	struct mlx5_data_direct_registration *reg;
+
+	mutex_lock(&mlx5_data_direct_mutex);
+	list_for_each_entry(reg, &mlx5_data_direct_reg_list, list) {
+		if (reg->ibdev == ibdev) {
+			list_del(&reg->list);
+			kfree(reg);
+			goto end;
+		}
+	}
+
+	WARN_ON(true);
+end:
+	mutex_unlock(&mlx5_data_direct_mutex);
+}
+
+static void mlx5_data_direct_dev_reg(struct mlx5_data_direct_dev *dev)
+{
+	struct mlx5_data_direct_registration *reg;
+
+	mutex_lock(&mlx5_data_direct_mutex);
+	list_for_each_entry(reg, &mlx5_data_direct_reg_list, list) {
+		if (strcmp(dev->vuid, reg->vuid) == 0)
+			mlx5_ib_data_direct_bind(reg->ibdev, dev);
+	}
+
+	/* Add the data direct device to the global list, further IB devices may
+	 * use it later as well
+	 */
+	list_add_tail(&dev->list, &mlx5_data_direct_dev_list);
+	mutex_unlock(&mlx5_data_direct_mutex);
+}
+
+static void mlx5_data_direct_dev_unreg(struct mlx5_data_direct_dev *dev)
+{
+	struct mlx5_data_direct_registration *reg;
+
+	mutex_lock(&mlx5_data_direct_mutex);
+	/* Prevent any further affiliations */
+	list_del(&dev->list);
+	list_for_each_entry(reg, &mlx5_data_direct_reg_list, list) {
+		if (strcmp(dev->vuid, reg->vuid) == 0)
+			mlx5_ib_data_direct_unbind(reg->ibdev);
+	}
+	mutex_unlock(&mlx5_data_direct_mutex);
+}
+
+static int mlx5_data_direct_probe(struct pci_dev *pdev, const struct pci_device_id *id)
+{
+	struct mlx5_data_direct_dev *dev;
+	int err;
+
+	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
+	if (!dev)
+		return -ENOMEM;
+
+	dev->device = &pdev->dev;
+	dev->pdev = pdev;
+
+	pci_set_drvdata(dev->pdev, dev);
+	err = pci_enable_device(pdev);
+	if (err) {
+		dev_err(dev->device, "Cannot enable PCI device, err=%d\n", err);
+		goto err;
+	}
+
+	pci_set_master(pdev);
+	err = mlx5_data_direct_set_dma_caps(pdev);
+	if (err)
+		goto err_disable;
+
+	if (pci_enable_atomic_ops_to_root(pdev, PCI_EXP_DEVCAP2_ATOMIC_COMP32) &&
+	    pci_enable_atomic_ops_to_root(pdev, PCI_EXP_DEVCAP2_ATOMIC_COMP64) &&
+	    pci_enable_atomic_ops_to_root(pdev, PCI_EXP_DEVCAP2_ATOMIC_COMP128))
+		dev_dbg(dev->device, "Enabling pci atomics failed\n");
+
+	err = mlx5_data_direct_vpd_get_vuid(dev);
+	if (err)
+		goto err_disable;
+
+	mlx5_data_direct_dev_reg(dev);
+	return 0;
+
+err_disable:
+	pci_disable_device(pdev);
+err:
+	kfree(dev);
+	return err;
+}
+
+static void mlx5_data_direct_remove(struct pci_dev *pdev)
+{
+	struct mlx5_data_direct_dev *dev = pci_get_drvdata(pdev);
+
+	mlx5_data_direct_dev_unreg(dev);
+	pci_disable_device(pdev);
+	kfree(dev->vuid);
+	kfree(dev);
+}
+
+static struct pci_driver mlx5_data_direct_driver = {
+	.name = KBUILD_MODNAME,
+	.id_table = mlx5_data_direct_pci_table,
+	.probe = mlx5_data_direct_probe,
+	.remove = mlx5_data_direct_remove,
+	.shutdown = mlx5_data_direct_shutdown,
+};
+
+int mlx5_data_direct_driver_register(void)
+{
+	return pci_register_driver(&mlx5_data_direct_driver);
+}
+
+void mlx5_data_direct_driver_unregister(void)
+{
+	pci_unregister_driver(&mlx5_data_direct_driver);
+}
diff --git a/drivers/infiniband/hw/mlx5/data_direct.h b/drivers/infiniband/hw/mlx5/data_direct.h
new file mode 100644
index 000000000000..2fd2bdbe8f69
--- /dev/null
+++ b/drivers/infiniband/hw/mlx5/data_direct.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0 OR Linux-OpenIB */
+/*
+ * Copyright (c) 2024, NVIDIA CORPORATION & AFFILIATES. All rights reserved
+ */
+
+#ifndef _MLX5_IB_DATA_DIRECT_H
+#define _MLX5_IB_DATA_DIRECT_H
+
+struct mlx5_ib_dev;
+
+struct mlx5_data_direct_dev {
+	struct device *device;
+	struct pci_dev *pdev;
+	char *vuid;
+	struct list_head list;
+};
+
+int mlx5_data_direct_ib_reg(struct mlx5_ib_dev *ibdev, char *vuid);
+void mlx5_data_direct_ib_unreg(struct mlx5_ib_dev *ibdev);
+int mlx5_data_direct_driver_register(void);
+void mlx5_data_direct_driver_unregister(void);
+
+#endif
diff --git a/drivers/infiniband/hw/mlx5/main.c b/drivers/infiniband/hw/mlx5/main.c
index 6048b9ad13bb..de254cf03173 100644
--- a/drivers/infiniband/hw/mlx5/main.c
+++ b/drivers/infiniband/hw/mlx5/main.c
@@ -48,6 +48,7 @@
 #include <rdma/mlx5_user_ioctl_verbs.h>
 #include <rdma/mlx5_user_ioctl_cmds.h>
 #include "macsec.h"
+#include "data_direct.h"
 
 #define UVERBS_MODULE_NAME mlx5_ib
 #include <rdma/uverbs_named_ioctl.h>
@@ -3866,6 +3867,7 @@ static int mlx5_ib_stage_init_init(struct mlx5_ib_dev *dev)
 	dev->ib_dev.num_comp_vectors    = mlx5_comp_vectors_max(mdev);
 
 	mutex_init(&dev->cap_mask_mutex);
+	mutex_init(&dev->data_direct_lock);
 	INIT_LIST_HEAD(&dev->qp_list);
 	spin_lock_init(&dev->reset_flow_resource_lock);
 	xa_init(&dev->odp_mkeys);
@@ -4293,6 +4295,21 @@ static void mlx5_ib_stage_dev_notifier_cleanup(struct mlx5_ib_dev *dev)
 	mlx5_notifier_unregister(dev->mdev, &dev->mdev_events);
 }
 
+void mlx5_ib_data_direct_bind(struct mlx5_ib_dev *ibdev,
+			      struct mlx5_data_direct_dev *dev)
+{
+	mutex_lock(&ibdev->data_direct_lock);
+	ibdev->data_direct_dev = dev;
+	mutex_unlock(&ibdev->data_direct_lock);
+}
+
+void mlx5_ib_data_direct_unbind(struct mlx5_ib_dev *ibdev)
+{
+	mutex_lock(&ibdev->data_direct_lock);
+	ibdev->data_direct_dev = NULL;
+	mutex_unlock(&ibdev->data_direct_lock);
+}
+
 void __mlx5_ib_remove(struct mlx5_ib_dev *dev,
 		      const struct mlx5_ib_profile *profile,
 		      int stage)
@@ -4715,17 +4732,23 @@ static int __init mlx5_ib_init(void)
 	ret = mlx5r_rep_init();
 	if (ret)
 		goto rep_err;
+	ret = mlx5_data_direct_driver_register();
+	if (ret)
+		goto dd_err;
 	ret = auxiliary_driver_register(&mlx5r_mp_driver);
 	if (ret)
 		goto mp_err;
 	ret = auxiliary_driver_register(&mlx5r_driver);
 	if (ret)
 		goto drv_err;
+
 	return 0;
 
 drv_err:
 	auxiliary_driver_unregister(&mlx5r_mp_driver);
 mp_err:
+	mlx5_data_direct_driver_unregister();
+dd_err:
 	mlx5r_rep_cleanup();
 rep_err:
 	mlx5_ib_qp_event_cleanup();
@@ -4737,6 +4760,7 @@ static int __init mlx5_ib_init(void)
 
 static void __exit mlx5_ib_cleanup(void)
 {
+	mlx5_data_direct_driver_unregister();
 	auxiliary_driver_unregister(&mlx5r_driver);
 	auxiliary_driver_unregister(&mlx5r_mp_driver);
 	mlx5r_rep_cleanup();
diff --git a/drivers/infiniband/hw/mlx5/mlx5_ib.h b/drivers/infiniband/hw/mlx5/mlx5_ib.h
index d5eb1b726675..b0d7d8b9e672 100644
--- a/drivers/infiniband/hw/mlx5/mlx5_ib.h
+++ b/drivers/infiniband/hw/mlx5/mlx5_ib.h
@@ -1131,6 +1131,9 @@ struct mlx5_macsec {
 struct mlx5_ib_dev {
 	struct ib_device		ib_dev;
 	struct mlx5_core_dev		*mdev;
+	struct mlx5_data_direct_dev	*data_direct_dev;
+	/* protect accessing data_direct_dev */
+	struct mutex			data_direct_lock;
 	struct notifier_block		mdev_events;
 	int				num_ports;
 	/* serialize update of capability mask
@@ -1425,6 +1428,9 @@ int mlx5_ib_destroy_rwq_ind_table(struct ib_rwq_ind_table *wq_ind_table);
 struct ib_mr *mlx5_ib_reg_dm_mr(struct ib_pd *pd, struct ib_dm *dm,
 				struct ib_dm_mr_attr *attr,
 				struct uverbs_attr_bundle *attrs);
+void mlx5_ib_data_direct_bind(struct mlx5_ib_dev *ibdev,
+			      struct mlx5_data_direct_dev *dev);
+void mlx5_ib_data_direct_unbind(struct mlx5_ib_dev *ibdev);
 
 #ifdef CONFIG_INFINIBAND_ON_DEMAND_PAGING
 int mlx5_ib_odp_init_one(struct mlx5_ib_dev *ibdev);
-- 
2.45.2


