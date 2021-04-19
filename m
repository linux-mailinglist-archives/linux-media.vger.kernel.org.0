Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3111036422B
	for <lists+linux-media@lfdr.de>; Mon, 19 Apr 2021 15:01:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237923AbhDSNBn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Apr 2021 09:01:43 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:47482 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231942AbhDSNBn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Apr 2021 09:01:43 -0400
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4B6A9499;
        Mon, 19 Apr 2021 15:01:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618837272;
        bh=jVi45+nmBOdnuRIu03XxyUkvbmhD3ikNH7N0HqPISzM=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=qNxJ1CnkgJILpViGWsZwYdTIGKIuc+d99DxP65JB68bQHdfGSkAl0K2aiszGS3KZS
         k+tXny/CjSZGXfWALglKES8gLvpJF8rIejhIbckSrUHLiBxXwHv2WEbORl0lyHVZKz
         YXcntI3EpvroTe2z5VWHDRMxcdfms29WAUh82oH0=
Subject: Re: [PATCH 26/28] media: ti-vpe: cal: init ctx->v_fmt correctly in MC
 mode
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Benoit Parrot <bparrot@ti.com>, Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
 <20210412113457.328012-27-tomi.valkeinen@ideasonboard.com>
 <YHwyauEvgB8On72g@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <24b00821-0c6c-5c93-3316-e1d8f831c0e8@ideasonboard.com>
Date:   Mon, 19 Apr 2021 16:01:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YHwyauEvgB8On72g@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/04/2021 16:21, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Mon, Apr 12, 2021 at 02:34:55PM +0300, Tomi Valkeinen wrote:
>> CAL driver enumerates mbus codes in the connected subdev to create a
>> list of supported formats reported to userspace, and initializes
>> ctx->v_fmt and ctx->fmtinfo to one of those formats.
>>
>> This works fine for legacy mode, but is not correct for MC mode, and the
>> list is not even used in MC mode.
>>
>> Fix this by adding a new function, cal_ctx_v4l2_init_mc_format, which
>> only initializes ctx->v_fmt and ctx->fmtinfo to a default value.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/media/platform/ti-vpe/cal-video.c | 45 ++++++++++++++++++++---
>>   drivers/media/platform/ti-vpe/cal.h       |  2 +-
>>   2 files changed, 40 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
>> index 0494cd04b9a5..95066cca128a 100644
>> --- a/drivers/media/platform/ti-vpe/cal-video.c
>> +++ b/drivers/media/platform/ti-vpe/cal-video.c
>> @@ -879,26 +879,59 @@ static int cal_ctx_v4l2_init_formats(struct cal_ctx *ctx)
>>   	return 0;
>>   }
>>   
>> +static int cal_ctx_v4l2_init_mc_format(struct cal_ctx *ctx)
>> +{
>> +	const struct cal_format_info *fmtinfo;
>> +	struct v4l2_pix_format *pix_fmt = &ctx->v_fmt.fmt.pix;
>> +
>> +	fmtinfo = cal_format_by_code(MEDIA_BUS_FMT_UYVY8_2X8);
> 
> 	if (WARN_ON(!fmt_info))
> 		return;
> 
> As this really can't happen.

Can't, but if it does and we don't handle the error, the driver will 
probably crash somewhere as ctx->fmtinfo is NULL. So maybe just drop the 
'if' totally, and we'll get that crash early, below via fmtinfo->fourcc.

> 
>> +	if (!fmtinfo)
>> +		return -EINVAL;
>> +
>> +	pix_fmt->width = 640;
>> +	pix_fmt->height = 480;
>> +	pix_fmt->field = V4L2_FIELD_NONE;
>> +	pix_fmt->colorspace = V4L2_COLORSPACE_SRGB;
>> +	pix_fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
>> +	pix_fmt->quantization = V4L2_QUANTIZATION_LIM_RANGE;
>> +	pix_fmt->xfer_func = V4L2_XFER_FUNC_SRGB;
>> +	pix_fmt->pixelformat = fmtinfo->fourcc;
>> +
>> +	ctx->v_fmt.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
>> +
>> +	/* Save current format */
>> +	cal_calc_format_size(ctx, fmtinfo, &ctx->v_fmt);
>> +	ctx->fmtinfo = fmtinfo;
>> +
>> +	return 0;
>> +}
>> +
>>   void cal_ctx_v4l2_register(struct cal_ctx *ctx)
>>   {
>>   	struct video_device *vfd = &ctx->vdev;
>>   	int ret;
>>   
>> -	ret = cal_ctx_v4l2_init_formats(ctx);
>> -	if (ret) {
>> -		ctx_err(ctx, "Failed to init formats: %d\n", ret);
>> -		return;
>> -	}
>> -
>>   	if (!cal_mc_api) {
>>   		struct v4l2_ctrl_handler *hdl = &ctx->ctrl_handler;
>>   
>> +		ret = cal_ctx_v4l2_init_formats(ctx);
>> +		if (ret) {
>> +			ctx_err(ctx, "Failed to init formats: %d\n", ret);
>> +			return;
>> +		}
>> +
>>   		ret = v4l2_ctrl_add_handler(hdl, ctx->phy->source->ctrl_handler,
>>   					    NULL, true);
>>   		if (ret < 0) {
>>   			ctx_err(ctx, "Failed to add source ctrl handler\n");
>>   			return;
>>   		}
>> +	} else {
>> +		ret = cal_ctx_v4l2_init_mc_format(ctx);
>> +		if (ret) {
>> +			ctx_err(ctx, "Failed to init format: %d\n", ret);
>> +			return;
>> +		}
> 
> And you can drop the error check here.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
>>   	}
>>   
>>   	ret = video_register_device(vfd, VFL_TYPE_VIDEO, cal_video_nr);
>> diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
>> index ad7d26c803eb..c941d2aec79f 100644
>> --- a/drivers/media/platform/ti-vpe/cal.h
>> +++ b/drivers/media/platform/ti-vpe/cal.h
>> @@ -213,7 +213,7 @@ struct cal_ctx {
>>   	/* Used to store current pixel format */
>>   	struct v4l2_format	v_fmt;
>>   
>> -	/* Current subdev enumerated format */
>> +	/* Current subdev enumerated format (legacy) */
>>   	const struct cal_format_info	**active_fmt;
>>   	unsigned int		num_active_fmt;
>>   
> 

