Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D68E8342E4C
	for <lists+linux-media@lfdr.de>; Sat, 20 Mar 2021 17:19:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229821AbhCTQSa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 20 Mar 2021 12:18:30 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:47100 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229879AbhCTQS1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 20 Mar 2021 12:18:27 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 35EF18D3;
        Sat, 20 Mar 2021 17:18:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1616257106;
        bh=9jcusMGa/y+S8wJ82CkMxUncDCQ1MlgmDfai7+e/V9g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=d0SVlBQc7WxVJ9aP2eXyGwryzJmD70GZ4yQ40oB0pQly1IV9FGz5Pf49Ok9rH6a6+
         3U5jhIkcT8vfYIHKUDu9zJELsHiLTeTTGLHoQ6qT/T+ZaDz3tmYb1GOm1Ncr1Ov5BG
         AnaC0yjadPlK4mk0Ggt9OBCAqjkcbvmclZ23zMYk=
Date:   Sat, 20 Mar 2021 18:17:46 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 16/19] media: i2c: rdacm20: Replace goto with a loop
Message-ID: <YFYgKgBIJbVP9KhM@pendragon.ideasonboard.com>
References: <20210319164148.199192-1-jacopo+renesas@jmondi.org>
 <20210319164148.199192-17-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210319164148.199192-17-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Fri, Mar 19, 2021 at 05:41:45PM +0100, Jacopo Mondi wrote:
> During the camera module initialization the image sensor PID is read to
> verify it can correctly be identified. The current implementation is
> rather confused and uses a loop implemented with a label and a goto.
> 
> Replace it with a more compact for() loop.
> 
> No functional changes intended.
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/i2c/rdacm20.c | 29 +++++++++++++----------------
>  1 file changed, 13 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
> index 7bdcfafa6c10..760705dd2918 100644
> --- a/drivers/media/i2c/rdacm20.c
> +++ b/drivers/media/i2c/rdacm20.c
> @@ -59,6 +59,8 @@
>   */
>  #define OV10635_PIXEL_RATE		(44000000)
>  
> +#define OV10635_PID_TIMEOUT		3
> +
>  static const struct ov10635_reg {
>  	u16	reg;
>  	u8	val;
> @@ -438,7 +440,7 @@ static int rdacm20_get_fmt(struct v4l2_subdev *sd,
>  static int rdacm20_init(struct v4l2_subdev *sd, unsigned int val)
>  {
>  	struct rdacm20_device *dev = sd_to_rdacm20(sd);
> -	unsigned int retry = 3;
> +	unsigned int i;
>  	int ret;
>  
>  	/*
> @@ -478,23 +480,18 @@ static int rdacm20_init(struct v4l2_subdev *sd, unsigned int val)
>  		return ret;
>  	usleep_range(10000, 15000);
>  
> -again:
> -	ret = ov10635_read16(dev, OV10635_PID);
> -	if (ret < 0) {
> -		if (retry--)
> -			goto again;
> +	for (i = 0; i < OV10635_PID_TIMEOUT; ++i) {

As commented on a previous patch, this macro is used here only, I would
have made it local.

> +		ret = ov10635_read16(dev, OV10635_PID);
> +		if (ret == OV10635_VERSION)
> +			break;
> +		else if (ret >= 0)
> +			/* Sometimes we get a successful read but a wrong ID. */
> +			dev_dbg(dev->dev, "OV10635 ID mismatch (%d)\n", ret);
>  
> -		dev_err(dev->dev, "OV10635 ID read failed (%d)\n",
> -			ret);
> -		return -ENXIO;
> +		usleep_range(1000, 2000);
>  	}
> -
> -	if (ret != OV10635_VERSION) {
> -		if (retry--)
> -			goto again;
> -
> -		dev_err(dev->dev, "OV10635 ID mismatch (0x%04x)\n",
> -			ret);

Blank line ?

> +	if (i == OV10635_PID_TIMEOUT) {
> +		dev_err(dev->dev, "OV10635 ID read failed (%d)\n", ret);
>  		return -ENXIO;
>  	}
>  

-- 
Regards,

Laurent Pinchart
