Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53B4E20393
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2019 12:36:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727054AbfEPKgz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 May 2019 06:36:55 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:56250 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726707AbfEPKgz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 May 2019 06:36:55 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AC1E3320;
        Thu, 16 May 2019 12:36:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1558003012;
        bh=IrP1mhqqJ8JvOMaIwPp6c1MjAmYGWNJwnc/F8JeBQY0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SBDrxQ6RTRmZah5x+nIcsdiXX00/1IYhUJdtSgzEUnazOQ9K2ZsMrlXkMHz2+27/f
         6LUUg3n4S1qWeRRDrhxcWI+Vgje0ve7F9WjEX+kORL6+MkOvK4DX+5CioHxq2LakrU
         Ee+6BHP7duShGwR1JPQp5DuJpjmMo+ZAVDE1LPJg=
Date:   Thu, 16 May 2019 13:36:36 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] media: fdp1: Support M3N and E3 platforms
Message-ID: <20190516103636.GF4995@pendragon.ideasonboard.com>
References: <20190515153912.5182-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190515153912.5182-1-kieran.bingham+renesas@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

Thank you for the patch.

On Wed, May 15, 2019 at 04:39:12PM +0100, Kieran Bingham wrote:
> New Gen3 R-Car platforms incorporate the FDP1 with an updated version
> register. No code change is required to support these targets, but they
> will currently report an error stating that the device can not be
> identified.
> 
> Update the driver to match against the new device types.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

and applied to my tree.

> ---
>  drivers/media/platform/rcar_fdp1.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/media/platform/rcar_fdp1.c b/drivers/media/platform/rcar_fdp1.c
> index 6bda1eee9170..4f103be215d3 100644
> --- a/drivers/media/platform/rcar_fdp1.c
> +++ b/drivers/media/platform/rcar_fdp1.c
> @@ -257,6 +257,8 @@ MODULE_PARM_DESC(debug, "activate debug info");
>  #define FD1_IP_H3_ES1			0x02010101
>  #define FD1_IP_M3W			0x02010202
>  #define FD1_IP_H3			0x02010203
> +#define FD1_IP_M3N			0x02010204
> +#define FD1_IP_E3			0x02010205
>  
>  /* LUTs */
>  #define FD1_LUT_DIF_ADJ			0x1000
> @@ -2365,6 +2367,12 @@ static int fdp1_probe(struct platform_device *pdev)
>  	case FD1_IP_H3:
>  		dprintk(fdp1, "FDP1 Version R-Car H3\n");
>  		break;
> +	case FD1_IP_M3N:
> +		dprintk(fdp1, "FDP1 Version R-Car M3N\n");
> +		break;
> +	case FD1_IP_E3:
> +		dprintk(fdp1, "FDP1 Version R-Car E3\n");
> +		break;
>  	default:
>  		dev_err(fdp1->dev, "FDP1 Unidentifiable (0x%08x)\n",
>  				hw_version);

-- 
Regards,

Laurent Pinchart
