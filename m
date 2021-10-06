Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3FD3424AA5
	for <lists+linux-media@lfdr.de>; Thu,  7 Oct 2021 01:45:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230359AbhJFXrb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Oct 2021 19:47:31 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53848 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230435AbhJFXrV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Oct 2021 19:47:21 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D861618B7;
        Thu,  7 Oct 2021 01:45:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633563927;
        bh=uXjA51SUTzd4bMnXt7s4oV8ImXl8LDIMiHm4jZY+EnA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VACvUHlLQRaG8MAEsvICkUX+IHbEyChBFRQ0bAGF8t2cGcV/qHUNShKFPO8zSovVf
         LbECwQaOnQvFhMbt92ceD2/S/QwtJaqFBj+VhrwbfSPg4tI3KGas9fmLqXuKPRYSMf
         V1kwWhaiFrSgE7ZcY+uOqcEbYY2cPtldTAqidHPg=
Date:   Thu, 7 Oct 2021 02:45:18 +0300
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
Subject: Re: [PATCH v4 06/11] media: cadence: csi2rx: Populate subdev devnode
Message-ID: <YV41DhFdwwGQgYLB@pendragon.ideasonboard.com>
References: <20210915120240.21572-1-p.yadav@ti.com>
 <20210915120240.21572-7-p.yadav@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210915120240.21572-7-p.yadav@ti.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Pratyush,

Thank you for the patch.

On Wed, Sep 15, 2021 at 05:32:35PM +0530, Pratyush Yadav wrote:
> The devnode can be used by media-ctl and other userspace tools to
> perform configurations on the subdev. Without it, media-ctl returns
> ENOENT when setting format on the sensor subdev.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> 
> (no changes since v2)
> 
> Changes in v2:
> - New in v2.
> 
>  drivers/media/platform/cadence/cdns-csi2rx.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
> index edd56c5f2e89..7c3183069db0 100644
> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
> @@ -602,6 +602,7 @@ static int csi2rx_probe(struct platform_device *pdev)
>  	csi2rx->pads[CSI2RX_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
>  	for (i = CSI2RX_PAD_SOURCE_STREAM0; i < CSI2RX_PAD_MAX; i++)
>  		csi2rx->pads[i].flags = MEDIA_PAD_FL_SOURCE;
> +	csi2rx->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>  
>  	ret = media_entity_pads_init(&csi2rx->subdev.entity, CSI2RX_PAD_MAX,
>  				     csi2rx->pads);

-- 
Regards,

Laurent Pinchart
