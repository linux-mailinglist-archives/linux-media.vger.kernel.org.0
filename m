Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE762F11BD
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2019 10:08:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727790AbfKFJIu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Nov 2019 04:08:50 -0500
Received: from retiisi.org.uk ([95.216.213.190]:56050 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726891AbfKFJIt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 Nov 2019 04:08:49 -0500
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 7A2CF634C87;
        Wed,  6 Nov 2019 11:07:33 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1iSHHo-0002Vb-HM; Wed, 06 Nov 2019 11:07:32 +0200
Date:   Wed, 6 Nov 2019 11:07:32 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [Patch v2 14/20] media: ti-vpe: cal: Add AM654 support
Message-ID: <20191106090732.GC6253@valkosipuli.retiisi.org.uk>
References: <20191104193140.31145-1-bparrot@ti.com>
 <20191104193140.31145-15-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191104193140.31145-15-bparrot@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benoit,

On Mon, Nov 04, 2019 at 01:31:34PM -0600, Benoit Parrot wrote:
> Add the needed control module register bit layout to support the AM654
> family of devices.
> 
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> ---
>  drivers/media/platform/Kconfig      |  2 +-
>  drivers/media/platform/ti-vpe/cal.c | 28 +++++++++++++++++++++++++++-
>  2 files changed, 28 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index e84f35d3a68e..995f4c67f764 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -151,7 +151,7 @@ source "drivers/media/platform/sunxi/Kconfig"
>  config VIDEO_TI_CAL
>  	tristate "TI CAL (Camera Adaptation Layer) driver"
>  	depends on VIDEO_DEV && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
> -	depends on SOC_DRA7XX || COMPILE_TEST
> +	depends on SOC_DRA7XX || ARCH_K3 || COMPILE_TEST
>  	select VIDEOBUF2_DMA_CONTIG
>  	select V4L2_FWNODE
>  	help
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index 72ed2348389d..45653e9ed6cd 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -322,6 +322,26 @@ static struct cal_data dra76x_cal_data = {
>  	.flags = 0,
>  };
>  
> +static struct reg_field am654_ctrl_core_csi0_reg_fields[F_MAX_FIELDS] = {
> +	[F_CTRLCLKEN] = REG_FIELD(0, 15, 15),
> +	[F_CAMMODE] = REG_FIELD(0, 24, 25),
> +	[F_LANEENABLE] = REG_FIELD(0, 0, 4),
> +};
> +
> +static struct cal_csi2_phy am654_cal_csi_phy[] = {
> +	{
> +		.base_fields = am654_ctrl_core_csi0_reg_fields,
> +		.num_lanes = 5,
> +	},
> +};
> +
> +static struct cal_data am654_cal_data = {
> +	.csi2_phy_core = am654_cal_csi_phy,
> +	.num_csi2_phy = ARRAY_SIZE(am654_cal_csi_phy),
> +
> +	.flags = 0,

Same comments as on 12th patch.

Could all these structs be const?

> +};
> +
>  /*
>   * there is one cal_dev structure in the driver, it is shared by
>   * all instances.
> @@ -548,7 +568,9 @@ static void camerarx_phy_enable(struct cal_ctx *ctx)
>  	/* Always enable all lanes at the phy control level */
>  	max_lanes = (1 << cal_data_get_phy_max_lanes(ctx)) - 1;
>  	regmap_field_write(phy->fields[F_LANEENABLE], max_lanes);
> -	regmap_field_write(phy->fields[F_CSI_MODE], 1);
> +	/* F_CSI_MODE is not present on every architecture */
> +	if (phy->fields[F_CSI_MODE])
> +		regmap_field_write(phy->fields[F_CSI_MODE], 1);
>  	regmap_field_write(phy->fields[F_CTRLCLKEN], 1);
>  }
>  

-- 
Regards,

Sakari Ailus
