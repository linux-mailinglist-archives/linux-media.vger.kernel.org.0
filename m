Return-Path: <linux-media+bounces-12865-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CF1902499
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 16:51:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A177A1F20EC3
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 14:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C628132132;
	Mon, 10 Jun 2024 14:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="elwP2XzO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E73113D8BF;
	Mon, 10 Jun 2024 14:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718031056; cv=none; b=cvggVYiy3+e7ppfu/auZdAxcLxQVkL8eEmO3YxibvEEx04/ofDZ4YAT4wHx5zfl3IbNJBC3tbzy9MdjOEsNYeR1E7DZBnpglUR1m2CNYv3SUW1h8hEw8HqC7f3KGqYHSwi5EvaeZNqXKsVRaVGYoPaPTs1lzKslW8Ovc5Tm8EEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718031056; c=relaxed/simple;
	bh=sP5UolJyjrxiRxmj2ve8JbmQiZEexIjlcWLYUDLXgso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EYUpsE4majm/Vh6FpgZBXHE5RRV6kJQv08NKXCy7kFhnUEfOfLIDPERZBZsXnfYmCZo1TwcK0M9uhILiyqQtpa+TDKwfXzU5Hto5Cf+ey0StAPIBWOC9YfPMhdYG8I/mA5YJ01PGfihNjTB0KJgG9QQtsFYvCdJIqJSVVJUNUbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=elwP2XzO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9E460397;
	Mon, 10 Jun 2024 16:50:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718031039;
	bh=sP5UolJyjrxiRxmj2ve8JbmQiZEexIjlcWLYUDLXgso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=elwP2XzOK35+33roVb2owycUY2ihC3FcN+OuDPmNhk75B9KDF5N5EuJBhZMuKTBha
	 gQ3LtDONboMJy41Zay8hGcDeIDLKE5BcORkTCnoSELw0/cVy3rrdbr7VRTCn7jGaEd
	 v0YXPd0tbHw3s+pWrDL4MOjyTVhfHMLK9Sp/TK4w=
Date: Mon, 10 Jun 2024 17:50:31 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] media: uvcvideo: Remove PLF device quirking
Message-ID: <20240610145031.GC13744@pendragon.ideasonboard.com>
References: <20240318-billion-v1-0-2f7bc0ee2030@chromium.org>
 <20240318-billion-v1-5-2f7bc0ee2030@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240318-billion-v1-5-2f7bc0ee2030@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Mon, Mar 18, 2024 at 11:55:27PM +0000, Ricardo Ribalda wrote:
> We can use heuristics to figure out the proper range of the control
> instead of quirking every single device.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c   |   4 +-
>  drivers/media/usb/uvc/uvc_driver.c | 122 -------------------------------------
>  drivers/media/usb/uvc/uvcvideo.h   |   2 -
>  3 files changed, 2 insertions(+), 126 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 41578ded1174e..11ba1e8ee25b8 100644
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
> index bbd90123a4e76..5f689fee60a9e 100644
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

I think you can drop the mappings field from the uvc_device_info
structure, as well as the corresponding code in uvc_ctrl_init_ctrl().

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
> index 611350a82c37f..896bb7362fa27 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -751,8 +751,6 @@ int uvc_status_start(struct uvc_device *dev, gfp_t flags);
>  void uvc_status_stop(struct uvc_device *dev);
>  
>  /* Controls */
> -extern const struct uvc_control_mapping uvc_ctrl_power_line_mapping_limited;
> -extern const struct uvc_control_mapping uvc_ctrl_power_line_mapping_uvc11;
>  extern const struct v4l2_subscribed_event_ops uvc_ctrl_sub_ev_ops;
>  
>  int uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
> 

-- 
Regards,

Laurent Pinchart

