Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CAA5F8A04F
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2019 16:04:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727022AbfHLOD6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Aug 2019 10:03:58 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:36796 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726558AbfHLOD6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Aug 2019 10:03:58 -0400
Received: by mail-ot1-f66.google.com with SMTP id k18so26979163otr.3
        for <linux-media@vger.kernel.org>; Mon, 12 Aug 2019 07:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=omb8eJqNcl5hAIjEtMm7Sx4ecQgeCfxcVDCr2TDQ6uE=;
        b=L/283tV2GlZybv1UNtD8vi59IfM6OhY5KP0rFagJqHzh9CFc0F1aggVrJJaNH7YN2t
         qZApeJ7oVtA2p9EOTh0ytV/w0cK6r6wRQ7QDd2SOjONe2u6nW4yJDAm2VI/wVZYtWx7O
         VDL5NN2D1ieoP0N87FQYWKSgmJV+4LMyOtMKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=omb8eJqNcl5hAIjEtMm7Sx4ecQgeCfxcVDCr2TDQ6uE=;
        b=rFiBrQI28USzYGfo+nZjlyGWHRA9iI2Il3yLkcdKqTQkD1ydUddat4uFkxq+J7AbWv
         HpV9nvsUWE0AQhgldY7LuMChTapCv+womUaxqjkX7+0hpFxb09QJtuIWIqTsbYoxrn7f
         XxqZc60tQL7xsec5J+t0RIzn5pY22npiue3mxZYQ0ZDH+elFg6qn30NupMbwkrwV014H
         HQ/G95ktl3q64uL5SGAID3tLJ2xPOhxXuDrWYlLP1igI/9o/VgTyeUd7CE+WGa8gnZhz
         b+ubX4YQ/8Te6ggSH0ZEpVfbCcFgxBUJ61MByLlYOYBhTTC2LcYw/H8+HyOsEa+NeHAm
         VgGg==
X-Gm-Message-State: APjAAAULJe6Gw4vSojEU6jFGQr/0xByWS7aAYJhwRpyraU5Be3WRglyK
        8ONNn0DR16D2XwVtffK7gI/N+A==
X-Google-Smtp-Source: APXvYqzQU4lvTxGxpDMxKY3awk+mr1XOYLJydWRj8nzmN154REEHOJtmWcrHyImgbf2pj2QSZhlPBg==
X-Received: by 2002:a6b:ea0f:: with SMTP id m15mr35507592ioc.300.1565618636729;
        Mon, 12 Aug 2019 07:03:56 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id t2sm3044684iod.81.2019.08.12.07.03.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Aug 2019 07:03:55 -0700 (PDT)
Subject: Re: [PATCH 1/3] media: vimc: move private defines to a common header
To:     Helen Koike <helen.koike@collabora.com>, mchehab@kernel.org,
        hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        "skh >> Shuah Khan" <skhan@linuxfoundation.org>
References: <cover.1565386363.git.skhan@linuxfoundation.org>
 <142cc5a6a10f75ed97de8b2d9b1e73b034a88b2f.1565386363.git.skhan@linuxfoundation.org>
 <5f9df1e2-41d6-b301-a841-0670f56464e3@collabora.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <a0067165-85b5-7093-9660-445eb69b9578@linuxfoundation.org>
Date:   Mon, 12 Aug 2019 08:03:53 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5f9df1e2-41d6-b301-a841-0670f56464e3@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Helen,

On 8/9/19 9:15 PM, Helen Koike wrote:
> Hi Shuah,
> 
> Thanks for the patch.
> 
> On 8/9/19 6:45 PM, Shuah Khan wrote:
>> In preparation for collapsing the component driver structure into
>> a monolith, move private device structure defines to a new common
>> header file.
>>
>> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
>> ---
>>   drivers/media/platform/vimc/vimc-capture.c |  21 +----
>>   drivers/media/platform/vimc/vimc-core.c    |  18 +---
>>   drivers/media/platform/vimc/vimc-debayer.c |  16 +---
>>   drivers/media/platform/vimc/vimc-scaler.c  |  15 +--
>>   drivers/media/platform/vimc/vimc-sensor.c  |  13 +--
>>   drivers/media/platform/vimc/vimc.h         | 102 +++++++++++++++++++++
>>   6 files changed, 107 insertions(+), 78 deletions(-)
>>   create mode 100644 drivers/media/platform/vimc/vimc.h
>>
>> diff --git a/drivers/media/platform/vimc/vimc-capture.c b/drivers/media/platform/vimc/vimc-capture.c
>> index 664855708fdf..c52fc5d97c2d 100644
>> --- a/drivers/media/platform/vimc/vimc-capture.c
>> +++ b/drivers/media/platform/vimc/vimc-capture.c
>> @@ -13,6 +13,7 @@
>>   #include <media/videobuf2-core.h>
>>   #include <media/videobuf2-vmalloc.h>
>>   
>> +#include "vimc.h"
>>   #include "vimc-common.h"
>>   #include "vimc-streamer.h"
>>   
>> @@ -44,26 +45,6 @@ static const u32 vimc_cap_supported_pixfmt[] = {
>>   	V4L2_PIX_FMT_SRGGB12,
>>   };
>>   
>> -struct vimc_cap_device {
>> -	struct vimc_ent_device ved;
>> -	struct video_device vdev;
>> -	struct device *dev;
>> -	struct v4l2_pix_format format;
>> -	struct vb2_queue queue;
>> -	struct list_head buf_list;
>> -	/*
>> -	 * NOTE: in a real driver, a spin lock must be used to access the
>> -	 * queue because the frames are generated from a hardware interruption
>> -	 * and the isr is not allowed to sleep.
>> -	 * Even if it is not necessary a spinlock in the vimc driver, we
>> -	 * use it here as a code reference
>> -	 */
>> -	spinlock_t qlock;
>> -	struct mutex lock;
>> -	u32 sequence;
>> -	struct vimc_stream stream;
>> -};
>> -
>>   static const struct v4l2_pix_format fmt_default = {
>>   	.width = 640,
>>   	.height = 480,
>> diff --git a/drivers/media/platform/vimc/vimc-core.c b/drivers/media/platform/vimc/vimc-core.c
>> index 571c55aa0e16..c9b351472272 100644
>> --- a/drivers/media/platform/vimc/vimc-core.c
>> +++ b/drivers/media/platform/vimc/vimc-core.c
>> @@ -12,6 +12,7 @@
>>   #include <media/media-device.h>
>>   #include <media/v4l2-device.h>
>>   
>> +#include "vimc.h"
>>   #include "vimc-common.h"
>>   
>>   #define VIMC_MDEV_MODEL_NAME "VIMC MDEV"
>> @@ -24,23 +25,6 @@
>>   	.flags = link_flags,					\
>>   }
>>   
>> -struct vimc_device {
>> -	/* The platform device */
>> -	struct platform_device pdev;
>> -
>> -	/* The pipeline configuration */
>> -	const struct vimc_pipeline_config *pipe_cfg;
>> -
>> -	/* The Associated media_device parent */
>> -	struct media_device mdev;
>> -
>> -	/* Internal v4l2 parent device*/
>> -	struct v4l2_device v4l2_dev;
>> -
>> -	/* Subdevices */
>> -	struct platform_device **subdevs;
>> -};
>> -
>>   /* Structure which describes individual configuration for each entity */
>>   struct vimc_ent_config {
>>   	const char *name;
>> diff --git a/drivers/media/platform/vimc/vimc-debayer.c b/drivers/media/platform/vimc/vimc-debayer.c
>> index 00598fbf3cba..750752bb173c 100644
>> --- a/drivers/media/platform/vimc/vimc-debayer.c
>> +++ b/drivers/media/platform/vimc/vimc-debayer.c
>> @@ -13,6 +13,7 @@
>>   #include <linux/v4l2-mediabus.h>
>>   #include <media/v4l2-subdev.h>
>>   
>> +#include "vimc.h"
>>   #include "vimc-common.h"
>>   
>>   #define VIMC_DEB_DRV_NAME "vimc-debayer"
>> @@ -44,21 +45,6 @@ struct vimc_deb_pix_map {
>>   	enum vimc_deb_rgb_colors order[2][2];
>>   };
>>   
>> -struct vimc_deb_device {
>> -	struct vimc_ent_device ved;
>> -	struct v4l2_subdev sd;
>> -	struct device *dev;
>> -	/* The active format */
>> -	struct v4l2_mbus_framefmt sink_fmt;
>> -	u32 src_code;
>> -	void (*set_rgb_src)(struct vimc_deb_device *vdeb, unsigned int lin,
>> -			    unsigned int col, unsigned int rgb[3]);
>> -	/* Values calculated when the stream starts */
>> -	u8 *src_frame;
>> -	const struct vimc_deb_pix_map *sink_pix_map;
>> -	unsigned int sink_bpp;
>> -};
>> -
>>   static const struct v4l2_mbus_framefmt sink_fmt_default = {
>>   	.width = 640,
>>   	.height = 480,
>> diff --git a/drivers/media/platform/vimc/vimc-scaler.c b/drivers/media/platform/vimc/vimc-scaler.c
>> index c7123a45c55b..fe99b9102ada 100644
>> --- a/drivers/media/platform/vimc/vimc-scaler.c
>> +++ b/drivers/media/platform/vimc/vimc-scaler.c
>> @@ -13,6 +13,7 @@
>>   #include <linux/v4l2-mediabus.h>
>>   #include <media/v4l2-subdev.h>
>>   
>> +#include "vimc.h"
>>   #include "vimc-common.h"
>>   
>>   #define VIMC_SCA_DRV_NAME "vimc-scaler"
>> @@ -31,20 +32,6 @@ static const u32 vimc_sca_supported_pixfmt[] = {
>>   	V4L2_PIX_FMT_ARGB32,
>>   };
>>   
>> -struct vimc_sca_device {
>> -	struct vimc_ent_device ved;
>> -	struct v4l2_subdev sd;
>> -	struct device *dev;
>> -	/* NOTE: the source fmt is the same as the sink
>> -	 * with the width and hight multiplied by mult
>> -	 */
>> -	struct v4l2_mbus_framefmt sink_fmt;
>> -	/* Values calculated when the stream starts */
>> -	u8 *src_frame;
>> -	unsigned int src_line_size;
>> -	unsigned int bpp;
>> -};
>> -
>>   static const struct v4l2_mbus_framefmt sink_fmt_default = {
>>   	.width = 640,
>>   	.height = 480,
>> diff --git a/drivers/media/platform/vimc/vimc-sensor.c b/drivers/media/platform/vimc/vimc-sensor.c
>> index 51359472eef2..6c57b1e262f9 100644
>> --- a/drivers/media/platform/vimc/vimc-sensor.c
>> +++ b/drivers/media/platform/vimc/vimc-sensor.c
>> @@ -16,22 +16,11 @@
>>   #include <media/v4l2-subdev.h>
>>   #include <media/tpg/v4l2-tpg.h>
>>   
>> +#include "vimc.h"
>>   #include "vimc-common.h"
>>   
>>   #define VIMC_SEN_DRV_NAME "vimc-sensor"
>>   
>> -struct vimc_sen_device {
>> -	struct vimc_ent_device ved;
>> -	struct v4l2_subdev sd;
>> -	struct device *dev;
>> -	struct tpg_data tpg;
>> -	struct task_struct *kthread_sen;
>> -	u8 *frame;
>> -	/* The active format */
>> -	struct v4l2_mbus_framefmt mbus_format;
>> -	struct v4l2_ctrl_handler hdl;
>> -};
>> -
>>   static const struct v4l2_mbus_framefmt fmt_default = {
>>   	.width = 640,
>>   	.height = 480,
>> diff --git a/drivers/media/platform/vimc/vimc.h b/drivers/media/platform/vimc/vimc.h
>> new file mode 100644
>> index 000000000000..a5adebdda941
>> --- /dev/null
>> +++ b/drivers/media/platform/vimc/vimc.h
> 
> I was wondering if instead of creating a vimc.h, if we could move
> to vimc-common.h,just because it is not clear to me the difference
> between the two now, what do you think?
> 

My thinking is that vimc-common.h is common for all the subdevs and
putting vimc-core defines and structures it shares it with the subdev
files can be in a separate file.

It is more of design choice to keep structures and defined organized.
Originally I was thinking all the subdev device structires need to be
global, and my patch set I sent out as such doesn't need that. I just
overlooked that when I sent the patches out.

This reduces the number of things that need to be common, I don't really
have any strong reasons for either choice of adding common defines to
vimc-common.h vs vimc.h - maybe with a slight tilt towards liking vimc.h

thanks,
-- Shuah

