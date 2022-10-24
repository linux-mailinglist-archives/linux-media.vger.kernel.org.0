Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E783260AEBC
	for <lists+linux-media@lfdr.de>; Mon, 24 Oct 2022 17:14:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231523AbiJXPOE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Oct 2022 11:14:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232666AbiJXPNe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Oct 2022 11:13:34 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E724CE98D;
        Mon, 24 Oct 2022 06:51:05 -0700 (PDT)
Received: from localhost (89-26-75-29.goll.dyn.salzburg-online.at [89.26.75.29])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sebastianfricke)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 898D56602331;
        Mon, 24 Oct 2022 14:41:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1666618868;
        bh=5sJz/mCE36R1t2dbZTJQM+pfSbheQWhw3FBzw/HNx5U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lM3owR3yCaeo1ajxGKxGH+OT/RqkrhiAfYMjQ/xL2vPCNzrGx8tUw+EJ72lGgCJ6z
         ImIXrwLQaJnHn8w6V8KRkB7quKsKBDzF3pQVV/lDZLWAL4BsqSRHFSKQC2BUVJBdkX
         Ryvz+EQFkAjwi92SgWwdAHlLOtiDT4iz3ancYe0+gdhMuEgh+i380wYtREU2gJyuwm
         6UrM77XVc9OI3M/6KRWR2u0OY26DTfpwvLaIao1qJWEcuky9vvsEqOC/54TUBeMIAw
         Yf/tTnWSPySufvPFhLaP0cUbZ6uhN+mgstk50CCggu/QX2+KxWdPX4RDaaZh1TEZYk
         Dg6fm3BqpBJuQ==
Date:   Mon, 24 Oct 2022 15:41:05 +0200
From:   Sebastian Fricke <sebastian.fricke@collabora.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     linux-media@vger.kernel.org, kernel@collabora.com,
        nas.chung@chipsnmedia.com, hverkuil@xs4all.nl,
        ezequiel@vanguardiasur.com.ar, linux-kernel@vger.kernel.org,
        nicolas.dufresne@collabora.com, p.zabel@pengutronix.de,
        dafna@fastmail.com
Subject: Re: [PATCH v10 3/7] media: chips-media: wave5: Add the vdi layer
Message-ID: <20221024134105.y6q7izgvzbf3xh5q@basti-XPS-13-9310>
References: <20221022000506.221933-1-sebastian.fricke@collabora.com>
 <20221022000506.221933-4-sebastian.fricke@collabora.com>
 <6a2e5dec-ab54-a156-98f0-a8bff6a24700@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6a2e5dec-ab54-a156-98f0-a8bff6a24700@wanadoo.fr>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Christophe,

thank you for the review.

On 23.10.2022 11:28, Christophe JAILLET wrote:
>Le 22/10/2022 à 02:05, Sebastian Fricke a écrit :
>>From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>>
>>Add the vdi part of the wave5 codec driver. The wave5-vdi.h header
>>defines common helper functions such as writing/reading register and
>>handling endianness.
>>
>>Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
>>Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>>Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
>
>Hi, a few nit below.
>
>CJ
>
>>---
>>  .../platform/chips-media/wave5/wave5-vdi.c    | 261 ++++++++++++++++++
>>  .../platform/chips-media/wave5/wave5-vdi.h    |  67 +++++
>>  .../platform/chips-media/wave5/wave5-vpuapi.h |   2 +-
>>  3 files changed, 329 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/media/platform/chips-media/wave5/wave5-vdi.c
>>  create mode 100644 drivers/media/platform/chips-media/wave5/wave5-vdi.h
>>
>>diff --git a/drivers/media/platform/chips-media/wave5/wave5-vdi.c b/drivers/media/platform/chips-media/wave5/wave5-vdi.c
>>new file mode 100644
>>index 000000000000..f85580dba294
>>--- /dev/null
>>+++ b/drivers/media/platform/chips-media/wave5/wave5-vdi.c
>>@@ -0,0 +1,261 @@
>>+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
>>+/*
>>+ * Wave5 series multi-standard codec IP - low level access functions
>>+ *
>>+ * Copyright (C) 2021 CHIPS&MEDIA INC
>>+ */
>>+
>>+#include <linux/bug.h>
>>+#include "wave5-vdi.h"
>>+#include "wave5-vpu.h"
>>+#include "wave5-regdefine.h"
>>+#include <linux/delay.h>
>>+
>>+#define VDI_SRAM_BASE_ADDR		0x00
>>+
>>+#define VDI_SYSTEM_ENDIAN		VDI_LITTLE_ENDIAN
>>+#define VDI_128BIT_BUS_SYSTEM_ENDIAN	VDI_128BIT_LITTLE_ENDIAN
>>+
>>+static int wave5_vdi_allocate_common_memory(struct device *dev)
>>+{
>>+	struct vpu_device *vpu_dev = dev_get_drvdata(dev);
>>+
>>+	if (!vpu_dev->common_mem.vaddr) {
>>+		int ret;
>>+
>>+		vpu_dev->common_mem.size = SIZE_COMMON;
>>+		ret = wave5_vdi_allocate_dma_memory(vpu_dev, &vpu_dev->common_mem);
>>+		if (ret) {
>>+			dev_err(dev, "unable to allocate common buffer\n");
>>+			return ret;
>>+		}
>>+	}
>>+
>>+	dev_dbg(dev, "[VDI] common_mem: daddr=%pad size=%zu vaddr=0x%p\n",
>>+		&vpu_dev->common_mem.daddr, vpu_dev->common_mem.size, vpu_dev->common_mem.vaddr);
>>+
>>+	return 0;
>>+}
>>+
>>+int wave5_vdi_init(struct device *dev)
>>+{
>>+	struct vpu_device *vpu_dev = dev_get_drvdata(dev);
>>+	int ret;
>>+
>>+	ret = wave5_vdi_allocate_common_memory(dev);
>>+	if (ret < 0) {
>>+		dev_err(dev, "[VDI] failed to get vpu common buffer from driver\n");
>>+		return ret;
>>+	}
>>+
>>+	if (!PRODUCT_CODE_W_SERIES(vpu_dev->product_code)) {
>>+		WARN_ONCE(1, "unsupported product code: 0x%x\n", vpu_dev->product_code);
>>+		return 0;
>>+	}
>>+
>>+	// if BIT processor is not running.
>>+	if (wave5_vdi_readl(vpu_dev, W5_VCPU_CUR_PC) == 0) {
>>+		int i;
>>+
>>+		for (i = 0; i < 64; i++)
>>+			wave5_vdi_write_register(vpu_dev, (i * 4) + 0x100, 0x0);
>>+	}
>>+
>>+	dev_dbg(dev, "[VDI] driver initialized successfully\n");
>>+
>>+	return 0;
>>+}
>>+
>>+int wave5_vdi_release(struct device *dev)
>>+{
>>+	struct vpu_device *vpu_dev = dev_get_drvdata(dev);
>>+
>>+	vpu_dev->vdb_register = NULL;
>>+	wave5_vdi_free_dma_memory(vpu_dev, &vpu_dev->common_mem);
>>+
>>+	return 0;
>>+}
>>+
>>+void wave5_vdi_write_register(struct vpu_device *vpu_dev, u32 addr, u32 data)
>>+{
>>+	writel(data, vpu_dev->vdb_register + addr);
>>+}
>>+
>>+unsigned int wave5_vdi_readl(struct vpu_device *vpu_dev, u32 addr)
>>+{
>>+	return readl(vpu_dev->vdb_register + addr);
>>+}
>>+
>>+int wave5_vdi_clear_memory(struct vpu_device *vpu_dev, struct vpu_buf *vb)
>>+{
>>+	if (!vb || !vb->vaddr) {
>>+		dev_err(vpu_dev->dev, "%s: unable to clear unmapped buffer\n", __func__);
>>+		return -EINVAL;
>>+	}
>>+
>>+	memset(vb->vaddr, 0, vb->size);
>>+	return vb->size;
>>+}
>>+
>>+static void wave5_swap_endian(struct vpu_device *vpu_dev, u8 *data, size_t len,
>>+			      unsigned int endian);
>>+
>>+int wave5_vdi_write_memory(struct vpu_device *vpu_dev, struct vpu_buf *vb, size_t offset,
>>+			   u8 *data, size_t len, unsigned int endian)
>>+{
>>+	if (!vb || !vb->vaddr) {
>>+		dev_err(vpu_dev->dev, "%s: unable to write to unmapped buffer\n", __func__);
>>+		return -EINVAL;
>>+	}
>>+
>>+	if (offset > vb->size || len > vb->size || offset + len > vb->size) {
>>+		dev_err(vpu_dev->dev, "%s: buffer too small\n", __func__);
>>+		return -ENOSPC;
>>+	}
>>+
>>+	wave5_swap_endian(vpu_dev, data, len, endian);
>>+	memcpy(vb->vaddr + offset, data, len);
>>+
>>+	return len;
>>+}
>>+
>>+int wave5_vdi_allocate_dma_memory(struct vpu_device *vpu_dev, struct vpu_buf *vb)
>>+{
>>+	void *vaddr;
>>+	dma_addr_t daddr;
>>+
>>+	if (!vb->size) {
>>+		dev_err(vpu_dev->dev, "%s: requested size==0\n", __func__);
>>+		return -EINVAL;
>>+	}
>>+
>>+	vaddr = dma_alloc_coherent(vpu_dev->dev, vb->size, &daddr, GFP_KERNEL);
>>+	if (!vaddr)
>>+		return -ENOMEM;
>>+	vb->vaddr = vaddr;
>>+	vb->daddr = daddr;
>>+
>>+	return 0;
>>+}
>>+
>>+void wave5_vdi_free_dma_memory(struct vpu_device *vpu_dev, struct vpu_buf *vb)
>>+{
>>+	if (vb->size == 0)
>>+		return;
>>+
>>+	if (!vb->vaddr)
>>+		dev_err(vpu_dev->dev, "%s: requested free of unmapped buffer\n", __func__);
>>+	else
>>+		dma_free_coherent(vpu_dev->dev, vb->size, vb->vaddr, vb->daddr);
>>+
>>+	memset(vb, 0, sizeof(*vb));
>>+}
>>+
>>+unsigned int wave5_vdi_convert_endian(struct vpu_device *vpu_dev, unsigned int endian)
>>+{
>>+	if (PRODUCT_CODE_W_SERIES(vpu_dev->product_code)) {
>>+		switch (endian) {
>>+		case VDI_LITTLE_ENDIAN:
>>+			endian = 0x00;
>>+			break;
>>+		case VDI_BIG_ENDIAN:
>>+			endian = 0x0f;
>>+			break;
>>+		case VDI_32BIT_LITTLE_ENDIAN:
>>+			endian = 0x04;
>>+			break;
>>+		case VDI_32BIT_BIG_ENDIAN:
>>+			endian = 0x03;
>>+			break;
>>+		}
>>+	}
>>+
>>+	return (endian & 0x0f);
>>+}
>>+
>>+static void byte_swap(unsigned char *data, size_t len)
>>+{
>>+	u8 temp;
>>+	unsigned int i;
>>+
>>+	for (i = 0; i < len; i += 2) {
>>+		temp = data[i];
>>+		data[i] = data[i + 1];
>>+		data[i + 1] = temp;
>
>swap(ptr[i], ptr[i + 1]);
>?

Yes good point, I forgot to add that change, thanks for pointing it out.

>
>>+	}
>>+}
>>+
>>+static void word_swap(unsigned char *data, size_t len)
>>+{
>>+	u16 temp;
>>+	u16 *ptr = (u16 *)data;
>>+	unsigned int i;
>>+	size_t size = len / sizeof(uint16_t);
>>+
>>+	for (i = 0; i < size; i += 2) {
>>+		temp = ptr[i];
>>+		ptr[i] = ptr[i + 1];
>>+		ptr[i + 1] = temp;
>
>swap(ptr[i], ptr[i + 1]);
>?
>
>>+	}
>>+}
>>+
>>+static void dword_swap(unsigned char *data, size_t len)
>>+{
>>+	u32 temp;
>>+	u32 *ptr = (u32 *)data;
>>+	size_t size = len / sizeof(u32);
>>+	unsigned int i;
>>+
>>+	for (i = 0; i < size; i += 2) {
>>+		temp = ptr[i];
>>+		ptr[i] = ptr[i + 1];
>>+		ptr[i + 1] = temp;
>
>swap(ptr[i], ptr[i + 1]);
>?
>
>>+	}
>>+}
>>+
>>+static void lword_swap(unsigned char *data, size_t len)
>>+{
>>+	u64 temp;
>>+	u64 *ptr = (u64 *)data;
>>+	size_t size = len / sizeof(uint64_t);
>>+	unsigned int i;
>>+
>>+	for (i = 0; i < size; i += 2) {
>>+		temp = ptr[i];
>>+		ptr[i] = ptr[i + 1];
>>+		ptr[i + 1] = temp;
>
>swap(ptr[i], ptr[i + 1]);
>?
>
>>+	}
>>+}
>>+
>>+static void wave5_swap_endian(struct vpu_device *vpu_dev, u8 *data, size_t len,
>>+			      unsigned int endian)
>>+{
>>+	int changes;
>>+	unsigned int sys_endian = VDI_128BIT_BUS_SYSTEM_ENDIAN;
>>+	bool byte_change, word_change, dword_change, lword_change;
>>+
>>+	if (!PRODUCT_CODE_W_SERIES(vpu_dev->product_code)) {
>>+		dev_err(vpu_dev->dev, "unknown product id: %08x\n", vpu_dev->product_code);
>>+		return;
>>+	}
>>+
>>+	endian = wave5_vdi_convert_endian(vpu_dev, endian);
>>+	sys_endian = wave5_vdi_convert_endian(vpu_dev, sys_endian);
>>+	if (endian == sys_endian)
>>+		return;
>>+
>>+	changes = endian ^ sys_endian;
>>+	byte_change = changes & 0x01;
>>+	word_change = ((changes & 0x02) == 0x02);
>>+	dword_change = ((changes & 0x04) == 0x04);
>>+	lword_change = ((changes & 0x08) == 0x08);
>>+
>>+	if (byte_change)
>>+		byte_swap(data, len);
>>+	if (word_change)
>>+		word_swap(data, len);
>>+	if (dword_change)
>>+		dword_swap(data, len);
>>+	if (lword_change)
>>+		lword_swap(data, len);
>>+}
>>diff --git a/drivers/media/platform/chips-media/wave5/wave5-vdi.h b/drivers/media/platform/chips-media/wave5/wave5-vdi.h
>>new file mode 100644
>>index 000000000000..8e1d09331d5c
>>--- /dev/null
>>+++ b/drivers/media/platform/chips-media/wave5/wave5-vdi.h
>>@@ -0,0 +1,67 @@
>>+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
>>+/*
>>+ * Wave5 series multi-standard codec IP - low level access functions
>>+ *
>>+ * Copyright (C) 2021 CHIPS&MEDIA INC
>>+ */
>>+
>>+#ifndef _VDI_H_
>>+#define _VDI_H_
>>+
>>+#include "wave5-vpuconfig.h"
>>+#include <linux/string.h>
>>+#include <linux/slab.h>
>>+#include <linux/device.h>
>>+
>>+/************************************************************************/
>>+/* COMMON REGISTERS */
>>+/************************************************************************/
>>+#define VPU_PRODUCT_CODE_REGISTER 0x1044
>>+
>>+/* system register write */
>>+#define vpu_write_reg(VPU_INST, ADDR, DATA) wave5_vdi_write_register(VPU_INST, ADDR, DATA)
>>+// system register read
>
>The style of comment is not the same as the line above.

Also true, I check for more cases like this in the driver.

>
>>+#define vpu_read_reg(CORE, ADDR) wave5_vdi_readl(CORE, ADDR)
>>+
>>+struct vpu_buf {
>>+	size_t size;
>>+	dma_addr_t daddr;
>>+	void *vaddr;
>>+};
>>+
>>+struct dma_vpu_buf {
>>+	size_t size;
>>+	dma_addr_t daddr;
>>+};
>>+
>>+enum endian_mode {
>>+	VDI_LITTLE_ENDIAN = 0, /* 64bit LE */
>>+	VDI_BIG_ENDIAN, /* 64bit BE */
>>+	VDI_32BIT_LITTLE_ENDIAN,
>>+	VDI_32BIT_BIG_ENDIAN,
>>+	/* WAVE PRODUCTS */
>>+	VDI_128BIT_LITTLE_ENDIAN = 16,
>>+	VDI_128BIT_LE_BYTE_SWAP,
>>+	VDI_128BIT_LE_WORD_SWAP,
>>+	VDI_128BIT_LE_WORD_BYTE_SWAP,
>>+	VDI_128BIT_LE_DWORD_SWAP,
>>+	VDI_128BIT_LE_DWORD_BYTE_SWAP,
>>+	VDI_128BIT_LE_DWORD_WORD_SWAP,
>>+	VDI_128BIT_LE_DWORD_WORD_BYTE_SWAP,
>>+	VDI_128BIT_BE_DWORD_WORD_BYTE_SWAP,
>>+	VDI_128BIT_BE_DWORD_WORD_SWAP,
>>+	VDI_128BIT_BE_DWORD_BYTE_SWAP,
>>+	VDI_128BIT_BE_DWORD_SWAP,
>>+	VDI_128BIT_BE_WORD_BYTE_SWAP,
>>+	VDI_128BIT_BE_WORD_SWAP,
>>+	VDI_128BIT_BE_BYTE_SWAP,
>>+	VDI_128BIT_BIG_ENDIAN = 31,
>>+	VDI_ENDIAN_MAX
>>+};
>>+
>>+#define VDI_128BIT_ENDIAN_MASK 0xf
>>+
>>+int wave5_vdi_init(struct device *dev);
>>+int wave5_vdi_release(struct device *dev);	//this function may be called only at system off.
>>+
>>+#endif //#ifndef _VDI_H_
>>diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
>>index 8b36c7196526..ef930408d977 100644
>>--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
>>+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
>>@@ -1159,7 +1159,7 @@ int wave5_vdi_clear_memory(struct vpu_device *vpu_dev, struct vpu_buf *vb);
>>  int wave5_vdi_allocate_dma_memory(struct vpu_device *vpu_dev, struct vpu_buf *vb);
>>  int wave5_vdi_write_memory(struct vpu_device *vpu_dev, struct vpu_buf *vb, size_t offset,
>>  			   u8 *data, size_t len, unsigned int endian);
>>-int wave5_vdi_convert_endian(struct vpu_device *vpu_dev, unsigned int endian);
>>+unsigned int wave5_vdi_convert_endian(struct vpu_device *vpu_dev, unsigned int endian);
>
>wave5_vdi_convert_endian() seems to be already declared and used in 
>patch 2, but not defined there.

Ah .. thanks for pointing this out, yes I notice that the two commits
have cyclic dependencies. I will combine them into 1 commit.

Greetings,
Sebastian

>
>>  void wave5_vdi_free_dma_memory(struct vpu_device *vpu_dev, struct vpu_buf *vb);
>>  int wave5_vpu_init_with_bitcode(struct device *dev, u8 *bitcode, size_t size);
>
