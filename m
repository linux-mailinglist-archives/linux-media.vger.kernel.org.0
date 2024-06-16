Return-Path: <linux-media+bounces-13338-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA30F90A0B1
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 01:05:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67E64282745
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2024 23:05:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7CF27345A;
	Sun, 16 Jun 2024 23:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZL9bkt+1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDF37317C;
	Sun, 16 Jun 2024 23:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718579153; cv=none; b=EzwKMQ6UiZqruwH8NPGubbOk5ROjKEdgIFuanIKntGiYiSEQgeY2t+SfFbSe1Yyv+/whQpmds3/btc25D0cKQ800/yLF6aWs4wKHLVaw2funR3YcKbBNC3MBLdGqzOVEjPMkOf5URozcYh3o3R97Lzpri/x8tnNIeFuX3Tu0KyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718579153; c=relaxed/simple;
	bh=h8k5HI/siyjwDpZ6jJg0hoXED0J7D90RVLmyyQLrbpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A2BJXq8ye1hwQR7Oqk5fIGvfY1PayO5d4dREjSGBqJTge7Tz3d9Nr06cESck2ybceLnP5cQFvJmhV9hrwlyzxSIucrx0LrrKozb7IyFFK5Y82zuBhXYU7Zcc5DsCoBv8IrBSwDb+uSPyEVO+OBUypGFpJQ+zi9vUeBZ6YAH6nxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZL9bkt+1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C06322D5;
	Mon, 17 Jun 2024 01:05:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718579134;
	bh=h8k5HI/siyjwDpZ6jJg0hoXED0J7D90RVLmyyQLrbpo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZL9bkt+1mDbHJBXQl37pucwh4o4pGmmiQJPXhWRGeubPafnULn/p7M8Cy/xreOjCe
	 BTvBur8RxNGCXFCHDYDFVAuuVMtw3ctFF9QRdMyR/nbwxmqbRyO+nEqQoeKae89C1S
	 kufO+ryAXbLDeB6UfJ2lbiHco8jjWUv4H6eAGo4o=
Date: Mon, 17 Jun 2024 02:05:29 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/7] media: uvcvideo: Remove PLF device quirking
Message-ID: <20240616230529.GC4782@pendragon.ideasonboard.com>
References: <20240610-billion-v2-0-38e861475f85@chromium.org>
 <20240610-billion-v2-5-38e861475f85@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240610-billion-v2-5-38e861475f85@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Mon, Jun 10, 2024 at 11:09:56PM +0000, Ricardo Ribalda wrote:
> We can use heuristics to figure out the proper range of the control
> instead of quirking every single device.
> 
> Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/usb/uvc/uvc_ctrl.c   |   4 +-
>  drivers/media/usb/uvc/uvc_driver.c | 122 -------------------------------------
>  drivers/media/usb/uvc/uvcvideo.h   |   2 -
>  3 files changed, 2 insertions(+), 126 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index efc46f53ac81..d74019cb27fe 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -459,7 +459,7 @@ static void uvc_ctrl_set_rel_speed(struct uvc_control_mapping *mapping,
>  	data[first+1] = min_t(int, abs(value), 0xff);
>  }
>  
> -const struct uvc_control_mapping uvc_ctrl_power_line_mapping_limited = {
> +static const struct uvc_control_mapping uvc_ctrl_power_line_mapping_limited = {
>  	.id		= V4L2_CID_POWER_LINE_FREQUENCY,
>  	.entity		= UVC_GUID_UVC_PROCESSING,
>  	.selector	= UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
> @@ -471,7 +471,7 @@ const struct uvc_control_mapping uvc_ctrl_power_line_mapping_limited = {
>  				  V4L2_CID_POWER_LINE_FREQUENCY_50HZ),
>  };
>  
> -const struct uvc_control_mapping uvc_ctrl_power_line_mapping_uvc11 = {
> +static const struct uvc_control_mapping uvc_ctrl_power_line_mapping_uvc11 = {
>  	.id		= V4L2_CID_POWER_LINE_FREQUENCY,
>  	.entity		= UVC_GUID_UVC_PROCESSING,
>  	.selector	= UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index bbd90123a4e7..5f689fee60a9 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2383,20 +2383,6 @@ MODULE_PARM_DESC(timeout, "Streaming control requests timeout");
>   * Driver initialization and cleanup
>   */
>  
> -static const struct uvc_device_info uvc_ctrl_power_line_limited = {
> -	.mappings = (const struct uvc_control_mapping *[]) {
> -		&uvc_ctrl_power_line_mapping_limited,
> -		NULL, /* Sentinel */
> -	},
> -};
> -
> -static const struct uvc_device_info uvc_ctrl_power_line_uvc11 = {
> -	.mappings = (const struct uvc_control_mapping *[]) {
> -		&uvc_ctrl_power_line_mapping_uvc11,
> -		NULL, /* Sentinel */
> -	},
> -};
> -
>  static const struct uvc_device_info uvc_quirk_probe_minmax = {
>  	.quirks = UVC_QUIRK_PROBE_MINMAX,
>  };
> @@ -2427,33 +2413,6 @@ static const struct uvc_device_info uvc_quirk_force_y8 = {
>   * though they are compliant.
>   */
>  static const struct usb_device_id uvc_ids[] = {
> -	/* Quanta USB2.0 HD UVC Webcam */
> -	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> -				| USB_DEVICE_ID_MATCH_INT_INFO,
> -	  .idVendor		= 0x0408,
> -	  .idProduct		= 0x3090,
> -	  .bInterfaceClass	= USB_CLASS_VIDEO,
> -	  .bInterfaceSubClass	= 1,
> -	  .bInterfaceProtocol	= 0,
> -	  .driver_info		= (kernel_ulong_t)&uvc_ctrl_power_line_limited },
> -	/* Quanta USB2.0 HD UVC Webcam */
> -	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> -				| USB_DEVICE_ID_MATCH_INT_INFO,
> -	  .idVendor		= 0x0408,
> -	  .idProduct		= 0x4030,
> -	  .bInterfaceClass	= USB_CLASS_VIDEO,
> -	  .bInterfaceSubClass	= 1,
> -	  .bInterfaceProtocol	= 0,
> -	  .driver_info		= (kernel_ulong_t)&uvc_ctrl_power_line_limited },
> -	/* Quanta USB2.0 HD UVC Webcam */
> -	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> -				| USB_DEVICE_ID_MATCH_INT_INFO,
> -	  .idVendor		= 0x0408,
> -	  .idProduct		= 0x4034,
> -	  .bInterfaceClass	= USB_CLASS_VIDEO,
> -	  .bInterfaceSubClass	= 1,
> -	  .bInterfaceProtocol	= UVC_PC_PROTOCOL_15,
> -	  .driver_info		= (kernel_ulong_t)&uvc_ctrl_power_line_limited },
>  	/* LogiLink Wireless Webcam */
>  	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
>  				| USB_DEVICE_ID_MATCH_INT_INFO,
> @@ -2583,42 +2542,6 @@ static const struct usb_device_id uvc_ids[] = {
>  	  .bInterfaceSubClass	= 1,
>  	  .bInterfaceProtocol	= 0,
>  	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_RESTRICT_FRAME_RATE) },
> -	/* Chicony EasyCamera */
> -	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> -				| USB_DEVICE_ID_MATCH_INT_INFO,
> -	  .idVendor		= 0x04f2,
> -	  .idProduct		= 0xb5eb,
> -	  .bInterfaceClass	= USB_CLASS_VIDEO,
> -	  .bInterfaceSubClass	= 1,
> -	  .bInterfaceProtocol	= 0,
> -	  .driver_info		= (kernel_ulong_t)&uvc_ctrl_power_line_limited },
> -	/* Chicony Electronics Co., Ltd Integrated Camera */
> -	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> -				| USB_DEVICE_ID_MATCH_INT_INFO,
> -	  .idVendor		= 0x04f2,
> -	  .idProduct		= 0xb67c,
> -	  .bInterfaceClass	= USB_CLASS_VIDEO,
> -	  .bInterfaceSubClass	= 1,
> -	  .bInterfaceProtocol	= UVC_PC_PROTOCOL_15,
> -	  .driver_info		= (kernel_ulong_t)&uvc_ctrl_power_line_uvc11 },
> -	/* Chicony EasyCamera */
> -	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> -				| USB_DEVICE_ID_MATCH_INT_INFO,
> -	  .idVendor		= 0x04f2,
> -	  .idProduct		= 0xb6ba,
> -	  .bInterfaceClass	= USB_CLASS_VIDEO,
> -	  .bInterfaceSubClass	= 1,
> -	  .bInterfaceProtocol	= 0,
> -	  .driver_info		= (kernel_ulong_t)&uvc_ctrl_power_line_limited },
> -	/* Chicony EasyCamera */
> -	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> -				| USB_DEVICE_ID_MATCH_INT_INFO,
> -	  .idVendor		= 0x04f2,
> -	  .idProduct		= 0xb746,
> -	  .bInterfaceClass	= USB_CLASS_VIDEO,
> -	  .bInterfaceSubClass	= 1,
> -	  .bInterfaceProtocol	= 0,
> -	  .driver_info		= (kernel_ulong_t)&uvc_ctrl_power_line_limited },
>  	/* Alcor Micro AU3820 (Future Boy PC USB Webcam) */
>  	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
>  				| USB_DEVICE_ID_MATCH_INT_INFO,
> @@ -3003,51 +2926,6 @@ static const struct usb_device_id uvc_ids[] = {
>  	  .bInterfaceSubClass	= 1,
>  	  .bInterfaceProtocol	= 0,
>  	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_FORCE_BPP) },
> -	/* SunplusIT Inc HD Camera */
> -	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> -				| USB_DEVICE_ID_MATCH_INT_INFO,
> -	  .idVendor		= 0x2b7e,
> -	  .idProduct		= 0xb752,
> -	  .bInterfaceClass	= USB_CLASS_VIDEO,
> -	  .bInterfaceSubClass	= 1,
> -	  .bInterfaceProtocol	= UVC_PC_PROTOCOL_15,
> -	  .driver_info		= (kernel_ulong_t)&uvc_ctrl_power_line_uvc11 },
> -	/* Lenovo Integrated Camera */
> -	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> -				| USB_DEVICE_ID_MATCH_INT_INFO,
> -	  .idVendor		= 0x30c9,
> -	  .idProduct		= 0x0093,
> -	  .bInterfaceClass	= USB_CLASS_VIDEO,
> -	  .bInterfaceSubClass	= 1,
> -	  .bInterfaceProtocol	= UVC_PC_PROTOCOL_15,
> -	  .driver_info		= (kernel_ulong_t)&uvc_ctrl_power_line_uvc11 },
> -	/* Sonix Technology USB 2.0 Camera */
> -	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> -				| USB_DEVICE_ID_MATCH_INT_INFO,
> -	  .idVendor		= 0x3277,
> -	  .idProduct		= 0x0072,
> -	  .bInterfaceClass	= USB_CLASS_VIDEO,
> -	  .bInterfaceSubClass	= 1,
> -	  .bInterfaceProtocol	= 0,
> -	  .driver_info		= (kernel_ulong_t)&uvc_ctrl_power_line_limited },
> -	/* Acer EasyCamera */
> -	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> -				| USB_DEVICE_ID_MATCH_INT_INFO,
> -	  .idVendor		= 0x5986,
> -	  .idProduct		= 0x1172,
> -	  .bInterfaceClass	= USB_CLASS_VIDEO,
> -	  .bInterfaceSubClass	= 1,
> -	  .bInterfaceProtocol	= 0,
> -	  .driver_info		= (kernel_ulong_t)&uvc_ctrl_power_line_limited },
> -	/* Acer EasyCamera */
> -	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> -				| USB_DEVICE_ID_MATCH_INT_INFO,
> -	  .idVendor		= 0x5986,
> -	  .idProduct		= 0x1180,
> -	  .bInterfaceClass	= USB_CLASS_VIDEO,
> -	  .bInterfaceSubClass	= 1,
> -	  .bInterfaceProtocol	= 0,
> -	  .driver_info		= (kernel_ulong_t)&uvc_ctrl_power_line_limited },
>  	/* Intel D410/ASR depth camera */
>  	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
>  				| USB_DEVICE_ID_MATCH_INT_INFO,
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index fa0396dd5b35..4df02a40c74f 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -753,8 +753,6 @@ int uvc_status_start(struct uvc_device *dev, gfp_t flags);
>  void uvc_status_stop(struct uvc_device *dev);
>  
>  /* Controls */
> -extern const struct uvc_control_mapping uvc_ctrl_power_line_mapping_limited;
> -extern const struct uvc_control_mapping uvc_ctrl_power_line_mapping_uvc11;
>  extern const struct v4l2_subscribed_event_ops uvc_ctrl_sub_ev_ops;
>  
>  int uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,

-- 
Regards,

Laurent Pinchart

