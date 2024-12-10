Return-Path: <linux-media+bounces-23020-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 606E49EAD60
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 11:00:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A076286906
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 10:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA4BB1DC983;
	Tue, 10 Dec 2024 09:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MkGU94Ov"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D3378F33;
	Tue, 10 Dec 2024 09:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733824782; cv=none; b=dWbfOygrocPDIPJXpAkxEcA0bx4h7u6Kh9KVGLOJRFotaUcw0udBP9GULej7MrmTZvk4kU+eRhxc8Zy3yPZss+QKtXi1J+2ellsl+wmLIQXJdRK/8RzkJN9mLDTCyuz2sZiFK8Qto4+vFWmb06XWq0lDMXSeLmBJJdtwQjB8uSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733824782; c=relaxed/simple;
	bh=2dgi13MdYkX55Qs/64w3566Wi7SlLKksGmoSdYUqWtg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fwkrvCCeDLoNbPvVt20z0xGMNA0ZGTGv2d2vf3CZXgJ8qfBmv1iN5HX7AjkjCnJifFI0FS446iqxlJWfy5Cz+auooeYKqDaZtD8BleGvEBFlN4JkoR+FKL7fu8ZymzNVBXJQVekyigFXylTldyJkA6FHyDTOCPfgWwxCUOsOMEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MkGU94Ov; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DB28D6EC;
	Tue, 10 Dec 2024 10:59:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733824746;
	bh=2dgi13MdYkX55Qs/64w3566Wi7SlLKksGmoSdYUqWtg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MkGU94Ovvg7Y0ddYQmHu3+y6wRcPhjRbaWqc8fnB0cw7uUoP8Jpckqg08NnnTuKJ7
	 TJzqGRp2UX60SIz2LuLhbvcmrT96oNmzz/rRPpLgeNC0Dc/fAXbQ+X2+pLLq00YFS5
	 tWSc3MMb02hZknmTgkmRIUM7b470EYRfW/kmE27U=
Date: Tue, 10 Dec 2024 11:59:22 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mike Isely <isely@pobox.com>, Hans de Goede <hdegoede@redhat.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 04/11] media: uvcvideo: Remove vidioc_queryctrl
Message-ID: <20241210095922.GD573@pendragon.ideasonboard.com>
References: <20241210-queryctrl-v2-0-c0a33d69f416@chromium.org>
 <20241210-queryctrl-v2-4-c0a33d69f416@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241210-queryctrl-v2-4-c0a33d69f416@chromium.org>

On Tue, Dec 10, 2024 at 09:28:48AM +0000, Ricardo Ribalda wrote:
> It can be implemented by the v4l2 ioctl framework using
> vidioc_query_ext_ctrl.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/usb/uvc/uvc_v4l2.c | 10 ----------
>  1 file changed, 10 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 97c5407f6603..39f0ddb6d01c 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -1014,15 +1014,6 @@ static int uvc_ioctl_s_input(struct file *file, void *fh, unsigned int input)
>  	return ret;
>  }
>  
> -static int uvc_ioctl_queryctrl(struct file *file, void *fh,
> -			       struct v4l2_queryctrl *qc)
> -{
> -	struct uvc_fh *handle = fh;
> -	struct uvc_video_chain *chain = handle->chain;
> -
> -	return uvc_query_v4l2_ctrl(chain, qc);
> -}
> -
>  static int uvc_ioctl_query_ext_ctrl(struct file *file, void *fh,
>  				    struct v4l2_query_ext_ctrl *qec)
>  {
> @@ -1563,7 +1554,6 @@ const struct v4l2_ioctl_ops uvc_ioctl_ops = {
>  	.vidioc_enum_input = uvc_ioctl_enum_input,
>  	.vidioc_g_input = uvc_ioctl_g_input,
>  	.vidioc_s_input = uvc_ioctl_s_input,
> -	.vidioc_queryctrl = uvc_ioctl_queryctrl,
>  	.vidioc_query_ext_ctrl = uvc_ioctl_query_ext_ctrl,
>  	.vidioc_g_ext_ctrls = uvc_ioctl_g_ext_ctrls,
>  	.vidioc_s_ext_ctrls = uvc_ioctl_s_ext_ctrls,

-- 
Regards,

Laurent Pinchart

