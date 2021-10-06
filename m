Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CA73424A9D
	for <lists+linux-media@lfdr.de>; Thu,  7 Oct 2021 01:42:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239663AbhJFXod (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Oct 2021 19:44:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230213AbhJFXod (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Oct 2021 19:44:33 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DF65C061746;
        Wed,  6 Oct 2021 16:42:40 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 233279DC;
        Thu,  7 Oct 2021 01:42:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633563759;
        bh=fGm3gnUNERUo0KyeBujjutbUCnU6APpkxae+5dDSwX8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=q1wVCJhA+7Av/GfSyRiJqpEGuUmdIKdEr12wfr12IuaUozkGFYo5ggVGLwbM4/qG1
         pqeRVn6IWurWrdQ3U3K6bbVbraoaYvVsRBHPlq3CDpgzat1SbSDz+6jCEYPz1n70XY
         Tf5VJDO+foWAdyRMfzUJgICORpWFXpKdJaHXa3nM=
Date:   Thu, 7 Oct 2021 02:42:30 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Pratyush Yadav <p.yadav@ti.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Benoit Parrot <bparrot@ti.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v4 04/11] media: cadence: csi2rx: Set the STOP bit when
 stopping a stream
Message-ID: <YV40Zh9snnXqDIhn@pendragon.ideasonboard.com>
References: <20210915120240.21572-1-p.yadav@ti.com>
 <20210915120240.21572-5-p.yadav@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210915120240.21572-5-p.yadav@ti.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Pratyush,

Thank you for the patch.

On Wed, Sep 15, 2021 at 05:32:33PM +0530, Pratyush Yadav wrote:
> The stream stop procedure says that the STOP bit should be set when the
> stream is to be stopped, and then the ready bit in stream status
> register polled to make sure the STOP operation is finished.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> ---
> 
> (no changes since v1)
> 
>  drivers/media/platform/cadence/cdns-csi2rx.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
> index e05d76394cd6..3730e8beee48 100644
> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
> @@ -8,6 +8,7 @@
>  #include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/io.h>
> +#include <linux/iopoll.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_graph.h>
> @@ -40,8 +41,12 @@
>  
>  #define CSI2RX_STREAM_CTRL_REG(n)		(CSI2RX_STREAM_BASE(n) + 0x000)
>  #define CSI2RX_STREAM_CTRL_SOFT_RST			BIT(4)
> +#define CSI2RX_STREAM_CTRL_STOP				BIT(1)
>  #define CSI2RX_STREAM_CTRL_START			BIT(0)
>  
> +#define CSI2RX_STREAM_STATUS_REG(n)		(CSI2RX_STREAM_BASE(n) + 0x004)
> +#define CSI2RX_STREAM_STATUS_RDY			BIT(31)
> +
>  #define CSI2RX_STREAM_DATA_CFG_REG(n)		(CSI2RX_STREAM_BASE(n) + 0x008)
>  #define CSI2RX_STREAM_DATA_CFG_EN_VC_SELECT		BIT(31)
>  #define CSI2RX_STREAM_DATA_CFG_VC_SELECT(n)		BIT((n) + 16)
> @@ -321,12 +326,23 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
>  static void csi2rx_stop(struct csi2rx_priv *csi2rx)
>  {
>  	unsigned int i;
> +	u32 val;
> +	int ret;
>  
>  	clk_prepare_enable(csi2rx->p_clk);
>  	clk_disable_unprepare(csi2rx->sys_clk);
>  
>  	for (i = 0; i < csi2rx->max_streams; i++) {
> -		writel(0, csi2rx->base + CSI2RX_STREAM_CTRL_REG(i));
> +		writel(CSI2RX_STREAM_CTRL_STOP,
> +		       csi2rx->base + CSI2RX_STREAM_CTRL_REG(i));
> +
> +		ret = readl_relaxed_poll_timeout(csi2rx->base +
> +						 CSI2RX_STREAM_STATUS_REG(i),
> +						 val,
> +						 (val & CSI2RX_STREAM_STATUS_RDY),
> +						 10, 10000);
> +		if (ret)
> +			dev_warn(csi2rx->dev, "Failed to stop stream%d\n", i);

%u for unsigned int.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  
>  		clk_disable_unprepare(csi2rx->pixel_clk[i]);
>  	}

-- 
Regards,

Laurent Pinchart
