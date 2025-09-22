Return-Path: <linux-media+bounces-42944-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7ACB9125D
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 14:39:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BBF8D16A5B9
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 12:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5625D3081BA;
	Mon, 22 Sep 2025 12:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="M3zwCwsO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0FD1FDA82;
	Mon, 22 Sep 2025 12:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758544770; cv=none; b=N5Igs3Kbq4lrCx67hI3WARDcwmlbYxi07dF6kCJO5XPp04vo2cKlOy2MdcQ0wXkOnfvMn6BSwL665ajtNJgvoPwC3ydQJN37EeYXRH6K/BxEXGCXPx5sPCf+TxdKsu7oD/za+jFAdRG6djV/oO4Ja4ePZZo+n76GJjIrIz/Cch0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758544770; c=relaxed/simple;
	bh=23GeeD8fsctc1TJk74/cv00jzA01Z+bid2b6AfzDbyc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ryvumx0QksIJLBVBVO0uMtgm33Rdee2VaDotYzREN/vFK61xciRSZlwmddkpFH904pk/4GBcycw17c34kZm+aSoSQeV7990sGX+Sfr5I6h8m1VDRLHdxF3EnzsgSTsJAfF6HB3dHzwqhD2vocitlxq3r7vcVEraj4vBn2hGUTGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=M3zwCwsO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9141EB7D;
	Mon, 22 Sep 2025 14:38:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758544683;
	bh=23GeeD8fsctc1TJk74/cv00jzA01Z+bid2b6AfzDbyc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=M3zwCwsO4T/cAW6J5xujh52KYJtTxKlv8fisr+cp71xDPjoxsjZRxUmLNkPa0JD7G
	 QH++ThC8Nz43T8q4EGjKw4Ann2lO8VCqW1d7NmGndsIvbbW96xT2aZGQXbfGK0Ocnv
	 v8MwEhFdV9S2meQKyXUh48O3PD3aFk6W+uZsLaYs=
Message-ID: <eeeb9aef-9e67-45de-afb3-833bdb6994d6@ideasonboard.com>
Date: Mon, 22 Sep 2025 15:39:22 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 07/16] media: ti: j721e-csi2rx: get number of contexts
 from device tree
To: Rishikesh Donadkar <r-donadkar@ti.com>, jai.luthra@linux.dev,
 laurent.pinchart@ideasonboard.com, mripard@kernel.org
Cc: y-abhilashchandra@ti.com, devarsht@ti.com, s-jain1@ti.com,
 vigneshr@ti.com, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 p.zabel@pengutronix.de, conor+dt@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil-cisco@xs4all.nl, jai.luthra@ideasonboard.com,
 changhuang.liang@starfivetech.com, jack.zhu@starfivetech.com,
 sjoerd@collabora.com, hverkuil+cisco@kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250911102832.1583440-1-r-donadkar@ti.com>
 <20250911102832.1583440-8-r-donadkar@ti.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 xsFNBE6ms0cBEACyizowecZqXfMZtnBniOieTuFdErHAUyxVgtmr0f5ZfIi9Z4l+uUN4Zdw2
 wCEZjx3o0Z34diXBaMRJ3rAk9yB90UJAnLtb8A97Oq64DskLF81GCYB2P1i0qrG7UjpASgCA
 Ru0lVvxsWyIwSfoYoLrazbT1wkWRs8YBkkXQFfL7Mn3ZMoGPcpfwYH9O7bV1NslbmyJzRCMO
 eYV258gjCcwYlrkyIratlHCek4GrwV8Z9NQcjD5iLzrONjfafrWPwj6yn2RlL0mQEwt1lOvn
 LnI7QRtB3zxA3yB+FLsT1hx0va6xCHpX3QO2gBsyHCyVafFMrg3c/7IIWkDLngJxFgz6DLiA
 G4ld1QK/jsYqfP2GIMH1mFdjY+iagG4DqOsjip479HCWAptpNxSOCL6z3qxCU8MCz8iNOtZk
 DYXQWVscM5qgYSn+fmMM2qN+eoWlnCGVURZZLDjg387S2E1jT/dNTOsM/IqQj+ZROUZuRcF7
 0RTtuU5q1HnbRNwy+23xeoSGuwmLQ2UsUk7Q5CnrjYfiPo3wHze8avK95JBoSd+WIRmV3uoO
 rXCoYOIRlDhg9XJTrbnQ3Ot5zOa0Y9c4IpyAlut6mDtxtKXr4+8OzjSVFww7tIwadTK3wDQv
 Bus4jxHjS6dz1g2ypT65qnHen6mUUH63lhzewqO9peAHJ0SLrQARAQABzTBUb21pIFZhbGtl
 aW5lbiA8dG9taS52YWxrZWluZW5AaWRlYXNvbmJvYXJkLmNvbT7CwY4EEwEIADgWIQTEOAw+
 ll79gQef86f6PaqMvJYe9QUCX/HruAIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRD6
 PaqMvJYe9WmFD/99NGoD5lBJhlFDHMZvO+Op8vCwnIRZdTsyrtGl72rVh9xRfcSgYPZUvBuT
 VDxE53mY9HaZyu1eGMccYRBaTLJSfCXl/g317CrMNdY0k40b9YeIX10feiRYEWoDIPQ3tMmA
 0nHDygzcnuPiPT68JYZ6tUOvAt7r6OX/litM+m2/E9mtp8xCoWOo/kYO4mOAIoMNvLB8vufi
 uBB4e/AvAjtny4ScuNV5c5q8MkfNIiOyag9QCiQ/JfoAqzXRjVb4VZG72AKaElwipiKCWEcU
 R4+Bu5Qbaxj7Cd36M/bI54OrbWWETJkVVSV1i0tghCd6HHyquTdFl7wYcz6cL1hn/6byVnD+
 sR3BLvSBHYp8WSwv0TCuf6tLiNgHAO1hWiQ1pOoXyMEsxZlgPXT+wb4dbNVunckwqFjGxRbl
 Rz7apFT/ZRwbazEzEzNyrBOfB55xdipG/2+SmFn0oMFqFOBEszXLQVslh64lI0CMJm2OYYe3
 PxHqYaztyeXsx13Bfnq9+bUynAQ4uW1P5DJ3OIRZWKmbQd/Me3Fq6TU57LsvwRgE0Le9PFQs
 dcP2071rMTpqTUteEgODJS4VDf4lXJfY91u32BJkiqM7/62Cqatcz5UWWHq5xeF03MIUTqdE
 qHWk3RJEoWHWQRzQfcx6Fn2fDAUKhAddvoopfcjAHfpAWJ+ENc7BTQROprNHARAAx0aat8GU
 hsusCLc4MIxOQwidecCTRc9Dz/7U2goUwhw2O5j9TPqLtp57VITmHILnvZf6q3QAho2QMQyE
 DDvHubrdtEoqaaSKxKkFie1uhWNNvXPhwkKLYieyL9m2JdU+b88HaDnpzdyTTR4uH7wk0bBa
 KbTSgIFDDe5lXInypewPO30TmYNkFSexnnM3n1PBCqiJXsJahE4ZQ+WnV5FbPUj8T2zXS2xk
 0LZ0+DwKmZ0ZDovvdEWRWrz3UzJ8DLHb7blPpGhmqj3ANXQXC7mb9qJ6J/VSl61GbxIO2Dwb
 xPNkHk8fwnxlUBCOyBti/uD2uSTgKHNdabhVm2dgFNVuS1y3bBHbI/qjC3J7rWE0WiaHWEqy
 UVPk8rsph4rqITsj2RiY70vEW0SKePrChvET7D8P1UPqmveBNNtSS7In+DdZ5kUqLV7rJnM9
 /4cwy+uZUt8cuCZlcA5u8IsBCNJudxEqBG10GHg1B6h1RZIz9Q9XfiBdaqa5+CjyFs8ua01c
 9HmyfkuhXG2OLjfQuK+Ygd56mV3lq0aFdwbaX16DG22c6flkkBSjyWXYepFtHz9KsBS0DaZb
 4IkLmZwEXpZcIOQjQ71fqlpiXkXSIaQ6YMEs8WjBbpP81h7QxWIfWtp+VnwNGc6nq5IQDESH
 mvQcsFS7d3eGVI6eyjCFdcAO8eMAEQEAAcLBXwQYAQIACQUCTqazRwIbDAAKCRD6PaqMvJYe
 9fA7EACS6exUedsBKmt4pT7nqXBcRsqm6YzT6DeCM8PWMTeaVGHiR4TnNFiT3otD5UpYQI7S
 suYxoTdHrrrBzdlKe5rUWpzoZkVK6p0s9OIvGzLT0lrb0HC9iNDWT3JgpYDnk4Z2mFi6tTbq
 xKMtpVFRA6FjviGDRsfkfoURZI51nf2RSAk/A8BEDDZ7lgJHskYoklSpwyrXhkp9FHGMaYII
 m9EKuUTX9JPDG2FTthCBrdsgWYPdJQvM+zscq09vFMQ9Fykbx5N8z/oFEUy3ACyPqW2oyfvU
 CH5WDpWBG0s5BALp1gBJPytIAd/pY/5ZdNoi0Cx3+Z7jaBFEyYJdWy1hGddpkgnMjyOfLI7B
 CFrdecTZbR5upjNSDvQ7RG85SnpYJTIin+SAUazAeA2nS6gTZzumgtdw8XmVXZwdBfF+ICof
 92UkbYcYNbzWO/GHgsNT1WnM4sa9lwCSWH8Fw1o/3bX1VVPEsnESOfxkNdu+gAF5S6+I6n3a
 ueeIlwJl5CpT5l8RpoZXEOVtXYn8zzOJ7oGZYINRV9Pf8qKGLf3Dft7zKBP832I3PQjeok7F
 yjt+9S+KgSFSHP3Pa4E7lsSdWhSlHYNdG/czhoUkSCN09C0rEK93wxACx3vtxPLjXu6RptBw
 3dRq7n+mQChEB1am0BueV1JZaBboIL0AGlSJkm23kw==
In-Reply-To: <20250911102832.1583440-8-r-donadkar@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/09/2025 13:28, Rishikesh Donadkar wrote:
> From: Pratyush Yadav <p.yadav@ti.com>
> 
> Different platforms that use this driver might have different number of
> DMA channels allocated for CSI. So only as many DMA contexts can be used
> as the number of DMA channels available. Get the number of channels
> provided via device tree and only configure that many contexts, and
> hence only that many pads.
> 
> Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> Co-developed-by: Jai Luthra <j-luthra@ti.com>
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> ---
>  .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 43 ++++++++++++++-----
>  1 file changed, 32 insertions(+), 11 deletions(-)

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

 Tomi

> 
> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index e49448e1f2ad..f3443c3ab01a 100644
> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> @@ -44,7 +44,7 @@
>  
>  #define TI_CSI2RX_MAX_PIX_PER_CLK	4
>  #define PSIL_WORD_SIZE_BYTES		16
> -#define TI_CSI2RX_NUM_CTX		1
> +#define TI_CSI2RX_MAX_CTX		32
>  
>  /*
>   * There are no hard limits on the width or height. The DMA engine can handle
> @@ -57,8 +57,8 @@
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
> @@ -118,14 +118,15 @@ struct ti_csi2rx_dev {
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
>  	u8				pix_per_clk;
>  	/* Buffer to drain stale data from PSI-L endpoint */
>  	struct {
> @@ -459,7 +460,7 @@ static int csi_async_notifier_complete(struct v4l2_async_notifier *notifier)
>  		return ret;
>  
>  	/* Create and link video nodes for all DMA contexts */
> -	for (i = 0; i < TI_CSI2RX_NUM_CTX; i++) {
> +	for (i = 0; i < csi->num_ctx; i++) {
>  		struct ti_csi2rx_ctx *ctx = &csi->ctx[i];
>  		struct video_device *vdev = &ctx->vdev;
>  
> @@ -1247,10 +1248,11 @@ static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
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
> @@ -1341,8 +1343,9 @@ static int ti_csi2rx_init_ctx(struct ti_csi2rx_ctx *ctx)
>  
>  static int ti_csi2rx_probe(struct platform_device *pdev)
>  {
> +	struct device_node *np = pdev->dev.of_node;
>  	struct ti_csi2rx_dev *csi;
> -	int ret, i;
> +	int ret = 0, i, count;
>  
>  	csi = devm_kzalloc(&pdev->dev, sizeof(*csi), GFP_KERNEL);
>  	if (!csi)
> @@ -1364,13 +1367,30 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
>  	if (!csi->drain.vaddr)
>  		return -ENOMEM;
>  
> +	/* Only use as many contexts as the number of DMA channels allocated. */
> +	count = of_property_count_strings(np, "dma-names");
> +	if (count < 0) {
> +		dev_err(csi->dev, "Failed to get DMA channel count: %d\n", count);
> +		ret = count;
> +		goto err_dma_chan;
> +	}
> +
> +	csi->num_ctx = count;
> +	if (csi->num_ctx > TI_CSI2RX_MAX_CTX) {
> +		dev_err(csi->dev,
> +			"%u DMA channels passed. Maximum is %u.\n",
> +			csi->num_ctx, TI_CSI2RX_MAX_CTX);
> +		ret = -EINVAL;
> +		goto err_dma_chan;
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
> @@ -1399,6 +1419,7 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
>  	ti_csi2rx_cleanup_v4l2(csi);
>  err_v4l2:
>  	mutex_destroy(&csi->mutex);
> +err_dma_chan:
>  	dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,
>  			  csi->drain.paddr);
>  	return ret;
> @@ -1409,7 +1430,7 @@ static void ti_csi2rx_remove(struct platform_device *pdev)
>  	struct ti_csi2rx_dev *csi = platform_get_drvdata(pdev);
>  	unsigned int i;
>  
> -	for (i = 0; i < TI_CSI2RX_NUM_CTX; i++)
> +	for (i = 0; i < csi->num_ctx; i++)
>  		ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
>  
>  	ti_csi2rx_cleanup_notifier(csi);


