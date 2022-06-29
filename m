Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D65A5606D2
	for <lists+linux-media@lfdr.de>; Wed, 29 Jun 2022 18:58:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229907AbiF2Q6X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jun 2022 12:58:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbiF2Q6W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jun 2022 12:58:22 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82D7A10AA
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 09:58:20 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id s124so22525944oia.0
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 09:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UuRxfl4DFAp4Bz+yqmgOFmLlpz07ZLfwvgFf+in5gmw=;
        b=i4DjUJzXU2xyzdEZD9qhBfqe9Q8MmRiogRJ3PmdKjB45S/yU+9F3eUx28t5NsPEL2W
         YNwWZebwXg/m/75pIXiSWAGvUczilI/a/VNJ/sBv4oycIY2jEbby80JzY0vLhZzfPsGA
         6AFlUdmb1sqBBTaZ79oEsFc8w9E76lLYh63az2qtcDedjpgisGRsVvSDDUCw5WeIucmD
         Ym47eMC3OkMte2Yj2xm/ff5yojOmVLUQfVOPAu5BiLTtCdDtencEoz9yuS9xR3ilMC32
         AO1/IPKnB53fneIGTNzkY1YZd9ZY9f2q9WsrLvRousK8a0dDzCYDGgCsIUqAwOrcUxFQ
         IkCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UuRxfl4DFAp4Bz+yqmgOFmLlpz07ZLfwvgFf+in5gmw=;
        b=elRE6EJEGgBx50jbrW0yobEXJJhy9HqvX2Qc06bogreV40Zggkcu2KcQ4TRMs9APXA
         FQ/kirR7pNt6s7mdjlEXOTn1UfITp1+r1K5XOUsp/6lFHtjkqXM/JHI97nOLFJ97Vp6Q
         LAssDON5NWiRZI0cyewCPgJyHXQukdmk0+zpN6LNJwpw0pxp6v3Yu1T6V9KTHCwQ78Jf
         wVGOkzKs+j38Wf1vI9r83c+/xWpk2ojat3asEErYHBekCykm5TQJePfkyfkYndL4p9Jy
         ELuwbe24Vgo8ww0DYd5vvNvfbKqwO/o1ZZBeqWBvFTK+j/rWMuvr0y5cCR6T4phQUMZ7
         2iUg==
X-Gm-Message-State: AJIora94R9Mim50bdGk+hj04g+b9mMPUkqPZGmE2LtapFEkqUmKFHRAG
        NGq0f7gcP49YRG3XYCusdCL1eg==
X-Google-Smtp-Source: AGRyM1u2piqwgcp3lWfMzY4f8cO9Ys6HaMixhzydgv9ke50THElIrvCqCL70JdPymZR4qUXGgwGfvg==
X-Received: by 2002:a05:6808:1b8d:b0:32f:7995:b32b with SMTP id cj13-20020a0568081b8d00b0032f7995b32bmr3622126oib.219.1656521899831;
        Wed, 29 Jun 2022 09:58:19 -0700 (PDT)
Received: from eze-laptop ([190.190.187.68])
        by smtp.gmail.com with ESMTPSA id i9-20020a9d4a89000000b00616d25dc933sm4942028otf.69.2022.06.29.09.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 09:58:19 -0700 (PDT)
Date:   Wed, 29 Jun 2022 13:58:14 -0300
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To:     Nas Chung <nas.chung@chipsnmedia.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        linux-staging@lists.linux.dev, mchehab@kernel.org,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Robert Beckett <bob.beckett@collabora.com>
Subject: Re: [PATCH v9 2/6] staging: media: wave5: Add the vdi layer
Message-ID: <YryEpshCDZI1OiZn@eze-laptop>
References: <20220628110821.716-1-nas.chung@chipsnmedia.com>
 <20220628110821.716-3-nas.chung@chipsnmedia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220628110821.716-3-nas.chung@chipsnmedia.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nas,

Thanks a lot for taking care of the driver.

I hope it can be merged soon, and de-staged soon too!

On Tue, Jun 28, 2022 at 08:08:17PM +0900, Nas Chung wrote:
> From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> 
> Add the vdi part of the wave5 codec driver.
> The wave5-vdi.h header defines common helper functions such as writing/reading register and handling endianness.
> 
> Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/staging/media/wave5/wave5-vdi.c | 260 ++++++++++++++++++++++++
>  drivers/staging/media/wave5/wave5-vdi.h |  81 ++++++++
>  2 files changed, 341 insertions(+)
>  create mode 100644 drivers/staging/media/wave5/wave5-vdi.c
>  create mode 100644 drivers/staging/media/wave5/wave5-vdi.h
> 
> diff --git a/drivers/staging/media/wave5/wave5-vdi.c b/drivers/staging/media/wave5/wave5-vdi.c
> new file mode 100644
> index 000000000000..bbde868de42e
> --- /dev/null
> +++ b/drivers/staging/media/wave5/wave5-vdi.c
> @@ -0,0 +1,260 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
> +/*
> + * Wave5 series multi-standard codec IP - low level access functions
> + *
> + * Copyright (C) 2021 CHIPS&MEDIA INC
> + */
> +
> +#include <linux/bug.h>
> +#include "wave5-vdi.h"
> +#include "wave5-vpu.h"
> +#include "wave5-regdefine.h"
> +#include <linux/delay.h>
> +
> +#define VDI_SRAM_BASE_ADDR 0x00
> +
> +#define VDI_SYSTEM_ENDIAN VDI_LITTLE_ENDIAN
> +#define VDI_128BIT_BUS_SYSTEM_ENDIAN VDI_128BIT_LITTLE_ENDIAN
> +
> +static int wave5_vdi_allocate_common_memory(struct device *dev)
> +{
> +	int ret;
> +	struct vpu_device *vpu_dev = dev_get_drvdata(dev);
> +
> +	if (!vpu_dev->common_mem.vaddr) {
> +		vpu_dev->common_mem.size = SIZE_COMMON;
> +		ret = wave5_vdi_allocate_dma_memory(vpu_dev, &vpu_dev->common_mem);
> +		if (ret) {
> +			dev_err(dev, "unable to allocate common buffer\n");
> +			return ret;
> +		}
> +	}
> +
> +	dev_dbg(dev, "common_mem: daddr=%pad size=%zu vaddr=0x%p\n",
> +		&vpu_dev->common_mem.daddr, vpu_dev->common_mem.size,
> +			vpu_dev->common_mem.vaddr);
> +
> +	return 0;
> +}
> +
> +int wave5_vdi_init(struct device *dev)
> +{
> +	struct vpu_device *vpu_dev = dev_get_drvdata(dev);
> +	int i;
> +	int ret;
> +
> +	ret = wave5_vdi_allocate_common_memory(dev);
> +	if (ret < 0) {
> +		dev_err(dev, "[VDI] fail to get vpu common buffer from driver\n");
> +		return ret;
> +	}
> +
> +	if (PRODUCT_CODE_W_SERIES(vpu_dev->product_code)) {
> +		// if BIT processor is not running.
> +		if (wave5_vdi_readl(vpu_dev, W5_VCPU_CUR_PC) == 0) {
> +			for (i = 0; i < 64; i++)
> +				wave5_vdi_write_register(vpu_dev, (i * 4) + 0x100, 0x0);
> +		}
> +	} else {
> +		WARN_ONCE(1, "unsupported product code 0x%x\n", vpu_dev->product_code);
> +	}
> +
> +	dev_dbg(dev, "[VDI] success to init driver\n");
> +
> +	return 0;
> +}
> +
> +int wave5_vdi_release(struct device *dev)
> +{
> +	struct vpu_device *vpu_dev = dev_get_drvdata(dev);
> +
> +	vpu_dev->vdb_register = NULL;
> +	wave5_vdi_free_dma_memory(vpu_dev, &vpu_dev->common_mem);
> +
> +	return 0;
> +}
> +
> +void wave5_vdi_write_register(struct vpu_device *vpu_dev, unsigned int addr, unsigned int data)
> +{
> +	writel(data, vpu_dev->vdb_register + addr);
> +}
> +
> +unsigned int wave5_vdi_readl(struct vpu_device *vpu_dev, u32 addr)
> +{
> +	return readl(vpu_dev->vdb_register + addr);
> +}
> +
> +int wave5_vdi_clear_memory(struct vpu_device *vpu_dev, struct vpu_buf *vb)

Nitpick: Just do memset when needed instead of calling wave5_vdi_clear_memory :-)

> +{
> +	if (!vb || !vb->vaddr) {
> +		dev_err(vpu_dev->dev, "%s(): unable to clear unmapped buffer\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	memset(vb->vaddr, 0, vb->size);
> +	return vb->size;
> +}
> +
> +static void wave5_swap_endian(struct vpu_device *vpu_dev, u8 *data, int len, int endian);
> +
> +int wave5_vdi_write_memory(struct vpu_device *vpu_dev, struct vpu_buf *vb, size_t offset,
> +			   u8 *data, int len, int endian)
> +{
> +	if (!vb || !vb->vaddr) {
> +		dev_err(vpu_dev->dev, "%s(): unable to write to unmapped buffer\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	if (offset > vb->size || len > vb->size || offset + len > vb->size) {
> +		dev_err(vpu_dev->dev, "%s(): buffer too small\n", __func__);
> +		return -ENOSPC;
> +	}
> +
> +	wave5_swap_endian(vpu_dev, data, len, endian);
> +	memcpy(vb->vaddr + offset, data, len);
> +
> +	return len;
> +}
> +
> +int wave5_vdi_allocate_dma_memory(struct vpu_device *vpu_dev, struct vpu_buf *vb)

This function is not local to this file (doesn't have a static keyword)
but it's not declared in any header on this commit.

Is it used out of this file? If yes, then it should be declared in some
header.

> +{
> +	void *vaddr;
> +	dma_addr_t daddr;
> +
> +	if (!vb->size) {
> +		dev_err(vpu_dev->dev, "%s(): requested size==0\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	vaddr = dma_alloc_coherent(vpu_dev->dev, vb->size, &daddr, GFP_KERNEL);
> +	if (!vaddr)
> +		return -ENOMEM;
> +	vb->vaddr = vaddr;
> +	vb->daddr = daddr;
> +
> +	return 0;
> +}
> +
> +void wave5_vdi_free_dma_memory(struct vpu_device *vpu_dev, struct vpu_buf *vb)

Ditto above, should this be static?

> +{
> +	if (vb->size == 0)
> +		return;
> +
> +	if (!vb->vaddr)
> +		dev_err(vpu_dev->dev, "%s(): requested free of unmapped buffer\n", __func__);
> +	else
> +		dma_free_coherent(vpu_dev->dev, vb->size, vb->vaddr, vb->daddr);
> +
> +	memset(vb, 0, sizeof(*vb));
> +}
> +
> +int wave5_vdi_convert_endian(struct vpu_device *vpu_dev, unsigned int endian)
> +{
> +	if (PRODUCT_CODE_W_SERIES(vpu_dev->product_code)) {
> +		switch (endian) {
> +		case VDI_LITTLE_ENDIAN:
> +			endian = 0x00;
> +			break;
> +		case VDI_BIG_ENDIAN:
> +			endian = 0x0f;
> +			break;
> +		case VDI_32BIT_LITTLE_ENDIAN:
> +			endian = 0x04;
> +			break;
> +		case VDI_32BIT_BIG_ENDIAN:
> +			endian = 0x03;
> +			break;
> +		}
> +	}
> +
> +	return (endian & 0x0f);
> +}
> +
> +static void byte_swap(unsigned char *data, int len)
> +{
> +	u8 temp;
> +	int i;
> +
> +	for (i = 0; i < len; i += 2) {
> +		temp = data[i];
> +		data[i] = data[i + 1];
> +		data[i + 1] = temp;
> +	}
> +}
> +
> +static void word_swap(unsigned char *data, int len)
> +{
> +	u16 temp;
> +	u16 *ptr = (u16 *)data;
> +	int i;
> +	s32 size = len / sizeof(uint16_t);
> +
> +	for (i = 0; i < size; i += 2) {
> +		temp = ptr[i];
> +		ptr[i] = ptr[i + 1];
> +		ptr[i + 1] = temp;
> +	}
> +}
> +
> +static void dword_swap(unsigned char *data, int len)
> +{
> +	u32 temp;
> +	u32 *ptr = (u32 *)data;
> +	s32 size = len / sizeof(uint32_t);
> +	int i;
> +
> +	for (i = 0; i < size; i += 2) {
> +		temp = ptr[i];
> +		ptr[i] = ptr[i + 1];
> +		ptr[i + 1] = temp;
> +	}
> +}
> +
> +static void lword_swap(unsigned char *data, int len)
> +{
> +	u64 temp;
> +	u64 *ptr = (u64 *)data;
> +	s32 size = len / sizeof(uint64_t);
> +	int i;
> +
> +	for (i = 0; i < size; i += 2) {
> +		temp = ptr[i];
> +		ptr[i] = ptr[i + 1];
> +		ptr[i + 1] = temp;
> +	}
> +}
> +
> +static void wave5_swap_endian(struct vpu_device *vpu_dev, u8 *data, int len, int endian)
> +{
> +	int changes;
> +	int sys_endian;
> +	bool byte_change, word_change, dword_change, lword_change;
> +
> +	if (PRODUCT_CODE_W_SERIES(vpu_dev->product_code)) {
> +		sys_endian = VDI_128BIT_BUS_SYSTEM_ENDIAN;
> +	} else {
> +		dev_err(vpu_dev->dev, "unknown product id : %08x\n", vpu_dev->product_code);
> +		return;
> +	}
> +
> +	endian = wave5_vdi_convert_endian(vpu_dev, endian);
> +	sys_endian = wave5_vdi_convert_endian(vpu_dev, sys_endian);
> +	if (endian == sys_endian)
> +		return;
> +
> +	changes = endian ^ sys_endian;
> +	byte_change = changes & 0x01;
> +	word_change = ((changes & 0x02) == 0x02);
> +	dword_change = ((changes & 0x04) == 0x04);
> +	lword_change = ((changes & 0x08) == 0x08);
> +
> +	if (byte_change)
> +		byte_swap(data, len);
> +	if (word_change)
> +		word_swap(data, len);
> +	if (dword_change)
> +		dword_swap(data, len);
> +	if (lword_change)
> +		lword_swap(data, len);
> +}
> +
> diff --git a/drivers/staging/media/wave5/wave5-vdi.h b/drivers/staging/media/wave5/wave5-vdi.h
> new file mode 100644
> index 000000000000..f26cab7ac845
> --- /dev/null
> +++ b/drivers/staging/media/wave5/wave5-vdi.h
> @@ -0,0 +1,81 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
> +/*
> + * Wave5 series multi-standard codec IP - low level access functions
> + *
> + * Copyright (C) 2021 CHIPS&MEDIA INC
> + */
> +
> +#ifndef _VDI_H_
> +#define _VDI_H_
> +
> +#include "wave5-vpuconfig.h"
> +#include <linux/string.h>
> +#include <linux/slab.h>
> +#include <linux/device.h>
> +
> +/************************************************************************/
> +/* COMMON REGISTERS */
> +/************************************************************************/
> +#define VPU_PRODUCT_CODE_REGISTER 0x1044
> +
> +/* system register write */
> +#define vpu_write_reg(VPU_INST, ADDR, DATA) wave5_vdi_write_register(VPU_INST, ADDR, DATA)
> +// system register read
> +#define vpu_read_reg(CORE, ADDR) wave5_vdi_readl(CORE, ADDR)

Nitpick: These defines look redundant. Maybe just name wave5_vdi_write_register as
vpu_write_reg, or just use writel.

> +
> +struct vpu_buf {
> +	size_t size;
> +	dma_addr_t daddr;
> +	void *vaddr;
> +};
> +
> +struct dma_vpu_buf {
> +	size_t size;
> +	dma_addr_t daddr;
> +};
> +
> +enum endian_mode {
> +	VDI_LITTLE_ENDIAN = 0, /* 64bit LE */
> +	VDI_BIG_ENDIAN, /* 64bit BE */
> +	VDI_32BIT_LITTLE_ENDIAN,
> +	VDI_32BIT_BIG_ENDIAN,
> +	/* WAVE PRODUCTS */
> +	VDI_128BIT_LITTLE_ENDIAN = 16,
> +	VDI_128BIT_LE_BYTE_SWAP,
> +	VDI_128BIT_LE_WORD_SWAP,
> +	VDI_128BIT_LE_WORD_BYTE_SWAP,
> +	VDI_128BIT_LE_DWORD_SWAP,
> +	VDI_128BIT_LE_DWORD_BYTE_SWAP,
> +	VDI_128BIT_LE_DWORD_WORD_SWAP,
> +	VDI_128BIT_LE_DWORD_WORD_BYTE_SWAP,
> +	VDI_128BIT_BE_DWORD_WORD_BYTE_SWAP,
> +	VDI_128BIT_BE_DWORD_WORD_SWAP,
> +	VDI_128BIT_BE_DWORD_BYTE_SWAP,
> +	VDI_128BIT_BE_DWORD_SWAP,
> +	VDI_128BIT_BE_WORD_BYTE_SWAP,
> +	VDI_128BIT_BE_WORD_SWAP,
> +	VDI_128BIT_BE_BYTE_SWAP,
> +	VDI_128BIT_BIG_ENDIAN = 31,
> +	VDI_ENDIAN_MAX
> +};
> +
> +#define VDI_128BIT_ENDIAN_MASK 0xf
> +
> +int wave5_vdi_init(struct device *dev);
> +int wave5_vdi_release(struct device *dev);	//this function may be called only at system off.
> +
> +/**
> + * @brief make clock stable before changing clock frequency
> + * @detail before invoking vdi_set_clock_freg caller MUST invoke vdi_ready_change_clock
> + *		function.
> + * after changing clock frequency caller also invoke wave5_vdi_done_change_clock() function.
> + * @return 0 failure
> + * 1 success
> + */
> +int wave5_vdi_ready_change_clock(unsigned long core_idx);
> +int wave5_vdi_set_change_clock(unsigned long core_idx, unsigned long clock_mask);
> +int wave5_vdi_done_change_clock(unsigned long core_idx);
> +int wave5_vdi_buffer_sync(struct device *dev, struct vpu_buf *vb, int dir);

These functions seem not implemented. Maybe it's a leftover?

Thanks,
Ezequiel

> +
> +#endif //#ifndef _VDI_H_
> +
> -- 
> 2.30.2
> 
