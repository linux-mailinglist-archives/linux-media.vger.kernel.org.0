Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0153264E9CE
	for <lists+linux-media@lfdr.de>; Fri, 16 Dec 2022 11:55:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230081AbiLPKzv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Dec 2022 05:55:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230368AbiLPKzu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Dec 2022 05:55:50 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7F1E1AA00
        for <linux-media@vger.kernel.org>; Fri, 16 Dec 2022 02:55:48 -0800 (PST)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0EB21A31;
        Fri, 16 Dec 2022 11:55:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671188146;
        bh=sM7DWlbusaFieVCm1Lt6PXdr05A8iHfgWWfeoDEme4M=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=ArdhHm0TpvPGu5A/IFXrWTsWXiLERk97iQiOTZtsieS0CDQPYF1eGJIthHnS+i15P
         IOmcwTbIeZksaact/HsbJ2t/W4Z8EA+eF91BcRyoxSN78NINqLUU2cWow1mfOUG320
         UlavPOqae3ZnSyDcoHAivi5SbUp3J8qvHZKMd1i0=
Message-ID: <d6ba35f0-4c4c-3cbc-24c5-b4c0afb2991d@ideasonboard.com>
Date:   Fri, 16 Dec 2022 10:55:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v10 04/11] media: uvcvideo: Split uvc_control_mapping.size
 to v4l2 and data size
Content-Language: en-US
To:     Yunke Cao <yunkec@google.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org
References: <20221109060621.704531-1-yunkec@google.com>
 <20221109060621.704531-5-yunkec@google.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20221109060621.704531-5-yunkec@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Yunke

On 09/11/2022 06:06, Yunke Cao wrote:
> Rename the existing size to data_size to represent uvc control data size,
> add a separate field for v4l2 control size. v4l2 control size will be
> used the compound controls.
>
> Also modify the uvc driver documents to clarify the size in
> uvc_xu_control_mapping corresponds to the uvc control data size.
>
> Signed-off-by: Yunke Cao <yunkec@google.com>


Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

> ---
> Changelog since v9:
> - No change.
> Changelog since v8:
> - No change.
> Changelog since v7:
> - Newly added patch.
>
>   .../userspace-api/media/drivers/uvcvideo.rst  |  2 +-
>   drivers/media/usb/uvc/uvc_ctrl.c              | 78 +++++++++----------
>   drivers/media/usb/uvc/uvc_driver.c            |  2 +-
>   drivers/media/usb/uvc/uvc_v4l2.c              |  2 +-
>   drivers/media/usb/uvc/uvcvideo.h              |  6 +-
>   5 files changed, 47 insertions(+), 43 deletions(-)
>
> diff --git a/Documentation/userspace-api/media/drivers/uvcvideo.rst b/Documentation/userspace-api/media/drivers/uvcvideo.rst
> index a290f9fadae9..aab4304e6bb5 100644
> --- a/Documentation/userspace-api/media/drivers/uvcvideo.rst
> +++ b/Documentation/userspace-api/media/drivers/uvcvideo.rst
> @@ -157,7 +157,7 @@ Argument: struct uvc_xu_control_mapping
>   	__u8	name[32]	V4L2 control name
>   	__u8	entity[16]	UVC extension unit GUID
>   	__u8	selector	UVC control selector
> -	__u8	size		V4L2 control size (in bits)
> +	__u8	size		UVC control data size (in bits)
>   	__u8	offset		V4L2 control offset (in bits)
>   	enum v4l2_ctrl_type
>   		v4l2_type	V4L2 control type
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 93ae7ba5d0cc..5c4aa4b82218 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -436,7 +436,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>   		.id		= V4L2_CID_BRIGHTNESS,
>   		.entity		= UVC_GUID_UVC_PROCESSING,
>   		.selector	= UVC_PU_BRIGHTNESS_CONTROL,
> -		.size		= 16,
> +		.data_size	= 16,
>   		.offset		= 0,
>   		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
>   		.data_type	= UVC_CTRL_DATA_TYPE_SIGNED,
> @@ -445,7 +445,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>   		.id		= V4L2_CID_CONTRAST,
>   		.entity		= UVC_GUID_UVC_PROCESSING,
>   		.selector	= UVC_PU_CONTRAST_CONTROL,
> -		.size		= 16,
> +		.data_size	= 16,
>   		.offset		= 0,
>   		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
>   		.data_type	= UVC_CTRL_DATA_TYPE_UNSIGNED,
> @@ -454,7 +454,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>   		.id		= V4L2_CID_HUE,
>   		.entity		= UVC_GUID_UVC_PROCESSING,
>   		.selector	= UVC_PU_HUE_CONTROL,
> -		.size		= 16,
> +		.data_size	= 16,
>   		.offset		= 0,
>   		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
>   		.data_type	= UVC_CTRL_DATA_TYPE_SIGNED,
> @@ -465,7 +465,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>   		.id		= V4L2_CID_SATURATION,
>   		.entity		= UVC_GUID_UVC_PROCESSING,
>   		.selector	= UVC_PU_SATURATION_CONTROL,
> -		.size		= 16,
> +		.data_size	= 16,
>   		.offset		= 0,
>   		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
>   		.data_type	= UVC_CTRL_DATA_TYPE_UNSIGNED,
> @@ -474,7 +474,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>   		.id		= V4L2_CID_SHARPNESS,
>   		.entity		= UVC_GUID_UVC_PROCESSING,
>   		.selector	= UVC_PU_SHARPNESS_CONTROL,
> -		.size		= 16,
> +		.data_size	= 16,
>   		.offset		= 0,
>   		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
>   		.data_type	= UVC_CTRL_DATA_TYPE_UNSIGNED,
> @@ -483,7 +483,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>   		.id		= V4L2_CID_GAMMA,
>   		.entity		= UVC_GUID_UVC_PROCESSING,
>   		.selector	= UVC_PU_GAMMA_CONTROL,
> -		.size		= 16,
> +		.data_size	= 16,
>   		.offset		= 0,
>   		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
>   		.data_type	= UVC_CTRL_DATA_TYPE_UNSIGNED,
> @@ -492,7 +492,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>   		.id		= V4L2_CID_BACKLIGHT_COMPENSATION,
>   		.entity		= UVC_GUID_UVC_PROCESSING,
>   		.selector	= UVC_PU_BACKLIGHT_COMPENSATION_CONTROL,
> -		.size		= 16,
> +		.data_size	= 16,
>   		.offset		= 0,
>   		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
>   		.data_type	= UVC_CTRL_DATA_TYPE_UNSIGNED,
> @@ -501,7 +501,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>   		.id		= V4L2_CID_GAIN,
>   		.entity		= UVC_GUID_UVC_PROCESSING,
>   		.selector	= UVC_PU_GAIN_CONTROL,
> -		.size		= 16,
> +		.data_size	= 16,
>   		.offset		= 0,
>   		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
>   		.data_type	= UVC_CTRL_DATA_TYPE_UNSIGNED,
> @@ -510,7 +510,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>   		.id		= V4L2_CID_HUE_AUTO,
>   		.entity		= UVC_GUID_UVC_PROCESSING,
>   		.selector	= UVC_PU_HUE_AUTO_CONTROL,
> -		.size		= 1,
> +		.data_size	= 1,
>   		.offset		= 0,
>   		.v4l2_type	= V4L2_CTRL_TYPE_BOOLEAN,
>   		.data_type	= UVC_CTRL_DATA_TYPE_BOOLEAN,
> @@ -520,7 +520,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>   		.id		= V4L2_CID_EXPOSURE_AUTO,
>   		.entity		= UVC_GUID_UVC_CAMERA,
>   		.selector	= UVC_CT_AE_MODE_CONTROL,
> -		.size		= 4,
> +		.data_size	= 4,
>   		.offset		= 0,
>   		.v4l2_type	= V4L2_CTRL_TYPE_MENU,
>   		.data_type	= UVC_CTRL_DATA_TYPE_BITMASK,
> @@ -532,7 +532,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>   		.id		= V4L2_CID_EXPOSURE_AUTO_PRIORITY,
>   		.entity		= UVC_GUID_UVC_CAMERA,
>   		.selector	= UVC_CT_AE_PRIORITY_CONTROL,
> -		.size		= 1,
> +		.data_size	= 1,
>   		.offset		= 0,
>   		.v4l2_type	= V4L2_CTRL_TYPE_BOOLEAN,
>   		.data_type	= UVC_CTRL_DATA_TYPE_BOOLEAN,
> @@ -541,7 +541,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>   		.id		= V4L2_CID_EXPOSURE_ABSOLUTE,
>   		.entity		= UVC_GUID_UVC_CAMERA,
>   		.selector	= UVC_CT_EXPOSURE_TIME_ABSOLUTE_CONTROL,
> -		.size		= 32,
> +		.data_size	= 32,
>   		.offset		= 0,
>   		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
>   		.data_type	= UVC_CTRL_DATA_TYPE_UNSIGNED,
> @@ -552,7 +552,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>   		.id		= V4L2_CID_AUTO_WHITE_BALANCE,
>   		.entity		= UVC_GUID_UVC_PROCESSING,
>   		.selector	= UVC_PU_WHITE_BALANCE_TEMPERATURE_AUTO_CONTROL,
> -		.size		= 1,
> +		.data_size	= 1,
>   		.offset		= 0,
>   		.v4l2_type	= V4L2_CTRL_TYPE_BOOLEAN,
>   		.data_type	= UVC_CTRL_DATA_TYPE_BOOLEAN,
> @@ -562,7 +562,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>   		.id		= V4L2_CID_WHITE_BALANCE_TEMPERATURE,
>   		.entity		= UVC_GUID_UVC_PROCESSING,
>   		.selector	= UVC_PU_WHITE_BALANCE_TEMPERATURE_CONTROL,
> -		.size		= 16,
> +		.data_size	= 16,
>   		.offset		= 0,
>   		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
>   		.data_type	= UVC_CTRL_DATA_TYPE_UNSIGNED,
> @@ -573,7 +573,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>   		.id		= V4L2_CID_AUTO_WHITE_BALANCE,
>   		.entity		= UVC_GUID_UVC_PROCESSING,
>   		.selector	= UVC_PU_WHITE_BALANCE_COMPONENT_AUTO_CONTROL,
> -		.size		= 1,
> +		.data_size	= 1,
>   		.offset		= 0,
>   		.v4l2_type	= V4L2_CTRL_TYPE_BOOLEAN,
>   		.data_type	= UVC_CTRL_DATA_TYPE_BOOLEAN,
> @@ -584,7 +584,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>   		.id		= V4L2_CID_BLUE_BALANCE,
>   		.entity		= UVC_GUID_UVC_PROCESSING,
>   		.selector	= UVC_PU_WHITE_BALANCE_COMPONENT_CONTROL,
> -		.size		= 16,
> +		.data_size	= 16,
>   		.offset		= 0,
>   		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
>   		.data_type	= UVC_CTRL_DATA_TYPE_SIGNED,
> @@ -595,7 +595,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>   		.id		= V4L2_CID_RED_BALANCE,
>   		.entity		= UVC_GUID_UVC_PROCESSING,
>   		.selector	= UVC_PU_WHITE_BALANCE_COMPONENT_CONTROL,
> -		.size		= 16,
> +		.data_size	= 16,
>   		.offset		= 16,
>   		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
>   		.data_type	= UVC_CTRL_DATA_TYPE_SIGNED,
> @@ -606,7 +606,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>   		.id		= V4L2_CID_FOCUS_ABSOLUTE,
>   		.entity		= UVC_GUID_UVC_CAMERA,
>   		.selector	= UVC_CT_FOCUS_ABSOLUTE_CONTROL,
> -		.size		= 16,
> +		.data_size	= 16,
>   		.offset		= 0,
>   		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
>   		.data_type	= UVC_CTRL_DATA_TYPE_UNSIGNED,
> @@ -617,7 +617,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>   		.id		= V4L2_CID_FOCUS_AUTO,
>   		.entity		= UVC_GUID_UVC_CAMERA,
>   		.selector	= UVC_CT_FOCUS_AUTO_CONTROL,
> -		.size		= 1,
> +		.data_size	= 1,
>   		.offset		= 0,
>   		.v4l2_type	= V4L2_CTRL_TYPE_BOOLEAN,
>   		.data_type	= UVC_CTRL_DATA_TYPE_BOOLEAN,
> @@ -627,7 +627,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>   		.id		= V4L2_CID_IRIS_ABSOLUTE,
>   		.entity		= UVC_GUID_UVC_CAMERA,
>   		.selector	= UVC_CT_IRIS_ABSOLUTE_CONTROL,
> -		.size		= 16,
> +		.data_size	= 16,
>   		.offset		= 0,
>   		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
>   		.data_type	= UVC_CTRL_DATA_TYPE_UNSIGNED,
> @@ -636,7 +636,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>   		.id		= V4L2_CID_IRIS_RELATIVE,
>   		.entity		= UVC_GUID_UVC_CAMERA,
>   		.selector	= UVC_CT_IRIS_RELATIVE_CONTROL,
> -		.size		= 8,
> +		.data_size	= 8,
>   		.offset		= 0,
>   		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
>   		.data_type	= UVC_CTRL_DATA_TYPE_SIGNED,
> @@ -645,7 +645,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>   		.id		= V4L2_CID_ZOOM_ABSOLUTE,
>   		.entity		= UVC_GUID_UVC_CAMERA,
>   		.selector	= UVC_CT_ZOOM_ABSOLUTE_CONTROL,
> -		.size		= 16,
> +		.data_size	= 16,
>   		.offset		= 0,
>   		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
>   		.data_type	= UVC_CTRL_DATA_TYPE_UNSIGNED,
> @@ -654,7 +654,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>   		.id		= V4L2_CID_ZOOM_CONTINUOUS,
>   		.entity		= UVC_GUID_UVC_CAMERA,
>   		.selector	= UVC_CT_ZOOM_RELATIVE_CONTROL,
> -		.size		= 0,
> +		.data_size	= 0,
>   		.offset		= 0,
>   		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
>   		.data_type	= UVC_CTRL_DATA_TYPE_SIGNED,
> @@ -665,7 +665,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>   		.id		= V4L2_CID_PAN_ABSOLUTE,
>   		.entity		= UVC_GUID_UVC_CAMERA,
>   		.selector	= UVC_CT_PANTILT_ABSOLUTE_CONTROL,
> -		.size		= 32,
> +		.data_size	= 32,
>   		.offset		= 0,
>   		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
>   		.data_type	= UVC_CTRL_DATA_TYPE_SIGNED,
> @@ -674,7 +674,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>   		.id		= V4L2_CID_TILT_ABSOLUTE,
>   		.entity		= UVC_GUID_UVC_CAMERA,
>   		.selector	= UVC_CT_PANTILT_ABSOLUTE_CONTROL,
> -		.size		= 32,
> +		.data_size	= 32,
>   		.offset		= 32,
>   		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
>   		.data_type	= UVC_CTRL_DATA_TYPE_SIGNED,
> @@ -683,7 +683,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>   		.id		= V4L2_CID_PAN_SPEED,
>   		.entity		= UVC_GUID_UVC_CAMERA,
>   		.selector	= UVC_CT_PANTILT_RELATIVE_CONTROL,
> -		.size		= 16,
> +		.data_size	= 16,
>   		.offset		= 0,
>   		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
>   		.data_type	= UVC_CTRL_DATA_TYPE_SIGNED,
> @@ -694,7 +694,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>   		.id		= V4L2_CID_TILT_SPEED,
>   		.entity		= UVC_GUID_UVC_CAMERA,
>   		.selector	= UVC_CT_PANTILT_RELATIVE_CONTROL,
> -		.size		= 16,
> +		.data_size	= 16,
>   		.offset		= 16,
>   		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
>   		.data_type	= UVC_CTRL_DATA_TYPE_SIGNED,
> @@ -705,7 +705,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>   		.id		= V4L2_CID_PRIVACY,
>   		.entity		= UVC_GUID_UVC_CAMERA,
>   		.selector	= UVC_CT_PRIVACY_CONTROL,
> -		.size		= 1,
> +		.data_size	= 1,
>   		.offset		= 0,
>   		.v4l2_type	= V4L2_CTRL_TYPE_BOOLEAN,
>   		.data_type	= UVC_CTRL_DATA_TYPE_BOOLEAN,
> @@ -714,7 +714,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>   		.id		= V4L2_CID_PRIVACY,
>   		.entity		= UVC_GUID_EXT_GPIO_CONTROLLER,
>   		.selector	= UVC_CT_PRIVACY_CONTROL,
> -		.size		= 1,
> +		.data_size	= 1,
>   		.offset		= 0,
>   		.v4l2_type	= V4L2_CTRL_TYPE_BOOLEAN,
>   		.data_type	= UVC_CTRL_DATA_TYPE_BOOLEAN,
> @@ -726,7 +726,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings_uvc11[] = {
>   		.id		= V4L2_CID_POWER_LINE_FREQUENCY,
>   		.entity		= UVC_GUID_UVC_PROCESSING,
>   		.selector	= UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
> -		.size		= 2,
> +		.data_size	= 2,
>   		.offset		= 0,
>   		.v4l2_type	= V4L2_CTRL_TYPE_MENU,
>   		.data_type	= UVC_CTRL_DATA_TYPE_ENUM,
> @@ -740,7 +740,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings_uvc15[] = {
>   		.id		= V4L2_CID_POWER_LINE_FREQUENCY,
>   		.entity		= UVC_GUID_UVC_PROCESSING,
>   		.selector	= UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
> -		.size		= 2,
> +		.data_size	= 2,
>   		.offset		= 0,
>   		.v4l2_type	= V4L2_CTRL_TYPE_MENU,
>   		.data_type	= UVC_CTRL_DATA_TYPE_ENUM,
> @@ -769,7 +769,7 @@ static inline void uvc_clear_bit(u8 *data, int bit)
>   }
>   
>   /*
> - * Extract the bit string specified by mapping->offset and mapping->size
> + * Extract the bit string specified by mapping->offset and mapping->data_size
>    * from the little-endian data stored at 'data' and return the result as
>    * a signed 32bit integer. Sign extension will be performed if the mapping
>    * references a signed data type.
> @@ -777,7 +777,7 @@ static inline void uvc_clear_bit(u8 *data, int bit)
>   static s32 uvc_get_le_value(struct uvc_control_mapping *mapping,
>   	u8 query, const u8 *data)
>   {
> -	int bits = mapping->size;
> +	int bits = mapping->data_size;
>   	int offset = mapping->offset;
>   	s32 value = 0;
>   	u8 mask;
> @@ -800,19 +800,19 @@ static s32 uvc_get_le_value(struct uvc_control_mapping *mapping,
>   
>   	/* Sign-extend the value if needed. */
>   	if (mapping->data_type == UVC_CTRL_DATA_TYPE_SIGNED)
> -		value |= -(value & (1 << (mapping->size - 1)));
> +		value |= -(value & (1 << (mapping->data_size - 1)));
>   
>   	return value;
>   }
>   
>   /*
> - * Set the bit string specified by mapping->offset and mapping->size
> + * Set the bit string specified by mapping->offset and mapping->data_size
>    * in the little-endian data stored at 'data' to the value 'value'.
>    */
>   static void uvc_set_le_value(struct uvc_control_mapping *mapping,
>   	s32 value, u8 *data)
>   {
> -	int bits = mapping->size;
> +	int bits = mapping->data_size;
>   	int offset = mapping->offset;
>   	u8 mask;
>   
> @@ -1890,7 +1890,7 @@ int uvc_ctrl_set(struct uvc_fh *handle,
>   	 * needs to be loaded from the device to perform the read-modify-write
>   	 * operation.
>   	 */
> -	if ((ctrl->info.size * 8) != mapping->size) {
> +	if ((ctrl->info.size * 8) != mapping->data_size) {
>   		ret = __uvc_ctrl_load_cur(chain, ctrl);
>   		if (ret < 0)
>   			return ret;
> @@ -2379,8 +2379,8 @@ int uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
>   	}
>   
>   	/* Validate the user-provided bit-size and offset */
> -	if (mapping->size > 32 ||
> -	    mapping->offset + mapping->size > ctrl->info.size * 8) {
> +	if (mapping->data_size > 32 ||
> +	    mapping->offset + mapping->data_size > ctrl->info.size * 8) {
>   		ret = -EINVAL;
>   		goto done;
>   	}
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 215fb483efb0..06317843c486 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2382,7 +2382,7 @@ static const struct uvc_control_mapping uvc_ctrl_power_line_mapping_limited = {
>   	.id		= V4L2_CID_POWER_LINE_FREQUENCY,
>   	.entity		= UVC_GUID_UVC_PROCESSING,
>   	.selector	= UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
> -	.size		= 2,
> +	.data_size	= 2,
>   	.offset		= 0,
>   	.v4l2_type	= V4L2_CTRL_TYPE_MENU,
>   	.data_type	= UVC_CTRL_DATA_TYPE_ENUM,
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index e807e348aa41..36ff1d0d6edb 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -51,7 +51,7 @@ static int uvc_ioctl_ctrl_map(struct uvc_video_chain *chain,
>   	}
>   	memcpy(map->entity, xmap->entity, sizeof(map->entity));
>   	map->selector = xmap->selector;
> -	map->size = xmap->size;
> +	map->data_size = xmap->size;
>   	map->offset = xmap->offset;
>   	map->v4l2_type = xmap->v4l2_type;
>   	map->data_type = xmap->data_type;
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index b2ee3d59a4c8..8f7938205a63 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -111,7 +111,11 @@ struct uvc_control_mapping {
>   	u8 entity[16];
>   	u8 selector;
>   
> -	u8 size;
> +	/* Size of the v4l2 control. Required for compound controls. */
> +	u8 v4l2_size;
> +	/* UVC data size. Required for all controls. */
> +	u8 data_size;
> +
>   	u8 offset;
>   	enum v4l2_ctrl_type v4l2_type;
>   	u32 data_type;
