Return-Path: <linux-media+bounces-36258-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 96ACDAED7C9
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 10:50:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C55641754A9
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 08:50:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F563242D92;
	Mon, 30 Jun 2025 08:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="j0AH2rKE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE4621CA14
	for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 08:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751273401; cv=none; b=b1ZfYIJsOfTssum2v3IZVJk+SUcSnbMrny9oPPI8xjREcS3U5zvFLD51XkhW1HoTMxoTMFekvV2OMRXkM+9hpo6v40HSAZVy28zcQGeqspIhij9t6x07h9hi2whmWDkak6RLkDY/VyYXxEt7KDUCT09vH5rDCsbSIlkOV9WO5Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751273401; c=relaxed/simple;
	bh=NTeztTb984yawQ9JuWp0M1aVH1MJp8+JbWQc11e8ODg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ucQ05YH+doceeq97xE53Dls9R0RJhm79xo+QtBrZJH6iJeWfIU8xIjlo7KFXJcCN6mXyCP0z2VuIsFzFs7vb4/I141vjTHwtgRgr9zOvxLabZVZb8v7zYGpqJZrSA7Wv59ZD8DUoStXJOBDNTK7o/cc8DlZZOZRDvu0X59PISS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=j0AH2rKE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9E5F8928;
	Mon, 30 Jun 2025 10:49:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751273376;
	bh=NTeztTb984yawQ9JuWp0M1aVH1MJp8+JbWQc11e8ODg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=j0AH2rKEnaC20g6Bsul1XOs5LwJvIGsv+nj1sqrzi8jJFGTaAyy8ORkLL5g30N+k7
	 jfyTWeZmdIXa5MN130tGDBbn7OTPwpwS/IlwwGzEsTYgb6b4ZT/vQxjNUMrF79xnZv
	 h/d27mhswxY38t5siHGevTxfZ1V1fBiX+zzBfQ84=
Message-ID: <f19463f3-d74c-49b7-8f96-d862f6bfebdf@ideasonboard.com>
Date: Mon, 30 Jun 2025 09:49:55 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/6] media: rzg2l-cru: Support multiple mbus codes per
 pixel format
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, jacopo.mondi@ideasonboard.com,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Daniel Scally <dan.scally+renesas@ideasonboard.com>
References: <20250625-rzg2l-cru-v6-0-a9099ed26c14@ideasonboard.com>
 <20250625-rzg2l-cru-v6-5-a9099ed26c14@ideasonboard.com>
 <20250629234531.GA24641@pendragon.ideasonboard.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
Autocrypt: addr=dan.scally@ideasonboard.com; keydata=
 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
In-Reply-To: <20250629234531.GA24641@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Morning Laurent

On 30/06/2025 00:45, Laurent Pinchart wrote:
> Hi Dan,
>
> On Wed, Jun 25, 2025 at 10:20:31AM +0100, Daniel Scally wrote:
>> From: Daniel Scally <dan.scally+renesas@ideasonboard.com>
>>
>> As a preliminary step for supporting the CRU pixel formats, extend
>> the driver such that multiple media bus codes can support each of
>> the output pixel formats.
>>
>> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>> Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>
>> ---
>> Changes in v5:
>>
>> 	- None
>>
>> Changes in v4:
>>
>> 	- None
>>
>> Changes in v3:
>>
>> 	- New patch due to changes to patch 1
>> ---
>>   .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h   |  8 ++-
>>   .../media/platform/renesas/rzg2l-cru/rzg2l-ip.c    | 67 +++++++++++++++++-----
>>   .../media/platform/renesas/rzg2l-cru/rzg2l-video.c |  2 +-
>>   3 files changed, 61 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
>> index 8d74bdfae7c854f8f4c9c82303b455ef8c6d5db3..49b11d0b814850042d1b3ca3b72725d0220c2987 100644
>> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
>> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
>> @@ -71,7 +71,11 @@ struct rzg2l_cru_ip {
>>    * @yuv: Flag to indicate whether the format is YUV-based.
>>    */
>>   struct rzg2l_cru_ip_format {
>> -	u32 code;
>> +	/*
>> +	 * RAW output formats might be produced by RAW media codes with any one
>> +	 * of the 4 common bayer patterns.
>> +	 */
>> +	u32 codes[4];
> It looks like you forgot to update the documentation.
I'm sorry, I'm confused; I can see that I forgot to update the references to the pixel formats in 
patch 1, but I can't see what Documentation needs updating for this patch.
>   Please make sure
> to build documentation when submitting a patch series.
>
> You can send a v6.1 of this patch as a reply, no need to post a full v7.

Ack



Thanks

Dan

>
>>   	u32 datatype;
>>   	u32 format;
>>   	u32 icndmr;
>> @@ -190,6 +194,8 @@ struct v4l2_mbus_framefmt *rzg2l_cru_ip_get_src_fmt(struct rzg2l_cru_dev *cru);
>>   const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int code);
>>   const struct rzg2l_cru_ip_format *rzg2l_cru_ip_format_to_fmt(u32 format);
>>   const struct rzg2l_cru_ip_format *rzg2l_cru_ip_index_to_fmt(u32 index);
>> +bool rzg2l_cru_ip_fmt_supports_mbus_code(const struct rzg2l_cru_ip_format *fmt,
>> +					 unsigned int code);
>>   
>>   void rzg2l_cru_enable_interrupts(struct rzg2l_cru_dev *cru);
>>   void rzg2l_cru_disable_interrupts(struct rzg2l_cru_dev *cru);
>> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
>> index 15fc1028082add27ad3d6fa9e1314b6240ff0d4e..fbbcdb96c4570baf07cc9685c2fc847fb489df89 100644
>> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
>> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
>> @@ -13,35 +13,45 @@
>>   
>>   static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
>>   	{
>> -		.code = MEDIA_BUS_FMT_UYVY8_1X16,
>> +		.codes = {
>> +			MEDIA_BUS_FMT_UYVY8_1X16,
>> +		},
>>   		.datatype = MIPI_CSI2_DT_YUV422_8B,
>>   		.format = V4L2_PIX_FMT_UYVY,
>>   		.icndmr = ICnDMR_YCMODE_UYVY,
>>   		.yuv = true,
>>   	},
>>   	{
>> -		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
>> +		.codes = {
>> +			MEDIA_BUS_FMT_SBGGR8_1X8,
>> +		},
>>   		.format = V4L2_PIX_FMT_SBGGR8,
>>   		.datatype = MIPI_CSI2_DT_RAW8,
>>   		.icndmr = 0,
>>   		.yuv = false,
>>   	},
>>   	{
>> -		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
>> +		.codes = {
>> +			MEDIA_BUS_FMT_SGBRG8_1X8,
>> +		},
>>   		.format = V4L2_PIX_FMT_SGBRG8,
>>   		.datatype = MIPI_CSI2_DT_RAW8,
>>   		.icndmr = 0,
>>   		.yuv = false,
>>   	},
>>   	{
>> -		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
>> +		.codes = {
>> +			MEDIA_BUS_FMT_SGRBG8_1X8,
>> +		},
>>   		.format = V4L2_PIX_FMT_SGRBG8,
>>   		.datatype = MIPI_CSI2_DT_RAW8,
>>   		.icndmr = 0,
>>   		.yuv = false,
>>   	},
>>   	{
>> -		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
>> +		.codes = {
>> +			MEDIA_BUS_FMT_SRGGB8_1X8,
>> +		},
>>   		.format = V4L2_PIX_FMT_SRGGB8,
>>   		.datatype = MIPI_CSI2_DT_RAW8,
>>   		.icndmr = 0,
>> @@ -51,11 +61,14 @@ static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
>>   
>>   const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int code)
>>   {
>> -	unsigned int i;
>> +	unsigned int i, j;
>>   
>> -	for (i = 0; i < ARRAY_SIZE(rzg2l_cru_ip_formats); i++)
>> -		if (rzg2l_cru_ip_formats[i].code == code)
>> -			return &rzg2l_cru_ip_formats[i];
>> +	for (i = 0; i < ARRAY_SIZE(rzg2l_cru_ip_formats); i++) {
>> +		for (j = 0; j < ARRAY_SIZE(rzg2l_cru_ip_formats[i].codes); j++) {
>> +			if (rzg2l_cru_ip_formats[i].codes[j] == code)
>> +				return &rzg2l_cru_ip_formats[i];
>> +		}
>> +	}
>>   
>>   	return NULL;
>>   }
>> @@ -80,6 +93,17 @@ const struct rzg2l_cru_ip_format *rzg2l_cru_ip_index_to_fmt(u32 index)
>>   	return &rzg2l_cru_ip_formats[index];
>>   }
>>   
>> +bool rzg2l_cru_ip_fmt_supports_mbus_code(const struct rzg2l_cru_ip_format *fmt,
>> +					 unsigned int code)
>> +{
>> +	unsigned int i;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(fmt->codes); i++)
>> +		if (fmt->codes[i] == code)
>> +			return true;
>> +
>> +	return false;
>> +}
>>   struct v4l2_mbus_framefmt *rzg2l_cru_ip_get_src_fmt(struct rzg2l_cru_dev *cru)
>>   {
>>   	struct v4l2_subdev_state *state;
>> @@ -157,7 +181,7 @@ static int rzg2l_cru_ip_set_format(struct v4l2_subdev *sd,
>>   	sink_format = v4l2_subdev_state_get_format(state, fmt->pad);
>>   
>>   	if (!rzg2l_cru_ip_code_to_fmt(fmt->format.code))
>> -		sink_format->code = rzg2l_cru_ip_formats[0].code;
>> +		sink_format->code = rzg2l_cru_ip_formats[0].codes[0];
>>   	else
>>   		sink_format->code = fmt->format.code;
>>   
>> @@ -183,11 +207,26 @@ static int rzg2l_cru_ip_enum_mbus_code(struct v4l2_subdev *sd,
>>   				       struct v4l2_subdev_state *state,
>>   				       struct v4l2_subdev_mbus_code_enum *code)
>>   {
>> -	if (code->index >= ARRAY_SIZE(rzg2l_cru_ip_formats))
>> -		return -EINVAL;
>> +	unsigned int index = code->index;
>> +	unsigned int i, j;
>>   
>> -	code->code = rzg2l_cru_ip_formats[code->index].code;
>> -	return 0;
>> +	for (i = 0; i < ARRAY_SIZE(rzg2l_cru_ip_formats); i++) {
>> +		const struct rzg2l_cru_ip_format *fmt = &rzg2l_cru_ip_formats[i];
>> +
>> +		for (j = 0; j < ARRAY_SIZE(fmt->codes); j++) {
>> +			if (!fmt->codes[j])
>> +				continue;
>> +
>> +			if (!index) {
>> +				code->code = fmt->codes[j];
>> +				return 0;
>> +			}
>> +
>> +			index--;
>> +		}
>> +	}
>> +
>> +	return -EINVAL;
>>   }
>>   
>>   static int rzg2l_cru_ip_enum_frame_size(struct v4l2_subdev *sd,
>> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
>> index 650a23f7b5bd61ee035dd35d1754c5d9b5e614f6..8e83eb5ed5c32e1ee1a8355dc6144eb18ca598cf 100644
>> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
>> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
>> @@ -1147,7 +1147,7 @@ static int rzg2l_cru_video_link_validate(struct media_link *link)
>>   	if (fmt.format.width != cru->format.width ||
>>   	    fmt.format.height != cru->format.height ||
>>   	    fmt.format.field != cru->format.field ||
>> -	    video_fmt->code != fmt.format.code)
>> +	    !rzg2l_cru_ip_fmt_supports_mbus_code(video_fmt, fmt.format.code))
>>   		return -EPIPE;
>>   
>>   	return 0;

