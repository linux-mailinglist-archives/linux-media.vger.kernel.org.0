Return-Path: <linux-media+bounces-11152-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C1B8C00AC
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 17:11:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F96D1C225F1
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 15:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E130126F32;
	Wed,  8 May 2024 15:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IsChGjrj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E800685639;
	Wed,  8 May 2024 15:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715181096; cv=none; b=AhKbtPjYw7VzPokwPTcPGAnVwRIcXmSzP7ggYdqJk6ZmikZRZW/MmUymao6CFp4w+B7RXzxiiYDrUylbnJUGnv7OYmpbjG8blLqGquTNW/i+hqhxKNFpQzJReCuId2nwUlMXNUnMQMcEqQd05iFG4lEoP8yQOP8jStkoG2TaXWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715181096; c=relaxed/simple;
	bh=L1DLWHvuPyu7zexdapTcMb+vtU8XUKPHrxxeMYCyJgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fUYqDZIyJNKecsp9trq1MvjDlbmB9N1wLJvDFIMtyXlohRSTGLfyICF3BN/5rM/eY7vFlea9fL6DLlUwmTYwkOPAiVarep7k+hpryz3OwrjtjqypFDChI58eusCYwqJoLeRILVtO91Bg5EoSRxIhwrek9YTM/qc6zQ3dl0CmzAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IsChGjrj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B5712FD6;
	Wed,  8 May 2024 17:11:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715181090;
	bh=L1DLWHvuPyu7zexdapTcMb+vtU8XUKPHrxxeMYCyJgQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IsChGjrjUwRqYdCT81KCqbvvuiqqnsLCh2bfSQ1T2vbvXuJqbP7GhhmflprMyLigj
	 50rG3Rj9GbQSqH0019jJSMGNZlWImoGZ+HCWmOW5Ce4tuXcev+rNal1f5cliRRXlr2
	 xt6LOVzdFhH/yIV6ne6CH4dyRFQnYR5G9YdxS5sg=
Date: Wed, 8 May 2024 18:11:24 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: bcm2835-unicam: Fix a NULL vs IS_ERR() check
Message-ID: <20240508151124.GB19625@pendragon.ideasonboard.com>
References: <fbbe7862-2820-44eb-81cb-7f33b99cca35@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fbbe7862-2820-44eb-81cb-7f33b99cca35@moroto.mountain>

Hi Dan,

Thank you for the patch.

On Wed, May 08, 2024 at 03:31:00PM +0300, Dan Carpenter wrote:
> The media_pad_remote_pad_unique() function returns error pointers, not
> NULL.  Update the check accordingly.
> 
> Fixes: 392cd78d495f ("media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/broadcom/bcm2835-unicam.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> index 3c7878d8d79b..ad55fc930e5b 100644
> --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> @@ -2433,9 +2433,9 @@ static int unicam_async_bound(struct v4l2_async_notifier *notifier,
>  		return ret;
>  
>  	source = media_pad_remote_pad_unique(sink);
> -	if (!source) {
> +	if (IS_ERR(source)) {
>  		dev_err(unicam->dev, "No connected sensor pad\n");
> -		return -ENOTCONN;
> +		return PTR_ERR(source);
>  	}
>  
>  	unicam->sensor.subdev = subdev;

-- 
Regards,

Laurent Pinchart

