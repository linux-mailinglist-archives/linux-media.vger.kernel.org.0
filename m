Return-Path: <linux-media+bounces-29182-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDDEA7860E
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 03:15:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 128B23AF7A7
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 01:15:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0E4D17BA9;
	Wed,  2 Apr 2025 01:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rARzbVe5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB593C17;
	Wed,  2 Apr 2025 01:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743556511; cv=none; b=CeTixXf9vcNw6RvTFP7I59ofFOndqmVe7JHa7TdgMw2pk7AogVyT3PnIOQ4WioshtgOsFPUO5YvhrGQ/uUhR0bKrAJCsXEQ8kGdBrfcaPv5Xo/5csIa/1moz3S7uPIVcTrJsBGdIDcKku+00se9aLdb/2HgTZ2yroL0P8kLTYg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743556511; c=relaxed/simple;
	bh=WeGIw28l6BHT67WNO5MsNpjm7yWnh6v02O9e8fPwzS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jB0Yc4byK/cAnawIVDTpWmisKyPEByPE4yt6gxbdYlWc3B8Stbdcbc+idryh9q3HnmXfETODWSzl1LmszmT7MYkPu/IH8uH5IqQnWF0/dsEfktwASZONKvLDqNQ+jJNpWf7s25JvYM9N8bXP4ehcRzdd9Js/9Kp3ls0eDHVzxro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rARzbVe5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 765876A6;
	Wed,  2 Apr 2025 03:13:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743556393;
	bh=WeGIw28l6BHT67WNO5MsNpjm7yWnh6v02O9e8fPwzS0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rARzbVe5fsOwSdNTEcWcz4Gc+3D7dBYn0t6rI+XaykkqRK+H3Xygk7X0SqCtcBm+e
	 Zm/dZzVy85duy0KujeCB1CbH1LKO8X5h1cEz0Fesyt1ynmM5H/scrxZEcZ2aHtdq/3
	 2LfnohGsLCTVX2k3TMRdSdxRpzipKxE0m3n1Q/Qw=
Date: Wed, 2 Apr 2025 04:14:42 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org, biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 17/17] media: rzg2l-cru: Add support for RZ/G3E SoC
Message-ID: <20250402011442.GF4845@pendragon.ideasonboard.com>
References: <20250328173032.423322-1-tommaso.merciai.xr@bp.renesas.com>
 <20250328173032.423322-18-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250328173032.423322-18-tommaso.merciai.xr@bp.renesas.com>

Hi Tommaso,

Thank you for the patch.

On Fri, Mar 28, 2025 at 06:29:53PM +0100, Tommaso Merciai wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> The CRU block on the Renesas RZ/G3E SoC is similar to the one found on
> the Renesas RZ/G2L SoC, with the following differences:
> 
> - Additional registers rzg3e_cru_regs.
> - A different irq handler rzg3e_cru_irq.
> - A different rzg3e_cru_csi2_setup.
> - A different max input width.
> - Additional stride register.
> 
> Introduce rzg3e_cru_info struct to handle differences between RZ/G2L
> and RZ/G3E and related RZ/G3E functions:
> 
>  - rzg3e_cru_enable_interrupts()
>  - rzg3e_cru_enable_interrupts()
>  - rz3e_fifo_empty()
>  - rzg3e_cru_csi2_setup()
>  - rzg3e_cru_get_current_slot()
> 
> Add then support for the RZ/G3E SoC CRU block with the new compatible
> string "renesas,r9a09g047-cru".
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> Changes since v2:
>  - Use dma_addr_t with buf_addr directly instead of splitting that into
>    cru->mem_banks (high and low address) as suggested by LPinchart.
>  - Moved and improved stride adjustment into rzg2l_cru_format_align()
>    as suggested by LPinchart.
>  - Use csi_vc into rzg3e_cru_csi2_setup() instead of cru->svc_channel as
>    suggested by LPinchart
>  - Added has_stride field to handle soc differences as suggested by LPinchart.
> 
> Changes since v3:
>  - Fixed kernel test robot warnings from rzg3e_cru_get_current_slot() and
>    rzg3e_cru_irq()
> 
>  .../platform/renesas/rzg2l-cru/rzg2l-core.c   |  62 +++++++
>  .../renesas/rzg2l-cru/rzg2l-cru-regs.h        |  25 +++
>  .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  13 ++
>  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 171 +++++++++++++++++-
>  4 files changed, 270 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> index 3ae0cd83af164..1356be14eda8a 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> @@ -290,6 +290,12 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
>  		return ret;
>  
>  	cru->num_buf = RZG2L_CRU_HW_BUFFER_DEFAULT;
> +	cru->buf_addr = devm_kmalloc_array(dev, cru->num_buf,
> +					   sizeof(dma_addr_t), GFP_KERNEL);

The number of entries is constant. Do you need to allocate this
dynamically ?

> +	if (!cru->buf_addr)
> +		return dev_err_probe(dev, -ENOMEM,
> +				     "Failed to init buf addr\n");

s/init/allocate/

but hopefully we can drop this error check by making cru->buf_addr a
fixed-size array.

> +
>  	pm_suspend_ignore_children(dev, true);
>  	ret = devm_pm_runtime_enable(dev);
>  	if (ret)
> @@ -321,6 +327,58 @@ static void rzg2l_cru_remove(struct platform_device *pdev)
>  	rzg2l_cru_dma_unregister(cru);
>  }
>  
> +static const u16 rzg3e_cru_regs[] = {
> +	[CRUnCTRL] = 0x0,
> +	[CRUnIE] = 0x4,
> +	[CRUnIE2] = 0x8,
> +	[CRUnINTS] = 0xc,
> +	[CRUnINTS2] = 0x10,
> +	[CRUnRST] = 0x18,
> +	[AMnMB1ADDRL] = 0x40,
> +	[AMnMB1ADDRH] = 0x44,
> +	[AMnMB2ADDRL] = 0x48,
> +	[AMnMB2ADDRH] = 0x4c,
> +	[AMnMB3ADDRL] = 0x50,
> +	[AMnMB3ADDRH] = 0x54,
> +	[AMnMB4ADDRL] = 0x58,
> +	[AMnMB4ADDRH] = 0x5c,
> +	[AMnMB5ADDRL] = 0x60,
> +	[AMnMB5ADDRH] = 0x64,
> +	[AMnMB6ADDRL] = 0x68,
> +	[AMnMB6ADDRH] = 0x6c,
> +	[AMnMB7ADDRL] = 0x70,
> +	[AMnMB7ADDRH] = 0x74,
> +	[AMnMB8ADDRL] = 0x78,
> +	[AMnMB8ADDRH] = 0x7c,
> +	[AMnMBVALID] = 0x88,
> +	[AMnMADRSL] = 0x8c,
> +	[AMnMADRSH] = 0x90,
> +	[AMnAXIATTR] = 0xec,
> +	[AMnFIFOPNTR] = 0xf8,
> +	[AMnAXISTP] = 0x110,
> +	[AMnAXISTPACK] = 0x114,
> +	[AMnIS] = 0x128,
> +	[ICnEN] = 0x1f0,
> +	[ICnSVCNUM] = 0x1f8,
> +	[ICnSVC] = 0x1fc,
> +	[ICnIPMC_C0] = 0x200,
> +	[ICnMS] = 0x2d8,
> +	[ICnDMR] = 0x304,
> +};
> +
> +static const struct rzg2l_cru_info rzg3e_cru_info = {
> +	.max_width = 4095,
> +	.max_height = 4095,
> +	.image_conv = ICnIPMC_C0,
> +	.has_stride = true,
> +	.regs = rzg3e_cru_regs,
> +	.irq_handler = rzg3e_cru_irq,
> +	.enable_interrupts = rzg3e_cru_enable_interrupts,
> +	.disable_interrupts = rzg3e_cru_disable_interrupts,
> +	.fifo_empty = rz3e_fifo_empty,
> +	.csi_setup = rzg3e_cru_csi2_setup,
> +};
> +
>  static const u16 rzg2l_cru_regs[] = {
>  	[CRUnCTRL] = 0x0,
>  	[CRUnIE] = 0x4,
> @@ -367,6 +425,10 @@ static const struct rzg2l_cru_info rzgl2_cru_info = {
>  };
>  
>  static const struct of_device_id rzg2l_cru_of_id_table[] = {
> +	{
> +		.compatible = "renesas,r9a09g047-cru",
> +		.data = &rzg3e_cru_info,
> +	},
>  	{
>  		.compatible = "renesas,rzg2l-cru",
>  		.data = &rzgl2_cru_info,
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
> index 86c3202862465..52324b076674b 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
> @@ -14,8 +14,13 @@
>  
>  #define CRUnIE_EFE			BIT(17)
>  
> +#define CRUnIE2_FSxE(x)			BIT(((x) * 3))
> +#define CRUnIE2_FExE(x)			BIT(((x) * 3) + 1)
> +
>  #define CRUnINTS_SFS			BIT(16)
>  
> +#define CRUnINTS2_FSxS(x)		BIT(((x) * 3))
> +
>  #define CRUnRST_VRESETN			BIT(0)
>  
>  /* Memory Bank Base Address (Lower) Register for CRU Image Data */
> @@ -32,7 +37,14 @@
>  #define AMnAXIATTR_AXILEN		(0xf)
>  
>  #define AMnFIFOPNTR_FIFOWPNTR		GENMASK(7, 0)
> +#define AMnFIFOPNTR_FIFOWPNTR_B0	AMnFIFOPNTR_FIFOWPNTR
> +#define AMnFIFOPNTR_FIFOWPNTR_B1	GENMASK(15, 8)
>  #define AMnFIFOPNTR_FIFORPNTR_Y		GENMASK(23, 16)
> +#define AMnFIFOPNTR_FIFORPNTR_B0	AMnFIFOPNTR_FIFORPNTR_Y
> +#define AMnFIFOPNTR_FIFORPNTR_B1	GENMASK(31, 24)
> +
> +#define AMnIS_IS_MASK			GENMASK(14, 7)
> +#define AMnIS_IS(x)			((x) << 7)
>  
>  #define AMnAXISTP_AXI_STOP		BIT(0)
>  
> @@ -40,6 +52,11 @@
>  
>  #define ICnEN_ICEN			BIT(0)
>  
> +#define ICnSVC_SVC0(x)			(x)
> +#define ICnSVC_SVC1(x)			((x) << 4)
> +#define ICnSVC_SVC2(x)			((x) << 8)
> +#define ICnSVC_SVC3(x)			((x) << 12)
> +
>  #define ICnMC_CSCTHR			BIT(5)
>  #define ICnMC_INF(x)			((x) << 16)
>  #define ICnMC_VCSEL(x)			((x) << 22)
> @@ -52,7 +69,9 @@
>  enum rzg2l_cru_common_regs {
>  	CRUnCTRL,	/* CRU Control */
>  	CRUnIE,		/* CRU Interrupt Enable */
> +	CRUnIE2,	/* CRU Interrupt Enable(2) */
>  	CRUnINTS,	/* CRU Interrupt Status */
> +	CRUnINTS2,	/* CRU Interrupt Status(2) */
>  	CRUnRST, 	/* CRU Reset */
>  	AMnMB1ADDRL,	/* Bank 1 Address (Lower) for CRU Image Data */
>  	AMnMB1ADDRH,	/* Bank 1 Address (Higher) for CRU Image Data */
> @@ -72,12 +91,18 @@ enum rzg2l_cru_common_regs {
>  	AMnMB8ADDRH,    /* Bank 8 Address (Higher) for CRU Image Data */
>  	AMnMBVALID,	/* Memory Bank Enable for CRU Image Data */
>  	AMnMBS,		/* Memory Bank Status for CRU Image Data */
> +	AMnMADRSL,	/* VD Memory Address Lower Status Register */
> +	AMnMADRSH,	/* VD Memory Address Higher Status Register */
>  	AMnAXIATTR,	/* AXI Master Transfer Setting Register for CRU Image Data */
>  	AMnFIFOPNTR,	/* AXI Master FIFO Pointer for CRU Image Data */
>  	AMnAXISTP,	/* AXI Master Transfer Stop for CRU Image Data */
>  	AMnAXISTPACK,	/* AXI Master Transfer Stop Status for CRU Image Data */
> +	AMnIS,		/* Image Stride Setting Register */
>  	ICnEN,		/* CRU Image Processing Enable */
> +	ICnSVCNUM,	/* CRU SVC Number Register */
> +	ICnSVC,		/* CRU VC Select Register */
>  	ICnMC,		/* CRU Image Processing Main Control */
> +	ICnIPMC_C0,	/* CRU Image Converter Main Control 0 */
>  	ICnMS,		/* CRU Module Status */
>  	ICnDMR,		/* CRU Data Output Mode */
>  	RZG2L_CRU_MAX_REG,
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> index ccaba5220f1c8..d68d833406865 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> @@ -85,6 +85,7 @@ struct rzg2l_cru_info {
>  	unsigned int max_height;
>  	u16 image_conv;
>  	const u16 *regs;
> +	bool has_stride;
>  	irqreturn_t (*irq_handler)(int irq, void *data);
>  	void (*enable_interrupts)(struct rzg2l_cru_dev *cru);
>  	void (*disable_interrupts)(struct rzg2l_cru_dev *cru);
> @@ -108,6 +109,8 @@ struct rzg2l_cru_info {
>   * @vdev:		V4L2 video device associated with CRU
>   * @v4l2_dev:		V4L2 device
>   * @num_buf:		Holds the current number of buffers enabled
> + * @svc_channel:	SVC0/1/2/3 to use for RZ/G3E
> + * @buf_addr:		Memory addresses where current video data is written.
>   * @notifier:		V4L2 asynchronous subdevs notifier
>   *
>   * @ip:			Image processing subdev info
> @@ -144,6 +147,9 @@ struct rzg2l_cru_dev {
>  	struct v4l2_device v4l2_dev;
>  	u8 num_buf;
>  
> +	u8 svc_channel;
> +	dma_addr_t *buf_addr;
> +
>  	struct v4l2_async_notifier notifier;
>  
>  	struct rzg2l_cru_ip ip;
> @@ -175,6 +181,7 @@ void rzg2l_cru_dma_unregister(struct rzg2l_cru_dev *cru);
>  int rzg2l_cru_video_register(struct rzg2l_cru_dev *cru);
>  void rzg2l_cru_video_unregister(struct rzg2l_cru_dev *cru);
>  irqreturn_t rzg2l_cru_irq(int irq, void *data);
> +irqreturn_t rzg3e_cru_irq(int irq, void *data);
>  
>  const struct v4l2_format_info *rzg2l_cru_format_from_pixel(u32 format);
>  
> @@ -188,10 +195,16 @@ const struct rzg2l_cru_ip_format *rzg2l_cru_ip_index_to_fmt(u32 index);
>  
>  void rzg2l_cru_enable_interrupts(struct rzg2l_cru_dev *cru);
>  void rzg2l_cru_disable_interrupts(struct rzg2l_cru_dev *cru);
> +void rzg3e_cru_enable_interrupts(struct rzg2l_cru_dev *cru);
> +void rzg3e_cru_disable_interrupts(struct rzg2l_cru_dev *cru);
>  
>  bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru);
> +bool rz3e_fifo_empty(struct rzg2l_cru_dev *cru);
>  void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
>  			  const struct rzg2l_cru_ip_format *ip_fmt,
>  			  u8 csi_vc);
> +void rzg3e_cru_csi2_setup(struct rzg2l_cru_dev *cru,
> +			  const struct rzg2l_cru_ip_format *ip_fmt,
> +			  u8 csi_vc);
>  
>  #endif
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 748a0855b3245..da6d13e80a45a 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -31,6 +31,9 @@
>  #define RZG2L_CRU_DEFAULT_FIELD		V4L2_FIELD_NONE
>  #define RZG2L_CRU_DEFAULT_COLORSPACE	V4L2_COLORSPACE_SRGB
>  
> +#define RZG2L_CRU_STRIDE_MAX		32640
> +#define RZG2L_CRU_STRIDE_ALIGN		128
> +
>  struct rzg2l_cru_buffer {
>  	struct vb2_v4l2_buffer vb;
>  	struct list_head list;
> @@ -184,6 +187,8 @@ static void rzg2l_cru_set_slot_addr(struct rzg2l_cru_dev *cru,
>  	/* Currently, we just use the buffer in 32 bits address */
>  	rzg2l_cru_write(cru, AMnMBxADDRL(slot), addr);
>  	rzg2l_cru_write(cru, AMnMBxADDRH(slot), 0);
> +
> +	cru->buf_addr[slot] = addr;
>  }
>  
>  /*
> @@ -224,6 +229,7 @@ static void rzg2l_cru_fill_hw_slot(struct rzg2l_cru_dev *cru, int slot)
>  
>  static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
>  {
> +	const struct rzg2l_cru_info *info = cru->info;
>  	unsigned int slot;
>  	u32 amnaxiattr;
>  
> @@ -236,12 +242,39 @@ static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
>  	for (slot = 0; slot < cru->num_buf; slot++)
>  		rzg2l_cru_fill_hw_slot(cru, slot);
>  
> +	if (info->has_stride) {
> +		u32 stride = cru->format.bytesperline;
> +		u32 amnis;
> +
> +		stride /= RZG2L_CRU_STRIDE_ALIGN;
> +		amnis = rzg2l_cru_read(cru, AMnIS) & ~AMnIS_IS_MASK;
> +		rzg2l_cru_write(cru, AMnIS, amnis | AMnIS_IS(stride));
> +	}
> +
>  	/* Set AXI burst max length to recommended setting */
>  	amnaxiattr = rzg2l_cru_read(cru, AMnAXIATTR) & ~AMnAXIATTR_AXILEN_MASK;
>  	amnaxiattr |= AMnAXIATTR_AXILEN;
>  	rzg2l_cru_write(cru, AMnAXIATTR, amnaxiattr);
>  }
>  
> +void rzg3e_cru_csi2_setup(struct rzg2l_cru_dev *cru,
> +			  const struct rzg2l_cru_ip_format *ip_fmt,
> +			  u8 csi_vc)
> +{
> +	const struct rzg2l_cru_info *info = cru->info;
> +	u32 icnmc = ICnMC_INF(ip_fmt->datatype);
> +
> +	icnmc |= (rzg2l_cru_read(cru, info->image_conv) & ~ICnMC_INF_MASK);
> +
> +	/* Set virtual channel CSI2 */
> +	icnmc |= ICnMC_VCSEL(csi_vc);
> +
> +	rzg2l_cru_write(cru, ICnSVCNUM, csi_vc);
> +	rzg2l_cru_write(cru, ICnSVC, ICnSVC_SVC0(0) | ICnSVC_SVC1(1) |
> +			ICnSVC_SVC2(2) | ICnSVC_SVC3(3));
> +	rzg2l_cru_write(cru, info->image_conv, icnmc);
> +}
> +
>  void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
>  			  const struct rzg2l_cru_ip_format *ip_fmt,
>  			  u8 csi_vc)
> @@ -290,6 +323,19 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
>  	return 0;
>  }
>  
> +bool rz3e_fifo_empty(struct rzg2l_cru_dev *cru)
> +{
> +	u32 amnfifopntr = rzg2l_cru_read(cru, AMnFIFOPNTR);
> +
> +	if ((((amnfifopntr & AMnFIFOPNTR_FIFORPNTR_B1) >> 24) ==
> +	     ((amnfifopntr & AMnFIFOPNTR_FIFOWPNTR_B1) >> 8)) &&
> +	    (((amnfifopntr & AMnFIFOPNTR_FIFORPNTR_B0) >> 16) ==
> +	     (amnfifopntr & AMnFIFOPNTR_FIFOWPNTR_B0)))
> +		return true;
> +
> +	return false;
> +}
> +
>  bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru)
>  {
>  	u32 amnfifopntr, amnfifopntr_w, amnfifopntr_r_y;
> @@ -401,6 +447,20 @@ static int rzg2l_cru_get_virtual_channel(struct rzg2l_cru_dev *cru)
>  	return fd.entry[0].bus.csi2.vc;
>  }
>  
> +void rzg3e_cru_enable_interrupts(struct rzg2l_cru_dev *cru)
> +{
> +	rzg2l_cru_write(cru, CRUnIE2, CRUnIE2_FSxE(cru->svc_channel));
> +	rzg2l_cru_write(cru, CRUnIE2, CRUnIE2_FExE(cru->svc_channel));
> +}
> +
> +void rzg3e_cru_disable_interrupts(struct rzg2l_cru_dev *cru)
> +{
> +	rzg2l_cru_write(cru, CRUnIE, 0);
> +	rzg2l_cru_write(cru, CRUnIE2, 0);
> +	rzg2l_cru_write(cru, CRUnINTS, rzg2l_cru_read(cru, CRUnINTS));
> +	rzg2l_cru_write(cru, CRUnINTS2, rzg2l_cru_read(cru, CRUnINTS2));
> +}
> +
>  void rzg2l_cru_enable_interrupts(struct rzg2l_cru_dev *cru)
>  {
>  	rzg2l_cru_write(cru, CRUnIE, CRUnIE_EFE);
> @@ -423,6 +483,7 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
>  	if (ret < 0)
>  		return ret;
>  	csi_vc = ret;
> +	cru->svc_channel = csi_vc;
>  
>  	spin_lock_irqsave(&cru->qlock, flags);
>  
> @@ -601,6 +662,107 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
>  	return IRQ_RETVAL(handled);
>  }
>  
> +static int rzg3e_cru_get_current_slot(struct rzg2l_cru_dev *cru)
> +{
> +	u64 amnmadrs;
> +	int slot;
> +
> +	/*
> +	 * When AMnMADRSL is read, AMnMADRSH of the higher-order
> +	 * address also latches the address.
> +	 *
> +	 * AMnMADRSH must be read after AMnMADRSL has been read.
> +	 */
> +	amnmadrs = rzg2l_cru_read(cru, AMnMADRSL);
> +	amnmadrs |= ((u64)rzg2l_cru_read(cru, AMnMADRSH) << 32);

Drop the outer parentheses.

> +
> +	/* Ensure amnmadrs is within this buffer range */
> +	for (slot = 0; slot < cru->num_buf; slot++)
> +		if (amnmadrs >= cru->buf_addr[slot] &&
> +		    amnmadrs < cru->buf_addr[slot] + cru->format.sizeimage)
> +			return slot;

I would use curly braces for the for statement.

> +
> +	dev_err(cru->dev, "Invalid MB address 0x%llx (out of range)\n", amnmadrs);
> +	return -EINVAL;
> +}
> +
> +irqreturn_t rzg3e_cru_irq(int irq, void *data)
> +{
> +	struct rzg2l_cru_dev *cru = data;
> +	unsigned int handled = 0;
> +	unsigned long flags;
> +	u32 irq_status;
> +	int slot;
> +
> +	spin_lock_irqsave(&cru->qlock, flags);

Use a scoped guard to avoid the gotos.

> +	irq_status = rzg2l_cru_read(cru, CRUnINTS2);
> +	if (!irq_status)
> +		goto done;

You will be able to return directly here, and drop the handled variable.

> +
> +	dev_dbg(cru->dev, "CRUnINTS2 0x%x\n", irq_status);
> +
> +	handled = 1;
> +
> +	rzg2l_cru_write(cru, CRUnINTS2, rzg2l_cru_read(cru, CRUnINTS2));
> +
> +	/* Nothing to do if capture status is 'RZG2L_CRU_DMA_STOPPED' */
> +	if (cru->state == RZG2L_CRU_DMA_STOPPED) {
> +		dev_dbg(cru->dev, "IRQ while state stopped\n");
> +		goto done;
> +	}
> +
> +	if (cru->state == RZG2L_CRU_DMA_STOPPING) {
> +		if (irq_status & CRUnINTS2_FSxS(0) ||
> +		    irq_status & CRUnINTS2_FSxS(1) ||
> +		    irq_status & CRUnINTS2_FSxS(2) ||
> +		    irq_status & CRUnINTS2_FSxS(3))
> +			dev_dbg(cru->dev, "IRQ while state stopping\n");
> +		goto done;
> +	}
> +
> +	slot = rzg3e_cru_get_current_slot(cru);
> +	if (slot < 0)
> +		goto done;
> +
> +	dev_dbg(cru->dev, "Current written slot: %d\n", slot);
> +	cru->buf_addr[slot] = 0;

Have you tested operation with buffer queue underruns, when userspace
doesn't requeue buffers fast enough and the driver runs out of buffers ?

> +
> +	/*
> +	 * To hand buffers back in a known order to userspace start
> +	 * to capture first from slot 0.
> +	 */
> +	if (cru->state == RZG2L_CRU_DMA_STARTING) {
> +		if (slot != 0) {
> +			dev_dbg(cru->dev, "Starting sync slot: %d\n", slot);
> +			goto done;
> +		}
> +		dev_dbg(cru->dev, "Capture start synced!\n");
> +		cru->state = RZG2L_CRU_DMA_RUNNING;
> +	}
> +
> +	/* Capture frame */
> +	if (cru->queue_buf[slot]) {

The queue shouldn't be an array, but a linked list. This isn't an issue
introduced by this series, so it can be fixed on top.

> +		cru->queue_buf[slot]->field = cru->format.field;

Use a local variable for the queue entry.

		struct vb2_v4l2_buffer *buf = cru->queue_buf[slot];

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> +		cru->queue_buf[slot]->sequence = cru->sequence;
> +		cru->queue_buf[slot]->vb2_buf.timestamp = ktime_get_ns();
> +		vb2_buffer_done(&cru->queue_buf[slot]->vb2_buf,
> +				VB2_BUF_STATE_DONE);
> +		cru->queue_buf[slot] = NULL;
> +	} else {
> +		/* Scratch buffer was used, dropping frame. */
> +		dev_dbg(cru->dev, "Dropping frame %u\n", cru->sequence);
> +	}
> +
> +	cru->sequence++;
> +
> +	/* Prepare for next frame */
> +	rzg2l_cru_fill_hw_slot(cru, slot);
> +
> +done:
> +	spin_unlock_irqrestore(&cru->qlock, flags);
> +	return IRQ_RETVAL(handled);
> +}
> +
>  static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count)
>  {
>  	struct rzg2l_cru_dev *cru = vb2_get_drv_priv(vq);
> @@ -782,7 +944,14 @@ static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
>  	v4l_bound_align_image(&pix->width, 320, info->max_width, 1,
>  			      &pix->height, 240, info->max_height, 2, 0);
>  
> -	pix->bytesperline = pix->width * fmt->bpp;
> +	if (info->has_stride) {
> +		u32 stride = clamp(pix->bytesperline, pix->width * fmt->bpp,
> +				   RZG2L_CRU_STRIDE_MAX);
> +		pix->bytesperline = round_up(stride, RZG2L_CRU_STRIDE_ALIGN);
> +	} else {
> +		pix->bytesperline = pix->width * fmt->bpp;
> +	}
> +
>  	pix->sizeimage = pix->bytesperline * pix->height;
>  
>  	dev_dbg(cru->dev, "Format %ux%u bpl: %u size: %u\n",

-- 
Regards,

Laurent Pinchart

