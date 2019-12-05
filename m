Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72A63113D5F
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2019 09:52:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728954AbfLEIwm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Dec 2019 03:52:42 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:58492 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726096AbfLEIwm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Dec 2019 03:52:42 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 981D22E5;
        Thu,  5 Dec 2019 09:52:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1575535960;
        bh=kOQut1GZPWKBdrsVzcQrvN1e9m1qxnAH+YmEqKnM0uo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BBiFRF1yFBRmqiuIj/urGQRPwQyuxxblWHRlH/1sdOdDJN7K2pSyoZNTTv3lqG1Yv
         NCUPR+oZwBOsqdeC+jUsWB1eLIufoVvYhlsyZ2Ek0h7NbqrMowsNOnP0kKj3tMw/GK
         0dbC4w55NlNdWlHMGQCuh1mDKL5TuIH7WymvW3vk=
Date:   Thu, 5 Dec 2019 10:52:33 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] rcar-vin: Use correct pixel format when aligning
 format
Message-ID: <20191205085233.GC4734@pendragon.ideasonboard.com>
References: <20191204175759.2976251-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191204175759.2976251-1-niklas.soderlund+renesas@ragnatech.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

Thank you for the patch.

On Wed, Dec 04, 2019 at 06:57:59PM +0100, Niklas Söderlund wrote:
> When aligning the format the pixel format that is being processed shall
> be used to figure out alignment constraints, not the currently active
> pixel format. The alignment might be part of a try operation and shall
> not be effected by the active format. Fix this by looking at the correct
> pixel format.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/rcar-vin/rcar-v4l2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> index 62d308a4ddaee82e..339cb2de111de166 100644
> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> @@ -149,7 +149,7 @@ static void rvin_format_align(struct rvin_dev *vin, struct v4l2_pix_format *pix)
>  	}
>  
>  	/* HW limit width to a multiple of 32 (2^5) for NV12/16 else 2 (2^1) */
> -	switch (vin->format.pixelformat) {
> +	switch (pix->pixelformat) {
>  	case V4L2_PIX_FMT_NV12:
>  	case V4L2_PIX_FMT_NV16:
>  		walign = 5;

-- 
Regards,

Laurent Pinchart
