Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 940E3416E8E
	for <lists+linux-media@lfdr.de>; Fri, 24 Sep 2021 11:09:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245117AbhIXJLD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Sep 2021 05:11:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244533AbhIXJLC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Sep 2021 05:11:02 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39731C061574;
        Fri, 24 Sep 2021 02:09:29 -0700 (PDT)
Received: from [IPv6:2a01:e0a:4cb:a870:c58e:ea8f:b5a4:d24f] (unknown [IPv6:2a01:e0a:4cb:a870:c58e:ea8f:b5a4:d24f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B2DDB1F449D7;
        Fri, 24 Sep 2021 10:09:26 +0100 (BST)
Subject: Re: [PATCH v5 08/10] media: hantro: Prepare for other G2 codecs
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-staging@lists.linux.dev
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Fabio Estevam <festevam@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Heiko Stuebner <heiko@sntech.de>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>, kernel@collabora.com
References: <20210922101146.13762-1-andrzej.p@collabora.com>
 <20210922101146.13762-9-andrzej.p@collabora.com>
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
Message-ID: <61875214-d059-8105-6f5f-a0c7c37cb64f@collabora.com>
Date:   Fri, 24 Sep 2021 11:09:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210922101146.13762-9-andrzej.p@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Le 22/09/2021 à 12:11, Andrzej Pietrasiewicz a écrit :
> VeriSilicon Hantro G2 core supports other codecs besides hevc.
> Factor out some common code in preparation for vp9 support.

Reviewed-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

>
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> ---
>   drivers/staging/media/hantro/Makefile         |  1 +
>   drivers/staging/media/hantro/hantro.h         |  7 +++++
>   drivers/staging/media/hantro/hantro_g2.c      | 27 ++++++++++++++++
>   .../staging/media/hantro/hantro_g2_hevc_dec.c | 31 -------------------
>   drivers/staging/media/hantro/hantro_g2_regs.h |  7 +++++
>   drivers/staging/media/hantro/hantro_hw.h      |  2 ++
>   6 files changed, 44 insertions(+), 31 deletions(-)
>   create mode 100644 drivers/staging/media/hantro/hantro_g2.c
>
> diff --git a/drivers/staging/media/hantro/Makefile b/drivers/staging/media/hantro/Makefile
> index 90036831fec4..fe6d84871d07 100644
> --- a/drivers/staging/media/hantro/Makefile
> +++ b/drivers/staging/media/hantro/Makefile
> @@ -12,6 +12,7 @@ hantro-vpu-y += \
>   		hantro_g1_mpeg2_dec.o \
>   		hantro_g2_hevc_dec.o \
>   		hantro_g1_vp8_dec.o \
> +		hantro_g2.o \
>   		rockchip_vpu2_hw_jpeg_enc.o \
>   		rockchip_vpu2_hw_h264_dec.o \
>   		rockchip_vpu2_hw_mpeg2_dec.o \
> diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
> index dd5e56765d4e..d91eb2b1c509 100644
> --- a/drivers/staging/media/hantro/hantro.h
> +++ b/drivers/staging/media/hantro/hantro.h
> @@ -369,6 +369,13 @@ static inline void vdpu_write(struct hantro_dev *vpu, u32 val, u32 reg)
>   	writel(val, vpu->dec_base + reg);
>   }
>   
> +static inline void hantro_write_addr(struct hantro_dev *vpu,
> +				     unsigned long offset,
> +				     dma_addr_t addr)
> +{
> +	vdpu_write(vpu, addr & 0xffffffff, offset);
> +}
> +
>   static inline u32 vdpu_read(struct hantro_dev *vpu, u32 reg)
>   {
>   	u32 val = readl(vpu->dec_base + reg);
> diff --git a/drivers/staging/media/hantro/hantro_g2.c b/drivers/staging/media/hantro/hantro_g2.c
> new file mode 100644
> index 000000000000..5f7bb27913de
> --- /dev/null
> +++ b/drivers/staging/media/hantro/hantro_g2.c
> @@ -0,0 +1,27 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Hantro VPU codec driver
> + *
> + * Copyright (C) 2021 Collabora Ltd, Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> + */
> +
> +#include "hantro_hw.h"
> +#include "hantro_g2_regs.h"
> +
> +void hantro_g2_check_idle(struct hantro_dev *vpu)
> +{
> +	int i;
> +
> +	for (i = 0; i < 3; i++) {
> +		u32 status;
> +
> +		/* Make sure the VPU is idle */
> +		status = vdpu_read(vpu, G2_REG_INTERRUPT);
> +		if (status & G2_REG_INTERRUPT_DEC_E) {
> +			dev_warn(vpu->dev, "device still running, aborting");
> +			status |= G2_REG_INTERRUPT_DEC_ABORT_E | G2_REG_INTERRUPT_DEC_IRQ_DIS;
> +			vdpu_write(vpu, status, G2_REG_INTERRUPT);
> +		}
> +	}
> +}
> +
> diff --git a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
> index 340efb57fd18..226cecda9495 100644
> --- a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
> +++ b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
> @@ -8,20 +8,6 @@
>   #include "hantro_hw.h"
>   #include "hantro_g2_regs.h"
>   
> -#define HEVC_DEC_MODE	0xC
> -
> -#define BUS_WIDTH_32		0
> -#define BUS_WIDTH_64		1
> -#define BUS_WIDTH_128		2
> -#define BUS_WIDTH_256		3
> -
> -static inline void hantro_write_addr(struct hantro_dev *vpu,
> -				     unsigned long offset,
> -				     dma_addr_t addr)
> -{
> -	vdpu_write(vpu, addr & 0xffffffff, offset);
> -}
> -
>   static void prepare_tile_info_buffer(struct hantro_ctx *ctx)
>   {
>   	struct hantro_dev *vpu = ctx->dev;
> @@ -516,23 +502,6 @@ static void set_buffers(struct hantro_ctx *ctx)
>   	hantro_write_addr(vpu, G2_TILE_BSD, ctx->hevc_dec.tile_bsd.dma);
>   }
>   
> -static void hantro_g2_check_idle(struct hantro_dev *vpu)
> -{
> -	int i;
> -
> -	for (i = 0; i < 3; i++) {
> -		u32 status;
> -
> -		/* Make sure the VPU is idle */
> -		status = vdpu_read(vpu, G2_REG_INTERRUPT);
> -		if (status & G2_REG_INTERRUPT_DEC_E) {
> -			dev_warn(vpu->dev, "device still running, aborting");
> -			status |= G2_REG_INTERRUPT_DEC_ABORT_E | G2_REG_INTERRUPT_DEC_IRQ_DIS;
> -			vdpu_write(vpu, status, G2_REG_INTERRUPT);
> -		}
> -	}
> -}
> -
>   int hantro_g2_hevc_dec_run(struct hantro_ctx *ctx)
>   {
>   	struct hantro_dev *vpu = ctx->dev;
> diff --git a/drivers/staging/media/hantro/hantro_g2_regs.h b/drivers/staging/media/hantro/hantro_g2_regs.h
> index bb22fa921914..0ac0ba375e80 100644
> --- a/drivers/staging/media/hantro/hantro_g2_regs.h
> +++ b/drivers/staging/media/hantro/hantro_g2_regs.h
> @@ -27,6 +27,13 @@
>   #define G2_REG_INTERRUPT_DEC_IRQ_DIS	BIT(4)
>   #define G2_REG_INTERRUPT_DEC_E		BIT(0)
>   
> +#define HEVC_DEC_MODE			0xc
> +
> +#define BUS_WIDTH_32			0
> +#define BUS_WIDTH_64			1
> +#define BUS_WIDTH_128			2
> +#define BUS_WIDTH_256			3
> +
>   #define g2_strm_swap		G2_DEC_REG(2, 28, 0xf)
>   #define g2_dirmv_swap		G2_DEC_REG(2, 20, 0xf)
>   
> diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
> index 4323e63dfbfc..42b3f3961f75 100644
> --- a/drivers/staging/media/hantro/hantro_hw.h
> +++ b/drivers/staging/media/hantro/hantro_hw.h
> @@ -308,4 +308,6 @@ void hantro_vp8_dec_exit(struct hantro_ctx *ctx);
>   void hantro_vp8_prob_update(struct hantro_ctx *ctx,
>   			    const struct v4l2_ctrl_vp8_frame *hdr);
>   
> +void hantro_g2_check_idle(struct hantro_dev *vpu);
> +
>   #endif /* HANTRO_HW_H_ */
