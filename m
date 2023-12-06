Return-Path: <linux-media+bounces-1774-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E55807B1D
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 23:06:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1BFC2816BB
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 22:06:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEC1D5639F;
	Wed,  6 Dec 2023 22:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KT5ng6A2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CB64DE;
	Wed,  6 Dec 2023 14:05:52 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D31F9556;
	Wed,  6 Dec 2023 23:05:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701900309;
	bh=keu6mZ1cZpht5aJTt3UURktqyYiTT3jXahRG3j0hD+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KT5ng6A2iGFV5ef2agWZKkPeDA9NB7ofdMpJB2Iihwf+WTQ36ISkHAZTeYNxBL7s5
	 mTQFjlpxeyyv4YOCGBpTAD2TixR2lV0T9BLPMjAHAArucOCjBpmB82AZwTt/PIfCt0
	 hbOictZr2XBlzRqGwUlunC9QdnrLDJSgXR2ihWqk=
Date: Thu, 7 Dec 2023 00:05:56 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	kieran.bingham@ideasonboard.com, umang.jain@ideasonboard.com,
	aford173@gmail.com, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] media: rkisp1: Store IRQ lines
Message-ID: <20231206220556.GC29417@pendragon.ideasonboard.com>
References: <20231206-rkisp-irq-fix-v2-0-6ba4185eeb1f@ideasonboard.com>
 <20231206-rkisp-irq-fix-v2-3-6ba4185eeb1f@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231206-rkisp-irq-fix-v2-3-6ba4185eeb1f@ideasonboard.com>

Hi Tomi,

Thank you for the patch.

On Wed, Dec 06, 2023 at 12:12:30PM +0200, Tomi Valkeinen wrote:
> Store the IRQ lines used by the driver for easy access. These are needed
> in future patches which fix IRQ race issues.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  .../media/platform/rockchip/rkisp1/rkisp1-common.h    | 11 ++++++++++-
>  drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c   | 19 ++++++++++++++-----
>  2 files changed, 24 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> index 960ab89c659b..ec28907d978e 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> @@ -62,6 +62,14 @@ struct regmap;
>  						 RKISP1_CIF_ISP_EXP_END |	\
>  						 RKISP1_CIF_ISP_HIST_MEASURE_RDY)
>  
> +/* IRQ lines */
> +enum rkisp1_irq_line {
> +	RKISP1_IRQ_ISP = 0,
> +	RKISP1_IRQ_MI,
> +	RKISP1_IRQ_MIPI,
> +	RKISP1_NUM_IRQS,
> +};
> +
>  /* enum for the resizer pads */
>  enum rkisp1_rsz_pad {
>  	RKISP1_RSZ_PAD_SINK,
> @@ -437,7 +445,6 @@ struct rkisp1_debug {
>   * struct rkisp1_device - ISP platform device
>   *
>   * @base_addr:	   base register address
> - * @irq:	   the irq number
>   * @dev:	   a pointer to the struct device
>   * @clk_size:	   number of clocks
>   * @clks:	   array of clocks
> @@ -457,6 +464,7 @@ struct rkisp1_debug {
>   * @stream_lock:   serializes {start/stop}_streaming callbacks between the capture devices.
>   * @debug:	   debug params to be exposed on debugfs
>   * @info:	   version-specific ISP information
> + * @irqs:          IRQ line numbers
>   */
>  struct rkisp1_device {
>  	void __iomem *base_addr;
> @@ -479,6 +487,7 @@ struct rkisp1_device {
>  	struct mutex stream_lock; /* serialize {start/stop}_streaming cb between capture devices */
>  	struct rkisp1_debug debug;
>  	const struct rkisp1_info *info;
> +	int irqs[RKISP1_NUM_IRQS];
>  };
>  
>  /*
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> index 030eb8c79546..492ff5e6770d 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> @@ -115,6 +115,7 @@
>  struct rkisp1_isr_data {
>  	const char *name;
>  	irqreturn_t (*isr)(int irq, void *ctx);
> +	u32 line_mask;
>  };
>  
>  /* ----------------------------------------------------------------------------
> @@ -473,9 +474,9 @@ static const char * const px30_isp_clks[] = {
>  };
>  
>  static const struct rkisp1_isr_data px30_isp_isrs[] = {
> -	{ "isp", rkisp1_isp_isr },
> -	{ "mi", rkisp1_capture_isr },
> -	{ "mipi", rkisp1_csi_isr },
> +	{ "isp", rkisp1_isp_isr, BIT(RKISP1_IRQ_ISP) },
> +	{ "mi", rkisp1_capture_isr, BIT(RKISP1_IRQ_MI) },
> +	{ "mipi", rkisp1_csi_isr, BIT(RKISP1_IRQ_MIPI) },
>  };
>  
>  static const struct rkisp1_info px30_isp_info = {
> @@ -496,7 +497,7 @@ static const char * const rk3399_isp_clks[] = {
>  };
>  
>  static const struct rkisp1_isr_data rk3399_isp_isrs[] = {
> -	{ NULL, rkisp1_isr },
> +	{ NULL, rkisp1_isr, BIT(RKISP1_IRQ_ISP) | BIT(RKISP1_IRQ_MI) | BIT(RKISP1_IRQ_MIPI) },
>  };
>  
>  static const struct rkisp1_info rk3399_isp_info = {
> @@ -517,7 +518,7 @@ static const char * const imx8mp_isp_clks[] = {
>  };
>  
>  static const struct rkisp1_isr_data imx8mp_isp_isrs[] = {
> -	{ NULL, rkisp1_isr },
> +	{ NULL, rkisp1_isr, BIT(RKISP1_IRQ_ISP) | BIT(RKISP1_IRQ_MI) | BIT(RKISP1_IRQ_MIPI) },

The i.MX8MP has no CSI-2 RX in the ISP, you can drop RKISP1_IRQ_MIPI.

I think we can merge this series before the i.MX8MP support, could you
base v3 on top of the master branch of the linux-media stage tree ?

>  };
>  
>  static const struct rkisp1_info imx8mp_isp_info = {
> @@ -574,6 +575,9 @@ static int rkisp1_probe(struct platform_device *pdev)
>  	if (IS_ERR(rkisp1->base_addr))
>  		return PTR_ERR(rkisp1->base_addr);
>  
> +	for (unsigned int il = 0; il < RKISP1_NUM_IRQS; ++il)

I would use ARRAY_SIZE(rkisp1->irqs) instead of RKISP1_NUM_IRQS here.

> +		rkisp1->irqs[il] = -1;
> +
>  	for (i = 0; i < info->isr_size; i++) {
>  		irq = info->isrs[i].name
>  		    ? platform_get_irq_byname(pdev, info->isrs[i].name)
> @@ -581,6 +585,11 @@ static int rkisp1_probe(struct platform_device *pdev)
>  		if (irq < 0)
>  			return irq;
>  
> +		for (unsigned int il = 0; il < RKISP1_NUM_IRQS; ++il) {

Same here.

> +			if (info->isrs[i].line_mask & BIT(il))
> +				rkisp1->irqs[il] = irq;
> +		}
> +
>  		ret = devm_request_irq(dev, irq, info->isrs[i].isr, 0,
>  				       dev_driver_string(dev), dev);
>  		if (ret) {

-- 
Regards,

Laurent Pinchart

