Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 739DF11E155
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2019 10:59:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725945AbfLMJ7g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Dec 2019 04:59:36 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:52397 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725793AbfLMJ7g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Dec 2019 04:59:36 -0500
Received: from [IPv6:2001:983:e9a7:1:c93c:45bd:1710:e478]
 ([IPv6:2001:983:e9a7:1:c93c:45bd:1710:e478])
        by smtp-cloud7.xs4all.net with ESMTPA
        id fhjBikjIyapzpfhjCidbfg; Fri, 13 Dec 2019 10:59:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1576231159; bh=vXSH4XiFMt+Fqv66FyIyf5fzlpWFEea358xUt95Fhng=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=l+GFreFRPlkzM9IspsukDfM6V5PvOoUfW80/DVS56msNBOxbhvoCcGOll9uDdbzd3
         GTEEKLqtlGoJn9rsBPbNhkuoRGfH/E/orkLlzzjf7a4p+rJ8vhPZqr+SFvEQC+KWYG
         iyGvXc/TjV8Dt7SwCHvN2w5yMquffbBhouQoP08EjST7Nb8Z1RDNdrdG9wZ3NGibyO
         74YNEvaL1WYWwiTu/fKernMTIw/tzcqvhQfaaMyiV06dIrY0AZbwoH9qXAW8MWeq+5
         XI0+03ynkGHykwoB0ni9Q4yRZx1UrIFGWwT/Gi6opGzO8p5SsMLX2XQiGU89WVF+On
         DymSOLXrG1kWw==
Subject: Re: [PATCH v2 4/5] media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG
 Encoder/Decoder
To:     Mirela Rabulea <mirela.rabulea@nxp.com>, mchehab@kernel.org,
        shawnguo@kernel.org, robh+dt@kernel.org
Cc:     paul.kocialkowski@bootlin.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-imx@nxp.com,
        s.hauer@pengutronix.de, aisheng.dong@nxp.com,
        daniel.baluta@nxp.com, leonard.crestez@nxp.com,
        robert.chiras@nxp.com, laurentiu.palcu@nxp.com,
        mark.rutland@arm.com, devicetree@vger.kernel.org,
        p.zabel@pengutronix.de, laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se,
        dafna.hirschfeld@collabora.com
References: <1573821286-26506-1-git-send-email-mirela.rabulea@nxp.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <2ebf7db6-50ca-04c6-2019-8e59feaab0bf@xs4all.nl>
Date:   Fri, 13 Dec 2019 10:59:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1573821286-26506-1-git-send-email-mirela.rabulea@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfHpdtNDp/RGTPHccBuBPxQ6J6CE9zVMfB2ojuorgc42IN3buCgPtCpZkI4/uMaoxP6f21TmhPrtvHFZ9vsw0OWv7QKCFuYI9QBOpg5z/PmViuDfdMJL0
 tZ5Ud85tdY6FWB/Ri302IuXjrbgfnQiodDBVwkyPix9zVP8etaKsayNRszxNREblF+15rYSGG2eoB+GXKuhG31mnbQsUEj8CNEKJ/XH4ODdFi2E46h+kIB9m
 0MUOA97epJBvaUqXx5LvJA+p2VBI+SY6DJbtnMwa+PRhdy5u7ArBRwOuawl0ouwh3hpyNhOeYIjNiwvF2aCWNfbl1r/1rhjWDKrgUR4dbq07mdsWzi/N0GWf
 blEMmWiZRthNeY3kBIDysxS0na8sY/yACy91SfSVPsPtrwKfrjRWWwPglPguUTOkTv4pcbgaNHjyu0Jfor9c8cGnmykq3gYwvyw4fyP66VTM4s+697Cpd8oo
 D0BMHbFQG0/QtKDIUKC48ZYOrsKmmQiI8kNzg+3EZi+ImC53UhArBhCEhPhh3ybJnR/jVL9VXhiMAozDMImMC96NFrPQKt2sYEZ34itavWPBd0Grz25E3tf6
 na6EGH9xZGD+Ixi1ltFOwPdvz9fViUXuTndV/p6wWYVdXPEkV275QrbDFgzf3WgKhVjD3bVCf4K0E29Aj7lR9doNO3esIYH2huQ8VCXE5AkAgDB7yBbgZeHe
 9tIXHXnv3PYYyuGuf/qvzpF0asOjux/dOIzZo8CMkAv18aeBZ05y4VvQYaoJUdHYvYXloon6hmuVCn1hq93w59wZUzMPZ/it7torq0sEbE68jgEaLsZ2giXJ
 tQej+IxChCZnHaORximIhjQOkfJ38tzcE5Q4llDYPSOTAGqf56WZi4ItZN1IGybnY+i6ObxGsg7nsa1qrNqm7CaWvAi3HJhSlmNpGbzsMrdWpXfqcGStpuLz
 p4nwJ7eUDrMdi/jGBEmlhRcYIYI9H8wtgPM1fYVB2oL8mm95
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mirela,

Can you add a sixth patch adding an entry for this driver to the MAINTAINERS
file? Don't forget to reference the bindings document as well.

Philipp, do you think this driver should use the jpeg helpers? Should I
wait for the v2 of the helpers and then Mirela can make a v3 that uses
the helpers?

More comments on this driver below:

On 11/15/19 1:34 PM, Mirela Rabulea wrote:
> V4L2 driver for the JPEG encoder/decoder from i.MX8QXP/i.MX8QM application
> processors.
> The multi-planar buffers API is used.
> 
> Baseline and extended sequential jpeg decoding is supported.
> Progressive jpeg decoding is not supported by the IP.
> Supports encode and decode of various formats:
>      YUV444, YUV422, YUV420, RGB, ARGB, Gray
> YUV420 is the only multi-planar format supported.
> Minimum resolution is 64 x 64, maximum 8192 x 8192.
> The alignment requirements for the resolution depend on the format,
> multiple of 16 resolutions should work for all formats.
> 
> v4l2-compliance tests are passing, including the
> streaming tests, "v4l2-compliance -s"
> 
> Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> ---
> Changes in v2:
> Fix v4l2-compliance streaming tests, "v4l2-compliance -s"
> --------------------------------
> Fail #1:
> fail: v4l2-test-buffers.cpp(254): g_field() == V4L2_FIELD_ANY
> fail: v4l2-test-buffers.cpp(1266): buf.qbuf(node)
> test MMAP (no poll): FAIL
> 
> Fix #1 inspired by:
> commit ab7afaf33275 ("media: vim2m: add buf_out_validate callback")
> --------------------------------
> Fail #2:
> Video Output Multiplanar:
>    fail: v4l2-test-buffers.cpp(421):
>      !g_timestamp().tv_sec && !g_timestamp().tv_usec
>    fail: v4l2-test-buffers.cpp(1066): buf.check(m2m_q, last_m2m_seq, true)
>    fail: v4l2-test-buffers.cpp(1351): captureBufs(node, node_m2m_cap, q,
>       m2m_q, frame_count, pollmode, capture_count)
>    test MMAP (no poll): FAIL
> 
> Fix #2:
> use v4l2_m2m_buf_copy_metadata to set a timestamp on the capture buffer
> --------------------------------
> Fail #3:
> v4l2-compliance streaming tests stuck on dqbuf
> The IP reported config error on the first frame due to
> 0x0 resolution, and on the second frame, it got stuck
> trying to encode another 0x0 (this should not happen,
> as the IP is reset after error, need to investigate).
> 
> Fix #3:
> Initialize w_adjusted/h_adjusted in mxc_jpeg_set_default_params.
> --------------------------------
> Fail #4:
>   fail: v4l2-test-buffers.cpp(423): (int)g_sequence() < seq.last_seq + 1
>   fail: v4l2-test-buffers.cpp(992): buf.check(q, last_seq)
>   fail: v4l2-test-buffers.cpp(1364): captureBufs(node, node_m2m_cap,
>         q, m2m_q, frame_count, pollmode, capture_count)
> test MMAP (no poll): FAIL
> 
> Fix #4:
> set the sequence field of the src/dst buffers,
> and add a sequence field to the mxc_jpeg_q_data.
> Reset the sequence field on the out/cap queue to 0
> when we start streaming.
> --------------------------------
> Fail #5:
>   fail: v4l2-test-buffers.cpp(1492): ret && ret != ENOTTY
>   fail: v4l2-test-buffers.cpp(1580): setupUserPtr(node, q)
> test USERPTR (no poll): FAIL
>   fail: v4l2-test-buffers.cpp(1492): ret && ret != ENOTTY
>   fail: v4l2-test-buffers.cpp(1580): setupUserPtr(node, q)
> test USERPTR (select): FAIL
> 
> In the vb2_dc_get_userptr() function from
> drivers/media/common/videobuf2/videobuf2-dma-contig.c
> vaddr was not aligned to dma_align 128.
> 	/* Only cache aligned DMA transfers are reliable */
> 	if (!IS_ALIGNED(vaddr | size, dma_align)) {
> 		pr_debug("user data must be aligned to %lu bytes\n", dma_align);
> 		return ERR_PTR(-EINVAL);
> 	}
> 
> Fix #5:
> the hardware requires DMA contig memory for the buffers
> and descriptors, so don't support USERPTR buffers.
> --------------------------------
> 
>  drivers/media/platform/Kconfig                |    2 +
>  drivers/media/platform/Makefile               |    1 +
>  drivers/media/platform/imx-jpeg/Kconfig       |   10 +
>  drivers/media/platform/imx-jpeg/Makefile      |    3 +
>  drivers/media/platform/imx-jpeg/mxc-jpeg-hw.c |  168 ++
>  drivers/media/platform/imx-jpeg/mxc-jpeg-hw.h |  140 ++
>  drivers/media/platform/imx-jpeg/mxc-jpeg.c    | 2293 +++++++++++++++++++++++++
>  drivers/media/platform/imx-jpeg/mxc-jpeg.h    |  188 ++
>  8 files changed, 2805 insertions(+)
>  create mode 100644 drivers/media/platform/imx-jpeg/Kconfig
>  create mode 100644 drivers/media/platform/imx-jpeg/Makefile
>  create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg-hw.c
>  create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg-hw.h
>  create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg.c
>  create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg.h
> 
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index e84f35d..629770d 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -198,6 +198,8 @@ config VIDEO_IMX_PXP
>  	  The i.MX Pixel Pipeline is a memory-to-memory engine for scaling,
>  	  color space conversion, and rotation.
>  
> +source "drivers/media/platform/imx-jpeg/Kconfig"
> +
>  config VIDEO_MEDIATEK_JPEG
>  	tristate "Mediatek JPEG Codec driver"
>  	depends on MTK_IOMMU_V1 || COMPILE_TEST
> diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
> index d13db96..506310f 100644
> --- a/drivers/media/platform/Makefile
> +++ b/drivers/media/platform/Makefile
> @@ -25,6 +25,7 @@ obj-$(CONFIG_VIDEO_MX2_EMMAPRP)		+= mx2_emmaprp.o
>  obj-$(CONFIG_VIDEO_CODA)		+= coda/
>  
>  obj-$(CONFIG_VIDEO_IMX_PXP)		+= imx-pxp.o
> +obj-$(CONFIG_VIDEO_IMX8_JPEG)		+= imx-jpeg/
>  
>  obj-$(CONFIG_VIDEO_SH_VEU)		+= sh_veu.o
>  
> diff --git a/drivers/media/platform/imx-jpeg/Kconfig b/drivers/media/platform/imx-jpeg/Kconfig
> new file mode 100644
> index 0000000..7cc89e5
> --- /dev/null
> +++ b/drivers/media/platform/imx-jpeg/Kconfig
> @@ -0,0 +1,10 @@
> +# SPDX-License-Identifier: GPL-2.0
> +config VIDEO_IMX8_JPEG
> +	tristate "IMX8 JPEG Encoder/Decoder"
> +	depends on VIDEO_DEV && VIDEO_V4L2
> +	select VIDEOBUF2_DMA_CONTIG
> +	select V4L2_MEM2MEM_DEV
> +	default m
> +	help
> +	  This is a video4linux2 driver for the i.MX8 QXP/QM integrated
> +	  JPEG encoder/decoder.
> diff --git a/drivers/media/platform/imx-jpeg/Makefile b/drivers/media/platform/imx-jpeg/Makefile
> new file mode 100644
> index 0000000..bf19c82
> --- /dev/null
> +++ b/drivers/media/platform/imx-jpeg/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +mxc-jpeg-encdec-objs := mxc-jpeg-hw.o mxc-jpeg.o
> +obj-$(CONFIG_VIDEO_IMX8_JPEG) += mxc-jpeg-encdec.o
> diff --git a/drivers/media/platform/imx-jpeg/mxc-jpeg-hw.c b/drivers/media/platform/imx-jpeg/mxc-jpeg-hw.c
> new file mode 100644
> index 0000000..29c604b
> --- /dev/null
> +++ b/drivers/media/platform/imx-jpeg/mxc-jpeg-hw.c
> @@ -0,0 +1,168 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * i.MX8QXP/i.MX8QM JPEG encoder/decoder v4l2 driver
> + *
> + * Copyright 2018-2019 NXP
> + */
> +
> +#include <linux/delay.h>
> +#include <media/videobuf2-core.h>
> +#include "mxc-jpeg-hw.h"
> +
> +#define print_wrapper_reg(dev, base_address, reg_offset)\
> +		internal_print_wrapper_reg(dev, (base_address), #reg_offset,\
> +					   (reg_offset))
> +#define internal_print_wrapper_reg(dev, base_address, reg_name, reg_offset) {\
> +		int val;\
> +		val = readl((base_address) + (reg_offset));\
> +		dev_dbg(dev, "Wrapper reg %s = 0x%x\n", reg_name, val);\
> +}
> +
> +void print_descriptor_info(struct device *dev, struct mxc_jpeg_desc *desc)
> +{
> +	dev_dbg(dev, " MXC JPEG NEXT_DESCPT_PTR 0x%x\n",
> +		desc->next_descpt_ptr);
> +	dev_dbg(dev, " MXC JPEG BUF_BASE0 0x%x\n", desc->buf_base0);
> +	dev_dbg(dev, " MXC JPEG BUF_BASE1 0x%x\n", desc->buf_base1);
> +	dev_dbg(dev, " MXC JPEG LINE_PITCH %d\n", desc->line_pitch);
> +	dev_dbg(dev, " MXC JPEG STM_BUFBASE 0x%x\n", desc->stm_bufbase);
> +	dev_dbg(dev, " MXC JPEG STM_BUFSIZE %d\n", desc->stm_bufsize);
> +	dev_dbg(dev, " MXC JPEG IMGSIZE %x (%d x %d)\n", desc->imgsize,
> +		desc->imgsize >> 16, desc->imgsize & 0xFFFF);
> +	dev_dbg(dev, " MXC JPEG STM_CTRL 0x%x\n", desc->stm_ctrl);
> +}
> +
> +void print_cast_status(struct device *dev, void __iomem *reg,
> +		       unsigned int mode)
> +{
> +	dev_dbg(dev, "CAST IP status regs:\n");
> +	print_wrapper_reg(dev, reg, CAST_STATUS0);
> +	print_wrapper_reg(dev, reg, CAST_STATUS1);
> +	print_wrapper_reg(dev, reg, CAST_STATUS2);
> +	print_wrapper_reg(dev, reg, CAST_STATUS3);
> +	print_wrapper_reg(dev, reg, CAST_STATUS4);
> +	print_wrapper_reg(dev, reg, CAST_STATUS5);
> +	print_wrapper_reg(dev, reg, CAST_STATUS6);
> +	print_wrapper_reg(dev, reg, CAST_STATUS7);
> +	print_wrapper_reg(dev, reg, CAST_STATUS8);
> +	print_wrapper_reg(dev, reg, CAST_STATUS9);
> +	print_wrapper_reg(dev, reg, CAST_STATUS10);
> +	print_wrapper_reg(dev, reg, CAST_STATUS11);
> +	print_wrapper_reg(dev, reg, CAST_STATUS12);
> +	print_wrapper_reg(dev, reg, CAST_STATUS13);
> +	if (mode == MXC_JPEG_DECODE)
> +		return;
> +	print_wrapper_reg(dev, reg, CAST_STATUS14);
> +	print_wrapper_reg(dev, reg, CAST_STATUS15);
> +	print_wrapper_reg(dev, reg, CAST_STATUS16);
> +	print_wrapper_reg(dev, reg, CAST_STATUS17);
> +	print_wrapper_reg(dev, reg, CAST_STATUS18);
> +	print_wrapper_reg(dev, reg, CAST_STATUS19);
> +}
> +
> +void print_wrapper_info(struct device *dev, void __iomem *reg)
> +{
> +	dev_dbg(dev, "Wrapper regs:\n");
> +	print_wrapper_reg(dev, reg, GLB_CTRL);
> +	print_wrapper_reg(dev, reg, COM_STATUS);
> +	print_wrapper_reg(dev, reg, BUF_BASE0);
> +	print_wrapper_reg(dev, reg, BUF_BASE1);
> +	print_wrapper_reg(dev, reg, LINE_PITCH);
> +	print_wrapper_reg(dev, reg, STM_BUFBASE);
> +	print_wrapper_reg(dev, reg, STM_BUFSIZE);
> +	print_wrapper_reg(dev, reg, IMGSIZE);
> +	print_wrapper_reg(dev, reg, STM_CTRL);
> +}
> +
> +void mxc_jpeg_enable_irq(void __iomem *reg, int slot)
> +{
> +	writel(0xFFFFFFFF, reg + MXC_SLOT_OFFSET(slot, SLOT_IRQ_EN));
> +}
> +
> +void mxc_jpeg_sw_reset(void __iomem *reg)
> +{
> +	/*
> +	 * engine soft reset, internal state machine reset
> +	 * this will not reset registers, however, it seems
> +	 * the registers may remain inconsistent with the internal state
> +	 * so, on purpose, at least let GLB_CTRL bits clear after this reset
> +	 */
> +	writel(GLB_CTRL_SFT_RST, reg + GLB_CTRL);
> +}
> +
> +void mxc_jpeg_enc_mode_conf(struct device *dev, void __iomem *reg)
> +{
> +	dev_dbg(dev, "CAST Encoder CONFIG...\n");
> +	/*
> +	 * "Config_Mode" enabled, "Config_Mode auto clear enabled",
> +	 */
> +	writel(0xa0, reg + CAST_MODE);
> +
> +	/* all markers and segments */
> +	writel(0x3ff, reg + CAST_CFG_MODE);
> +
> +	/* quality factor */
> +	writel(0x4b, reg + CAST_QUALITY);
> +}
> +
> +void mxc_jpeg_enc_mode_go(struct device *dev, void __iomem *reg)
> +{
> +	dev_dbg(dev, "CAST Encoder GO...\n");
> +	/*
> +	 * "GO" enabled, "GO bit auto clear" enabled
> +	 */
> +	writel(0x140, reg + CAST_MODE);
> +}
> +
> +void mxc_jpeg_dec_mode_go(struct device *dev, void __iomem *reg)
> +{
> +	dev_dbg(dev, "CAST Decoder GO...\n");
> +	writel(MXC_DEC_EXIT_IDLE_MODE, reg + CAST_CTRL);
> +}
> +
> +int mxc_jpeg_enable(void __iomem *reg)
> +{
> +	u32 regval;
> +
> +	writel(GLB_CTRL_JPG_EN, reg + GLB_CTRL);
> +	regval = readl(reg);
> +	return regval;
> +}
> +
> +void mxc_jpeg_enable_slot(void __iomem *reg, int slot)
> +{
> +	u32 regval;
> +
> +	regval = readl(reg + GLB_CTRL);
> +	writel(GLB_CTRL_SLOT_EN(slot) | regval, reg + GLB_CTRL);
> +}
> +
> +void mxc_jpeg_set_l_endian(void __iomem *reg, int le)
> +{
> +	u32 regval;
> +
> +	regval = readl(reg + GLB_CTRL);
> +	regval &= ~GLB_CTRL_L_ENDIAN(1); /* clear */
> +	writel(GLB_CTRL_L_ENDIAN(le) | regval, reg + GLB_CTRL); /* set */
> +}
> +
> +void mxc_jpeg_set_bufsize(struct mxc_jpeg_desc *desc,  u32 bufsize)
> +{
> +	desc->stm_bufsize = bufsize;
> +}
> +
> +void mxc_jpeg_set_res(struct mxc_jpeg_desc *desc, u16 w, u16 h)
> +{
> +	desc->imgsize = w << 16 | h;
> +}
> +
> +void mxc_jpeg_set_line_pitch(struct mxc_jpeg_desc *desc, u32 line_pitch)
> +{
> +	desc->line_pitch = line_pitch;
> +}
> +
> +void mxc_jpeg_set_desc(u32 desc, void __iomem *reg, int slot)
> +{
> +	writel(desc | MXC_NXT_DESCPT_EN,
> +	       reg + MXC_SLOT_OFFSET(slot, SLOT_NXT_DESCPT_PTR));
> +}
> diff --git a/drivers/media/platform/imx-jpeg/mxc-jpeg-hw.h b/drivers/media/platform/imx-jpeg/mxc-jpeg-hw.h
> new file mode 100644
> index 0000000..ae70d3a
> --- /dev/null
> +++ b/drivers/media/platform/imx-jpeg/mxc-jpeg-hw.h
> @@ -0,0 +1,140 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * i.MX8QXP/i.MX8QM JPEG encoder/decoder v4l2 driver
> + *
> + * Copyright 2018-2019 NXP
> + */
> +
> +#ifndef _MXC_JPEG_HW_H
> +#define _MXC_JPEG_HW_H
> +
> +/* JPEG Decoder/Encoder Wrapper Register Map */
> +#define GLB_CTRL			0x0
> +#define COM_STATUS			0x4
> +#define BUF_BASE0			0x14
> +#define BUF_BASE1			0x18
> +#define LINE_PITCH			0x1C
> +#define STM_BUFBASE			0x20
> +#define STM_BUFSIZE			0x24
> +#define IMGSIZE				0x28
> +#define STM_CTRL			0x2C
> +
> +/* CAST JPEG-Decoder/Encoder Status Register Map (read-only)*/
> +#define CAST_STATUS0			0x100
> +#define CAST_STATUS1			0x104
> +#define CAST_STATUS2			0x108
> +#define CAST_STATUS3			0x10c
> +#define CAST_STATUS4			0x110
> +#define CAST_STATUS5			0x114
> +#define CAST_STATUS6			0x118
> +#define CAST_STATUS7			0x11c
> +#define CAST_STATUS8			0x120
> +#define CAST_STATUS9			0x124
> +#define CAST_STATUS10			0x128
> +#define CAST_STATUS11			0x12c
> +#define CAST_STATUS12			0x130
> +#define CAST_STATUS13			0x134
> +/* the following are for encoder only */
> +#define CAST_STATUS14		0x138
> +#define CAST_STATUS15		0x13c
> +#define CAST_STATUS16		0x140
> +#define CAST_STATUS17		0x144
> +#define CAST_STATUS18		0x148
> +#define CAST_STATUS19		0x14c
> +
> +/* CAST JPEG-Decoder Control Register Map (write-only) */
> +#define CAST_CTRL			CAST_STATUS13
> +
> +/* CAST JPEG-Encoder Control Register Map (write-only) */
> +#define CAST_MODE			CAST_STATUS0
> +#define CAST_CFG_MODE			CAST_STATUS1
> +#define CAST_QUALITY			CAST_STATUS2
> +#define CAST_RSVD			CAST_STATUS3
> +#define CAST_REC_REGS_SEL		CAST_STATUS4
> +#define CAST_LUMTH			CAST_STATUS5
> +#define CAST_CHRTH			CAST_STATUS6
> +#define CAST_NOMFRSIZE_LO		CAST_STATUS7
> +#define CAST_NOMFRSIZE_HI		CAST_STATUS8
> +#define CAST_OFBSIZE_LO			CAST_STATUS9
> +#define CAST_OFBSIZE_HI			CAST_STATUS10
> +
> +#define MXC_MAX_SLOTS	1 /* TODO use all 4 slots*/
> +/* JPEG-Decoder Wrapper Slot Registers 0..3 */
> +#define SLOT_BASE			0x10000
> +#define SLOT_STATUS			0x0
> +#define SLOT_IRQ_EN			0x4
> +#define SLOT_BUF_PTR			0x8
> +#define SLOT_CUR_DESCPT_PTR		0xC
> +#define SLOT_NXT_DESCPT_PTR		0x10
> +#define MXC_SLOT_OFFSET(slot, offset)	((SLOT_BASE * ((slot) + 1)) + (offset))
> +
> +/* GLB_CTRL fields */
> +#define GLB_CTRL_JPG_EN					0x1
> +#define GLB_CTRL_SFT_RST				(0x1 << 1)
> +#define GLB_CTRL_DEC_GO					(0x1 << 2)
> +#define GLB_CTRL_L_ENDIAN(le)				((le) << 3)
> +#define GLB_CTRL_SLOT_EN(slot)				(0x1 << ((slot) + 4))
> +
> +/* COM_STAUS fields */
> +#define COM_STATUS_DEC_ONGOING(r)		(((r) & (1 << 31)) >> 31)
> +#define COM_STATUS_CUR_SLOT(r)			(((r) & (0x3 << 29)) >> 29)
> +
> +/* STM_CTRL fields */
> +#define STM_CTRL_PIXEL_PRECISION		(0x1 << 2)
> +#define STM_CTRL_IMAGE_FORMAT(img_fmt)		((img_fmt) << 3)
> +#define STM_CTRL_IMAGE_FORMAT_MASK		(0xF << 3)
> +#define STM_CTRL_BITBUF_PTR_CLR(clr)		((clr) << 7)
> +#define STM_CTRL_AUTO_START(go)			((go) << 8)
> +#define STM_CTRL_CONFIG_MOD(mod)		((mod) << 9)
> +
> +/* SLOT_STATUS fields for slots 0..3 */
> +#define SLOT_STATUS_FRMDONE			(0x1 << 3)
> +#define SLOT_STATUS_ENC_CONFIG_ERR		(0x1 << 8)
> +
> +/* SLOT_IRQ_EN fields TBD */
> +
> +#define MXC_NXT_DESCPT_EN			0x1
> +#define MXC_DEC_EXIT_IDLE_MODE			0x4
> +
> +/* JPEG-Decoder Wrapper - STM_CTRL Register Fields */
> +#define MXC_PIXEL_PRECISION(precision) ((precision) / 8 << 2)
> +enum mxc_jpeg_image_format {
> +	MXC_JPEG_INVALID = -1,
> +	MXC_JPEG_YUV420 = 0x0, /* 2 Plannar, Y=1st plane UV=2nd plane */
> +	MXC_JPEG_YUV422 = 0x1, /* 1 Plannar, YUYV sequence */
> +	MXC_JPEG_RGB	= 0x2, /* RGBRGB packed format */
> +	MXC_JPEG_YUV444	= 0x3, /* 1 Plannar, YUVYUV sequence */
> +	MXC_JPEG_GRAY = 0x4, /* Y8 or Y12 or Single Component */
> +	MXC_JPEG_RESERVED = 0x5,
> +	MXC_JPEG_ARGB	= 0x6,
> +};
> +
> +#include "mxc-jpeg.h"
> +void print_descriptor_info(struct device *dev, struct mxc_jpeg_desc *desc);
> +void print_cast_status(struct device *dev, void __iomem *reg,
> +		       unsigned int mode);
> +void print_wrapper_info(struct device *dev, void __iomem *reg);
> +void mxc_jpeg_sw_reset(void __iomem *reg);
> +int mxc_jpeg_enable(void __iomem *reg);
> +void wait_frmdone(struct device *dev, void __iomem *reg);
> +void mxc_jpeg_enc_mode_conf(struct device *dev, void __iomem *reg);
> +void mxc_jpeg_enc_mode_go(struct device *dev, void __iomem *reg);
> +void mxc_jpeg_dec_mode_go(struct device *dev, void __iomem *reg);
> +int mxc_jpeg_get_slot(void __iomem *reg);
> +u32 mxc_jpeg_get_offset(void __iomem *reg, int slot);
> +void mxc_jpeg_enable_slot(void __iomem *reg, int slot);
> +void mxc_jpeg_set_l_endian(void __iomem *reg, int le);
> +void mxc_jpeg_enable_irq(void __iomem *reg, int slot);
> +int mxc_jpeg_set_input(void __iomem *reg, u32 in_buf, u32 bufsize);
> +int mxc_jpeg_set_output(void __iomem *reg, u16 out_pitch, u32 out_buf,
> +			u16 w, u16 h);
> +void mxc_jpeg_set_config_mode(void __iomem *reg, int config_mode);
> +int mxc_jpeg_set_params(struct mxc_jpeg_desc *desc,  u32 bufsize, u16
> +			out_pitch, u32 format);
> +void mxc_jpeg_set_bufsize(struct mxc_jpeg_desc *desc,  u32 bufsize);
> +void mxc_jpeg_set_res(struct mxc_jpeg_desc *desc, u16 w, u16 h);
> +void mxc_jpeg_set_line_pitch(struct mxc_jpeg_desc *desc, u32 line_pitch);
> +void mxc_jpeg_set_desc(u32 desc, void __iomem *reg, int slot);
> +void mxc_jpeg_set_regs_from_desc(struct mxc_jpeg_desc *desc,
> +				 void __iomem *reg);
> +#endif
> diff --git a/drivers/media/platform/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/imx-jpeg/mxc-jpeg.c
> new file mode 100644
> index 0000000..c7d2f62
> --- /dev/null
> +++ b/drivers/media/platform/imx-jpeg/mxc-jpeg.c
> @@ -0,0 +1,2293 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * V4L2 driver for the JPEG encoder/decoder from i.MX8QXP/i.MX8QM application
> + * processors.
> + *
> + * The multi-planar buffers API is used.
> + *
> + * Baseline and extended sequential jpeg decoding is supported.
> + * Progressive jpeg decoding is not supported by the IP.
> + * Supports encode and decode of various formats:
> + *     YUV444, YUV422, YUV420, RGB, ARGB, Gray
> + * YUV420 is the only multi-planar format supported.
> + * Minimum resolution is 64 x 64, maximum 8192 x 8192.
> + * To achieve 8192 x 8192, modify in defconfig: CONFIG_CMA_SIZE_MBYTES=320
> + * The alignment requirements for the resolution depend on the format,
> + * multiple of 16 resolutions should work for all formats.
> + * Special workarounds are made in the driver to support NV12 1080p.
> + * When decoding, the driver detects image resolution and pixel format
> + * from the jpeg stream, by parsing the jpeg markers.
> + *
> + * The IP has 4 slots available for context switching, but only slot 0
> + * was fully tested to work. Context switching is not used by the driver.
> + * Each driver instance (context) allocates a slot for itself, but this
> + * is postponed until device_run, to allow unlimited opens.
> + *
> + * The driver submits jobs to the IP by setting up a descriptor for the
> + * used slot, and then validating it. The encoder has an additional descriptor
> + * for the configuration phase. The driver expects FRM_DONE interrupt from
> + * IP to mark the job as finished.
> + *
> + * The decoder IP has some limitations regarding the component ID's,
> + * but the driver works around this by replacing them in the jpeg stream.
> + *
> + * A module parameter is available for debug purpose (jpeg_tracing), to enable
> + * it, enable dynamic debug for this module and:
> + * echo 1 > /sys/module/mxc_jpeg_encdec/parameters/jpeg_tracing
> + *
> + * This is inspired by the drivers/media/platform/s5p-jpeg driver
> + *
> + * Copyright 2018-2019 NXP
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/io.h>
> +#include <linux/clk.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/irqreturn.h>
> +#include <linux/interrupt.h>
> +#include <linux/pm_domain.h>
> +#include <linux/string.h>
> +
> +#include <media/v4l2-mem2mem.h>
> +#include <media/v4l2-ioctl.h>
> +#include <media/v4l2-common.h>
> +#include <media/v4l2-event.h>
> +#include <media/videobuf2-dma-contig.h>
> +
> +#include "mxc-jpeg-hw.h"
> +#include "mxc-jpeg.h"
> +
> +static struct mxc_jpeg_fmt mxc_formats[] = {
> +	{
> +		.name		= "JPEG",
> +		.fourcc		= V4L2_PIX_FMT_JPEG,
> +		.colplanes	= 1,
> +		.flags		= MXC_JPEG_FMT_TYPE_ENC,
> +	},
> +	{
> +		.name		= "RGB", /*RGBRGB packed format*/

Add a space after/before /* and */

> +		.fourcc		= V4L2_PIX_FMT_RGB24,
> +		.depth		= 24,
> +		.colplanes	= 1,
> +		.h_align	= 3,
> +		.v_align	= 3,
> +		.flags		= MXC_JPEG_FMT_TYPE_RAW,
> +	},
> +	{
> +		.name		= "ARGB", /* ARGBARGB packed format */
> +		.fourcc		= V4L2_PIX_FMT_ARGB32,
> +		.depth		= 32,
> +		.colplanes	= 1,
> +		.h_align	= 3,
> +		.v_align	= 3,
> +		.flags		= MXC_JPEG_FMT_TYPE_RAW,
> +	},
> +	{
> +		.name		= "YUV420", /* 1st plane = Y, 2nd plane = UV */
> +		.fourcc		= V4L2_PIX_FMT_NV12,
> +		.depth		= 12, /* 6 bytes (4Y + UV) for 4 pixels */
> +		.colplanes	= 2, /* 1 plane Y, 1 plane UV interleaved */
> +		.h_align	= 4,
> +		.v_align	= 4,
> +		.flags		= MXC_JPEG_FMT_TYPE_RAW,
> +	},
> +	{
> +		.name		= "YUV422", /* YUYV */
> +		.fourcc		= V4L2_PIX_FMT_YUYV,
> +		.depth		= 16,
> +		.colplanes	= 1,
> +		.h_align	= 4,
> +		.v_align	= 3,
> +		.flags		= MXC_JPEG_FMT_TYPE_RAW,
> +	},
> +	{
> +		.name		= "YUV444", /* YUVYUV */
> +		.fourcc		= V4L2_PIX_FMT_YUV24,
> +		.depth		= 24,
> +		.colplanes	= 1,
> +		.h_align	= 3,
> +		.v_align	= 3,
> +		.flags		= MXC_JPEG_FMT_TYPE_RAW,
> +	},
> +	{
> +		.name		= "Gray", /* Gray (Y8/Y12) or Single Comp */
> +		.fourcc		= V4L2_PIX_FMT_GREY,
> +		.depth		= 8,
> +		.colplanes	= 1,
> +		.h_align	= 3,
> +		.v_align	= 3,
> +		.flags		= MXC_JPEG_FMT_TYPE_RAW,
> +	},
> +};
> +
> +#define MXC_JPEG_NUM_FORMATS ARRAY_SIZE(mxc_formats)
> +
> +static const struct of_device_id mxc_jpeg_match[] = {
> +	{
> +		.compatible = "fsl,imx8-jpgdec",
> +		.data       = (void *)MXC_JPEG_DECODE,
> +	},
> +	{
> +		.compatible = "fsl,imx8-jpgenc",
> +		.data       = (void *)MXC_JPEG_ENCODE,
> +	},
> +	{ },
> +};
> +
> +/*
> + * default configuration stream, 64x64 yuv422
> + * split by JPEG marker, so it's easier to modify & use
> + */
> +static const unsigned char jpeg_soi[] = {0xFF, 0xD8};
> +static const unsigned char jpeg_app0[] = {0xFF, 0xE0,
> +0x00, 0x10, 0x4A, 0x46, 0x49, 0x46, 0x00,
> +0x01, 0x01, 0x00, 0x00, 0x01, 0x00, 0x01,
> +0x00, 0x00};
> +static const unsigned char jpeg_app14[] = {0xFF, 0xEE,
> +0x00, 0x0E, 0x41, 0x64, 0x6F, 0x62, 0x65,
> +0x00, 0x64, 0x00, 0x00, 0x00, 0x00, 0x00};
> +static const unsigned char jpeg_dqt[] = {0xFF, 0xDB,
> +0x00, 0x84, 0x00, 0x10, 0x0B, 0x0C, 0x0E,
> +0x0C, 0x0A, 0x10, 0x0E, 0x0D, 0x0E, 0x12,
> +0x11, 0x10, 0x13, 0x18, 0x28, 0x1A, 0x18,
> +0x16, 0x16, 0x18, 0x31, 0x23, 0x25, 0x1D,
> +0x28, 0x3A, 0x33, 0x3D, 0x3C, 0x39, 0x33,
> +0x38, 0x37, 0x40, 0x48, 0x5C, 0x4E, 0x40,
> +0x44, 0x57, 0x45, 0x37, 0x38, 0x50, 0x6D,
> +0x51, 0x57, 0x5F, 0x62, 0x67, 0x68, 0x67,
> +0x3E, 0x4D, 0x71, 0x79, 0x70, 0x64, 0x78,
> +0x5C, 0x65, 0x67, 0x63, 0x01, 0x11, 0x12,
> +0x12, 0x18, 0x15, 0x18, 0x2F, 0x1A, 0x1A,
> +0x2F, 0x63, 0x42, 0x38, 0x42, 0x63, 0x63,
> +0x63, 0x63, 0x63, 0x63, 0x63, 0x63, 0x63,
> +0x63, 0x63, 0x63, 0x63, 0x63, 0x63, 0x63,
> +0x63, 0x63, 0x63, 0x63, 0x63, 0x63, 0x63,
> +0x63, 0x63, 0x63, 0x63, 0x63, 0x63, 0x63,
> +0x63, 0x63, 0x63, 0x63, 0x63, 0x63, 0x63,
> +0x63, 0x63, 0x63, 0x63, 0x63, 0x63, 0x63,
> +0x63, 0x63, 0x63, 0x63, 0x63, 0x63};
> +static const unsigned char jpeg_sof_maximal[] = {0xFF, 0xC0,
> +0x00, 0x14, 0x08, 0x00, 0x40, 0x00, 0x40,
> +0x04, 0x01, 0x11, 0x00, 0x02, 0x11, 0x01,
> +0x03, 0x11, 0x01, 0x04, 0x11, 0x01};
> +static const unsigned char jpeg_dht[] = {0xFF, 0xC4,
> +0x01, 0xA2, 0x00, 0x00, 0x01, 0x05, 0x01,
> +0x01, 0x01, 0x01, 0x01, 0x01, 0x00, 0x00,
> +0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01,
> +0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08,
> +0x09, 0x0A, 0x0B, 0x10, 0x00, 0x02, 0x01,
> +0x03, 0x03, 0x02, 0x04, 0x03, 0x05, 0x05,
> +0x04, 0x04, 0x00, 0x00, 0x01, 0x7D, 0x01,
> +0x02, 0x03, 0x00, 0x04, 0x11, 0x05, 0x12,
> +0x21, 0x31, 0x41, 0x06, 0x13, 0x51, 0x61,
> +0x07, 0x22, 0x71, 0x14, 0x32, 0x81, 0x91,
> +0xA1, 0x08, 0x23, 0x42, 0xB1, 0xC1, 0x15,
> +0x52, 0xD1, 0xF0, 0x24, 0x33, 0x62, 0x72,
> +0x82, 0x09, 0x0A, 0x16, 0x17, 0x18, 0x19,
> +0x1A, 0x25, 0x26, 0x27, 0x28, 0x29, 0x2A,
> +0x34, 0x35, 0x36, 0x37, 0x38, 0x39, 0x3A,
> +0x43, 0x44, 0x45, 0x46, 0x47, 0x48, 0x49,
> +0x4A, 0x53, 0x54, 0x55, 0x56, 0x57, 0x58,
> +0x59, 0x5A, 0x63, 0x64, 0x65, 0x66, 0x67,
> +0x68, 0x69, 0x6A, 0x73, 0x74, 0x75, 0x76,
> +0x77, 0x78, 0x79, 0x7A, 0x83, 0x84, 0x85,
> +0x86, 0x87, 0x88, 0x89, 0x8A, 0x92, 0x93,
> +0x94, 0x95, 0x96, 0x97, 0x98, 0x99, 0x9A,
> +0xA2, 0xA3, 0xA4, 0xA5, 0xA6, 0xA7, 0xA8,
> +0xA9, 0xAA, 0xB2, 0xB3, 0xB4, 0xB5, 0xB6,
> +0xB7, 0xB8, 0xB9, 0xBA, 0xC2, 0xC3, 0xC4,
> +0xC5, 0xC6, 0xC7, 0xC8, 0xC9, 0xCA, 0xD2,
> +0xD3, 0xD4, 0xD5, 0xD6, 0xD7, 0xD8, 0xD9,
> +0xDA, 0xE1, 0xE2, 0xE3, 0xE4, 0xE5, 0xE6,
> +0xE7, 0xE8, 0xE9, 0xEA, 0xF1, 0xF2, 0xF3,
> +0xF4, 0xF5, 0xF6, 0xF7, 0xF8, 0xF9, 0xFA,
> +0x01, 0x00, 0x03, 0x01, 0x01, 0x01, 0x01,
> +0x01, 0x01, 0x01, 0x01, 0x01, 0x00, 0x00,
> +0x00, 0x00, 0x00, 0x00, 0x01, 0x02, 0x03,
> +0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A,
> +0x0B, 0x11, 0x00, 0x02, 0x01, 0x02, 0x04,
> +0x04, 0x03, 0x04, 0x07, 0x05, 0x04, 0x04,
> +0x00, 0x01, 0x02, 0x77, 0x00, 0x01, 0x02,
> +0x03, 0x11, 0x04, 0x05, 0x21, 0x31, 0x06,
> +0x12, 0x41, 0x51, 0x07, 0x61, 0x71, 0x13,
> +0x22, 0x32, 0x81, 0x08, 0x14, 0x42, 0x91,
> +0xA1, 0xB1, 0xC1, 0x09, 0x23, 0x33, 0x52,
> +0xF0, 0x15, 0x62, 0x72, 0xD1, 0x0A, 0x16,
> +0x24, 0x34, 0xE1, 0x25, 0xF1, 0x17, 0x18,
> +0x19, 0x1A, 0x26, 0x27, 0x28, 0x29, 0x2A,
> +0x35, 0x36, 0x37, 0x38, 0x39, 0x3A, 0x43,
> +0x44, 0x45, 0x46, 0x47, 0x48, 0x49, 0x4A,
> +0x53, 0x54, 0x55, 0x56, 0x57, 0x58, 0x59,
> +0x5A, 0x63, 0x64, 0x65, 0x66, 0x67, 0x68,
> +0x69, 0x6A, 0x73, 0x74, 0x75, 0x76, 0x77,
> +0x78, 0x79, 0x7A, 0x82, 0x83, 0x84, 0x85,
> +0x86, 0x87, 0x88, 0x89, 0x8A, 0x92, 0x93,
> +0x94, 0x95, 0x96, 0x97, 0x98, 0x99, 0x9A,
> +0xA2, 0xA3, 0xA4, 0xA5, 0xA6, 0xA7, 0xA8,
> +0xA9, 0xAA, 0xB2, 0xB3, 0xB4, 0xB5, 0xB6,
> +0xB7, 0xB8, 0xB9, 0xBA, 0xC2, 0xC3, 0xC4,
> +0xC5, 0xC6, 0xC7, 0xC8, 0xC9, 0xCA, 0xD2,
> +0xD3, 0xD4, 0xD5, 0xD6, 0xD7, 0xD8, 0xD9,
> +0xDA, 0xE2, 0xE3, 0xE4, 0xE5, 0xE6, 0xE7,
> +0xE8, 0xE9, 0xEA, 0xF2, 0xF3, 0xF4, 0xF5,
> +0xF6, 0xF7, 0xF8, 0xF9, 0xFA};
> +static const unsigned char jpeg_dri[] = {0xFF, 0xDD,
> +0x00, 0x04, 0x00, 0x20};
> +static const unsigned char jpeg_sos_maximal[] = {0xFF, 0xDA,
> +0x00, 0x0C, 0x04, 0x01, 0x00, 0x02, 0x11, 0x03,
> +0x11, 0x04, 0x11, 0x00, 0x3F, 0x00,};
> +static const unsigned char jpeg_eoi[] = {0xFF, 0xD9};

This is all terribly formatted.

1) add space after/before { and }
2) use lowercase a-f in the hex values (kernel coding style)
3) properly indent the data, e.g.:

static const unsigned char jpeg_sos_maximal[] = {
	0xff, 0xda, 0x00, 0x0c, 0x04, 0x01, 0x00, 0x02,
	0x11, 0x03, 0x11, 0x04, 0x11, 0x00, 0x3f, 0x00,
};

static const unsigned char jpeg_eoi[] = { 0xff, 0xd9 };

> +
> +struct mxc_jpeg_src_buf {
> +	/* common v4l buffer stuff -- must be first */
> +	struct vb2_v4l2_buffer	b;
> +	struct list_head	list;
> +
> +	/* mxc-jpeg specific */
> +	bool			dht_needed;
> +};
> +
> +static inline struct mxc_jpeg_src_buf *vb2_to_mxc_buf(struct vb2_buffer *vb)
> +{
> +	return container_of(to_vb2_v4l2_buffer(vb),
> +			    struct mxc_jpeg_src_buf, b);

Fits on one line.

> +}
> +
> +/*  Print Four-character-code (FOURCC) */
> +static char *fourcc_to_str(u32 format)
> +{
> +	char *buf = kmalloc(32, GFP_KERNEL);
> +
> +	snprintf(buf, 32,
> +		 "%c%c%c%c",
> +		 format & 0xff,
> +		 (format >> 8) & 0xff,
> +		 (format >> 16) & 0xff,
> +		 (format >> 24) & 0x7f);
> +	return buf;
> +}
> +
> +static unsigned int mxc_jpeg_tracing;
> +module_param_named(jpeg_tracing, mxc_jpeg_tracing, int, 0600);
> +MODULE_PARM_DESC(jpeg_tracing, "Enable detailed debug messages");
> +
> +static void _bswap16(u16 *a)
> +{
> +	*a = ((*a & 0x00FF) << 8) | ((*a & 0xFF00) >> 8);

Lowercase hex values (I won't repeat myself, please check the source for this).

> +}
> +
> +static void print_buf_preview(struct device *dev, struct vb2_buffer *buf)
> +{
> +	unsigned char *data;
> +	u32 dma_addr;
> +
> +	if (!mxc_jpeg_tracing)
> +		return;
> +
> +	dma_addr = vb2_dma_contig_plane_dma_addr(buf, 0);
> +	data = (char *)vb2_plane_vaddr(buf, 0);
> +
> +	/* print just the first 4 bytes from the beginning of the buffer */
> +	dev_dbg(dev, "vaddr=%p dma_addr=%x: %x %x %x %x ...\n",

Use %ph

> +		data, dma_addr,
> +		data[0], data[1], data[2], data[3]);
> +}
> +
> +static void print_nbuf_to_eoi(struct device *dev, struct vb2_buffer *buf,
> +			      int n)
> +{
> +	unsigned char *data;
> +	u32 dma_addr;
> +	int i;
> +	int items_per_line = 22;
> +	char *bufstr, *bufptr;
> +
> +	if (!mxc_jpeg_tracing)
> +		return;
> +
> +	if (n == 0)
> +		n = buf->planes[0].bytesused;
> +
> +	dma_addr = vb2_dma_contig_plane_dma_addr(buf, 0);
> +	data = (unsigned char *)vb2_plane_vaddr(buf, 0);
> +
> +	dev_dbg(dev, "vaddr=%p dma_addr=%x bytesused=%d:",
> +		data, dma_addr, n);
> +
> +	bufstr = kmalloc(items_per_line * 6, GFP_ATOMIC);
> +	bufptr = bufstr;
> +	for (i = 0; i < n; i++) {
> +		snprintf(bufptr, 6, "0x%02x,", data[i]);
> +		bufptr += 5;
> +		if ((i + 1) % items_per_line == 0) {
> +			/* print the current line */
> +			dev_dbg(dev, "%s", bufstr);
> +			/* back to buffer start */
> +			bufptr = bufstr;
> +		}
> +		/* stop at End of Image (EOI) marker*/

space before */

> +		if (i > 0 && data[i - 1] == 0xFF && data[i] == 0xD9)
> +			break;
> +	}
> +	if (bufptr != bufstr)
> +		dev_dbg(dev, "%s", bufstr);
> +	dev_dbg(dev, "buffer size = %d", i);
> +	kfree(bufstr);
> +}

Is all this debugging really needed? It feels to be that this does not
belong in a kernel driver, it's more something you do while developing
the driver, but not for a final version.

> +
> +static inline struct mxc_jpeg_ctx *mxc_jpeg_fh_to_ctx(struct v4l2_fh *fh)
> +{
> +	return container_of(fh, struct mxc_jpeg_ctx, fh);
> +}
> +
> +static int enum_fmt(struct mxc_jpeg_fmt *mxc_formats, int n,
> +		    struct v4l2_fmtdesc *f, u32 type)
> +{
> +	int i, num = 0;
> +
> +	for (i = 0; i < n; ++i) {
> +		if (mxc_formats[i].flags == type) {
> +			/* index-th format of type type found ? */
> +			if (num == f->index)
> +				break;
> +			/* Correct type but haven't reached our index yet,
> +			 * just increment per-type index
> +			 */
> +			++num;
> +		}
> +	}
> +
> +	/* Format not found */
> +	if (i >= n)
> +		return -EINVAL;
> +
> +	strscpy(f->description, mxc_formats[i].name, sizeof(f->description));

Don't fill in the description, this is filled in by the V4L2 core (v4l2-ioctl.c).

> +	f->pixelformat = mxc_formats[i].fourcc;
> +
> +	return 0;
> +}
> +
> +static struct mxc_jpeg_fmt *mxc_jpeg_find_format(struct mxc_jpeg_ctx *ctx,
> +						 u32 pixelformat)
> +{
> +	unsigned int k;
> +
> +	for (k = 0; k < MXC_JPEG_NUM_FORMATS; k++) {
> +		struct mxc_jpeg_fmt *fmt = &mxc_formats[k];
> +
> +		if (fmt->fourcc == pixelformat)
> +			return fmt;
> +	}
> +	return NULL;
> +}
> +
> +static enum mxc_jpeg_image_format mxc_jpeg_fourcc_to_imgfmt(u32 fourcc)
> +{
> +	switch (fourcc) {
> +	case V4L2_PIX_FMT_GREY:
> +		return MXC_JPEG_GRAY;
> +	case V4L2_PIX_FMT_YUYV:
> +		return MXC_JPEG_YUV422;
> +	case V4L2_PIX_FMT_NV12:
> +		return MXC_JPEG_YUV420;
> +	case V4L2_PIX_FMT_YUV24:
> +		return MXC_JPEG_YUV444;
> +	case V4L2_PIX_FMT_RGB24:
> +		return MXC_JPEG_RGB;
> +	case V4L2_PIX_FMT_ARGB32:
> +		return MXC_JPEG_ARGB;
> +	default:
> +		return MXC_JPEG_INVALID;
> +	}
> +}
> +
> +static int mxc_jpeg_imgfmt_to_fourcc(enum mxc_jpeg_image_format imgfmt,
> +				     u32 *fourcc)
> +{
> +	switch (imgfmt) {
> +	case MXC_JPEG_GRAY:
> +		*fourcc = V4L2_PIX_FMT_GREY;
> +		return 0;
> +	case MXC_JPEG_YUV422:
> +		*fourcc = V4L2_PIX_FMT_YUYV;
> +		return 0;
> +	case MXC_JPEG_YUV420:
> +		*fourcc =  V4L2_PIX_FMT_NV12;
> +		return 0;
> +	case MXC_JPEG_YUV444:
> +		*fourcc =  V4L2_PIX_FMT_YUV24;
> +		return 0;
> +	case MXC_JPEG_RGB:
> +		*fourcc =  V4L2_PIX_FMT_RGB24;
> +		return 0;
> +	case MXC_JPEG_ARGB:
> +		*fourcc =  V4L2_PIX_FMT_ARGB32;
> +		return 0;
> +	default:
> +		return 1;
> +	}
> +}
> +
> +static struct mxc_jpeg_q_data *mxc_jpeg_get_q_data(struct mxc_jpeg_ctx *ctx,
> +						   enum v4l2_buf_type type)
> +{
> +	if (V4L2_TYPE_IS_OUTPUT(type))
> +		return &ctx->out_q;
> +	return &ctx->cap_q;
> +}
> +
> +static void mxc_jpeg_addrs(struct mxc_jpeg_desc *desc,
> +			   struct vb2_buffer *raw_buf,
> +			   struct vb2_buffer *jpeg_buf, int offset)
> +{
> +	int img_fmt = desc->stm_ctrl & STM_CTRL_IMAGE_FORMAT_MASK;
> +
> +	desc->buf_base0 = vb2_dma_contig_plane_dma_addr(raw_buf, 0);
> +	desc->buf_base1 = 0;
> +	if (img_fmt == STM_CTRL_IMAGE_FORMAT(MXC_JPEG_YUV420)) {
> +		WARN_ON(raw_buf->num_planes < 2);
> +		desc->buf_base1 = vb2_dma_contig_plane_dma_addr(raw_buf, 1);
> +	}
> +	desc->stm_bufbase = vb2_dma_contig_plane_dma_addr(jpeg_buf, 0) +
> +		offset;
> +}
> +
> +static void notify_eos(struct mxc_jpeg_ctx *ctx)
> +{
> +	const struct v4l2_event ev = {

Can be static const.

> +		.type = V4L2_EVENT_EOS
> +	};
> +
> +	dev_dbg(ctx->mxc_jpeg->dev, "Notify app event EOS reached");
> +	v4l2_event_queue_fh(&ctx->fh, &ev);
> +}
> +
> +static void notify_src_chg(struct mxc_jpeg_ctx *ctx)
> +{
> +	const struct v4l2_event ev = {

Ditto.

> +			.type = V4L2_EVENT_SOURCE_CHANGE,
> +			.u.src_change.changes =
> +			V4L2_EVENT_SRC_CH_RESOLUTION,
> +		};

Indent is one too far to the right.

> +
> +	dev_dbg(ctx->mxc_jpeg->dev, "Notify app event SRC_CH_RESOLUTION");
> +	v4l2_event_queue_fh(&ctx->fh, &ev);
> +}
> +
> +static int mxc_get_free_slot(struct mxc_jpeg_slot_data slot_data[], int n)
> +{
> +	int free_slot = 0;
> +
> +	while (slot_data[free_slot].used && free_slot < n)
> +		free_slot++;
> +
> +	return free_slot; /* >=n when there are no more free slots */
> +}
> +
> +static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg,
> +				     unsigned int slot)
> +{
> +	struct mxc_jpeg_desc *desc;
> +	struct mxc_jpeg_desc *cfg_desc;
> +	void *cfg_stm;
> +
> +	if (jpeg->slot_data[slot].desc)
> +		goto skip_alloc; /* already allocated, reuse it */
> +
> +	/* allocate descriptor for decoding/encoding phase */
> +	desc = dma_alloc_coherent(jpeg->dev,
> +				  sizeof(struct mxc_jpeg_desc),
> +				  &jpeg->slot_data[slot].desc_handle,
> +				  GFP_ATOMIC);
> +	if (!desc)
> +		goto err;
> +	jpeg->slot_data[slot].desc = desc;
> +
> +	/* allocate descriptor for configuration phase (encoder only) */
> +	cfg_desc = dma_alloc_coherent(jpeg->dev,
> +				      sizeof(struct mxc_jpeg_desc),
> +				      &jpeg->slot_data[slot].cfg_desc_handle,
> +				      GFP_ATOMIC);
> +	if (!cfg_desc)
> +		goto err;
> +	jpeg->slot_data[slot].cfg_desc = cfg_desc;
> +
> +	/* allocate configuration stream */
> +	cfg_stm = dma_alloc_coherent(jpeg->dev,
> +				     MXC_JPEG_MAX_CFG_STREAM,
> +				     &jpeg->slot_data[slot].cfg_stream_handle,
> +				     GFP_ATOMIC);
> +	if (!cfg_stm)
> +		goto err;
> +	jpeg->slot_data[slot].cfg_stream_vaddr = cfg_stm;
> +
> +skip_alloc:
> +	jpeg->slot_data[slot].used = true;
> +
> +	return true;
> +err:
> +	dev_err(jpeg->dev, "Could not allocate descriptors for slot %d", slot);
> +
> +	return false;
> +}
> +
> +static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg,
> +				    unsigned int slot)
> +{
> +	if (slot >= MXC_MAX_SLOTS) {
> +		dev_err(jpeg->dev, "Invalid slot %d, nothing to free.", slot);
> +		return;
> +	}
> +
> +	/* free descriptor for decoding/encoding phase */
> +	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> +			  jpeg->slot_data[slot].desc,
> +			  jpeg->slot_data[slot].desc_handle);
> +
> +	/* free descriptor for encoder configuration phase / decoder DHT */
> +	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> +			  jpeg->slot_data[slot].cfg_desc,
> +			  jpeg->slot_data[slot].cfg_desc_handle);
> +
> +	/* free configuration stream */
> +	dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
> +			  jpeg->slot_data[slot].cfg_stream_vaddr,
> +			  jpeg->slot_data[slot].cfg_stream_handle);
> +
> +	jpeg->slot_data[slot].used = false;
> +}
> +
> +static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
> +{
> +	struct mxc_jpeg_dev *jpeg = priv;
> +	struct mxc_jpeg_ctx *ctx;
> +	void __iomem *reg = jpeg->base_reg;
> +	struct device *dev = jpeg->dev;
> +	struct vb2_v4l2_buffer *src_buf, *dst_buf;
> +	struct mxc_jpeg_src_buf *jpeg_src_buf;
> +	enum vb2_buffer_state buf_state;
> +	u32 dec_ret, com_status;
> +	unsigned long payload;
> +	struct mxc_jpeg_q_data *q_data;
> +	enum v4l2_buf_type cap_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> +	unsigned int slot;
> +
> +	spin_lock(&jpeg->hw_lock);
> +
> +	com_status = readl(reg + COM_STATUS);
> +	slot = COM_STATUS_CUR_SLOT(com_status);
> +	dev_dbg(dev, "Irq %d on slot %d.\n", irq, slot);
> +
> +	ctx = v4l2_m2m_get_curr_priv(jpeg->m2m_dev);
> +	if (!ctx) {
> +		dev_err(dev,
> +			"Instance released before the end of transaction.\n");
> +		/* soft reset only resets internal state, not registers */
> +		mxc_jpeg_sw_reset(reg);
> +		/* clear all interrupts */
> +		writel(0xFFFFFFFF, reg + MXC_SLOT_OFFSET(slot, SLOT_STATUS));
> +		goto job_unlock;
> +	}
> +
> +	if (slot != ctx->slot) {
> +		/* TODO investigate when adding multi-instance support */

What do you mean with this comment? Does this driver only supports a
single instance? I.e., you can't have two encoder instances running?

> +		dev_warn(dev, "IRQ slot %d != context slot %d.\n",
> +			 slot, ctx->slot);
> +		goto job_unlock;
> +	}
> +
> +	dec_ret = readl(reg + MXC_SLOT_OFFSET(slot, SLOT_STATUS));
> +	writel(dec_ret, reg + MXC_SLOT_OFFSET(slot, SLOT_STATUS)); /* w1c */
> +
> +	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> +	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> +	jpeg_src_buf = vb2_to_mxc_buf(&src_buf->vb2_buf);
> +
> +	if (dec_ret & SLOT_STATUS_ENC_CONFIG_ERR) {
> +		u32 ret = readl(reg + CAST_STATUS12);
> +
> +		dev_err(dev, "Encoder/decoder error, status=0x%08x", ret);
> +		mxc_jpeg_sw_reset(reg);
> +		buf_state = VB2_BUF_STATE_ERROR;
> +		goto buffers_done;
> +	}
> +
> +	if (!(dec_ret & SLOT_STATUS_FRMDONE))
> +		goto job_unlock;
> +
> +	if (jpeg->mode == MXC_JPEG_ENCODE &&
> +	    ctx->enc_state == MXC_JPEG_ENC_CONF) {
> +		ctx->enc_state = MXC_JPEG_ENCODING;
> +		dev_dbg(dev, "Encoder config finished. Start encoding...\n");
> +		mxc_jpeg_enc_mode_go(dev, reg);
> +		goto job_unlock;
> +	}
> +	if (jpeg->mode == MXC_JPEG_DECODE && jpeg_src_buf->dht_needed) {
> +		jpeg_src_buf->dht_needed = false;
> +		dev_dbg(dev, "Decoder DHT cfg finished. Start decoding...\n");
> +		goto job_unlock;
> +	}
> +	if (jpeg->mode == MXC_JPEG_ENCODE) {
> +		payload = readl(reg + MXC_SLOT_OFFSET(slot, SLOT_BUF_PTR));
> +		vb2_set_plane_payload(&dst_buf->vb2_buf, 0, payload);
> +		dev_dbg(dev, "Encoding finished, payload size: %ld\n",
> +			payload);
> +	} else {
> +		q_data = mxc_jpeg_get_q_data(ctx, cap_type);
> +		payload = q_data->sizeimage[0];
> +		vb2_set_plane_payload(&dst_buf->vb2_buf, 0, payload);
> +		vb2_set_plane_payload(&dst_buf->vb2_buf, 1, 0);
> +		if (q_data->fmt->colplanes == 2) {
> +			payload = q_data->sizeimage[1];
> +			vb2_set_plane_payload(&dst_buf->vb2_buf, 1, payload);
> +		}
> +		dev_dbg(dev, "Decoding finished, payload size: %ld + %ld\n",
> +			vb2_get_plane_payload(&dst_buf->vb2_buf, 0),
> +			vb2_get_plane_payload(&dst_buf->vb2_buf, 1));
> +	}
> +
> +	/* short preview of the results */
> +	dev_dbg(dev, "src_buf preview: ");
> +	print_buf_preview(dev, &src_buf->vb2_buf);
> +	dev_dbg(dev, "dst_buf preview: ");
> +	print_buf_preview(dev, &dst_buf->vb2_buf);
> +	buf_state = VB2_BUF_STATE_DONE;
> +
> +buffers_done:
> +	jpeg->slot_data[slot].used = false; /* unused, but don't free */
> +	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> +	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> +	v4l2_m2m_buf_done(src_buf, buf_state);
> +	v4l2_m2m_buf_done(dst_buf, buf_state);
> +	spin_unlock(&jpeg->hw_lock);
> +	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
> +	return IRQ_HANDLED;
> +job_unlock:
> +	spin_unlock(&jpeg->hw_lock);
> +	return IRQ_HANDLED;
> +}
> +
> +static int mxc_jpeg_fixup_sof(struct mxc_jpeg_sof *sof,
> +			      u32 fourcc,
> +			      u16 w, u16 h)
> +{
> +	int sof_length;
> +
> +	sof->precision = 8; /* TODO allow 8/12 bit precision*/

space before */

Please check these sources for similar cases like this.

> +	sof->height = h;
> +	_bswap16(&sof->height);
> +	sof->width = w;
> +	_bswap16(&sof->width);
> +
> +	switch (fourcc) {
> +	case V4L2_PIX_FMT_NV12:
> +		sof->components_no = 3;
> +		sof->comp[0].v = 0x2;
> +		sof->comp[0].h = 0x2;
> +		break;
> +	case V4L2_PIX_FMT_YUYV:
> +		sof->components_no = 3;
> +		sof->comp[0].v = 0x1;
> +		sof->comp[0].h = 0x2;
> +		break;
> +	case V4L2_PIX_FMT_YUV24:
> +	case V4L2_PIX_FMT_RGB24:
> +	default:
> +		sof->components_no = 3;
> +		break;
> +	case V4L2_PIX_FMT_ARGB32:
> +		sof->components_no = 4;
> +		break;
> +	case V4L2_PIX_FMT_GREY:
> +		sof->components_no = 1;
> +		break;
> +	}
> +	sof_length = 8 + 3 * sof->components_no;
> +	sof->length = sof_length;
> +	_bswap16(&sof->length);
> +
> +	return sof_length; /* not swaped */

swaped -> swapped

> +}
> +
> +static int mxc_jpeg_fixup_sos(struct mxc_jpeg_sos *sos,
> +			      u32 fourcc)
> +{
> +	int sos_length;
> +	u8 *sof_u8 = (u8 *)sos;
> +
> +	switch (fourcc) {
> +	case V4L2_PIX_FMT_NV12:
> +		sos->components_no = 3;
> +		break;
> +	case V4L2_PIX_FMT_YUYV:
> +		sos->components_no = 3;
> +		break;
> +	case V4L2_PIX_FMT_YUV24:
> +	case V4L2_PIX_FMT_RGB24:
> +	default:
> +		sos->components_no = 3;
> +		break;
> +	case V4L2_PIX_FMT_ARGB32:
> +		sos->components_no = 4;
> +		break;
> +	case V4L2_PIX_FMT_GREY:
> +		sos->components_no = 1;
> +		break;
> +	}
> +	sos_length = 6 + 2 * sos->components_no;
> +	sos->length = sos_length;
> +	_bswap16(&sos->length);
> +
> +	/* SOS ignorable bytes, not so ignorable after all */
> +	sof_u8[sos_length - 1] = 0x0;
> +	sof_u8[sos_length - 2] = 0x3f;
> +	sof_u8[sos_length - 3] = 0x0;
> +
> +	return sos_length; /* not swaped */

Same here. Please check for similar typos.

> +}
> +
> +static unsigned int mxc_jpeg_setup_cfg_stream(void *cfg_stream_vaddr,
> +					      u32 fourcc,
> +					      u16 w, u16 h)
> +{
> +	unsigned int offset = 0;
> +	u8 *cfg = (u8 *)cfg_stream_vaddr;
> +	struct mxc_jpeg_sof *sof;
> +	struct mxc_jpeg_sos *sos;
> +
> +	memcpy(cfg + offset, jpeg_soi, ARRAY_SIZE(jpeg_soi));
> +	offset += ARRAY_SIZE(jpeg_soi);
> +
> +	if (fourcc == V4L2_PIX_FMT_RGB24 ||
> +	    fourcc == V4L2_PIX_FMT_ARGB32) {
> +		memcpy(cfg + offset, jpeg_app14, sizeof(jpeg_app14));
> +		offset += sizeof(jpeg_app14);
> +	} else {
> +		memcpy(cfg + offset, jpeg_app0, sizeof(jpeg_app0));
> +		offset += sizeof(jpeg_app0);
> +	}
> +
> +	memcpy(cfg + offset, jpeg_dqt, sizeof(jpeg_dqt));
> +	offset += sizeof(jpeg_dqt);
> +
> +	memcpy(cfg + offset, jpeg_sof_maximal, sizeof(jpeg_sof_maximal));
> +	offset += 2; /* skip marker ID */
> +	sof = (struct mxc_jpeg_sof *)(cfg + offset);
> +	offset += mxc_jpeg_fixup_sof(sof, fourcc, w, h);
> +
> +	memcpy(cfg + offset, jpeg_dht, sizeof(jpeg_dht));
> +	offset += sizeof(jpeg_dht);
> +
> +	memcpy(cfg + offset, jpeg_dri, sizeof(jpeg_dri));
> +	offset += sizeof(jpeg_dri);
> +
> +	memcpy(cfg + offset, jpeg_sos_maximal, sizeof(jpeg_sos_maximal));
> +	offset += 2; /* skip marker ID */
> +	sos = (struct mxc_jpeg_sos *)(cfg + offset);
> +	offset += mxc_jpeg_fixup_sos(sos, fourcc);
> +
> +	memcpy(cfg + offset, jpeg_eoi, sizeof(jpeg_eoi));
> +	offset += sizeof(jpeg_eoi);
> +
> +	return offset;
> +}
> +
> +static void mxc_jpeg_config_dec_desc(struct vb2_buffer *out_buf,
> +				     struct mxc_jpeg_ctx *ctx,
> +				     struct vb2_buffer *src_buf,
> +				     struct vb2_buffer *dst_buf)
> +{
> +	enum v4l2_buf_type cap_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> +	struct mxc_jpeg_q_data *q_data_cap;
> +	enum mxc_jpeg_image_format img_fmt;
> +	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
> +	void __iomem *reg = jpeg->base_reg;
> +	unsigned int slot = ctx->slot;
> +	struct mxc_jpeg_desc *desc = jpeg->slot_data[slot].desc;
> +	struct mxc_jpeg_desc *cfg_desc = jpeg->slot_data[slot].cfg_desc;
> +	dma_addr_t desc_handle = jpeg->slot_data[slot].desc_handle;
> +	dma_addr_t cfg_desc_handle = jpeg->slot_data[slot].cfg_desc_handle;
> +	dma_addr_t cfg_stream_handle = jpeg->slot_data[slot].cfg_stream_handle;
> +	unsigned int *cfg_size = &jpeg->slot_data[slot].cfg_stream_size;
> +	void *cfg_stream_vaddr = jpeg->slot_data[slot].cfg_stream_vaddr;
> +	struct mxc_jpeg_src_buf *jpeg_src_buf;
> +
> +	jpeg_src_buf = vb2_to_mxc_buf(src_buf);
> +
> +	/* setup the decoding descriptor */
> +	desc->next_descpt_ptr = 0; /* end of chain */
> +	q_data_cap = mxc_jpeg_get_q_data(ctx, cap_type);
> +	desc->imgsize = q_data_cap->w_adjusted << 16 | q_data_cap->h_adjusted;
> +	img_fmt = mxc_jpeg_fourcc_to_imgfmt(q_data_cap->fmt->fourcc);
> +	desc->stm_ctrl &= ~STM_CTRL_IMAGE_FORMAT(0xF); /* clear image format */
> +	desc->stm_ctrl |= STM_CTRL_IMAGE_FORMAT(img_fmt);
> +	desc->line_pitch = q_data_cap->bytesperline[0];
> +	mxc_jpeg_addrs(desc, dst_buf, src_buf, 0);
> +	mxc_jpeg_set_bufsize(desc, ALIGN(vb2_plane_size(src_buf, 0), 1024));
> +	print_descriptor_info(jpeg->dev, desc);
> +
> +	if (!jpeg_src_buf->dht_needed) {
> +		/* validate the decoding descriptor */
> +		mxc_jpeg_set_desc(desc_handle, reg, slot);
> +		return;
> +	}
> +
> +	/*
> +	 * if a default huffman table is needed, use the config descriptor to
> +	 * inject a DHT, by chaining it before the decoding descriptor
> +	 */
> +	*cfg_size = mxc_jpeg_setup_cfg_stream(cfg_stream_vaddr,
> +					      V4L2_PIX_FMT_YUYV,
> +					      MXC_JPEG_MIN_WIDTH,
> +					      MXC_JPEG_MIN_HEIGHT);
> +	cfg_desc->next_descpt_ptr = desc_handle | MXC_NXT_DESCPT_EN;
> +	cfg_desc->buf_base0 = vb2_dma_contig_plane_dma_addr(dst_buf, 0);
> +	cfg_desc->buf_base1 = 0;
> +	cfg_desc->imgsize = MXC_JPEG_MIN_WIDTH << 16;
> +	cfg_desc->imgsize |= MXC_JPEG_MIN_HEIGHT;
> +	cfg_desc->line_pitch = MXC_JPEG_MIN_WIDTH * 2;
> +	cfg_desc->stm_ctrl = STM_CTRL_IMAGE_FORMAT(MXC_JPEG_YUV422);
> +	cfg_desc->stm_bufbase = cfg_stream_handle;
> +	cfg_desc->stm_bufsize = ALIGN(*cfg_size, 1024);
> +	print_descriptor_info(jpeg->dev, cfg_desc);
> +
> +	/* validate the configuration descriptor */
> +	mxc_jpeg_set_desc(cfg_desc_handle, reg, slot);
> +}
> +
> +static void mxc_jpeg_config_enc_desc(struct vb2_buffer *out_buf,
> +				     struct mxc_jpeg_ctx *ctx,
> +				     struct vb2_buffer *src_buf,
> +				     struct vb2_buffer *dst_buf)
> +{
> +	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
> +	void __iomem *reg = jpeg->base_reg;
> +	unsigned int slot = ctx->slot;
> +	struct mxc_jpeg_desc *desc = jpeg->slot_data[slot].desc;
> +	struct mxc_jpeg_desc *cfg_desc = jpeg->slot_data[slot].cfg_desc;
> +	dma_addr_t desc_handle = jpeg->slot_data[slot].desc_handle;
> +	dma_addr_t cfg_desc_handle = jpeg->slot_data[slot].cfg_desc_handle;
> +	void *cfg_stream_vaddr = jpeg->slot_data[slot].cfg_stream_vaddr;
> +	struct mxc_jpeg_q_data *q_data;
> +	enum mxc_jpeg_image_format img_fmt;
> +	int w, h;
> +
> +	q_data = mxc_jpeg_get_q_data(ctx, src_buf->vb2_queue->type);
> +
> +	jpeg->slot_data[slot].cfg_stream_size =
> +			mxc_jpeg_setup_cfg_stream(cfg_stream_vaddr,
> +						  q_data->fmt->fourcc,
> +						  q_data->w_adjusted,
> +						  q_data->h_adjusted);
> +
> +	/* chain the config descriptor with the encoding descriptor */
> +	cfg_desc->next_descpt_ptr = desc_handle | MXC_NXT_DESCPT_EN;
> +
> +	cfg_desc->buf_base0 = jpeg->slot_data[slot].cfg_stream_handle;
> +	cfg_desc->buf_base1 = 0;
> +	cfg_desc->line_pitch = 0;
> +	cfg_desc->stm_bufbase = 0; /* no output expected */
> +	cfg_desc->stm_bufsize = 0x0;
> +	cfg_desc->imgsize = 0;
> +	cfg_desc->stm_ctrl = STM_CTRL_CONFIG_MOD(1);
> +
> +	desc->next_descpt_ptr = 0; /* end of chain */
> +
> +	/* use adjusted resolution for CAST IP job */
> +	w = q_data->w_adjusted;
> +	h = q_data->h_adjusted;
> +	mxc_jpeg_set_res(desc, w, h);
> +	mxc_jpeg_set_line_pitch(desc, w * (q_data->fmt->depth / 8));
> +	mxc_jpeg_set_bufsize(desc, desc->line_pitch * h);
> +	img_fmt = mxc_jpeg_fourcc_to_imgfmt(q_data->fmt->fourcc);
> +	if (img_fmt == MXC_JPEG_INVALID)
> +		dev_err(jpeg->dev, "No valid image format detected\n");
> +	desc->stm_ctrl = STM_CTRL_CONFIG_MOD(0) |
> +			 STM_CTRL_IMAGE_FORMAT(img_fmt);
> +	mxc_jpeg_addrs(desc, src_buf, dst_buf, 0);
> +	dev_dbg(jpeg->dev, "cfg_desc - 0x%llx:\n", cfg_desc_handle);
> +	print_descriptor_info(jpeg->dev, cfg_desc);
> +	dev_dbg(jpeg->dev, "enc desc - 0x%llx:\n", desc_handle);
> +	print_descriptor_info(jpeg->dev, desc);
> +	print_wrapper_info(jpeg->dev, reg);
> +	print_cast_status(jpeg->dev, reg, MXC_JPEG_ENCODE);
> +
> +	/* validate the configuration descriptor */
> +	mxc_jpeg_set_desc(cfg_desc_handle, reg, slot);
> +}
> +
> +static void mxc_jpeg_device_run(void *priv)
> +{
> +	struct mxc_jpeg_ctx *ctx = priv;
> +	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
> +	void __iomem *reg = jpeg->base_reg;
> +	struct device *dev = jpeg->dev;
> +	struct vb2_v4l2_buffer *src_buf, *dst_buf;
> +	unsigned long flags;
> +	struct mxc_jpeg_q_data *q_data_cap, *q_data_out;
> +
> +	spin_lock_irqsave(&ctx->mxc_jpeg->hw_lock, flags);
> +	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> +	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> +	if (!src_buf || !dst_buf) {
> +		dev_err(dev, "Null src or dst buf\n");
> +		goto end;
> +	}
> +
> +	q_data_cap = mxc_jpeg_get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
> +	if (!q_data_cap)
> +		goto end;
> +	q_data_out = mxc_jpeg_get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT);
> +	if (!q_data_out)
> +		goto end;
> +	src_buf->sequence = q_data_out->sequence++;
> +	dst_buf->sequence = q_data_cap->sequence++;
> +
> +	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
> +
> +	/*
> +	 * TODO: this reset should be removed, once we figure out
> +	 * how to overcome hardware issues both on encoder and decoder
> +	 */
> +	mxc_jpeg_sw_reset(reg);
> +	mxc_jpeg_enable(reg);
> +	mxc_jpeg_set_l_endian(reg, 1);
> +
> +	ctx->slot = mxc_get_free_slot(jpeg->slot_data, MXC_MAX_SLOTS);
> +	if (ctx->slot >= MXC_MAX_SLOTS) {
> +		dev_err(dev, "No more free slots\n");
> +		goto end;
> +	}
> +	if (!mxc_jpeg_alloc_slot_data(jpeg, ctx->slot)) {
> +		dev_err(dev, "Canot allocate slot data\n");
> +		goto end;
> +	}
> +
> +	mxc_jpeg_enable_slot(reg, ctx->slot);
> +	mxc_jpeg_enable_irq(reg, ctx->slot);
> +
> +	if (jpeg->mode == MXC_JPEG_ENCODE) {
> +		dev_dbg(dev, "Encoding on slot %d\n", ctx->slot);
> +		ctx->enc_state = MXC_JPEG_ENC_CONF;
> +		mxc_jpeg_config_enc_desc(&dst_buf->vb2_buf, ctx,
> +					 &src_buf->vb2_buf, &dst_buf->vb2_buf);
> +		mxc_jpeg_enc_mode_conf(dev, reg); /* start config phase */
> +	} else {
> +		dev_dbg(dev, "Decoding on slot %d\n", ctx->slot);
> +		print_nbuf_to_eoi(dev, &src_buf->vb2_buf, 0);
> +		mxc_jpeg_config_dec_desc(&dst_buf->vb2_buf, ctx,
> +					 &src_buf->vb2_buf, &dst_buf->vb2_buf);
> +		mxc_jpeg_dec_mode_go(dev, reg);
> +	}
> +end:
> +	spin_unlock_irqrestore(&ctx->mxc_jpeg->hw_lock, flags);
> +}
> +
> +static int mxc_jpeg_try_decoder_cmd(struct file *file, void *fh,
> +				    struct v4l2_decoder_cmd *c)
> +{
> +	if (c->cmd != V4L2_DEC_CMD_STOP && c->cmd != V4L2_DEC_CMD_START)
> +		return -EINVAL;
> +
> +	c->flags = 0;
> +
> +	if (c->cmd == V4L2_DEC_CMD_START) {
> +		c->start.speed = 0;
> +		c->start.format = 0;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mxc_jpeg_decoder_cmd(struct file *file, void *priv,
> +				struct v4l2_decoder_cmd *cmd)
> +{
> +	struct v4l2_fh *fh = file->private_data;
> +	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(fh);
> +	struct device *dev = ctx->mxc_jpeg->dev;
> +	int ret;
> +
> +	ret = mxc_jpeg_try_decoder_cmd(file, fh, cmd);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Ignore decoder command silently in encoder context */
> +	if (ctx->mxc_jpeg->mode != MXC_JPEG_DECODE)
> +		return 0;
> +
> +	if (cmd->cmd == V4L2_DEC_CMD_STOP) {
> +		dev_dbg(dev, "Received V4L2_DEC_CMD_STOP");
> +		if (v4l2_m2m_num_src_bufs_ready(fh->m2m_ctx) == 0) {
> +			/* No more src bufs, notify app EOS */
> +			notify_eos(ctx);
> +		} else {
> +			/* will send EOS later*/
> +			ctx->stopping = 1;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int mxc_jpeg_try_encoder_cmd(struct file *file, void *fh,
> +				    struct v4l2_encoder_cmd *c)
> +{
> +	if (c->cmd != V4L2_ENC_CMD_STOP && c->cmd != V4L2_ENC_CMD_START)
> +		return -EINVAL;
> +
> +	c->flags = 0;
> +
> +	return 0;
> +}
> +
> +static int mxc_jpeg_encoder_cmd(struct file *file, void *priv,
> +				struct v4l2_encoder_cmd *cmd)
> +{
> +	struct v4l2_fh *fh = file->private_data;
> +	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(fh);
> +	struct device *dev = ctx->mxc_jpeg->dev;
> +	int ret;
> +
> +	ret = mxc_jpeg_try_encoder_cmd(file, fh, cmd);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Ignore encoder command silently in decoder context */
> +	if (ctx->mxc_jpeg->mode != MXC_JPEG_ENCODE)
> +		return 0;
> +
> +	if (cmd->cmd == V4L2_ENC_CMD_STOP) {
> +		dev_dbg(dev, "Received V4L2_ENC_CMD_STOP");
> +		if (v4l2_m2m_num_src_bufs_ready(fh->m2m_ctx) == 0) {
> +			/* No more src bufs, notify app EOS */
> +			notify_eos(ctx);
> +		} else {
> +			/* will send EOS later*/
> +			ctx->stopping = 1;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int mxc_jpeg_queue_setup(struct vb2_queue *q,
> +				unsigned int *nbuffers,
> +				unsigned int *nplanes,
> +				unsigned int sizes[],
> +				struct device *alloc_ctxs[])
> +{
> +	struct mxc_jpeg_ctx *ctx = vb2_get_drv_priv(q);
> +	struct mxc_jpeg_q_data *q_data = NULL;
> +	int i;
> +
> +	q_data = mxc_jpeg_get_q_data(ctx, q->type);
> +	if (!q_data)
> +		return -EINVAL;
> +
> +	/* Handle CREATE_BUFS situation - *nplanes != 0 */
> +	if (*nplanes) {
> +		for (i = 0; i < *nplanes; i++) {
> +			if (sizes[i] < q_data->sizeimage[i])
> +				return -EINVAL;
> +		}

Return 0 here. Otherwise you'd overwrite the size given by CREATE_BUFS.

> +	}
> +
> +	/* Handle REQBUFS situation */
> +	*nplanes = q_data->fmt->colplanes;
> +	for (i = 0; i < *nplanes; i++)
> +		sizes[i] = q_data->sizeimage[i];
> +
> +	return 0;
> +}
> +
> +static int mxc_jpeg_start_streaming(struct vb2_queue *q, unsigned int count)
> +{
> +	struct mxc_jpeg_ctx *ctx = vb2_get_drv_priv(q);
> +	struct mxc_jpeg_q_data *q_data = mxc_jpeg_get_q_data(ctx, q->type);
> +
> +	dev_dbg(ctx->mxc_jpeg->dev, "Start streaming ctx=%p", ctx);
> +	q_data->sequence = 0;
> +
> +	return 0;
> +}
> +
> +static void release_active_buffers(struct vb2_queue *q,
> +				   enum vb2_buffer_state s)
> +{
> +	struct vb2_buffer *vb;
> +
> +	if (!list_empty(&q->queued_list))
> +		list_for_each_entry(vb, &q->queued_list, queued_entry) {
> +			if (vb->state == VB2_BUF_STATE_ACTIVE)
> +				vb2_buffer_done(vb, s);
> +		}
> +}
> +
> +static void mxc_jpeg_stop_streaming(struct vb2_queue *q)
> +{
> +	struct mxc_jpeg_ctx *ctx = vb2_get_drv_priv(q);
> +
> +	dev_dbg(ctx->mxc_jpeg->dev, "Stop streaming ctx=%p", ctx);
> +
> +	/* Release all active buffers */
> +	release_active_buffers(q, VB2_BUF_STATE_ERROR);

I think you can just move the code from release_active_buffers() to here.

> +}
> +
> +struct mxc_jpeg_stream {
> +	u8 *addr;
> +	u32 loc;
> +	u32 end;
> +};
> +
> +static u8 get_byte(struct mxc_jpeg_stream *stream)
> +{
> +	u8 ret;
> +
> +	if (stream->loc >= stream->end)
> +		return -1;
> +	ret = stream->addr[stream->loc];
> +	stream->loc++;
> +	return ret;
> +}
> +
> +static int get_sof(struct device *dev,
> +		   struct mxc_jpeg_stream *stream,
> +		   struct mxc_jpeg_sof *sof)
> +{
> +	int i;
> +
> +	if (stream->loc + sizeof(struct mxc_jpeg_sof) >= stream->end)
> +		return -1;
> +	memcpy(sof, &stream->addr[stream->loc], sizeof(struct mxc_jpeg_sof));
> +	_bswap16(&sof->length);
> +	_bswap16(&sof->height);
> +	_bswap16(&sof->width);
> +	dev_dbg(dev, "JPEG SOF: precision=%d\n", sof->precision);
> +	dev_dbg(dev, "JPEG SOF: height=%d, width=%d\n",
> +		sof->height, sof->width);
> +	for (i = 0; i < sof->components_no; i++) {
> +		dev_dbg(dev, "JPEG SOF: comp_id=%d, H=0x%x, V=0x%x\n",
> +			sof->comp[i].id, sof->comp[i].v, sof->comp[i].h);
> +	}
> +	return 0;
> +}
> +
> +static int mxc_jpeg_valid_comp_id(struct device *dev,
> +				  struct mxc_jpeg_sof *sof,
> +				  struct mxc_jpeg_sos *sos)
> +{
> +	int valid = 1;
> +	int i;
> +
> +	/*
> +	 * there's a limitation in the IP that the component IDs must be
> +	 * between 0..4, if they are not, let's patch them
> +	 */
> +	for (i = 0; i < sof->components_no; i++)
> +		if (sof->comp[i].id > MXC_JPEG_MAX_COMPONENTS) {
> +			valid = 0;
> +			dev_err(dev, "Component %d has invalid ID: %d",
> +				i, sof->comp[i].id);
> +		}
> +	if (!valid)
> +		/* patch all comp IDs if at least one is invalid */
> +		for (i = 0; i < sof->components_no; i++) {
> +			dev_warn(dev, "Component %d ID patched to: %d",
> +				 i, i + 1);
> +			sof->comp[i].id = i + 1;
> +			sos->comp[i].id = i + 1;
> +		}
> +
> +	return valid;
> +}
> +
> +static enum mxc_jpeg_image_format
> +mxc_jpeg_get_image_format(struct device *dev, const struct mxc_jpeg_sof *sof)
> +{
> +	if (sof->components_no == 1) {
> +		dev_dbg(dev, "IMAGE_FORMAT is: MXC_JPEG_GRAY\n");
> +		return MXC_JPEG_GRAY;
> +	}
> +	if (sof->components_no == 3) {
> +		if (sof->comp[0].h == 2 && sof->comp[0].v == 2 &&
> +		    sof->comp[1].h == 1 && sof->comp[1].v == 1 &&
> +		    sof->comp[2].h == 1 && sof->comp[2].v == 1){
> +			dev_dbg(dev, "IMAGE_FORMAT is: MXC_JPEG_YUV420\n");
> +			return MXC_JPEG_YUV420;
> +		}
> +		if (sof->comp[0].h == 2 && sof->comp[0].v == 1 &&
> +		    sof->comp[1].h == 1 && sof->comp[1].v == 1 &&
> +		    sof->comp[2].h == 1 && sof->comp[2].v == 1){
> +			dev_dbg(dev, "IMAGE_FORMAT is: MXC_JPEG_YUV422\n");
> +			return MXC_JPEG_YUV422;
> +		}
> +		if (sof->comp[0].h == 1 && sof->comp[0].v == 1 &&
> +		    sof->comp[1].h == 1 && sof->comp[1].v == 1 &&
> +		    sof->comp[2].h == 1 && sof->comp[2].v == 1){
> +			dev_dbg(dev, "IMAGE_FORMAT is: MXC_JPEG_YUV444\n");
> +			return MXC_JPEG_YUV444;
> +		}
> +	}
> +	if (sof->components_no == 4) {
> +		if (sof->comp[0].h == 1 && sof->comp[0].v == 1 &&
> +		    sof->comp[1].h == 1 && sof->comp[1].v == 1 &&
> +		    sof->comp[2].h == 1 && sof->comp[2].v == 1 &&
> +		    sof->comp[3].h == 1 && sof->comp[3].v == 1){
> +			/* this is not tested */
> +			dev_dbg(dev, "IMAGE_FORMAT is: MXC_JPEG_ARGB\n");
> +			return MXC_JPEG_ARGB;
> +		}
> +	}
> +	dev_err(dev, "Could not identify image format\n");
> +	return MXC_JPEG_INVALID;
> +}
> +
> +static void mxc_jpeg_bytesperline(struct mxc_jpeg_q_data *q,
> +				  u32 precision)
> +{
> +	/* Bytes distance between the leftmost pixels in two adjacent lines */
> +	if (q->fmt->fourcc == V4L2_PIX_FMT_JPEG) {
> +		/* bytesperline unused for compressed formats */
> +		q->bytesperline[0] = 0;
> +		q->bytesperline[1] = 0;
> +	} else if (q->fmt->fourcc == V4L2_PIX_FMT_NV12) {
> +		/* When the image format is planar the bytesperline value
> +		 * applies to the first plane and is divided by the same factor
> +		 * as the width field for the other planes
> +		 */
> +		q->bytesperline[0] = q->w * (precision / 8) *
> +				     (q->fmt->depth / 8);
> +		q->bytesperline[1] = q->bytesperline[0];
> +	} else {
> +		/* single plane formats */
> +		q->bytesperline[0] = q->w * (precision / 8) *
> +				     (q->fmt->depth / 8);
> +		q->bytesperline[1] = 0;
> +	}
> +}
> +
> +static void mxc_jpeg_sizeimage(struct mxc_jpeg_q_data *q)
> +{
> +	if (q->fmt->fourcc == V4L2_PIX_FMT_JPEG) {
> +		/* if no sizeimage from user, assume worst jpeg compression */
> +		if (!q->sizeimage[0])
> +			q->sizeimage[0] = 6 * q->w * q->h;
> +		q->sizeimage[1] = 0;
> +
> +		if (q->sizeimage[0] > MXC_JPEG_MAX_SIZEIMAGE)
> +			q->sizeimage[0] = MXC_JPEG_MAX_SIZEIMAGE;
> +
> +		/* jpeg stream size must be multiple of 1K */
> +		q->sizeimage[0] = ALIGN(q->sizeimage[0], 1024);
> +	} else {
> +		q->sizeimage[0] = q->bytesperline[0] * q->h;
> +		q->sizeimage[1] = 0;
> +		if (q->fmt->fourcc == V4L2_PIX_FMT_NV12)
> +			q->sizeimage[1] = q->sizeimage[0] / 2;
> +	}
> +}
> +
> +static int mxc_jpeg_parse(struct mxc_jpeg_ctx *ctx,
> +			  u8 *src_addr, u32 size, bool *dht_needed)
> +{
> +	struct device *dev = ctx->mxc_jpeg->dev;
> +	struct mxc_jpeg_q_data *q_data_out, *q_data_cap;
> +	enum v4l2_buf_type cap_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> +	struct mxc_jpeg_stream stream;
> +	bool notfound = true;
> +	bool app14 = false;
> +	bool src_chg = false;
> +	u8 app14_transform = 0;
> +	struct mxc_jpeg_sof sof, *psof = 0;
> +	struct mxc_jpeg_sos *psos = 0;
> +	u8 byte, *next = 0;
> +	enum mxc_jpeg_image_format img_fmt;
> +	u32 fourcc;
> +
> +	memset(&sof, 0, sizeof(struct mxc_jpeg_sof));
> +	stream.addr = src_addr;
> +	stream.end = size;
> +	stream.loc = 0;
> +	*dht_needed = true;
> +	while (notfound) {
> +		byte = get_byte(&stream);
> +		if (byte == -1)
> +			return -EINVAL;
> +		if (byte != 0xff)
> +			continue;
> +		do {
> +			byte = get_byte(&stream);
> +		} while (byte == 0xff);
> +		if (byte == -1)
> +			return false;
> +		if (byte == 0)
> +			continue;
> +		switch (byte) {
> +		case DHT:
> +			/* DHT marker present, no need to inject default one */
> +			*dht_needed = false;
> +			break;
> +		case SOF2: /* Progressive DCF frame definition */
> +			dev_err(dev,
> +				"Progressive JPEG not supported by hardware");
> +			return -EINVAL;
> +		case SOF1: /* Extended sequential DCF frame definition */
> +		case SOF0: /* Baseline sequential DCF frame definition */
> +			if (get_sof(dev, &stream, &sof) == -1)
> +				break;
> +			next = stream.addr + stream.loc;
> +			psof = (struct mxc_jpeg_sof *)next;
> +			break;
> +		case SOS:
> +			next = stream.addr + stream.loc;
> +			psos = (struct mxc_jpeg_sos *)next;
> +			notfound = false;
> +			break;
> +		case APP14:
> +			app14 = true;
> +			/*
> +			 * Application Data Syntax is:
> +			 * 2 bytes(APPn:0xFF,0xEE), 2 bytes(Lp), Ap1...ApLp-2
> +			 * The transform flag is in Ap12
> +			 * stream.loc is now on APPn-0xEE byte
> +			 */
> +			app14_transform = *(stream.addr + stream.loc + 12 + 1);
> +			break;
> +		default:
> +			notfound = true;
> +		}
> +	}
> +	q_data_out = mxc_jpeg_get_q_data(ctx,
> +					 V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> +	if (q_data_out->w == 0 && q_data_out->h == 0) {
> +		dev_warn(dev, "Invalid user resolution 0x0");
> +		dev_warn(dev, "Keeping resolution from JPEG: %dx%d",
> +			 sof.width, sof.height);
> +		 q_data_out->w = sof.width;
> +		 q_data_out->h = sof.height;
> +	} else if (sof.width != q_data_out->w || sof.height != q_data_out->h) {
> +		dev_err(dev,
> +			"Resolution mismatch: %dx%d (JPEG) versus %dx%d(user)",
> +			sof.width, sof.height, q_data_out->w, q_data_out->h);
> +		return -EINVAL;
> +	}
> +	if (sof.width % 8 != 0 || sof.height % 8 != 0) {
> +		dev_err(dev, "JPEG width or height not multiple of 8: %dx%d\n",
> +			sof.width, sof.height);
> +		return -EINVAL;
> +	}
> +	if (sof.width > MXC_JPEG_MAX_WIDTH ||
> +	    sof.height > MXC_JPEG_MAX_HEIGHT) {
> +		dev_err(dev, "JPEG width or height should be <= 8192: %dx%d\n",
> +			sof.width, sof.height);
> +		return -EINVAL;
> +	}
> +	if (sof.width < MXC_JPEG_MIN_WIDTH ||
> +	    sof.height < MXC_JPEG_MIN_HEIGHT) {
> +		dev_err(dev, "JPEG width or height should be > 64: %dx%d\n",
> +			sof.width, sof.height);
> +		return -EINVAL;
> +	}
> +	if (sof.components_no > MXC_JPEG_MAX_COMPONENTS) {
> +		dev_err(dev, "JPEG number of components should be <=%d",
> +			MXC_JPEG_MAX_COMPONENTS);
> +		return -EINVAL;
> +	}
> +	/* check and, if necessary, patch component IDs*/
> +	if (!mxc_jpeg_valid_comp_id(dev, psof, psos))
> +		dev_warn(dev, "JPEG component ids should be 0-3 or 1-4");
> +
> +	img_fmt = mxc_jpeg_get_image_format(dev, &sof);
> +	if (img_fmt == MXC_JPEG_INVALID)
> +		return -EINVAL;
> +
> +	/*
> +	 * If the transform flag from APP14 marker is 0, images that are
> +	 * encoded with 3 components have RGB colorspace, see Recommendation
> +	 * ITU-T T.872 chapter 6.5.3 APP14 marker segment for colour encoding
> +	 */
> +	if (img_fmt == MXC_JPEG_YUV444 && app14 && app14_transform == 0)
> +		img_fmt = MXC_JPEG_RGB;
> +
> +	if (mxc_jpeg_imgfmt_to_fourcc(img_fmt, &fourcc)) {
> +		dev_err(dev, "Fourcc not found for %d", img_fmt);
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * set-up the capture queue with the pixelformat and resolution
> +	 * detected from the jpeg output stream
> +	 */
> +	q_data_cap = mxc_jpeg_get_q_data(ctx, cap_type);
> +	if (q_data_cap->w != sof.width || q_data_cap->h != sof.height)
> +		src_chg = true;
> +	q_data_cap->w = sof.width;
> +	q_data_cap->h = sof.height;
> +	q_data_cap->fmt = mxc_jpeg_find_format(ctx, fourcc);
> +	q_data_cap->w_adjusted = q_data_cap->w;
> +	q_data_cap->h_adjusted = q_data_cap->h;
> +	/*
> +	 * align up the resolution for CAST IP,
> +	 * but leave the buffer resolution unchanged
> +	 */
> +	v4l_bound_align_image(&q_data_cap->w_adjusted,
> +			      q_data_cap->w_adjusted,  /* adjust up */
> +			      MXC_JPEG_MAX_WIDTH,
> +			      q_data_cap->fmt->h_align,
> +			      &q_data_cap->h_adjusted,
> +			      q_data_cap->h_adjusted, /* adjust up */
> +			      MXC_JPEG_MAX_HEIGHT,
> +			      q_data_cap->fmt->v_align,
> +			      0);
> +	{
> +		char *jpeg_format_name = fourcc_to_str(fourcc);
> +
> +		dev_dbg(dev, "Detected jpeg res=(%dx%d)->(%dx%d), pixfmt=%s\n",
> +			q_data_cap->w, q_data_cap->h,
> +			q_data_cap->w_adjusted, q_data_cap->h_adjusted,
> +			jpeg_format_name);
> +		kfree(jpeg_format_name);
> +	}
> +
> +	/* setup bytesperline/sizeimage for capture queue */
> +	mxc_jpeg_bytesperline(q_data_cap, sof.precision);
> +	mxc_jpeg_sizeimage(q_data_cap);
> +
> +	/*
> +	 * if the CAPTURE format was updated with new values, regardless of
> +	 * whether they match the values set by the client or not, signal
> +	 * a source change event
> +	 */
> +	if (src_chg)
> +		notify_src_chg(ctx);
> +
> +	return 0;
> +}
> +
> +static void mxc_jpeg_buf_queue(struct vb2_buffer *vb)
> +{
> +	int ret;
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +	struct mxc_jpeg_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
> +	struct mxc_jpeg_src_buf *jpeg_src_buf;
> +
> +	if (vb->vb2_queue->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
> +		goto end;
> +
> +	/* for V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE */
> +	if (ctx->mxc_jpeg->mode != MXC_JPEG_DECODE)
> +		goto end;
> +
> +	jpeg_src_buf = vb2_to_mxc_buf(vb);
> +	ret = mxc_jpeg_parse(ctx,
> +			     (u8 *)vb2_plane_vaddr(vb, 0),
> +			     vb2_get_plane_payload(vb, 0),
> +			     &jpeg_src_buf->dht_needed);
> +	if (ret) {
> +		v4l2_err(&ctx->mxc_jpeg->v4l2_dev,
> +			 "driver does not support this resolution/format\n");
> +		vb2_buffer_done(vb, VB2_BUF_STATE_ERROR);
> +
> +		return;
> +	}
> +
> +end:
> +	v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
> +}
> +
> +static int mxc_jpeg_buf_out_validate(struct vb2_buffer *vb)
> +{
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +
> +	if (vbuf->field == V4L2_FIELD_ANY)
> +		vbuf->field = V4L2_FIELD_NONE;
> +
> +	return 0;
> +}
> +
> +static int mxc_jpeg_buf_prepare(struct vb2_buffer *vb)
> +{
> +	struct mxc_jpeg_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
> +	struct mxc_jpeg_q_data *q_data = NULL;
> +	struct device *dev = ctx->mxc_jpeg->dev;
> +	unsigned long sizeimage;
> +	int i;
> +
> +	q_data = mxc_jpeg_get_q_data(ctx, vb->vb2_queue->type);
> +	if (!q_data)
> +		return -EINVAL;
> +	for (i = 0; i < q_data->fmt->colplanes; i++) {
> +		sizeimage = q_data->sizeimage[i];
> +		if (vb2_plane_size(vb, i) < sizeimage) {
> +			dev_err(dev, "plane %d too small (%lu < %lu)",
> +				i, vb2_plane_size(vb, i), sizeimage);
> +			return -EINVAL;
> +		}
> +		vb2_set_plane_payload(vb, i, sizeimage);
> +	}
> +	return 0;
> +}
> +
> +static const struct vb2_ops mxc_jpeg_qops = {
> +	.queue_setup		= mxc_jpeg_queue_setup,
> +	.wait_prepare		= vb2_ops_wait_prepare,
> +	.wait_finish		= vb2_ops_wait_finish,
> +	.buf_out_validate	= mxc_jpeg_buf_out_validate,
> +	.buf_prepare		= mxc_jpeg_buf_prepare,
> +	.start_streaming	= mxc_jpeg_start_streaming,
> +	.stop_streaming		= mxc_jpeg_stop_streaming,
> +	.buf_queue		= mxc_jpeg_buf_queue,
> +};
> +
> +static int mxc_jpeg_queue_init(void *priv, struct vb2_queue *src_vq,
> +			       struct vb2_queue *dst_vq)
> +{
> +	struct mxc_jpeg_ctx *ctx = priv;
> +	int ret;
> +
> +	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> +	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
> +	src_vq->drv_priv = ctx;
> +	src_vq->buf_struct_size = sizeof(struct mxc_jpeg_src_buf);
> +	src_vq->ops = &mxc_jpeg_qops;
> +	src_vq->mem_ops = &vb2_dma_contig_memops;
> +	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> +	src_vq->lock = &ctx->mxc_jpeg->lock;
> +	src_vq->dev = ctx->mxc_jpeg->dev;
> +	src_vq->allow_zero_bytesused = 1; /* keep old userspace apps working */

Do you really need this?

> +
> +	ret = vb2_queue_init(src_vq);
> +	if (ret)
> +		return ret;
> +
> +	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> +	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
> +	dst_vq->drv_priv = ctx;
> +	dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
> +	dst_vq->ops = &mxc_jpeg_qops;
> +	dst_vq->mem_ops = &vb2_dma_contig_memops;
> +	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> +	dst_vq->lock = &ctx->mxc_jpeg->lock;
> +	dst_vq->dev = ctx->mxc_jpeg->dev;
> +
> +	ret = vb2_queue_init(dst_vq);
> +	return ret;
> +}
> +
> +static void mxc_jpeg_set_default_params(struct mxc_jpeg_ctx *ctx)
> +{
> +	struct mxc_jpeg_q_data *out_q = &ctx->out_q;
> +	struct mxc_jpeg_q_data *cap_q = &ctx->cap_q;
> +	struct mxc_jpeg_q_data *q[2] = {out_q, cap_q};
> +	int i;
> +
> +	ctx->colorspace = V4L2_COLORSPACE_JPEG,
> +	ctx->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
> +	ctx->quantization = V4L2_QUANTIZATION_DEFAULT;
> +	ctx->xfer_func = V4L2_XFER_FUNC_DEFAULT;
> +
> +	if (ctx->mxc_jpeg->mode == MXC_JPEG_ENCODE) {
> +		out_q->fmt = mxc_jpeg_find_format(ctx, MXC_JPEG_DEFAULT_PFMT);
> +		cap_q->fmt = mxc_jpeg_find_format(ctx, V4L2_PIX_FMT_JPEG);
> +	} else {
> +		out_q->fmt = mxc_jpeg_find_format(ctx, V4L2_PIX_FMT_JPEG);
> +		cap_q->fmt = mxc_jpeg_find_format(ctx, MXC_JPEG_DEFAULT_PFMT);
> +	}
> +
> +	for (i = 0; i < 2; i++) {
> +		q[i]->w = MXC_JPEG_DEFAULT_WIDTH;
> +		q[i]->h = MXC_JPEG_DEFAULT_HEIGHT;
> +		q[i]->w_adjusted = MXC_JPEG_DEFAULT_WIDTH;
> +		q[i]->h_adjusted = MXC_JPEG_DEFAULT_HEIGHT;
> +		mxc_jpeg_bytesperline(q[i], 8);
> +		mxc_jpeg_sizeimage(q[i]);
> +	}
> +}
> +
> +static int mxc_jpeg_open(struct file *file)
> +{
> +	struct mxc_jpeg_dev *mxc_jpeg = video_drvdata(file);
> +	struct video_device *mxc_vfd = video_devdata(file);
> +	struct device *dev = mxc_jpeg->dev;
> +	struct mxc_jpeg_ctx *ctx;
> +	int ret = 0;
> +
> +	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	if (mutex_lock_interruptible(&mxc_jpeg->lock)) {
> +		ret = -ERESTARTSYS;
> +		goto free;
> +	}
> +
> +	v4l2_fh_init(&ctx->fh, mxc_vfd);
> +	file->private_data = &ctx->fh;
> +	v4l2_fh_add(&ctx->fh);
> +
> +	ctx->mxc_jpeg = mxc_jpeg;
> +
> +	ctx->fh.m2m_ctx = v4l2_m2m_ctx_init(mxc_jpeg->m2m_dev, ctx,
> +					    mxc_jpeg_queue_init);
> +
> +	if (IS_ERR(ctx->fh.m2m_ctx)) {
> +		ret = PTR_ERR(ctx->fh.m2m_ctx);
> +		goto error;
> +	}
> +
> +	mxc_jpeg_set_default_params(ctx);
> +	ctx->slot = MXC_MAX_SLOTS; /* slot not allocated yet */
> +
> +	if (mxc_jpeg->mode == MXC_JPEG_DECODE)
> +		dev_dbg(dev, "Opened JPEG decoder instance %p\n", ctx);
> +	else
> +		dev_dbg(dev, "Opened JPEG encoder instance %p\n", ctx);
> +	mutex_unlock(&mxc_jpeg->lock);
> +
> +	return 0;
> +
> +error:
> +	v4l2_fh_del(&ctx->fh);
> +	v4l2_fh_exit(&ctx->fh);
> +	mutex_unlock(&mxc_jpeg->lock);
> +free:
> +	kfree(ctx);
> +	return ret;
> +}
> +
> +static int mxc_jpeg_querycap(struct file *file, void *priv,
> +			     struct v4l2_capability *cap)
> +{
> +	struct mxc_jpeg_dev *mxc_jpeg = video_drvdata(file);
> +
> +	strscpy(cap->driver, MXC_JPEG_NAME " decoder", sizeof(cap->driver));
> +	strscpy(cap->card, MXC_JPEG_NAME " decoder", sizeof(cap->card));
> +	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
> +		 dev_name(mxc_jpeg->dev));
> +	cap->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_M2M_MPLANE;
> +	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;

Don't set device_caps/capabilities here. Instead set the device_caps field
of struct video_device and drop these two lines here.

> +
> +	return 0;
> +}
> +
> +static int mxc_jpeg_enum_fmt_vid_cap(struct file *file, void *priv,
> +				     struct v4l2_fmtdesc *f)
> +{
> +	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(priv);
> +
> +	if (ctx->mxc_jpeg->mode == MXC_JPEG_ENCODE)
> +		return enum_fmt(mxc_formats, MXC_JPEG_NUM_FORMATS, f,
> +			MXC_JPEG_FMT_TYPE_ENC);
> +	else
> +		return enum_fmt(mxc_formats, MXC_JPEG_NUM_FORMATS, f,
> +			MXC_JPEG_FMT_TYPE_RAW);
> +}
> +
> +static int mxc_jpeg_enum_fmt_vid_out(struct file *file, void *priv,
> +				     struct v4l2_fmtdesc *f)
> +{
> +	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(priv);
> +
> +	if (ctx->mxc_jpeg->mode == MXC_JPEG_DECODE)
> +		return enum_fmt(mxc_formats, MXC_JPEG_NUM_FORMATS, f,
> +				MXC_JPEG_FMT_TYPE_ENC);
> +	else
> +		return enum_fmt(mxc_formats, MXC_JPEG_NUM_FORMATS, f,
> +				MXC_JPEG_FMT_TYPE_RAW);
> +}
> +
> +static int mxc_jpeg_try_fmt(struct v4l2_format *f, struct mxc_jpeg_fmt *fmt,
> +			    struct mxc_jpeg_ctx *ctx, int q_type)
> +{
> +	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
> +	struct v4l2_plane_pix_format *pfmt;
> +	u32 w = (pix_mp->width < MXC_JPEG_MAX_WIDTH) ?
> +		 pix_mp->width : MXC_JPEG_MAX_WIDTH;
> +	u32 h = (pix_mp->height < MXC_JPEG_MAX_HEIGHT) ?
> +		 pix_mp->height : MXC_JPEG_MAX_HEIGHT;
> +	int i;
> +	struct mxc_jpeg_q_data tmp_q;
> +
> +	memset(pix_mp->reserved, 0, sizeof(pix_mp->reserved));
> +	pix_mp->field = V4L2_FIELD_NONE;
> +	pix_mp->num_planes = fmt->colplanes;
> +	pix_mp->pixelformat = fmt->fourcc;
> +
> +	/*
> +	 * use MXC_JPEG_H_ALIGN instead of fmt->v_align, for vertical
> +	 * alignment, to loosen up the alignment to multiple of 8,
> +	 * otherwise NV12-1080p fails as 1080 is not a multiple of 16
> +	 */
> +	v4l_bound_align_image(&w,
> +			      MXC_JPEG_MIN_WIDTH,
> +			      w, /* adjust downwards*/
> +			      fmt->h_align,
> +			      &h,
> +			      MXC_JPEG_MIN_HEIGHT,
> +			      h, /* adjust downwards*/
> +			      MXC_JPEG_H_ALIGN,
> +			      0);
> +	pix_mp->width = w; /* negotiate the width */
> +	pix_mp->height = h; /* negotiate the height */
> +
> +	/* get user input into the tmp_q */
> +	tmp_q.w = w;
> +	tmp_q.h = h;
> +	tmp_q.fmt = fmt;
> +	for (i = 0; i < pix_mp->num_planes; i++) {
> +		pfmt = &pix_mp->plane_fmt[i];
> +		tmp_q.bytesperline[i] = pfmt->bytesperline;
> +		tmp_q.sizeimage[i] = pfmt->sizeimage;
> +	}
> +
> +	/* calculate bytesperline & sizeimage into the tmp_q */
> +	mxc_jpeg_bytesperline(&tmp_q, 8);
> +	mxc_jpeg_sizeimage(&tmp_q);
> +
> +	/* adjust user format according to our calculations */
> +	for (i = 0; i < pix_mp->num_planes; i++) {
> +		pfmt = &pix_mp->plane_fmt[i];
> +		memset(pfmt->reserved, 0, sizeof(pfmt->reserved));
> +		pfmt->bytesperline = tmp_q.bytesperline[i];
> +		pfmt->sizeimage = tmp_q.sizeimage[i];
> +	}
> +
> +	return 0;
> +}
> +
> +static int mxc_jpeg_try_fmt_vid_cap(struct file *file, void *priv,
> +				    struct v4l2_format *f)
> +{
> +	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(priv);
> +	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
> +	struct device *dev = jpeg->dev;
> +	struct mxc_jpeg_fmt *fmt;
> +	u32 fourcc = f->fmt.pix_mp.pixelformat;
> +
> +	int q_type = (jpeg->mode == MXC_JPEG_DECODE) ?
> +		     MXC_JPEG_FMT_TYPE_RAW : MXC_JPEG_FMT_TYPE_ENC;
> +
> +	if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
> +		dev_err(dev, "TRY_FMT with Invalid type: %d\n", f->type);
> +		return -EINVAL;
> +	}
> +
> +	fmt = mxc_jpeg_find_format(ctx, f->fmt.pix_mp.pixelformat);
> +	if (!fmt || fmt->flags != q_type) {
> +		char *format_name = fourcc_to_str(fourcc);
> +
> +		dev_warn(dev, "Format not supported: %s, use the default.\n",
> +			 format_name);
> +		kfree(format_name);
> +		f->fmt.pix_mp.pixelformat = (jpeg->mode == MXC_JPEG_DECODE) ?
> +				MXC_JPEG_DEFAULT_PFMT : V4L2_PIX_FMT_JPEG;
> +		fmt = mxc_jpeg_find_format(ctx, f->fmt.pix_mp.pixelformat);
> +	}
> +	return mxc_jpeg_try_fmt(f, fmt, ctx, q_type);
> +}
> +
> +static int mxc_jpeg_try_fmt_vid_out(struct file *file, void *priv,
> +				    struct v4l2_format *f)
> +{
> +	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(priv);
> +	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
> +	struct device *dev = jpeg->dev;
> +	struct mxc_jpeg_fmt *fmt;
> +	u32 fourcc = f->fmt.pix_mp.pixelformat;
> +
> +	int q_type = (jpeg->mode == MXC_JPEG_ENCODE) ?
> +		     MXC_JPEG_FMT_TYPE_RAW : MXC_JPEG_FMT_TYPE_ENC;
> +
> +	if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
> +		dev_err(dev, "TRY_FMT with Invalid type: %d\n", f->type);
> +		return -EINVAL;
> +	}
> +
> +	fmt = mxc_jpeg_find_format(ctx, fourcc);
> +	if (!fmt || fmt->flags != q_type) {
> +		char *format_name = fourcc_to_str(fourcc);
> +
> +		dev_warn(dev, "Format not supported: %s, use the default.\n",
> +			 format_name);
> +		kfree(format_name);
> +		f->fmt.pix_mp.pixelformat = (jpeg->mode == MXC_JPEG_ENCODE) ?
> +				MXC_JPEG_DEFAULT_PFMT : V4L2_PIX_FMT_JPEG;
> +		fmt = mxc_jpeg_find_format(ctx, f->fmt.pix_mp.pixelformat);
> +	}
> +	return mxc_jpeg_try_fmt(f, fmt, ctx, q_type);
> +}
> +
> +static int mxc_jpeg_s_fmt(struct mxc_jpeg_ctx *ctx,
> +			  struct v4l2_format *f)
> +{
> +	struct vb2_queue *vq;
> +	struct mxc_jpeg_q_data *q_data = NULL;
> +	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
> +	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
> +	int i;
> +
> +	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
> +	if (!vq)
> +		return -EINVAL;
> +
> +	q_data = mxc_jpeg_get_q_data(ctx, f->type);
> +
> +	if (vb2_is_busy(vq)) {
> +		v4l2_err(&jpeg->v4l2_dev, "queue busy\n");
> +		return -EBUSY;
> +	}
> +
> +	q_data->fmt = mxc_jpeg_find_format(ctx, pix_mp->pixelformat);
> +	q_data->w = pix_mp->width;
> +	q_data->h = pix_mp->height;
> +
> +	q_data->w_adjusted = q_data->w;
> +	q_data->h_adjusted = q_data->h;
> +	if (jpeg->mode == MXC_JPEG_DECODE) {
> +		/*
> +		 * align up the resolution for CAST IP,
> +		 * but leave the buffer resolution unchanged
> +		 */
> +		v4l_bound_align_image(&q_data->w_adjusted,
> +				      q_data->w_adjusted,  /* adjust upwards */
> +				      MXC_JPEG_MAX_WIDTH,
> +				      q_data->fmt->h_align,
> +				      &q_data->h_adjusted,
> +				      q_data->h_adjusted, /* adjust upwards */
> +				      MXC_JPEG_MAX_HEIGHT,
> +				      q_data->fmt->v_align,
> +				      0);
> +	} else {
> +		/*
> +		 * align down the resolution for CAST IP,
> +		 * but leave the buffer resolution unchanged
> +		 */
> +		v4l_bound_align_image(&q_data->w_adjusted,
> +				      MXC_JPEG_MIN_WIDTH,
> +				      q_data->w_adjusted, /* adjust downwards*/
> +				      q_data->fmt->h_align,
> +				      &q_data->h_adjusted,
> +				      MXC_JPEG_MIN_HEIGHT,
> +				      q_data->h_adjusted, /* adjust downwards*/
> +				      q_data->fmt->v_align,
> +				      0);
> +	}
> +
> +	ctx->colorspace = pix_mp->colorspace;
> +	ctx->ycbcr_enc = pix_mp->ycbcr_enc;
> +	ctx->xfer_func = pix_mp->xfer_func;
> +	ctx->quantization = pix_mp->quantization;
> +
> +	for (i = 0; i < pix_mp->num_planes; i++) {
> +		q_data->bytesperline[i] = pix_mp->plane_fmt[i].bytesperline;
> +		q_data->sizeimage[i] = pix_mp->plane_fmt[i].sizeimage;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mxc_jpeg_s_fmt_vid_cap(struct file *file, void *priv,
> +				  struct v4l2_format *f)
> +{
> +	int ret;
> +
> +	ret = mxc_jpeg_try_fmt_vid_cap(file, priv, f);
> +	if (ret)
> +		return ret;
> +
> +	return mxc_jpeg_s_fmt(mxc_jpeg_fh_to_ctx(priv), f);
> +}
> +
> +static int mxc_jpeg_s_fmt_vid_out(struct file *file, void *priv,
> +				  struct v4l2_format *f)
> +{
> +	int ret;
> +
> +	ret = mxc_jpeg_try_fmt_vid_out(file, priv, f);
> +	if (ret)
> +		return ret;
> +
> +	return mxc_jpeg_s_fmt(mxc_jpeg_fh_to_ctx(priv), f);
> +}
> +
> +static int mxc_jpeg_g_fmt_vid(struct file *file, void *priv,
> +			      struct v4l2_format *f)
> +{
> +	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(priv);
> +	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
> +	struct device *dev = jpeg->dev;
> +	struct v4l2_pix_format_mplane   *pix_mp = &f->fmt.pix_mp;
> +	struct mxc_jpeg_q_data *q_data = mxc_jpeg_get_q_data(ctx, f->type);
> +	int i;
> +
> +	if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
> +		dev_err(dev, "G_FMT with Invalid type: %d\n", f->type);
> +		return -EINVAL;
> +	}
> +
> +	pix_mp->pixelformat = q_data->fmt->fourcc;
> +	pix_mp->width = q_data->w;
> +	pix_mp->height = q_data->h;
> +	pix_mp->field = V4L2_FIELD_NONE;
> +	pix_mp->colorspace = ctx->colorspace;
> +	pix_mp->ycbcr_enc = ctx->ycbcr_enc;
> +	pix_mp->xfer_func = ctx->xfer_func;
> +	pix_mp->quantization = ctx->quantization;
> +	pix_mp->num_planes = q_data->fmt->colplanes;
> +	for (i = 0; i < pix_mp->num_planes; i++) {
> +		pix_mp->plane_fmt[i].bytesperline = q_data->bytesperline[i];
> +		pix_mp->plane_fmt[i].sizeimage = q_data->sizeimage[i];
> +	}
> +
> +	return 0;
> +}
> +
> +static int mxc_jpeg_subscribe_event(struct v4l2_fh *fh,
> +				    const struct v4l2_event_subscription *sub)
> +{
> +	switch (sub->type) {
> +	case V4L2_EVENT_EOS:
> +		return v4l2_event_subscribe(fh, sub, 0, NULL);
> +	case V4L2_EVENT_SOURCE_CHANGE:
> +		return v4l2_src_change_event_subscribe(fh, sub);
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int mxc_jpeg_qbuf(struct file *file, void *priv,
> +			 struct v4l2_buffer *buf)
> +{
> +	struct v4l2_fh *fh = file->private_data;
> +	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(priv);
> +	struct device *dev = ctx->mxc_jpeg->dev;
> +	struct vb2_queue *vq;
> +
> +	dev_dbg(dev, "QBUF type=%d, index=%d", buf->type, buf->index);
> +	vq = v4l2_m2m_get_vq(fh->m2m_ctx, buf->type);
> +	if (buf->index >= vq->num_buffers) {
> +		dev_err(dev, "buffer index out of range\n");
> +		return -EINVAL;
> +	}
> +
> +	return v4l2_m2m_qbuf(file, fh->m2m_ctx, buf);
> +}
> +
> +static int mxc_jpeg_dqbuf(struct file *file, void *priv,
> +			  struct v4l2_buffer *buf)
> +{
> +	struct v4l2_fh *fh = file->private_data;
> +	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(priv);
> +	struct device *dev = ctx->mxc_jpeg->dev;
> +	int num_src_ready = v4l2_m2m_num_src_bufs_ready(fh->m2m_ctx);
> +	int ret;
> +
> +	dev_dbg(dev, "DQBUF type=%d, index=%d", buf->type, buf->index);
> +	if (ctx->stopping == 1	&& num_src_ready == 0) {
> +		/* No more src bufs, notify app EOS */
> +		notify_eos(ctx);
> +		ctx->stopping = 0;
> +	}
> +
> +	ret = v4l2_m2m_dqbuf(file, fh->m2m_ctx, buf);
> +	buf->field = V4L2_FIELD_NONE;
> +
> +	return ret;
> +}
> +
> +static const struct v4l2_ioctl_ops mxc_jpeg_ioctl_ops = {
> +	.vidioc_querycap		= mxc_jpeg_querycap,
> +	.vidioc_enum_fmt_vid_cap	= mxc_jpeg_enum_fmt_vid_cap,
> +	.vidioc_enum_fmt_vid_out	= mxc_jpeg_enum_fmt_vid_out,
> +
> +	.vidioc_try_fmt_vid_cap_mplane	= mxc_jpeg_try_fmt_vid_cap,
> +	.vidioc_try_fmt_vid_out_mplane	= mxc_jpeg_try_fmt_vid_out,
> +
> +	.vidioc_s_fmt_vid_cap_mplane	= mxc_jpeg_s_fmt_vid_cap,
> +	.vidioc_s_fmt_vid_out_mplane	= mxc_jpeg_s_fmt_vid_out,
> +
> +	.vidioc_g_fmt_vid_cap_mplane	= mxc_jpeg_g_fmt_vid,
> +	.vidioc_g_fmt_vid_out_mplane	= mxc_jpeg_g_fmt_vid,
> +
> +	.vidioc_subscribe_event		= mxc_jpeg_subscribe_event,
> +	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
> +
> +	.vidioc_try_decoder_cmd		= mxc_jpeg_try_decoder_cmd,
> +	.vidioc_decoder_cmd		= mxc_jpeg_decoder_cmd,
> +	.vidioc_try_encoder_cmd		= mxc_jpeg_try_encoder_cmd,
> +	.vidioc_encoder_cmd		= mxc_jpeg_encoder_cmd,
> +
> +	.vidioc_qbuf			= mxc_jpeg_qbuf,
> +	.vidioc_dqbuf                   = mxc_jpeg_dqbuf,
> +
> +	.vidioc_create_bufs		= v4l2_m2m_ioctl_create_bufs,
> +	.vidioc_prepare_buf		= v4l2_m2m_ioctl_prepare_buf,
> +	.vidioc_reqbufs                 = v4l2_m2m_ioctl_reqbufs,
> +	.vidioc_querybuf                = v4l2_m2m_ioctl_querybuf,
> +	.vidioc_expbuf                  = v4l2_m2m_ioctl_expbuf,
> +	.vidioc_streamon                = v4l2_m2m_ioctl_streamon,
> +	.vidioc_streamoff               = v4l2_m2m_ioctl_streamoff,
> +};
> +
> +static int mxc_jpeg_release(struct file *file)
> +{
> +	struct mxc_jpeg_dev *mxc_jpeg = video_drvdata(file);
> +	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(file->private_data);
> +	struct device *dev = mxc_jpeg->dev;
> +
> +	mutex_lock(&mxc_jpeg->lock);
> +	if (mxc_jpeg->mode == MXC_JPEG_DECODE)
> +		dev_dbg(dev, "Release JPEG decoder instance on slot %d.",
> +			ctx->slot);
> +	else
> +		dev_dbg(dev, "Release JPEG encoder instance on slot %d.",
> +			ctx->slot);
> +	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
> +	v4l2_fh_del(&ctx->fh);
> +	v4l2_fh_exit(&ctx->fh);
> +	kfree(ctx);
> +	mutex_unlock(&mxc_jpeg->lock);
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_file_operations mxc_jpeg_fops = {
> +	.owner		= THIS_MODULE,
> +	.open		= mxc_jpeg_open,
> +	.release	= mxc_jpeg_release,
> +	.poll		= v4l2_m2m_fop_poll,
> +	.unlocked_ioctl	= video_ioctl2,
> +	.mmap		= v4l2_m2m_fop_mmap,
> +};
> +
> +static struct v4l2_m2m_ops mxc_jpeg_m2m_ops = {
> +	.device_run	= mxc_jpeg_device_run,
> +};
> +
> +static void mxc_jpeg_detach_pm_domains(struct mxc_jpeg_dev *jpeg)
> +{
> +	int i;
> +
> +	for (i = 0; i < jpeg->num_domains; i++) {
> +		if (jpeg->pd_link[i] && !IS_ERR(jpeg->pd_link[i]))
> +			device_link_del(jpeg->pd_link[i]);
> +		if (jpeg->pd_dev[i] && !IS_ERR(jpeg->pd_dev[i]))
> +			dev_pm_domain_detach(jpeg->pd_dev[i], true);
> +		jpeg->pd_dev[i] = NULL;
> +		jpeg->pd_link[i] = NULL;
> +	}
> +}
> +
> +static int mxc_jpeg_attach_pm_domains(struct mxc_jpeg_dev *jpeg)
> +{
> +	struct device *dev = jpeg->dev;
> +	struct device_node *np = jpeg->pdev->dev.of_node;
> +	int i;
> +	int ret;
> +
> +	jpeg->num_domains = of_count_phandle_with_args(np, "power-domains",
> +						       "#power-domain-cells");
> +	if (jpeg->num_domains < 0) {
> +		dev_err(dev, "No power domains defined for jpeg node\n");
> +		return jpeg->num_domains;
> +	}
> +
> +	jpeg->pd_dev = devm_kmalloc_array(dev, jpeg->num_domains,
> +					  sizeof(*jpeg->pd_dev), GFP_KERNEL);
> +	if (!jpeg->pd_dev)
> +		return -ENOMEM;
> +
> +	jpeg->pd_link = devm_kmalloc_array(dev, jpeg->num_domains,
> +					   sizeof(*jpeg->pd_link), GFP_KERNEL);
> +	if (!jpeg->pd_link)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < jpeg->num_domains; i++) {
> +		jpeg->pd_dev[i] = dev_pm_domain_attach_by_id(dev, i);
> +		if (IS_ERR(jpeg->pd_dev[i])) {
> +			ret = PTR_ERR(jpeg->pd_dev[i]);
> +			goto fail;
> +		}
> +
> +		jpeg->pd_link[i] = device_link_add(dev, jpeg->pd_dev[i],
> +						   DL_FLAG_STATELESS |
> +						   DL_FLAG_PM_RUNTIME |
> +						   DL_FLAG_RPM_ACTIVE);
> +		if (IS_ERR(jpeg->pd_link[i])) {
> +			ret = PTR_ERR(jpeg->pd_link[i]);
> +			goto fail;
> +		}
> +	}
> +
> +	return 0;
> +fail:
> +	mxc_jpeg_detach_pm_domains(jpeg);
> +	return ret;
> +}
> +
> +static int mxc_jpeg_probe(struct platform_device *pdev)
> +{
> +	struct mxc_jpeg_dev *jpeg;
> +	struct device *dev = &pdev->dev;
> +	struct resource *res;
> +	int dec_irq;
> +	int ret;
> +	int mode;
> +	const struct of_device_id *of_id;
> +	unsigned int slot;
> +
> +	of_id = of_match_node(mxc_jpeg_match, dev->of_node);
> +	mode = (int)(u64)of_id->data;
> +
> +	jpeg = devm_kzalloc(dev, sizeof(struct mxc_jpeg_dev), GFP_KERNEL);
> +	if (!jpeg)
> +		return -ENOMEM;
> +
> +	mutex_init(&jpeg->lock);
> +	spin_lock_init(&jpeg->hw_lock);
> +
> +	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
> +	if (ret) {
> +		dev_err(&pdev->dev, "No suitable DMA available.\n");
> +		goto err_irq;
> +	}
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	jpeg->base_reg = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(jpeg->base_reg))
> +		return PTR_ERR(jpeg->base_reg);
> +
> +	for (slot = 0; slot < MXC_MAX_SLOTS; slot++) {
> +		dec_irq = platform_get_irq(pdev, slot);
> +		if (dec_irq < 0) {
> +			dev_err(&pdev->dev, "Failed to get irq %d\n", dec_irq);
> +			ret = dec_irq;
> +			goto err_irq;
> +		}
> +		ret = devm_request_irq(&pdev->dev, dec_irq, mxc_jpeg_dec_irq,
> +				       0, pdev->name, jpeg);
> +		if (ret) {
> +			dev_err(&pdev->dev, "Failed to request irq %d (%d)\n",
> +				dec_irq, ret);
> +			goto err_irq;
> +		}
> +	}
> +
> +	jpeg->pdev = pdev;
> +	jpeg->dev = dev;
> +	jpeg->mode = mode;
> +
> +	ret = mxc_jpeg_attach_pm_domains(jpeg);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to attach power domains %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* v4l2 */
> +	ret = v4l2_device_register(dev, &jpeg->v4l2_dev);
> +	if (ret) {
> +		dev_err(dev, "failed to register v4l2 device\n");
> +		goto err_register;
> +	}
> +	jpeg->m2m_dev = v4l2_m2m_init(&mxc_jpeg_m2m_ops);
> +	if (IS_ERR(jpeg->m2m_dev)) {
> +		dev_err(dev, "failed to register v4l2 device\n");
> +		goto err_m2m;
> +	}
> +
> +	jpeg->dec_vdev = video_device_alloc();
> +	if (!jpeg->dec_vdev) {
> +		dev_err(dev, "failed to register v4l2 device\n");
> +		goto err_vdev_alloc;
> +	}
> +	if (mode == MXC_JPEG_ENCODE)
> +		snprintf(jpeg->dec_vdev->name,
> +			 sizeof(jpeg->dec_vdev->name),
> +			 "%s-enc", MXC_JPEG_NAME);
> +	else
> +		snprintf(jpeg->dec_vdev->name,
> +			 sizeof(jpeg->dec_vdev->name),
> +			 "%s-dec", MXC_JPEG_NAME);
> +
> +	jpeg->dec_vdev->fops = &mxc_jpeg_fops;
> +	jpeg->dec_vdev->ioctl_ops = &mxc_jpeg_ioctl_ops;
> +	jpeg->dec_vdev->minor = -1;
> +	jpeg->dec_vdev->release = video_device_release;
> +	jpeg->dec_vdev->lock = &jpeg->lock; /* lock for ioctl serialization */
> +	jpeg->dec_vdev->v4l2_dev = &jpeg->v4l2_dev;
> +	jpeg->dec_vdev->vfl_dir = VFL_DIR_M2M;
> +	jpeg->dec_vdev->device_caps = V4L2_CAP_STREAMING |
> +					V4L2_CAP_VIDEO_M2M_MPLANE;
> +
> +	ret = video_register_device(jpeg->dec_vdev, VFL_TYPE_GRABBER, -1);
> +	if (ret) {
> +		dev_err(dev, "failed to register video device\n");
> +		goto err_vdev_register;
> +	}
> +	video_set_drvdata(jpeg->dec_vdev, jpeg);
> +	if (mode == MXC_JPEG_ENCODE)
> +		v4l2_info(&jpeg->v4l2_dev,
> +			  "encoder device registered as /dev/video%d (%d,%d)\n",
> +			  jpeg->dec_vdev->num, VIDEO_MAJOR,
> +			  jpeg->dec_vdev->minor);
> +	else
> +		v4l2_info(&jpeg->v4l2_dev,
> +			  "decoder device registered as /dev/video%d (%d,%d)\n",
> +			  jpeg->dec_vdev->num, VIDEO_MAJOR,
> +			  jpeg->dec_vdev->minor);
> +
> +	platform_set_drvdata(pdev, jpeg);
> +
> +	return 0;
> +
> +err_vdev_register:
> +	video_device_release(jpeg->dec_vdev);
> +
> +err_vdev_alloc:
> +	v4l2_m2m_release(jpeg->m2m_dev);
> +
> +err_m2m:
> +	v4l2_device_unregister(&jpeg->v4l2_dev);
> +
> +err_register:
> +err_irq:
> +	return ret;
> +}
> +
> +static int mxc_jpeg_remove(struct platform_device *pdev)
> +{
> +	unsigned int slot;
> +	struct mxc_jpeg_dev *jpeg = platform_get_drvdata(pdev);
> +
> +	for (slot = 0; slot < MXC_MAX_SLOTS; slot++)
> +		mxc_jpeg_free_slot_data(jpeg, slot);
> +
> +	video_unregister_device(jpeg->dec_vdev);
> +	video_device_release(jpeg->dec_vdev);
> +	v4l2_m2m_release(jpeg->m2m_dev);
> +	v4l2_device_unregister(&jpeg->v4l2_dev);
> +	mxc_jpeg_detach_pm_domains(jpeg);
> +
> +	return 0;
> +}
> +
> +MODULE_DEVICE_TABLE(of, mxc_jpeg_match);
> +
> +static struct platform_driver mxc_jpeg_driver = {
> +	.probe = mxc_jpeg_probe,
> +	.remove = mxc_jpeg_remove,
> +	.driver = {
> +		.name = "mxc-jpeg",
> +		.of_match_table = mxc_jpeg_match,
> +	},
> +};
> +module_platform_driver(mxc_jpeg_driver);
> +
> +MODULE_AUTHOR("Zhengyu Shen <zhengyu.shen_1@nxp.com>");
> +MODULE_AUTHOR("Mirela Rabulea <mirela.rabulea@nxp.com>");
> +MODULE_DESCRIPTION("V4L2 driver for i.MX8 QXP/QM JPEG encoder/decoder");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/media/platform/imx-jpeg/mxc-jpeg.h b/drivers/media/platform/imx-jpeg/mxc-jpeg.h
> new file mode 100644
> index 0000000..5c9abea
> --- /dev/null
> +++ b/drivers/media/platform/imx-jpeg/mxc-jpeg.h
> @@ -0,0 +1,188 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * i.MX8QXP/i.MX8QM JPEG encoder/decoder v4l2 driver
> + *
> + * Copyright 2018-2019 NXP
> + */
> +
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-fh.h>
> +
> +#ifndef _MXC_JPEG_CORE_H
> +#define _MXC_JPEG_CORE_H
> +
> +#define MXC_JPEG_NAME			"mxc-jpeg"
> +#define MXC_JPEG_FMT_TYPE_ENC		0
> +#define MXC_JPEG_FMT_TYPE_RAW		1
> +#define MXC_JPEG_DEFAULT_WIDTH		1280
> +#define MXC_JPEG_DEFAULT_HEIGHT		720
> +#define MXC_JPEG_DEFAULT_PFMT		V4L2_PIX_FMT_RGB24
> +#define MXC_JPEG_MIN_WIDTH		64
> +#define MXC_JPEG_MIN_HEIGHT		64
> +#define MXC_JPEG_MAX_WIDTH		0x2000
> +#define MXC_JPEG_MAX_HEIGHT		0x2000
> +#define MXC_JPEG_MAX_CFG_STREAM		0x1000
> +#define MXC_JPEG_H_ALIGN		3
> +#define MXC_JPEG_W_ALIGN		3
> +#define MXC_JPEG_MAX_SIZEIMAGE		0xFFFFFC00
> +#define MXC_JPEG_MAX_PLANES		2
> +
> +enum mxc_jpeg_enc_state {
> +	MXC_JPEG_ENCODING	= 0, /* jpeg encode phase */
> +	MXC_JPEG_ENC_CONF	= 1, /* jpeg encoder config phase */
> +};
> +
> +enum mxc_jpeg_mode {
> +	MXC_JPEG_DECODE	= 0, /* jpeg decode mode */
> +	MXC_JPEG_ENCODE	= 1, /* jpeg encode mode */
> +};
> +
> +/**
> + * struct jpeg_fmt - driver's internal color format data
> + * @name:	format description
> + * @fourcc:	fourcc code, 0 if not applicable
> + * @depth:	number of bits per pixel
> + * @colplanes:	number of color planes (1 for packed formats)
> + * @h_align:	horizontal alignment order (align to 2^h_align)
> + * @v_align:	vertical alignment order (align to 2^v_align)
> + * @flags:	flags describing format applicability
> + */
> +struct mxc_jpeg_fmt {
> +	char	*name;
> +	u32	fourcc;
> +	int	depth;
> +	int	colplanes;
> +	int	h_align;
> +	int	v_align;
> +	u32	flags;
> +};
> +
> +struct mxc_jpeg_desc {
> +	u32 next_descpt_ptr;
> +	u32 buf_base0;
> +	u32 buf_base1;
> +	u32 line_pitch;
> +	u32 stm_bufbase;
> +	u32 stm_bufsize;
> +	u32 imgsize;
> +	u32 stm_ctrl;
> +} __packed;
> +
> +struct mxc_jpeg_q_data {
> +	struct mxc_jpeg_fmt	*fmt;
> +	u32			sizeimage[MXC_JPEG_MAX_PLANES];
> +	u32			bytesperline[MXC_JPEG_MAX_PLANES];
> +	int			w;
> +	int			w_adjusted;
> +	int			h;
> +	int			h_adjusted;
> +	unsigned int		sequence;
> +};
> +
> +struct mxc_jpeg_ctx {
> +	struct mxc_jpeg_dev		*mxc_jpeg;
> +	struct mxc_jpeg_q_data		out_q;
> +	struct mxc_jpeg_q_data		cap_q;
> +	struct v4l2_fh			fh;
> +	enum mxc_jpeg_enc_state		enc_state;
> +	unsigned int			stopping;
> +	unsigned int			slot;
> +	enum v4l2_colorspace		colorspace;
> +	enum v4l2_ycbcr_encoding	ycbcr_enc;
> +	enum v4l2_quantization		quantization;
> +	enum v4l2_xfer_func		xfer_func;
> +};
> +
> +struct mxc_jpeg_slot_data {
> +	bool used;
> +	struct mxc_jpeg_desc *desc; // enc/dec descriptor
> +	struct mxc_jpeg_desc *cfg_desc; // configuration descriptor
> +	void *cfg_stream_vaddr; // configuration bitstream virtual address
> +	unsigned int cfg_stream_size;
> +	dma_addr_t desc_handle;
> +	dma_addr_t cfg_desc_handle; // configuration descriptor dma address
> +	dma_addr_t cfg_stream_handle; // configuration bitstream dma address
> +};
> +
> +struct mxc_jpeg_dev {
> +	spinlock_t			hw_lock; /* hardware access lock */
> +	unsigned int			mode;
> +	struct mutex			lock; /* v4l2 ioctls serialization */
> +	struct platform_device		*pdev;
> +	struct device			*dev;
> +	void __iomem			*base_reg;
> +	struct v4l2_device		v4l2_dev;
> +	struct v4l2_m2m_dev		*m2m_dev;
> +	struct video_device		*dec_vdev;
> +	struct mxc_jpeg_slot_data	slot_data[MXC_MAX_SLOTS];
> +	int				num_domains;
> +	struct device			**pd_dev;
> +	struct device_link		**pd_link;
> +};
> +
> +/* JPEG marker identifiers */
> +#define SOF0				0xC0
> +#define SOF1				0xC1
> +#define SOF2				0xC2
> +#define SOS				0xDA
> +#define DHT				0xC4
> +#define APP14				0xEE
> +
> +/**
> + * struct mxc_jpeg_sof_comp - JPEG Start Of Frame component fields
> + * @id:				component id
> + * @v:				vertical sampling
> + * @h:				horizontal sampling
> + * @quantization_table_no:	id of quantization table
> + */
> +struct mxc_jpeg_sof_comp {
> +	u8 id;
> +	u8 v :4;
> +	u8 h :4;
> +	u8 quantization_table_no;
> +} __packed;
> +
> +#define MXC_JPEG_MAX_COMPONENTS 4
> +/**
> + * struct mxc_jpeg_sof - JPEG Start Of Frame marker fields
> + * @length:		Start of Frame length
> + * @precision:		precision (bits per pixel per color component)
> + * @height:		image height
> + * @width:		image width
> + * @components_no:	number of color components
> + * @comp:		component fields for each color component
> + */
> +struct mxc_jpeg_sof {
> +	u16 length;
> +	u8 precision;
> +	u16 height, width;
> +	u8 components_no;
> +	struct mxc_jpeg_sof_comp comp[MXC_JPEG_MAX_COMPONENTS];
> +} __packed;
> +
> +/**
> + * struct mxc_jpeg_sof - JPEG Start Of Scan component fields
> + * @id:			component id
> + * @huffman_table_no:	id of the Huffman table
> + */
> +struct mxc_jpeg_sos_comp {
> +	u8 id; /*component id*/
> +	u8 huffman_table_no;
> +} __packed;
> +
> +/**
> + * struct mxc_jpeg_sof - JPEG Start Of Scan marker fields
> + * @length:		Start of Frame length
> + * @components_no:	number of color components
> + * @comp:		SOS component fields for each color component
> + * @ignorable_bytes:	ignorable bytes
> + */
> +struct mxc_jpeg_sos {
> +	u16 length;
> +	u8 components_no;
> +	struct mxc_jpeg_sos_comp comp[MXC_JPEG_MAX_COMPONENTS];
> +	u8 ignorable_bytes[3];
> +} __packed;
> +
> +#endif
> 

Regards,

	Hans
