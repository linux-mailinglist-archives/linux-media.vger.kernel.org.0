Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2251205F0
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2019 13:59:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728218AbfEPLo5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 May 2019 07:44:57 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34590 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728331AbfEPLo4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 May 2019 07:44:56 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 911852FD;
        Thu, 16 May 2019 13:44:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1558007094;
        bh=o6iguF7wwwkGY/MFR/8r18nb9hBSGaxdCg38DwoAzdw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cTOFJroMQLBjiJRMJZ2gzietK3Ghv7uEEQv3s93uH1zDbnaa5mWzn/XFTkzjXAy9a
         dzQ3PdBYABxYE1kruOI87Neqd3Irv0F+hBvu/aSZOJhhH7Q48+qBK4S2rvBfWOhp68
         l35WtzCZUSiQ5Hk83RAtob78vGSS3e9t3U6ZOJoA=
Date:   Thu, 16 May 2019 14:44:38 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Ulrich Hecht <uli@fpond.eu>, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 6/8] rcar-vin: Merge helpers dealing with powering the
 parallel subdevice
Message-ID: <20190516114438.GE14820@pendragon.ideasonboard.com>
References: <20190516011417.10590-1-niklas.soderlund+renesas@ragnatech.se>
 <20190516011417.10590-7-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190516011417.10590-7-niklas.soderlund+renesas@ragnatech.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

Thank you for the patch.

On Thu, May 16, 2019 at 03:14:15AM +0200, Niklas Söderlund wrote:
> The two power helpers are now only dealing with the parallel subdevice,
> merge them into a single rvin_power_parallel() helper to reduce code
> duplication.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/platform/rcar-vin/rcar-v4l2.c | 20 +++++---------------
>  1 file changed, 5 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> index 5a9658b7d848fc86..7c8ba4b310706ceb 100644
> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> @@ -749,23 +749,13 @@ static const struct v4l2_ioctl_ops rvin_mc_ioctl_ops = {
>   * File Operations
>   */
>  
> -static int rvin_power_on(struct rvin_dev *vin)
> +static int rvin_power_parallel(struct rvin_dev *vin, bool on)
>  {
> -	int ret;
>  	struct v4l2_subdev *sd = vin_to_source(vin);
> -
> -	ret = v4l2_subdev_call(sd, core, s_power, 1);
> -	if (ret < 0 && ret != -ENOIOCTLCMD && ret != -ENODEV)
> -		return ret;
> -	return 0;
> -}
> -
> -static int rvin_power_off(struct rvin_dev *vin)
> -{
> +	int power = on ? 1 : 0;

You could use on directly instead of going through a separate variable.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	int ret;
> -	struct v4l2_subdev *sd = vin_to_source(vin);
>  
> -	ret = v4l2_subdev_call(sd, core, s_power, 0);
> +	ret = v4l2_subdev_call(sd, core, s_power, power);
>  	if (ret < 0 && ret != -ENOIOCTLCMD && ret != -ENODEV)
>  		return ret;
>  
> @@ -777,7 +767,7 @@ static int rvin_initialize_device(struct file *file)
>  	struct rvin_dev *vin = video_drvdata(file);
>  	int ret;
>  
> -	ret = rvin_power_on(vin);
> +	ret = rvin_power_parallel(vin, true);
>  	if (ret < 0)
>  		return ret;
>  
> @@ -844,7 +834,7 @@ static int rvin_release(struct file *file)
>  	 * Then de-initialize hw module.
>  	 */
>  	if (fh_singular)
> -		rvin_power_off(vin);
> +		rvin_power_parallel(vin, false);
>  
>  	pm_runtime_put(vin->dev);
>  

-- 
Regards,

Laurent Pinchart
