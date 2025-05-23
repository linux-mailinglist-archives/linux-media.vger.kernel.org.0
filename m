Return-Path: <linux-media+bounces-33254-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DD9AC223D
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 13:56:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8359E503931
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 11:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CB3723644F;
	Fri, 23 May 2025 11:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ObOzD17r"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680275D8F0;
	Fri, 23 May 2025 11:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748001396; cv=none; b=uE+JZEZ6rg2+d6mMffQdIXyva6/azbidL3/5+BGAYuN/Rt4q2eXR5PZM2ZQBVK4DwmV2GIHO5ScXfWocliMxa0KX0BYYUAtqrg9lo1LR63skkVR/1q6eph52zXAUyRkZsvGll8aadodrFTs38U/0pV3qfdmHhpGJPGEdNjvYYn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748001396; c=relaxed/simple;
	bh=+t6tENnKyUjMPjU6Df1uGdMeZPTFRPAX+oj6+nDNQxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SmfzzdVSuUzp2TSXSk8hJUWkmgSSHlIzm4X9iYpF/M3p3uRzRUrd+ckME/+1T371x4xWE910aQS1hmdFryyt+m2XoZepRFkNmZxdZ1HeYmKyK/rBcZUI5lU6rzxXVf/9AQcxxrSVrtQ31j8l479mlxEvn6bQokvYQ3/xsJcpvus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ObOzD17r; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (179.218-130-109.adsl-dyn.isp.belgacom.be [109.130.218.179])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id ED0E96B5;
	Fri, 23 May 2025 13:56:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748001370;
	bh=+t6tENnKyUjMPjU6Df1uGdMeZPTFRPAX+oj6+nDNQxY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ObOzD17rRC9fkPCgkCVhZnIG56k4sSnh9V/CMk7Ugk+rTUEe1XFSTIbYggdNRSmFA
	 sDReFOUl0TEcKEtEsqzCu45YeNg8SDLGOHBi63cvT8f/NYcdBYgzcGFELTLFfBeSOx
	 NSBaVr9kRtbnJSNrAY/d03mJma7RWA2OIgDfZPiU=
Date: Fri, 23 May 2025 13:56:25 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] media: uvcvideo: Refactor uvc_v4l2_compat_ioctl32
Message-ID: <20250523115625.GD12514@pendragon.ideasonboard.com>
References: <20250509-uvc-followup-v1-0-73bcde30d2b5@chromium.org>
 <20250509-uvc-followup-v1-3-73bcde30d2b5@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250509-uvc-followup-v1-3-73bcde30d2b5@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Fri, May 09, 2025 at 06:24:15PM +0000, Ricardo Ribalda wrote:
> Declaring a variable for doing automatic cleanup is not a very common
> pattern. Replace the cleanup macro with manual cleanup to make the code
> simpler.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_v4l2.c | 21 +++++++++------------
>  1 file changed, 9 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 862b4e34e5b629cf324479a9bb59ebe8784ccd5d..fe3db03d7458eeb4b9a846ae4ed141bb60ea46eb 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -1382,11 +1382,9 @@ static int uvc_v4l2_put_xu_query(const struct uvc_xu_control_query *kp,
>  #define UVCIOC_CTRL_MAP32	_IOWR('u', 0x20, struct uvc_xu_control_mapping32)
>  #define UVCIOC_CTRL_QUERY32	_IOWR('u', 0x21, struct uvc_xu_control_query32)
>  
> -DEFINE_FREE(uvc_pm_put, struct uvc_device *, if (_T) uvc_pm_put(_T))
>  static long uvc_v4l2_compat_ioctl32(struct file *file,
>  		     unsigned int cmd, unsigned long arg)
>  {
> -	struct uvc_device *uvc_device __free(uvc_pm_put) = NULL;
>  	struct uvc_fh *handle = file->private_data;
>  	union {
>  		struct uvc_xu_control_mapping xmap;
> @@ -1399,38 +1397,37 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
>  	if (ret)
>  		return ret;
>  
> -	uvc_device = handle->stream->dev;
> -
>  	switch (cmd) {
>  	case UVCIOC_CTRL_MAP32:
>  		ret = uvc_v4l2_get_xu_mapping(&karg.xmap, up);
>  		if (ret)
> -			return ret;
> +			break;
>  		ret = uvc_ioctl_xu_ctrl_map(handle->chain, &karg.xmap);
>  		if (ret)
> -			return ret;
> +			break;
>  		ret = uvc_v4l2_put_xu_mapping(&karg.xmap, up);
>  		if (ret)
> -			return ret;
> -
> +			break;
>  		break;
>  
>  	case UVCIOC_CTRL_QUERY32:
>  		ret = uvc_v4l2_get_xu_query(&karg.xqry, up);
>  		if (ret)
> -			return ret;
> +			break;
>  		ret = uvc_xu_ctrl_query(handle->chain, &karg.xqry);
>  		if (ret)
> -			return ret;
> +			break;
>  		ret = uvc_v4l2_put_xu_query(&karg.xqry, up);
>  		if (ret)
> -			return ret;
> +			break;
>  		break;
>  
>  	default:
> -		return -ENOIOCTLCMD;
> +		ret = -ENOIOCTLCMD;

I'll add a

		break;

here.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	}
>  
> +	uvc_pm_put(handle->stream->dev);
> +
>  	return ret;
>  }
>  #endif

-- 
Regards,

Laurent Pinchart

