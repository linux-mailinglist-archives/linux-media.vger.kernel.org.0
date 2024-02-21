Return-Path: <linux-media+bounces-5558-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EB285D78C
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 13:01:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2ED6A1C21D26
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 12:01:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B90D4CE0E;
	Wed, 21 Feb 2024 12:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rm+tW581"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980924D9E5
	for <linux-media@vger.kernel.org>; Wed, 21 Feb 2024 12:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708516887; cv=none; b=V953JU2TbNJDPquJCigFiNqUI8A83rE3dlfzb08h8wNuFZmJIJnLV8+l2tsOA64gUVrmRmEGyPgSenIdZfRlTxtqMH3eAU8fsjTpmD0Z92HFPc0ugfzU5Ahj3zxfA9u7Ra3nt7ADu++lGN0EU5ID664FwAFCqKOte15j8qz/QlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708516887; c=relaxed/simple;
	bh=jWEdD1Yxrcplsj+QJxS9Lg/ljypvxKWYZBQbQoFqdSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NrIoSvM/eOJt7bUnujGxFZTEQMNfO7mKqpHMOPoCYhOSBAM1Q3EsMqN2PJ+AfHHIGBSiuNXHTmT1g+FnsZZi8D43QmndFmgap6UJ2OY1qXhC28ioqhDh3M7Xy01s/FNH1A4DbqbAkYXF0KKGxl70rPBTlz6rrJR+NYMkt+gH5dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rm+tW581; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 923BA2B3;
	Wed, 21 Feb 2024 13:01:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1708516875;
	bh=jWEdD1Yxrcplsj+QJxS9Lg/ljypvxKWYZBQbQoFqdSw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rm+tW581ON2BLoEcN6mbPFB+7xb+T+V4CbDAgCHq8vA+MyP9SQob/6oXc8OsRqzQ6
	 9BnSzZGbRb/puOuhYJiXEpGFI9iFO0mq1w6Fss7G51K9uL0WLzscP9ioDYOOzXeHkO
	 xPF3j2ukyFMSa/g8igQDwmD+fznPxj7pqHJiLHbQ=
Date: Wed, 21 Feb 2024 14:01:26 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] media: i2c: imx290: Fix IMX920 typo
Message-ID: <20240221120126.GC31348@pendragon.ideasonboard.com>
References: <20240221071550.2769570-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240221071550.2769570-1-alexander.stein@ew.tq-group.com>

Hi Alexander,

Thank you for the patch.

On Wed, Feb 21, 2024 at 08:15:50AM +0100, Alexander Stein wrote:
> Replace IMX920 by IMX290.
> 
> Fixes: b4ab57b07c5b9 ("media: i2c: imx290: Add crop selection targets support")
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/imx290.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 89fcebe178395..d75e36018cdc0 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -150,10 +150,10 @@
>  
>  #define IMX290_PIXEL_ARRAY_WIDTH			1945
>  #define IMX290_PIXEL_ARRAY_HEIGHT			1097
> -#define IMX920_PIXEL_ARRAY_MARGIN_LEFT			12
> -#define IMX920_PIXEL_ARRAY_MARGIN_RIGHT			13
> -#define IMX920_PIXEL_ARRAY_MARGIN_TOP			8
> -#define IMX920_PIXEL_ARRAY_MARGIN_BOTTOM		9
> +#define IMX290_PIXEL_ARRAY_MARGIN_LEFT			12
> +#define IMX290_PIXEL_ARRAY_MARGIN_RIGHT			13
> +#define IMX290_PIXEL_ARRAY_MARGIN_TOP			8
> +#define IMX290_PIXEL_ARRAY_MARGIN_BOTTOM		9
>  #define IMX290_PIXEL_ARRAY_RECORDING_WIDTH		1920
>  #define IMX290_PIXEL_ARRAY_RECORDING_HEIGHT		1080
>  
> @@ -1161,10 +1161,10 @@ static int imx290_get_selection(struct v4l2_subdev *sd,
>  		 * The sensor moves the readout by 1 pixel based on flips to
>  		 * keep the Bayer order the same.
>  		 */
> -		sel->r.top = IMX920_PIXEL_ARRAY_MARGIN_TOP
> +		sel->r.top = IMX290_PIXEL_ARRAY_MARGIN_TOP
>  			   + (IMX290_PIXEL_ARRAY_RECORDING_HEIGHT - format->height) / 2
>  			   + imx290->vflip->val;
> -		sel->r.left = IMX920_PIXEL_ARRAY_MARGIN_LEFT
> +		sel->r.left = IMX290_PIXEL_ARRAY_MARGIN_LEFT
>  			    + (IMX290_PIXEL_ARRAY_RECORDING_WIDTH - format->width) / 2
>  			    + imx290->hflip->val;
>  		sel->r.width = format->width;
> @@ -1183,8 +1183,8 @@ static int imx290_get_selection(struct v4l2_subdev *sd,
>  		return 0;
>  
>  	case V4L2_SEL_TGT_CROP_DEFAULT:
> -		sel->r.top = IMX920_PIXEL_ARRAY_MARGIN_TOP;
> -		sel->r.left = IMX920_PIXEL_ARRAY_MARGIN_LEFT;
> +		sel->r.top = IMX290_PIXEL_ARRAY_MARGIN_TOP;
> +		sel->r.left = IMX290_PIXEL_ARRAY_MARGIN_LEFT;
>  		sel->r.width = IMX290_PIXEL_ARRAY_RECORDING_WIDTH;
>  		sel->r.height = IMX290_PIXEL_ARRAY_RECORDING_HEIGHT;
>  

-- 
Regards,

Laurent Pinchart

