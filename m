Return-Path: <linux-media+bounces-17391-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 67ED9968E92
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 21:56:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 189251F234D6
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 19:56:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9812E1C62CE;
	Mon,  2 Sep 2024 19:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="u+zolcOV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFE613CFB7;
	Mon,  2 Sep 2024 19:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725306967; cv=none; b=iY+64o7cvVvu2wrcKGeP2CDb9OOw/7hMdDxTSqF0ZA7m/8wISQ7qiwTgtwZPsvi4JYOOTYo11v8+oBjv11c/8gwnvrsEbLBAAOUNw/KUkO25HG5tOfVsZ73GB5grnW+mHJ36BGhqpnd0OkKiFws975WRKlLfgR9t3VYTplhfzcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725306967; c=relaxed/simple;
	bh=uf0FuTJ4W2So082zFZ0kmCS5iXJxKXqyXLx7cEF3pqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AParuC2uc2OsX5rMftxQu/KGoN4z5DeE/s0pl8cBexdYHCgNXOmEaOxBgNFJKO7T3p1E6cM4G8BtvLstJt0FXRWdGVh+1levau/BqR7TiKuNvGwthTEDiLeFO8QjZ6TDCrXVr+xN9nXChkH3S3VmKYE7xIr9VMzKQVyQved7pHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=u+zolcOV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 46E614CE;
	Mon,  2 Sep 2024 21:54:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725306891;
	bh=uf0FuTJ4W2So082zFZ0kmCS5iXJxKXqyXLx7cEF3pqM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u+zolcOVL3xDgmye7rOB2nl3Vb88RpREpVq3HSLfwj+t/PHM6qiNPCQEqerNITX2D
	 40g1oMpd2xWSoiW6H8jQoCj8XtGpfA3LGqv0zT4u+j1s3rf0w/Yyulny4Zt+PfuDg5
	 1DbA7QO6RnsG++rOQBhRqHdGAiijCUkEDWc4MnJ0=
Date: Mon, 2 Sep 2024 22:55:29 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: bbara93@gmail.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Benjamin Bara <benjamin.bara@skidata.com>
Subject: Re: [PATCH v3 1/7] media: i2c: imx290: Define standby mode values
Message-ID: <20240902195529.GP1995@pendragon.ideasonboard.com>
References: <20240902-imx290-avail-v3-0-b32a12799fed@skidata.com>
 <20240902-imx290-avail-v3-1-b32a12799fed@skidata.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240902-imx290-avail-v3-1-b32a12799fed@skidata.com>

Hi Benjamin,

On Mon, Sep 02, 2024 at 05:57:26PM +0200, bbara93@gmail.com wrote:
> From: Benjamin Bara <benjamin.bara@skidata.com>
> 
> The imx290 datasheet states that the IMX290_STANDBY register has two
> values: 0 for operating and 1 for standby. Define and use them.
> 
> Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
> ---
> Changes since v2:
> - new, split out from the previous 1/2
> ---
>  drivers/media/i2c/imx290.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 4150e6e4b9a6..1c97f9650eb4 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -29,6 +29,8 @@
>  #include <media/v4l2-subdev.h>
>  
>  #define IMX290_STANDBY					CCI_REG8(0x3000)
> +#define IMX290_STANDBY_OPERATING			0x00
> +#define IMX290_STANDBY_STANDBY				BIT(0)

The convention, for single-bit fields, is to define a macro to describe
the bit, but not a macro to describe the bit not being set.

>  #define IMX290_REGHOLD					CCI_REG8(0x3001)
>  #define IMX290_XMSTA					CCI_REG8(0x3002)
>  #define IMX290_ADBIT					CCI_REG8(0x3005)
> @@ -1016,7 +1018,8 @@ static int imx290_start_streaming(struct imx290 *imx290,
>  		return ret;
>  	}
>  
> -	cci_write(imx290->regmap, IMX290_STANDBY, 0x00, &ret);
> +	cci_write(imx290->regmap, IMX290_STANDBY, IMX290_STANDBY_OPERATING,
> +		  &ret);

I would thus rather drop this change.

>  
>  	msleep(30);
>  
> @@ -1029,7 +1032,7 @@ static int imx290_stop_streaming(struct imx290 *imx290)
>  {
>  	int ret = 0;
>  
> -	cci_write(imx290->regmap, IMX290_STANDBY, 0x01, &ret);
> +	cci_write(imx290->regmap, IMX290_STANDBY, IMX290_STANDBY_STANDBY, &ret);

And keep this one.

>  
>  	msleep(30);
>  

-- 
Regards,

Laurent Pinchart

