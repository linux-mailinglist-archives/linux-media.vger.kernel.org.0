Return-Path: <linux-media+bounces-34628-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D51C3AD7232
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 15:36:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C46F3BA09E
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 13:32:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AECC24DD1A;
	Thu, 12 Jun 2025 13:30:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC139244696
	for <linux-media@vger.kernel.org>; Thu, 12 Jun 2025 13:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749735052; cv=none; b=OJsid9IFTiWV2H6jDPydNFrsgPRr5W+jBOurn5OLXIAAPKCmSsGeNhsuW6R8sa0jT1p/v3IQR0Wp55wMDtsMtBKKlVRaG3+LqgqVjsMf1vE9s2eXGthq2h+qe/reDG1/cZf7eUUJBhT98wBCVvDK9XGgt74gNnMN+hlbKDU7QPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749735052; c=relaxed/simple;
	bh=wZeNBzHzdl2QUNJzlKCVLF1nsDqYRcUKokOaDwz4RnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JzlfLoQvgpTPLMTnvnDrXA3WrcgJqQ7RIu02w2eYiTVO+ekJBDOlclJh5DxwufDYXZidr+ouzWHw0Rw5C158Vw52rPgTPXtC7Mxbf9WTeVH2i6lMvRD1QzXRHHEYPvC1atEapGlipsWeHOcjPRwd9HYUWNVAB7miVhSIY5YvnBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mtr@pengutronix.de>)
	id 1uPi0m-0001yE-Rn; Thu, 12 Jun 2025 15:30:32 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mtr@pengutronix.de>)
	id 1uPi0m-0038B5-1P;
	Thu, 12 Jun 2025 15:30:32 +0200
Received: from mtr by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mtr@pengutronix.de>)
	id 1uPi0m-008vvr-0Z;
	Thu, 12 Jun 2025 15:30:32 +0200
Date: Thu, 12 Jun 2025 15:30:32 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
To: yassine.ouaissa@allegrodvt.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/4] media: allegro-dvt: Add Gen 3 IP stateful decoder
 driver
Message-ID: <aErWeK9qQSrCcNnp@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
	yassine.ouaissa@allegrodvt.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
References: <20250605-allegro_dvt_al300_dec_driver-v2-0-1ef4839f5f06@allegrodvt.com>
 <20250605-allegro_dvt_al300_dec_driver-v2-4-1ef4839f5f06@allegrodvt.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250605-allegro_dvt_al300_dec_driver-v2-4-1ef4839f5f06@allegrodvt.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

Hi Yassine,

Thanks for the patch.

The overall architecture looks a lot like the video encoder for the
ZynqMP, but with some significant differences in the details. I didn't
manage to look more closely at the driver, yet, but I have a few high
level questions.

On Thu, 05 Jun 2025 12:26:59 +0000, Yassine Ouaissa via B4 Relay wrote:
> From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
> 
> This commit introduces a new allegro-dvt V4L2 stateful decoder driverfor
> the Gen 3 IP with support for:
> - AVC (H.264), HEVC (H.265), and JPEG decoding
> - Output formats: NV12, NV16, I420, and P010 for capture
> 
> v2:
> - Replace the mutex_(lock/unlock) with the guard(mutex), that manage
>   mutexes more efficiently.
> - Set DMA_BIT_MASK to 39, and drop the paddr check when allocating
>   dma_memory.
> - Use dma_coerce_mask_and_coherent to set the DMA_MASK.
> - Use static initializer for some structs.
> - use #ifdef instead of #if defined
> - Optimize some function.
> - Use the declaration in the loop.
> - Use codec for al_codec_dev instead of dev, to not get confused with
>   the device struct.
> - Remove the codec member of the al_codec_dev, use the fmt->pixelformat
>   when request creating decoder instance.
> 
> Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
> ---
>  drivers/media/platform/allegro-dvt/Kconfig         |    1 +
>  drivers/media/platform/allegro-dvt/Makefile        |    1 +
>  drivers/media/platform/allegro-dvt/al300/Kconfig   |   23 +
>  drivers/media/platform/allegro-dvt/al300/Makefile  |    6 +
>  .../platform/allegro-dvt/al300/al_codec_common.c   |  733 ++++++++++
>  .../platform/allegro-dvt/al300/al_codec_common.h   |  248 ++++
>  .../platform/allegro-dvt/al300/al_codec_util.c     |  174 +++
>  .../platform/allegro-dvt/al300/al_codec_util.h     |  186 +++
>  .../media/platform/allegro-dvt/al300/al_vdec_drv.c | 1518 ++++++++++++++++++++
>  .../media/platform/allegro-dvt/al300/al_vdec_drv.h |   93 ++
>  10 files changed, 2983 insertions(+)
> 
[...]
> diff --git a/drivers/media/platform/allegro-dvt/al300/al_codec_common.c b/drivers/media/platform/allegro-dvt/al300/al_codec_common.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..716d0004482702537ea89ec4abecd6af26654b32
> --- /dev/null
> +++ b/drivers/media/platform/allegro-dvt/al300/al_codec_common.c
[...]
> +static void handle_alloc_memory_req(struct al_codec_dev *codec,
> +				    struct msg_itf_header *hdr)
> +{
> +	struct device *dev = &codec->pdev->dev;
> +	struct msg_itf_alloc_mem_req req;
> +	struct msg_itf_alloc_mem_reply_full reply = {
> +		.reply.phyAddr = 0,
> +		.hdr.type = MSG_ITF_TYPE_ALLOC_MEM_REPLY,
> +		.hdr.drv_ctx_hdl = hdr->drv_ctx_hdl,
> +		.hdr.drv_cmd_hdl = hdr->drv_cmd_hdl,
> +		.hdr.payload_len = sizeof(struct msg_itf_alloc_mem_reply),
> +	};
> +	struct codec_dma_buf *buf;
> +	int ret;
> +
> +	ret = al_common_get_data(codec, (char *)&req, hdr->payload_len);
> +	if (ret) {
> +		al_codec_err(codec, "Unable to get cma req %d", ret);
> +		return;
> +	}
> +
> +	buf = kmalloc(sizeof(*buf), GFP_KERNEL);
> +	if (!buf)
> +		goto send_reply;
> +
> +	buf->size = req.uSize;
> +	buf->vaddr =
> +		dma_alloc_coherent(dev, buf->size, &buf->paddr, GFP_KERNEL);
> +	if (!buf->vaddr) {
> +		dev_warn(dev, "Failed to allocate DMA buffer\n");
> +		goto send_reply;
> +	}
> +
> +	reply.reply.phyAddr = (u64)buf->paddr;
> +	al_common_dma_buf_insert(codec, buf);

The buffers allocated by the firmware are tracked by device. Thus, there
is only one list for all buffers used by the firmware.

I guess that the buffers are be allocated per context. If that's the
case, maybe tracking them per context in the driver would be a better
option.

> +
> +send_reply:
> +	ret = al_common_send(codec, &reply.hdr);
> +	if (ret) {
> +		al_codec_err(codec, "Unable to reply to cma alloc");
> +		al_common_dma_buf_remove(codec, buf);
> +	}
> +}
> +
> +static void handle_free_memory_req(struct al_codec_dev *codec,
> +				   struct msg_itf_header *hdr)
> +{
> +	struct msg_itf_free_mem_req req;
> +	struct msg_itf_free_mem_reply_full reply = {
> +		.hdr.type = MSG_ITF_TYPE_FREE_MEM_REPLY,
> +		.hdr.drv_ctx_hdl = hdr->drv_ctx_hdl,
> +		.hdr.drv_cmd_hdl = hdr->drv_cmd_hdl,
> +		.hdr.payload_len = sizeof(struct msg_itf_free_mem_reply),
> +		.reply.ret = -1,
> +	};
> +	struct codec_dma_buf *buf;
> +	int ret;
> +
> +	ret = al_common_get_data(codec, (char *)&req, hdr->payload_len);
> +	if (ret) {
> +		al_codec_err(codec, "Unable to put cma req");
> +		return;
> +	}
> +
> +	buf = al_common_dma_buf_lookup(codec, req.phyAddr);
> +	if (!buf) {
> +		al_codec_err(codec, "Unable to get dma handle for %p",
> +			     (void *)(long)req.phyAddr);
> +		reply.reply.ret = -EINVAL;
> +		goto send_reply;
> +	}
> +
> +	al_codec_dbg(codec, "Free memory %p, size %d",
> +		     (void *)(long)req.phyAddr, buf->size);
> +
> +	al_common_dma_buf_remove(codec, buf);
> +	reply.reply.ret = 0;
> +
> +send_reply:
> +	ret = al_common_send(codec, &reply.hdr);
> +	if (ret)
> +		al_codec_err(codec, "Unable to reply to cma free");
> +}
> +
> +static void handle_mcu_console_print(struct al_codec_dev *codec,
> +				     struct msg_itf_header *hdr)
> +{
> +#ifdef DEBUG

What's the reason for making this a compile time option? Maybe a
module parameter to enable MCU logging at runtime would be more
friendly for debugging.

> +	struct msg_itf_write_req *req;
> +	int ret;
> +
> +	/* one more byte to be sure to have a zero terminated string */
> +	req = kzalloc(hdr->payload_len + 1, GFP_KERNEL);
> +	if (!req) {
> +		al_common_skip_data(codec, hdr->payload_len);
> +		al_codec_err(codec, "Unable to alloc memory");
> +		return;
> +	}
> +
> +	ret = al_codec_msg_get_data(&codec->mb_m2h, (char *)req,
> +				    hdr->payload_len);
> +	if (ret) {
> +		al_codec_err(codec, "Unable to get request");
> +		kfree(req);
> +		return;
> +	}
> +
> +	/* Print the mcu logs */
> +	dev_dbg(&codec->pdev->dev, "[ALG_MCU] %s(),%d: %s\n", __func__,
> +		__LINE__, (char *)(req + 1));
> +	kfree(req);
> +#else
> +	al_common_skip_data(codec, hdr->payload_len);
> +#endif
> +}
> +
[...]
> +static int al_common_load_firmware_start(struct al_codec_dev *codec,
> +					 const char *name)
> +{
> +	struct device *dev = &codec->pdev->dev;
> +	dma_addr_t phys;
> +	size_t size;
> +	void *virt;
> +	int err;
> +
> +	if (codec->firmware.virt)
> +		return 0;
> +
> +	err = al_common_read_firmware(codec, name);
> +	if (err)
> +		return err;
> +
> +	size = codec->firmware.size;
> +
> +	virt = dma_alloc_coherent(dev, size, &phys, GFP_KERNEL);
> +	err = dma_mapping_error(dev, phys);
> +	if (err < 0)
> +		return err;
> +
> +	codec->firmware.virt = virt;
> +	codec->firmware.phys = phys;
> +
> +	al_common_copy_firmware_image(codec);
> +	err = al_common_parse_firmware_image(codec);
> +	if (err) {
> +		al_codec_err(codec, "failed to parse firmware image");
> +		goto cleanup;
> +	}
> +
> +	err = al_common_setup_hw_regs(codec);
> +	if (err) {
> +		al_codec_err(codec, "Unable to setup hw registers");
> +		goto cleanup;
> +	}
> +
> +	al_codec_mb_init(&codec->mb_h2m, virt + codec->firmware.mb_h2m.offset,
> +			 codec->firmware.mb_h2m.size, MB_IFT_MAGIC_H2M);
> +
> +	al_codec_mb_init(&codec->mb_m2h, virt + codec->firmware.mb_m2h.offset,
> +			 codec->firmware.mb_m2h.size, MB_IFT_MAGIC_M2H);
> +
> +	err = al_common_start_fw(codec);
> +	if (err) {
> +		al_codec_err(codec, "fw start has failed");
> +		goto cleanup;
> +	}

If I understand correctly, the difference to the ZynqMP firmware is that
the firmware can be configured for different addresses. Thus, the
firmware and mailbox addresses on ZynqMP are determined by the bitstream
synthesis, which this driver is free to allocate memory for the firmware
and mailboxes wherever it wants. Correct?

> +
> +	al_codec_dbg(codec, "mcu has boot successfully !");
> +	codec->fw_ready_cb(codec->cb_arg);
> +
> +	release_firmware(codec->firmware.firmware);
> +	codec->firmware.firmware = NULL;
> +
> +	return 0;
> +
> +cleanup:
> +	dma_free_coherent(dev, size, virt, phys);
> +
> +	return err;
> +}
> +
> +static u64 al_common_get_periph_addr(struct al_codec_dev *codec)
> +{
> +	struct resource *res;
> +
> +	res = platform_get_resource_byname(codec->pdev, IORESOURCE_MEM, "apb");
> +	if (!res) {
> +		al_codec_err(codec, "Unable to find APB start address");
> +		return 0;
> +	}
> +
> +	if (res->start & AL_CODEC_APB_MASK) {
> +		al_codec_err(codec, "APB start address is invalid");
> +		return 0;
> +	}
> +
> +	return res->start;
> +}
> +
> +int al_common_probe(struct al_codec_dev *codec, const char *name)
> +{
> +	struct platform_device *pdev = codec->pdev;
> +	int irq;
> +	int ret;
> +
> +	mutex_init(&codec->buf_lock);
> +	INIT_LIST_HEAD(&codec->alloc_buffers);
> +	init_completion(&codec->completion);
> +
> +	/* setup dma memory */
> +	ret = al_common_setup_dma(codec);
> +	if (ret)
> +		return ret;
> +
> +	/* Hw registers */
> +	codec->regs_info =
> +		platform_get_resource_byname(pdev, IORESOURCE_MEM, "regs");
> +	if (!codec->regs_info) {
> +		al_codec_err(codec, "regs resource missing from device tree");
> +		return -EINVAL;
> +	}
> +
> +	codec->regs = devm_ioremap_resource(&pdev->dev, codec->regs_info);
> +	if (!codec->regs) {
> +		al_codec_err(codec, "failed to map registers");
> +		return -ENOMEM;
> +	}
> +
> +	codec->apb = al_common_get_periph_addr(codec);
> +	if (!codec->apb)
> +		return -EINVAL;
> +
> +	/* The MCU has already default clock value */
> +	codec->clk = devm_clk_get(&pdev->dev, NULL);
> +	if (IS_ERR(codec->clk)) {
> +		al_codec_err(codec, "failed to get MCU core clock");
> +		return PTR_ERR(codec->clk);
> +	}
> +
> +	ret = clk_prepare_enable(codec->clk);
> +	if (ret) {
> +		al_codec_err(codec, "Cannot enable MCU clock: %d\n", ret);
> +		return ret;
> +	}
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0) {
> +		al_codec_err(codec, "Failed to get IRQ");
> +		ret = -EINVAL;
> +		goto disable_clk;
> +	}
> +
> +	ret = devm_request_threaded_irq(&pdev->dev, irq,
> +					al_common_hardirq_handler,
> +					al_common_irq_handler, IRQF_SHARED,
> +					dev_name(&pdev->dev), codec);
> +	if (ret) {
> +		al_codec_err(codec, "Unable to register irq handler");
> +		goto disable_clk;
> +	}
> +
> +	/* ok so request the fw */
> +	ret = al_common_load_firmware_start(codec, name);
> +	if (ret) {
> +		al_codec_err(codec, "failed to load firmware : %s", name);
> +		goto disable_clk;
> +	}
> +
> +	return 0;
> +
> +disable_clk:
> +	clk_disable_unprepare(codec->clk);
> +
> +	return ret;
> +}
> +
[...]
> diff --git a/drivers/media/platform/allegro-dvt/al300/al_codec_util.h b/drivers/media/platform/allegro-dvt/al300/al_codec_util.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..5f893db4a1a3f2b9e6e9109b81a956bcaa71851c
> --- /dev/null
> +++ b/drivers/media/platform/allegro-dvt/al300/al_codec_util.h
> @@ -0,0 +1,186 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright (c) 2025 Allegro DVT.
> + * Author: Yassine OUAISSA <yassine.ouaissa@allegrodvt.fr>
> + */
> +
> +#ifndef __AL_CODEC_UTIL__
> +#define __AL_CODEC_UTIL__
> +
> +#include <linux/mutex.h>
> +#include <linux/types.h>
> +#include <linux/v4l2-common.h>
> +
> +#include <media/v4l2-mem2mem.h>
> +#include <media/videobuf2-v4l2.h>
> +
> +#define MB_IFT_MAGIC_H2M 0xabcd1230
> +#define MB_IFT_MAGIC_M2H 0xabcd1231
> +#define MB_IFT_VERSION 0x00010000
> +
> +#define MAJOR_SHIFT 20
> +#define MAJOR_MASK 0xfff
> +#define MINOR_SHIFT 8
> +#define MINOR_MASK 0xfff
> +#define PATCH_SHIFT 0
> +#define PATCH_MASK 0xff
> +
> +/*
> + * AL_BOOT_VERSION() - Version format 32-bit, 12 bits for the major,
> + * the same for minor, 8bits for the patch
> + */
> +#define AL_BOOT_VERSION(major, minor, patch) \
> +	((((major) & MAJOR_MASK) << MAJOR_SHIFT) | \
> +	 (((minor) & MINOR_MASK) << MINOR_SHIFT) | \
> +	 (((patch) & PATCH_MASK) << PATCH_SHIFT))
> +
> +#define al_phys_to_virt(x) ((void *)(uintptr_t)x)
> +#define al_virt_to_phys(x) ((phys_addr_t)(uintptr_t)x)
> +
> +#define DECLARE_FULL_REQ(s)    \
> +	struct s##_full {            \
> +		struct msg_itf_header hdr; \
> +		struct s req;              \
> +	} __packed
> +
> +#define DECLARE_FULL_REPLY(s)  \
> +	struct s##_full {            \
> +		struct msg_itf_header hdr; \
> +		struct s reply;            \
> +	} __packed
> +
> +#define DECLARE_FULL_EVENT(s)  \
> +	struct s##_full {            \
> +		struct msg_itf_header hdr; \
> +		struct s event;            \
> +	} __packed
> +
> +struct al_mb_itf {
> +	u32 magic;
> +	u32 version;
> +	u32 head;
> +	u32 tail;
> +} __packed;
> +
> +struct al_codec_mb {
> +	struct al_mb_itf *hdr;
> +	struct mutex lock;
> +	char *data;
> +	int size;
> +};

On a first glance, this looks a lot like the allegro_mbox in the ZynqMP
encoder driver. Even though the message format is different, would it be
possible to generalize the general mailbox handling and use it for both
drivers?

Michael

> +
> +struct al_codec_cmd {
> +	struct kref refcount;
> +	struct list_head list;
> +	struct completion done;
> +	int reply_size;
> +	void *reply;
> +};
> +
> +#define al_codec_err(codec, fmt, args...)                               \
> +	dev_err(&(codec)->pdev->dev, "[ALG_CODEC][ERROR] %s():%d: " fmt "\n", \
> +		__func__, __LINE__, ##args)
> +
> +#define al_v4l2_err(codec, fmt, args...)                               \
> +	dev_err(&(codec)->pdev->dev, "[ALG_V4L2][ERROR] %s():%d: " fmt "\n", \
> +		__func__, __LINE__, ##args)
> +
> +#if defined(DEBUG)
> +
> +extern int debug;
> +
> +/* V4L2 logs */
> +#define al_v4l2_dbg(codec, level, fmt, args...)   \
> +	do {                                            \
> +		if (debug >= level)                           \
> +			dev_dbg(&(codec)->pdev->dev,                \
> +				"[ALG_V4L2] level=%d %s(),%d: " fmt "\n", \
> +				level, __func__, __LINE__, ##args);       \
> +	} while (0)
> +
> +/* Codec logs */
> +#define al_codec_dbg(codec, fmt, args...)           \
> +	do {                                              \
> +		if (debug)                                      \
> +			dev_dbg(&(codec)->pdev->dev,                  \
> +				"[ALG_CODEC] %s(),%d: " fmt "\n", __func__, \
> +				__LINE__, ##args);                          \
> +	} while (0)
> +
> +#else
> +
> +#define al_v4l2_dbg(codec, level, fmt, args...)             \
> +	do {                                                      \
> +		(void)level;                                            \
> +		dev_dbg(&(codec)->pdev->dev, "[ALG_V4L2]: " fmt "\n",   \
> +			##args);                                              \
> +	} while (0)
> +
> +#define al_codec_dbg(codec, fmt, args...)                         \
> +	dev_dbg(&(codec)->pdev->dev, "[ALG_CODEC]: " fmt "\n", ##args)
> +
> +#endif
> +
> +#define MSG_ITF_TYPE_LIMIT BIT(10)
> +
> +/* Message types host <-> mcu */
> +enum {
> +	MSG_ITF_TYPE_MCU_ALIVE = 0,
> +	MSG_ITF_TYPE_WRITE_REQ = 2,
> +	MSG_ITF_TYPE_FIRST_REQ = 1024,
> +	MSG_ITF_TYPE_NEXT_REQ,
> +	MSG_ITF_TYPE_FIRST_REPLY = 2048,
> +	MSG_ITF_TYPE_NEXT_REPLY,
> +	MSG_ITF_TYPE_ALLOC_MEM_REQ = 3072,
> +	MSG_ITF_TYPE_FREE_MEM_REQ,
> +	MSG_ITF_TYPE_ALLOC_MEM_REPLY = 4096,
> +	MSG_ITF_TYPE_FREE_MEM_REPLY,
> +	MSG_ITF_TYPE_FIRST_EVT = 5120,
> +	MSG_ITF_TYPE_NEXT_EVT = MSG_ITF_TYPE_FIRST_EVT
> +};
> +
> +struct msg_itf_header {
> +	u64 drv_ctx_hdl;
> +	u64 drv_cmd_hdl;
> +	u16 type;
> +	u16 payload_len;
> +	u16 padding[2];
> +} __packed;
> +
> +void al_codec_mb_init(struct al_codec_mb *mb, char *addr, int size, u32 magic);
> +int al_codec_msg_get_header(struct al_codec_mb *mb, struct msg_itf_header *hdr);
> +int al_codec_msg_get_data(struct al_codec_mb *mb, char *data, int len);
> +int al_codec_msg_send(struct al_codec_mb *mb, struct msg_itf_header *hdr,
> +		      void (*trigger)(void *), void *trigger_arg);
> +
> +static inline bool is_type_reply(uint16_t type)
> +{
> +	return type >= MSG_ITF_TYPE_FIRST_REPLY &&
> +	       type < MSG_ITF_TYPE_FIRST_REPLY + MSG_ITF_TYPE_LIMIT;
> +}
> +
> +static inline bool is_type_event(uint16_t type)
> +{
> +	return type >= MSG_ITF_TYPE_FIRST_EVT &&
> +	       type < MSG_ITF_TYPE_FIRST_EVT + MSG_ITF_TYPE_LIMIT;
> +}
> +
> +void al_codec_cmd_put(struct al_codec_cmd *cmd);
> +
> +struct al_codec_cmd *al_codec_cmd_create(int reply_size);
> +
> +static inline struct al_codec_cmd *al_codec_cmd_get(struct list_head *cmd_list,
> +						    uint64_t hdl)
> +{
> +	struct al_codec_cmd *cmd = NULL;
> +
> +	list_for_each_entry(cmd, cmd_list, list) {
> +		if (likely(cmd == al_phys_to_virt(hdl))) {
> +			kref_get(&cmd->refcount);
> +			break;
> +		}
> +	}
> +	return list_entry_is_head(cmd, cmd_list, list) ? NULL : cmd;
> +}
> +
> +#endif /* __AL_CODEC_UTIL__ */

