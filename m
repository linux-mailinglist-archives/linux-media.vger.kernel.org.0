Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE763D6AF9
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2019 22:58:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731804AbfJNU66 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Oct 2019 16:58:58 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48422 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730335AbfJNU66 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Oct 2019 16:58:58 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DF3F6324;
        Mon, 14 Oct 2019 22:58:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1571086737;
        bh=HYfTXbHtaZH/kPTwzFuZ+Jr4Cwa+eWxh5vg7pwrr024=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UbpnkaJe/Gl+uJUlzJO57UlG2g9aBfHUvLAvIE6ncWVSzR1Lc/l/knu6HCWm0zXSM
         Jx+Nm1hf2t3ctyin6+YWnpDI4aKYZbhj/aDXnjaN8//pFI07ILLzDOKh77Gwqu5fxM
         WaHDuZMAn2DIBbSvA4HYW0+Rfegt1fqFA7G6+x7s=
Date:   Mon, 14 Oct 2019 23:58:54 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] rcar-vin: Do not enumerate unsupported pixel formats
Message-ID: <20191014205854.GD23442@pendragon.ideasonboard.com>
References: <20191014000750.2863254-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191014000750.2863254-1-niklas.soderlund+renesas@ragnatech.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

Thank you for the patch.

On Mon, Oct 14, 2019 at 02:07:50AM +0200, Niklas Söderlund wrote:
> If a pixel format is not supported by the hardware NULL is returned by
> rvin_format_from_pixel() for that fourcc. Verify that the pixel format
> is supported using this or skip it when enumerating.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/platform/rcar-vin/rcar-v4l2.c | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> index 9a9b89c0dc0b3be4..13b7cd5d2e40415a 100644
> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> @@ -296,12 +296,22 @@ static int rvin_g_fmt_vid_cap(struct file *file, void *priv,
>  static int rvin_enum_fmt_vid_cap(struct file *file, void *priv,
>  				 struct v4l2_fmtdesc *f)
>  {
> -	if (f->index >= ARRAY_SIZE(rvin_formats))
> -		return -EINVAL;
> -
> -	f->pixelformat = rvin_formats[f->index].fourcc;
> +	struct rvin_dev *vin = video_drvdata(file);
> +	unsigned int i;
> +	int matched;
> +
> +	matched = -1;
> +	for (i = 0; i < ARRAY_SIZE(rvin_formats); i++) {
> +		if (rvin_format_from_pixel(vin, rvin_formats[i].fourcc))
> +			matched++;
> +
> +		if (matched == f->index) {
> +			f->pixelformat = rvin_formats[i].fourcc;
> +			return 0;
> +		}
> +	}

I wonder if the following would be more readable ?

	struct rvin_dev *vin = video_drvdata(file);
	unsigned int index = f->index;
	unsigned int i;

	for (i = 0; i < ARRAY_SIZE(rvin_formats); i++) {
		if (rvin_format_from_pixel(vin, rvin_formats[i].fourcc))
			continue;

		if (index-- == 0) {
			f->pixelformat = rvin_formats[i].fourcc;
			return 0;
		}
	}
 
	return -EINVAL;

In any case,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> -	return 0;
> +	return -EINVAL;
>  }
>  
>  static int rvin_g_selection(struct file *file, void *fh,

-- 
Regards,

Laurent Pinchart
