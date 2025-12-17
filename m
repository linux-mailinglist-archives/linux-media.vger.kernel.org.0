Return-Path: <linux-media+bounces-49033-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A5FCC9D3E
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 00:57:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C13F3037CE4
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 23:56:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE8162C08CD;
	Wed, 17 Dec 2025 23:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="PlNF4Pb2"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E9C21D3CD
	for <linux-media@vger.kernel.org>; Wed, 17 Dec 2025 23:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766015812; cv=none; b=LxnLfZjYEiEQLmVRmN2sZczcYuQIrtzGXkN0rNju50h4dWXo0AM6I4kiQmnN+IrCs+B2AsQoiCSXZSi55Bm6qMxKjum1IjbHMUvkKWuB1T2Z4EJHSwFYj0DksZqZUFrCANHJ2WYW6jC/JR5+a2NTaovvthmtXM+SOHcwjNDB92s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766015812; c=relaxed/simple;
	bh=HPoQc9rf75enKITlsRY6JtqbK8SdrXN1rx2VklIAfdc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ozuhpH5cmxx8L+pMfA9Lq1wKDH+f1UTq6rGSBhRwDCi+/pNODQQUPsUlDLO+wcco4H7GdrjCneFYjWp/qFBNYAORxa2ZKYRDfB5sQP6tKyJUcxCecjDoNzlC6VuCFOIEZR4R487erZdXbMmmyx/UUwFABYuRQZ8Q7SNyXf6IqmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=PlNF4Pb2; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1766015809;
 bh=LpzPemYiHT1crddOmv6B2QjiU767m3aR+s44o3T+MFM=;
 b=PlNF4Pb2H3RcZYo6jRxW6ceSP+A40FbxX4B6h44UpaAZOp9q7rbicLF20cGk37FsZVfJfENz6
 kTWG9u99+WhYZTqTxevYTXYGOJicRzFCNPypU6THFJjDBB7oZZisPhBkJzXJwQfmSu5qeGp1vrq
 dAnnzFrO7/GwibgAO3Bx4dnURKvsYQrJcrfy/EXH4GNIUGrfJsqAZ6Xum5UNR2320EVOGqkJIee
 6y6lHJx6ak8G4PEisTKDE9ts4R6bCrnWr2En3AnQ2q2qr4urvo+mIUuwonJhJvVjhaYJrNeVufS
 HRofY15hnCdqP6ghwhwsP5YukpscXugyt8GlKtnNn6IQ==
X-Forward-Email-ID: 6943433547898a7fd2fefbd0
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.0.6
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <0b08a231-5560-471e-8d8d-0431f3ada0ac@kwiboo.se>
Date: Thu, 18 Dec 2025 00:56:32 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 14/17] media: rkvdec: Add H264 support for the VDPU381
 variant
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Heiko Stuebner <heiko@sntech.de>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Jonathan Corbet <corbet@lwn.net>, Ricardo Ribalda <ribalda@chromium.org>,
 Hans Verkuil <hverkuil@kernel.org>, Yunke Cao <yunkec@google.com>,
 Hans de Goede <hansg@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Pavan Bobba <opensource206@gmail.com>,
 James Cowgill <james.cowgill@blaize.com>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, Diederik de Haas <didi.debian@cknow.org>,
 linux-kernel@vger.kernel.org
References: <20251217174059.1341784-1-detlev.casanova@collabora.com>
 <20251217174059.1341784-15-detlev.casanova@collabora.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20251217174059.1341784-15-detlev.casanova@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Detlev,

On 12/17/2025 6:40 PM, Detlev Casanova wrote:
> This decoder variant is found in Rockchip RK3588 SoC family.
> 
> Like for rkvdec on rk3399, it supports the NV12, NV15, NV16 and NV20
> output formats and level up to 5.1.
> 
> The maximum width and height have been significantly increased
> supporting up to 65520 pixels for both.
> 
> Also make sure to only expose the first core and ignore the other
> until mutli-core is supported.
> 
> Fluster score for JVT-AVC_V1 is 129/135.
> 
> Tested-by: Diederik de Haas <didi.debian@cknow.org>  # Rock 5B
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  .../media/platform/rockchip/rkvdec/Makefile   |   1 +
>  .../rockchip/rkvdec/rkvdec-h264-common.h      |   2 +
>  .../rockchip/rkvdec/rkvdec-vdpu381-h264.c     | 469 ++++++++++++++++++
>  .../rockchip/rkvdec/rkvdec-vdpu381-regs.h     | 424 ++++++++++++++++
>  .../media/platform/rockchip/rkvdec/rkvdec.c   |  84 ++++
>  .../media/platform/rockchip/rkvdec/rkvdec.h   |   8 +
>  6 files changed, 988 insertions(+)
>  create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c
>  create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-regs.h
> 

[snip]

> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> index f7353d0acdab..1ddae1b23434 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -29,6 +29,7 @@
>  
>  #include "rkvdec.h"
>  #include "rkvdec-regs.h"
> +#include "rkvdec-vdpu381-regs.h"
>  #include "rkvdec-rcb.h"
>  
>  static bool rkvdec_image_fmt_match(enum rkvdec_image_fmt fmt1,
> @@ -90,6 +91,9 @@ static void rkvdec_fill_decoded_pixfmt(struct rkvdec_ctx *ctx,
>  {
>  	v4l2_fill_pixfmt_mp(pix_mp, pix_mp->pixelformat,
>  			    pix_mp->width, pix_mp->height);
> +
> +	ctx->colmv_offset = pix_mp->plane_fmt[0].sizeimage;
> +
>  	pix_mp->plane_fmt[0].sizeimage += 128 *
>  		DIV_ROUND_UP(pix_mp->width, 16) *
>  		DIV_ROUND_UP(pix_mp->height, 16);
> @@ -367,6 +371,26 @@ static const struct rkvdec_coded_fmt_desc rkvdec_coded_fmts[] = {
>  	}
>  };
>  
> +static const struct rkvdec_coded_fmt_desc vdpu381_coded_fmts[] = {
> +	{
> +		.fourcc = V4L2_PIX_FMT_H264_SLICE,
> +		.frmsize = {
> +			.min_width = 64,
> +			.max_width =  65520,
> +			.step_width = 64,
> +			.min_height = 64,
> +			.max_height =  65520,
> +			.step_height = 16,
> +		},
> +		.ctrls = &rkvdec_h264_ctrls,
> +		.ops = &rkvdec_vdpu381_h264_fmt_ops,
> +		.num_decoded_fmts = ARRAY_SIZE(rkvdec_h264_decoded_fmts),
> +		.decoded_fmts = rkvdec_h264_decoded_fmts,
> +		.subsystem_flags = VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
> +		.capability = RKVDEC_CAPABILITY_H264,
> +	},
> +};
> +
>  static bool rkvdec_is_capable(struct rkvdec_ctx *ctx, unsigned int capability)
>  {
>  	return (ctx->dev->variant->capabilities & capability) == capability;
> @@ -1241,6 +1265,35 @@ static irqreturn_t rk3399_irq_handler(struct rkvdec_ctx *ctx)
>  	return IRQ_HANDLED;
>  }
>  
> +static irqreturn_t vdpu381_irq_handler(struct rkvdec_ctx *ctx)
> +{
> +	struct rkvdec_dev *rkvdec = ctx->dev;
> +	enum vb2_buffer_state state;
> +	bool need_reset = 0;
> +	u32 status;
> +
> +	status = readl(rkvdec->regs + VDPU381_REG_STA_INT);
> +	writel(0, rkvdec->regs + VDPU381_REG_STA_INT);
> +
> +	if (status & VDPU381_STA_INT_DEC_RDY_STA) {
> +		state = VB2_BUF_STATE_DONE;
> +	} else {
> +		state = VB2_BUF_STATE_ERROR;
> +		if (status & (VDPU381_STA_INT_SOFTRESET_RDY |
> +			      VDPU381_STA_INT_TIMEOUT |
> +			      VDPU381_STA_INT_ERROR))
> +			rkvdec_iommu_restore(rkvdec);
> +	}
> +
> +	if (need_reset)
> +		rkvdec_iommu_restore(rkvdec);
> +
> +	if (cancel_delayed_work(&rkvdec->watchdog_work))
> +		rkvdec_job_finish(ctx, state);
> +
> +	return IRQ_HANDLED;
> +}
> +
>  static irqreturn_t rkvdec_irq_handler(int irq, void *priv)
>  {
>  	struct rkvdec_dev *rkvdec = priv;
> @@ -1308,6 +1361,19 @@ static int rkvdec_disable_multicore(struct rkvdec_dev *rkvdec)
>  	return 0;
>  }
>  
> +static const struct rcb_size_info vdpu381_rcb_sizes[] = {
> +	{6,	PIC_WIDTH},	// intrar
> +	{1,	PIC_WIDTH},	// transdr (Is actually 0.4*pic_width)
> +	{1,	PIC_HEIGHT},	// transdc (Is actually 0.1*pic_height)
> +	{3,	PIC_WIDTH},	// streamdr
> +	{6,	PIC_WIDTH},	// interr
> +	{3,	PIC_HEIGHT},	// interc
> +	{22,	PIC_WIDTH},	// dblkr
> +	{6,	PIC_WIDTH},	// saor
> +	{11,	PIC_WIDTH},	// fbcr
> +	{67,	PIC_HEIGHT},	// filtc col
> +};

This feel a little bit out of place, should it be moved just above
vdpu381_variant_ops and after rk3399_rkvdec_variant ?

> +
>  static const struct rkvdec_variant_ops rk3399_variant_ops = {
>  	.irq_handler = rk3399_irq_handler,
>  };
> @@ -1341,6 +1407,19 @@ static const struct rkvdec_variant rk3399_rkvdec_variant = {
>  			RKVDEC_CAPABILITY_VP9,
>  };
>  
> +static const struct rkvdec_variant_ops vdpu381_variant_ops = {
> +	.irq_handler = vdpu381_irq_handler,
> +};
> +
> +static const struct rkvdec_variant rk3588_vdpu381_variant = {

Are we expecting other soc use vdpu381 ? Or are there some reason why
some of the structs are just named vdpu381 and this one both rk3588 and
vdpu381 ?

Regards,
Jonas

> +	.coded_fmts = vdpu381_coded_fmts,
> +	.num_coded_fmts = ARRAY_SIZE(vdpu381_coded_fmts),
> +	.rcb_sizes = vdpu381_rcb_sizes,
> +	.num_rcb_sizes = ARRAY_SIZE(vdpu381_rcb_sizes),
> +	.ops = &vdpu381_variant_ops,
> +	.capabilities = RKVDEC_CAPABILITY_H264,
> +};
> +
>  static const struct of_device_id of_rkvdec_match[] = {
>  	{
>  		.compatible = "rockchip,rk3288-vdec",
> @@ -1354,6 +1433,10 @@ static const struct of_device_id of_rkvdec_match[] = {
>  		.compatible = "rockchip,rk3399-vdec",
>  		.data = &rk3399_rkvdec_variant,
>  	},
> +	{
> +		.compatible = "rockchip,rk3588-vdec",
> +		.data = &rk3588_vdpu381_variant,
> +	},
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, of_rkvdec_match);
> @@ -1387,6 +1470,7 @@ static int rkvdec_probe(struct platform_device *pdev)
>  		return ret;
>  
>  	rkvdec->num_clocks = ret;
> +	rkvdec->axi_clk = devm_clk_get(&pdev->dev, "axi");
>  
>  	rkvdec->regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(rkvdec->regs))
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> index 75a9ba988794..1ad9a4fc31db 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> @@ -29,6 +29,10 @@
>  
>  #define RKVDEC_QUIRK_DISABLE_QOS	BIT(0)
>  
> +#define RKVDEC_1080P_PIXELS		(1920 * 1088)
> +#define RKVDEC_4K_PIXELS		(4096 * 2304)
> +#define RKVDEC_8K_PIXELS		(7680 * 4320)
> +
>  struct rkvdec_ctx;
>  struct rkvdec_rcb_config;
>  
> @@ -132,6 +136,7 @@ struct rkvdec_dev {
>  	struct device *dev;
>  	struct clk_bulk_data *clocks;
>  	unsigned int num_clocks;
> +	struct clk *axi_clk;
>  	void __iomem *regs;
>  	struct mutex vdev_lock; /* serializes ioctls */
>  	struct delayed_work watchdog_work;
> @@ -150,6 +155,7 @@ struct rkvdec_ctx {
>  	struct rkvdec_dev *dev;
>  	enum rkvdec_image_fmt image_fmt;
>  	struct rkvdec_rcb_config *rcb_config;
> +	u32 colmv_offset;
>  	void *priv;
>  };
>  
> @@ -180,4 +186,6 @@ extern const struct rkvdec_coded_fmt_ops rkvdec_h264_fmt_ops;
>  extern const struct rkvdec_coded_fmt_ops rkvdec_hevc_fmt_ops;
>  extern const struct rkvdec_coded_fmt_ops rkvdec_vp9_fmt_ops;
>  
> +extern const struct rkvdec_coded_fmt_ops rkvdec_vdpu381_h264_fmt_ops;
> +
>  #endif /* RKVDEC_H_ */


