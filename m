Return-Path: <linux-media+bounces-14972-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EE192FCCB
	for <lists+linux-media@lfdr.de>; Fri, 12 Jul 2024 16:43:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9DE8FB21F83
	for <lists+linux-media@lfdr.de>; Fri, 12 Jul 2024 14:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16BE3172796;
	Fri, 12 Jul 2024 14:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dyYq8G/O"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB73415B134;
	Fri, 12 Jul 2024 14:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720795425; cv=none; b=E8/CXvwUduHLCsZKOoyfVekFdTyLsxg3D8zTAqGN8cYODdjICASZ8Ye9F0gqRyYumvpYe1yXFZ8Wdr3UCvQo4bgEZnRE9qfDFy0AFiX9RSqRHL8f0gyvc0leyJq34saDjU6SBSgbAiSfQVaKZj5bIF4PHpHE73cTIhGn3fO0A48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720795425; c=relaxed/simple;
	bh=riEXTUJN7e5MdYDVVbItk00REe4qmKawGtxFOuio/SA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=En7gxcORWsTp8e66rR5QlGZnPG0AJlpmYG6EcBbZZu98BfntLItqi1Y2FIXOjgI4C5EuGTqDRp9GZhqA2DgscPtS1b3RuGbW8MD1JuqsKU0PrOqajiAta8Cz/bZRvyDQ9u9xvi7vqkdmZV58oHdCSTJKGnT0mIDzWXgXT7yrUUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dyYq8G/O; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-56-63.net.vodafone.it [5.90.56.63])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2F336735;
	Fri, 12 Jul 2024 16:43:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1720795387;
	bh=riEXTUJN7e5MdYDVVbItk00REe4qmKawGtxFOuio/SA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dyYq8G/ODBUg2h5iKRxWdm8ljZ2b8g2Y9a4fT1yd1ecVdAJ86mfIAHqKNkZGL87+x
	 e5y4tk7tvF65YtuRGcNkyCfm/ARsiFSmNojbIGkbszjpsXyaA1SGfoZ6UYh6I+BhZp
	 JHBkhXZ0ox0TlTdgYXz5nRLK+PAX2EEHsUwb1MBo=
Date: Fri, 12 Jul 2024 16:43:38 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jai Luthra <j-luthra@ti.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Vaishnav Achath <vaishnav.a@ti.com>, 
	Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>, 
	Aradhya Bhatia <a-bhatia1@ti.com>, Devarsh Thakkar <devarsht@ti.com>, 
	Changhuang Liang <changhuang.liang@starfivetech.com>, Jack Zhu <jack.zhu@starfivetech.com>, 
	Julien Massot <julien.massot@collabora.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 07/13] media: ti: j721e-csi2rx: get number of contexts
 from device tree
Message-ID: <5tvwcygupy2hheyggg7m7ancrrwrnin4lej2554pg6smu2oaze@je6hmqobnz6r>
References: <20240627-multistream-v2-0-6ae96c54c1c3@ti.com>
 <20240627-multistream-v2-7-6ae96c54c1c3@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240627-multistream-v2-7-6ae96c54c1c3@ti.com>

On Thu, Jun 27, 2024 at 06:40:02PM GMT, Jai Luthra wrote:
> From: Pratyush Yadav <p.yadav@ti.com>
>
> Different platforms that use this driver might have different number of
> DMA channels allocated for CSI. So only as many DMA contexts can be used
> as the number of DMA channels available. Get the number of channels
> provided via device tree and only configure that many contexts, and
> hence only that many pads.
>
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> Co-developed-by: Jai Luthra <j-luthra@ti.com>
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> ---
>  .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  | 44 ++++++++++++++++------
>  1 file changed, 32 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index 13d7426ab4ba..b4b4bb69c88a 100644
> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> @@ -40,7 +40,7 @@
>  #define SHIM_PSI_CFG0_DST_TAG		GENMASK(31, 16)
>
>  #define PSIL_WORD_SIZE_BYTES		16
> -#define TI_CSI2RX_NUM_CTX		1
> +#define TI_CSI2RX_MAX_CTX		32
>
>  /*
>   * There are no hard limits on the width or height. The DMA engine can handle
> @@ -53,8 +53,8 @@
>
>  #define TI_CSI2RX_PAD_SINK		0
>  #define TI_CSI2RX_PAD_FIRST_SOURCE	1
> -#define TI_CSI2RX_NUM_SOURCE_PADS	1
> -#define TI_CSI2RX_NUM_PADS		(1 + TI_CSI2RX_NUM_SOURCE_PADS)
> +#define TI_CSI2RX_MAX_SOURCE_PADS	TI_CSI2RX_MAX_CTX
> +#define TI_CSI2RX_MAX_PADS		(1 + TI_CSI2RX_MAX_SOURCE_PADS)
>
>  #define DRAIN_TIMEOUT_MS		50
>  #define DRAIN_BUFFER_SIZE		SZ_32K
> @@ -112,14 +112,15 @@ struct ti_csi2rx_dev {
>  	void __iomem			*shim;
>  	struct mutex			mutex; /* To serialize ioctls. */
>  	unsigned int			enable_count;
> +	unsigned int			num_ctx;
>  	struct v4l2_device		v4l2_dev;
>  	struct media_device		mdev;
>  	struct media_pipeline		pipe;
> -	struct media_pad		pads[TI_CSI2RX_NUM_PADS];
> +	struct media_pad		pads[TI_CSI2RX_MAX_PADS];
>  	struct v4l2_async_notifier	notifier;
>  	struct v4l2_subdev		*source;
>  	struct v4l2_subdev		subdev;
> -	struct ti_csi2rx_ctx		ctx[TI_CSI2RX_NUM_CTX];
> +	struct ti_csi2rx_ctx		ctx[TI_CSI2RX_MAX_CTX];
>  	/* Buffer to drain stale data from PSI-L endpoint */
>  	struct {
>  		void			*vaddr;
> @@ -449,7 +450,7 @@ static int csi_async_notifier_complete(struct v4l2_async_notifier *notifier)
>  		return ret;
>
>  	/* Create and link video nodes for all DMA contexts */
> -	for (i = 0; i < TI_CSI2RX_NUM_CTX; i++) {
> +	for (i = 0; i < csi->num_ctx; i++) {
>  		struct ti_csi2rx_ctx *ctx = &csi->ctx[i];
>  		struct video_device *vdev = &ctx->vdev;
>
> @@ -1231,10 +1232,12 @@ static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
>
>  	csi->pads[TI_CSI2RX_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
>
> -	for (i = TI_CSI2RX_PAD_FIRST_SOURCE; i < TI_CSI2RX_NUM_PADS; i++)
> +	for (i = TI_CSI2RX_PAD_FIRST_SOURCE;
> +	     i < TI_CSI2RX_PAD_FIRST_SOURCE + csi->num_ctx; i++)
>  		csi->pads[i].flags = MEDIA_PAD_FL_SOURCE;
>
> -	ret = media_entity_pads_init(&sd->entity, ARRAY_SIZE(csi->pads),
> +	ret = media_entity_pads_init(&sd->entity,
> +				     TI_CSI2RX_PAD_FIRST_SOURCE + csi->num_ctx,
>  				     csi->pads);
>  	if (ret)
>  		goto unregister_media;
> @@ -1320,8 +1323,9 @@ static int ti_csi2rx_init_ctx(struct ti_csi2rx_ctx *ctx)
>
>  static int ti_csi2rx_probe(struct platform_device *pdev)
>  {
> +	struct device_node *np = pdev->dev.of_node;
>  	struct ti_csi2rx_dev *csi;
> -	int ret, i;
> +	int ret, i, count;
>
>  	csi = devm_kzalloc(&pdev->dev, sizeof(*csi), GFP_KERNEL);
>  	if (!csi)
> @@ -1343,13 +1347,29 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
>  	if (!csi->drain.vaddr)
>  		return -ENOMEM;
>
> +	/* Only use as many contexts as the number of DMA channels allocated. */
> +	count = of_property_count_strings(np, "dma-names");

Is the property marked as required in the DTS bindings ?

If that's the case, I thought the assumption was that dts are
'correct'.

> +	if (count < 0) {
> +		dev_err(csi->dev, "Failed to get DMA channel count: %d\n",
> +			count);
> +		return count;
> +	}
> +
> +	csi->num_ctx = count;
> +	if (csi->num_ctx > TI_CSI2RX_MAX_CTX) {
> +		dev_warn(csi->dev,
> +			 "%u DMA channels passed. Maximum is %u. Ignoring the rest.\n",
> +			 csi->num_ctx, TI_CSI2RX_MAX_CTX);
> +		csi->num_ctx = TI_CSI2RX_MAX_CTX;
> +	}
> +
>  	mutex_init(&csi->mutex);
>
>  	ret = ti_csi2rx_v4l2_init(csi);
>  	if (ret)
>  		goto err_v4l2;
>
> -	for (i = 0; i < TI_CSI2RX_NUM_CTX; i++) {
> +	for (i = 0; i < csi->num_ctx; i++) {
>  		csi->ctx[i].idx = i;
>  		csi->ctx[i].csi = csi;
>  		ret = ti_csi2rx_init_ctx(&csi->ctx[i]);
> @@ -1388,14 +1408,14 @@ static void ti_csi2rx_remove(struct platform_device *pdev)
>  	struct ti_csi2rx_dev *csi = platform_get_drvdata(pdev);
>  	int i;
>
> -	for (i = 0; i < TI_CSI2RX_NUM_CTX; i++) {
> +	for (i = 0; i < csi->num_ctx; i++) {
>  		if (vb2_is_busy(&csi->ctx[i].vidq))
>  			dev_err(csi->dev,
>  				"Failed to remove as queue busy for ctx %u\n",
>  				i);
>  	}
>
> -	for (i = 0; i < TI_CSI2RX_NUM_CTX; i++)
> +	for (i = 0; i < csi->num_ctx; i++)
>  		ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
>
>  	ti_csi2rx_cleanup_notifier(csi);
>
> --
> 2.43.0
>
>

