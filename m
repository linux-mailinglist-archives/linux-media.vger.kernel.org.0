Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 215DD205FD
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2019 13:59:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728261AbfEPLpl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 May 2019 07:45:41 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34666 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727832AbfEPLpk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 May 2019 07:45:40 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2DA152FD;
        Thu, 16 May 2019 13:45:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1558007138;
        bh=FaWGwPPxKSmmd3IsBWBU6zDpGzQJKlRLkQ6P1zzv1T4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eoJqV1iVQusmigX4QukIKgM3aGt9TSVaxaofN3czHeRKRFEyIfDK8BMdbhcT6QxZ6
         5bEdYjr7+JHLP83gFhUEk+mX87jrKxltQVCyHLnV+yVwiMXP0x8RRkSp7WCHOqIsTX
         eGk7ZjqAgQe5F1ooQIbZfwMVy+9W/VqmYo5GhH8c=
Date:   Thu, 16 May 2019 14:45:22 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Ulrich Hecht <uli@fpond.eu>, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: Re: [PATCH v2 7/8] rcar-vin: Fold rvin_initialize_device() into
 rvin_open()
Message-ID: <20190516114522.GF14820@pendragon.ideasonboard.com>
References: <20190516011417.10590-1-niklas.soderlund+renesas@ragnatech.se>
 <20190516011417.10590-8-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190516011417.10590-8-niklas.soderlund+renesas@ragnatech.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

Thank you for the patch.

On Thu, May 16, 2019 at 03:14:16AM +0200, Niklas Söderlund wrote:
> The function no longer serve a purpose as most tasks it performed have
> been refactored, fold what remains of it into the only caller.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
> ---
>  drivers/media/platform/rcar-vin/rcar-v4l2.c | 21 ++++-----------------
>  1 file changed, 4 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> index 7c8ba4b310706ceb..169639416121f204 100644
> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> @@ -762,20 +762,6 @@ static int rvin_power_parallel(struct rvin_dev *vin, bool on)
>  	return 0;
>  }
>  
> -static int rvin_initialize_device(struct file *file)
> -{
> -	struct rvin_dev *vin = video_drvdata(file);
> -	int ret;
> -
> -	ret = rvin_power_parallel(vin, true);
> -	if (ret < 0)
> -		return ret;
> -
> -	v4l2_ctrl_handler_setup(&vin->ctrl_handler);
> -
> -	return 0;
> -}
> -
>  static int rvin_open(struct file *file)
>  {
>  	struct rvin_dev *vin = video_drvdata(file);
> @@ -796,10 +782,11 @@ static int rvin_open(struct file *file)
>  		goto err_pm;
>  
>  	if (v4l2_fh_is_singular_file(file)) {
> -		if (rvin_initialize_device(file)) {
> -			ret = -ENODEV;
> +		ret = rvin_power_parallel(vin, true);
> +		if (ret < 0)
>  			goto err_open;
> -		}
> +
> +		v4l2_ctrl_handler_setup(&vin->ctrl_handler);

I think you should handle errors here.

>  	}
>  
>  	mutex_unlock(&vin->lock);

-- 
Regards,

Laurent Pinchart
