Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28811B20EA
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2019 15:49:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391509AbfIMN3U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Sep 2019 09:29:20 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:33885 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2390444AbfIMNT6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Sep 2019 09:19:58 -0400
Received: from [IPv6:2001:420:44c1:2577:888a:538c:8dda:557b] ([IPv6:2001:420:44c1:2577:888a:538c:8dda:557b])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 8lUOiWodCV17O8lURi2q7R; Fri, 13 Sep 2019 15:19:55 +0200
Subject: Re: [Patch 12/13] media: am437x-vpfe: Remove per bus width static
 data
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Prabhakar Lad <prabhakar.csengg@gmail.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190909162743.30114-1-bparrot@ti.com>
 <20190909162743.30114-13-bparrot@ti.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <add3cb62-1391-f8e3-15f3-f1345e18da47@xs4all.nl>
Date:   Fri, 13 Sep 2019 15:19:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190909162743.30114-13-bparrot@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfDPD79xpkAXnqWG0IqlGd95oDOl6bT+t+OMAuRgFfzmSo+y5satYA0w6avFYMQClcPT72By7btbxBlcfIXJSYFPmzapLt0p05YQz0Ot3cIej0Rrjv4rD
 TKGUjwt56ya8Kk68vFVAt6s0E8gulCm1cc+HpK1IMy8v+ScJy7+KSr7sSe9EneEp6fgS1+OyQ84o9VQBbAa+ePjkH2/hsogZjV+3lAtajqplQ7d6Zfk3drHT
 Fb0mX1fXJmHUFDdc4fsSWJ1Ex4z7/OOTkLfNU70O3a3x+vnAe7yNOIxlzqQQZnuNUTb4KnPYY/bUrtZweAkj0NinkPrpt0O2Pj9yPiKbxdWq3wmYBueBtsYO
 SuyWNIAajdqqtnl1BvkyjHMFrXIlbtnhaLlh0oXT71i5JixTJfK12uwvqfweIBHva2PL4usEX/Ij6hmDt1IVHFyRcEJCaw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/9/19 6:27 PM, Benoit Parrot wrote:
> The bus related static data include in the vpfe_fmt
> static table can be derived dynamically instead.
> This simplify the table and it's use.

simplify -> simplifies
it's -> its

> 
> We instead replace the per bus data info with just
> the usual bit per pixel value for each supported

bit -> bits

> pixel format.
> 
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> ---
>  drivers/media/platform/am437x/am437x-vpfe.c | 56 ++++++---------------
>  drivers/media/platform/am437x/am437x-vpfe.h | 16 +-----
>  2 files changed, 16 insertions(+), 56 deletions(-)
> 
> diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
> index 9759ed398943..9855d4cb1d13 100644
> --- a/drivers/media/platform/am437x/am437x-vpfe.c
> +++ b/drivers/media/platform/am437x/am437x-vpfe.c
> @@ -73,73 +73,43 @@ static struct vpfe_fmt formats[] = {
>  	{
>  		.fourcc		= V4L2_PIX_FMT_YUYV,
>  		.code		= MEDIA_BUS_FMT_YUYV8_2X8,
> -		.l.width	= 10,
> -		.l.bpp		= 4,
> -		.s.width	= 8,
> -		.s.bpp		= 2,
> +		.bitsperpixel	= 16,
>  	}, {
>  		.fourcc		= V4L2_PIX_FMT_UYVY,
>  		.code		= MEDIA_BUS_FMT_UYVY8_2X8,
> -		.l.width	= 10,
> -		.l.bpp		= 4,
> -		.s.width	= 8,
> -		.s.bpp		= 2,
> +		.bitsperpixel	= 16,
>  	}, {
>  		.fourcc		= V4L2_PIX_FMT_YVYU,
>  		.code		= MEDIA_BUS_FMT_YVYU8_2X8,
> -		.l.width	= 10,
> -		.l.bpp		= 4,
> -		.s.width	= 8,
> -		.s.bpp		= 2,
> +		.bitsperpixel	= 16,
>  	}, {
>  		.fourcc		= V4L2_PIX_FMT_VYUY,
>  		.code		= MEDIA_BUS_FMT_VYUY8_2X8,
> -		.l.width	= 10,
> -		.l.bpp		= 4,
> -		.s.width	= 8,
> -		.s.bpp		= 2,
> +		.bitsperpixel	= 16,
>  	}, {
>  		.fourcc		= V4L2_PIX_FMT_SBGGR8,
>  		.code		= MEDIA_BUS_FMT_SBGGR8_1X8,
> -		.l.width	= 10,
> -		.l.bpp		= 2,
> -		.s.width	= 8,
> -		.s.bpp		= 1,
> +		.bitsperpixel	= 8,
>  	}, {
>  		.fourcc		= V4L2_PIX_FMT_SGBRG8,
>  		.code		= MEDIA_BUS_FMT_SGBRG8_1X8,
> -		.l.width	= 10,
> -		.l.bpp		= 2,
> -		.s.width	= 8,
> -		.s.bpp		= 1,
> +		.bitsperpixel	= 8,
>  	}, {
>  		.fourcc		= V4L2_PIX_FMT_SGRBG8,
>  		.code		= MEDIA_BUS_FMT_SGRBG8_1X8,
> -		.l.width	= 10,
> -		.l.bpp		= 2,
> -		.s.width	= 8,
> -		.s.bpp		= 1,
> +		.bitsperpixel	= 8,
>  	}, {
>  		.fourcc		= V4L2_PIX_FMT_SRGGB8,
>  		.code		= MEDIA_BUS_FMT_SRGGB8_1X8,
> -		.l.width	= 10,
> -		.l.bpp		= 2,
> -		.s.width	= 8,
> -		.s.bpp		= 1,
> +		.bitsperpixel	= 8,
>  	}, {
>  		.fourcc		= V4L2_PIX_FMT_RGB565,
>  		.code		= MEDIA_BUS_FMT_RGB565_2X8_LE,
> -		.l.width	= 10,
> -		.l.bpp		= 4,
> -		.s.width	= 8,
> -		.s.bpp		= 2,
> +		.bitsperpixel	= 16,
>  	}, {
>  		.fourcc		= V4L2_PIX_FMT_RGB565X,
>  		.code		= MEDIA_BUS_FMT_RGB565_2X8_BE,
> -		.l.width	= 10,
> -		.l.bpp		= 4,
> -		.s.width	= 8,
> -		.s.bpp		= 2,
> +		.bitsperpixel	= 16,
>  	},
>  };
>  
> @@ -184,9 +154,11 @@ static unsigned int __get_bytesperpixel(struct vpfe_device *vpfe,
>  {
>  	struct vpfe_subdev_info *sdinfo = vpfe->current_subdev;
>  	unsigned int bus_width = sdinfo->vpfe_param.bus_width;
> -	u32 bpp;
> +	u32 bpp, bus_width_bytes, clocksperpixel;
>  
> -	bpp = (bus_width == 10) ? fmt->l.bpp : fmt->s.bpp;
> +	bus_width_bytes = ALIGN(bus_width, 8) >> 3;
> +	clocksperpixel = DIV_ROUND_UP(fmt->bitsperpixel, bus_width);
> +	bpp = clocksperpixel * bus_width_bytes;
>  
>  	return bpp;
>  }
> diff --git a/drivers/media/platform/am437x/am437x-vpfe.h b/drivers/media/platform/am437x/am437x-vpfe.h
> index 0d10d2b4d7a2..2c9e89395bea 100644
> --- a/drivers/media/platform/am437x/am437x-vpfe.h
> +++ b/drivers/media/platform/am437x/am437x-vpfe.h
> @@ -215,28 +215,16 @@ struct vpfe_ccdc {
>  	u32 ccdc_ctx[VPFE_REG_END / sizeof(u32)];
>  };
>  
> -/*
> - * struct bus_format - VPFE bus format information
> - * @width: Bits per pixel (when transferred over a bus)
> - * @bpp: Bytes per pixel (when stored in memory)
> - */
> -struct bus_format {
> -	unsigned int width;
> -	unsigned int bpp;
> -};
> -
>  /*
>   * struct vpfe_fmt - VPFE media bus format information
>   * @fourcc: V4L2 pixel format code
>   * @code: V4L2 media bus format code
> - * @l: 10 bit bus format info
> - * @s: 8 bit bus format info
> + * @bitsperpixel: Bits per pixel over the bus
>   */
>  struct vpfe_fmt {
>  	u32 fourcc;
>  	u32 code;
> -	struct bus_format l;
> -	struct bus_format s;
> +	u32 bitsperpixel;
>  };
>  
>  /*
> 

Regards,

	Hans
