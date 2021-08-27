Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 635743FA107
	for <lists+linux-media@lfdr.de>; Fri, 27 Aug 2021 23:13:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231913AbhH0VON (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Aug 2021 17:14:13 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39120 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231906AbhH0VON (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Aug 2021 17:14:13 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3BED852F;
        Fri, 27 Aug 2021 23:13:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1630098802;
        bh=5zAutBEW0KMlJJQNsp4Ar8hIdr73hoAsRZ4jsG6/Gig=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JrXEJGWTUxESfpXhnka5WAjr/XIS9L4HRXQk8efrmHJ58n+HCCwcXSj32YA+BreHq
         NtmhROqeBFHHd2Nsu/GiHPocXiWornjKZbTB8LfQVWfRV5ZNcWyy9Qy7It4Ipd++jp
         kQCHfHQcBj64Jl+m+SycDYydYT8hqhpNJYWQmRcg=
Date:   Sat, 28 Aug 2021 00:13:08 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Fabio Estevam <festevam@denx.de>
Cc:     hverkuil-cisco@xs4all.nl, mchehab+huawei@kernel.org,
        rmfrfs@gmail.com, linux-media@vger.kernel.org,
        sebastien.szymanski@armadeus.com
Subject: Re: [PATCH 2/2] media: imx: TODO: Remove items that are already
 supported
Message-ID: <YSlVZDYESwbPe2bG@pendragon.ideasonboard.com>
References: <20210826183819.105804-1-festevam@denx.de>
 <20210826183819.105804-2-festevam@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210826183819.105804-2-festevam@denx.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabio,

Thank you for the patch.

On Thu, Aug 26, 2021 at 03:38:19PM -0300, Fabio Estevam wrote:
> Video capture has been successfully tested using an OV5640 parallel
> sensor on a imx6ull-evk board at a 640x480 resolution and UYVY8_2X8
> format.
> 
> Remove the two items that are no longer pending.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/staging/media/imx/TODO | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/TODO b/drivers/staging/media/imx/TODO
> index 2384f4c6b09d..06c94f20ecf8 100644
> --- a/drivers/staging/media/imx/TODO
> +++ b/drivers/staging/media/imx/TODO
> @@ -27,8 +27,3 @@
>  - i.MX7: all of the above, since it uses the imx media core
>  
>  - i.MX7: use Frame Interval Monitor
> -
> -- i.MX7: runtime testing with parallel sensor, links setup and streaming
> -
> -- i.MX7: runtime testing with different formats, for the time only 10-bit bayer
> -  is tested

-- 
Regards,

Laurent Pinchart
