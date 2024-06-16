Return-Path: <linux-media+bounces-13337-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 853BD90A0AE
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 01:04:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9627A1C20F47
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2024 23:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C09473454;
	Sun, 16 Jun 2024 23:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Lw9JvXXE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD847344A;
	Sun, 16 Jun 2024 23:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718579071; cv=none; b=f9W1ujcVN4yoLL9V4MbEHupO1YiDSVUF+1LwaAQYHGqgzXyxoHDHkA9/zFqMGLYUL+DXElpb0OJN84n4B2ETlI9io6BHZi0MonKi21ZI41KIOlc4BoTUH+oAdJEXTOENvKFcIUp23wKOHdg8NIUd5rYuDUna2yq8X53nCnPoGWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718579071; c=relaxed/simple;
	bh=xX1vAq9FWaw1dPCAlAvgfuzyit66MqzF4IPcXFKCJIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S8Bd4W7FKNiryGgL2d3EOh17sau2ZAEVV7j951yuNq/EB5N8U3uPNFX37ys30fynL8piHhKFE77duYS0B/+PFy6tHgnjBIsvSfYiNhWeUvnIIOy3tQYwH4gt0vanFILj2czE9gKjfQiEc0O7t+NUOnl1fa+OzzmJzDarYXbpgcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Lw9JvXXE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6A3062D5;
	Mon, 17 Jun 2024 01:04:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718579050;
	bh=xX1vAq9FWaw1dPCAlAvgfuzyit66MqzF4IPcXFKCJIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lw9JvXXEc7FY32pTBV2JOB0cQ1JCyAT2ASPHW+qY9WI422BvXKFxl0TXN4+zRoRgV
	 SooHZCtF5My8yRWTK+8UZEvqy0eha+DtysHhZ0sG1cnsJ1pZhwb/BiWElEOYW1Ea4d
	 32FvtcQ1FYXkhWjzn4zs8xuDxJnqHJ0okgXg6OuA=
Date: Mon, 17 Jun 2024 02:04:04 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/7] media: uvcvideo: Probe the PLF characteristics
Message-ID: <20240616230404.GB4782@pendragon.ideasonboard.com>
References: <20240610-billion-v2-0-38e861475f85@chromium.org>
 <20240610-billion-v2-3-38e861475f85@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240610-billion-v2-3-38e861475f85@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Mon, Jun 10, 2024 at 11:09:54PM +0000, Ricardo Ribalda wrote:
> The UVC 1.5 standard defines 4 values for the PLF control: Off, 50Hz,
> 60Hz and Auto. But it does not clearly define if all the values must be
> implemented or not.
> 
> Instead of just using the UVC version to determine what the PLF control
> can do, probe it.
> 
> Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 52 ++++++++++++++++++++++++++++++++++++----
>  1 file changed, 47 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index d82cfc56dfd5..5b77ac308c84 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -495,18 +495,60 @@ static const struct uvc_control_mapping uvc_ctrl_power_line_mapping_uvc15 = {
>  				  V4L2_CID_POWER_LINE_FREQUENCY_DISABLED),
>  };
>  
> -static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
> +static int __uvc_ctrl_add_mapping_to_list(struct uvc_video_chain *chain,
>  	struct uvc_control *ctrl, const struct uvc_control_mapping *mapping);
>  
>  static int uvc_ctrl_add_plf_mapping(struct uvc_video_chain *chain,
>  	struct uvc_control *ctrl, const struct uvc_control_mapping *mapping)
>  {
> +	const struct uvc_control_mapping *out_mapping =
> +					&uvc_ctrl_power_line_mapping_uvc11;
> +	u8 *buf __free(kfree) = NULL;
> +	u8 init_val;
> +	int ret;
> +
> +	buf = kmalloc(sizeof(*buf), GFP_KERNEL);
> +	if (!buf)
> +		return -ENOMEM;
> +
> +	/* Save the default PLF value, so we can restore it. */
> +	ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR, ctrl->entity->id,
> +			     chain->dev->intfnum, ctrl->info.selector,
> +			     buf, sizeof(*buf));
> +	/* If we cannot read the control skip it. */
> +	if (ret)
> +		return ret;
> +	init_val = *buf;
> +
> +	/* If PLF value cannot be set to off, it is limited. */
> +	*buf = V4L2_CID_POWER_LINE_FREQUENCY_DISABLED;
> +	ret = uvc_query_ctrl(chain->dev, UVC_SET_CUR, ctrl->entity->id,
> +			     chain->dev->intfnum, ctrl->info.selector,
> +			     buf, sizeof(*buf));
> +	if (ret)
> +		return __uvc_ctrl_add_mapping_to_list(chain, ctrl,
> +					&uvc_ctrl_power_line_mapping_limited);
> +
> +	/* UVC 1.1 does not define auto, we can exit. */
>  	if (chain->dev->uvc_version < 0x150)
> -		return __uvc_ctrl_add_mapping(chain, ctrl,
> -					      &uvc_ctrl_power_line_mapping_uvc11);
> +		goto end;
> +
> +	/* Check if the device supports auto. */
> +	*buf = V4L2_CID_POWER_LINE_FREQUENCY_AUTO;
> +	ret = uvc_query_ctrl(chain->dev, UVC_SET_CUR, ctrl->entity->id,
> +			     chain->dev->intfnum, ctrl->info.selector,
> +			     buf, sizeof(*buf));
> +	if (!ret)
> +		out_mapping = &uvc_ctrl_power_line_mapping_uvc15;
> +
> +end:
> +	/* Restore initial value and add mapping. */
> +	*buf = init_val;
> +	uvc_query_ctrl(chain->dev, UVC_SET_CUR, ctrl->entity->id,
> +		       chain->dev->intfnum, ctrl->info.selector,
> +		       buf, sizeof(*buf));
>  
> -	return __uvc_ctrl_add_mapping(chain, ctrl,
> -				      &uvc_ctrl_power_line_mapping_uvc15);
> +	return __uvc_ctrl_add_mapping_to_list(chain, ctrl, out_mapping);
>  }
>  
>  static const struct uvc_control_mapping uvc_ctrl_mappings[] = {

-- 
Regards,

Laurent Pinchart

