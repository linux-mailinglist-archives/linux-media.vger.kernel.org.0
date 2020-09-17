Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34AA126D73E
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 10:58:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726447AbgIQI5i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 04:57:38 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:46885 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726217AbgIQI5g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 04:57:36 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id IpjOkLFp4PTBMIpjPklEVJ; Thu, 17 Sep 2020 10:57:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1600333052; bh=TbnZlMyjc7hLW5uIquqo+lfYa05Kd4uURNp0UGR0Q6c=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=qhWncq+6AkVVfv7kbN22XwqiEJUyw652fCtE+1rMl8B8+4Ubq5SBp/w+g4myHmhB/
         7lwUqNU/t4lJ5uw2PCu4vv8aZy+PbZcULxZshJcr2Hszcorv7jZGL+E95nuuRRouAo
         7Pe/I79ebUjrg8FHil26o3k5cKs0J7e8p0il/dkIrbb7ovWr0w5YJsAHK6UeShckZ1
         BY6wctElBKYNsJ1SgMigSZchyKs6ayjYo9ZseZgvFaaUQERN6M67ZeGXj25KcWPnHi
         ImmhRykluwfEqWE/mJudRQrwg5AgqD11S/1yzuUAUPURbBVYD2rr2ZilmMgXHX9oAw
         5qbiiMzqiHJyw==
Subject: Re: [PATCH v3] media: rcar-vin: Enable YDS bit depending on bus_width
 and data_shift
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>
References: <20200913181608.32077-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <a153e31a-4115-db74-9b21-3e0cbcd8993d@xs4all.nl>
Date:   Thu, 17 Sep 2020 10:57:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200913181608.32077-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFFR2firi3VrZbJciuz+8KyIN1Cr/M78LF570WN6OoeLmaimY1FXDLMAni4sG3Px59Z6eh/leikmodORkTkZUSnq7JXf6nAjD8UZOZBnCY5g/No67Iah
 8pfVXOZSJ6F+9WdXNt0HteX7kNzeAdd1wShfXmPyWQMPkIYHEoaTtBgyPT9JUjNRXrQlQp5XxzSLTS02q8qdA7r39/4vgZi9UXHnD1FJ6sQK9QSPhx6b7Vs8
 hkcn5VFihQKp+dcmaSONcRb0bdcoQuzyXblHfrvGpRWAYcFB+k9KDI2nDje8zRXdLeYZORQ353NuCbMawor8/wkmDHCURnhdpi4evkb5YZSlpFrcK1SzlBnQ
 oiUTBUWC8Ihq6FKLIK91R0zBgEt/b/kOz8pCiGOZjcGwv+KqtU6r1cNvIrjtIKCnKnzDYTfHkymXF1HSMJZtiYsJI5TNrsDcTC5zXRDstfdTlQYdU7PkF992
 auVLCyO1vVGcDXwCdGwMNuZ0HTqivea7fjy8kkI6zsgPbLaHCNvQ0qKwne9UCjWd03k2lXevPSQB9l+YVO9q3pmivRFtkaiH564mW1XRxmIPc6JCHZNCcdNu
 NCRcNUBLqwpE5LKsH100hxH9HqcNmPUG0w43j/zWrvWznw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar,

Can you rebase this patch? It no longer applies.

Regards,

	Hans

On 13/09/2020 20:16, Lad Prabhakar wrote:
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
> 

