Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EF392B7816
	for <lists+linux-media@lfdr.de>; Wed, 18 Nov 2020 09:08:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727294AbgKRIHE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Nov 2020 03:07:04 -0500
Received: from mail-bn8nam11on2081.outbound.protection.outlook.com ([40.107.236.81]:13546
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727266AbgKRIHE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Nov 2020 03:07:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EVsEgGaEYU9nQguZeqjn3lx6ypOnf/JbR7I6fLCh19bohyjdFW2gna0RFyJAy3yvJpbk24QNAFUEyeogDsqp5q7Sn780D9erqkeTFjyauGUg1DSs4tYRceNlLaJmV7ZBFxOPkTXwMQGmEDYrcdTNA4gCVQc45nPO3ZZx9X6Hoox2bbcbW2fg4xBKeSfmwHjmcBkKJJpueZQXD3OKRiBEDrH5d+nFyaq2bp4J0VTNGXtVVC9DquIuvHseQ+O1JtjJVYiKyoig07cDZEh33iWfyc60I6nL/69ZIG1SNvaQ4H9Jy/d1GFmHUK0hM0aGUbFJp9C2r7L0IG1oneUsPORpOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U+FUXjcOxngFEfP4VMposQ15PthSjXjRPuA6RQUijAo=;
 b=dDsPR8j+27i+hfkJcUIX4RBd55eEjlyDjcT4K6cJckOO2UvYgirQ1W1i7X9PAojuCfPoYcdL/fYVb6XRsv59jSY+MtEycObkvX5MqQFjsUnX+o/zE23VHUJpFlsbMWxY7pvGrWDD5PER8qky+CveGoKYYhO7pdy7fZVchYKgu1GfwC/FeOHWxIo6v/9aQziCNKjKJGnytXfiOHyIeQ0oe6la1XevklI/SXWJTffKDtRKqc/P1huDC54PgSwT1nZ/lgwaJRkEr6j2JxU3dRJrbwAqjhJvqFZB/LHRS5CCclB9MUp1IAjD5PSUVxd+LUGF0ndUm27NKAMpZLT81WO+9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U+FUXjcOxngFEfP4VMposQ15PthSjXjRPuA6RQUijAo=;
 b=CHWUkB7HQJX+o23A+v4NbpjEC9c9jDzjGP1imAv9o7mXoajVH4W2n4gzuVER88eLZyZDZ++OTmjZbkoSZtaj1vdQR2+GsM4zor2S0f2BHPATHSomvXPzUwrmX0RiU+vHPIydnxDHmNvKPUkClYxuABpvg+e5PFEa/N5zfZuTOwE=
Received: from SA0PR11CA0100.namprd11.prod.outlook.com (2603:10b6:806:d1::15)
 by SN4PR0201MB3472.namprd02.prod.outlook.com (2603:10b6:803:48::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Wed, 18 Nov
 2020 08:06:56 +0000
Received: from SN1NAM02FT048.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:d1:cafe::c9) by SA0PR11CA0100.outlook.office365.com
 (2603:10b6:806:d1::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Wed, 18 Nov 2020 08:06:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT048.mail.protection.outlook.com (10.152.72.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3564.22 via Frontend Transport; Wed, 18 Nov 2020 08:06:55 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 18 Nov 2020 00:06:33 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Wed, 18 Nov 2020 00:06:33 -0800
Envelope-to: michal.simek@xilinx.com,
 derek.kiernan@xilinx.com,
 dragan.cvetic@xilinx.com,
 rajan.vaja@xilinx.com,
 tejas.patel@xilinx.com,
 manish.narani@xilinx.com,
 ravi.patel@xilinx.com,
 wendy.liang@xilinx.com,
 robh+dt@kernel.org,
 arnd@arndb.de,
 gregkh@linuxfoundation.org,
 sumit.semwal@linaro.org,
 christian.koenig@amd.com,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Received: from [172.19.2.167] (port=35936 helo=xsjjliang50.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <wendy.liang@xilinx.com>)
        id 1kfIU5-0000Nk-Ls; Wed, 18 Nov 2020 00:06:33 -0800
From:   Wendy Liang <wendy.liang@xilinx.com>
To:     <robh+dt@kernel.org>, <michal.simek@xilinx.com>, <arnd@arndb.de>,
        <gregkh@linuxfoundation.org>, <sumit.semwal@linaro.org>,
        <christian.koenig@amd.com>, <derek.kiernan@xilinx.com>,
        <dragan.cvetic@xilinx.com>, <rajan.vaja@xilinx.com>,
        <tejas.patel@xilinx.com>, <manish.narani@xilinx.com>,
        <ravi.patel@xilinx.com>
CC:     <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>,
        "Wendy Liang" <wendy.liang@xilinx.com>
Subject: [PATCH 4/9] misc: xilinx-ai-engine: expose AI engine tile memories to userspace
Date:   Wed, 18 Nov 2020 00:06:15 -0800
Message-ID: <1605686780-17886-5-git-send-email-wendy.liang@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605686780-17886-1-git-send-email-wendy.liang@xilinx.com>
References: <1605686780-17886-1-git-send-email-wendy.liang@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 83f61d42-2dea-4c1a-d9b1-08d88b98ea95
X-MS-TrafficTypeDiagnostic: SN4PR0201MB3472:
X-Microsoft-Antispam-PRVS: <SN4PR0201MB347297142DAC2C42AFF416F0B0E10@SN4PR0201MB3472.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6vwQo9AqqLsl0fwaVjaU4oMzXoNyGBQTZ/c68A9yRI61lKusmkEkdMO4OASq2bIqGcWLyRgG2wDde4D8cIu0TvcBf7pTzzMs6kYKx5D+iL03ENg1426TpVNjRVNE37BQOHsMNcDuKKGPVI/OJLO0VtyUvDAuROU7EC+eAMVyQbR/TlHjIuEjcXJPjSqR2r0GOBCTxx2+15oErt7c7Y2VuONZxSDXvpHj7L2kutgof9MDqCeZ9v3GjJK6E8qXhTm63RZnK2Pi5gam6ZBQRlLzJ0vQxAJNvM+j8Sn2/H0OKdmh1bX+x9ivbCjl7Ovv6MyYT3jPoHMsfxmLDTj4WQJD1NwxwYj36Ho1wUvlziMhQlTZLGN+CrJpBxVTuu3ZU9JhNevRw7QEgjtbBhRktEseEjpSa7l+x3YZzWpcsGuzidkBIO3z2XmLwmQwcFuIfcRwuvIVLkB52DgdXO8T92unnnL9a9vkPHcPqJXMWp2fPQ8=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(376002)(396003)(39850400004)(346002)(136003)(46966005)(110136005)(6636002)(316002)(82740400003)(54906003)(36756003)(7696005)(2616005)(82310400003)(426003)(2906002)(336012)(8676002)(36906005)(47076004)(26005)(8936002)(7636003)(9786002)(356005)(107886003)(186003)(6666004)(4326008)(921005)(70206006)(44832011)(7416002)(478600001)(70586007)(83380400001)(30864003)(5660300002)(102446001)(461764006);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 08:06:55.9094
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83f61d42-2dea-4c1a-d9b1-08d88b98ea95
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT048.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0201MB3472
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is no concern to have userspace to directly access AI engine
program and data memories. It will be much faster to directly copy
data to and from these memories from userspace.

We choose to use DMA buf for the data and program memory because of the
DMA buf features. DMA buf can share the DMA memory between applications
and different devices, which can benefit on how to share data with AI
engine device in future.

There is one DMA buf per type of memory in an AI engine partition. e.g.
There is one DMA buf for all the tile core program memories in an AI
engine partition. There is another DMA buf for all the tile data
memories in an AI engine partition.

Signed-off-by: Wendy Liang <wendy.liang@xilinx.com>
Reviewed-by: Hyun Kwon <hyun.kwon@xilinx.com>
---
 drivers/misc/xilinx-ai-engine/Makefile             |   1 +
 drivers/misc/xilinx-ai-engine/ai-engine-aie.c      |  36 +++
 drivers/misc/xilinx-ai-engine/ai-engine-internal.h |  30 +++
 drivers/misc/xilinx-ai-engine/ai-engine-mem.c      | 274 +++++++++++++++++++++
 drivers/misc/xilinx-ai-engine/ai-engine-part.c     |  47 ++++
 drivers/misc/xilinx-ai-engine/ai-engine-reset.c    |  38 +++
 include/uapi/linux/xlnx-ai-engine.h                |  49 ++++
 7 files changed, 475 insertions(+)
 create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-mem.c

diff --git a/drivers/misc/xilinx-ai-engine/Makefile b/drivers/misc/xilinx-ai-engine/Makefile
index 39bec61..2dbed42 100644
--- a/drivers/misc/xilinx-ai-engine/Makefile
+++ b/drivers/misc/xilinx-ai-engine/Makefile
@@ -7,6 +7,7 @@ obj-$(CONFIG_XILINX_AIE)	+= xilinx-aie.o
 
 xilinx-aie-$(CONFIG_XILINX_AIE) := ai-engine-aie.o \
 				   ai-engine-dev.o \
+				   ai-engine-mem.o \
 				   ai-engine-part.o \
 				   ai-engine-res.o \
 				   ai-engine-reset.o
diff --git a/drivers/misc/xilinx-ai-engine/ai-engine-aie.c b/drivers/misc/xilinx-ai-engine/ai-engine-aie.c
index 36127f0..7fce2f00 100644
--- a/drivers/misc/xilinx-ai-engine/ai-engine-aie.c
+++ b/drivers/misc/xilinx-ai-engine/ai-engine-aie.c
@@ -12,10 +12,14 @@
 
 #include "ai-engine-internal.h"
 
+#define KBYTES(n)	((n) * 1024)
+
 #define AIE_ARRAY_SHIFT		30U
 #define AIE_COL_SHIFT		23U
 #define AIE_ROW_SHIFT		18U
 
+#define NUM_MEMS_PER_TILE	2U
+
 /*
  * Registers offsets
  */
@@ -114,6 +118,37 @@ static u32 aie_get_tile_type(struct aie_location *loc)
 	return AIE_TILE_TYPE_SHIMNOC;
 }
 
+static unsigned int aie_get_mem_info(struct aie_range *range,
+				     struct aie_part_mem *pmem)
+{
+	unsigned int i;
+
+	if (range->start.row + range->size.row <= 1) {
+		/* SHIM row only, no memories in this range */
+		return 0;
+	}
+	if (!pmem)
+		return NUM_MEMS_PER_TILE;
+
+	for (i = 0; i < NUM_MEMS_PER_TILE; i++) {
+		struct aie_mem *mem = &pmem[i].mem;
+
+		memcpy(&mem->range, range, sizeof(*range));
+		if (!mem->range.start.row) {
+			mem->range.start.row = 1;
+			mem->range.size.row--;
+		}
+	}
+	/* Setup tile data memory information */
+	pmem[0].mem.offset = 0;
+	pmem[0].mem.size = KBYTES(32);
+	/* Setup program memory information */
+	pmem[1].mem.offset = 0x20000;
+	pmem[1].mem.size = KBYTES(16);
+
+	return NUM_MEMS_PER_TILE;
+}
+
 /**
  * aie_set_shim_reset() - Set AI engine SHIM reset
  * @adev: AI engine device
@@ -170,6 +205,7 @@ static int aie_reset_shim(struct aie_device *adev, struct aie_range *range)
 
 static const struct aie_tile_operations aie_ops = {
 	.get_tile_type = aie_get_tile_type,
+	.get_mem_info = aie_get_mem_info,
 	.reset_shim = aie_reset_shim,
 };
 
diff --git a/drivers/misc/xilinx-ai-engine/ai-engine-internal.h b/drivers/misc/xilinx-ai-engine/ai-engine-internal.h
index 2acd34f..e84610b 100644
--- a/drivers/misc/xilinx-ai-engine/ai-engine-internal.h
+++ b/drivers/misc/xilinx-ai-engine/ai-engine-internal.h
@@ -12,6 +12,8 @@
 #include <linux/bits.h>
 #include <linux/cdev.h>
 #include <linux/device.h>
+#include <linux/dma-buf.h>
+#include <linux/file.h>
 #include <linux/io.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
@@ -67,8 +69,30 @@ struct aie_device;
 struct aie_partition;
 
 /**
+ * struct aie_part_mem - AI engine partition memory information structure
+ * @apart: AI engine partition
+ * @dbuf: dmabuf pointer associated with the memory
+ * @mem: memory information of a type of memory
+ * @size: size of the total memories in the partition
+ *
+ * This structure is to keep the information of a type of memory in a
+ * partition. The memory information will be stored in @mem property.
+ * The following information will be keep:
+ *  * memory start address offset within a tile
+ *  * memory size
+ *  * what tiles contain this type of memory
+ */
+struct aie_part_mem {
+	struct aie_partition *apart;
+	struct dma_buf *dbuf;
+	struct aie_mem mem;
+	size_t size;
+};
+
+/**
  * struct aie_tile_operations - AI engine device operations
  * @get_tile_type: get type of tile based on tile operation
+ * @get_mem_info: get different types of memories information
  * @reset_shim: reset shim, it will assert and then release SHIM reset
  *
  * Different AI engine device version has its own device
@@ -76,6 +100,8 @@ struct aie_partition;
  */
 struct aie_tile_operations {
 	u32 (*get_tile_type)(struct aie_location *loc);
+	unsigned int (*get_mem_info)(struct aie_range *range,
+				     struct aie_part_mem *pmem);
 	int (*reset_shim)(struct aie_device *adev, struct aie_range *range);
 };
 
@@ -134,6 +160,7 @@ struct aie_device {
  * struct aie_partition - AI engine partition structure
  * @node: list node
  * @adev: pointer to AI device instance
+ * @pmems: pointer to partition memories types
  * @range: range of partition
  * @mlock: protection for AI engine partition operations
  * @dev: device for the AI engine partition
@@ -146,6 +173,7 @@ struct aie_device {
 struct aie_partition {
 	struct list_head node;
 	struct aie_device *adev;
+	struct aie_part_mem *pmems;
 	struct aie_range range;
 	struct mutex mlock; /* protection for AI engine partition operations */
 	struct device dev;
@@ -256,5 +284,7 @@ struct aie_partition *of_aie_part_probe(struct aie_device *adev,
 void aie_part_remove(struct aie_partition *apart);
 int aie_part_clean(struct aie_partition *apart);
 
+int aie_mem_get_info(struct aie_partition *apart, unsigned long arg);
+
 int aie_device_init(struct aie_device *adev);
 #endif /* AIE_INTERNAL_H */
diff --git a/drivers/misc/xilinx-ai-engine/ai-engine-mem.c b/drivers/misc/xilinx-ai-engine/ai-engine-mem.c
new file mode 100644
index 0000000..5a06bdd0
--- /dev/null
+++ b/drivers/misc/xilinx-ai-engine/ai-engine-mem.c
@@ -0,0 +1,274 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Xilinx AI Engine device memory implementation
+ *
+ * Copyright (C) 2020 Xilinx, Inc.
+ */
+
+#include <linux/dma-buf.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+#include <linux/uaccess.h>
+#include <uapi/linux/xlnx-ai-engine.h>
+
+#include "ai-engine-internal.h"
+
+#define aie_cal_reg_goffset(adev, loc, regoff) ({ \
+	struct aie_device *_adev = (adev); \
+	struct aie_location *_loc = &(loc); \
+	(_loc->col << _adev->col_shift) + \
+	(_loc->row << _adev->row_shift) + (regoff); \
+	})
+
+#define aie_cal_reg_pa(adev, loc, regoff) ({ \
+	struct aie_device *__adev = (adev); \
+	__adev->res->start + aie_cal_reg_goffset(__adev, loc, regoff); \
+	})
+
+static struct sg_table *
+aie_mem_map_dma_buf(struct dma_buf_attachment *attachment,
+		    enum dma_data_direction direction)
+{
+	/*
+	 * TODO: It is mandatory by DMA buf operation. It is used return
+	 * scatterlist table of an attachment. We don't have the implementation
+	 * for now. And thus it has empty implementation.
+	 */
+	(void)attachment;
+	(void)direction;
+	dev_warn(attachment->dev,
+		 "AI engine memory map dma buf is not implemented.\n");
+	return NULL;
+}
+
+static void aie_mem_unmap_dma_buf(struct dma_buf_attachment *attachment,
+				  struct sg_table *table,
+				  enum dma_data_direction direction)
+{
+	/*
+	 * TODO: It is mandatory by DMA buf operation. It is used deallocate
+	 * scatterlist table of an attachment. We don't have the implementation
+	 * for now. And thus it has empty implementation.
+	 */
+	(void)attachment;
+	(void)table;
+	(void)direction;
+	dev_warn(attachment->dev,
+		 "AI engine memory unmap dma buf is not implemented.\n");
+}
+
+static int aie_mem_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
+{
+	struct aie_part_mem *pmem = dmabuf->priv;
+	struct aie_mem *mem = &pmem->mem;
+	struct aie_partition *apart = pmem->apart;
+	struct aie_location loc;
+	unsigned long addr = vma->vm_start;
+	unsigned long offset = vma->vm_pgoff * PAGE_SIZE, moffset = 0;
+	unsigned long remainder = vma->vm_end - addr;
+	size_t msize = mem->size;
+
+	if (remainder + offset > pmem->size)
+		return -EINVAL;
+
+	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
+	for (loc.col = mem->range.start.col;
+	     loc.col < mem->range.start.col + mem->range.size.col; loc.col++) {
+		for (loc.row = mem->range.start.row;
+		     loc.row < mem->range.start.row + mem->range.size.row;
+		     loc.row++) {
+			unsigned long toffset, len;
+			phys_addr_t mempa;
+			int ret;
+
+			remainder = vma->vm_end - addr;
+			if (!remainder)
+				return 0;
+
+			if (moffset + msize < offset) {
+				moffset += msize;
+				continue;
+			}
+			/*
+			 * calculate offset within the tile memory.
+			 * offset is the offset to vma->start.
+			 * moffset is the tile memory start offset to
+			 * vma->start.
+			 */
+			toffset = offset - moffset;
+			len = msize - toffset;
+			if (len > remainder)
+				len = remainder;
+			mempa = aie_cal_reg_pa(apart->adev, loc,
+					       toffset + mem->offset);
+
+			ret = remap_pfn_range(vma, addr, mempa >> PAGE_SHIFT,
+					      len, vma->vm_page_prot);
+			if (ret) {
+				dev_err(&apart->dev,
+					"failed to mmap (%u,%u)memory, remap failed, 0x%pa, 0x%lx.\n",
+					loc.col, loc.row, &mempa, len);
+				return ret;
+			}
+			addr += len;
+			offset += len;
+			moffset += msize;
+		}
+	}
+	return 0;
+}
+
+static void aie_mem_dmabuf_release(struct dma_buf *dmabuf)
+{
+	struct aie_part_mem *pmem = dmabuf->priv;
+
+	pmem->dbuf = NULL;
+}
+
+static const struct dma_buf_ops aie_mem_dma_buf_ops = {
+	.map_dma_buf = aie_mem_map_dma_buf,
+	.unmap_dma_buf = aie_mem_unmap_dma_buf,
+	.mmap = aie_mem_mmap,
+	.release = aie_mem_dmabuf_release,
+};
+
+/**
+ * aie_mem_create_dmabuf() - creates DMA buffer for AI engine partition
+ *			     memories
+ * @apart: AI engine partition
+ * @pmem: pointer to the partition memory information
+ * @mem: pointer to where it store the memory information and DMA buf file
+ *	 descriptor for user.
+ * @return: 0 for success, negative value for failure
+ *
+ * This function will create DMA buffer for the AI engine partition memory
+ * and will store the DMA buffer file descriptor and memory information in
+ * @mem.
+ */
+static int aie_mem_create_dmabuf(struct aie_partition *apart,
+				 struct aie_part_mem *pmem,
+				 struct aie_mem *mem)
+{
+	struct dma_buf *dmabuf;
+	int ret;
+
+	if (!PAGE_ALIGNED(pmem->mem.size)) {
+		dev_warn(&apart->dev,
+			 "no dmabuf for mem(0x%zx, 0x%zx), not aligned with page size.\n",
+			 pmem->mem.offset, pmem->mem.size);
+		return -EINVAL;
+	}
+
+	dmabuf = pmem->dbuf;
+	if (!dmabuf) {
+		DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
+
+		exp_info.ops = &aie_mem_dma_buf_ops;
+		exp_info.size = pmem->size;
+		exp_info.flags = O_RDWR;
+		exp_info.priv = pmem;
+
+		dmabuf = dma_buf_export(&exp_info);
+		if (IS_ERR(dmabuf))
+			return PTR_ERR(dmabuf);
+
+		pmem->dbuf = dmabuf;
+	}
+
+	ret = dma_buf_fd(dmabuf, O_CLOEXEC);
+	if (ret < 0) {
+		dev_err(&apart->dev,
+			"dmabuf creation failed, failed to get fd.\n");
+		return ret;
+	}
+	memcpy(mem, &pmem->mem, sizeof(*mem));
+	mem->fd = ret;
+
+	return 0;
+}
+
+/**
+ * aie_mem_get_info() - get AI engine memories information
+ * @apart: AI engine partition
+ * @arg: argument from user to enquire AI engine partition memory information
+ * @return: 0 for success, and negative value for failure
+ *
+ * This function will get the memories information for the specified AI engine
+ * partition. It will create DMA buf file descriptors for the memories and
+ * return the DMA buf file descriptors to users.
+ * It will create a DMA buffer per type of memories.
+ * e.g. There will be a DMA buffer for all the tile program memories in the
+ * partition, and another DMA buffer for all the tile data memories in the
+ * partition.
+ * User can first pass num_mems as 0 in the @arg to enquire for how many types
+ * of memories in this AI engine partition. And then, user can allocate memory
+ * to keep the information for different types of memories, and then use the
+ * same enquiry with non-zero num_mems and none NULL pointer to ask for the
+ * details of the information of all the types of memories in the AI engine
+ * partition.
+ */
+int aie_mem_get_info(struct aie_partition *apart, unsigned long arg)
+{
+	struct aie_mem_args margs;
+	struct aie_mem *mems;
+	unsigned int num_mems, i;
+	int ret;
+
+	if (copy_from_user(&margs, (void __user *)arg, sizeof(margs)))
+		return -EFAULT;
+
+	num_mems = apart->adev->ops->get_mem_info(&apart->range, NULL);
+	if (num_mems <= 0)
+		return -EINVAL;
+
+	if (!margs.num_mems) {
+		struct aie_mem_args __user *umargs_ptr = (void __user *)arg;
+
+		/* This enquiry is to get the number of types of memories. */
+		if (copy_to_user((void __user *)&umargs_ptr->num_mems,
+				 &num_mems, sizeof(num_mems)))
+			return -EFAULT;
+		return 0;
+	}
+
+	if (num_mems != margs.num_mems) {
+		dev_err(&apart->dev,
+			"failed to get mem info, invalid num of mems %d,%d.\n",
+			num_mems, margs.num_mems);
+		return -EINVAL;
+	}
+	if (!margs.mems) {
+		dev_err(&apart->dev,
+			"failed to get mem info, mems pointer is NULL.\n");
+		return -EINVAL;
+	}
+
+	mems = kcalloc(num_mems, sizeof(*mems), GFP_KERNEL);
+	if (!mems)
+		return -ENOMEM;
+
+	/*
+	 * Create DMA buffer for the memories.
+	 * Each type of memory in the partition has its own DMA buf.
+	 */
+	for (i = 0; i < num_mems; i++) {
+		ret = aie_mem_create_dmabuf(apart, &apart->pmems[i], &mems[i]);
+		if (ret)
+			break;
+	}
+	if (!ret) {
+		if (copy_to_user((void __user *)margs.mems, mems,
+				 num_mems * sizeof(mems[0])))
+			ret = -EFAULT;
+	}
+
+	if (ret) {
+		for (i = 0; i < num_mems; i++) {
+			if (mems[i].fd)
+				put_unused_fd(mems[i].fd);
+		}
+	}
+
+	kfree(mems);
+	return ret;
+}
diff --git a/drivers/misc/xilinx-ai-engine/ai-engine-part.c b/drivers/misc/xilinx-ai-engine/ai-engine-part.c
index 98f125b..4be6d38 100644
--- a/drivers/misc/xilinx-ai-engine/ai-engine-part.c
+++ b/drivers/misc/xilinx-ai-engine/ai-engine-part.c
@@ -294,6 +294,8 @@ static long aie_part_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
 		mutex_unlock(&apart->mlock);
 		break;
 	}
+	case AIE_GET_MEM_IOCTL:
+		return aie_mem_get_info(apart, arg);
 	default:
 		dev_err(&apart->dev, "Invalid ioctl command %u.\n", cmd);
 		ret = -EINVAL;
@@ -337,6 +339,41 @@ static void aie_part_release_device(struct device *dev)
 }
 
 /**
+ * aie_part_create_mems_info() - creates array to store the AI engine partition
+ *				 different memories types information
+ * @apart: AI engine partition
+ * @return: 0 for success, negative value for failure
+ *
+ * This function will create array to store the information of different
+ * memories types in the partition. This array is stored in @apart->pmems.
+ */
+static int aie_part_create_mems_info(struct aie_partition *apart)
+{
+	unsigned int i, num_mems;
+
+	num_mems = apart->adev->ops->get_mem_info(&apart->range, NULL);
+	if (!num_mems)
+		return 0;
+
+	apart->pmems = devm_kcalloc(&apart->dev, num_mems,
+				    sizeof(struct aie_part_mem),
+				    GFP_KERNEL);
+	if (!apart->pmems)
+		return -ENOMEM;
+
+	apart->adev->ops->get_mem_info(&apart->range, apart->pmems);
+	for (i = 0; i < num_mems; i++) {
+		struct aie_mem *mem = &apart->pmems[i].mem;
+
+		apart->pmems[i].apart = apart;
+		apart->pmems[i].size = mem->size *
+				       mem->range.size.col *
+				       mem->range.size.row;
+	}
+	return 0;
+}
+
+/**
  * aie_create_partition() - create AI engine partition instance
  * @adev: AI engine device
  * @range: AI engine partition range to check. A range describes a group
@@ -406,6 +443,16 @@ static struct aie_partition *aie_create_partition(struct aie_device *adev,
 		return ERR_PTR(ret);
 	}
 
+	/*
+	 * Create array to keep the information of the different types of tile
+	 * memories information of the AI engine partition.
+	 */
+	ret = aie_part_create_mems_info(apart);
+	if (ret) {
+		put_device(dev);
+		return ERR_PTR(ret);
+	}
+
 	ret = mutex_lock_interruptible(&adev->mlock);
 	if (ret) {
 		put_device(dev);
diff --git a/drivers/misc/xilinx-ai-engine/ai-engine-reset.c b/drivers/misc/xilinx-ai-engine/ai-engine-reset.c
index fc0262f7..d35cd8d 100644
--- a/drivers/misc/xilinx-ai-engine/ai-engine-reset.c
+++ b/drivers/misc/xilinx-ai-engine/ai-engine-reset.c
@@ -86,6 +86,43 @@ static void aie_part_set_cols_clkbuf(struct aie_partition *apart, bool enable)
 }
 
 /**
+ * aie_part_clear_mems() - clear memories of every tile in a partition
+ * @apart: AI engine partition
+ */
+static void aie_part_clear_mems(struct aie_partition *apart)
+{
+	struct aie_device *adev = apart->adev;
+	struct aie_part_mem *pmems = apart->pmems;
+	u32 i, num_mems;
+
+	/* Get the number of different types of memories */
+	num_mems = adev->ops->get_mem_info(&apart->range, NULL);
+	if (!num_mems)
+		return;
+
+	/* Clear each type of memories in the partition */
+	for (i = 0; i < num_mems; i++) {
+		struct aie_mem *mem = &pmems[i].mem;
+		struct aie_range *range = &mem->range;
+		u32 c, r;
+
+		for (c = range->start.col;
+		     c < range->start.col + range->size.col; c++) {
+			for (r = range->start.row;
+			     r < range->start.row + range->size.row; r++) {
+				struct aie_location loc;
+				u32 memoff;
+
+				loc.col = c;
+				loc.row = r;
+				memoff = aie_cal_regoff(adev, loc, mem->offset);
+				memset_io(adev->base + memoff, 0, mem->size);
+			}
+		}
+	}
+}
+
+/**
  * aie_part_clean() - reset and clear AI engine partition
  * @apart: AI engine partition
  * @return: 0 for success and negative value for failure
@@ -115,6 +152,7 @@ int aie_part_clean(struct aie_partition *apart)
 	if (ret < 0)
 		return ret;
 
+	aie_part_clear_mems(apart);
 	aie_part_set_cols_clkbuf(apart, false);
 
 	return 0;
diff --git a/include/uapi/linux/xlnx-ai-engine.h b/include/uapi/linux/xlnx-ai-engine.h
index ed2823c..5e40d00 100644
--- a/include/uapi/linux/xlnx-ai-engine.h
+++ b/include/uapi/linux/xlnx-ai-engine.h
@@ -6,6 +6,10 @@
 #ifndef _UAPI_AI_ENGINE_H_
 #define _UAPI_AI_ENGINE_H_
 
+#ifndef __KERNEL__
+#include <stdlib.h>
+#endif
+
 #include <linux/ioctl.h>
 #include <linux/types.h>
 
@@ -43,6 +47,32 @@ struct aie_range {
 };
 
 /**
+ * struct aie_mem - AIE memory information
+ * @range: range of tiles of the memory
+ * @offset: register offset within a tile of the memory
+ * @size: of a the memory in one tile
+ * @fd: file descriptor of the memory
+ */
+struct aie_mem {
+	struct aie_range range;
+	size_t offset;
+	size_t size;
+	int fd;
+};
+
+/**
+ * struct aie_mem_args - AIE memory enquiry arguments
+ * @num_mems: number of "struct aie_mem" elements
+ *	      e.g. two memory information elements, one for tile core memory,
+ *	      and the other for tile data memory.
+ * @mems: array of AI engine memory information elements
+ */
+struct aie_mem_args {
+	unsigned int num_mems;
+	struct aie_mem *mems;
+};
+
+/**
  * struct aie_reg_args - AIE access register arguments
  * @op: if this request is to read, write or poll register
  * @mask: mask for mask write, 0 for not mask write
@@ -110,4 +140,23 @@ struct aie_partition_req {
 /* AI engine partition IOCTL operations */
 #define AIE_REG_IOCTL			_IOWR(AIE_IOCTL_BASE, 0x8, \
 					      struct aie_reg_args)
+/**
+ * DOC: AIE_GET_MEM_IOCTL - enquire information of memories in the AI engine
+ *			    partition
+ * This ioctl is used to get the information of all the different types of
+ * memories in the AI engine partition. Application can get the memories
+ * information in two steps:
+ * 1. passing 0 as @num_mems in struct aie_mem_args to enquire the number of
+ *    different memories in the partition, the value will be returned in
+ *    @num_mems.
+ * 2. passing the number of memories in @num_mems and valid pointer as @mems of
+ *    struct aie_mem_args to store the details information of different
+ *    memories. The driver will create DMA buf for each type of memories, and
+ *    will return the memory addressing information along with the DMA buf file
+ *    descriptors in @mems.
+ * After getting the memories information, user can use mmap() with the DMA buf
+ * file descriptor to enable access the memories from userspace.
+ */
+#define AIE_GET_MEM_IOCTL		_IOWR(AIE_IOCTL_BASE, 0x9, \
+					      struct aie_mem_args)
 #endif
-- 
2.7.4

