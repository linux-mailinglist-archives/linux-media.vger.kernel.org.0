Return-Path: <linux-media+bounces-44868-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE20BE7CC1
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 11:36:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2EF8A6E3C47
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 09:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D815D3191D3;
	Fri, 17 Oct 2025 09:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qJ42qLwB"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2691DC985;
	Fri, 17 Oct 2025 09:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760693033; cv=none; b=tyRwrKtNJPv03/xPDFU4yKz66os0uzPh+HG99v/DdZx3zong+ZenDCjOpUhlLD9Igs0xyOiWZUy0BzmHrE+nAw8Z6EpTJodhp1fP6YCwkozjyZjiW02NHFFqh9CZqHpvneX9RVH90XLOBXopgozBp47XPk+GqQ5U/WUA0dNEX0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760693033; c=relaxed/simple;
	bh=Yx+F/b7bx3085dSktR/oo/zKJrjeNdPp6uiApzbMGF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L7eUoEA99QMQC5wvChW+Ex6tOmEKtJN2Kb++CeUcV9LL/qWyF7+gs1X5wK5p05j2C1ufD2Zrytg17HFHn0V9Cui1obYk2VZGuNkFeKyz69Wfd3s5yKUg6yoSd5NDmWaIVWUl0SqC5JJnYlMfzSUUI0A/K7uPz2zmHaGBVZdtk0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qJ42qLwB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C40931118;
	Fri, 17 Oct 2025 11:22:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760692928;
	bh=Yx+F/b7bx3085dSktR/oo/zKJrjeNdPp6uiApzbMGF8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qJ42qLwBarBIjjYx6xU1lARUVtRJTobqwKSuyXKJ+cuXVxIBnjwKY6y28tRZSXNNq
	 ImF3xa+xnKcwJB4UW8digW+VqBausZFjvovAVYAejYZyuQcoY5KAMwoKQTvI8T7EE/
	 Pm5nuKYQ0w4svfY/clh+dqfbXVq7CLqbyL2+WLWw=
Date: Fri, 17 Oct 2025 11:23:46 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hverkuil@kernel.org>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	=?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] media: i2c: imx219: Fix 1920x1080 mode to use 1:1
 pixel aspect ratio
Message-ID: <cmj3pqfy7zvcdjw63ndkuwfcxapt5puv3swvnhfhjbqs5w7d2v@fmi3okbzhdvt>
References: <20251017-imx219-1080p-v1-0-9173d5a47a0c@ideasonboard.com>
 <20251017-imx219-1080p-v1-1-9173d5a47a0c@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251017-imx219-1080p-v1-1-9173d5a47a0c@ideasonboard.com>

Hi Jai

On Fri, Oct 17, 2025 at 01:43:49PM +0530, Jai Luthra wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
>
> Commit 0af46fbc333d ("media: i2c: imx219: Calculate crop rectangle
> dynamically") meant that the 1920x1080 mode switched from using no
> binning to using vertical binning but no horizontal binning, which
> resulted in stretched pixels.
>
> Until proper controls are available to independently select horizontal
> and vertical binning, restore the original 1:1 pixel aspect ratio by
> forcing binning to be uniform in both directions.

I think it makes sense and I wonder if binning in one direction and
not in the other will ever be needed in the general case.

For this driver indeed, this fixes a visible regression
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j
>
> Cc: stable@vger.kernel.org
> Fixes: 0af46fbc333d ("media: i2c: imx219: Calculate crop rectangle dynamically")
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> [Add comment & reword commit message]
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
>  drivers/media/i2c/imx219.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index c680aa6c3a55a9d865e79ad337b258cb681f98fe..300935b1ef2497050fe2808e4ceedda389a75b50 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -856,7 +856,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>  	const struct imx219_mode *mode;
>  	struct v4l2_mbus_framefmt *format;
>  	struct v4l2_rect *crop;
> -	u8 bin_h, bin_v;
> +	u8 bin_h, bin_v, binning;
>  	u32 prev_line_len;
>
>  	format = v4l2_subdev_state_get_format(state, 0);
> @@ -877,9 +877,12 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>  	bin_h = min(IMX219_PIXEL_ARRAY_WIDTH / format->width, 2U);
>  	bin_v = min(IMX219_PIXEL_ARRAY_HEIGHT / format->height, 2U);
>
> +	/* Ensure bin_h and bin_v are same to avoid 1:2 or 2:1 stretching */
> +	binning = min(bin_h, bin_v);
> +
>  	crop = v4l2_subdev_state_get_crop(state, 0);
> -	crop->width = format->width * bin_h;
> -	crop->height = format->height * bin_v;
> +	crop->width = format->width * binning;
> +	crop->height = format->height * binning;
>  	crop->left = (IMX219_NATIVE_WIDTH - crop->width) / 2;
>  	crop->top = (IMX219_NATIVE_HEIGHT - crop->height) / 2;
>
>
> --
> 2.51.0
>

