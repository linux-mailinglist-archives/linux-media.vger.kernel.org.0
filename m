Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD6634FD22
	for <lists+linux-media@lfdr.de>; Sun, 23 Jun 2019 19:08:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726890AbfFWRIU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 23 Jun 2019 13:08:20 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:46763 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726877AbfFWRIT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 23 Jun 2019 13:08:19 -0400
Received: by mail-qt1-f194.google.com with SMTP id h21so12061899qtn.13;
        Sun, 23 Jun 2019 10:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RdHUBjzECRux4Cyv9bhvl2y5oTWkTNKfH37Rny3oJM0=;
        b=D5iByDcT2ElU/S1pAY+bgZCb9w4ALCgosxQpO3wdryMiMYRbCm4KXpMYOoFOEgxbNU
         Be/hc/s5TCm4pML6yV6YgijzzEiyKqviD6uzswHiSZh6du2g1hj18ZfdmKVC3lg7CDQE
         u/wcXI1HGqhmStIy+hc9/zLtFnI7LeXVInheMUUhPeZYm1qpg+KyNPL5gcz6YoiGj+BN
         /4ktearIIzTNK/P166EkOn9ZqBbS8AEBkEAqJBOizKYIa+3R383S4IJx5tW2AvETdeL/
         aDDYRTC1hLi1kNoXD4PTQQjsguAbs4HAGBTatBy91OtnwVd08+6k/SwzHHhgvR45KlDn
         uvKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RdHUBjzECRux4Cyv9bhvl2y5oTWkTNKfH37Rny3oJM0=;
        b=JyoV4v6VrL82LYRIjpC4GXQqr2X+6Qpz0PxIoW7cqwKcIDnpb+G2kHeiHkLrrRfgZO
         bPSaSSJGyTWCMTXyVp9xsieqDCt+1TlkwoHOkD1ilgZwQpszejnyIoyjwgQpBF/+BFde
         u8tzFSkq9tAz0ZnNj6L6qvEUCYzKHy3yxQHBKN/AyZDr0zksvPe9TAl9szxs6UdndQSy
         ikXqFDw+j84PRFNeR/InsP83FnNjZrGnG4holk6Up3v7AD9bKW7Jc5aSju+MCAGptmRL
         iUY5h1WE9uN8xG29pQJf2eLfu2rF152jAQhZHNhTyeBpUSwrpHRHAOkNO2ZUVj2NVooL
         VIoQ==
X-Gm-Message-State: APjAAAWUJlnh3sd+CoS51LvbYC3dIOIIcysVvR05Le+iyM/MM/3uAtKk
        puTsVF+FgAuOm/HOpHJRSqc=
X-Google-Smtp-Source: APXvYqw02xXc3F16A2Bhaqq8Xi2JedYX9liKCBm1a567oZ2s0uh6/yaWv8cI2wpRTxM+a4BKQAeA2w==
X-Received: by 2002:a0c:b5c5:: with SMTP id o5mr54462903qvf.6.1561309698003;
        Sun, 23 Jun 2019 10:08:18 -0700 (PDT)
Received: from localhost.localdomain (ppp91-79-162-197.pppoe.mtu-net.ru. [91.79.162.197])
        by smtp.gmail.com with ESMTPSA id o54sm5790756qtb.63.2019.06.23.10.08.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 23 Jun 2019 10:08:17 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] staging: media: tegra-vde: Add IOMMU support
Date:   Sun, 23 Jun 2019 20:07:29 +0300
Message-Id: <20190623170730.5095-7-digetx@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190623170730.5095-1-digetx@gmail.com>
References: <20190623170730.5095-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

All Tegra's could provide memory isolation for the video decoder
hardware using IOMMU, it is also required for Tegra30+ in order
to handle sparse dmabuf's which GPU exports in a default kernel
configuration.

Inspired-by: Thierry Reding <thierry.reding@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/staging/media/tegra-vde/Kconfig       |   1 +
 drivers/staging/media/tegra-vde/Makefile      |   1 +
 drivers/staging/media/tegra-vde/iommu.c       | 159 +++++++++++++++
 drivers/staging/media/tegra-vde/trace.h       |   2 +
 .../media/tegra-vde/{tegra-vde.c => vde.c}    | 188 +++++++++---------
 drivers/staging/media/tegra-vde/vde.h         |  91 +++++++++
 6 files changed, 349 insertions(+), 93 deletions(-)
 create mode 100644 drivers/staging/media/tegra-vde/iommu.c
 rename drivers/staging/media/tegra-vde/{tegra-vde.c => vde.c} (91%)
 create mode 100644 drivers/staging/media/tegra-vde/vde.h

diff --git a/drivers/staging/media/tegra-vde/Kconfig b/drivers/staging/media/tegra-vde/Kconfig
index ff8e846cd15d..2e7f644ae591 100644
--- a/drivers/staging/media/tegra-vde/Kconfig
+++ b/drivers/staging/media/tegra-vde/Kconfig
@@ -3,6 +3,7 @@ config TEGRA_VDE
 	tristate "NVIDIA Tegra Video Decoder Engine driver"
 	depends on ARCH_TEGRA || COMPILE_TEST
 	select DMA_SHARED_BUFFER
+	select IOMMU_IOVA if IOMMU_SUPPORT
 	select SRAM
 	help
 	    Say Y here to enable support for the NVIDIA Tegra video decoder
diff --git a/drivers/staging/media/tegra-vde/Makefile b/drivers/staging/media/tegra-vde/Makefile
index 7f9020e634f3..c11867e28233 100644
--- a/drivers/staging/media/tegra-vde/Makefile
+++ b/drivers/staging/media/tegra-vde/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
+tegra-vde-y := vde.o iommu.o
 obj-$(CONFIG_TEGRA_VDE)	+= tegra-vde.o
diff --git a/drivers/staging/media/tegra-vde/iommu.c b/drivers/staging/media/tegra-vde/iommu.c
new file mode 100644
index 000000000000..f42f5c80c6c1
--- /dev/null
+++ b/drivers/staging/media/tegra-vde/iommu.c
@@ -0,0 +1,159 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * NVIDIA Tegra Video decoder driver
+ *
+ * Copyright (C) 2016-2019 GRATE-DRIVER project
+ */
+
+#include <linux/iommu.h>
+#include <linux/iova.h>
+#include <linux/kernel.h>
+#include <linux/platform_device.h>
+
+#if IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)
+#include <asm/dma-iommu.h>
+#endif
+
+#include "vde.h"
+
+int tegra_vde_iommu_map(struct tegra_vde *vde,
+			struct sg_table *sgt,
+			struct iova **iovap,
+			dma_addr_t *addrp,
+			size_t size)
+{
+	struct iova *iova;
+	unsigned long shift;
+	unsigned long end;
+	dma_addr_t addr;
+
+	end = vde->domain->geometry.aperture_end;
+	size = iova_align(&vde->iova, size);
+	shift = iova_shift(&vde->iova);
+
+	iova = alloc_iova(&vde->iova, size >> shift, end >> shift, true);
+	if (!iova)
+		return -ENOMEM;
+
+	addr = iova_dma_addr(&vde->iova, iova);
+
+	size = iommu_map_sg(vde->domain, addr, sgt->sgl, sgt->nents,
+			    IOMMU_READ | IOMMU_WRITE);
+	if (!size) {
+		__free_iova(&vde->iova, iova);
+		return -ENXIO;
+	}
+
+	*iovap = iova;
+	*addrp = addr;
+
+	return 0;
+}
+
+void tegra_vde_iommu_unmap(struct tegra_vde *vde, struct iova *iova)
+{
+	unsigned long shift = iova_shift(&vde->iova);
+	unsigned long size = iova_size(iova) << shift;
+	dma_addr_t addr = iova_dma_addr(&vde->iova, iova);
+
+	iommu_unmap(vde->domain, addr, size);
+	__free_iova(&vde->iova, iova);
+}
+
+int tegra_vde_iommu_init(struct tegra_vde *vde)
+{
+	struct device *dev = vde->miscdev.parent;
+	struct iova *iova;
+	unsigned long order;
+	unsigned long shift;
+	int err;
+
+	vde->group = iommu_group_get(dev);
+	if (!vde->group)
+		return 0;
+
+#if IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)
+	if (dev->archdata.mapping) {
+		struct dma_iommu_mapping *mapping = to_dma_iommu_mapping(dev);
+
+		arm_iommu_detach_device(dev);
+		arm_iommu_release_mapping(mapping);
+	}
+#endif
+	vde->domain = iommu_domain_alloc(&platform_bus_type);
+	if (!vde->domain) {
+		err = -ENOMEM;
+		goto put_group;
+	}
+
+	err = iova_cache_get();
+	if (err)
+		goto free_domain;
+
+	order = __ffs(vde->domain->pgsize_bitmap);
+	init_iova_domain(&vde->iova, 1UL << order, 0);
+
+	err = iommu_attach_group(vde->domain, vde->group);
+	if (err)
+		goto put_iova;
+
+	/*
+	 * We're using some static addresses that are not accessible by VDE
+	 * to trap invalid memory accesses.
+	 */
+	shift = iova_shift(&vde->iova);
+	iova = reserve_iova(&vde->iova, 0x60000000 >> shift,
+			    0x70000000 >> shift);
+	if (!iova) {
+		err = -ENOMEM;
+		goto detach_group;
+	}
+
+	vde->iova_resv_static_addresses = iova;
+
+	/*
+	 * BSEV's end-address wraps around due to integer overflow during
+	 * of hardware context preparation if IOVA is allocated at the end
+	 * of address space and VDE can't handle that. Hence simply reserve
+	 * the last page to avoid the problem.
+	 */
+	iova = reserve_iova(&vde->iova, 0xffffffff >> shift,
+			    (0xffffffff >> shift) + 1);
+	if (!iova) {
+		err = -ENOMEM;
+		goto unreserve_iova;
+	}
+
+	vde->iova_resv_last_page = iova;
+
+	return 0;
+
+unreserve_iova:
+	__free_iova(&vde->iova, vde->iova_resv_static_addresses);
+detach_group:
+	iommu_detach_group(vde->domain, vde->group);
+put_iova:
+	put_iova_domain(&vde->iova);
+	iova_cache_put();
+free_domain:
+	iommu_domain_free(vde->domain);
+put_group:
+	iommu_group_put(vde->group);
+
+	return err;
+}
+
+void tegra_vde_iommu_deinit(struct tegra_vde *vde)
+{
+	if (vde->domain) {
+		__free_iova(&vde->iova, vde->iova_resv_last_page);
+		__free_iova(&vde->iova, vde->iova_resv_static_addresses);
+		iommu_detach_group(vde->domain, vde->group);
+		put_iova_domain(&vde->iova);
+		iova_cache_put();
+		iommu_domain_free(vde->domain);
+		iommu_group_put(vde->group);
+
+		vde->domain = NULL;
+	}
+}
diff --git a/drivers/staging/media/tegra-vde/trace.h b/drivers/staging/media/tegra-vde/trace.h
index 85e2f7e2d4d0..e5714107db58 100644
--- a/drivers/staging/media/tegra-vde/trace.h
+++ b/drivers/staging/media/tegra-vde/trace.h
@@ -8,6 +8,8 @@
 
 #include <linux/tracepoint.h>
 
+#include "vde.h"
+
 DECLARE_EVENT_CLASS(register_access,
 	TP_PROTO(struct tegra_vde *vde, void __iomem *base,
 		 u32 offset, u32 value),
diff --git a/drivers/staging/media/tegra-vde/tegra-vde.c b/drivers/staging/media/tegra-vde/vde.c
similarity index 91%
rename from drivers/staging/media/tegra-vde/tegra-vde.c
rename to drivers/staging/media/tegra-vde/vde.c
index cc4244da2705..cbcdbfef072d 100644
--- a/drivers/staging/media/tegra-vde/tegra-vde.c
+++ b/drivers/staging/media/tegra-vde/vde.c
@@ -22,6 +22,10 @@
 #include <soc/tegra/pmc.h>
 
 #include "uapi.h"
+#include "vde.h"
+
+#define CREATE_TRACE_POINTS
+#include "trace.h"
 
 #define ICMDQUE_WR		0x00
 #define CMDQUE_CONTROL		0x08
@@ -33,6 +37,10 @@
 #define BSE_DMA_BUSY		BIT(23)
 
 struct video_frame {
+	struct iova *y_iova;
+	struct iova *cb_iova;
+	struct iova *cr_iova;
+	struct iova *aux_iova;
 	struct dma_buf_attachment *y_dmabuf_attachment;
 	struct dma_buf_attachment *cb_dmabuf_attachment;
 	struct dma_buf_attachment *cr_dmabuf_attachment;
@@ -49,63 +57,6 @@ struct video_frame {
 	u32 flags;
 };
 
-struct tegra_vde {
-	void __iomem *sxe;
-	void __iomem *bsev;
-	void __iomem *mbe;
-	void __iomem *ppe;
-	void __iomem *mce;
-	void __iomem *tfe;
-	void __iomem *ppb;
-	void __iomem *vdma;
-	void __iomem *frameid;
-	struct mutex lock;
-	struct miscdevice miscdev;
-	struct reset_control *rst;
-	struct reset_control *rst_mc;
-	struct gen_pool *iram_pool;
-	struct completion decode_completion;
-	struct clk *clk;
-	dma_addr_t iram_lists_addr;
-	u32 *iram;
-};
-
-static __maybe_unused char const *
-tegra_vde_reg_base_name(struct tegra_vde *vde, void __iomem *base)
-{
-	if (vde->sxe == base)
-		return "SXE";
-
-	if (vde->bsev == base)
-		return "BSEV";
-
-	if (vde->mbe == base)
-		return "MBE";
-
-	if (vde->ppe == base)
-		return "PPE";
-
-	if (vde->mce == base)
-		return "MCE";
-
-	if (vde->tfe == base)
-		return "TFE";
-
-	if (vde->ppb == base)
-		return "PPB";
-
-	if (vde->vdma == base)
-		return "VDMA";
-
-	if (vde->frameid == base)
-		return "FRAMEID";
-
-	return "???";
-}
-
-#define CREATE_TRACE_POINTS
-#include "trace.h"
-
 static void tegra_vde_writel(struct tegra_vde *vde,
 			     u32 value, void __iomem *base, u32 offset)
 {
@@ -543,28 +494,35 @@ static void tegra_vde_decode_frame(struct tegra_vde *vde,
 			 vde->sxe, 0x00);
 }
 
-static void tegra_vde_detach_and_put_dmabuf(struct dma_buf_attachment *a,
+static void tegra_vde_detach_and_put_dmabuf(struct tegra_vde *vde,
+					    enum dma_data_direction dma_dir,
+					    struct dma_buf_attachment *a,
 					    struct sg_table *sgt,
-					    enum dma_data_direction dma_dir)
+					    struct iova *iova)
 {
 	struct dma_buf *dmabuf = a->dmabuf;
 
+	if (vde->domain)
+		tegra_vde_iommu_unmap(vde, iova);
+
 	dma_buf_unmap_attachment(a, sgt, dma_dir);
 	dma_buf_detach(dmabuf, a);
 	dma_buf_put(dmabuf);
 }
 
-static int tegra_vde_attach_dmabuf(struct device *dev,
+static int tegra_vde_attach_dmabuf(struct tegra_vde *vde,
 				   int fd,
 				   unsigned long offset,
 				   size_t min_size,
 				   size_t align_size,
 				   struct dma_buf_attachment **a,
-				   dma_addr_t *addr,
+				   dma_addr_t *addrp,
 				   struct sg_table **s,
+				   struct iova **iovap,
 				   size_t *size,
 				   enum dma_data_direction dma_dir)
 {
+	struct device *dev = vde->miscdev.parent;
 	struct dma_buf_attachment *attachment;
 	struct dma_buf *dmabuf;
 	struct sg_table *sgt;
@@ -602,13 +560,23 @@ static int tegra_vde_attach_dmabuf(struct device *dev,
 		goto err_detach;
 	}
 
-	if (sgt->nents != 1) {
-		dev_err(dev, "Sparse DMA region is unsupported\n");
+	if (!vde->domain && sgt->nents > 1) {
+		dev_err(dev, "Sparse DMA region is unsupported, please enable IOMMU\n");
 		err = -EINVAL;
 		goto err_unmap;
 	}
 
-	*addr = sg_dma_address(sgt->sgl) + offset;
+	if (vde->domain) {
+		err = tegra_vde_iommu_map(vde, sgt, iovap, addrp, dmabuf->size);
+		if (err) {
+			dev_err(dev, "IOMMU mapping failed: %d\n", err);
+			goto err_unmap;
+		}
+	} else {
+		*addrp = sg_dma_address(sgt->sgl);
+	}
+
+	*addrp = *addrp + offset;
 	*a = attachment;
 	*s = sgt;
 
@@ -627,7 +595,7 @@ static int tegra_vde_attach_dmabuf(struct device *dev,
 	return err;
 }
 
-static int tegra_vde_attach_dmabufs_to_frame(struct device *dev,
+static int tegra_vde_attach_dmabufs_to_frame(struct tegra_vde *vde,
 					     struct video_frame *frame,
 					     struct tegra_vde_h264_frame *src,
 					     enum dma_data_direction dma_dir,
@@ -636,29 +604,32 @@ static int tegra_vde_attach_dmabufs_to_frame(struct device *dev,
 {
 	int err;
 
-	err = tegra_vde_attach_dmabuf(dev, src->y_fd,
+	err = tegra_vde_attach_dmabuf(vde, src->y_fd,
 				      src->y_offset, lsize, SZ_256,
 				      &frame->y_dmabuf_attachment,
 				      &frame->y_addr,
 				      &frame->y_sgt,
+				      &frame->y_iova,
 				      NULL, dma_dir);
 	if (err)
 		return err;
 
-	err = tegra_vde_attach_dmabuf(dev, src->cb_fd,
+	err = tegra_vde_attach_dmabuf(vde, src->cb_fd,
 				      src->cb_offset, csize, SZ_256,
 				      &frame->cb_dmabuf_attachment,
 				      &frame->cb_addr,
 				      &frame->cb_sgt,
+				      &frame->cb_iova,
 				      NULL, dma_dir);
 	if (err)
 		goto err_release_y;
 
-	err = tegra_vde_attach_dmabuf(dev, src->cr_fd,
+	err = tegra_vde_attach_dmabuf(vde, src->cr_fd,
 				      src->cr_offset, csize, SZ_256,
 				      &frame->cr_dmabuf_attachment,
 				      &frame->cr_addr,
 				      &frame->cr_sgt,
+				      &frame->cr_iova,
 				      NULL, dma_dir);
 	if (err)
 		goto err_release_cb;
@@ -668,11 +639,12 @@ static int tegra_vde_attach_dmabufs_to_frame(struct device *dev,
 		return 0;
 	}
 
-	err = tegra_vde_attach_dmabuf(dev, src->aux_fd,
+	err = tegra_vde_attach_dmabuf(vde, src->aux_fd,
 				      src->aux_offset, csize, SZ_256,
 				      &frame->aux_dmabuf_attachment,
 				      &frame->aux_addr,
 				      &frame->aux_sgt,
+				      &frame->aux_iova,
 				      NULL, dma_dir);
 	if (err)
 		goto err_release_cr;
@@ -680,34 +652,49 @@ static int tegra_vde_attach_dmabufs_to_frame(struct device *dev,
 	return 0;
 
 err_release_cr:
-	tegra_vde_detach_and_put_dmabuf(frame->cr_dmabuf_attachment,
-					frame->cr_sgt, dma_dir);
+	tegra_vde_detach_and_put_dmabuf(vde, dma_dir,
+					frame->cr_dmabuf_attachment,
+					frame->cr_sgt,
+					frame->cr_iova);
 err_release_cb:
-	tegra_vde_detach_and_put_dmabuf(frame->cb_dmabuf_attachment,
-					frame->cb_sgt, dma_dir);
+	tegra_vde_detach_and_put_dmabuf(vde, dma_dir,
+					frame->cb_dmabuf_attachment,
+					frame->cb_sgt,
+					frame->cb_iova);
 err_release_y:
-	tegra_vde_detach_and_put_dmabuf(frame->y_dmabuf_attachment,
-					frame->y_sgt, dma_dir);
+	tegra_vde_detach_and_put_dmabuf(vde, dma_dir,
+					frame->y_dmabuf_attachment,
+					frame->y_sgt,
+					frame->y_iova);
 
 	return err;
 }
 
-static void tegra_vde_release_frame_dmabufs(struct video_frame *frame,
+static void tegra_vde_release_frame_dmabufs(struct tegra_vde *vde,
+					    struct video_frame *frame,
 					    enum dma_data_direction dma_dir,
 					    bool baseline_profile)
 {
 	if (!baseline_profile)
-		tegra_vde_detach_and_put_dmabuf(frame->aux_dmabuf_attachment,
-						frame->aux_sgt, dma_dir);
-
-	tegra_vde_detach_and_put_dmabuf(frame->cr_dmabuf_attachment,
-					frame->cr_sgt, dma_dir);
-
-	tegra_vde_detach_and_put_dmabuf(frame->cb_dmabuf_attachment,
-					frame->cb_sgt, dma_dir);
-
-	tegra_vde_detach_and_put_dmabuf(frame->y_dmabuf_attachment,
-					frame->y_sgt, dma_dir);
+		tegra_vde_detach_and_put_dmabuf(vde, dma_dir,
+						frame->aux_dmabuf_attachment,
+						frame->aux_sgt,
+						frame->aux_iova);
+
+	tegra_vde_detach_and_put_dmabuf(vde, dma_dir,
+					frame->cr_dmabuf_attachment,
+					frame->cr_sgt,
+					frame->cr_iova);
+
+	tegra_vde_detach_and_put_dmabuf(vde, dma_dir,
+					frame->cb_dmabuf_attachment,
+					frame->cb_sgt,
+					frame->cb_iova);
+
+	tegra_vde_detach_and_put_dmabuf(vde, dma_dir,
+					frame->y_dmabuf_attachment,
+					frame->y_sgt,
+					frame->y_iova);
 }
 
 static int tegra_vde_validate_frame(struct device *dev,
@@ -800,6 +787,7 @@ static int tegra_vde_ioctl_decode_h264(struct tegra_vde *vde,
 	struct video_frame *dpb_frames;
 	struct dma_buf_attachment *bitstream_data_dmabuf_attachment;
 	struct sg_table *bitstream_sgt;
+	struct iova *bitstream_iova;
 	enum dma_data_direction dma_dir;
 	dma_addr_t bitstream_data_addr;
 	dma_addr_t bsev_ptr;
@@ -819,12 +807,13 @@ static int tegra_vde_ioctl_decode_h264(struct tegra_vde *vde,
 	if (ret)
 		return ret;
 
-	ret = tegra_vde_attach_dmabuf(dev, ctx.bitstream_data_fd,
+	ret = tegra_vde_attach_dmabuf(vde, ctx.bitstream_data_fd,
 				      ctx.bitstream_data_offset,
 				      SZ_16K, SZ_16K,
 				      &bitstream_data_dmabuf_attachment,
 				      &bitstream_data_addr,
 				      &bitstream_sgt,
+				      &bitstream_iova,
 				      &bitstream_data_size,
 				      DMA_TO_DEVICE);
 	if (ret)
@@ -866,7 +855,7 @@ static int tegra_vde_ioctl_decode_h264(struct tegra_vde *vde,
 
 		dma_dir = (i == 0) ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
 
-		ret = tegra_vde_attach_dmabufs_to_frame(dev, &dpb_frames[i],
+		ret = tegra_vde_attach_dmabufs_to_frame(vde, &dpb_frames[i],
 							&frames[i], dma_dir,
 							ctx.baseline_profile,
 							lsize, csize);
@@ -954,7 +943,7 @@ static int tegra_vde_ioctl_decode_h264(struct tegra_vde *vde,
 	while (i--) {
 		dma_dir = (i == 0) ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
 
-		tegra_vde_release_frame_dmabufs(&dpb_frames[i], dma_dir,
+		tegra_vde_release_frame_dmabufs(vde, &dpb_frames[i], dma_dir,
 						ctx.baseline_profile);
 	}
 
@@ -965,8 +954,10 @@ static int tegra_vde_ioctl_decode_h264(struct tegra_vde *vde,
 	kfree(frames);
 
 release_bitstream_dmabuf:
-	tegra_vde_detach_and_put_dmabuf(bitstream_data_dmabuf_attachment,
-					bitstream_sgt, DMA_TO_DEVICE);
+	tegra_vde_detach_and_put_dmabuf(vde, DMA_TO_DEVICE,
+					bitstream_data_dmabuf_attachment,
+					bitstream_sgt,
+					bitstream_iova);
 
 	return ret;
 }
@@ -1176,10 +1167,16 @@ static int tegra_vde_probe(struct platform_device *pdev)
 	vde->miscdev.fops = &tegra_vde_fops;
 	vde->miscdev.parent = dev;
 
+	err = tegra_vde_iommu_init(vde);
+	if (err) {
+		dev_err(dev, "Failed to initialize IOMMU: %d\n", err);
+		goto err_gen_free;
+	}
+
 	err = misc_register(&vde->miscdev);
 	if (err) {
 		dev_err(dev, "Failed to register misc device: %d\n", err);
-		goto err_gen_free;
+		goto err_deinit_iommu;
 	}
 
 	pm_runtime_enable(dev);
@@ -1197,6 +1194,9 @@ static int tegra_vde_probe(struct platform_device *pdev)
 err_misc_unreg:
 	misc_deregister(&vde->miscdev);
 
+err_deinit_iommu:
+	tegra_vde_iommu_deinit(vde);
+
 err_gen_free:
 	gen_pool_free(vde->iram_pool, (unsigned long)vde->iram,
 		      gen_pool_size(vde->iram_pool));
@@ -1221,6 +1221,8 @@ static int tegra_vde_remove(struct platform_device *pdev)
 
 	misc_deregister(&vde->miscdev);
 
+	tegra_vde_iommu_deinit(vde);
+
 	gen_pool_free(vde->iram_pool, (unsigned long)vde->iram,
 		      gen_pool_size(vde->iram_pool));
 
diff --git a/drivers/staging/media/tegra-vde/vde.h b/drivers/staging/media/tegra-vde/vde.h
new file mode 100644
index 000000000000..a4ac466cf9e2
--- /dev/null
+++ b/drivers/staging/media/tegra-vde/vde.h
@@ -0,0 +1,91 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * NVIDIA Tegra Video decoder driver
+ *
+ * Copyright (C) 2016-2019 GRATE-DRIVER project
+ */
+
+#ifndef TEGRA_VDE_H
+#define TEGRA_VDE_H
+
+#include <linux/completion.h>
+#include <linux/miscdevice.h>
+#include <linux/mutex.h>
+#include <linux/types.h>
+#include <linux/iova.h>
+
+struct clk;
+struct gen_pool;
+struct iommu_group;
+struct iommu_domain;
+struct reset_control;
+
+struct tegra_vde {
+	void __iomem *sxe;
+	void __iomem *bsev;
+	void __iomem *mbe;
+	void __iomem *ppe;
+	void __iomem *mce;
+	void __iomem *tfe;
+	void __iomem *ppb;
+	void __iomem *vdma;
+	void __iomem *frameid;
+	struct mutex lock;
+	struct miscdevice miscdev;
+	struct reset_control *rst;
+	struct reset_control *rst_mc;
+	struct gen_pool *iram_pool;
+	struct completion decode_completion;
+	struct clk *clk;
+	struct iommu_domain *domain;
+	struct iommu_group *group;
+	struct iova_domain iova;
+	struct iova *iova_resv_static_addresses;
+	struct iova *iova_resv_last_page;
+	dma_addr_t iram_lists_addr;
+	u32 *iram;
+};
+
+int tegra_vde_iommu_init(struct tegra_vde *vde);
+void tegra_vde_iommu_deinit(struct tegra_vde *vde);
+int tegra_vde_iommu_map(struct tegra_vde *vde,
+			struct sg_table *sgt,
+			struct iova **iovap,
+			dma_addr_t *addrp,
+			size_t size);
+void tegra_vde_iommu_unmap(struct tegra_vde *vde, struct iova *iova);
+
+static __maybe_unused char const *
+tegra_vde_reg_base_name(struct tegra_vde *vde, void __iomem *base)
+{
+	if (vde->sxe == base)
+		return "SXE";
+
+	if (vde->bsev == base)
+		return "BSEV";
+
+	if (vde->mbe == base)
+		return "MBE";
+
+	if (vde->ppe == base)
+		return "PPE";
+
+	if (vde->mce == base)
+		return "MCE";
+
+	if (vde->tfe == base)
+		return "TFE";
+
+	if (vde->ppb == base)
+		return "PPB";
+
+	if (vde->vdma == base)
+		return "VDMA";
+
+	if (vde->frameid == base)
+		return "FRAMEID";
+
+	return "???";
+}
+
+#endif /* TEGRA_VDE_H */
-- 
2.22.0

