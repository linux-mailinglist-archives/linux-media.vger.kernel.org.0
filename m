Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52E9435C2BA
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 12:03:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238892AbhDLJsI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 05:48:08 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:34627 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242106AbhDLJqD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 05:46:03 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 924C260009;
        Mon, 12 Apr 2021 09:45:41 +0000 (UTC)
Date:   Mon, 12 Apr 2021 11:46:20 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Eugen Hristev <eugen.hristev@microchip.com>
Cc:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 05/30] media: atmel: atmel-isc: specialize dma cfg
Message-ID: <20210412094620.uxzt5ri74awbmhpx@uno.localdomain>
References: <20210405155105.162529-1-eugen.hristev@microchip.com>
 <20210405155105.162529-6-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210405155105.162529-6-eugen.hristev@microchip.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Eugene

On Mon, Apr 05, 2021 at 06:50:40PM +0300, Eugen Hristev wrote:
> The dma configuration (DCFG) is specific to the product.
> Move this configuration in the product specific driver, and add the
> field inside the driver struct.

Do you plan to match on different compatible values ?
As in that case you could retrieve platform-specific data with
of_device_get_match_data() maybe ? Just pointing it out if it's anyway
useful to you.

Thanks
  j

>
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
>  drivers/media/platform/atmel/atmel-isc-base.c    | 3 +--
>  drivers/media/platform/atmel/atmel-isc.h         | 2 ++
>  drivers/media/platform/atmel/atmel-sama5d2-isc.c | 3 +++
>  3 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
> index 350076dd029a..ff40ee2e2759 100644
> --- a/drivers/media/platform/atmel/atmel-isc-base.c
> +++ b/drivers/media/platform/atmel/atmel-isc-base.c
> @@ -716,8 +716,7 @@ static int isc_configure(struct isc_device *isc)
>  	rlp_mode = isc->config.rlp_cfg_mode;
>  	pipeline = isc->config.bits_pipeline;
>
> -	dcfg = isc->config.dcfg_imode |
> -		       ISC_DCFG_YMBSIZE_BEATS8 | ISC_DCFG_CMBSIZE_BEATS8;
> +	dcfg = isc->config.dcfg_imode | isc->dcfg;
>
>  	pfe_cfg0  |= subdev->pfe_cfg0 | ISC_PFE_CFG0_MODE_PROGRESSIVE;
>  	mask = ISC_PFE_CFG0_BPS_MASK | ISC_PFE_CFG0_HPOL_LOW |
> diff --git a/drivers/media/platform/atmel/atmel-isc.h b/drivers/media/platform/atmel/atmel-isc.h
> index 6becc6c3aaf0..d14ae096fbf6 100644
> --- a/drivers/media/platform/atmel/atmel-isc.h
> +++ b/drivers/media/platform/atmel/atmel-isc.h
> @@ -150,6 +150,7 @@ struct isc_ctrls {
>   * @hclock:		Hclock clock input (refer datasheet)
>   * @ispck:		iscpck clock (refer datasheet)
>   * @isc_clks:		ISC clocks
> + * @dcfg:		DMA master configuration, architecture dependent
>   *
>   * @dev:		Registered device driver
>   * @v4l2_dev:		v4l2 registered device
> @@ -197,6 +198,7 @@ struct isc_device {
>  	struct clk		*hclock;
>  	struct clk		*ispck;
>  	struct isc_clk		isc_clks[2];
> +	u32			dcfg;
>
>  	struct device		*dev;
>  	struct v4l2_device	v4l2_dev;
> diff --git a/drivers/media/platform/atmel/atmel-sama5d2-isc.c b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
> index f8d1c8ba99b3..6d9942dcd7c1 100644
> --- a/drivers/media/platform/atmel/atmel-sama5d2-isc.c
> +++ b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
> @@ -198,6 +198,9 @@ static int atmel_isc_probe(struct platform_device *pdev)
>  	isc->max_width = ISC_SAMA5D2_MAX_SUPPORT_WIDTH;
>  	isc->max_height = ISC_SAMA5D2_MAX_SUPPORT_HEIGHT;
>
> +	/* sama5d2-isc - 8 bits per beat */
> +	isc->dcfg = ISC_DCFG_YMBSIZE_BEATS8 | ISC_DCFG_CMBSIZE_BEATS8;
> +
>  	ret = isc_pipeline_init(isc);
>  	if (ret)
>  		return ret;
> --
> 2.25.1
>
