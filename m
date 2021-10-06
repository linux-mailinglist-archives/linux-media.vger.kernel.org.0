Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60941424A96
	for <lists+linux-media@lfdr.de>; Thu,  7 Oct 2021 01:41:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239700AbhJFXnZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Oct 2021 19:43:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230300AbhJFXnY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Oct 2021 19:43:24 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 140CBC061746;
        Wed,  6 Oct 2021 16:41:32 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 279709DC;
        Thu,  7 Oct 2021 01:41:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633563689;
        bh=4yu3HAshfoTDCtp7rGfJYPMaStmXzGGcMbq9pxMKk6o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EbEw01STLZ8deRhZHfR9/whyMNQQl8baTmWfU6oOAWUukcoDtFVlmO7DZ9FbpRv4u
         vFznG1mD2vhlShiXF1tOvGK2Y2bQYy0Rb9Or10x5ZlEk/TtlpgUkgQJ0Dt7i9V6Y5F
         EZclRp7d8pA22qgsP/r3hqej9eCg2tNXJ2IiRdUA=
Date:   Thu, 7 Oct 2021 02:41:20 +0300
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
Subject: Re: [PATCH v4 03/11] media: cadence: csi2rx: Soft reset the streams
 before starting capture
Message-ID: <YV40INNM/o2M0LHV@pendragon.ideasonboard.com>
References: <20210915120240.21572-1-p.yadav@ti.com>
 <20210915120240.21572-4-p.yadav@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210915120240.21572-4-p.yadav@ti.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Pratyush,

Thank you for the patch.

On Wed, Sep 15, 2021 at 05:32:32PM +0530, Pratyush Yadav wrote:
> This resets the stream state machines and FIFOs, giving them a clean
> slate. On J721E if the streams are not reset before starting the
> capture, the captured frame gets wrapped around vertically on every run
> after the first.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> ---
> 
> (no changes since v1)
> 
>  drivers/media/platform/cadence/cdns-csi2rx.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
> index c06e039a1aa8..e05d76394cd6 100644
> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
> @@ -39,6 +39,7 @@
>  #define CSI2RX_STREAM_BASE(n)		(((n) + 1) * 0x100)
>  
>  #define CSI2RX_STREAM_CTRL_REG(n)		(CSI2RX_STREAM_BASE(n) + 0x000)
> +#define CSI2RX_STREAM_CTRL_SOFT_RST			BIT(4)
>  #define CSI2RX_STREAM_CTRL_START			BIT(0)
>  
>  #define CSI2RX_STREAM_DATA_CFG_REG(n)		(CSI2RX_STREAM_BASE(n) + 0x008)
> @@ -135,12 +136,22 @@ struct csi2rx_priv *v4l2_subdev_to_csi2rx(struct v4l2_subdev *subdev)
>  
>  static void csi2rx_reset(struct csi2rx_priv *csi2rx)
>  {
> +	int i;

i is always positive, it can be an unsigned int. With this,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
>  	writel(CSI2RX_SOFT_RESET_PROTOCOL | CSI2RX_SOFT_RESET_FRONT,
>  	       csi2rx->base + CSI2RX_SOFT_RESET_REG);
>  
>  	udelay(10);
>  
>  	writel(0, csi2rx->base + CSI2RX_SOFT_RESET_REG);
> +
> +	/* Reset individual streams. */
> +	for (i = 0; i < csi2rx->max_streams; i++) {
> +		writel(CSI2RX_STREAM_CTRL_SOFT_RST,
> +		       csi2rx->base + CSI2RX_STREAM_CTRL_REG(i));
> +		usleep_range(10, 20);
> +		writel(0, csi2rx->base + CSI2RX_STREAM_CTRL_REG(i));
> +	}
>  }
>  
>  static int csi2rx_configure_external_dphy(struct csi2rx_priv *csi2rx)

-- 
Regards,

Laurent Pinchart
