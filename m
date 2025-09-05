Return-Path: <linux-media+bounces-41825-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1506B45439
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 12:13:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74B3E1BC7110
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 10:13:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D96C72D0615;
	Fri,  5 Sep 2025 10:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="sGOQ8oOa"
X-Original-To: linux-media@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED7C2C0F72;
	Fri,  5 Sep 2025 10:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757067213; cv=none; b=UT22ESJGFdsLCGxpYGVupAgoCvLru4MxrKeHQ+NuMZiO35dkWGq4IsDCXzm2QVjWkNjZWcOvUiAi1npDuW2vrSVQZqmZ48wpmCEXA7JB3yF6sS/jJy0ZMa701m9/OKpyT0+FgzO1aXeInp1pBx6GVle4TIAbD6LsHaGaex/q7fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757067213; c=relaxed/simple;
	bh=TqQmjycQ68nhbXtYVQgaIVdU7BqZUAxPvwp8glcwet4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NH6nkOr3TBupNkOOgmdBIiyqHFFDQR3BtuEvYCgM3cadxLK9hoH0GgH7P45/khLmxpb65Dimd8miJdPf5ugbdUHCh1syaqTAYPVHzgd86Q3ODoeD2NMQIkuCkFtDZbBIOqCcO0ciA81fx2dGsi+1zXiLysRdqjPY+H27EU4hUu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=sGOQ8oOa; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 585ADAoN3299978;
	Fri, 5 Sep 2025 05:13:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757067190;
	bh=PBuzO5UMHyr99m9u+p0R5HezHYfPcTXn/mBLP4pC3Ao=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=sGOQ8oOa1exDwMdwuf9J+wJ/bxMaLmE/MJTrHraU0790cmLVopnjIx+BHsiPHLeYM
	 TSg0VV2WrWNDwnDNiOh0cChv2r/mgjHbcYErn3FuBFQkqk7hdsQJY3TDzYZqmwyUlW
	 zov6OFt8wrId8eTgI4ligpTpeyI177ZRw5tcyxAg=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 585ADA6m849483
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 5 Sep 2025 05:13:10 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 5
 Sep 2025 05:13:09 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 5 Sep 2025 05:13:09 -0500
Received: from [10.24.68.198] (abhilash-hp.dhcp.ti.com [10.24.68.198])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 585AD3k6580702;
	Fri, 5 Sep 2025 05:13:04 -0500
Message-ID: <e8cf4381-6075-471c-a1ae-201677b1cec3@ti.com>
Date: Fri, 5 Sep 2025 15:43:03 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/14] media: ti: j721e-csi2rx: Wait for the last drain
 completion
To: Rishikesh Donadkar <r-donadkar@ti.com>, <jai.luthra@linux.dev>,
        <laurent.pinchart@ideasonboard.com>, <mripard@kernel.org>
CC: <devarsht@ti.com>, <vaishnav.a@ti.com>, <s-jain1@ti.com>,
        <vigneshr@ti.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <sakari.ailus@linux.intel.com>, <hverkuil-cisco@xs4all.nl>,
        <tomi.valkeinen@ideasonboard.com>, <jai.luthra@ideasonboard.com>,
        <changhuang.liang@starfivetech.com>, <jack.zhu@starfivetech.com>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20250825142522.1826188-1-r-donadkar@ti.com>
 <20250825142522.1826188-15-r-donadkar@ti.com>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <20250825142522.1826188-15-r-donadkar@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 25/08/25 19:55, Rishikesh Donadkar wrote:
> dmaengine_terminate_sync() causes all activity for the DMA channel to be
> stopped, and may discard data in the DMA FIFO which hasn't been fully
> transferred. No callback functions will be called for any
> incomplete transfers[1].
> 
> In multistream use case, calling dmaengine_terminate_sync() immediately
> after issuing the last drain transaction will result in no callback
> for the last drain cycle.
> 
> Implement complete callback for the last drain cycle to make sure that
> the last drain has completed properly, this will ensure that stale data
> is not left out in the HW FIFO.
> 
> [1] : https://docs.kernel.org/driver-api/dmaengine/client.html
> 
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> ---

Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>

>   drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index 4ac6a76b9409..520ee05eb5b4 100644
> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> @@ -62,6 +62,7 @@
>   #define TI_CSI2RX_MAX_PADS		(1 + TI_CSI2RX_MAX_SOURCE_PADS)
>   
>   #define DRAIN_BUFFER_SIZE		SZ_32K
> +#define DRAIN_TIMEOUT_MS		50
>   
>   #define CSI2RX_BRIDGE_SOURCE_PAD	1
>   
> @@ -137,6 +138,7 @@ struct ti_csi2rx_dev {
>   		size_t			len;
>   	} drain;
>   	bool				vc_cached;
> +	struct completion drain_complete;
>   };
>   
>   static inline struct ti_csi2rx_dev *to_csi2rx_dev(struct v4l2_subdev *sd)
> @@ -624,12 +626,14 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
>   static void ti_csi2rx_drain_callback(void *param)
>   {
>   	struct ti_csi2rx_ctx *ctx = param;
> +	struct ti_csi2rx_dev *csi = ctx->csi;
>   	struct ti_csi2rx_dma *dma = &ctx->dma;
>   	unsigned long flags;
>   
>   	spin_lock_irqsave(&dma->lock, flags);
>   
>   	if (dma->state == TI_CSI2RX_DMA_STOPPED) {
> +		complete(&csi->drain_complete);
>   		spin_unlock_irqrestore(&dma->lock, flags);
>   		return;
>   	}
> @@ -774,6 +778,7 @@ static int ti_csi2rx_start_dma(struct ti_csi2rx_ctx *ctx,
>   static void ti_csi2rx_stop_dma(struct ti_csi2rx_ctx *ctx)
>   {
>   	struct ti_csi2rx_dma *dma = &ctx->dma;
> +	struct ti_csi2rx_dev *csi = ctx->csi;
>   	enum ti_csi2rx_dma_state state;
>   	unsigned long flags;
>   	int ret;
> @@ -783,6 +788,8 @@ static void ti_csi2rx_stop_dma(struct ti_csi2rx_ctx *ctx)
>   	dma->state = TI_CSI2RX_DMA_STOPPED;
>   	spin_unlock_irqrestore(&dma->lock, flags);
>   
> +	init_completion(&csi->drain_complete);
> +
>   	if (state != TI_CSI2RX_DMA_STOPPED) {
>   		/*
>   		 * Normal DMA termination does not clean up pending data on
> @@ -796,6 +803,10 @@ static void ti_csi2rx_stop_dma(struct ti_csi2rx_ctx *ctx)
>   				 "Failed to drain DMA. Next frame might be bogus\n");
>   	}
>   
> +	if (!wait_for_completion_timeout(&csi->drain_complete,
> +					 msecs_to_jiffies(DRAIN_TIMEOUT_MS)))
> +		dev_dbg(csi->dev, "DMA transfer timed out for drain buffer\n");
> +
>   	ret = dmaengine_terminate_sync(ctx->dma.chan);
>   	if (ret)
>   		dev_err(ctx->csi->dev, "Failed to stop DMA: %d\n", ret);


