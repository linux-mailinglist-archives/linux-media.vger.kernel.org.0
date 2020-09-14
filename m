Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B96B52699E7
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 01:46:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726031AbgINXqD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Sep 2020 19:46:03 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53798 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725994AbgINXqC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Sep 2020 19:46:02 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1A688275;
        Tue, 15 Sep 2020 01:46:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600127160;
        bh=t4qTf7PG6A0EOeL3PBXnAqhRIkNkLyzT1bbI9ewDO2c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gSCTDBP/596Q59jrvpeNNUFinkVchTUIHQhJOkZvC9zgvxuH4sg1r/5Fagv3jER4h
         RiwiL+XOlswaQ1e75qwa88aYqRDgrlMXicgOKtXto7dCQHeTaafgJ/9vM14Ne3cj0/
         adMvBOWDYjI/KVMupYCQki5hIS3Ua5dvoOBjgpO8=
Date:   Tue, 15 Sep 2020 02:45:32 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v3] media: rcar-vin: Enable YDS bit depending on
 bus_width and data_shift
Message-ID: <20200914234532.GI15543@pendragon.ideasonboard.com>
References: <20200913181608.32077-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200913181608.32077-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar,

Thank you for the patch.

On Sun, Sep 13, 2020 at 07:16:08PM +0100, Lad Prabhakar wrote:
> Enable YDS bit if bus_width and data_shift is set to 8 in parallel mode
> for MEDIA_BUS_FMT_UYVY8_2X8 format.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> Changes for v3:
> * Dropped BIT macro
> * Introduced struct v4l2_fwnode_bus_parallel
> 
> Changes for v2:
> * Dropped DT binding documentation patch
> * Select the data pins depending on bus-width and data-shift
> 
> v1 -
> https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=323799
> ---
>  drivers/media/platform/rcar-vin/rcar-core.c |  9 ++++-----
>  drivers/media/platform/rcar-vin/rcar-dma.c  | 17 ++++++++++++++---
>  drivers/media/platform/rcar-vin/rcar-vin.h  |  5 +++--
>  3 files changed, 21 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> index 7440c8965d27..1149ab76cf5c 100644
> --- a/drivers/media/platform/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> @@ -626,12 +626,11 @@ static int rvin_parallel_parse_v4l2(struct device *dev,
>  
>  	switch (vin->parallel->mbus_type) {
>  	case V4L2_MBUS_PARALLEL:
> -		vin_dbg(vin, "Found PARALLEL media bus\n");
> -		vin->parallel->mbus_flags = vep->bus.parallel.flags;
> -		break;
>  	case V4L2_MBUS_BT656:
> -		vin_dbg(vin, "Found BT656 media bus\n");
> -		vin->parallel->mbus_flags = 0;
> +		vin_dbg(vin, "Found %s media bus\n",
> +			vin->parallel->mbus_type == V4L2_MBUS_PARALLEL ?
> +			"PARALLEL" : "BT656");

I'd write "parallel" and "BT.656".

> +		vin->parallel->bus = vep->bus.parallel;
>  		break;
>  	default:
>  		vin_err(vin, "Unknown media bus type\n");
> diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
> index a5dbb90c5210..d067439b0b0d 100644
> --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> @@ -125,6 +125,7 @@
>  #define VNDMR2_VPS		(1 << 30)
>  #define VNDMR2_HPS		(1 << 29)
>  #define VNDMR2_CES		(1 << 28)
> +#define VNDMR2_YDS		(1 << 22)
>  #define VNDMR2_FTEV		(1 << 17)
>  #define VNDMR2_VLV(n)		((n & 0xf) << 12)
>  
> @@ -698,16 +699,26 @@ static int rvin_setup(struct rvin_dev *vin)
>  
>  	if (!vin->is_csi) {
>  		/* Hsync Signal Polarity Select */
> -		if (!(vin->parallel->mbus_flags & V4L2_MBUS_HSYNC_ACTIVE_LOW))
> +		if (!(vin->parallel->bus.flags & V4L2_MBUS_HSYNC_ACTIVE_LOW))
>  			dmr2 |= VNDMR2_HPS;
>  
>  		/* Vsync Signal Polarity Select */
> -		if (!(vin->parallel->mbus_flags & V4L2_MBUS_VSYNC_ACTIVE_LOW))
> +		if (!(vin->parallel->bus.flags & V4L2_MBUS_VSYNC_ACTIVE_LOW))
>  			dmr2 |= VNDMR2_VPS;
>  
>  		/* Data Enable Polarity Select */
> -		if (vin->parallel->mbus_flags & V4L2_MBUS_DATA_ENABLE_LOW)
> +		if (vin->parallel->bus.flags & V4L2_MBUS_DATA_ENABLE_LOW)
>  			dmr2 |= VNDMR2_CES;
> +
> +		switch (vin->mbus_code) {
> +		case MEDIA_BUS_FMT_UYVY8_2X8:
> +			if (vin->parallel->bus.bus_width == 8 &&

You can possibly drop this check, as UYVY8_2X8 implies a bus_width equal
to 8. Apart from that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +			    vin->parallel->bus.data_shift == 8)
> +				dmr2 |= VNDMR2_YDS;
> +			break;
> +		default:
> +			break;
> +		}
>  	}
>  
>  	/*
> diff --git a/drivers/media/platform/rcar-vin/rcar-vin.h b/drivers/media/platform/rcar-vin/rcar-vin.h
> index c19d077ce1cb..8396e0e45478 100644
> --- a/drivers/media/platform/rcar-vin/rcar-vin.h
> +++ b/drivers/media/platform/rcar-vin/rcar-vin.h
> @@ -19,6 +19,7 @@
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-dev.h>
>  #include <media/v4l2-device.h>
> +#include <media/v4l2-fwnode.h>
>  #include <media/videobuf2-v4l2.h>
>  
>  /* Number of HW buffers */
> @@ -92,7 +93,7 @@ struct rvin_video_format {
>   * @asd:	sub-device descriptor for async framework
>   * @subdev:	subdevice matched using async framework
>   * @mbus_type:	media bus type
> - * @mbus_flags:	media bus configuration flags
> + * @bus:	media bus parallel configuration
>   * @source_pad:	source pad of remote subdevice
>   * @sink_pad:	sink pad of remote subdevice
>   *
> @@ -102,7 +103,7 @@ struct rvin_parallel_entity {
>  	struct v4l2_subdev *subdev;
>  
>  	enum v4l2_mbus_type mbus_type;
> -	unsigned int mbus_flags;
> +	struct v4l2_fwnode_bus_parallel bus;
>  
>  	unsigned int source_pad;
>  	unsigned int sink_pad;

-- 
Regards,

Laurent Pinchart
