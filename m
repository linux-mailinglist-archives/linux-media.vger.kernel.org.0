Return-Path: <linux-media+bounces-48390-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B8BCACF1B
	for <lists+linux-media@lfdr.de>; Mon, 08 Dec 2025 12:03:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B21A6306B156
	for <lists+linux-media@lfdr.de>; Mon,  8 Dec 2025 11:02:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F1A631195B;
	Mon,  8 Dec 2025 11:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fRaIJleY"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA002EA156;
	Mon,  8 Dec 2025 11:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765191730; cv=none; b=IqKe9YEZjQJ8mvuqwk84XHAkRQe+o3e6v3SN5L2lVdy1yuBTi71miRuIM8ywGp6a1xPa8s2BI3ltmArL9rCd51m6SI0t/7ZZf4wvd1Tpf7hQQrtWdTuwNv9hjQjM5fG0brFOSD8DZnUl/Ylt6039bSO8SFEaV41Dvt6IdLXjegM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765191730; c=relaxed/simple;
	bh=ygi8r+Ojd81EB1wBcl12AKRYtRElrE/CWfRGiVEYkDw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IL0lgzWfeucgYkF49lgZdVpnOq5GPgQI7dsic9qWW6PjVcqh0rIEOf1kKT2NL5AQknptxUDu2/ESqyInTGrMgrcJ9LeJwfx4dlOxfyYCO2fvaC2uicFvmqZnM1kVWAFG3qn11JW/gHv9wnLHUhpma19DnX9CblnCBoY7Rr6NtIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fRaIJleY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64D45C4CEF1;
	Mon,  8 Dec 2025 11:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765191730;
	bh=ygi8r+Ojd81EB1wBcl12AKRYtRElrE/CWfRGiVEYkDw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fRaIJleY+UINIW69lOVZOeNCTSIZf7WF6xXjr08UHA/gtRQ6NnuVvJ1Yc//L0YPUr
	 YzPRt3hIlBdf8e/hiZeD0/EP/vazhftWW/qqbAEuLt5wZmzTsqawJAC6MEzzRV17Du
	 UBrbl7JcBL4szmryMWwon7w0n/nip7iXd/c/pJ9T24gQDwrdOUFgE8b+p+4F/G8Qe6
	 c1G/BolY/5Eh020TjLMAeuMSkLhAEe26JRGKbAcyCM9m6m+P2Ky58EDpB01q1j9b4F
	 Y1cDzJJNCDympUBLE64VGyVKoGHQwlUO73AVNmjXQnKmOLf95tNTd0EU0xMtzohR6g
	 2BGobVPXbD19A==
Message-ID: <779a1a39-64f9-4985-b733-92f8673f3d3e@kernel.org>
Date: Mon, 8 Dec 2025 12:02:06 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] media: uvcvideo: Import standard controls from
 uvcdynctrl
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, Manav Gautama <bandwidthcrunch@gmail.com>,
 Martin Rubli <martin_rubli@logitech.com>
References: <20251119-uvcdynctrl-v2-0-0359ffb98c9e@chromium.org>
 <20251119-uvcdynctrl-v2-2-0359ffb98c9e@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20251119-uvcdynctrl-v2-2-0359ffb98c9e@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ricardo,

Thank you very much for doing this, this has been on my own TODO list for
a long time, so it is great to finally see this happen.

On 19-Nov-25 8:37 PM, Ricardo Ribalda wrote:
> The uvcdynctrl tool from libwebcam:
> https://sourceforge.net/projects/libwebcam/
> maps proprietary controls into v4l2 controls using the UVCIOC_CTRL_MAP
> ioctl.
> 
> The tool has not been updated for 10+ years now, and there is no reason
> for the UVC driver to not do the mapping by itself.
> 
> This patch adds the mappings from the uvcdynctrl into the driver. Hopefully
> this effort can help in deprecating the UVCIOC_CTRL_MAP ioctl.

...

Question what happens if uvcdynctrl is run after applying this patch ?

We already have the ctrl-info + mappings now, does the code detect this
and ignore the duplicate info, or ... ?


> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 2905505c240c060e5034ea12d33b59d5702f2e1f..57ce486f22bbc404a1f127539eb2d12373431631 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -385,6 +385,99 @@ static const struct uvc_control_info uvc_ctrls[] = {
>  				| UVC_CTRL_FLAG_GET_RANGE
>  				| UVC_CTRL_FLAG_RESTORE,
>  	},
> +	/*
> +	 * Allows the control of pan/tilt motor movements for camera models
> +	 * that support mechanical pan/tilt.
> +	 *
> +	 * Bits 0 to 15 control pan, bits 16 to 31 control tilt.
> +	 * The unit of the pan/tilt values is 1/64th of a degree and the
> +	 * resolution is 1 degree.
> +	 */
> +	{
> +		.entity         = UVC_GUID_LOGITECH_MOTOR_CONTROL_V1,
> +		.selector       = 1,
> +		.index          = 0,
> +		.size           = 4,
> +		.flags          = UVC_CTRL_FLAG_GET_DEF
> +				| UVC_CTRL_FLAG_GET_MAX
> +				| UVC_CTRL_FLAG_GET_MIN
> +				| UVC_CTRL_FLAG_SET_CUR,
> +	},
> +	/*
> +	 * Reset the pan/tilt motors to their original position for camera
> +	 * models that support mechanical pan/tilt.
> +	 *
> +	 * Setting bit 0 resets the pan position.
> +	 * Setting bit 1 resets the tilt position.
> +	 *
> +	 * Both bits can be set at the same time to reset both, pan and tilt,
> +	 * at the same time.
> +	 */
> +	{
> +		.entity         = UVC_GUID_LOGITECH_MOTOR_CONTROL_V1,
> +		.selector       = 2,
> +		.index          = 1,
> +		.size           = 1,
> +		.flags          = UVC_CTRL_FLAG_GET_DEF
> +				| UVC_CTRL_FLAG_GET_MAX
> +				| UVC_CTRL_FLAG_GET_MIN
> +				| UVC_CTRL_FLAG_SET_CUR,
> +	},
> +	/*
> +	 * Allows the control of focus motor movements for camera models that
> +	 * support mechanical focus.
> +	 *
> +	 * Bits 0 to 7 allow selection of the desired lens position.
> +	 * There are no physical units, instead, the focus range is spread over
> +	 * 256 logical units with 0 representing infinity focus and 255 being
> +	 * macro focus.
> +	 */
> +	{
> +		.entity         = UVC_GUID_LOGITECH_MOTOR_CONTROL_V1,
> +		.selector       = 3,
> +		.index          = 2,
> +		.size           = 6,
> +		.flags          = UVC_CTRL_FLAG_GET_CUR
> +				| UVC_CTRL_FLAG_GET_DEF
> +				| UVC_CTRL_FLAG_GET_MAX
> +				| UVC_CTRL_FLAG_GET_MIN
> +				| UVC_CTRL_FLAG_SET_CUR,
> +	},
> +	/*
> +	 * Allows the control of pan/tilt motor movements for camera models
> +	 * that support mechanical pan/tilt.
> +	 *
> +	 * Bits 0 to 15 control pan, bits 16 to 31 control tilt.
> +	 */
> +	{
> +		.entity         = UVC_GUID_LOGITECH_PERIPHERAL,

At a first read I thought this was duplicate with the pan/tilt motor
control mapping above but this is for UVC_GUID_LOGITECH_PERIPHERAL, where
as the ctrl_info above is for UVC_GUID_LOGITECH_MOTOR_CONTROL_V1 .

I wonder if this is worth a comment ? One difference here is is
the support of UVC_CTRL_FLAG_GET_RES .

> +		.selector       = 1,
> +		.index          = 0,
> +		.size           = 4,
> +		.flags          = UVC_CTRL_FLAG_GET_DEF
> +				| UVC_CTRL_FLAG_GET_MAX
> +				| UVC_CTRL_FLAG_GET_MIN
> +				| UVC_CTRL_FLAG_GET_RES
> +				| UVC_CTRL_FLAG_SET_CUR,
> +	},
> +	/*
> +	 * Reset the pan/tilt motors to their original position for camera
> +	 * models that support mechanical pan/tilt.
> +	 *
> +	 * Setting bit 0 resets the pan position.
> +	 * Setting bit 1 resets the tilt position.
> +	 */
> +	{
> +		.entity         = UVC_GUID_LOGITECH_PERIPHERAL,
> +		.selector       = 2,
> +		.index          = 1,
> +		.size           = 1,
> +		.flags          = UVC_CTRL_FLAG_GET_DEF
> +				| UVC_CTRL_FLAG_GET_MAX
> +				| UVC_CTRL_FLAG_GET_MIN
> +				| UVC_CTRL_FLAG_GET_RES
> +				| UVC_CTRL_FLAG_SET_CUR,
> +	},
>  };
>  
>  static const u32 uvc_control_classes[] = {
> @@ -1009,6 +1102,87 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  		.menu_mask	= BIT(V4L2_COLORFX_VIVID) |
>  				  BIT(V4L2_COLORFX_NONE),
>  	},
> +	{
> +		.id             = V4L2_CID_PAN_RELATIVE,
> +		.entity         = UVC_GUID_LOGITECH_MOTOR_CONTROL_V1,
> +		.selector       = 1,
> +		.size           = 16,
> +		.offset         = 0,
> +		.v4l2_type      = V4L2_CTRL_TYPE_INTEGER,
> +		.data_type      = UVC_CTRL_DATA_TYPE_SIGNED,
> +	},
> +	{
> +		.id             = V4L2_CID_TILT_RELATIVE,
> +		.entity         = UVC_GUID_LOGITECH_MOTOR_CONTROL_V1,
> +		.selector       = 1,
> +		.size           = 16,
> +		.offset         = 16,
> +		.v4l2_type      = V4L2_CTRL_TYPE_INTEGER,
> +		.data_type      = UVC_CTRL_DATA_TYPE_SIGNED,
> +	},
> +	{
> +		.id             = V4L2_CID_PAN_RESET,
> +		.entity         = UVC_GUID_LOGITECH_MOTOR_CONTROL_V1,
> +		.selector       = 2,
> +		.size           = 1,
> +		.offset         = 0,
> +		.v4l2_type      = V4L2_CTRL_TYPE_BUTTON,
> +		.data_type      = UVC_CTRL_DATA_TYPE_UNSIGNED,
> +	},
> +	{
> +		.id             = V4L2_CID_TILT_RESET,
> +		.entity         = UVC_GUID_LOGITECH_MOTOR_CONTROL_V1,
> +		.selector       = 2,
> +		.size           = 1,
> +		.offset         = 1,
> +		.v4l2_type      = V4L2_CTRL_TYPE_BUTTON,
> +		.data_type      = UVC_CTRL_DATA_TYPE_UNSIGNED,
> +	},
> +	{
> +		.id             = V4L2_CID_PAN_RELATIVE,
> +		.entity         = UVC_GUID_LOGITECH_PERIPHERAL,
> +		.selector       = 1,
> +		.size           = 16,
> +		.offset         = 0,
> +		.v4l2_type      = V4L2_CTRL_TYPE_INTEGER,
> +		.data_type      = UVC_CTRL_DATA_TYPE_SIGNED,
> +	},
> +	{
> +		.id             = V4L2_CID_TILT_RELATIVE,
> +		.entity         = UVC_GUID_LOGITECH_PERIPHERAL,
> +		.selector       = 1,
> +		.size           = 16,
> +		.offset         = 16,
> +		.v4l2_type      = V4L2_CTRL_TYPE_INTEGER,
> +		.data_type      = UVC_CTRL_DATA_TYPE_SIGNED,
> +	},
> +	{
> +		.id             = V4L2_CID_PAN_RESET,
> +		.entity         = UVC_GUID_LOGITECH_PERIPHERAL,
> +		.selector       = 2,
> +		.size           = 1,
> +		.offset         = 0,
> +		.v4l2_type      = V4L2_CTRL_TYPE_BUTTON,
> +		.data_type      = UVC_CTRL_DATA_TYPE_UNSIGNED,
> +	},
> +	{
> +		.id             = V4L2_CID_TILT_RESET,
> +		.entity         = UVC_GUID_LOGITECH_PERIPHERAL,
> +		.selector       = 2,
> +		.size           = 1,
> +		.offset         = 1,
> +		.v4l2_type      = V4L2_CTRL_TYPE_BUTTON,
> +		.data_type      = UVC_CTRL_DATA_TYPE_UNSIGNED,
> +	},
> +	{
> +		.id             = V4L2_CID_FOCUS_ABSOLUTE,
> +		.entity         = UVC_GUID_LOGITECH_MOTOR_CONTROL_V1,
> +		.selector       = 3,
> +		.size           = 8,
> +		.offset         = 0,
> +		.v4l2_type      = V4L2_CTRL_TYPE_INTEGER,
> +		.data_type      = UVC_CTRL_DATA_TYPE_UNSIGNED,
> +	},
>  };
>  
>  /* ------------------------------------------------------------------------
> diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
> index 22e0dab0809e296e089940620ae0e8838e109701..b939a01da11466747249c64c72a3ea40cd364a59 100644
> --- a/include/linux/usb/uvc.h
> +++ b/include/linux/usb/uvc.h
> @@ -35,6 +35,12 @@
>  #define UVC_GUID_MSXU_1_5 \
>  	{0xdc, 0x95, 0x3f, 0x0f, 0x32, 0x26, 0x4e, 0x4c, \
>  	 0x92, 0xc9, 0xa0, 0x47, 0x82, 0xf4, 0x3b, 0xc8}
> +#define UVC_GUID_LOGITECH_MOTOR_CONTROL_V1 \
> +	{0x82, 0x06, 0x61, 0x63, 0x70, 0x50, 0xab, 0x49, \
> +	 0xb8, 0xcc, 0xb3, 0x85, 0x5e, 0x8d, 0x22, 0x56 }
> +#define UVC_GUID_LOGITECH_PERIPHERAL \
> +	{0x21, 0x2d, 0xe5, 0xff, 0x30, 0x80, 0x2c, 0x4e, \
> +	 0x82, 0xd9, 0xf5, 0x87, 0xd0, 0x05, 0x40, 0xbd }
>  
>  /* https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/uvc-extensions-1-5#222-extension-unit-controls */
>  #define UVC_MSXU_CONTROL_FOCUS			0x01
> 

Regards,

Hans



