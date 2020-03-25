Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B84F192EE5
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 18:08:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727281AbgCYRIZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 13:08:25 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:44444 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726102AbgCYRIY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 13:08:24 -0400
Received: by mail-ot1-f65.google.com with SMTP id a49so2695663otc.11
        for <linux-media@vger.kernel.org>; Wed, 25 Mar 2020 10:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=/Go4G2Gu02MsezubRZQKV+CwV6DQ0yykDzL9Bm/GS08=;
        b=lwzonVel+kdi+8nBvewnV/FZ3aN7S6DHjVO9VT/g+j2yCADYe+d3Uf18vE6qCXXdOl
         pCWSve4JChXXhniLs0LF9n3WBgh4JkOU/wgh696XUHogHRTmklL5qjE4WjriCqDqqtK1
         HKdI1wTmu2++Mh8p8bulHFGet8bytk0jaPcAZv+ubKxgJj/IqIe28HBmm4mbMqhKHdFE
         4mW8updy95tGwCovhaWrdYekv3DpzsiyQ5R68eTEUA+47rzjUTry3z6uuVnS7a6j/9ml
         g/vBwbjTXstay1WbLi5U8Ww1OB7gLbwcEzS3b70o1oWub7F5zKGaIW9Pw4a2A3uMNIS4
         +NLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=/Go4G2Gu02MsezubRZQKV+CwV6DQ0yykDzL9Bm/GS08=;
        b=i7Iv34/wmUx3F9SKNxb3s4I5xwQwoVkw5sGdg+emGUejFYpvCba42S3aQtN5FCHuFA
         /oxdCghRF9toauB5cCPOqqnYNmXH9Xe8tazeIWSTub6i29TtNG5bZjvMcwoYY61WC28H
         3Irrmllsz/WlHaWNh07FljIH4bFL9zUw/q+5DE+VSRDqalpwOm5I4HuhApZCnnGOFqfo
         n32cDykVBC7eyFlkyfs1v4KQ6LyFi9qdE/MOvATLKWLrINHFngdrITvKvKDAQ1Tb6qSu
         b/B8ylKSvMO2PFjJ8BzuHP4ZURGlbVxg4qV4iXqqgjpTGjjmvwr231a679SWoPd+K/Zs
         +0zw==
X-Gm-Message-State: ANhLgQ0RQWbCyFMidtWEeMqNw49evZMOsvZzi8ADBYgvetV4NYRBKmr2
        EIdEkKgSacVLIJM6HMpR+ZPEbf6q
X-Google-Smtp-Source: ADFU+vuroSyXLywlUH/Spewg2KCeLwVw6YfKcVohyGsb7O50RqBWWVo9p6sLUl1drcslWwvHoZvkfA==
X-Received: by 2002:a05:6830:144e:: with SMTP id w14mr1269195otp.75.1585156103389;
        Wed, 25 Mar 2020 10:08:23 -0700 (PDT)
Received: from [192.168.2.82] (104-10-251-90.lightspeed.sntcca.sbcglobal.net. [104.10.251.90])
        by smtp.gmail.com with ESMTPSA id z15sm1655840oti.75.2020.03.25.10.08.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2020 10:08:22 -0700 (PDT)
Subject: Re: [PATCH 13/14] media: imx: imx7-mipi-csis: Don't use
 imx-media-utils helpers
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
References: <20200312234722.23483-1-laurent.pinchart@ideasonboard.com>
 <20200312234722.23483-14-laurent.pinchart@ideasonboard.com>
 <8b877c3f-e6ff-86ce-34d8-17cf4ed0395d@xs4all.nl>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <c2cf4dd6-cb89-cb2c-8fc7-9d2c82ad3272@gmail.com>
Date:   Wed, 25 Mar 2020 10:08:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <8b877c3f-e6ff-86ce-34d8-17cf4ed0395d@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 3/25/20 2:13 AM, Hans Verkuil wrote:
> On 3/13/20 12:47 AM, Laurent Pinchart wrote:
>> The imx7-mipi-csis only uses the imx_media_init_mbus_fmt() function from
>> the imx-media-utils helpers. The helpers don't support all the media bus
>> formats used by this driver, and are thus a bad fit. As the MIPI CSIS is
>> a standalone IP core that could be integrated in other SoCs, let's not
>> use the helper.
>>
>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> ---
>>   drivers/staging/media/imx/imx7-mipi-csis.c | 20 ++++++++++++--------
>>   1 file changed, 12 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
>> index 0829980d7af5..66ff73919371 100644
>> --- a/drivers/staging/media/imx/imx7-mipi-csis.c
>> +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
>> @@ -28,8 +28,6 @@
>>   #include <media/v4l2-fwnode.h>
>>   #include <media/v4l2-subdev.h>
>>   
>> -#include "imx-media.h"
>> -
>>   #define CSIS_DRIVER_NAME			"imx7-mipi-csis"
>>   #define CSIS_SUBDEV_NAME			CSIS_DRIVER_NAME
>>   
>> @@ -709,15 +707,21 @@ static int mipi_csis_init_cfg(struct v4l2_subdev *mipi_sd,
>>   	struct v4l2_mbus_framefmt *fmt_sink;
>>   	struct v4l2_mbus_framefmt *fmt_source;
>>   	enum v4l2_subdev_format_whence which;
>> -	int ret;
>>   
>>   	which = cfg ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
>>   	fmt_sink = mipi_csis_get_format(state, cfg, which, CSIS_PAD_SINK);
>> -	ret = imx_media_init_mbus_fmt(fmt_sink, MIPI_CSIS_DEF_PIX_WIDTH,
>> -				      MIPI_CSIS_DEF_PIX_HEIGHT, 0,
>> -				      V4L2_FIELD_NONE, NULL);
>> -	if (ret < 0)
>> -		return ret;
>> +
>> +	fmt_sink->code = MEDIA_BUS_FMT_UYVY8_2X8;
>> +	fmt_sink->width = MIPI_CSIS_DEF_PIX_WIDTH;
>> +	fmt_sink->height = MIPI_CSIS_DEF_PIX_HEIGHT;
>> +	fmt_sink->field = V4L2_FIELD_NONE;
>> +
>> +	fmt_sink->colorspace = V4L2_COLORSPACE_SMPTE170M;
> Why V4L2_COLORSPACE_SMPTE170M?
>
> After grepping a bit more in the imx code I see that the colorspace
> handling is wrong in any case, so I will just accept this patch, but
> this really should be fixed driver-wide.
>
> It looks like the driver makes the typical mistake of thinking that
> YUV formats use SMPTE170M colorspace and RGB formats use SRGB, but that's
> not true.

The imx6 driver mostly just propagates the colorspace from sink to 
source pads that comes originally from the sensor, and computes the 
other colorimetry parameters based on the propagated colorspace, see 
imx_media_try_colorimetry(). But I found one location where the 
colorspace is set to V4L2_COLORSPACE_SRGB if the pixel format is RGB, 
and V4L2_COLORSPACE_SMPTE170M if the pixel format is YUV, in the 
function init_mbus_colorimetry(). That's not necessarily a good choice 
for a default colorspace, since SMPTE170M could have a RGB encoding, or 
SRGB could have a YUV encoding. I'll send a patch that just defaults to 
IPUV3_COLORSPACE_RGB in init_mbus_colorimetry().

Steve

>   For drivers like this that typically are used with sensors
> initializing the colorspace to SRGB is a good default. But the actual
> colorspace comes from the sensor or the video receiver, the imx driver can't
> know. And YUV vs RGB memory formats is just a different pixel encoding and
> is unrelated to the colorspace.
>
> Regards,
>
> 	Hans
>
>> +	fmt_sink->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(fmt_sink->colorspace);
>> +	fmt_sink->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(fmt_sink->colorspace);
>> +	fmt_sink->quantization =
>> +		V4L2_MAP_QUANTIZATION_DEFAULT(false, fmt_sink->colorspace,
>> +					      fmt_sink->ycbcr_enc);
>>   
>>   	/*
>>   	 * When called from mipi_csis_subdev_init() to initialize the active
>>

