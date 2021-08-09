Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 290673E4226
	for <lists+linux-media@lfdr.de>; Mon,  9 Aug 2021 11:10:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234201AbhHIJKU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Aug 2021 05:10:20 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:58065 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234200AbhHIJKT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 9 Aug 2021 05:10:19 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id D1I6mzJsL4SnAD1I9mlhdk; Mon, 09 Aug 2021 11:09:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1628500197; bh=q7cXXKT1lXgYWykpC3RWwu538fA0k55LHJSL1HIwOns=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=W7inAdrtIlOI0KoiZ0ke1x9HBigFzN7IeE9YtLTiN6fn0iKfyTjpTsv6HvkF5pEaO
         bvO9bCiQeLFpdxP63RndkGcT91QRZw83kw3Qy3QIVvvJMplv+yfL13BgL6MiTT0ZP3
         lRzxvDBf7RpM50nbeI2qrKbee8bFSYpVgir+Hw5bysVNyKpKwjXPAkxg30qauvRBs1
         /9FKeW+6ffo8XfevEyLtFD9jUMMEZS6vhIVRpWSks1/hiq4mj96Ct4sCHAViTU/Nbw
         btXHmbPSJbI/SL5BfjNsjUN2fgpaA2mKAOuMrjZAmSsm0e3EzeNru8FkVugqAf8Glk
         MLwqweA3w3PDA==
Subject: Re: [PATCH v2 9/9] media: stm32-dma2d: STM32 DMA2D driver
To:     dillon.minfei@gmail.com, mchehab@kernel.org,
        mchehab+huawei@kernel.org, ezequiel@collabora.com,
        gnurou@gmail.com, pihsun@chromium.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org
Cc:     patrice.chotard@foss.st.com, hugues.fruchet@foss.st.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <1626341068-20253-1-git-send-email-dillon.minfei@gmail.com>
 <1626341068-20253-20-git-send-email-dillon.minfei@gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <cb22a3b2-5021-c246-d52b-dc6df78cd4c9@xs4all.nl>
Date:   Mon, 9 Aug 2021 11:09:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1626341068-20253-20-git-send-email-dillon.minfei@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfISknRiUtVc8eFRHEHKgLUSH/EYxNeoq7idWPALjXe2SsTg1jIKzxjt82939OapEsR9f5M0q1zsFyEXmiP/qI29QCfr4/zyflZMWPtT38eqQkBSYvZpx
 UHycLJxWN4vYJ4bt3+zjK6N8XZKBRF8dT6aslTMi/pPQe6l+x+l6NOB6EGTCjM0eb+aHCMvZYirPn2cMB7h6QXF8kFfF9YSbUDOu1CrWtKA9Bjcm1eZQtl6y
 5ESQ0kjy3uKzfQE5xXRkp1cdxrUqX2A1SY2lSzI2i30h/0kVN3GQUncZAmxmaoY6LJQTcXbGHGOW3pAq8zCmTa+CRymLEIqmiT6W8RDk4C0FEHRobZt+86Wz
 7fDvnt0CVH+7OkJ33yZe274YvnlRuokd/02GSWG2ufVATZbugHNaXtpJPfRPdEpI++4fKnEc3mnLtFk6gGdnHdhmeLs3kJiXJ3Ax7rCpgSG8aEePEOuM4iZI
 qKsa6kKitLqWelmPbBleQRkPUgrWiATlA8autZlGHCsHTaFjUaJOompWVuT7DSOGIc6rRuk9hwd9iWJ5GWHRUqNrHejR7QYIKZINMK9pykziqJgdwC9wMg8v
 TM8yQp/jJDgvjzHM73Or7P8uritetUy6/aaLYNKNeVOPvMLrweePg4T05R50FtwVTPR1FpmtelZ2pQZAs5DAHSG81G90OYgh0N24pURIJPiQ8Tp22kdH737B
 qsLiykB4vNCudSQUkEcleMUaQplYOoiL9qGpEi5Ikf8Jj2oCos+hom2dtnnJRVeOgsioy6oMeE2sf7bp8303nVUa1F1VmQ9AQQaJQgqCO9Fv3klUKBeEFshj
 qmp03caNlfX7WN1c8818yctCzPFzMk58IfSFS5o66+2ACD0G33uFc23zyvPw1Q==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15/07/2021 11:24, dillon.minfei@gmail.com wrote:
> From: Dillon Min <dillon.minfei@gmail.com>
> 
> This V4L2 subdev m2m driver enables Chrom-Art Accelerator unit
> of STMicroelectronics STM32 SoC series.
> 
> Currently support r2m, m2m, m2m_pfc functions.
> - r2m, Filling a part or the whole of a destination image with a specific
>   color.
> - m2m, Copying a part or the whole of a source image into a part or the
>   whole of a destination.
> - m2m_pfc, Copying a part or the whole of a source image into a part or the
>   whole of a destination image with a pixel format conversion.
> 
> Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> ---
> v2: all the changes are based on Hans's review, thanks.
> - update Kconfig, replace ',' to 'and', add '.' at the description end,
>   add COMPILE_TEST.
> - fix a lots of warrnings from checkpatch.pl --strict.
> - add const to formats[] and def_frame.
> - chage line_ofs to line_offset.
> - replace ctx->fg to ctx->cap.
> - change implemention of get_frame().
> - move the ioctls definition from the code to stm32-media.h.
> - change "Set to r2m mode" to "Set R2M Mode".
> - add decription for r2m, m2m, m2m_pfc.
> 
>  drivers/media/platform/Kconfig                  |   9 +
>  drivers/media/platform/Makefile                 |   1 +
>  drivers/media/platform/stm32/Makefile           |   2 +
>  drivers/media/platform/stm32/dma2d/dma2d-hw.c   | 143 +++++
>  drivers/media/platform/stm32/dma2d/dma2d-regs.h | 113 ++++
>  drivers/media/platform/stm32/dma2d/dma2d.c      | 796 ++++++++++++++++++++++++
>  drivers/media/platform/stm32/dma2d/dma2d.h      | 136 ++++
>  7 files changed, 1200 insertions(+)
>  create mode 100644 drivers/media/platform/stm32/dma2d/dma2d-hw.c
>  create mode 100644 drivers/media/platform/stm32/dma2d/dma2d-regs.h
>  create mode 100644 drivers/media/platform/stm32/dma2d/dma2d.c
>  create mode 100644 drivers/media/platform/stm32/dma2d/dma2d.h
> 
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index 157c924686e4..4df18623e4ad 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -473,6 +473,15 @@ config VIDEO_STI_DELTA_DRIVER
>  
>  endif # VIDEO_STI_DELTA
>  
> +config VIDEO_STM32_DMA2D
> +	tristate "STM32 Chrom-Art Accelerator (DMA2D)"
> +	depends on (VIDEO_DEV && VIDEO_V4L2 && ARCH_STM32) || COMPILE_TEST
> +	select VIDEOBUF2_DMA_CONTIG
> +	select V4L2_MEM2MEM_DEV
> +	help
> +	  The STM32 DMA2D is a memory-to-memory engine for pixel conversion
> +	  and specialized DMA dedicated to image manipulation.
> +
>  config VIDEO_RENESAS_FDP1
>  	tristate "Renesas Fine Display Processor"
>  	depends on VIDEO_DEV && VIDEO_V4L2
> diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
> index 73ce083c2fc6..46f1c05bc576 100644
> --- a/drivers/media/platform/Makefile
> +++ b/drivers/media/platform/Makefile
> @@ -70,6 +70,7 @@ obj-$(CONFIG_VIDEO_ATMEL_ISI)		+= atmel/
>  obj-$(CONFIG_VIDEO_ATMEL_XISC)		+= atmel/
>  
>  obj-$(CONFIG_VIDEO_STM32_DCMI)		+= stm32/
> +obj-$(CONFIG_VIDEO_STM32_DMA2D)		+= stm32/
>  
>  obj-$(CONFIG_VIDEO_MEDIATEK_VPU)	+= mtk-vpu/
>  
> diff --git a/drivers/media/platform/stm32/Makefile b/drivers/media/platform/stm32/Makefile
> index 48b36db2c2e2..896ef98a73ab 100644
> --- a/drivers/media/platform/stm32/Makefile
> +++ b/drivers/media/platform/stm32/Makefile
> @@ -1,2 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  obj-$(CONFIG_VIDEO_STM32_DCMI) += stm32-dcmi.o
> +stm32-dma2d-objs := dma2d/dma2d.o dma2d/dma2d-hw.o
> +obj-$(CONFIG_VIDEO_STM32_DMA2D) += stm32-dma2d.o
> diff --git a/drivers/media/platform/stm32/dma2d/dma2d-hw.c b/drivers/media/platform/stm32/dma2d/dma2d-hw.c
> new file mode 100644
> index 000000000000..8c1c664ab13b
> --- /dev/null
> +++ b/drivers/media/platform/stm32/dma2d/dma2d-hw.c
> @@ -0,0 +1,143 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * ST stm32 Chrom-Art - 2D Graphics Accelerator Driver
> + *
> + * Copyright (c) 2021 Dillon Min
> + * Dillon Min, <dillon.minfei@gmail.com>
> + *
> + * based on s5p-g2d
> + *
> + * Copyright (c) 2011 Samsung Electronics Co., Ltd.
> + * Kamil Debski, <k.debski@samsung.com>
> + */
> +
> +#include <linux/io.h>
> +
> +#include "dma2d.h"
> +#include "dma2d-regs.h"
> +
> +static inline u32 reg_read(void __iomem *base, u32 reg)
> +{
> +	return readl_relaxed(base + reg);
> +}
> +
> +static inline void reg_write(void __iomem *base, u32 reg, u32 val)
> +{
> +	writel_relaxed(val, base + reg);
> +}
> +
> +static inline void reg_set(void __iomem *base, u32 reg, u32 mask)
> +{
> +	reg_write(base, reg, reg_read(base, reg) | mask);
> +}
> +
> +static inline void reg_clear(void __iomem *base, u32 reg, u32 mask)
> +{
> +	reg_write(base, reg, reg_read(base, reg) & ~mask);
> +}
> +
> +static inline void reg_update_bits(void __iomem *base, u32 reg, u32 mask,
> +				   u32 val)
> +{
> +	reg_write(base, reg, (reg_read(base, reg) & ~mask) | val);
> +}
> +
> +void dma2d_start(struct dma2d_dev *d)
> +{
> +	reg_update_bits(d->regs, DMA2D_CR_REG, CR_START, CR_START);
> +}
> +
> +u32 dma2d_get_int(struct dma2d_dev *d)
> +{
> +	return reg_read(d->regs, DMA2D_ISR_REG);
> +}
> +
> +void dma2d_clear_int(struct dma2d_dev *d)
> +{
> +	u32 isr_val = reg_read(d->regs, DMA2D_ISR_REG);
> +
> +	reg_write(d->regs, DMA2D_IFCR_REG, isr_val & 0x003f);
> +}
> +
> +void dma2d_config_common(struct dma2d_dev *d, enum dma2d_op_mode op_mode,
> +			 u16 width, u16 height)
> +{
> +	reg_update_bits(d->regs, DMA2D_CR_REG, CR_MODE_MASK,
> +			op_mode << CR_MODE_SHIFT);
> +
> +	reg_write(d->regs, DMA2D_NLR_REG, (width << 16) | height);
> +}
> +
> +void dma2d_config_out(struct dma2d_dev *d, struct dma2d_frame *frm,
> +		      dma_addr_t o_addr)
> +{
> +	reg_update_bits(d->regs, DMA2D_CR_REG, CR_CEIE, CR_CEIE);
> +	reg_update_bits(d->regs, DMA2D_CR_REG, CR_CTCIE, CR_CTCIE);
> +	reg_update_bits(d->regs, DMA2D_CR_REG, CR_CAEIE, CR_CAEIE);
> +	reg_update_bits(d->regs, DMA2D_CR_REG, CR_TCIE, CR_TCIE);
> +	reg_update_bits(d->regs, DMA2D_CR_REG, CR_TEIE, CR_TEIE);
> +
> +	if (frm->fmt->cmode >= CM_MODE_ARGB8888 &&
> +	    frm->fmt->cmode <= CM_MODE_ARGB4444)
> +		reg_update_bits(d->regs, DMA2D_OPFCCR_REG, OPFCCR_CM_MASK,
> +				frm->fmt->cmode);
> +
> +	reg_write(d->regs, DMA2D_OMAR_REG, o_addr);
> +
> +	reg_write(d->regs, DMA2D_OCOLR_REG,
> +		  (frm->a_rgb[3] << 24) |
> +		  (frm->a_rgb[2] << 16) |
> +		  (frm->a_rgb[1] << 8) |
> +		  frm->a_rgb[0]);
> +
> +	reg_update_bits(d->regs, DMA2D_OOR_REG, OOR_LO_MASK,
> +			frm->line_offset & 0x3fff);
> +}
> +
> +void dma2d_config_fg(struct dma2d_dev *d, struct dma2d_frame *frm,
> +		     dma_addr_t f_addr)
> +{
> +	reg_write(d->regs, DMA2D_FGMAR_REG, f_addr);
> +	reg_update_bits(d->regs, DMA2D_FGOR_REG, FGOR_LO_MASK,
> +			frm->line_offset);
> +
> +	if (frm->fmt->cmode >= CM_MODE_ARGB8888 &&
> +	    frm->fmt->cmode <= CM_MODE_A4)
> +		reg_update_bits(d->regs, DMA2D_FGPFCCR_REG, FGPFCCR_CM_MASK,
> +				frm->fmt->cmode);
> +
> +	reg_update_bits(d->regs, DMA2D_FGPFCCR_REG, FGPFCCR_AM_MASK,
> +			(frm->a_mode << 16) & 0x03);
> +
> +	reg_update_bits(d->regs, DMA2D_FGPFCCR_REG, FGPFCCR_ALPHA_MASK,
> +			frm->a_rgb[3] << 24);
> +
> +	reg_write(d->regs, DMA2D_FGCOLR_REG,
> +		  (frm->a_rgb[2] << 16) |
> +		  (frm->a_rgb[1] << 8) |
> +		  frm->a_rgb[0]);
> +}
> +
> +void dma2d_config_bg(struct dma2d_dev *d, struct dma2d_frame *frm,
> +		     dma_addr_t b_addr)
> +{
> +	reg_write(d->regs, DMA2D_BGMAR_REG, b_addr);
> +	reg_update_bits(d->regs, DMA2D_BGOR_REG, BGOR_LO_MASK,
> +			frm->line_offset);
> +
> +	if (frm->fmt->cmode >= CM_MODE_ARGB8888 &&
> +	    frm->fmt->cmode <= CM_MODE_A4)
> +		reg_update_bits(d->regs, DMA2D_BGPFCCR_REG, BGPFCCR_CM_MASK,
> +				frm->fmt->cmode);
> +
> +	reg_update_bits(d->regs, DMA2D_BGPFCCR_REG, BGPFCCR_AM_MASK,
> +			(frm->a_mode << 16) & 0x03);
> +
> +	reg_update_bits(d->regs, DMA2D_BGPFCCR_REG, BGPFCCR_ALPHA_MASK,
> +			frm->a_rgb[3] << 24);
> +
> +	reg_write(d->regs, DMA2D_BGCOLR_REG,
> +		  (frm->a_rgb[2] << 16) |
> +		  (frm->a_rgb[1] << 8) |
> +		  frm->a_rgb[0]);
> +}
> diff --git a/drivers/media/platform/stm32/dma2d/dma2d-regs.h b/drivers/media/platform/stm32/dma2d/dma2d-regs.h
> new file mode 100644
> index 000000000000..2128364406c8
> --- /dev/null
> +++ b/drivers/media/platform/stm32/dma2d/dma2d-regs.h
> @@ -0,0 +1,113 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * ST stm32 Chrom-Art - 2D Graphics Accelerator Driver
> + *
> + * Copyright (c) 2021 Dillon Min
> + * Dillon Min, <dillon.minfei@gmail.com>
> + *
> + * based on s5p-g2d
> + *
> + * Copyright (c) 2011 Samsung Electronics Co., Ltd.
> + * Kamil Debski, <k.debski@samsung.com>
> + */
> +
> +#ifndef __DMA2D_REGS_H__
> +#define __DMA2D_REGS_H__
> +
> +#define DMA2D_CR_REG		0x0000
> +#define CR_MODE_MASK		GENMASK(17, 16)
> +#define CR_MODE_SHIFT		16
> +#define CR_M2M			0x0000
> +#define CR_M2M_PFC		BIT(16)
> +#define CR_M2M_BLEND		BIT(17)
> +#define CR_R2M			(BIT(17) | BIT(16))
> +#define CR_CEIE			BIT(13)
> +#define CR_CTCIE		BIT(12)
> +#define CR_CAEIE		BIT(11)
> +#define CR_TWIE			BIT(10)
> +#define CR_TCIE			BIT(9)
> +#define CR_TEIE			BIT(8)
> +#define CR_ABORT		BIT(2)
> +#define CR_SUSP			BIT(1)
> +#define CR_START		BIT(0)
> +
> +#define DMA2D_ISR_REG		0x0004
> +#define ISR_CEIF		BIT(5)
> +#define ISR_CTCIF		BIT(4)
> +#define ISR_CAEIF		BIT(3)
> +#define ISR_TWIF		BIT(2)
> +#define ISR_TCIF		BIT(1)
> +#define ISR_TEIF		BIT(0)
> +
> +#define DMA2D_IFCR_REG		0x0008
> +#define IFCR_CCEIF		BIT(5)
> +#define IFCR_CCTCIF		BIT(4)
> +#define IFCR_CAECIF		BIT(3)
> +#define IFCR_CTWIF		BIT(2)
> +#define IFCR_CTCIF		BIT(1)
> +#define IFCR_CTEIF		BIT(0)
> +
> +#define DMA2D_FGMAR_REG		0x000c
> +#define DMA2D_FGOR_REG		0x0010
> +#define FGOR_LO_MASK		GENMASK(13, 0)
> +
> +#define DMA2D_BGMAR_REG		0x0014
> +#define DMA2D_BGOR_REG		0x0018
> +#define BGOR_LO_MASK		GENMASK(13, 0)
> +
> +#define DMA2D_FGPFCCR_REG	0x001c
> +#define FGPFCCR_ALPHA_MASK	GENMASK(31, 24)
> +#define FGPFCCR_AM_MASK		GENMASK(17, 16)
> +#define FGPFCCR_CS_MASK		GENMASK(15, 8)
> +#define FGPFCCR_START		BIT(5)
> +#define FGPFCCR_CCM_RGB888	BIT(4)
> +#define FGPFCCR_CM_MASK		GENMASK(3, 0)
> +
> +#define DMA2D_FGCOLR_REG	0x0020
> +#define FGCOLR_REG_MASK		GENMASK(23, 16)
> +#define FGCOLR_GREEN_MASK	GENMASK(15, 8)
> +#define FGCOLR_BLUE_MASK	GENMASK(7, 0)
> +
> +#define DMA2D_BGPFCCR_REG	0x0024
> +#define BGPFCCR_ALPHA_MASK	GENMASK(31, 24)
> +#define BGPFCCR_AM_MASK		GENMASK(17, 16)
> +#define BGPFCCR_CS_MASK		GENMASK(15, 8)
> +#define BGPFCCR_START		BIT(5)
> +#define BGPFCCR_CCM_RGB888	BIT(4)
> +#define BGPFCCR_CM_MASK		GENMASK(3, 0)
> +
> +#define DMA2D_BGCOLR_REG	0x0028
> +#define BGCOLR_REG_MASK		GENMASK(23, 16)
> +#define BGCOLR_GREEN_MASK	GENMASK(15, 8)
> +#define BGCOLR_BLUE_MASK	GENMASK(7, 0)
> +
> +#define DMA2D_OPFCCR_REG	0x0034
> +#define OPFCCR_CM_MASK		GENMASK(2, 0)
> +
> +#define DMA2D_OCOLR_REG		0x0038
> +#define OCOLR_ALPHA_MASK	GENMASK(31, 24)
> +#define OCOLR_RED_MASK		GENMASK(23, 16)
> +#define OCOLR_GREEN_MASK	GENMASK(15, 8)
> +#define OCOLR_BLUE_MASK		GENMASK(7, 0)
> +
> +#define DMA2D_OMAR_REG		0x003c
> +
> +#define DMA2D_OOR_REG		0x0040
> +#define OOR_LO_MASK		GENMASK(13, 0)
> +
> +#define DMA2D_NLR_REG		0x0044
> +#define NLR_PL_MASK		GENMASK(29, 16)
> +#define NLR_NL_MASK		GENMASK(15, 0)
> +
> +/* Hardware limits */
> +#define MAX_WIDTH		0x3fff
> +#define MAX_HEIGHT		0xffff
> +
> +#define DEFAULT_WIDTH		240
> +#define DEFAULT_HEIGHT		320
> +#define DEFAULT_SIZE		307200
> +
> +#define CM_MODE_ARGB8888	0x00
> +#define CM_MODE_ARGB4444	0x04
> +#define CM_MODE_A4		0x0a
> +#endif /* __DMA2D_REGS_H__ */
> diff --git a/drivers/media/platform/stm32/dma2d/dma2d.c b/drivers/media/platform/stm32/dma2d/dma2d.c
> new file mode 100644
> index 000000000000..f41f94dfb7b7
> --- /dev/null
> +++ b/drivers/media/platform/stm32/dma2d/dma2d.c
> @@ -0,0 +1,796 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * STM32 DMA2D - 2D Graphics Accelerator Driver
> + *
> + * Copyright (c) 2021 Dillon Min
> + * Dillon Min, <dillon.minfei@gmail.com>
> + *
> + * based on s5p-g2d
> + *
> + * Copyright (c) 2011 Samsung Electronics Co., Ltd.
> + * Kamil Debski, <k.debski@samsung.com>
> + */
> +
> +#include <linux/module.h>
> +#include <linux/fs.h>
> +#include <linux/timer.h>
> +#include <linux/sched.h>
> +#include <linux/slab.h>
> +#include <linux/clk.h>
> +#include <linux/interrupt.h>
> +#include <linux/of.h>
> +
> +#include <linux/platform_device.h>
> +#include <media/v4l2-mem2mem.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-ioctl.h>
> +#include <media/v4l2-event.h>
> +#include <media/videobuf2-v4l2.h>
> +#include <media/videobuf2-dma-contig.h>
> +#include <uapi/linux/stm32-media.h>
> +
> +#include "dma2d.h"
> +#include "dma2d-regs.h"
> +
> +/*
> + * This V4L2 subdev m2m driver enables Chrom-Art Accelerator unit
> + * of STMicroelectronics STM32 SoC series.
> + *
> + * Currently support r2m, m2m, m2m_pfc.
> + *
> + * - r2m, Filling a part or the whole of a destination image with a specific
> + *   color.
> + * - m2m, Copying a part or the whole of a source image into a part or the
> + *   whole of a destination.
> + * - m2m_pfc, Copying a part or the whole of a source image into a part or the
> + *   whole of a destination image with a pixel format conversion.
> + */
> +
> +#define fh2ctx(__fh) container_of(__fh, struct dma2d_ctx, fh)
> +
> +static const struct dma2d_fmt formats[] = {
> +	{
> +		.fourcc	= V4L2_PIX_FMT_ARGB32,
> +		.cmode = DMA2D_CMODE_ARGB8888,
> +		.depth = 32,
> +	},
> +	{
> +		.fourcc	= V4L2_PIX_FMT_RGB24,
> +		.cmode = DMA2D_CMODE_RGB888,
> +		.depth = 24,
> +	},
> +	{
> +		.fourcc	= V4L2_PIX_FMT_RGB565,
> +		.cmode = DMA2D_CMODE_RGB565,
> +		.depth = 16,
> +	},
> +	{
> +		.fourcc	= V4L2_PIX_FMT_ARGB555,
> +		.cmode = DMA2D_CMODE_ARGB1555,
> +		.depth = 16,
> +	},
> +	{
> +		.fourcc	= V4L2_PIX_FMT_ARGB444,
> +		.cmode = DMA2D_CMODE_ARGB4444,
> +		.depth = 16,
> +	},
> +};
> +
> +#define NUM_FORMATS ARRAY_SIZE(formats)
> +
> +static const struct dma2d_frame def_frame = {
> +	.width		= DEFAULT_WIDTH,
> +	.height		= DEFAULT_HEIGHT,
> +	.line_offset	= 0,
> +	.a_rgb		= {0x00, 0x00, 0x00, 0xff},
> +	.a_mode		= DMA2D_ALPHA_MODE_NO_MODIF,
> +	.fmt		= (struct dma2d_fmt *)&formats[0],
> +	.size		= DEFAULT_SIZE,
> +};
> +
> +static struct dma2d_fmt *find_fmt(int pixelformat)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < NUM_FORMATS; i++) {
> +		if (formats[i].fourcc == pixelformat)
> +			return (struct dma2d_fmt *)&formats[i];
> +	}
> +
> +	return NULL;
> +}
> +
> +static struct dma2d_frame *get_frame(struct dma2d_ctx *ctx,
> +				     enum v4l2_buf_type type)
> +{
> +	return V4L2_TYPE_IS_OUTPUT(type) ? &ctx->cap : &ctx->out;
> +}
> +
> +static int dma2d_queue_setup(struct vb2_queue *vq,
> +			     unsigned int *nbuffers, unsigned int *nplanes,
> +			     unsigned int sizes[], struct device *alloc_devs[])
> +{
> +	struct dma2d_ctx *ctx = vb2_get_drv_priv(vq);
> +	struct dma2d_frame *f = get_frame(ctx, vq->type);
> +
> +	if (IS_ERR(f))
> +		return PTR_ERR(f);

Why this check? get_frame() doesn't return an error pointer, it always succeeds.
Just drop this.

> +
> +	if (*nplanes)
> +		return sizes[0] < f->size ? -EINVAL : 0;
> +
> +	sizes[0] = f->size;
> +	*nplanes = 1;
> +
> +	if (*nbuffers == 0)
> +		*nbuffers = 1;

*nbuffers can never be 0, so you can drop this check.

> +
> +	return 0;
> +}
> +
> +static int dma2d_buf_out_validate(struct vb2_buffer *vb)
> +{
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +
> +	if (vbuf->field == V4L2_FIELD_ANY)
> +		vbuf->field = V4L2_FIELD_NONE;
> +	if (vbuf->field != V4L2_FIELD_NONE)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static int dma2d_buf_prepare(struct vb2_buffer *vb)
> +{
> +	struct dma2d_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
> +	struct dma2d_frame *f = get_frame(ctx, vb->vb2_queue->type);
> +
> +	if (IS_ERR(f))
> +		return PTR_ERR(f);

Drop this check.

> +
> +	if (vb2_plane_size(vb, 0) < f->size)
> +		return -EINVAL;
> +
> +	vb2_set_plane_payload(vb, 0, f->size);
> +
> +	return 0;
> +}
> +
> +static void dma2d_buf_queue(struct vb2_buffer *vb)
> +{
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +	struct dma2d_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
> +
> +	v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
> +}
> +
> +static int dma2d_start_streaming(struct vb2_queue *q, unsigned int count)
> +{
> +	struct dma2d_ctx *ctx = vb2_get_drv_priv(q);
> +	struct dma2d_frame *f = get_frame(ctx, q->type);
> +
> +	if (IS_ERR(f))
> +		return -EINVAL;

Drop check.

> +
> +	f->sequence = 0;
> +	return 0;
> +}
> +
> +static void dma2d_stop_streaming(struct vb2_queue *q)
> +{
> +	struct dma2d_ctx *ctx = vb2_get_drv_priv(q);
> +	struct vb2_v4l2_buffer *vbuf;
> +
> +	for (;;) {
> +		if (V4L2_TYPE_IS_OUTPUT(q->type))
> +			vbuf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> +		else
> +			vbuf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> +		if (!vbuf)
> +			return;
> +		v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
> +	}
> +}
> +
> +static const struct vb2_ops dma2d_qops = {
> +	.queue_setup	= dma2d_queue_setup,
> +	.buf_out_validate	 = dma2d_buf_out_validate,
> +	.buf_prepare	= dma2d_buf_prepare,
> +	.buf_queue	= dma2d_buf_queue,
> +	.start_streaming = dma2d_start_streaming,
> +	.stop_streaming  = dma2d_stop_streaming,
> +	.wait_prepare	= vb2_ops_wait_prepare,
> +	.wait_finish	= vb2_ops_wait_finish,
> +};
> +
> +static int queue_init(void *priv, struct vb2_queue *src_vq,
> +		      struct vb2_queue *dst_vq)
> +{
> +	struct dma2d_ctx *ctx = priv;
> +	int ret;
> +
> +	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
> +	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
> +	src_vq->drv_priv = ctx;
> +	src_vq->ops = &dma2d_qops;
> +	src_vq->mem_ops = &vb2_dma_contig_memops;
> +	src_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
> +	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> +	src_vq->lock = &ctx->dev->mutex;
> +	src_vq->dev = ctx->dev->v4l2_dev.dev;
> +
> +	ret = vb2_queue_init(src_vq);
> +	if (ret)
> +		return ret;
> +
> +	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> +	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
> +	dst_vq->drv_priv = ctx;
> +	dst_vq->ops = &dma2d_qops;
> +	dst_vq->mem_ops = &vb2_dma_contig_memops;
> +	dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
> +	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> +	dst_vq->lock = &ctx->dev->mutex;
> +	dst_vq->dev = ctx->dev->v4l2_dev.dev;
> +
> +	return vb2_queue_init(dst_vq);
> +}
> +
> +static int dma2d_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct dma2d_frame *frm;
> +	struct dma2d_ctx *ctx = container_of(ctrl->handler, struct dma2d_ctx,
> +								ctrl_handler);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&ctx->dev->ctrl_lock, flags);
> +	switch (ctrl->id) {
> +	case V4L2_CID_ALPHA_COMPONENT:
> +		/* set the background alpha value*/
> +		ctx->alpha_component = (u8)ctrl->val;

It's set here, but is never used?!

> +		break;
> +	case V4L2_CID_DMA2D_R2M_COLOR:
> +		frm = get_frame(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
> +		frm->a_rgb[2] = (ctrl->val >> 16) & 0xff;
> +		frm->a_rgb[1] = (ctrl->val >>  8) & 0xff;
> +		frm->a_rgb[0] = ctrl->val & 0xff;

Hmm, the alpha value isn't copied, but that's documented in V4L2_CID_DMA2D_R2M_COLOR.
Either this code or the documentation is wrong.

> +		break;
> +	case V4L2_CID_DMA2D_R2M_MODE:
> +		if (ctrl->val)
> +			ctx->op_mode = DMA2D_MODE_R2M;
> +		break;
> +	default:
> +		v4l2_err(&ctx->dev->v4l2_dev, "Invalid control\n");
> +		spin_unlock_irqrestore(&ctx->dev->ctrl_lock, flags);
> +		return -EINVAL;
> +	}
> +	spin_unlock_irqrestore(&ctx->dev->ctrl_lock, flags);
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_ctrl_ops dma2d_ctrl_ops = {
> +	.s_ctrl	= dma2d_s_ctrl,
> +};
> +
> +static const struct v4l2_ctrl_config dma2d_r2m_control[] = {
> +	{
> +	.ops = &dma2d_ctrl_ops,
> +	.id = V4L2_CID_DMA2D_R2M_COLOR,
> +	.name = "R2M Alpha/Color Value",

This mentions alpha support as well. Very unclear how this relates to V4L2_CID_ALPHA_COMPONENT.

> +	.type = V4L2_CTRL_TYPE_INTEGER,
> +	.min = 0xffffffff80000000ULL,
> +	.max = 0x7fffffff,

I suggest using TYPE_BITMASK: it's more appropriate for a control like this.
(Yes, there are other color controls that are of type integer, but they predate
the introduction of type bitmask).

> +	.def = 0,
> +	.step = 1,
> +	},
> +	{
> +	.ops = &dma2d_ctrl_ops,
> +	.id = V4L2_CID_DMA2D_R2M_MODE,
> +	.name = "Set R2M Mode",
> +	.type = V4L2_CTRL_TYPE_BOOLEAN,
> +	.min = 0,
> +	.max = 1,
> +	.def = 0,
> +	.step = 1,
> +	}
> +};

It's not clear what R2M mode does. Is it just to enable filling the colors? Or will
there be other features in the future?

As it is now, this feature can instead be implemented by adding a new color effect
(see V4L2_CID_COLORFX): V4L2_COLORFX_SET_COLOR_ARGB.

And add a new bitmask control V4L2_CID_COLORFX_ARGB to set the ARGB value.

> +
> +static int dma2d_setup_ctrls(struct dma2d_ctx *ctx)
> +{
> +	v4l2_ctrl_handler_init(&ctx->ctrl_handler, 3);
> +
> +	v4l2_ctrl_new_std(&ctx->ctrl_handler, &dma2d_ctrl_ops,
> +			  V4L2_CID_ALPHA_COMPONENT, 0, 255, 1, 255);
> +	v4l2_ctrl_new_custom(&ctx->ctrl_handler, &dma2d_r2m_control[0], NULL);
> +	v4l2_ctrl_new_custom(&ctx->ctrl_handler, &dma2d_r2m_control[1], NULL);
> +
> +	return 0;
> +}
> +
> +static int dma2d_open(struct file *file)
> +{
> +	struct dma2d_dev *dev = video_drvdata(file);
> +	struct dma2d_ctx *ctx = NULL;
> +	int ret = 0;
> +
> +	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +	ctx->dev = dev;
> +	/* Set default formats */
> +	ctx->cap		= def_frame;
> +	ctx->bg		= def_frame;
> +	ctx->out	= def_frame;
> +	ctx->op_mode	= DMA2D_MODE_M2M_FPC;
> +	ctx->colorspace = V4L2_COLORSPACE_REC709;
> +	ctx->alpha_component = 0x00;
> +	if (mutex_lock_interruptible(&dev->mutex)) {
> +		kfree(ctx);
> +		return -ERESTARTSYS;
> +	}
> +
> +	ctx->fh.m2m_ctx = v4l2_m2m_ctx_init(dev->m2m_dev, ctx, &queue_init);
> +	if (IS_ERR(ctx->fh.m2m_ctx)) {
> +		ret = PTR_ERR(ctx->fh.m2m_ctx);
> +		mutex_unlock(&dev->mutex);
> +		kfree(ctx);
> +		return ret;
> +	}
> +
> +	v4l2_fh_init(&ctx->fh, video_devdata(file));
> +	file->private_data = &ctx->fh;
> +	v4l2_fh_add(&ctx->fh);
> +
> +	dma2d_setup_ctrls(ctx);
> +
> +	/* Write the default values to the ctx struct */
> +	v4l2_ctrl_handler_setup(&ctx->ctrl_handler);
> +
> +	ctx->fh.ctrl_handler = &ctx->ctrl_handler;
> +	mutex_unlock(&dev->mutex);
> +
> +	return 0;
> +}
> +
> +static int dma2d_release(struct file *file)
> +{
> +	struct dma2d_dev *dev = video_drvdata(file);
> +	struct dma2d_ctx *ctx = fh2ctx(file->private_data);
> +
> +	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
> +	v4l2_fh_del(&ctx->fh);
> +	v4l2_fh_exit(&ctx->fh);
> +	mutex_lock(&dev->mutex);
> +	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
> +	mutex_unlock(&dev->mutex);
> +	kfree(ctx);
> +
> +	return 0;
> +}
> +
> +static int vidioc_querycap(struct file *file, void *priv,
> +			   struct v4l2_capability *cap)
> +{
> +	strscpy(cap->driver, DMA2D_NAME, sizeof(cap->driver));
> +	strscpy(cap->card, DMA2D_NAME, sizeof(cap->card));
> +	strscpy(cap->bus_info, BUS_INFO, sizeof(cap->bus_info));
> +
> +	return 0;
> +}
> +
> +static int vidioc_enum_fmt(struct file *file, void *prv, struct v4l2_fmtdesc *f)
> +{
> +	if (f->index >= NUM_FORMATS)
> +		return -EINVAL;
> +
> +	f->pixelformat = formats[f->index].fourcc;
> +	return 0;
> +}
> +
> +static int vidioc_g_fmt(struct file *file, void *prv, struct v4l2_format *f)
> +{
> +	struct dma2d_ctx *ctx = prv;
> +	struct vb2_queue *vq;
> +	struct dma2d_frame *frm;
> +
> +	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
> +	if (!vq)
> +		return -EINVAL;
> +
> +	frm = get_frame(ctx, f->type);
> +	if (IS_ERR(frm))
> +		return PTR_ERR(frm);
> +
> +	f->fmt.pix.width		= frm->width;
> +	f->fmt.pix.height		= frm->height;
> +	f->fmt.pix.field		= V4L2_FIELD_NONE;
> +	f->fmt.pix.pixelformat		= frm->fmt->fourcc;
> +	f->fmt.pix.bytesperline		= (frm->width * frm->fmt->depth) >> 3;
> +	f->fmt.pix.sizeimage		= frm->size;
> +	f->fmt.pix.colorspace		= ctx->colorspace;
> +	f->fmt.pix.xfer_func		= ctx->xfer_func;
> +	f->fmt.pix.ycbcr_enc		= ctx->ycbcr_enc;
> +	f->fmt.pix.quantization		= ctx->quant;
> +
> +	return 0;
> +}
> +
> +static int vidioc_try_fmt(struct file *file, void *prv, struct v4l2_format *f)
> +{
> +	struct dma2d_ctx *ctx = prv;
> +	struct dma2d_dev *dev = ctx->dev;
> +	struct dma2d_fmt *fmt;
> +	enum v4l2_field *field;
> +	u32 fourcc = f->fmt.pix.pixelformat;
> +
> +	fmt = find_fmt(fourcc);
> +	if (!fmt) {
> +		v4l2_warn(&dev->v4l2_dev,
> +			  "Format not supported: %c%c%c%c, use the default.\n",
> +			  (fourcc & 0xff),  (fourcc >>  8) & 0xff,
> +			  (fourcc >> 16) & 0xff, (fourcc >> 24) & 0xff);
> +		f->fmt.pix.pixelformat = formats[0].fourcc;
> +		fmt = find_fmt(f->fmt.pix.pixelformat);
> +	}
> +
> +	field = &f->fmt.pix.field;
> +	if (*field == V4L2_FIELD_ANY)
> +		*field = V4L2_FIELD_NONE;
> +	else if (*field != V4L2_FIELD_NONE)
> +		return -EINVAL;
> +
> +	if (f->fmt.pix.width > MAX_WIDTH)
> +		f->fmt.pix.width = MAX_WIDTH;
> +	if (f->fmt.pix.height > MAX_HEIGHT)
> +		f->fmt.pix.height = MAX_HEIGHT;
> +
> +	if (f->fmt.pix.width < 1)
> +		f->fmt.pix.width = 1;
> +	if (f->fmt.pix.height < 1)
> +		f->fmt.pix.height = 1;
> +
> +	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT && !f->fmt.pix.colorspace) {
> +		f->fmt.pix.colorspace = V4L2_COLORSPACE_REC709;
> +	} else if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
> +		f->fmt.pix.colorspace	= ctx->colorspace;
> +		f->fmt.pix.xfer_func = ctx->xfer_func;
> +		f->fmt.pix.ycbcr_enc = ctx->ycbcr_enc;
> +		f->fmt.pix.quantization = ctx->quant;
> +	}
> +	f->fmt.pix.bytesperline = (f->fmt.pix.width * fmt->depth) >> 3;
> +	f->fmt.pix.sizeimage = f->fmt.pix.height * f->fmt.pix.bytesperline;
> +
> +	return 0;
> +}
> +
> +static int vidioc_s_fmt(struct file *file, void *prv, struct v4l2_format *f)
> +{
> +	struct dma2d_ctx *ctx = prv;
> +	struct dma2d_dev *dev = ctx->dev;
> +	struct vb2_queue *vq;
> +	struct dma2d_frame *frm;
> +	struct dma2d_fmt *fmt;
> +	int ret = 0;
> +
> +	/* Adjust all values accordingly to the hardware capabilities
> +	 * and chosen format.
> +	 */
> +	ret = vidioc_try_fmt(file, prv, f);
> +	if (ret)
> +		return ret;
> +
> +	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
> +	if (vb2_is_busy(vq)) {
> +		v4l2_err(&dev->v4l2_dev, "queue (%d) bust\n", f->type);
> +		return -EBUSY;
> +	}
> +
> +	frm = get_frame(ctx, f->type);
> +	if (IS_ERR(frm))
> +		return PTR_ERR(frm);
> +
> +	fmt = find_fmt(f->fmt.pix.pixelformat);
> +	if (!fmt)
> +		return -EINVAL;
> +
> +	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT) {
> +		ctx->colorspace = f->fmt.pix.colorspace;
> +		ctx->xfer_func = f->fmt.pix.xfer_func;
> +		ctx->ycbcr_enc = f->fmt.pix.ycbcr_enc;
> +		ctx->quant = f->fmt.pix.quantization;
> +	}
> +
> +	frm->width	= f->fmt.pix.width;
> +	frm->height	= f->fmt.pix.height;
> +	frm->size	= f->fmt.pix.sizeimage;
> +	/* Reset crop settings */
> +	frm->o_width	= 0;
> +	frm->o_height	= 0;
> +	frm->c_width	= frm->width;
> +	frm->c_height	= frm->height;

Why store crop values when cropping is not supported? Just crop this, this seems to be
copy-and-paste from the samsung driver.

> +	frm->right	= frm->width;
> +	frm->bottom	= frm->height;
> +	frm->fmt	= fmt;
> +	frm->line_offset	= 0;
> +	if (f->fmt.win.global_alpha != 0) {

Huh? There is no f->fmt.win, this v4l2_format struct uses f->fmt.pix.

> +		frm->a_rgb[3] = f->fmt.win.global_alpha;
> +		frm->a_mode = DMA2D_ALPHA_MODE_REPLACE;

Again perhaps old copy-and-paste code from the samsung driver?

> +	}
> +
> +	return 0;
> +}
> +
> +static void device_run(void *prv)
> +{
> +	struct dma2d_ctx *ctx = prv;
> +	struct dma2d_dev *dev = ctx->dev;
> +	struct dma2d_frame *frm_out, *frm_cap;
> +	struct vb2_v4l2_buffer *src, *dst;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&dev->ctrl_lock, flags);
> +	dev->curr = ctx;
> +
> +	src = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> +	dst = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> +	if (!dst || !src)
> +		goto end;
> +
> +	frm_cap = get_frame(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
> +	frm_out = get_frame(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT);
> +	if (!frm_cap || !frm_out)
> +		goto end;
> +
> +	src->sequence = frm_out->sequence++;
> +	dst->sequence = frm_cap->sequence++;
> +	v4l2_m2m_buf_copy_metadata(src, dst, true);
> +
> +	clk_enable(dev->gate);
> +
> +	dma2d_config_fg(dev, frm_out,
> +			vb2_dma_contig_plane_dma_addr(&src->vb2_buf, 0));
> +
> +	/* TODO: add M2M_BLEND handler here */
> +
> +	if (ctx->op_mode != DMA2D_MODE_R2M) {
> +		if (frm_out->fmt->fourcc == frm_cap->fmt->fourcc)
> +			ctx->op_mode = DMA2D_MODE_M2M;
> +		else
> +			ctx->op_mode = DMA2D_MODE_M2M_FPC;
> +	}
> +
> +	dma2d_config_out(dev, frm_cap,
> +			 vb2_dma_contig_plane_dma_addr(&dst->vb2_buf, 0));
> +	dma2d_config_common(dev, ctx->op_mode, frm_cap->width, frm_cap->height);
> +
> +	dma2d_start(dev);
> +end:
> +	spin_unlock_irqrestore(&dev->ctrl_lock, flags);
> +}
> +
> +static irqreturn_t dma2d_isr(int irq, void *prv)
> +{
> +	struct dma2d_dev *dev = prv;
> +	struct dma2d_ctx *ctx = dev->curr;
> +	struct vb2_v4l2_buffer *src, *dst;
> +	u32 s = dma2d_get_int(dev);
> +
> +	if (s & ISR_TCIF || s == 0) {
> +		dma2d_clear_int(dev);
> +		clk_disable(dev->gate);
> +
> +		WARN_ON(!ctx);
> +
> +		src = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> +		dst = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> +
> +		WARN_ON(!dst);
> +		WARN_ON(!src);
> +
> +		v4l2_m2m_buf_done(src, VB2_BUF_STATE_DONE);
> +		v4l2_m2m_buf_done(dst, VB2_BUF_STATE_DONE);
> +		v4l2_m2m_job_finish(dev->m2m_dev, ctx->fh.m2m_ctx);
> +
> +		dev->curr = NULL;
> +	} else {
> +		dma2d_clear_int(dev);
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static const struct v4l2_file_operations dma2d_fops = {
> +	.owner		= THIS_MODULE,
> +	.open		= dma2d_open,
> +	.release	= dma2d_release,
> +	.poll		= v4l2_m2m_fop_poll,
> +	.unlocked_ioctl	= video_ioctl2,
> +	.mmap		= v4l2_m2m_fop_mmap,
> +#ifndef CONFIG_MMU
> +	.get_unmapped_area = v4l2_m2m_get_unmapped_area,
> +#endif
> +};
> +
> +static const struct v4l2_ioctl_ops dma2d_ioctl_ops = {
> +	.vidioc_querycap	= vidioc_querycap,
> +
> +	.vidioc_enum_fmt_vid_cap	= vidioc_enum_fmt,
> +	.vidioc_g_fmt_vid_cap		= vidioc_g_fmt,
> +	.vidioc_try_fmt_vid_cap		= vidioc_try_fmt,
> +	.vidioc_s_fmt_vid_cap		= vidioc_s_fmt,
> +
> +	.vidioc_enum_fmt_vid_out	= vidioc_enum_fmt,
> +	.vidioc_g_fmt_vid_out		= vidioc_g_fmt,
> +	.vidioc_try_fmt_vid_out		= vidioc_try_fmt,
> +	.vidioc_s_fmt_vid_out		= vidioc_s_fmt,
> +
> +	.vidioc_reqbufs			= v4l2_m2m_ioctl_reqbufs,
> +	.vidioc_querybuf		= v4l2_m2m_ioctl_querybuf,
> +	.vidioc_qbuf			= v4l2_m2m_ioctl_qbuf,
> +	.vidioc_dqbuf			= v4l2_m2m_ioctl_dqbuf,
> +	.vidioc_prepare_buf		= v4l2_m2m_ioctl_prepare_buf,
> +	.vidioc_create_bufs		= v4l2_m2m_ioctl_create_bufs,
> +	.vidioc_expbuf			= v4l2_m2m_ioctl_expbuf,
> +
> +	.vidioc_streamon		= v4l2_m2m_ioctl_streamon,
> +	.vidioc_streamoff		= v4l2_m2m_ioctl_streamoff,
> +
> +	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
> +	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
> +};
> +
> +static const struct video_device dma2d_videodev = {
> +	.name		= DMA2D_NAME,
> +	.fops		= &dma2d_fops,
> +	.ioctl_ops	= &dma2d_ioctl_ops,
> +	.minor		= -1,
> +	.release	= video_device_release,
> +	.vfl_dir	= VFL_DIR_M2M,
> +};
> +
> +static const struct v4l2_m2m_ops dma2d_m2m_ops = {
> +	.device_run	= device_run,
> +};
> +
> +static const struct of_device_id stm32_dma2d_match[];
> +
> +static int dma2d_probe(struct platform_device *pdev)
> +{
> +	struct dma2d_dev *dev;
> +	struct video_device *vfd;
> +	struct resource *res;
> +	int ret = 0;
> +
> +	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
> +	if (!dev)
> +		return -ENOMEM;
> +
> +	spin_lock_init(&dev->ctrl_lock);
> +	mutex_init(&dev->mutex);
> +	atomic_set(&dev->num_inst, 0);
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +
> +	dev->regs = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(dev->regs))
> +		return PTR_ERR(dev->regs);
> +
> +	dev->gate = clk_get(&pdev->dev, "dma2d");
> +	if (IS_ERR(dev->gate)) {
> +		dev_err(&pdev->dev, "failed to get dma2d clock gate\n");
> +		ret = -ENXIO;
> +		return ret;
> +	}
> +
> +	ret = clk_prepare(dev->gate);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to prepare dma2d clock gate\n");
> +		goto put_clk_gate;
> +	}
> +
> +	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> +	if (!res) {
> +		dev_err(&pdev->dev, "failed to find IRQ\n");
> +		ret = -ENXIO;
> +		goto unprep_clk_gate;
> +	}
> +
> +	dev->irq = res->start;
> +
> +	ret = devm_request_irq(&pdev->dev, dev->irq, dma2d_isr,
> +			       0, pdev->name, dev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to install IRQ\n");
> +		goto unprep_clk_gate;
> +	}
> +
> +	ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
> +	if (ret)
> +		goto unprep_clk_gate;
> +
> +	vfd = video_device_alloc();
> +	if (!vfd) {
> +		v4l2_err(&dev->v4l2_dev, "Failed to allocate video device\n");
> +		ret = -ENOMEM;
> +		goto unreg_v4l2_dev;
> +	}
> +
> +	*vfd = dma2d_videodev;
> +	set_bit(V4L2_FL_QUIRK_INVERTED_CROP, &vfd->flags);

Drop this quirk! Definitely copy-and-paste from the samsung driver, and not something
you want or need here.

> +	vfd->lock = &dev->mutex;
> +	vfd->v4l2_dev = &dev->v4l2_dev;
> +	vfd->device_caps = V4L2_CAP_VIDEO_M2M | V4L2_CAP_STREAMING;
> +	ret = video_register_device(vfd, VFL_TYPE_VIDEO, 0);

This must be done last, so move it to the end of the probe().

> +	if (ret) {
> +		v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
> +		goto rel_vdev;
> +	}
> +
> +	video_set_drvdata(vfd, dev);
> +	dev->vfd = vfd;
> +	v4l2_info(&dev->v4l2_dev, "device registered as /dev/video%d\n",
> +		  vfd->num);
> +	platform_set_drvdata(pdev, dev);
> +	dev->m2m_dev = v4l2_m2m_init(&dma2d_m2m_ops);
> +	if (IS_ERR(dev->m2m_dev)) {
> +		v4l2_err(&dev->v4l2_dev, "Failed to init mem2mem device\n");
> +		ret = PTR_ERR(dev->m2m_dev);
> +		goto unreg_video_dev;
> +	}
> +
> +	v4l2_info(&dev->v4l2_dev, "stm32 dma2d initialized\n");
> +	return 0;
> +
> +unreg_video_dev:
> +	video_unregister_device(dev->vfd);
> +rel_vdev:
> +	video_device_release(vfd);
> +unreg_v4l2_dev:
> +	v4l2_device_unregister(&dev->v4l2_dev);
> +unprep_clk_gate:
> +	clk_unprepare(dev->gate);
> +put_clk_gate:
> +	clk_put(dev->gate);
> +
> +	return ret;
> +}
> +
> +static int dma2d_remove(struct platform_device *pdev)
> +{
> +	struct dma2d_dev *dev = platform_get_drvdata(pdev);
> +
> +	v4l2_info(&dev->v4l2_dev, "Removing " DMA2D_NAME);
> +	v4l2_m2m_release(dev->m2m_dev);
> +	video_unregister_device(dev->vfd);
> +	v4l2_device_unregister(&dev->v4l2_dev);
> +	vb2_dma_contig_clear_max_seg_size(&pdev->dev);
> +	clk_unprepare(dev->gate);
> +	clk_put(dev->gate);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id stm32_dma2d_match[] = {
> +	{
> +		.compatible = "st,stm32-dma2d",
> +		.data = NULL,
> +	},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, stm32_dma2d_match);
> +
> +static struct platform_driver dma2d_pdrv = {
> +	.probe		= dma2d_probe,
> +	.remove		= dma2d_remove,
> +	.driver		= {
> +		.name = DMA2D_NAME,
> +		.of_match_table = stm32_dma2d_match,
> +	},
> +};
> +
> +module_platform_driver(dma2d_pdrv);
> +
> +MODULE_AUTHOR("Dillon Min <dillon.minfei@gmail.com>");
> +MODULE_DESCRIPTION("STM32 Chrom-Art Accelerator DMA2D driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/media/platform/stm32/dma2d/dma2d.h b/drivers/media/platform/stm32/dma2d/dma2d.h
> new file mode 100644
> index 000000000000..f317cf1dd35a
> --- /dev/null
> +++ b/drivers/media/platform/stm32/dma2d/dma2d.h
> @@ -0,0 +1,136 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * ST stm32 DMA2D - 2D Graphics Accelerator Driver
> + *
> + * Copyright (c) 2021 Dillon Min
> + * Dillon Min, <dillon.minfei@gmail.com>
> + *
> + * based on s5p-g2d
> + *
> + * Copyright (c) 2011 Samsung Electronics Co., Ltd.
> + * Kamil Debski, <k.debski@samsung.com>
> + */
> +
> +#ifndef __DMA2D_H__
> +#define __DMA2D_H__
> +
> +#include <linux/platform_device.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-ctrls.h>
> +
> +#define DMA2D_NAME "stm-dma2d"
> +#define BUS_INFO "platform:stm-dma2d"
> +enum dma2d_op_mode {
> +	DMA2D_MODE_M2M,
> +	DMA2D_MODE_M2M_FPC,
> +	DMA2D_MODE_M2M_BLEND,
> +	DMA2D_MODE_R2M
> +};
> +
> +enum dma2d_cmode {
> +	/* output pfc cmode from ARGB888 to ARGB4444 */
> +	DMA2D_CMODE_ARGB8888,
> +	DMA2D_CMODE_RGB888,
> +	DMA2D_CMODE_RGB565,
> +	DMA2D_CMODE_ARGB1555,
> +	DMA2D_CMODE_ARGB4444,
> +	/* bg or fg pfc cmode from L8 to A4 */
> +	DMA2D_CMODE_L8,
> +	DMA2D_CMODE_AL44,
> +	DMA2D_CMODE_AL88,
> +	DMA2D_CMODE_L4,
> +	DMA2D_CMODE_A8,
> +	DMA2D_CMODE_A4
> +};
> +
> +enum dma2d_alpha_mode {
> +	DMA2D_ALPHA_MODE_NO_MODIF,
> +	DMA2D_ALPHA_MODE_REPLACE,
> +	DMA2D_ALPHA_MODE_COMBINE
> +};
> +
> +struct dma2d_fmt {
> +	u32	fourcc;
> +	int	depth;
> +	enum dma2d_cmode cmode;
> +};
> +
> +struct dma2d_frame {
> +	/* Original dimensions */
> +	u32	width;
> +	u32	height;
> +	/* Crop size */
> +	u32	c_width;
> +	u32	c_height;
> +	/* Offset */
> +	u32	o_width;
> +	u32	o_height;
> +	u32	bottom;
> +	u32	right;
> +	u16	line_offset;
> +	/* Image format */
> +	struct dma2d_fmt *fmt;
> +	/* [0]: blue
> +	 * [1]: green
> +	 * [2]: red
> +	 * [3]: alpha
> +	 */
> +	u8	a_rgb[4];
> +	/*
> +	 * AM[1:0] of DMA2D_FGPFCCR
> +	 */
> +	enum dma2d_alpha_mode a_mode;
> +	u32 size;
> +	unsigned int	sequence;
> +};
> +
> +struct dma2d_ctx {
> +	struct v4l2_fh fh;
> +	struct dma2d_dev	*dev;
> +	struct dma2d_frame	cap;
> +	struct dma2d_frame	out;
> +	struct dma2d_frame	bg;
> +	/* fb_buf always point to bg address */
> +	struct v4l2_framebuffer	fb_buf;
> +	/*
> +	 * MODE[17:16] of DMA2D_CR
> +	 */
> +	enum dma2d_op_mode	op_mode;
> +	u8			alpha_component;
> +	struct v4l2_ctrl_handler ctrl_handler;
> +	enum v4l2_colorspace	colorspace;
> +	enum v4l2_ycbcr_encoding ycbcr_enc;
> +	enum v4l2_xfer_func	xfer_func;
> +	enum v4l2_quantization	quant;
> +};
> +
> +struct dma2d_dev {
> +	struct v4l2_device	v4l2_dev;
> +	struct v4l2_m2m_dev	*m2m_dev;
> +	struct video_device	*vfd;
> +	/* for device open/close etc */
> +	struct mutex		mutex;
> +	/* to avoid the conflict with device running and user setting
> +	 * at the same time
> +	 */
> +	spinlock_t		ctrl_lock;
> +	atomic_t		num_inst;
> +	void __iomem		*regs;
> +	struct clk		*gate;
> +	struct dma2d_ctx	*curr;
> +	int irq;
> +};
> +
> +void dma2d_start(struct dma2d_dev *d);
> +u32 dma2d_get_int(struct dma2d_dev *d);
> +void dma2d_clear_int(struct dma2d_dev *d);
> +void dma2d_config_out(struct dma2d_dev *d, struct dma2d_frame *frm,
> +		      dma_addr_t o_addr);
> +void dma2d_config_fg(struct dma2d_dev *d, struct dma2d_frame *frm,
> +		     dma_addr_t f_addr);
> +void dma2d_config_bg(struct dma2d_dev *d, struct dma2d_frame *frm,
> +		     dma_addr_t b_addr);
> +void dma2d_config_common(struct dma2d_dev *d, enum dma2d_op_mode op_mode,
> +			 u16 width, u16 height);
> +
> +#endif /* __DMA2D_H__ */
> 

Regards,

	Hans
