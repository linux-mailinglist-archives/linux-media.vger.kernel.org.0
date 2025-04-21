Return-Path: <linux-media+bounces-30613-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C408EA9517D
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 15:20:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC510172541
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 13:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2713E265CB5;
	Mon, 21 Apr 2025 13:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="h4Hnhhbo"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61DC263F22;
	Mon, 21 Apr 2025 13:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745241635; cv=none; b=am60fYRrGheZrI35akFAtGHQ4M3zUpUKuBTrkBa2RF7qSGE7j0zV73RNuTdn/4BvxpMBSSDVo0ZukhELMrcpkQbuJBea5mdPYuzGOF0g0GA/I4txfs5CQofDUohmvN0XPEV7Eyo/vZ6N72L6HcnZMMmgyvOl8kS3CmSNpGsZok0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745241635; c=relaxed/simple;
	bh=s/MEn69Vxiwgbi3TnjgmMNpoidNLH7016dKMoDI/3b0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=boqTEh/z0jZlZFzdGFxk8gkVSpHmxbyftGlU2Y1rWDCv9hPPtsvujlJIvMmfBlsnEbo+PQHbcpxr8aZxH9Bcxc4iWv6KmFk90tES3OeL9gNbTZjgCyetVx//1qw2hM9GKeDWw3HiK/pqhXtpaYnnUIxFDVS98kIzBLSRLReIXf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=h4Hnhhbo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5CC806D5;
	Mon, 21 Apr 2025 15:18:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745241505;
	bh=s/MEn69Vxiwgbi3TnjgmMNpoidNLH7016dKMoDI/3b0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h4HnhhboDu5KoTpyBcY1Ycj5vlIySSnDKCsLEfTX80R7uSerlmmffWgWENezev7nG
	 dKcsIwxLNk45NequPkiefxdQJo0gZeU3OBlMtRcUDbVr9QNzQaHytv/h8QRqQurjw3
	 FFphnHqcIXLMa4fUH/+pdVpR98yh4VARDPwELPMU=
Date: Mon, 21 Apr 2025 16:20:30 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rishikesh Donadkar <r-donadkar@ti.com>
Cc: jai.luthra@linux.dev, mripard@kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	devarsht@ti.com, y-abhilashchandra@ti.com, mchehab@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	vaishnav.a@ti.com, s-jain1@ti.com, vigneshr@ti.com,
	sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
	tomi.valkeinen@ideasonboard.com, jai.luthra@ideasonboard.com,
	changhuang.liang@starfivetech.com, jack.zhu@starfivetech.com
Subject: Re: [PATCH v3 06/13] media: ti: j721e-csi2rx: get number of contexts
 from device tree
Message-ID: <20250421132030.GF29483@pendragon.ideasonboard.com>
References: <20250417065554.437541-1-r-donadkar@ti.com>
 <20250417065554.437541-7-r-donadkar@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250417065554.437541-7-r-donadkar@ti.com>

Hi Rishikesh,

Thank you for the patch.

On Thu, Apr 17, 2025 at 12:25:47PM +0530, Rishikesh Donadkar wrote:
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
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> ---
>  .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 41 ++++++++++++++-----
>  1 file changed, 30 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index ea7e331e872af..e85d04d7c2ff9 100644
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
> @@ -1212,10 +1213,11 @@ static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
>  	csi->pads[TI_CSI2RX_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
>  
>  	for (unsigned int i = TI_CSI2RX_PAD_FIRST_SOURCE;
> -	     i < TI_CSI2RX_NUM_PADS; i++)
> +	     i < TI_CSI2RX_PAD_FIRST_SOURCE + csi->num_ctx; i++)
>  		csi->pads[i].flags = MEDIA_PAD_FL_SOURCE;
>  
> -	ret = media_entity_pads_init(&sd->entity, ARRAY_SIZE(csi->pads),
> +	ret = media_entity_pads_init(&sd->entity,
> +				     TI_CSI2RX_PAD_FIRST_SOURCE + csi->num_ctx,
>  				     csi->pads);
>  	if (ret)
>  		goto unregister_media;
> @@ -1301,8 +1303,9 @@ static int ti_csi2rx_init_ctx(struct ti_csi2rx_ctx *ctx)
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
> @@ -1324,13 +1327,29 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
>  	if (!csi->drain.vaddr)
>  		return -ENOMEM;
>  
> +	/* Only use as many contexts as the number of DMA channels allocated. */
> +	count = of_property_count_strings(np, "dma-names");
> +	if (count < 0) {
> +		dev_err(csi->dev, "Failed to get DMA channel count: %d\n",
> +			count);
> +		return count;

You're leaking the drain buffer.

> +	}
> +
> +	csi->num_ctx = count;
> +	if (csi->num_ctx > TI_CSI2RX_MAX_CTX) {
> +		dev_warn(csi->dev,
> +			 "%u DMA channels passed. Maximum is %u. Ignoring the rest.\n",
> +			 csi->num_ctx, TI_CSI2RX_MAX_CTX);

I'd rather turn this into a hard error and get the device trees fixed.

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
> @@ -1369,7 +1388,7 @@ static void ti_csi2rx_remove(struct platform_device *pdev)
>  	struct ti_csi2rx_dev *csi = platform_get_drvdata(pdev);
>  	unsigned int i;
>  
> -	for (i = 0; i < TI_CSI2RX_NUM_CTX; i++)
> +	for (i = 0; i < csi->num_ctx; i++)
>  		ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
>  
>  	ti_csi2rx_cleanup_notifier(csi);

-- 
Regards,

Laurent Pinchart

