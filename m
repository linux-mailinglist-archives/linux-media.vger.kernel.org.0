Return-Path: <linux-media+bounces-41986-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D6CB48B19
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 13:05:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D79D13A257C
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 11:05:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAF532F9991;
	Mon,  8 Sep 2025 11:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="el4HpmMf"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8B61AAE13;
	Mon,  8 Sep 2025 11:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757329504; cv=none; b=TddbGwyT/IRdrYFZB9lrPg+QWDjuhHxP6+87HzpoP8EpqdoWNUsrHz1hCiK72xHHHk8AzBB06mirtotS9xCHf+fW3Cd6ydHB9v2we0z+sYSNjrFQZYNodDyb/cKDtdgmLt8EW0E7vnZTD7tEOw0zNpefnw8QBMGXIPFyphx1kDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757329504; c=relaxed/simple;
	bh=e7007cqo/rCAyrKhDwvnsz7W05JuS/8p1qvvCn15L+Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=htjs6EbbxbEURc3+btr9Yy1ZQCFYF6t6FkEdVrEYVWF2wvJniyq1CJJC3v7XS8MjBXcSMXBIwFz8qyX2ASgnuvkNRrpDT4yXyayePOZ5dBm5zSnFwKgQBMbqcEQlcUzhsfCcmLs8YYxCkMOVGQ0D3hHscseHqMtk5nz+OX3UPz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=el4HpmMf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3715C4CEF8;
	Mon,  8 Sep 2025 11:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757329502;
	bh=e7007cqo/rCAyrKhDwvnsz7W05JuS/8p1qvvCn15L+Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=el4HpmMfrtUzh8JNccfYRvsh1lCSaJnjtvWcdykiWkCb/M51jxpybmdDAUzCytg5O
	 11mgW1BWdZEe9g3zMEpAnvkpl+dNjIFr8iSnCRhA8NfT7eJkSOk7zB0H6BPIHBgndD
	 r3G5kFZgvwrjL6KeuLiAONKdrL28VqbJwarcfO47sTU59FKwWyz+iCydEIDW9fm7pH
	 Dxzh7VdQCLjl3lA2FO+4gUujsniWLNPB/irIfWhAq/u4KMF/cE5Gm41oLJIoPgvtNf
	 hy3jwNGWDCsa7zGz6OfJcweQPTrzHeG3hC3x52EsJgSHuX7qaLyvPgGrBmJbbASfjC
	 2MnchVw1ONrUw==
Message-ID: <92440cc6-0302-4e73-b4d6-bebd87fc2db9@kernel.org>
Date: Mon, 8 Sep 2025 13:04:58 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] media: uvcvideo: Support
 UVC_CROSXU_CONTROL_IQ_PROFILE
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20250818-uvc-iq-switch-v1-0-f7ea5e740ddd@chromium.org>
 <20250818-uvc-iq-switch-v1-4-f7ea5e740ddd@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250818-uvc-iq-switch-v1-4-f7ea5e740ddd@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 18-Aug-25 22:15, Ricardo Ribalda wrote:
> The ChromeOS XU provides a control to change the IQ profile for a camera.
> It can be switched from VIVID (a.k.a. standard) to NONE (a.k.a. natural).
> 
> Wire it up to the standard v4l2 control.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hansg@kernel.org>

Regards,

Hans


> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 32 ++++++++++++++++++++++++++++++++
>  include/linux/usb/uvc.h          |  5 +++++
>  2 files changed, 37 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index ff975f96e1325532e2299047c07de5d1b9cf09db..8766a441ad1d8554c0daaed3f87758321684246b 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -376,6 +376,15 @@ static const struct uvc_control_info uvc_ctrls[] = {
>  				| UVC_CTRL_FLAG_GET_DEF
>  				| UVC_CTRL_FLAG_AUTO_UPDATE,
>  	},
> +	{
> +		.entity		= UVC_GUID_CHROMEOS_XU,
> +		.selector	= UVC_CROSXU_CONTROL_IQ_PROFILE,
> +		.index		= 3,
> +		.size		= 1,
> +		.flags		= UVC_CTRL_FLAG_SET_CUR
> +				| UVC_CTRL_FLAG_GET_RANGE
> +				| UVC_CTRL_FLAG_RESTORE,
> +	},
>  };
>  
>  static const u32 uvc_control_classes[] = {
> @@ -384,6 +393,17 @@ static const u32 uvc_control_classes[] = {
>  };
>  
>  static const int exposure_auto_mapping[] = { 2, 1, 4, 8 };
> +static const int cros_colorfx_mapping[] = { 1, // V4L2_COLORFX_NONE
> +					    -1, // V4L2_COLORFX_BW
> +					    -1, // V4L2_COLORFX_SEPIA
> +					    -1, // V4L2_COLORFX_NEGATIVE
> +					    -1, // V4L2_COLORFX_EMBOSS
> +					    -1, // V4L2_COLORFX_SKETCH
> +					    -1, // V4L2_COLORFX_SKY_BLUE
> +					    -1, // V4L2_COLORFX_GRASS_GREEN
> +					    -1, // V4L2_COLORFX_SKIN_WHITEN
> +					    0}; // V4L2_COLORFX_VIVID};
> +
>  
>  static bool uvc_ctrl_mapping_is_compound(struct uvc_control_mapping *mapping)
>  {
> @@ -975,6 +995,18 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  		.data_type	= UVC_CTRL_DATA_TYPE_BITMASK,
>  		.name		= "Region of Interest Auto Ctrls",
>  	},
> +	{
> +		.id		= V4L2_CID_COLORFX,
> +		.entity		= UVC_GUID_CHROMEOS_XU,
> +		.selector	= UVC_CROSXU_CONTROL_IQ_PROFILE,
> +		.size		= 8,
> +		.offset		= 0,
> +		.v4l2_type	= V4L2_CTRL_TYPE_MENU,
> +		.data_type	= UVC_CTRL_DATA_TYPE_ENUM,
> +		.menu_mapping	= cros_colorfx_mapping,
> +		.menu_mask	= BIT(V4L2_COLORFX_VIVID) |
> +				  BIT(V4L2_COLORFX_NONE),
> +	},
>  };
>  
>  /* ------------------------------------------------------------------------
> diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
> index 12a57e1d34674a3a264ed7f88bed43926661fcd4..22e0dab0809e296e089940620ae0e8838e109701 100644
> --- a/include/linux/usb/uvc.h
> +++ b/include/linux/usb/uvc.h
> @@ -29,6 +29,9 @@
>  #define UVC_GUID_EXT_GPIO_CONTROLLER \
>  	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
>  	 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x03}
> +#define UVC_GUID_CHROMEOS_XU \
> +	{0x24, 0xe9, 0xd7, 0x74, 0xc9, 0x49, 0x45, 0x4a, \
> +	 0x98, 0xa3, 0xc8, 0x07, 0x7e, 0x05, 0x1c, 0xa3}
>  #define UVC_GUID_MSXU_1_5 \
>  	{0xdc, 0x95, 0x3f, 0x0f, 0x32, 0x26, 0x4e, 0x4c, \
>  	 0x92, 0xc9, 0xa0, 0x47, 0x82, 0xf4, 0x3b, 0xc8}
> @@ -50,6 +53,8 @@
>  #define UVC_MSXU_CONTROL_FIELDOFVIEW2_CONFIG	0x0f
>  #define UVC_MSXU_CONTROL_FIELDOFVIEW2		0x10
>  
> +#define UVC_CROSXU_CONTROL_IQ_PROFILE		0x04
> +
>  #define UVC_GUID_FORMAT_MJPEG \
>  	{ 'M',  'J',  'P',  'G', 0x00, 0x00, 0x10, 0x00, \
>  	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> 


