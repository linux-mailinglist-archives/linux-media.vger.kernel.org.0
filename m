Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8D771F9C61
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 17:55:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730517AbgFOPzr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jun 2020 11:55:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727785AbgFOPzr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jun 2020 11:55:47 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 336F0C061A0E;
        Mon, 15 Jun 2020 08:55:47 -0700 (PDT)
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 459F7F9;
        Mon, 15 Jun 2020 17:55:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592236542;
        bh=J+sz6WpxNbwq/DJpioDy41n2prkM2588o5FLAOZWRB0=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=UuOTD9mbFnUSzqgyUoChoHPU6JMdZibsM/afwu2SD8j3ALNeuBLEIdPsI3z9i+DpJ
         r8Sw0hVKJU/ravQ++4Zt153ZUhpjGGzaOnVjtDFeecGjTiiXcLVKC+LcloiAyt2in6
         4Q4MvARIr3FWTAV3GI7mMfwTZIRMR3TwFbSp3TAw=
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 2/2] media: vimc: Add a control to show test pattern
 colors' order
To:     Kaaira Gupta <kgupta@es.iitr.ac.in>
Cc:     Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        hverkuil@xs4all.nl
References: <20200614200239.18453-1-kgupta@es.iitr.ac.in>
 <20200614200239.18453-3-kgupta@es.iitr.ac.in>
 <0ec47745-dcb4-4b40-1c53-093491856597@ideasonboard.com>
 <20200615141721.GA16952@kaaira-HP-Pavilion-Notebook>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
 WZw01QYHU/GUV/zHJSFk
Organization: Ideas on Board
Message-ID: <85c8cf21-2729-ef34-13ac-70f18d1c04ff@ideasonboard.com>
Date:   Mon, 15 Jun 2020 16:55:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200615141721.GA16952@kaaira-HP-Pavilion-Notebook>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kaaira,


On 15/06/2020 15:17, Kaaira Gupta wrote:
> On Mon, Jun 15, 2020 at 12:48:20PM +0100, Kieran Bingham wrote:
>> Hi Kaaira,
>>
>> On 14/06/2020 21:02, Kaaira Gupta wrote:
>>> Add a control in VIMC to show the correct order of the colors for a
>>> given test pattern.
>>> The control can be accessed by using show_colors_order in v4l2-ctl
>>>
>>> Signed-off-by: Kaaira Gupta <kgupta@es.iitr.ac.in>
>>> ---
>>>  drivers/media/test-drivers/vimc/Kconfig       |  2 ++
>>>  drivers/media/test-drivers/vimc/vimc-common.h |  1 +
>>>  drivers/media/test-drivers/vimc/vimc-sensor.c | 34 +++++++++++++++++++
>>>  3 files changed, 37 insertions(+)
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
>>> index ae163dec2459..52376ba6146b 100644
>>> --- a/drivers/media/test-drivers/vimc/vimc-common.h
>>> +++ b/drivers/media/test-drivers/vimc/vimc-common.h
>>> @@ -20,6 +20,7 @@
>>>  #define VIMC_CID_VIMC_CLASS		(0x00f00000 | 1)
>>>  #define VIMC_CID_TEST_PATTERN		(VIMC_CID_VIMC_BASE + 0)
>>>  #define VIMC_CID_MEAN_WIN_SIZE		(VIMC_CID_VIMC_BASE + 1)
>>> +#define VIMC_TEST_PATTERN_ORDER		(VIMC_CID_VIMC_BASE + 2)
>>
>> This should have the prefix CID like the others. I believe that stands
>> for "Control ID"
>>
>> As below, I think it might warrant being a more generic name for the OSD
>> overlay, as it could display more than just the colour sequence.
> 
> Yes, Okay..I think I'll make a separate patch for adding all the text
> that VIMC can show including the color order, and let the 1st patch of
> this series be a separate patch?

This patch can be first and on it's own, but the key point is that once
you define a control name - this becomes the public interface, so it
can't change. (The kernel ABI interfaces should be stable).

You couldn't later decide "oh - now we display more than just the
TEST_PATTERN_ORDER, so we should rename it to VIMC_CID_INFO", (unless
the patches haven't been merged) - so if you know you will add more
information, we should just use a generic name from the start.


> 
> Should the colors' order text be added to VIVID as well?

Potentially yes, I think that would be useful if the code could be shared.

I think your tpg_g_color_order() is already usable by vivid?


>>>  #define VIMC_FRAME_MAX_WIDTH 4096
>>>  #define VIMC_FRAME_MAX_HEIGHT 2160
>>> diff --git a/drivers/media/test-drivers/vimc/vimc-sensor.c b/drivers/media/test-drivers/vimc/vimc-sensor.c
>>> index a2f09ac9a360..da625f6accce 100644
>>> --- a/drivers/media/test-drivers/vimc/vimc-sensor.c
>>> +++ b/drivers/media/test-drivers/vimc/vimc-sensor.c
>>> @@ -5,6 +5,7 @@
>>>   * Copyright (C) 2015-2017 Helen Koike <helen.fornazier@gmail.com>
>>>   */
>>>  
>>> +#include <linux/font.h>
>>>  #include <linux/v4l2-mediabus.h>
>>>  #include <linux/vmalloc.h>
>>>  #include <media/v4l2-ctrls.h>
>>> @@ -19,6 +20,7 @@ struct vimc_sen_device {
>>>  	struct v4l2_subdev sd;
>>>  	struct tpg_data tpg;
>>>  	u8 *frame;
>>> +	bool show_colors_order;
>>
>> I would say it's the 'sequence' 'show_color_sequence' but it's still a
>> bit long ... but maybe that doesn't really matter.
> 
> If its generic for all the information maybe it should be
> show_info?

show_info sounds good to me.


> 
>>
>>
>>>  	/* The active format */
>>>  	struct v4l2_mbus_framefmt mbus_format;
>>>  	struct v4l2_ctrl_handler hdl;
>>> @@ -185,10 +187,18 @@ static const struct v4l2_subdev_pad_ops vimc_sen_pad_ops = {
>>>  static void *vimc_sen_process_frame(struct vimc_ent_device *ved,
>>>  				    const void *sink_frame)
>>>  {
>>> +	u8 *basep[TPG_MAX_PLANES][2];
>>> +	char *str;
>>>  	struct vimc_sen_device *vsen = container_of(ved, struct vimc_sen_device,
>>>  						    ved);
>>>  
>>>  	tpg_fill_plane_buffer(&vsen->tpg, 0, 0, vsen->frame);
>>> +	if (vsen->show_colors_order) {
>>> +		tpg_calc_text_basep(&vsen->tpg, basep, 0, vsen->frame);
>>> +		str = tpg_g_color_order(&vsen->tpg);
>>> +		tpg_gen_text(&vsen->tpg, basep, 1, 1, str);
>>> +	}
>>> +
>>>  	return vsen->frame;
>>>  }
>>>  
>>> @@ -200,6 +210,14 @@ static int vimc_sen_s_stream(struct v4l2_subdev *sd, int enable)
>>>  	if (enable) {
>>>  		const struct vimc_pix_map *vpix;
>>>  		unsigned int frame_size;
>>> +		const struct font_desc *font = find_font("VGA8x16");
>>> +
>>> +		if (font == NULL) {
>>> +			pr_err("vimc: could not find font\n");
>>> +			return -ENODEV;
>>
>> I wonder if this should instead just disable text rendering instead?
> 
> Shouldn't the user know why he can't see the text?

I think it's probably fine to keep the pr_err() or pr_warn() perhaps -
but instead of return -ENODEV, set show_info = false; ....

I don't think there's a need to stop the stream running if the system
doesn't have a font.

But maybe someone will disagree ... if the info is requested, but can't
be displayed - perhaps it should be a failure :-S


>>
>> It might be reasonable to compile the kernel without the font-library ?
> 
> I have added the support in its Kconfig, isn't that okay?
> 
>>
>>> +		}
>>> +
>>> +		tpg_set_font(font->data);
>>>  
>>>  		/* Calculate the frame size */
>>>  		vpix = vimc_pix_map_by_code(vsen->mbus_format.code);
>>> @@ -269,6 +287,9 @@ static int vimc_sen_s_ctrl(struct v4l2_ctrl *ctrl)
>>>  	case V4L2_CID_SATURATION:
>>>  		tpg_s_saturation(&vsen->tpg, ctrl->val);
>>>  		break;
>>> +	case VIMC_TEST_PATTERN_ORDER:
>>> +		vsen->show_colors_order = ctrl->val;
>>> +		break;
>>>  	default:
>>>  		return -EINVAL;
>>>  	}
>>> @@ -307,6 +328,17 @@ static const struct v4l2_ctrl_config vimc_sen_ctrl_test_pattern = {
>>>  	.qmenu = tpg_pattern_strings,
>>>  };
>>>  
>>> +static const struct v4l2_ctrl_config vimc_sen_ctrl_order = {
>>> +	.ops = &vimc_sen_ctrl_ops,
>>> +	.id = VIMC_TEST_PATTERN_ORDER,
>>
>> Now that you've brought in support for rendering text on the frame, I
>> wonder if more information should be displayed just like VIVID does.
>>
>> In that case, it would probably be better to have a more generic control
>> that enables all of the text OSD with a more generic name.
> 
> Yes, I will change that
> 
>>
>>
>>> +	.name = "Show Colors Order",
>>> +	.type = V4L2_CTRL_TYPE_BOOLEAN,
>>> +	.min = 0,
>>> +	.max = 1,
>>> +	.step = 1,
>>> +	.def = 1,
>>> +};
>>> +
>>>  static struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
>>>  					    const char *vcfg_name)
>>>  {
>>> @@ -323,6 +355,7 @@ static struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
>>>  
>>>  	v4l2_ctrl_new_custom(&vsen->hdl, &vimc_sen_ctrl_class, NULL);
>>>  	v4l2_ctrl_new_custom(&vsen->hdl, &vimc_sen_ctrl_test_pattern, NULL);
>>> +	v4l2_ctrl_new_custom(&vsen->hdl, &vimc_sen_ctrl_order, NULL);
>>>  	v4l2_ctrl_new_std(&vsen->hdl, &vimc_sen_ctrl_ops,
>>>  			  V4L2_CID_VFLIP, 0, 1, 1, 0);
>>>  	v4l2_ctrl_new_std(&vsen->hdl, &vimc_sen_ctrl_ops,
>>> @@ -362,6 +395,7 @@ static struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
>>>  
>>>  	/* Initialize the frame format */
>>>  	vsen->mbus_format = fmt_default;
>>> +	vsen->show_colors_order = vimc_sen_ctrl_order.def;
>>>  
>>>  	return &vsen->ved;
>>>  
>>>
> 
> Thanks for your time :D

Thanks for yours ;-)


> 
>>
>> -- 
>> Regards
>> --
>> Kieran

-- 
Regards
--
Kieran
