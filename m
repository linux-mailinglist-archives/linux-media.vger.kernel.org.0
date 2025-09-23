Return-Path: <linux-media+bounces-42991-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C7145B95E95
	for <lists+linux-media@lfdr.de>; Tue, 23 Sep 2025 14:58:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 383A12E6B85
	for <lists+linux-media@lfdr.de>; Tue, 23 Sep 2025 12:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A687324B13;
	Tue, 23 Sep 2025 12:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b="EWtnAt4h"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7417323F5D;
	Tue, 23 Sep 2025 12:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758632298; cv=pass; b=Op+B9k9hzx89+3ZDVPF6SZROmB2Ha6otvDapUyW/SeIXum2rgpuMGY2gLKGFxl2PxQ+Ug+wKPtr27YHK+D0bCxNLjl8BLBWyrlxJ0FW+KlYrcSZZ8JZ9Ru1uc8myQlk/slJOCq9cof5hfo/hvxrS3I0hiUpxYbMBTzpjchVtSMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758632298; c=relaxed/simple;
	bh=TFfd/CMAeIYUgJAmiS6E1z5NbdFEVS3jKsMpey0igzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tCHtYFbmwyGcGalq07trYDznut49aEymN6QfZy0SmoZVk8AdiYzCBDppqySx4HHNQ9DdZBvLg7dkdbw640VYDeeNfemTxCQP0CkbsnS8PdUR7R9uU5MGiAFbe8Rmp55905MKOA/mHIkWSvEYHFGbrfhXerLMjDlyoZF0yxAPWh8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b=EWtnAt4h; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1758632268; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YTayCFrWd6rTcDAoATSnM0jCA3h2mzracFb/11E6MitxsFo+zcLvZ8yexJSuoEEcnrS351UhX3rJHCR3WUqIizdqJaiHuFiKNyCdqjbhHM/ssz9JNG3KExP+Sh8+PosQbjvjVzCFWj1jsiTV1efknVRl6TDLZPRuJTayjm9lZbM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758632268; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=TiMGsq6XPaRxTuMMoW+mEb6/vs7hCKzZ6AU5Tv2hacw=; 
	b=ZNUoYFUwo/cLNpSyPUvJKKt3Z/ensfxvqlPtIeg9jd8XywYzNvmhtQaQdwKEHJ7uTkppHe397znCqaWisREfbLvmowSdiNUVi7ht/hjMKeRcXimMKwmM/83GSq/ZFogvK5HJeKFupEztK3ZG92Fa8xxPt1BFivl7930gX+3sOME=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758632268;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=TiMGsq6XPaRxTuMMoW+mEb6/vs7hCKzZ6AU5Tv2hacw=;
	b=EWtnAt4heAJugIaCYzxoLVIfVd4KEffARNPn2gbjUhYn/8GYVUrcCOHzAhtZ1qe2
	cSAMDXRazPxFXMAD4LttfOU4dxjD4Tnys9A1zA2uT9Taaa0hqTNsH6lkduDOgBQ3bRx
	lJmEyeK7dWQozbUAhW1TCZ9sjJCZS+ZxiS/pVvXc=
Received: by mx.zohomail.com with SMTPS id 1758632266182776.1698281398124;
	Tue, 23 Sep 2025 05:57:46 -0700 (PDT)
Message-ID: <e2c590a8-b77a-4878-891c-3e0f977e2d09@collabora.com>
Date: Tue, 23 Sep 2025 14:57:41 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: verisilicon: Fix CPU stalls on G2 bus error
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Hans Verkuil <hverkuil@kernel.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 Stable@vger.kernel.org
References: <20250922-imx8mq-hantro-g2-hang-v1-0-67d00eb6a548@collabora.com>
 <20250922-imx8mq-hantro-g2-hang-v1-1-67d00eb6a548@collabora.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20250922-imx8mq-hantro-g2-hang-v1-1-67d00eb6a548@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 22/09/2025 à 20:43, Nicolas Dufresne a écrit :
> In some seek stress tests, we are getting IRQ from the G2 decoder where
> the dec_bus_int and the dec_e bits are high, meaning the decoder is
> still running despite the error.
>
> Fix this by reworking the IRQ handler to only finish the job once we
> have reached completion and move the software reset to when our software
> watchdog triggers.
>
> This way, we let the hardware continue on errors when it did not self
> reset and in worse case scenario the hardware timeout will
> automatically stop it. The actual error will be fixed in a follow up
> patch.
>
> Fixes: 3385c514ecc5a ("media: hantro: Convert imx8m_vpu_g2_irq to helper")
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Reviewed-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

> ---
>   drivers/media/platform/verisilicon/hantro_g2.c     | 88 +++++++++++++++++-----
>   .../platform/verisilicon/hantro_g2_hevc_dec.c      |  2 -
>   .../media/platform/verisilicon/hantro_g2_regs.h    | 13 ++++
>   .../media/platform/verisilicon/hantro_g2_vp9_dec.c |  2 -
>   drivers/media/platform/verisilicon/hantro_hw.h     |  1 +
>   drivers/media/platform/verisilicon/imx8m_vpu_hw.c  |  2 +
>   6 files changed, 85 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/media/platform/verisilicon/hantro_g2.c b/drivers/media/platform/verisilicon/hantro_g2.c
> index aae0b562fabb1732b08bcd88b9007749a7849ba6..318673b66da884b89f31777dd8e69a934080cebf 100644
> --- a/drivers/media/platform/verisilicon/hantro_g2.c
> +++ b/drivers/media/platform/verisilicon/hantro_g2.c
> @@ -5,43 +5,93 @@
>    * Copyright (C) 2021 Collabora Ltd, Andrzej Pietrasiewicz <andrzej.p@collabora.com>
>    */
>   
> +#include <linux/delay.h>
>   #include "hantro_hw.h"
>   #include "hantro_g2_regs.h"
>   
>   #define G2_ALIGN	16
>   
> -void hantro_g2_check_idle(struct hantro_dev *vpu)
> +static bool hantro_g2_active(struct hantro_ctx *ctx)
>   {
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
> +	struct hantro_dev *vpu = ctx->dev;
> +	u32 status;
> +
> +	status = vdpu_read(vpu, G2_REG_INTERRUPT);
> +
> +	return (status & G2_REG_INTERRUPT_DEC_E);
> +}
> +
> +/**
> + * hantro_g2_reset:
> + * @ctx: the hantro context
> + *
> + * Emulates a reset using Hantro abort function. Failing this procedure would
> + * results in programming a running IP which leads to CPU hang.
> + *
> + * Using a hard reset procedure instead is prefferred.
> + */
> +void hantro_g2_reset(struct hantro_ctx *ctx)
> +{
> +	struct hantro_dev *vpu = ctx->dev;
> +	u32 status;
> +
> +	status = vdpu_read(vpu, G2_REG_INTERRUPT);
> +	if (status & G2_REG_INTERRUPT_DEC_E) {
> +		dev_warn_ratelimited(vpu->dev, "device still running, aborting");
> +		status |= G2_REG_INTERRUPT_DEC_ABORT_E | G2_REG_INTERRUPT_DEC_IRQ_DIS;
> +		vdpu_write(vpu, status, G2_REG_INTERRUPT);
> +
> +		do {
> +			mdelay(1);
> +		} while (hantro_g2_active(ctx));
>   	}
>   }
>   
>   irqreturn_t hantro_g2_irq(int irq, void *dev_id)
>   {
>   	struct hantro_dev *vpu = dev_id;
> -	enum vb2_buffer_state state;
>   	u32 status;
>   
>   	status = vdpu_read(vpu, G2_REG_INTERRUPT);
> -	state = (status & G2_REG_INTERRUPT_DEC_RDY_INT) ?
> -		 VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
>   
> -	vdpu_write(vpu, 0, G2_REG_INTERRUPT);
> -	vdpu_write(vpu, G2_REG_CONFIG_DEC_CLK_GATE_E, G2_REG_CONFIG);
> +	if (!(status & G2_REG_INTERRUPT_DEC_IRQ))
> +		return IRQ_NONE;
> +
> +	hantro_reg_write(vpu, &g2_dec_irq, 0);
> +	hantro_reg_write(vpu, &g2_dec_int_stat, 0);
> +	hantro_reg_write(vpu, &g2_clk_gate_e, 1);
> +
> +	if (status & G2_REG_INTERRUPT_DEC_RDY_INT) {
> +		hantro_irq_done(vpu, VB2_BUF_STATE_DONE);
> +		return IRQ_HANDLED;
> +	}
> +
> +	if (status & G2_REG_INTERRUPT_DEC_ABORT_INT) {
> +		/* disabled on abort, though lets be safe and handle it */
> +		dev_warn_ratelimited(vpu->dev, "decode operation aborted.");
> +		return IRQ_HANDLED;
> +	}
> +
> +	if (status & G2_REG_INTERRUPT_DEC_LAST_SLICE_INT)
> +		dev_warn_ratelimited(vpu->dev, "not all macroblocks were decoded.");
> +
> +	if (status & G2_REG_INTERRUPT_DEC_BUS_INT)
> +		dev_warn_ratelimited(vpu->dev, "bus error detected.");
> +
> +	if (status & G2_REG_INTERRUPT_DEC_ERROR_INT)
> +		dev_warn_ratelimited(vpu->dev, "decode error detected.");
> +
> +	if (status & G2_REG_INTERRUPT_DEC_TIMEOUT)
> +		dev_warn_ratelimited(vpu->dev, "frame decode timed out.");
>   
> -	hantro_irq_done(vpu, state);
> +	/**
> +	 * If the decoding haven't stopped, let it continue. The hardware timeout
> +	 * will trigger if it is trully stuck.
> +	 */
> +	if (status & G2_REG_INTERRUPT_DEC_E)
> +		return IRQ_HANDLED;
>   
> +	hantro_irq_done(vpu, VB2_BUF_STATE_ERROR);
>   	return IRQ_HANDLED;
>   }
>   
> diff --git a/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c b/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
> index 0e212198dd65b1cc27770ca93b14aa96e2772ac4..f066636e56f98560d9b1c5036691e3c34dd13b1f 100644
> --- a/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
> +++ b/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
> @@ -582,8 +582,6 @@ int hantro_g2_hevc_dec_run(struct hantro_ctx *ctx)
>   	struct hantro_dev *vpu = ctx->dev;
>   	int ret;
>   
> -	hantro_g2_check_idle(vpu);
> -
>   	/* Prepare HEVC decoder context. */
>   	ret = hantro_hevc_dec_prepare_run(ctx);
>   	if (ret)
> diff --git a/drivers/media/platform/verisilicon/hantro_g2_regs.h b/drivers/media/platform/verisilicon/hantro_g2_regs.h
> index b943b1816db7fd11eee063ecd7b082a5ed6c6f90..c614951121c79cf5c3bd4d086e596f60fba12459 100644
> --- a/drivers/media/platform/verisilicon/hantro_g2_regs.h
> +++ b/drivers/media/platform/verisilicon/hantro_g2_regs.h
> @@ -22,7 +22,14 @@
>   #define G2_REG_VERSION			G2_SWREG(0)
>   
>   #define G2_REG_INTERRUPT		G2_SWREG(1)
> +#define G2_REG_INTERRUPT_DEC_LAST_SLICE_INT	BIT(19)
> +#define G2_REG_INTERRUPT_DEC_TIMEOUT	BIT(18)
> +#define G2_REG_INTERRUPT_DEC_ERROR_INT	BIT(16)
> +#define G2_REG_INTERRUPT_DEC_BUF_INT	BIT(14)
> +#define G2_REG_INTERRUPT_DEC_BUS_INT	BIT(13)
>   #define G2_REG_INTERRUPT_DEC_RDY_INT	BIT(12)
> +#define G2_REG_INTERRUPT_DEC_ABORT_INT	BIT(11)
> +#define G2_REG_INTERRUPT_DEC_IRQ	BIT(8)
>   #define G2_REG_INTERRUPT_DEC_ABORT_E	BIT(5)
>   #define G2_REG_INTERRUPT_DEC_IRQ_DIS	BIT(4)
>   #define G2_REG_INTERRUPT_DEC_E		BIT(0)
> @@ -35,6 +42,9 @@
>   #define BUS_WIDTH_128			2
>   #define BUS_WIDTH_256			3
>   
> +#define g2_dec_int_stat		G2_DEC_REG(1, 11, 0xf)
> +#define g2_dec_irq		G2_DEC_REG(1, 8, 0x1)
> +
>   #define g2_strm_swap		G2_DEC_REG(2, 28, 0xf)
>   #define g2_strm_swap_old	G2_DEC_REG(2, 27, 0x1f)
>   #define g2_pic_swap		G2_DEC_REG(2, 22, 0x1f)
> @@ -225,6 +235,9 @@
>   #define vp9_filt_level_seg5	G2_DEC_REG(19,  8, 0x3f)
>   #define vp9_quant_seg5		G2_DEC_REG(19,  0, 0xff)
>   
> +#define g2_timemout_override_e	G2_DEC_REG(45, 31, 0x1)
> +#define g2_timemout_cycles	G2_DEC_REG(45, 0, 0x7fffffff)
> +
>   #define hevc_cur_poc_00		G2_DEC_REG(46, 24, 0xff)
>   #define hevc_cur_poc_01		G2_DEC_REG(46, 16, 0xff)
>   #define hevc_cur_poc_02		G2_DEC_REG(46, 8,  0xff)
> diff --git a/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c b/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
> index 82a478ac645e1daf730bf7aa53f825508556d3b2..56c79e339030e8076c386d7c48d976e102971d6d 100644
> --- a/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
> +++ b/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
> @@ -893,8 +893,6 @@ int hantro_g2_vp9_dec_run(struct hantro_ctx *ctx)
>   	struct vb2_v4l2_buffer *dst;
>   	int ret;
>   
> -	hantro_g2_check_idle(ctx->dev);
> -
>   	ret = start_prepare_run(ctx, &decode_params);
>   	if (ret) {
>   		hantro_end_prepare_run(ctx);
> diff --git a/drivers/media/platform/verisilicon/hantro_hw.h b/drivers/media/platform/verisilicon/hantro_hw.h
> index c9b6556f8b2b78b94e11c6f1374b395ca02f16ff..5f2011529f02dc6f8260f10a579bf1cd4e6c2edf 100644
> --- a/drivers/media/platform/verisilicon/hantro_hw.h
> +++ b/drivers/media/platform/verisilicon/hantro_hw.h
> @@ -583,6 +583,7 @@ void hantro_g2_vp9_dec_done(struct hantro_ctx *ctx);
>   int hantro_vp9_dec_init(struct hantro_ctx *ctx);
>   void hantro_vp9_dec_exit(struct hantro_ctx *ctx);
>   void hantro_g2_check_idle(struct hantro_dev *vpu);
> +void hantro_g2_reset(struct hantro_ctx *ctx);
>   irqreturn_t hantro_g2_irq(int irq, void *dev_id);
>   
>   #endif /* HANTRO_HW_H_ */
> diff --git a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c b/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
> index f9f276385c11786c4fda9f02f71ec699f57b84f5..5be0e2e76882f1e21359d3e7cf7f6213ee728ea5 100644
> --- a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
> +++ b/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
> @@ -294,11 +294,13 @@ static const struct hantro_codec_ops imx8mq_vpu_g1_codec_ops[] = {
>   static const struct hantro_codec_ops imx8mq_vpu_g2_codec_ops[] = {
>   	[HANTRO_MODE_HEVC_DEC] = {
>   		.run = hantro_g2_hevc_dec_run,
> +		.reset = hantro_g2_reset,
>   		.init = hantro_hevc_dec_init,
>   		.exit = hantro_hevc_dec_exit,
>   	},
>   	[HANTRO_MODE_VP9_DEC] = {
>   		.run = hantro_g2_vp9_dec_run,
> +		.reset = hantro_g2_reset,
>   		.done = hantro_g2_vp9_dec_done,
>   		.init = hantro_vp9_dec_init,
>   		.exit = hantro_vp9_dec_exit,
>

