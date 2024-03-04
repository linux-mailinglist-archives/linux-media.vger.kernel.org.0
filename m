Return-Path: <linux-media+bounces-6338-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF3586FC5D
	for <lists+linux-media@lfdr.de>; Mon,  4 Mar 2024 09:52:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9F7C9B23188
	for <lists+linux-media@lfdr.de>; Mon,  4 Mar 2024 08:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED7021947D;
	Mon,  4 Mar 2024 08:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="s7yQCVi+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEB319474
	for <linux-media@vger.kernel.org>; Mon,  4 Mar 2024 08:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709541942; cv=none; b=eWuiLbXWdbGiUtNsyp404noJIN0KSa6ltVJd6sNr0wLLJHlAU/j54rEF9Pk/aNZ94DJdqvXNfrqH7cNb0IlaU3QmdBo6T+jyzY0rf8QDEBoYcdEvDwodoxhGv4Q1LEHftpvHeS3prHo9a4tgll9NLQWkpClimhPFXAJuKiiAu0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709541942; c=relaxed/simple;
	bh=bQkbg/ZBSMiL8w8unRy7jzHvF6FtEFvpBTj/9sVKo7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KUerkpXbpot6oEOBAUyKiA3ozCa652FS5Y+CuT4H145YB8anr/5HIEWvS2gKzt4bJtIYhEUU3iMiMZgOpR9Ons8rI8wnciLd+cJSKyfSm8PFrC8BKGxn5Bw26hXrOdzrDkNK192ufqhxnxnfsNs65s+9/O6Byj8h9U13kn3iQTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=s7yQCVi+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 035238D0;
	Mon,  4 Mar 2024 09:45:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1709541922;
	bh=bQkbg/ZBSMiL8w8unRy7jzHvF6FtEFvpBTj/9sVKo7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s7yQCVi+nVq39uE097kq/aKEUCLqgQnACl0g9uR/9GHXviZru16EWqpzqbNz2qcWT
	 l4C8kQozW2YTsGAXxmpYLjAZpRbS/Y2HfrB7cMUFVgxccPVTtxoMbnTlDVI5VzAVhE
	 PiIhEdqIyHyszTvlLWvie6evKHgtLs6HPZ7YT+C0=
Date: Mon, 4 Mar 2024 09:45:35 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, David Plowman <david.plowman@raspberrypi.com>, 
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Naushir Patuck <naush@raspberrypi.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	kernel-list@raspberrypi.com, linux-rpi-kernel@lists.infradead.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH v6 01/15] media: i2c: imx219: Inline
 imx219_update_pad_format() in its caller
Message-ID: <5jk2nr3cvh7vmi6ilupzff6faeigxe3fiyaszccc7aw7heqa3r@ligqodtcu4zf>
References: <20240301213231.10340-1-laurent.pinchart@ideasonboard.com>
 <20240301213231.10340-2-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240301213231.10340-2-laurent.pinchart@ideasonboard.com>

Hi Laurent

On Fri, Mar 01, 2024 at 11:32:16PM +0200, Laurent Pinchart wrote:
> The imx219_update_pad_format() is short and called from a single place,
> in imx219_set_pad_format(). Inline the code in the caller to keep all
> format adjustements grouped in a single place and improve readability.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

> ---
>  drivers/media/i2c/imx219.c | 28 ++++++++++++----------------
>  1 file changed, 12 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index e17ef2e9d9d0..3878da50860e 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -758,21 +758,6 @@ static int imx219_set_stream(struct v4l2_subdev *sd, int enable)
>  	return ret;
>  }
>
> -static void imx219_update_pad_format(struct imx219 *imx219,
> -				     const struct imx219_mode *mode,
> -				     struct v4l2_mbus_framefmt *fmt, u32 code)
> -{
> -	/* Bayer order varies with flips */
> -	fmt->code = imx219_get_format_code(imx219, code);
> -	fmt->width = mode->width;
> -	fmt->height = mode->height;
> -	fmt->field = V4L2_FIELD_NONE;
> -	fmt->colorspace = V4L2_COLORSPACE_RAW;
> -	fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
> -	fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
> -	fmt->xfer_func = V4L2_XFER_FUNC_NONE;
> -}
> -
>  static int imx219_enum_mbus_code(struct v4l2_subdev *sd,
>  				 struct v4l2_subdev_state *state,
>  				 struct v4l2_subdev_mbus_code_enum *code)
> @@ -819,12 +804,23 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>  	struct v4l2_rect *crop;
>  	unsigned int bin_h, bin_v;
>
> +	/*
> +	 * Adjust the requested format to match the closest mode. The Bayer
> +	 * order varies with flips.
> +	 */
>  	mode = v4l2_find_nearest_size(supported_modes,
>  				      ARRAY_SIZE(supported_modes),
>  				      width, height,
>  				      fmt->format.width, fmt->format.height);
>
> -	imx219_update_pad_format(imx219, mode, &fmt->format, fmt->format.code);
> +	fmt->format.code = imx219_get_format_code(imx219, fmt->format.code);
> +	fmt->format.width = mode->width;
> +	fmt->format.height = mode->height;
> +	fmt->format.field = V4L2_FIELD_NONE;
> +	fmt->format.colorspace = V4L2_COLORSPACE_RAW;
> +	fmt->format.ycbcr_enc = V4L2_YCBCR_ENC_601;
> +	fmt->format.quantization = V4L2_QUANTIZATION_FULL_RANGE;
> +	fmt->format.xfer_func = V4L2_XFER_FUNC_NONE;
>
>  	format = v4l2_subdev_state_get_format(state, 0);
>  	*format = fmt->format;
> --
> Regards,
>
> Laurent Pinchart
>
>

