Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82AFD48B1D2
	for <lists+linux-media@lfdr.de>; Tue, 11 Jan 2022 17:16:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349893AbiAKQQZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jan 2022 11:16:25 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:52070 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242322AbiAKQQY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jan 2022 11:16:24 -0500
Received: from localhost.localdomain (unknown [IPv6:2a00:c281:14a3:8100:5418:23c4:e539:4c3e])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9160F1F43A7F;
        Tue, 11 Jan 2022 16:16:21 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1641917783;
        bh=VK4OoPHVLWNY4pGh2i02IpgoGxZeAujNnblXtgaKjgU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hEEy8vYm8tNsnipd0eay+Nz6Lrz5pr61mIxRals47iD/V5HTQLAS9OSB33UZ8Q0v0
         z8A4G6m7moAbZnLkKW1vRHv5WwxeOoYn6fqjxix7XGtW+X5AYTM1dIo+DLdi+L63kW
         hfLaaZlHD0J1IUOKXAQqRKJYYo13WLppHHU1ndGufqDWWzQ6u9PcFn4bPX4vXbP9Nf
         GIXx4RvlC6+0MvNMqJS8PZR8dJ+dhQAGOmhINPJ7uGqo3GFGJ9AByqoCj/aIbKOeyl
         hSLgbf33PgYaKb3onYTg8JwO4CXLV130uALgrDsdTF3TKBS3/sgkp8LwmmTa1tS8Jb
         kJgH0nYHf+XhQ==
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Robert Beckett <bob.beckett@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
        linux-kernel@vger.kernel.org (open list),
        laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl,
        kernel@collabora.com, dafna3@gmail.com,
        kiril.bicevski@collabora.com,
        Nas Chung <nas.chung@chipsnmedia.com>,
        lafley.kim@chipsnmedia.com, scott.woo@chipsnmedia.com,
        olivier.crete@collabora.com, dan.carpenter@oracle.com,
        rdunlap@infradead.org, daniel@0x0f.com
Subject: [PATCH v5 2/6] staging: media: wave5: Add the vdi layer
Date:   Tue, 11 Jan 2022 18:16:00 +0200
Message-Id: <20220111161604.22579-3-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220111161604.22579-1-dafna.hirschfeld@collabora.com>
References: <20220111161604.22579-1-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the vdi part of the wave5 codec driver.
The wave5-vdi.h header defines common helper functions
such as writing/reading register and handling endianness.

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/wave5/wave5-vdi.c | 260 ++++++++++++++++++++++++
 drivers/staging/media/wave5/wave5-vdi.h |  81 ++++++++
 2 files changed, 341 insertions(+)
 create mode 100644 drivers/staging/media/wave5/wave5-vdi.c
 create mode 100644 drivers/staging/media/wave5/wave5-vdi.h

diff --git a/drivers/staging/media/wave5/wave5-vdi.c b/drivers/staging/media/wave5/wave5-vdi.c
new file mode 100644
index 000000000000..bbde868de42e
--- /dev/null
+++ b/drivers/staging/media/wave5/wave5-vdi.c
@@ -0,0 +1,260 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/*
+ * Wave5 series multi-standard codec IP - low level access functions
+ *
+ * Copyright (C) 2021 CHIPS&MEDIA INC
+ */
+
+#include <linux/bug.h>
+#include "wave5-vdi.h"
+#include "wave5-vpu.h"
+#include "wave5-regdefine.h"
+#include <linux/delay.h>
+
+#define VDI_SRAM_BASE_ADDR 0x00
+
+#define VDI_SYSTEM_ENDIAN VDI_LITTLE_ENDIAN
+#define VDI_128BIT_BUS_SYSTEM_ENDIAN VDI_128BIT_LITTLE_ENDIAN
+
+static int wave5_vdi_allocate_common_memory(struct device *dev)
+{
+	int ret;
+	struct vpu_device *vpu_dev = dev_get_drvdata(dev);
+
+	if (!vpu_dev->common_mem.vaddr) {
+		vpu_dev->common_mem.size = SIZE_COMMON;
+		ret = wave5_vdi_allocate_dma_memory(vpu_dev, &vpu_dev->common_mem);
+		if (ret) {
+			dev_err(dev, "unable to allocate common buffer\n");
+			return ret;
+		}
+	}
+
+	dev_dbg(dev, "common_mem: daddr=%pad size=%zu vaddr=0x%p\n",
+		&vpu_dev->common_mem.daddr, vpu_dev->common_mem.size,
+			vpu_dev->common_mem.vaddr);
+
+	return 0;
+}
+
+int wave5_vdi_init(struct device *dev)
+{
+	struct vpu_device *vpu_dev = dev_get_drvdata(dev);
+	int i;
+	int ret;
+
+	ret = wave5_vdi_allocate_common_memory(dev);
+	if (ret < 0) {
+		dev_err(dev, "[VDI] fail to get vpu common buffer from driver\n");
+		return ret;
+	}
+
+	if (PRODUCT_CODE_W_SERIES(vpu_dev->product_code)) {
+		// if BIT processor is not running.
+		if (wave5_vdi_readl(vpu_dev, W5_VCPU_CUR_PC) == 0) {
+			for (i = 0; i < 64; i++)
+				wave5_vdi_write_register(vpu_dev, (i * 4) + 0x100, 0x0);
+		}
+	} else {
+		WARN_ONCE(1, "unsupported product code 0x%x\n", vpu_dev->product_code);
+	}
+
+	dev_dbg(dev, "[VDI] success to init driver\n");
+
+	return 0;
+}
+
+int wave5_vdi_release(struct device *dev)
+{
+	struct vpu_device *vpu_dev = dev_get_drvdata(dev);
+
+	vpu_dev->vdb_register = NULL;
+	wave5_vdi_free_dma_memory(vpu_dev, &vpu_dev->common_mem);
+
+	return 0;
+}
+
+void wave5_vdi_write_register(struct vpu_device *vpu_dev, unsigned int addr, unsigned int data)
+{
+	writel(data, vpu_dev->vdb_register + addr);
+}
+
+unsigned int wave5_vdi_readl(struct vpu_device *vpu_dev, u32 addr)
+{
+	return readl(vpu_dev->vdb_register + addr);
+}
+
+int wave5_vdi_clear_memory(struct vpu_device *vpu_dev, struct vpu_buf *vb)
+{
+	if (!vb || !vb->vaddr) {
+		dev_err(vpu_dev->dev, "%s(): unable to clear unmapped buffer\n", __func__);
+		return -EINVAL;
+	}
+
+	memset(vb->vaddr, 0, vb->size);
+	return vb->size;
+}
+
+static void wave5_swap_endian(struct vpu_device *vpu_dev, u8 *data, int len, int endian);
+
+int wave5_vdi_write_memory(struct vpu_device *vpu_dev, struct vpu_buf *vb, size_t offset,
+			   u8 *data, int len, int endian)
+{
+	if (!vb || !vb->vaddr) {
+		dev_err(vpu_dev->dev, "%s(): unable to write to unmapped buffer\n", __func__);
+		return -EINVAL;
+	}
+
+	if (offset > vb->size || len > vb->size || offset + len > vb->size) {
+		dev_err(vpu_dev->dev, "%s(): buffer too small\n", __func__);
+		return -ENOSPC;
+	}
+
+	wave5_swap_endian(vpu_dev, data, len, endian);
+	memcpy(vb->vaddr + offset, data, len);
+
+	return len;
+}
+
+int wave5_vdi_allocate_dma_memory(struct vpu_device *vpu_dev, struct vpu_buf *vb)
+{
+	void *vaddr;
+	dma_addr_t daddr;
+
+	if (!vb->size) {
+		dev_err(vpu_dev->dev, "%s(): requested size==0\n", __func__);
+		return -EINVAL;
+	}
+
+	vaddr = dma_alloc_coherent(vpu_dev->dev, vb->size, &daddr, GFP_KERNEL);
+	if (!vaddr)
+		return -ENOMEM;
+	vb->vaddr = vaddr;
+	vb->daddr = daddr;
+
+	return 0;
+}
+
+void wave5_vdi_free_dma_memory(struct vpu_device *vpu_dev, struct vpu_buf *vb)
+{
+	if (vb->size == 0)
+		return;
+
+	if (!vb->vaddr)
+		dev_err(vpu_dev->dev, "%s(): requested free of unmapped buffer\n", __func__);
+	else
+		dma_free_coherent(vpu_dev->dev, vb->size, vb->vaddr, vb->daddr);
+
+	memset(vb, 0, sizeof(*vb));
+}
+
+int wave5_vdi_convert_endian(struct vpu_device *vpu_dev, unsigned int endian)
+{
+	if (PRODUCT_CODE_W_SERIES(vpu_dev->product_code)) {
+		switch (endian) {
+		case VDI_LITTLE_ENDIAN:
+			endian = 0x00;
+			break;
+		case VDI_BIG_ENDIAN:
+			endian = 0x0f;
+			break;
+		case VDI_32BIT_LITTLE_ENDIAN:
+			endian = 0x04;
+			break;
+		case VDI_32BIT_BIG_ENDIAN:
+			endian = 0x03;
+			break;
+		}
+	}
+
+	return (endian & 0x0f);
+}
+
+static void byte_swap(unsigned char *data, int len)
+{
+	u8 temp;
+	int i;
+
+	for (i = 0; i < len; i += 2) {
+		temp = data[i];
+		data[i] = data[i + 1];
+		data[i + 1] = temp;
+	}
+}
+
+static void word_swap(unsigned char *data, int len)
+{
+	u16 temp;
+	u16 *ptr = (u16 *)data;
+	int i;
+	s32 size = len / sizeof(uint16_t);
+
+	for (i = 0; i < size; i += 2) {
+		temp = ptr[i];
+		ptr[i] = ptr[i + 1];
+		ptr[i + 1] = temp;
+	}
+}
+
+static void dword_swap(unsigned char *data, int len)
+{
+	u32 temp;
+	u32 *ptr = (u32 *)data;
+	s32 size = len / sizeof(uint32_t);
+	int i;
+
+	for (i = 0; i < size; i += 2) {
+		temp = ptr[i];
+		ptr[i] = ptr[i + 1];
+		ptr[i + 1] = temp;
+	}
+}
+
+static void lword_swap(unsigned char *data, int len)
+{
+	u64 temp;
+	u64 *ptr = (u64 *)data;
+	s32 size = len / sizeof(uint64_t);
+	int i;
+
+	for (i = 0; i < size; i += 2) {
+		temp = ptr[i];
+		ptr[i] = ptr[i + 1];
+		ptr[i + 1] = temp;
+	}
+}
+
+static void wave5_swap_endian(struct vpu_device *vpu_dev, u8 *data, int len, int endian)
+{
+	int changes;
+	int sys_endian;
+	bool byte_change, word_change, dword_change, lword_change;
+
+	if (PRODUCT_CODE_W_SERIES(vpu_dev->product_code)) {
+		sys_endian = VDI_128BIT_BUS_SYSTEM_ENDIAN;
+	} else {
+		dev_err(vpu_dev->dev, "unknown product id : %08x\n", vpu_dev->product_code);
+		return;
+	}
+
+	endian = wave5_vdi_convert_endian(vpu_dev, endian);
+	sys_endian = wave5_vdi_convert_endian(vpu_dev, sys_endian);
+	if (endian == sys_endian)
+		return;
+
+	changes = endian ^ sys_endian;
+	byte_change = changes & 0x01;
+	word_change = ((changes & 0x02) == 0x02);
+	dword_change = ((changes & 0x04) == 0x04);
+	lword_change = ((changes & 0x08) == 0x08);
+
+	if (byte_change)
+		byte_swap(data, len);
+	if (word_change)
+		word_swap(data, len);
+	if (dword_change)
+		dword_swap(data, len);
+	if (lword_change)
+		lword_swap(data, len);
+}
+
diff --git a/drivers/staging/media/wave5/wave5-vdi.h b/drivers/staging/media/wave5/wave5-vdi.h
new file mode 100644
index 000000000000..f26cab7ac845
--- /dev/null
+++ b/drivers/staging/media/wave5/wave5-vdi.h
@@ -0,0 +1,81 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * Wave5 series multi-standard codec IP - low level access functions
+ *
+ * Copyright (C) 2021 CHIPS&MEDIA INC
+ */
+
+#ifndef _VDI_H_
+#define _VDI_H_
+
+#include "wave5-vpuconfig.h"
+#include <linux/string.h>
+#include <linux/slab.h>
+#include <linux/device.h>
+
+/************************************************************************/
+/* COMMON REGISTERS */
+/************************************************************************/
+#define VPU_PRODUCT_CODE_REGISTER 0x1044
+
+/* system register write */
+#define vpu_write_reg(VPU_INST, ADDR, DATA) wave5_vdi_write_register(VPU_INST, ADDR, DATA)
+// system register read
+#define vpu_read_reg(CORE, ADDR) wave5_vdi_readl(CORE, ADDR)
+
+struct vpu_buf {
+	size_t size;
+	dma_addr_t daddr;
+	void *vaddr;
+};
+
+struct dma_vpu_buf {
+	size_t size;
+	dma_addr_t daddr;
+};
+
+enum endian_mode {
+	VDI_LITTLE_ENDIAN = 0, /* 64bit LE */
+	VDI_BIG_ENDIAN, /* 64bit BE */
+	VDI_32BIT_LITTLE_ENDIAN,
+	VDI_32BIT_BIG_ENDIAN,
+	/* WAVE PRODUCTS */
+	VDI_128BIT_LITTLE_ENDIAN = 16,
+	VDI_128BIT_LE_BYTE_SWAP,
+	VDI_128BIT_LE_WORD_SWAP,
+	VDI_128BIT_LE_WORD_BYTE_SWAP,
+	VDI_128BIT_LE_DWORD_SWAP,
+	VDI_128BIT_LE_DWORD_BYTE_SWAP,
+	VDI_128BIT_LE_DWORD_WORD_SWAP,
+	VDI_128BIT_LE_DWORD_WORD_BYTE_SWAP,
+	VDI_128BIT_BE_DWORD_WORD_BYTE_SWAP,
+	VDI_128BIT_BE_DWORD_WORD_SWAP,
+	VDI_128BIT_BE_DWORD_BYTE_SWAP,
+	VDI_128BIT_BE_DWORD_SWAP,
+	VDI_128BIT_BE_WORD_BYTE_SWAP,
+	VDI_128BIT_BE_WORD_SWAP,
+	VDI_128BIT_BE_BYTE_SWAP,
+	VDI_128BIT_BIG_ENDIAN = 31,
+	VDI_ENDIAN_MAX
+};
+
+#define VDI_128BIT_ENDIAN_MASK 0xf
+
+int wave5_vdi_init(struct device *dev);
+int wave5_vdi_release(struct device *dev);	//this function may be called only at system off.
+
+/**
+ * @brief make clock stable before changing clock frequency
+ * @detail before invoking vdi_set_clock_freg caller MUST invoke vdi_ready_change_clock
+ *		function.
+ * after changing clock frequency caller also invoke wave5_vdi_done_change_clock() function.
+ * @return 0 failure
+ * 1 success
+ */
+int wave5_vdi_ready_change_clock(unsigned long core_idx);
+int wave5_vdi_set_change_clock(unsigned long core_idx, unsigned long clock_mask);
+int wave5_vdi_done_change_clock(unsigned long core_idx);
+int wave5_vdi_buffer_sync(struct device *dev, struct vpu_buf *vb, int dir);
+
+#endif //#ifndef _VDI_H_
+
-- 
2.17.1

