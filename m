Return-Path: <linux-media+bounces-44870-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA78BE7E41
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 11:51:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1A2E7508C46
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 09:49:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E48B2DAFDE;
	Fri, 17 Oct 2025 09:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bgmQ1c1S"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECE42D97A5;
	Fri, 17 Oct 2025 09:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760694584; cv=none; b=OUINYT++9LSEvBZag+pqexs49i3N26/6VLWFJ7esvXnowNR2ieyZuoLSdk4oqrbBrCh2yxywrE2GC7lBAVfmDQ4to+te3gsKCp9te6MDaBppsqLD2wc5cSNQWN+w1vk4s/fbmeT3UxOxuaq5112RL71Ad6WueqRBuPWUhd/EER0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760694584; c=relaxed/simple;
	bh=UvEQt56W1EwcDeJbM6LWXeWQGrwc3HRbNs7Fas6vNrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m7uq9GtzaXZAMbeCP9+fs40hCXo2xqQChhyamAkkw4px+PCHipAiiu5eQ7BhcZ0Z4BzfaREr9xf/VqmU3zswCiFU0GANoBxrzZ0cytPLhtfXfuF+Q0YPyGeIl52WDQomjGT6ljQ365nKM7CRLWEiQNz8MR9J+LIdaGi91zHE55I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bgmQ1c1S; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E8669F52;
	Fri, 17 Oct 2025 11:47:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760694480;
	bh=UvEQt56W1EwcDeJbM6LWXeWQGrwc3HRbNs7Fas6vNrI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bgmQ1c1SC0bINkkYx7dvPfICIFgW055K+3dXuY7CktvG9QxxXI1guaU6Vr8ccSRJD
	 oB9CuX+UvqtMQNLbOzo+7k6LAXBxlQNwqLPR2mCC+vHnuBSPXDcRouvksBs150x0PX
	 QtC2zT0Dl+4TuoZ2GxJy9TWHI7OcwdrBWN9X7chk=
Date: Fri, 17 Oct 2025 11:49:37 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hverkuil@kernel.org>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	=?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>
Subject: Re: [PATCH 2/2] media: i2c: imx219: Simplify imx219_get_binning()
 function
Message-ID: <r3xhpxaxtibzqipzf6hyv3j6mzws3nr76wh24xccaqrm5folye@6f3cpexbd4or>
References: <20251017-imx219-1080p-v1-0-9173d5a47a0c@ideasonboard.com>
 <20251017-imx219-1080p-v1-2-9173d5a47a0c@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251017-imx219-1080p-v1-2-9173d5a47a0c@ideasonboard.com>

On Fri, Oct 17, 2025 at 01:43:50PM +0530, Jai Luthra wrote:
> In imx219_set_pad_format() there is now a constraint to enforce hbin ==
> vbin. So, simplify the logic in imx219_get_binning() function by
> removing dead code that handles the case where hbin != vbin.
>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
>  drivers/media/i2c/imx219.c | 16 +++-------------
>  1 file changed, 3 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 300935b1ef2497050fe2808e4ceedda389a75b50..48efdcd2a8f96b678f9819223e0f9895fb4025ea 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -409,24 +409,14 @@ static void imx219_get_binning(struct v4l2_subdev_state *state, u8 *bin_h,
>  	u32 hbin = crop->width / format->width;
>  	u32 vbin = crop->height / format->height;
>
> -	*bin_h = IMX219_BINNING_NONE;
> -	*bin_v = IMX219_BINNING_NONE;
> -
> -	/*
> -	 * Use analog binning only if both dimensions are binned, as it crops
> -	 * the other dimension.
> -	 */
>  	if (hbin == 2 && vbin == 2) {
>  		*bin_h = IMX219_BINNING_X2_ANALOG;
>  		*bin_v = IMX219_BINNING_X2_ANALOG;

So we're always going for BINNING_ANALOG_X2 whenever we bin now

I tested the binned mode 1640x1232 and 640x480 (which should bin then
crop) and both works fine.

I was wondering if we should then just rename ANALOG_X2 to X2 but the
datasheet actually defines that mode as "x2 analog (special) binning"
so I would keep the current name.

I didn't know, but the sensor can also x4 bin!

Anyway, for this patch, I would keep a comment around that says we
always use the special analog binning mode which is now the default.

This little nit apart
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Tested-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

> -
> -		return;
> +	} else {
> +		*bin_h = IMX219_BINNING_NONE;
> +		*bin_v = IMX219_BINNING_NONE;
>  	}
>
> -	if (hbin == 2)
> -		*bin_h = IMX219_BINNING_X2;
> -	if (vbin == 2)
> -		*bin_v = IMX219_BINNING_X2;
>  }
>
>  static inline u32 imx219_get_rate_factor(struct v4l2_subdev_state *state)
>
> --
> 2.51.0
>

