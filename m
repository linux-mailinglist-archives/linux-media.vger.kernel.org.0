Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78ECD20A15D
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2020 16:54:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405660AbgFYOyN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jun 2020 10:54:13 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:36956 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405651AbgFYOyM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jun 2020 10:54:12 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C4A5D72E;
        Thu, 25 Jun 2020 16:54:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1593096849;
        bh=UoDMlwh3pu9sPwosMoIaeUvvEx+KBNFD6Nuzs0VY9Bs=;
        h=Reply-To:Subject:To:References:From:Cc:Date:In-Reply-To:From;
        b=oQ3tBZxATLp2r1yNJO50kLqMr186/I2xmD9HwV2cjGgC3UK2f5HtizGR4EnnljsNP
         6RzlvcnITp0l8Xm1oaU/wosgh4sOYAUODBLlTIreeNqFSg+kbHTVG0SiVeJHKl34af
         t6Y28A4pNE78xyBXzEBrMY6VAijTnbLMZpfk8FO0=
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v5 3/3] media: vimc: Add a control to display info on test
 image
To:     Kaaira Gupta <kgupta@es.iitr.ac.in>,
        Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200624134354.7023-1-kgupta@es.iitr.ac.in>
 <20200624134354.7023-4-kgupta@es.iitr.ac.in>
 <f913db5f-7a81-50cf-73cd-ef258a370a17@xs4all.nl>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
 WZw01QYHU/GUV/zHJSFk
Organization: Ideas on Board
Cc:     Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <e10fec40-aaa1-a790-b6cd-396c0f34d2d3@ideasonboard.com>
Date:   Thu, 25 Jun 2020 15:54:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <f913db5f-7a81-50cf-73cd-ef258a370a17@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kaaira,

On 24/06/2020 14:51, Hans Verkuil wrote:
> On 24/06/2020 15:43, Kaaira Gupta wrote:
>> Add a control in VIMC to display information such as the correct order of
>> colors for a given test pattern, brightness, hue, saturation, contrast,
>> width and height at sensor over test image.
>>
>> Signed-off-by: Kaaira Gupta <kgupta@es.iitr.ac.in>
>> ---
>>  drivers/media/test-drivers/vimc/Kconfig       |  2 +
>>  drivers/media/test-drivers/vimc/vimc-common.h |  1 +
>>  drivers/media/test-drivers/vimc/vimc-core.c   | 10 ++++
>>  drivers/media/test-drivers/vimc/vimc-sensor.c | 57 +++++++++++++++++++
>>  4 files changed, 70 insertions(+)
>>
>> diff --git a/drivers/media/test-drivers/vimc/Kconfig b/drivers/media/test-drivers/vimc/Kconfig
>> index 4068a67585f9..da4b2ad6e40c 100644
>> --- a/drivers/media/test-drivers/vimc/Kconfig
>> +++ b/drivers/media/test-drivers/vimc/Kconfig
>> @@ -2,6 +2,8 @@
>>  config VIDEO_VIMC
>>  	tristate "Virtual Media Controller Driver (VIMC)"
>>  	depends on VIDEO_DEV && VIDEO_V4L2
>> +	select FONT_SUPPORT
>> +	select FONT_8x16
>>  	select MEDIA_CONTROLLER
>>  	select VIDEO_V4L2_SUBDEV_API
>>  	select VIDEOBUF2_VMALLOC
>> diff --git a/drivers/media/test-drivers/vimc/vimc-common.h b/drivers/media/test-drivers/vimc/vimc-common.h
>> index ae163dec2459..afda52253402 100644
>> --- a/drivers/media/test-drivers/vimc/vimc-common.h
>> +++ b/drivers/media/test-drivers/vimc/vimc-common.h
>> @@ -20,6 +20,7 @@
>>  #define VIMC_CID_VIMC_CLASS		(0x00f00000 | 1)
>>  #define VIMC_CID_TEST_PATTERN		(VIMC_CID_VIMC_BASE + 0)
>>  #define VIMC_CID_MEAN_WIN_SIZE		(VIMC_CID_VIMC_BASE + 1)
>> +#define VIMC_CID_SHOW_INFO		(VIMC_CID_VIMC_BASE + 2)
>>  
>>  #define VIMC_FRAME_MAX_WIDTH 4096
>>  #define VIMC_FRAME_MAX_HEIGHT 2160
>> diff --git a/drivers/media/test-drivers/vimc/vimc-core.c b/drivers/media/test-drivers/vimc/vimc-core.c
>> index 11210aaa2551..461320ae965c 100644
>> --- a/drivers/media/test-drivers/vimc/vimc-core.c
>> +++ b/drivers/media/test-drivers/vimc/vimc-core.c
>> @@ -5,10 +5,12 @@
>>   * Copyright (C) 2015-2017 Helen Koike <helen.fornazier@gmail.com>
>>   */
>>  
>> +#include <linux/font.h>
>>  #include <linux/init.h>
>>  #include <linux/module.h>
>>  #include <linux/platform_device.h>
>>  #include <media/media-device.h>
>> +#include <media/tpg/v4l2-tpg.h>
>>  #include <media/v4l2-device.h>
>>  
>>  #include "vimc-common.h"
>> @@ -263,6 +265,7 @@ static int vimc_register_devices(struct vimc_device *vimc)
>>  
>>  static int vimc_probe(struct platform_device *pdev)
>>  {
>> +	const struct font_desc *font = find_font("VGA8x16");
>>  	struct vimc_device *vimc;
>>  	int ret;
>>  
>> @@ -272,6 +275,13 @@ static int vimc_probe(struct platform_device *pdev)
>>  	if (!vimc)
>>  		return -ENOMEM;
>>  
>> +	if (!font) {
>> +		dev_err(&pdev->dev, "vimc: could not find font\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	tpg_set_font(font->data);
>> +
>>  	vimc->pipe_cfg = &pipe_cfg;
>>  
>>  	/* Link the media device within the v4l2_device */
>> diff --git a/drivers/media/test-drivers/vimc/vimc-sensor.c b/drivers/media/test-drivers/vimc/vimc-sensor.c
>> index a2f09ac9a360..d776fdcdc3bf 100644
>> --- a/drivers/media/test-drivers/vimc/vimc-sensor.c
>> +++ b/drivers/media/test-drivers/vimc/vimc-sensor.c
>> @@ -19,6 +19,8 @@ struct vimc_sen_device {
>>  	struct v4l2_subdev sd;
>>  	struct tpg_data tpg;
>>  	u8 *frame;
>> +	unsigned show_info;

It's better to declare a 'type' rather than just unsigned.
 i.e.
	unsigned int
	unsigned long




>> +	unsigned ns;
> 
> That name is a bit vague. How about 'start_stream_ts' (ts == timestamp)?
> 
> Note also that ktime_get_ns() returns a u64, not an unsigned.
> 
> Regards,
> 
> 	Hans
> 
>>  	/* The active format */
>>  	struct v4l2_mbus_framefmt mbus_format;
>>  	struct v4l2_ctrl_handler hdl;
>> @@ -185,10 +187,43 @@ static const struct v4l2_subdev_pad_ops vimc_sen_pad_ops = {
>>  static void *vimc_sen_process_frame(struct vimc_ent_device *ved,
>>  				    const void *sink_frame)
>>  {
>> +	u8 *basep[TPG_MAX_PLANES][2];
>> +	char str[100];
>> +	int line = 1;
>>  	struct vimc_sen_device *vsen = container_of(ved, struct vimc_sen_device,
>>  						    ved);
>>  
>>  	tpg_fill_plane_buffer(&vsen->tpg, 0, 0, vsen->frame);
>> +	tpg_calc_text_basep(&vsen->tpg, basep, 0, vsen->frame);
>> +
>> +	if (vsen->show_info <= 1) {

I would suggest creating an enum of the possible values so that you can
do a switch statement here, otherwise a reader of the code will be
thinking "What is 1 refering to?"


At least then you could do:

switch(vsen->show_info) {
	VSEN_SHOW_ALL:
		... do all stuff ..
		/* fallthrough */
	VSEN_SHOW_COUNTERS:
		... do just the counters ...
		/* fallthrough */ (or break;)
	VSEN_SHOW_NONE:
	default:
		break;
}


Looking at vivid, I can see that the use of the numbers came from there,
but it would be nice to try to improve readability some how...


>> +		unsigned ms;
>> +
>> +		ms = (ktime_get_ns() - vsen->ns) / 1000000;
>> +		snprintf(str, sizeof(str), "%02d:%02d:%02d:%03d",
>> +			 (ms / (60 * 60 * 1000)) % 24,
>> +			 (ms / (60 * 1000)) % 60,
>> +			 (ms / 1000) % 60,
>> +			 ms % 1000);
>> +		tpg_gen_text(&vsen->tpg, basep, line++ * 16, 16, str);

you've used "line++ * 16" where vivid seems to always use line++ *
line_height.

Perhaps vivid can customise the value there with a control, but even if
not, it would be better to put a
 const unsigned int line_height = 16;

at the top of the function so it's clear what that parameter does.

>> +	}
>> +
>> +	if (vsen->show_info == 0) {
>> +		const char *order = tpg_g_color_order(&vsen->tpg);
>> +
>> +		tpg_gen_text(&vsen->tpg, basep, line++ * 16, 16, order);
>> +		snprintf(str, sizeof(str),
>> +			 "brightness %3d, contrast %3d, saturation %3d, hue %d ",
>> +			 vsen->tpg.brightness,
>> +			 vsen->tpg.contrast,
>> +			 vsen->tpg.saturation,
>> +			 vsen->tpg.hue);
>> +		tpg_gen_text(&vsen->tpg, basep, line++ * 16, 16, str);
>> +		snprintf(str, sizeof(str), "sensor size: %dx%d",
>> +			 vsen->mbus_format.width, vsen->mbus_format.height);
>> +		tpg_gen_text(&vsen->tpg, basep, line++ * 16, 16, str);
>> +	}
>> +
>>  	return vsen->frame;
>>  }
>>  
>> @@ -201,6 +236,8 @@ static int vimc_sen_s_stream(struct v4l2_subdev *sd, int enable)
>>  		const struct vimc_pix_map *vpix;
>>  		unsigned int frame_size;
>>  
>> +		vsen->ns = ktime_get_ns();
>> +
>>  		/* Calculate the frame size */
>>  		vpix = vimc_pix_map_by_code(vsen->mbus_format.code);
>>  		frame_size = vsen->mbus_format.width * vpix->bpp *
>> @@ -269,6 +306,9 @@ static int vimc_sen_s_ctrl(struct v4l2_ctrl *ctrl)
>>  	case V4L2_CID_SATURATION:
>>  		tpg_s_saturation(&vsen->tpg, ctrl->val);
>>  		break;
>> +	case VIMC_CID_SHOW_INFO:
>> +		vsen->show_info = ctrl->val;
>> +		break;
>>  	default:
>>  		return -EINVAL;
>>  	}
>> @@ -307,6 +347,22 @@ static const struct v4l2_ctrl_config vimc_sen_ctrl_test_pattern = {
>>  	.qmenu = tpg_pattern_strings,
>>  };
>>  
>> +static const char * const vimc_ctrl_show_info_strings[] = {
>> +	"All",
>> +	"Counters Only",
>> +	"None",
>> +	NULL,
>> +};
>> +
>> +static const struct v4l2_ctrl_config vimc_sen_ctrl_show_info = {
>> +	.ops = &vimc_sen_ctrl_ops,
>> +	.id = VIMC_CID_SHOW_INFO,
>> +	.name = "Show Information",
>> +	.type = V4L2_CTRL_TYPE_MENU,
>> +	.max = ARRAY_SIZE(vimc_ctrl_show_info_strings) - 2,
>> +	.qmenu = vimc_ctrl_show_info_strings,
>> +};
>> +
>>  static struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
>>  					    const char *vcfg_name)
>>  {
>> @@ -323,6 +379,7 @@ static struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
>>  
>>  	v4l2_ctrl_new_custom(&vsen->hdl, &vimc_sen_ctrl_class, NULL);
>>  	v4l2_ctrl_new_custom(&vsen->hdl, &vimc_sen_ctrl_test_pattern, NULL);
>> +	v4l2_ctrl_new_custom(&vsen->hdl, &vimc_sen_ctrl_show_info, NULL);
>>  	v4l2_ctrl_new_std(&vsen->hdl, &vimc_sen_ctrl_ops,
>>  			  V4L2_CID_VFLIP, 0, 1, 1, 0);
>>  	v4l2_ctrl_new_std(&vsen->hdl, &vimc_sen_ctrl_ops,
>>
> 

-- 
Regards
--
Kieran
