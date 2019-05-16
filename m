Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 733E0202FA
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2019 11:58:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726742AbfEPJ63 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 May 2019 05:58:29 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:55046 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726597AbfEPJ63 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 May 2019 05:58:29 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E452A320;
        Thu, 16 May 2019 11:58:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1558000707;
        bh=8wvcy7GVS54txbEu7FU0vj9t0p7yO8LAaGbNt/7W1CA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jAuZk7Z+GYWt3GbarzDUK3p9bs4BJpm5aCl9BRlASb68AGCm0ar08EUd6ud0iBEAV
         AGaLePVjSa44KSwrIAR01Nj+bfION7bd6ZIc/bW2u7fno40DtkgfduEC3MShl3Rb4e
         vTC6e/6YCHLQouqfdW9bs85SEdI6d4HBqWMSAZPc=
Date:   Thu, 16 May 2019 12:58:10 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/3] rcar-vin: Rename VNDMR_DTMD_ARGB1555 to
 VNDMR_DTMD_ARGB
Message-ID: <20190516095810.GA4995@pendragon.ideasonboard.com>
References: <20190516004746.3794-1-niklas.soderlund+renesas@ragnatech.se>
 <20190516004746.3794-2-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190516004746.3794-2-niklas.soderlund+renesas@ragnatech.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

Thank you for the patch.

On Thu, May 16, 2019 at 02:47:44AM +0200, Niklas Söderlund wrote:
> The value have nothing to do with ARGB1555, it controls if the alpha
> component should be filled in for ARGB1555 or ARGB888. Rename it to
> reflect this.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/rcar-vin/rcar-dma.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
> index 91ab064404a185af..2d146ecf93d66ad5 100644
> --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> @@ -114,7 +114,7 @@
>  #define VNDMR_EXRGB		(1 << 8)
>  #define VNDMR_BPSM		(1 << 4)
>  #define VNDMR_DTMD_YCSEP	(1 << 1)
> -#define VNDMR_DTMD_ARGB1555	(1 << 0)
> +#define VNDMR_DTMD_ARGB		(1 << 0)
>  
>  /* Video n Data Mode Register 2 bits */
>  #define VNDMR2_VPS		(1 << 30)
> @@ -721,7 +721,7 @@ static int rvin_setup(struct rvin_dev *vin)
>  		output_is_yuv = true;
>  		break;
>  	case V4L2_PIX_FMT_XRGB555:
> -		dmr = VNDMR_DTMD_ARGB1555;
> +		dmr = VNDMR_DTMD_ARGB;
>  		break;
>  	case V4L2_PIX_FMT_RGB565:
>  		dmr = 0;

-- 
Regards,

Laurent Pinchart
