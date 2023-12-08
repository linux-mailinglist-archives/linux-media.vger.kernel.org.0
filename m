Return-Path: <linux-media+bounces-1957-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF44480A538
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 15:15:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0A6F1C20DAA
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 14:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C7F11DFC5;
	Fri,  8 Dec 2023 14:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="alwndMBW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA2FC10EB
	for <linux-media@vger.kernel.org>; Fri,  8 Dec 2023 06:15:06 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1D5AD250;
	Fri,  8 Dec 2023 15:14:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1702044863;
	bh=GcGjCZwvlfLlG8mQeSM0uSMBq6Cpac/a9uGKK+86Zvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=alwndMBWmkvM+duXUoi6Wkp1fWcMZwEBWGtqDyNUJHFjW+z6aHyPzJvjZtOF5JeFP
	 ozqgzHesaGUO2mri0ywBaW4t6taWyHsFPwvErBnK7WDOiIcvcrlJ4Mo1X9QfAZ14Tr
	 YHqH/8jn1SgV0yyUGSmirgu4F3r7jacXIu029lv0=
Date: Fri, 8 Dec 2023 16:15:11 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Yunke Cao <yunkec@google.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Tomasz Figa <tfiga@chromium.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH v14 04/11] media: uvcvideo: Split
 uvc_control_mapping.size to v4l2 and data size
Message-ID: <20231208141511.GA22113@pendragon.ideasonboard.com>
References: <20231201071907.3080126-1-yunkec@google.com>
 <20231201071907.3080126-5-yunkec@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231201071907.3080126-5-yunkec@google.com>

Hi Yunke,

Thank you for the patch.

On Fri, Dec 01, 2023 at 04:18:55PM +0900, Yunke Cao wrote:
> Rename the existing size to data_size to represent uvc control data size,
> add a separate field for v4l2 control size. v4l2 control size will be
> used the compound controls.

s/uvc/UVC/ and s/v4l2/V4L2/ in the whole commit message.

> Also modify the uvc driver documents to clarify the size in
> uvc_xu_control_mapping corresponds to the uvc control data size.
> 
> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> Signed-off-by: Yunke Cao <yunkec@google.com>
> ---
> Changelog since v11:
> - No change.
> Changelog since v10:
> - Added Reviewed-by from Daniel Scally.
> Changelog since v9:
> - No change.
> Changelog since v8:
> - No change.
> Changelog since v7:
> - Newly added patch.
> 
>  .../userspace-api/media/drivers/uvcvideo.rst  |  2 +-
>  drivers/media/usb/uvc/uvc_ctrl.c              | 80 +++++++++----------
>  drivers/media/usb/uvc/uvc_v4l2.c              |  2 +-
>  drivers/media/usb/uvc/uvcvideo.h              |  6 +-
>  4 files changed, 47 insertions(+), 43 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/drivers/uvcvideo.rst b/Documentation/userspace-api/media/drivers/uvcvideo.rst
> index a290f9fadae9..aab4304e6bb5 100644
> --- a/Documentation/userspace-api/media/drivers/uvcvideo.rst
> +++ b/Documentation/userspace-api/media/drivers/uvcvideo.rst
> @@ -157,7 +157,7 @@ Argument: struct uvc_xu_control_mapping
>  	__u8	name[32]	V4L2 control name
>  	__u8	entity[16]	UVC extension unit GUID
>  	__u8	selector	UVC control selector
> -	__u8	size		V4L2 control size (in bits)
> +	__u8	size		UVC control data size (in bits)

The V4L2 and UVC sizes are identical for all controls mapped through
this mechanism, right ?

>  	__u8	offset		V4L2 control offset (in bits)

If the size if the "UVC control data size", shouldn't this be the "UVC
control data offset" ?

>  	enum v4l2_ctrl_type
>  		v4l2_type	V4L2 control type
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 4a685532f7eb..98254b93eb46 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -464,7 +464,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  		.id		= V4L2_CID_BRIGHTNESS,
>  		.entity		= UVC_GUID_UVC_PROCESSING,
>  		.selector	= UVC_PU_BRIGHTNESS_CONTROL,
> -		.size		= 16,
> +		.data_size	= 16,
>  		.offset		= 0,
>  		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
>  		.data_type	= UVC_CTRL_DATA_TYPE_SIGNED,
> @@ -473,7 +473,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  		.id		= V4L2_CID_CONTRAST,
>  		.entity		= UVC_GUID_UVC_PROCESSING,
>  		.selector	= UVC_PU_CONTRAST_CONTROL,
> -		.size		= 16,
> +		.data_size	= 16,
>  		.offset		= 0,
>  		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
>  		.data_type	= UVC_CTRL_DATA_TYPE_UNSIGNED,
> @@ -482,7 +482,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  		.id		= V4L2_CID_HUE,
>  		.entity		= UVC_GUID_UVC_PROCESSING,
>  		.selector	= UVC_PU_HUE_CONTROL,
> -		.size		= 16,
> +		.data_size	= 16,
>  		.offset		= 0,
>  		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
>  		.data_type	= UVC_CTRL_DATA_TYPE_SIGNED,
> @@ -493,7 +493,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  		.id		= V4L2_CID_SATURATION,
>  		.entity		= UVC_GUID_UVC_PROCESSING,
>  		.selector	= UVC_PU_SATURATION_CONTROL,
> -		.size		= 16,
> +		.data_size	= 16,
>  		.offset		= 0,
>  		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
>  		.data_type	= UVC_CTRL_DATA_TYPE_UNSIGNED,
> @@ -502,7 +502,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  		.id		= V4L2_CID_SHARPNESS,
>  		.entity		= UVC_GUID_UVC_PROCESSING,
>  		.selector	= UVC_PU_SHARPNESS_CONTROL,
> -		.size		= 16,
> +		.data_size	= 16,
>  		.offset		= 0,
>  		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
>  		.data_type	= UVC_CTRL_DATA_TYPE_UNSIGNED,
> @@ -511,7 +511,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  		.id		= V4L2_CID_GAMMA,
>  		.entity		= UVC_GUID_UVC_PROCESSING,
>  		.selector	= UVC_PU_GAMMA_CONTROL,
> -		.size		= 16,
> +		.data_size	= 16,
>  		.offset		= 0,
>  		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
>  		.data_type	= UVC_CTRL_DATA_TYPE_UNSIGNED,
> @@ -520,7 +520,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  		.id		= V4L2_CID_BACKLIGHT_COMPENSATION,
>  		.entity		= UVC_GUID_UVC_PROCESSING,
>  		.selector	= UVC_PU_BACKLIGHT_COMPENSATION_CONTROL,
> -		.size		= 16,
> +		.data_size	= 16,
>  		.offset		= 0,
>  		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
>  		.data_type	= UVC_CTRL_DATA_TYPE_UNSIGNED,
> @@ -529,7 +529,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  		.id		= V4L2_CID_GAIN,
>  		.entity		= UVC_GUID_UVC_PROCESSING,
>  		.selector	= UVC_PU_GAIN_CONTROL,
> -		.size		= 16,
> +		.data_size	= 16,
>  		.offset		= 0,
>  		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
>  		.data_type	= UVC_CTRL_DATA_TYPE_UNSIGNED,
> @@ -538,7 +538,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  		.id		= V4L2_CID_HUE_AUTO,
>  		.entity		= UVC_GUID_UVC_PROCESSING,
>  		.selector	= UVC_PU_HUE_AUTO_CONTROL,
> -		.size		= 1,
> +		.data_size	= 1,
>  		.offset		= 0,
>  		.v4l2_type	= V4L2_CTRL_TYPE_BOOLEAN,
>  		.data_type	= UVC_CTRL_DATA_TYPE_BOOLEAN,
> @@ -548,7 +548,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  		.id		= V4L2_CID_EXPOSURE_AUTO,
>  		.entity		= UVC_GUID_UVC_CAMERA,
>  		.selector	= UVC_CT_AE_MODE_CONTROL,
> -		.size		= 4,
> +		.data_size	= 4,
>  		.offset		= 0,
>  		.v4l2_type	= V4L2_CTRL_TYPE_MENU,
>  		.data_type	= UVC_CTRL_DATA_TYPE_BITMASK,
> @@ -561,7 +561,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  		.id		= V4L2_CID_EXPOSURE_AUTO_PRIORITY,
>  		.entity		= UVC_GUID_UVC_CAMERA,
>  		.selector	= UVC_CT_AE_PRIORITY_CONTROL,
> -		.size		= 1,
> +		.data_size	= 1,
>  		.offset		= 0,
>  		.v4l2_type	= V4L2_CTRL_TYPE_BOOLEAN,
>  		.data_type	= UVC_CTRL_DATA_TYPE_BOOLEAN,
> @@ -570,7 +570,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  		.id		= V4L2_CID_EXPOSURE_ABSOLUTE,
>  		.entity		= UVC_GUID_UVC_CAMERA,
>  		.selector	= UVC_CT_EXPOSURE_TIME_ABSOLUTE_CONTROL,
> -		.size		= 32,
> +		.data_size	= 32,
>  		.offset		= 0,
>  		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
>  		.data_type	= UVC_CTRL_DATA_TYPE_UNSIGNED,
> @@ -581,7 +581,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  		.id		= V4L2_CID_AUTO_WHITE_BALANCE,
>  		.entity		= UVC_GUID_UVC_PROCESSING,
>  		.selector	= UVC_PU_WHITE_BALANCE_TEMPERATURE_AUTO_CONTROL,
> -		.size		= 1,
> +		.data_size	= 1,
>  		.offset		= 0,
>  		.v4l2_type	= V4L2_CTRL_TYPE_BOOLEAN,
>  		.data_type	= UVC_CTRL_DATA_TYPE_BOOLEAN,
> @@ -591,7 +591,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  		.id		= V4L2_CID_WHITE_BALANCE_TEMPERATURE,
>  		.entity		= UVC_GUID_UVC_PROCESSING,
>  		.selector	= UVC_PU_WHITE_BALANCE_TEMPERATURE_CONTROL,
> -		.size		= 16,
> +		.data_size	= 16,
>  		.offset		= 0,
>  		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
>  		.data_type	= UVC_CTRL_DATA_TYPE_UNSIGNED,
> @@ -602,7 +602,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  		.id		= V4L2_CID_AUTO_WHITE_BALANCE,
>  		.entity		= UVC_GUID_UVC_PROCESSING,
>  		.selector	= UVC_PU_WHITE_BALANCE_COMPONENT_AUTO_CONTROL,
> -		.size		= 1,
> +		.data_size	= 1,
>  		.offset		= 0,
>  		.v4l2_type	= V4L2_CTRL_TYPE_BOOLEAN,
>  		.data_type	= UVC_CTRL_DATA_TYPE_BOOLEAN,
> @@ -613,7 +613,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  		.id		= V4L2_CID_BLUE_BALANCE,
>  		.entity		= UVC_GUID_UVC_PROCESSING,
>  		.selector	= UVC_PU_WHITE_BALANCE_COMPONENT_CONTROL,
> -		.size		= 16,
> +		.data_size	= 16,
>  		.offset		= 0,
>  		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
>  		.data_type	= UVC_CTRL_DATA_TYPE_SIGNED,
> @@ -624,7 +624,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  		.id		= V4L2_CID_RED_BALANCE,
>  		.entity		= UVC_GUID_UVC_PROCESSING,
>  		.selector	= UVC_PU_WHITE_BALANCE_COMPONENT_CONTROL,
> -		.size		= 16,
> +		.data_size	= 16,
>  		.offset		= 16,
>  		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
>  		.data_type	= UVC_CTRL_DATA_TYPE_SIGNED,
> @@ -635,7 +635,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  		.id		= V4L2_CID_FOCUS_ABSOLUTE,
>  		.entity		= UVC_GUID_UVC_CAMERA,
>  		.selector	= UVC_CT_FOCUS_ABSOLUTE_CONTROL,
> -		.size		= 16,
> +		.data_size	= 16,
>  		.offset		= 0,
>  		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
>  		.data_type	= UVC_CTRL_DATA_TYPE_UNSIGNED,
> @@ -646,7 +646,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  		.id		= V4L2_CID_FOCUS_AUTO,
>  		.entity		= UVC_GUID_UVC_CAMERA,
>  		.selector	= UVC_CT_FOCUS_AUTO_CONTROL,
> -		.size		= 1,
> +		.data_size	= 1,
>  		.offset		= 0,
>  		.v4l2_type	= V4L2_CTRL_TYPE_BOOLEAN,
>  		.data_type	= UVC_CTRL_DATA_TYPE_BOOLEAN,
> @@ -656,7 +656,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  		.id		= V4L2_CID_IRIS_ABSOLUTE,
>  		.entity		= UVC_GUID_UVC_CAMERA,
>  		.selector	= UVC_CT_IRIS_ABSOLUTE_CONTROL,
> -		.size		= 16,
> +		.data_size	= 16,
>  		.offset		= 0,
>  		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
>  		.data_type	= UVC_CTRL_DATA_TYPE_UNSIGNED,
> @@ -665,7 +665,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  		.id		= V4L2_CID_IRIS_RELATIVE,
>  		.entity		= UVC_GUID_UVC_CAMERA,
>  		.selector	= UVC_CT_IRIS_RELATIVE_CONTROL,
> -		.size		= 8,
> +		.data_size	= 8,
>  		.offset		= 0,
>  		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
>  		.data_type	= UVC_CTRL_DATA_TYPE_SIGNED,
> @@ -674,7 +674,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  		.id		= V4L2_CID_ZOOM_ABSOLUTE,
>  		.entity		= UVC_GUID_UVC_CAMERA,
>  		.selector	= UVC_CT_ZOOM_ABSOLUTE_CONTROL,
> -		.size		= 16,
> +		.data_size	= 16,
>  		.offset		= 0,
>  		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
>  		.data_type	= UVC_CTRL_DATA_TYPE_UNSIGNED,
> @@ -683,7 +683,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  		.id		= V4L2_CID_ZOOM_CONTINUOUS,
>  		.entity		= UVC_GUID_UVC_CAMERA,
>  		.selector	= UVC_CT_ZOOM_RELATIVE_CONTROL,
> -		.size		= 0,
> +		.data_size	= 0,
>  		.offset		= 0,
>  		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
>  		.data_type	= UVC_CTRL_DATA_TYPE_SIGNED,
> @@ -694,7 +694,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  		.id		= V4L2_CID_PAN_ABSOLUTE,
>  		.entity		= UVC_GUID_UVC_CAMERA,
>  		.selector	= UVC_CT_PANTILT_ABSOLUTE_CONTROL,
> -		.size		= 32,
> +		.data_size	= 32,
>  		.offset		= 0,
>  		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
>  		.data_type	= UVC_CTRL_DATA_TYPE_SIGNED,
> @@ -703,7 +703,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  		.id		= V4L2_CID_TILT_ABSOLUTE,
>  		.entity		= UVC_GUID_UVC_CAMERA,
>  		.selector	= UVC_CT_PANTILT_ABSOLUTE_CONTROL,
> -		.size		= 32,
> +		.data_size	= 32,
>  		.offset		= 32,
>  		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
>  		.data_type	= UVC_CTRL_DATA_TYPE_SIGNED,
> @@ -712,7 +712,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  		.id		= V4L2_CID_PAN_SPEED,
>  		.entity		= UVC_GUID_UVC_CAMERA,
>  		.selector	= UVC_CT_PANTILT_RELATIVE_CONTROL,
> -		.size		= 16,
> +		.data_size	= 16,
>  		.offset		= 0,
>  		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
>  		.data_type	= UVC_CTRL_DATA_TYPE_SIGNED,
> @@ -723,7 +723,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  		.id		= V4L2_CID_TILT_SPEED,
>  		.entity		= UVC_GUID_UVC_CAMERA,
>  		.selector	= UVC_CT_PANTILT_RELATIVE_CONTROL,
> -		.size		= 16,
> +		.data_size	= 16,
>  		.offset		= 16,
>  		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
>  		.data_type	= UVC_CTRL_DATA_TYPE_SIGNED,
> @@ -734,7 +734,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  		.id		= V4L2_CID_PRIVACY,
>  		.entity		= UVC_GUID_UVC_CAMERA,
>  		.selector	= UVC_CT_PRIVACY_CONTROL,
> -		.size		= 1,
> +		.data_size	= 1,
>  		.offset		= 0,
>  		.v4l2_type	= V4L2_CTRL_TYPE_BOOLEAN,
>  		.data_type	= UVC_CTRL_DATA_TYPE_BOOLEAN,
> @@ -743,7 +743,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  		.id		= V4L2_CID_PRIVACY,
>  		.entity		= UVC_GUID_EXT_GPIO_CONTROLLER,
>  		.selector	= UVC_CT_PRIVACY_CONTROL,
> -		.size		= 1,
> +		.data_size	= 1,
>  		.offset		= 0,
>  		.v4l2_type	= V4L2_CTRL_TYPE_BOOLEAN,
>  		.data_type	= UVC_CTRL_DATA_TYPE_BOOLEAN,
> @@ -754,7 +754,7 @@ const struct uvc_control_mapping uvc_ctrl_power_line_mapping_limited = {
>  	.id		= V4L2_CID_POWER_LINE_FREQUENCY,
>  	.entity		= UVC_GUID_UVC_PROCESSING,
>  	.selector	= UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
> -	.size		= 2,
> +	.data_size	= 2,
>  	.offset		= 0,
>  	.v4l2_type	= V4L2_CTRL_TYPE_MENU,
>  	.data_type	= UVC_CTRL_DATA_TYPE_ENUM,
> @@ -766,7 +766,7 @@ const struct uvc_control_mapping uvc_ctrl_power_line_mapping_uvc11 = {
>  	.id		= V4L2_CID_POWER_LINE_FREQUENCY,
>  	.entity		= UVC_GUID_UVC_PROCESSING,
>  	.selector	= UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
> -	.size		= 2,
> +	.data_size	= 2,
>  	.offset		= 0,
>  	.v4l2_type	= V4L2_CTRL_TYPE_MENU,
>  	.data_type	= UVC_CTRL_DATA_TYPE_ENUM,
> @@ -783,7 +783,7 @@ static const struct uvc_control_mapping uvc_ctrl_power_line_mapping_uvc15 = {
>  	.id		= V4L2_CID_POWER_LINE_FREQUENCY,
>  	.entity		= UVC_GUID_UVC_PROCESSING,
>  	.selector	= UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
> -	.size		= 2,
> +	.data_size	= 2,
>  	.offset		= 0,
>  	.v4l2_type	= V4L2_CTRL_TYPE_MENU,
>  	.data_type	= UVC_CTRL_DATA_TYPE_ENUM,
> @@ -816,7 +816,7 @@ static inline void uvc_clear_bit(u8 *data, int bit)
>  }
>  
>  /*
> - * Extract the bit string specified by mapping->offset and mapping->size
> + * Extract the bit string specified by mapping->offset and mapping->data_size
>   * from the little-endian data stored at 'data' and return the result as
>   * a signed 32bit integer. Sign extension will be performed if the mapping
>   * references a signed data type.
> @@ -824,7 +824,7 @@ static inline void uvc_clear_bit(u8 *data, int bit)
>  static s32 uvc_get_le_value(struct uvc_control_mapping *mapping,
>  	u8 query, const u8 *data)
>  {
> -	int bits = mapping->size;
> +	int bits = mapping->data_size;
>  	int offset = mapping->offset;
>  	s32 value = 0;
>  	u8 mask;
> @@ -847,19 +847,19 @@ static s32 uvc_get_le_value(struct uvc_control_mapping *mapping,
>  
>  	/* Sign-extend the value if needed. */
>  	if (mapping->data_type == UVC_CTRL_DATA_TYPE_SIGNED)
> -		value |= -(value & (1 << (mapping->size - 1)));
> +		value |= -(value & (1 << (mapping->data_size - 1)));
>  
>  	return value;
>  }
>  
>  /*
> - * Set the bit string specified by mapping->offset and mapping->size
> + * Set the bit string specified by mapping->offset and mapping->data_size
>   * in the little-endian data stored at 'data' to the value 'value'.
>   */
>  static void uvc_set_le_value(struct uvc_control_mapping *mapping,
>  	s32 value, u8 *data)
>  {
> -	int bits = mapping->size;
> +	int bits = mapping->data_size;
>  	int offset = mapping->offset;
>  	u8 mask;
>  
> @@ -2039,7 +2039,7 @@ int uvc_ctrl_set(struct uvc_fh *handle,
>  	 * needs to be loaded from the device to perform the read-modify-write
>  	 * operation.
>  	 */
> -	if ((ctrl->info.size * 8) != mapping->size) {
> +	if ((ctrl->info.size * 8) != mapping->data_size) {
>  		ret = __uvc_ctrl_load_cur(chain, ctrl);
>  		if (ret < 0)
>  			return ret;
> @@ -2546,8 +2546,8 @@ int uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
>  	}
>  
>  	/* Validate the user-provided bit-size and offset */
> -	if (mapping->size > 32 ||
> -	    mapping->offset + mapping->size > ctrl->info.size * 8) {
> +	if (mapping->data_size > 32 ||
> +	    mapping->offset + mapping->data_size > ctrl->info.size * 8) {
>  		ret = -EINVAL;
>  		goto done;
>  	}
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 5a88847bfbfe..ff72caf7bc9e 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -122,7 +122,7 @@ static int uvc_ioctl_xu_ctrl_map(struct uvc_video_chain *chain,
>  	}
>  	memcpy(map->entity, xmap->entity, sizeof(map->entity));
>  	map->selector = xmap->selector;
> -	map->size = xmap->size;
> +	map->data_size = xmap->size;
>  	map->offset = xmap->offset;
>  	map->v4l2_type = xmap->v4l2_type;
>  	map->data_type = xmap->data_type;
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 5091085fcfb0..7bc41270ed94 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -110,7 +110,11 @@ struct uvc_control_mapping {
>  	u8 entity[16];
>  	u8 selector;
>  
> -	u8 size;
> +	/* Size of the v4l2 control. Required for compound controls. */
> +	u8 v4l2_size;

Let's introduce this field in the patch that uses it. The commit message
needs to be updated to explain that this patch renames the size field to
data_size to prepare for adding another size field for compound
controls.

> +	/* UVC data size. Required for all controls. */

"UVC data size" is not very clear. Let me attempt to write a more
precise description:

	/*
	 * Size of the control data in the payload of the UVC control GET and
	 * SET requests, expressed in bits.
	 */

Is this correct ?

> +	u8 data_size;
> +
>  	u8 offset;
>  	enum v4l2_ctrl_type v4l2_type;
>  	u32 data_type;

-- 
Regards,

Laurent Pinchart

