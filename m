Return-Path: <linux-media+bounces-32842-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C32ABC759
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 20:46:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3501F1B643C5
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 18:46:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B2121FBEBE;
	Mon, 19 May 2025 18:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mwm8aQy3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C044148838
	for <linux-media@vger.kernel.org>; Mon, 19 May 2025 18:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747680378; cv=none; b=CnGT9IRgTTToeG2E3xmI/zxs77AScLDg/01XgTGFSscXd0lB3/f839sdFEuDN5t3PyoNvdljoKq0QBexqghdZq+dme0iLLP/I7U1hfBBXQ/ZTQr3byY5wUoySt5myHL36ui5hEyOYJ3IjBvARIlVQ3MZiOLA877kPKiFV8Ae9UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747680378; c=relaxed/simple;
	bh=/HlYrngSKBEcT7rYluV5od/3+iAhVrxYw4QCdqnxcKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eENU+HOi88oVuOZn3Yj86yHS3WVghKZS4GeTXd2wLmuHju+bbIh2s9RYppMjOjeaEgOXhPQlsWJppDupjBQMNaBAHHq4bPMLdhPoqbl4oiLKZQ7WvDKrqQtdGOwkamudASWU9A7BNfLzOXG8/v78LwgIHKHKEUwzc3Fe+Ajdfv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mwm8aQy3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (85-76-43-50-nat.elisa-mobile.fi [85.76.43.50])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 49A8A83D;
	Mon, 19 May 2025 20:45:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747680354;
	bh=/HlYrngSKBEcT7rYluV5od/3+iAhVrxYw4QCdqnxcKU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mwm8aQy3kqaoS2xry2JvqZH2dfx4IbcsYMq9XxIb6t9ji9ntJiqjnUzrZznit336h
	 R0KyL7qgs/ba0yLOMC5bOc7203Sl8h9A7jjZw2bOht1GsnynFIs1qTOhFEtu1eZKuj
	 c2DkGFABFSzPQIYwfB3oY5PobVDxijMrDkEySVL0=
Date: Mon, 19 May 2025 20:46:03 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
	sakari.ailus@linux.intel.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	jacopo.mondi@ideasonboard.com,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>
Subject: Re: [PATCH v4 2/6] media: rzg2l-cru: Add vidioc_enum_framesizes()
Message-ID: <20250519184603.GA8070@pendragon.ideasonboard.com>
References: <20250506125015.567746-1-dan.scally@ideasonboard.com>
 <20250506125015.567746-3-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250506125015.567746-3-dan.scally@ideasonboard.com>

Hi Dan,

Thank you for the patch.

On Tue, May 06, 2025 at 01:50:11PM +0100, Daniel Scally wrote:
> From: Daniel Scally <dan.scally+renesas@ideasonboard.com>
> 
> Add a callback to fill VIDIOC_ENUM_FRAMESIZES ioctl for the CRU

s/CRU/CRU./

And did you mean "implement the" instead of "fill" ?

> Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>
> ---
> Changes in v4:
> 
> 	- New patch 
> 
>  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 067c6af14e95..15afb647d4d6 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -1031,7 +1031,33 @@ static int rzg2l_cru_enum_fmt_vid_cap(struct file *file, void *priv,
>  	return 0;
>  }
>  
> +static int rzg2l_cru_enum_framesizes(struct file *file, void *fh,
> +				     struct v4l2_frmsizeenum *fsize)
> +{
> +	struct rzg2l_cru_dev *cru = video_drvdata(file);
> +	const struct rzg2l_cru_info *info = cru->info;
> +	const struct rzg2l_cru_ip_format *fmt;
> +
> +	if (fsize->index)
> +		return -EINVAL;
> +
> +	fmt = rzg2l_cru_ip_format_to_fmt(fsize->pixel_format);
> +	if (!fmt)
> +		return -EINVAL;
> +
> +	fsize->type = V4L2_FRMIVAL_TYPE_CONTINUOUS;
> +	fsize->stepwise.min_width = RZG2L_CRU_MIN_INPUT_WIDTH;
> +	fsize->stepwise.max_width = info->max_width;
> +	fsize->stepwise.step_width = 1;
> +	fsize->stepwise.min_height = RZG2L_CRU_MIN_INPUT_HEIGHT;
> +	fsize->stepwise.max_height = info->max_height;
> +	fsize->stepwise.step_height = 1;
> +
> +	return 0;
> +}
> +
>  static const struct v4l2_ioctl_ops rzg2l_cru_ioctl_ops = {
> +

Stray blank line.

>  	.vidioc_querycap		= rzg2l_cru_querycap,
>  	.vidioc_try_fmt_vid_cap		= rzg2l_cru_try_fmt_vid_cap,
>  	.vidioc_g_fmt_vid_cap		= rzg2l_cru_g_fmt_vid_cap,
> @@ -1047,6 +1073,8 @@ static const struct v4l2_ioctl_ops rzg2l_cru_ioctl_ops = {
>  	.vidioc_prepare_buf		= vb2_ioctl_prepare_buf,
>  	.vidioc_streamon		= vb2_ioctl_streamon,
>  	.vidioc_streamoff		= vb2_ioctl_streamoff,
> +

And here too. With that addressed,

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> +	.vidioc_enum_framesizes		= rzg2l_cru_enum_framesizes,
>  };
>  
>  /* -----------------------------------------------------------------------------

-- 
Regards,

Laurent Pinchart

