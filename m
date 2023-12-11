Return-Path: <linux-media+bounces-2145-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE3180D526
	for <lists+linux-media@lfdr.de>; Mon, 11 Dec 2023 19:19:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A68C1C21182
	for <lists+linux-media@lfdr.de>; Mon, 11 Dec 2023 18:19:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F91C51017;
	Mon, 11 Dec 2023 18:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sSNxKmzx"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E32D395;
	Mon, 11 Dec 2023 10:19:29 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 274C0922;
	Mon, 11 Dec 2023 19:18:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1702318724;
	bh=EIg4EO4Pq5viQln2mk2Z+mPdeO40bI0I0QIxtK3AB8Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sSNxKmzxVGwUHs/fJsZ2OsIyU/O1sYytP/uWYGE1ItV1/l+JIi+baiBxLbNDo6WAV
	 aU2iyIrJNjNVcGIVL/X3g3UFqKHFkh56HLbdvHBbfT3mnneTF3btn6DGc/JYA4vLXy
	 yqrrSsovOvwK6aLwDR/Zz+yxu0F1va4ZTyW+7LRc=
Date: Mon, 11 Dec 2023 20:19:35 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mikhail Rudenko <mike.rudenko@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 08/19] media: i2c: ov4689: Enable runtime PM before
 registering sub-device
Message-ID: <20231211181935.GG27535@pendragon.ideasonboard.com>
References: <20231211175023.1680247-1-mike.rudenko@gmail.com>
 <20231211175023.1680247-9-mike.rudenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231211175023.1680247-9-mike.rudenko@gmail.com>

Hi Mikhail,

Thank you for the patch.

On Mon, Dec 11, 2023 at 08:50:11PM +0300, Mikhail Rudenko wrote:
> As the sensor may be accessible right after its async sub-device is
> registered, enable runtime PM before doing so.

While at it, could you also switch to runtime PM autosuspend, possibly
in a separate patch ? See for instance the imx290 driver.

> Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
> ---
>  drivers/media/i2c/ov4689.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov4689.c b/drivers/media/i2c/ov4689.c
> index 2eef64cd0070..ba33b0ced532 100644
> --- a/drivers/media/i2c/ov4689.c
> +++ b/drivers/media/i2c/ov4689.c
> @@ -874,16 +874,16 @@ static int ov4689_probe(struct i2c_client *client)
>  		goto err_clean_entity;
>  	}
>  
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +	pm_runtime_idle(dev);
> +
>  	ret = v4l2_async_register_subdev_sensor(sd);
>  	if (ret) {
>  		dev_err(dev, "v4l2 async register subdev failed\n");
>  		goto err_clean_subdev;

Don't you need to disable runtime PM in the error path ?

>  	}
>  
> -	pm_runtime_set_active(dev);
> -	pm_runtime_enable(dev);
> -	pm_runtime_idle(dev);
> -
>  	return 0;
>  
>  err_clean_subdev:

-- 
Regards,

Laurent Pinchart

