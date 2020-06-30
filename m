Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3D3920F604
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2020 15:44:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730318AbgF3Noo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jun 2020 09:44:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726876AbgF3Nom (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jun 2020 09:44:42 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55274C061755;
        Tue, 30 Jun 2020 06:44:42 -0700 (PDT)
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0E1E329F;
        Tue, 30 Jun 2020 15:44:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1593524678;
        bh=8fb6RaqgVoHIKP2YzNBv0RZsrqlztjFoNqCtxKez3e4=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=pPTi0+IWxxVMiyohvMhvIK7kBZf7eAO+q9TgdcGgIKy/y1ZOTDyzsmWUdtxLIxxM/
         owtug9TEgkzc/GBs7jkHotSkxVhknqwTLRCz9pZ/zyB1k2sW2K5qaNC/k7voidnQwr
         wWrna8Pf44vByicxaqiz19t57dLMtXw1849TnnlY=
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v7 3/3] media: vimc: Add a control to display info on test
 image
To:     Kaaira Gupta <kgupta@es.iitr.ac.in>,
        Helen Koike <helen.koike@collabora.com>
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        hverkuil@xs4all.nl
References: <20200626130700.2453-1-kgupta@es.iitr.ac.in>
 <20200626130700.2453-4-kgupta@es.iitr.ac.in>
 <1409b37e-f03d-cca8-c4a7-e1454f1da910@collabora.com>
 <20200630132510.GA12353@kaaira-HP-Pavilion-Notebook>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
 WZw01QYHU/GUV/zHJSFk
Organization: Ideas on Board
Message-ID: <55be9e06-bfe2-4e62-c6ec-658be6ee57a0@ideasonboard.com>
Date:   Tue, 30 Jun 2020 14:44:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200630132510.GA12353@kaaira-HP-Pavilion-Notebook>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kaaira,

On 30/06/2020 14:25, Kaaira Gupta wrote:
> On Fri, Jun 26, 2020 at 01:01:03PM -0300, Helen Koike wrote:
>> Hi Kaaira,
>>
>> On 6/26/20 10:07 AM, Kaaira Gupta wrote:
>>> Add a control in VIMC to display information such as the correct order of
>>> colors for a given test pattern, brightness, hue, saturation, contrast,
>>> width and height at sensor over test image.
>>>
>>> Signed-off-by: Kaaira Gupta <kgupta@es.iitr.ac.in>
>>> ---
>>>  drivers/media/test-drivers/vimc/Kconfig       |  2 +
>>>  drivers/media/test-drivers/vimc/vimc-common.h |  1 +
>>>  drivers/media/test-drivers/vimc/vimc-core.c   | 10 +++
>>>  drivers/media/test-drivers/vimc/vimc-sensor.c | 70 +++++++++++++++++++
>>>  4 files changed, 83 insertions(+)
>>>
>>> diff --git a/drivers/media/test-drivers/vimc/Kconfig b/drivers/media/test-drivers/vimc/Kconfig
>>> index 4068a67585f9..da4b2ad6e40c 100644
>>> --- a/drivers/media/test-drivers/vimc/Kconfig
>>> +++ b/drivers/media/test-drivers/vimc/Kconfig
>>> @@ -2,6 +2,8 @@
>>>  config VIDEO_VIMC
>>>  	tristate "Virtual Media Controller Driver (VIMC)"
>>>  	depends on VIDEO_DEV && VIDEO_V4L2
>>> +	select FONT_SUPPORT
>>> +	select FONT_8x16
>>>  	select MEDIA_CONTROLLER
>>>  	select VIDEO_V4L2_SUBDEV_API
>>>  	select VIDEOBUF2_VMALLOC
>>> diff --git a/drivers/media/test-drivers/vimc/vimc-common.h b/drivers/media/test-drivers/vimc/vimc-common.h
>>> index ae163dec2459..a289434e75ba 100644
>>> --- a/drivers/media/test-drivers/vimc/vimc-common.h
>>> +++ b/drivers/media/test-drivers/vimc/vimc-common.h
>>> @@ -20,6 +20,7 @@
>>>  #define VIMC_CID_VIMC_CLASS		(0x00f00000 | 1)
>>>  #define VIMC_CID_TEST_PATTERN		(VIMC_CID_VIMC_BASE + 0)
>>>  #define VIMC_CID_MEAN_WIN_SIZE		(VIMC_CID_VIMC_BASE + 1)
>>> +#define VIMC_CID_OSD_TEXT_MODE		(VIMC_CID_VIMC_BASE + 2)
>>>  
>>>  #define VIMC_FRAME_MAX_WIDTH 4096
>>>  #define VIMC_FRAME_MAX_HEIGHT 2160
>>> diff --git a/drivers/media/test-drivers/vimc/vimc-core.c b/drivers/media/test-drivers/vimc/vimc-core.c
>>> index 11210aaa2551..4b0ae6f51d76 100644
>>> --- a/drivers/media/test-drivers/vimc/vimc-core.c
>>> +++ b/drivers/media/test-drivers/vimc/vimc-core.c
>>> @@ -5,10 +5,12 @@
>>>   * Copyright (C) 2015-2017 Helen Koike <helen.fornazier@gmail.com>
>>>   */
>>>  
>>> +#include <linux/font.h>
>>>  #include <linux/init.h>
>>>  #include <linux/module.h>
>>>  #include <linux/platform_device.h>
>>>  #include <media/media-device.h>
>>> +#include <media/tpg/v4l2-tpg.h>
>>>  #include <media/v4l2-device.h>
>>>  
>>>  #include "vimc-common.h"
>>> @@ -263,11 +265,19 @@ static int vimc_register_devices(struct vimc_device *vimc)
>>>  
>>>  static int vimc_probe(struct platform_device *pdev)
>>>  {
>>> +	const struct font_desc *font = find_font("VGA8x16");
>>>  	struct vimc_device *vimc;
>>>  	int ret;
>>>  
>>>  	dev_dbg(&pdev->dev, "probe");
>>>  
>>> +	if (!font) {
>>> +		dev_err(&pdev->dev, "could not find font\n");
>>> +		return -ENODEV;
>>> +	}
>>> +
>>> +	tpg_set_font(font->data);
>>> +
>>>  	vimc = kzalloc(sizeof(*vimc), GFP_KERNEL);
>>>  	if (!vimc)
>>>  		return -ENOMEM;
>>> diff --git a/drivers/media/test-drivers/vimc/vimc-sensor.c b/drivers/media/test-drivers/vimc/vimc-sensor.c
>>> index a2f09ac9a360..9e4fb3f4d60d 100644
>>> --- a/drivers/media/test-drivers/vimc/vimc-sensor.c
>>> +++ b/drivers/media/test-drivers/vimc/vimc-sensor.c
>>> @@ -19,6 +19,8 @@ struct vimc_sen_device {
>>>  	struct v4l2_subdev sd;
>>>  	struct tpg_data tpg;
>>>  	u8 *frame;
>>> +	unsigned int osd_mode;
>>
>> If you declare the enum outside the below function, this could be type osd_mode instead of unsigned int, what do you think?
>>
>>> +	u64 start_stream_ts;
>>>  	/* The active format */
>>>  	struct v4l2_mbus_framefmt mbus_format;
>>>  	struct v4l2_ctrl_handler hdl;
>>> @@ -187,8 +189,54 @@ static void *vimc_sen_process_frame(struct vimc_ent_device *ved,
>>>  {
>>>  	struct vimc_sen_device *vsen = container_of(ved, struct vimc_sen_device,
>>>  						    ved);
>>> +	enum osd_mode {OSD_SHOW_ALL = 0, OSD_SHOW_COUNTERS = 1, OSD_SHOW_NONE = 2};
>>> +	const unsigned int line_height = 16;
>>> +	u8 *basep[TPG_MAX_PLANES][2];
>>> +	unsigned int line = 1;
>>> +	char str[100];
>>>  
>>>  	tpg_fill_plane_buffer(&vsen->tpg, 0, 0, vsen->frame);
>>> +	tpg_calc_text_basep(&vsen->tpg, basep, 0, vsen->frame);
>>> +	switch (vsen->osd_mode) {
>>> +	case OSD_SHOW_ALL:
>>> +		{
>>
>> Usually we don't use this curly braces in a case statement, please, check other examples in the code,
> 
> I have declared variables inside the cases,hence they are not just
> statements, so I need to use them I think

The scope of the variables should still be local to the case statement,
even without the braces.

Take them out and check with the compiler of course, but I think it
shoudl be fine.

> 
>>
>>> +			const char *order = tpg_g_color_order(&vsen->tpg);
>>
>> You also don't need this level of identation.
> 
> I used it because of the braces

I suspect that's why we don't use braces in this instance, to prevent
the indentation getting too far out to the right.

With the braces gone, one less level of indentation should be ok.


> 
>>
>>> +
>>> +			tpg_gen_text(&vsen->tpg, basep,
>>> +				     line++ * line_height, 16, order);
>>> +			snprintf(str, sizeof(str),
>>> +				 "brightness %3d, contrast %3d, saturation %3d, hue %d ",
>>> +				 vsen->tpg.brightness,
>>> +				 vsen->tpg.contrast,
>>> +				 vsen->tpg.saturation,
>>> +				 vsen->tpg.hue);
>>> +			tpg_gen_text(&vsen->tpg, basep, line++ * line_height,
>>> +				     16, str);
>>> +			snprintf(str, sizeof(str), "sensor size: %dx%d",
>>> +				 vsen->mbus_format.width,
>>> +				 vsen->mbus_format.height);
>>> +			tpg_gen_text(&vsen->tpg, basep, line++ * line_height,
>>> +				     16, str);
>>> +		}
>>> +	case OSD_SHOW_COUNTERS:
>>
>> Checkpatch gives this error:
>>
>> WARNING: Possible switch case/default not preceded by break or fallthrough comment
>>
>> You need to add a fallthrough comment (grep for fallthrough to find other examples)
> 
> Okay, I will add that

The /* fallthrough */ comments are important, as it helps prevent bugs
where the fallthrough was not intentional.

Even though the 'comment' does nothing, it tells the compiler/tools that
you /intentionally/ want to run the code in the next block as well.


> 
>>
>>> +		{
>>> +			unsigned int ms;
>>> +
>>> +			ms = (ktime_get_ns() - vsen->start_stream_ts) / 1000000;
>>> +			snprintf(str, sizeof(str), "%02d:%02d:%02d:%03d",
>>> +				 (ms / (60 * 60 * 1000)) % 24,
>>> +				 (ms / (60 * 1000)) % 60,
>>> +				 (ms / 1000) % 60,
>>> +				 ms % 1000);
>>> +			tpg_gen_text(&vsen->tpg, basep, line++ * line_height,
>>> +				     16, str);
>>> +			break;
>>> +		}
>>> +	case OSD_SHOW_NONE:
>>
>> No need this case statement if you have the default below.
> 
> I added it to make it clearer what default does, should I remove it?

I personally would keep it directly above the default. It's not
essential as the default will of course catch it - but I would (where
reasonable) make sure all expected case statement options are declared
in the switch.


I don't think it makes it clearer what the 'default' does, but it does
make it clearer that 'SHOW_NONE' is an option and it will go through
here and ... do nothing ;-)

(where the default statement would be the path for invalid options)

--
Kieran


>>
>> Regards,
>> Helen
>>
>>> +	default:
>>> +		break;
>>> +	}
>>> +
>>>  	return vsen->frame;
>>>  }
>>>  
>>> @@ -201,6 +249,8 @@ static int vimc_sen_s_stream(struct v4l2_subdev *sd, int enable)
>>>  		const struct vimc_pix_map *vpix;
>>>  		unsigned int frame_size;
>>>  
>>> +		vsen->start_stream_ts = ktime_get_ns();
>>> +
>>>  		/* Calculate the frame size */
>>>  		vpix = vimc_pix_map_by_code(vsen->mbus_format.code);
>>>  		frame_size = vsen->mbus_format.width * vpix->bpp *
>>> @@ -269,6 +319,9 @@ static int vimc_sen_s_ctrl(struct v4l2_ctrl *ctrl)
>>>  	case V4L2_CID_SATURATION:
>>>  		tpg_s_saturation(&vsen->tpg, ctrl->val);
>>>  		break;
>>> +	case VIMC_CID_OSD_TEXT_MODE:
>>> +		vsen->osd_mode = ctrl->val;
>>> +		break;
>>>  	default:
>>>  		return -EINVAL;
>>>  	}
>>> @@ -307,6 +360,22 @@ static const struct v4l2_ctrl_config vimc_sen_ctrl_test_pattern = {
>>>  	.qmenu = tpg_pattern_strings,
>>>  };
>>>  
>>> +static const char * const vimc_ctrl_osd_mode_strings[] = {
>>> +	"All",
>>> +	"Counters Only",
>>> +	"None",
>>> +	NULL,
>>> +};
>>> +
>>> +static const struct v4l2_ctrl_config vimc_sen_ctrl_osd_mode = {
>>> +	.ops = &vimc_sen_ctrl_ops,
>>> +	.id = VIMC_CID_OSD_TEXT_MODE,
>>> +	.name = "Show Information",
>>> +	.type = V4L2_CTRL_TYPE_MENU,
>>> +	.max = ARRAY_SIZE(vimc_ctrl_osd_mode_strings) - 2,
>>> +	.qmenu = vimc_ctrl_osd_mode_strings,
>>> +};
>>> +
>>>  static struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
>>>  					    const char *vcfg_name)
>>>  {
>>> @@ -323,6 +392,7 @@ static struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
>>>  
>>>  	v4l2_ctrl_new_custom(&vsen->hdl, &vimc_sen_ctrl_class, NULL);
>>>  	v4l2_ctrl_new_custom(&vsen->hdl, &vimc_sen_ctrl_test_pattern, NULL);
>>> +	v4l2_ctrl_new_custom(&vsen->hdl, &vimc_sen_ctrl_osd_mode, NULL);
>>>  	v4l2_ctrl_new_std(&vsen->hdl, &vimc_sen_ctrl_ops,
>>>  			  V4L2_CID_VFLIP, 0, 1, 1, 0);
>>>  	v4l2_ctrl_new_std(&vsen->hdl, &vimc_sen_ctrl_ops,
>>>

-- 
Regards
--
Kieran
