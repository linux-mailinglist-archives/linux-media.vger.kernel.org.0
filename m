Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51144424AA1
	for <lists+linux-media@lfdr.de>; Thu,  7 Oct 2021 01:45:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231154AbhJFXq4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Oct 2021 19:46:56 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53812 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230213AbhJFXq4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Oct 2021 19:46:56 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D68179DC;
        Thu,  7 Oct 2021 01:45:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633563902;
        bh=usfTGnLgoBfvsM30PSZ08PBlCzOGza9aVeqkhYhShqg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gnlk+PbEYsmNIJQgA56HNFGUQKxi7oHl3DmUHBCUVq9KXgj7BUF+PCODLz4GpyF8/
         POgNrBc061kadhKurzkRZCFy2U3Q9kkMarPTZRHaM0SzVl/oDPOssE7dp2CV4Fj94U
         8JCrNUYVYksKlg0cRYis1uKk6em1/Q3aAxJO2jKY=
Date:   Thu, 7 Oct 2021 02:44:53 +0300
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
Subject: Re: [PATCH v4 05/11] media: cadence: csi2rx: Fix stream data
 configuration
Message-ID: <YV409Zp5K7+ydoQ8@pendragon.ideasonboard.com>
References: <20210915120240.21572-1-p.yadav@ti.com>
 <20210915120240.21572-6-p.yadav@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210915120240.21572-6-p.yadav@ti.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Pratyush,

Thank you for the patch.

On Wed, Sep 15, 2021 at 05:32:34PM +0530, Pratyush Yadav wrote:
> Firstly, there is no VC_EN bit present in the STREAM_DATA_CFG register.
> Bit 31 is part of the VL_SELECT field. Remove it completely.
> 
> Secondly, it makes little sense to enable ith virtual channel for ith
> stream. Sure, there might be a use-case that demands it. But there might
> also be a use case that demands all streams to use the 0th virtual
> channel. Prefer this case over the former because it is less arbitrary
> and also makes it very clear what the limitations of the current driver
> is instead of giving a false impression that multiple virtual channels
> are supported.

No issue with that. Hopefully we'll support multiple streams for real in
the not too distant future :-)

> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> 
> (no changes since v1)
> 
>  drivers/media/platform/cadence/cdns-csi2rx.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
> index 3730e8beee48..edd56c5f2e89 100644
> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
> @@ -48,7 +48,6 @@
>  #define CSI2RX_STREAM_STATUS_RDY			BIT(31)
>  
>  #define CSI2RX_STREAM_DATA_CFG_REG(n)		(CSI2RX_STREAM_BASE(n) + 0x008)
> -#define CSI2RX_STREAM_DATA_CFG_EN_VC_SELECT		BIT(31)
>  #define CSI2RX_STREAM_DATA_CFG_VC_SELECT(n)		BIT((n) + 16)
>  
>  #define CSI2RX_STREAM_CFG_REG(n)		(CSI2RX_STREAM_BASE(n) + 0x00c)
> @@ -286,8 +285,11 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
>  		writel(CSI2RX_STREAM_CFG_FIFO_MODE_LARGE_BUF,
>  		       csi2rx->base + CSI2RX_STREAM_CFG_REG(i));
>  
> -		writel(CSI2RX_STREAM_DATA_CFG_EN_VC_SELECT |
> -		       CSI2RX_STREAM_DATA_CFG_VC_SELECT(i),
> +		/*
> +		 * Enable one virtual channel. When multiple virtual channels
> +		 * are supported this will have to be changed.
> +		 */
> +		writel(CSI2RX_STREAM_DATA_CFG_VC_SELECT(0),
>  		       csi2rx->base + CSI2RX_STREAM_DATA_CFG_REG(i));
>  
>  		writel(CSI2RX_STREAM_CTRL_START,

-- 
Regards,

Laurent Pinchart
