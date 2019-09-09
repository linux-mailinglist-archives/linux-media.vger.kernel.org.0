Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 048B0AE156
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2019 01:04:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730151AbfIIXEu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Sep 2019 19:04:50 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:36546 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728358AbfIIXEu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Sep 2019 19:04:50 -0400
Received: from pendragon.ideasonboard.com (unknown [88.214.160.167])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 874DE4FE;
        Tue, 10 Sep 2019 01:04:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1568070288;
        bh=aMko9867ugF01tWgJcEmGEH7Q3llzWNzsN0Yl9FpdFE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ODIn6NlRsjVuaa/DIKVRkIbW5kNKoCcxV9EJksXmFuKb/tA17tNVumYq4jZaue1Qn
         QnhjIRpGIGhtD2US5QSipZiQnXPtx27/oYWny6wmyeQtBdNEo0EG1KxE8k0hPlwwse
         bRslXB3gJSnM1HldaLq8FJasYHNFWLWe/dG1Owt0=
Date:   Tue, 10 Sep 2019 02:04:41 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] rcar-vin: Do not enumerate unsupported pixel formats
Message-ID: <20190909230441.GE15652@pendragon.ideasonboard.com>
References: <20190906143500.21882-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190906143500.21882-1-niklas.soderlund+renesas@ragnatech.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

Thank you for the patch.

On Fri, Sep 06, 2019 at 04:35:00PM +0200, Niklas Söderlund wrote:
> If a pixel format is not supported by the hardware NULL is returned by
> rvin_format_from_pixel() for that fourcc. Verify that the pixel format
> is supported using this or skip it when enumerating.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/platform/rcar-vin/rcar-v4l2.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> index cbc1c07f0a9631a4..ba08f6c49956e899 100644
> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> @@ -302,10 +302,20 @@ static int rvin_g_fmt_vid_cap(struct file *file, void *priv,
>  static int rvin_enum_fmt_vid_cap(struct file *file, void *priv,
>  				 struct v4l2_fmtdesc *f)
>  {
> +	struct rvin_dev *vin = video_drvdata(file);
> +	unsigned int i, skip = 0;

This doesn't seem right. Let's consider, as initial conditions,

rvin_formats = { RGB, unsupported, unsupported, YUV }
ARRAY_SIZE(rvin_formats) == 4
f->index = 1

You want to return YUV.

> +
>  	if (f->index >= ARRAY_SIZE(rvin_formats))
>  		return -EINVAL;

This check will pass.

> -	f->pixelformat = rvin_formats[f->index].fourcc;
> +	for (i = 0; i <= f->index; i++)
> +		if (!rvin_format_from_pixel(vin, rvin_formats[i].fourcc))
> +			skip++;

This loop will have two iterations, i == 0 and i == 1. The second
iteration will increase skip, so skip == 1.

> +
> +	if (f->index + skip >= ARRAY_SIZE(rvin_formats))
> +		return -EINVAL;

This check will pass.

> +
> +	f->pixelformat = rvin_formats[f->index + skip].fourcc;

This will return unsupported format.

>  
>  	return 0;
>  }

-- 
Regards,

Laurent Pinchart
