Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7720F256975
	for <lists+linux-media@lfdr.de>; Sat, 29 Aug 2020 19:39:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728244AbgH2RjS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Aug 2020 13:39:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728238AbgH2RjO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Aug 2020 13:39:14 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EFA0C061236
        for <linux-media@vger.kernel.org>; Sat, 29 Aug 2020 10:39:14 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 3587D299021
Subject: Re: [PATCH v3 06/10] media: staging: rkisp1: add a helper function to
 enumerate supported mbus formats on capture
To:     Helen Koike <helen.koike@collabora.com>,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com, mchehab@kernel.org,
        tfiga@chromium.org
References: <20200723132014.4597-1-dafna.hirschfeld@collabora.com>
 <20200723132014.4597-7-dafna.hirschfeld@collabora.com>
 <11983183-54cc-89a7-7fa4-f7a0e362ad7a@collabora.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <ea4ebc9e-c7de-e2b7-7281-82a6507c6d4a@collabora.com>
Date:   Sat, 29 Aug 2020 19:39:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <11983183-54cc-89a7-7fa4-f7a0e362ad7a@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Am 04.08.20 um 01:49 schrieb Helen Koike:
> Hi Dafna,
> 
> Thanks for the patch.
> 
> On 7/23/20 10:20 AM, Dafna Hirschfeld wrote:
>> Add a function 'rkisp1_cap_enum_mbus_codes' that receive
>> a pointer to 'v4l2_subdev_mbus_code_enum' and returns the
>> next supported mbus format of the capture. The function
>> assumes that pixel formats with identical 'mbus' are grouped
>> together in the hardcoded arrays, therefore the order of the
>> entries in the array 'rkisp1_sp_fmts' are adjusted.
>> This function is a helper for the media bus enumeration of
>> the source pad of the resizer entity.
>>
>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>> ---
>>   drivers/staging/media/rkisp1/rkisp1-capture.c | 77 ++++++++++++-------
>>   drivers/staging/media/rkisp1/rkisp1-common.h  |  8 ++
>>   2 files changed, 58 insertions(+), 27 deletions(-)
>>
>> diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
>> index 5dd91b5f82a4..4dabd07a3da9 100644
>> --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
>> +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
>> @@ -112,6 +112,13 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_mp_fmts[] = {
> 
> I would also add a comment in the beginning of this array saying that mbus
> should be grouped together for the sake of enum.
> 
>>   		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
>>   		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
>>   	},
>> +	/* yuv400 */
>> +	{
>> +		.fourcc = V4L2_PIX_FMT_GREY,
>> +		.uv_swap = 0,
>> +		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUVINT,
>> +		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
>> +	},
>>   	/* yuv420 */
>>   	{
>>   		.fourcc = V4L2_PIX_FMT_NV21,
>> @@ -144,13 +151,6 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_mp_fmts[] = {
>>   		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
>>   		.mbus = MEDIA_BUS_FMT_YUYV8_1_5X8,
>>   	},
>> -	/* yuv400 */
>> -	{
>> -		.fourcc = V4L2_PIX_FMT_GREY,
>> -		.uv_swap = 0,
>> -		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUVINT,
>> -		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
>> -	},
>>   	/* raw */
>>   	{
>>   		.fourcc = V4L2_PIX_FMT_SRGGB8,
>> @@ -236,6 +236,26 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_sp_fmts[] = {
>>   		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
>>   		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
>>   	},
>> +	/* yuv400 */
>> +	{
>> +		.fourcc = V4L2_PIX_FMT_GREY,
>> +		.uv_swap = 0,
>> +		.write_format = RKISP1_MI_CTRL_SP_WRITE_INT,
>> +		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV400,
>> +		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
>> +	},
>> +	/* rgb */
>> +	{
>> +		.fourcc = V4L2_PIX_FMT_XBGR32,
>> +		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
>> +		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_RGB888,
>> +		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
>> +	}, {
>> +		.fourcc = V4L2_PIX_FMT_RGB565,
>> +		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
>> +		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_RGB565,
>> +		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
>> +	},
>>   	/* yuv420 */
>>   	{
>>   		.fourcc = V4L2_PIX_FMT_NV21,
>> @@ -274,26 +294,6 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_sp_fmts[] = {
>>   		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV420,
>>   		.mbus = MEDIA_BUS_FMT_YUYV8_1_5X8,
>>   	},
>> -	/* yuv400 */
>> -	{
>> -		.fourcc = V4L2_PIX_FMT_GREY,
>> -		.uv_swap = 0,
>> -		.write_format = RKISP1_MI_CTRL_SP_WRITE_INT,
>> -		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV400,
>> -		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
>> -	},
>> -	/* rgb */
>> -	{
>> -		.fourcc = V4L2_PIX_FMT_XBGR32,
>> -		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
>> -		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_RGB888,
>> -		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
>> -	}, {
>> -		.fourcc = V4L2_PIX_FMT_RGB565,
>> -		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
>> -		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_RGB565,
>> -		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
>> -	},
>>   };
>>   
>>   static const struct rkisp1_capture_config rkisp1_capture_config_mp = {
>> @@ -334,6 +334,29 @@ rkisp1_vdev_to_node(struct video_device *vdev)
>>   	return container_of(vdev, struct rkisp1_vdev_node, vdev);
>>   }
>>   
>> +int rkisp1_cap_enum_mbus_codes(struct rkisp1_capture *cap,
>> +			       struct v4l2_subdev_mbus_code_enum *code)
>> +{
>> +	const struct rkisp1_capture_fmt_cfg *fmts = cap->config->fmts;
>> +	u32 curr_mbus = fmts[0].mbus;
> 
> Maybe you could use code->code as the current, since in case of error
> -EINVAL should be returned and this value should be ignored iirc.

Hi, but code->code is an unknown value. The aim of this function is to fill it
according to code->index.

Thanks,
Dafna

> 
>> +	int i, n = 0;
> 
> unsigned
> 
>> +
>> +	if (code->index == 0) {
> 
> if (!code->index)
> 
>> +		code->code = fmts[0].mbus;
>> +		return 0;
>> +	}
>> +
>> +	for (i = 1; i < cap->config->fmt_size; i++)
>> +		if (fmts[i].mbus != curr_mbus) {
> 
> You can decrease one indentation level with:
> 
> 		if (fmts[i].mbus == curr_mbus)
> 				continue;
> 
> Regards,
> Helen
> 
>> +			curr_mbus = fmts[i].mbus;
>> +			if (++n == code->index) {
>> +				code->code = curr_mbus;
>> +				return 0;
>> +			}
>> +		}
>> +	return -EINVAL;
>> +}
>> +
>>   /* ----------------------------------------------------------------------------
>>    * Stream operations for self-picture path (sp) and main-picture path (mp)
>>    */
>> diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
>> index 3dc51d703f73..73e1963cc47a 100644
>> --- a/drivers/staging/media/rkisp1/rkisp1-common.h
>> +++ b/drivers/staging/media/rkisp1/rkisp1-common.h
>> @@ -297,6 +297,14 @@ static inline u32 rkisp1_read(struct rkisp1_device *rkisp1, unsigned int addr)
>>   	return readl(rkisp1->base_addr + addr);
>>   }
>>   
>> +/*
>> + * rkisp1_cap_enum_mbus_codes - A helper function that return the i'th supported mbus code
>> + *				of the capture entity. This is used to enumerate the supported
>> + *				mbus codes on the source pad of the resizer.
>> + */
>> +int rkisp1_cap_enum_mbus_codes(struct rkisp1_capture *cap,
>> +			       struct v4l2_subdev_mbus_code_enum *code);
>> +
>>   void rkisp1_sd_adjust_crop_rect(struct v4l2_rect *crop,
>>   				const struct v4l2_rect *bounds);
>>   
>>
