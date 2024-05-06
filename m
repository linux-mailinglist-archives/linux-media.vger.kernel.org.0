Return-Path: <linux-media+bounces-10855-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E57E8BCCAE
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 13:15:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 81C73B223E9
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 11:15:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A0BD142E87;
	Mon,  6 May 2024 11:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mnChQVwO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE3A142E79
	for <linux-media@vger.kernel.org>; Mon,  6 May 2024 11:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714994142; cv=none; b=PJKzXfMye3yLtxR9Aw9J4WeDtSS+1WytJe0Q7hb63b8WzBC+dZkxpmGk6GpwkN81u5QgCL78nPN954ffKEXk7NqcQfvLTHnMFHvxK3P7FJatZp8sBHJ0VMXDsWa/BC5kVsMR8S+qKgNh0gX0/uXSF3x0FHlsypubsgvwww5oD00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714994142; c=relaxed/simple;
	bh=W5U9CiKhRASg0lX3GGlzILtSAbju+Y3rVFzgHm7cgno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oZJn1SNwPyCdTVmWDlP9itYm62g1D+HpYgODgqMxb94E1cAp0EvqlL9SIcq5rXyiNhk4oY9kfFV2pUZkt9XygCzqD6dBP2LNgx1oOpMTP90ue8PCS4TdbSQccJIFAoqbPhyYcoR8BlfIm6OGp+h9lUwJQIAwJHEUbsMNf7vodBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mnChQVwO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 57132899;
	Mon,  6 May 2024 13:15:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714994137;
	bh=W5U9CiKhRASg0lX3GGlzILtSAbju+Y3rVFzgHm7cgno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mnChQVwOX+pT9A7/XjfM0D4iMY2TG7pFpxwydLITB2ZjZEpXxT0hI2OEy6JWhVwKu
	 7rqccdymp7xNXgDsTNVlT+fWqUNUjQDlrOWoZNYnFA47Uw1ByHQFXLMQVR5v4465d/
	 xOCHDM9XK+FmMbldmqu1tRE28+dNNzv6LWctvaGY=
Date: Mon, 6 May 2024 14:15:30 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Naushir Patuck <naush@raspberrypi.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] media: bcm2835-unicam: Convert to platform remove
 callback returning void
Message-ID: <20240506111530.GB21429@pendragon.ideasonboard.com>
References: <20240506100917.1544174-2-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240506100917.1544174-2-u.kleine-koenig@pengutronix.de>

Hi Uwe,

Thank you for the patch.

On Mon, May 06, 2024 at 12:09:16PM +0200, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> 
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Hello,
> 
> this driver appeared in next-20240506. Given that I want to change struct
> platform_driver::remove after the merge-window for v6.10 closes, it would be
> great if this patch went in together with commit creating the drivers.

Hans, could you pick this up ?

>  drivers/media/platform/broadcom/bcm2835-unicam.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> index 3c7878d8d79b..b11bcec5b225 100644
> --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> @@ -2704,7 +2704,7 @@ static int unicam_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static int unicam_remove(struct platform_device *pdev)
> +static void unicam_remove(struct platform_device *pdev)
>  {
>  	struct unicam_device *unicam = platform_get_drvdata(pdev);
>  
> @@ -2718,8 +2718,6 @@ static int unicam_remove(struct platform_device *pdev)
>  	unicam_put(unicam);
>  
>  	pm_runtime_disable(&pdev->dev);
> -
> -	return 0;
>  }
>  
>  static const struct of_device_id unicam_of_match[] = {
> @@ -2730,7 +2728,7 @@ MODULE_DEVICE_TABLE(of, unicam_of_match);
>  
>  static struct platform_driver unicam_driver = {
>  	.probe		= unicam_probe,
> -	.remove		= unicam_remove,
> +	.remove_new	= unicam_remove,
>  	.driver = {
>  		.name	= UNICAM_MODULE_NAME,
>  		.pm	= pm_ptr(&unicam_pm_ops),

-- 
Regards,

Laurent Pinchart

