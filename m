Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DE8A50FDD2
	for <lists+linux-media@lfdr.de>; Tue, 26 Apr 2022 14:55:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350255AbiDZM5o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Apr 2022 08:57:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350271AbiDZM4s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Apr 2022 08:56:48 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BA8417CEBD
        for <linux-media@vger.kernel.org>; Tue, 26 Apr 2022 05:53:40 -0700 (PDT)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23QAAcOx009548;
        Tue, 26 Apr 2022 14:53:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=FsDwWC0IVX/UD7V0WnxMZdgC4+rGDq5Yz39o6y71bvI=;
 b=TK9mUezts2V0ItLBVHOYaTSaR+nAnuy2ZCN+II80JIckB0B14lO3n+vWtghKlQnDtwRY
 9c94QKOa/o0wreHhh8l5j0ybRpwR2qHD+UradoDfbY57Ts/pZtCL6aghcX++0urnISeV
 rRWULreuNvUizjITXhcRqRff4CA1m+gIPznmnEyya2RK5Rx3+3P9fwI32vMuIgP/0GD1
 Pj6wU3NwPe6Sp6UxH8FgWIstfJr0CNks/Y4xc+hC3NstOpTitQUB9Z02ErVpoYxuMd1Y
 DJTqBiPjhb9JB2CSMs5zGe3IKCjYZXOntXZsxxBaqGvcKwCkqbEQq7RbX5KlztFmdDPG sw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fm6vkfbsn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 Apr 2022 14:53:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EF8BA10002A;
        Tue, 26 Apr 2022 14:53:13 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E6311226FAC;
        Tue, 26 Apr 2022 14:53:13 +0200 (CEST)
Received: from [10.201.23.19] (10.75.127.50) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 26 Apr
 2022 14:53:13 +0200
Subject: Re: [PATCH v5 16/27] media: ov5640: Add VBLANK control
To:     Jacopo Mondi <jacopo@jmondi.org>
CC:     Steve Longerbeam <slongerbeam@gmail.com>,
        <laurent.pinchart@ideasonboard.com>, <sakari.ailus@iki.fi>,
        <hverkuil-cisco@xs4all.nl>, <mirela.rabulea@nxp.com>,
        <xavier.roumegue@oss.nxp.com>, <tomi.valkeinen@ideasonboard.com>,
        <hugues.fruchet@st.com>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <aford173@gmail.com>, <festevam@gmail.com>,
        <Eugen.Hristev@microchip.com>, <jbrunet@baylibre.com>,
        <paul.elder@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>
References: <20220224094313.233347-1-jacopo@jmondi.org>
 <20220224094313.233347-17-jacopo@jmondi.org>
 <3b2e09d0-8524-3b3e-0ace-47fdbd36bec7@foss.st.com>
 <20220411154233.ibmxehvhvw6jcud5@uno.localdomain>
From:   Hugues FRUCHET - FOSS <hugues.fruchet@foss.st.com>
Message-ID: <bff75be4-e567-1310-21a3-659e1d2155fe@foss.st.com>
Date:   Tue, 26 Apr 2022 14:53:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220411154233.ibmxehvhvw6jcud5@uno.localdomain>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-26_02,2022-04-26_02,2022-02-23_01
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On 4/11/22 5:42 PM, Jacopo Mondi wrote:
> Hi Hugues,
> 
> On Thu, Apr 07, 2022 at 06:25:32PM +0200, Hugues FRUCHET - FOSS wrote:
>> Hi Jacopo,
>>
>> Patch proposed below to support framerate change both with frame interval
>> setting and vblank control.
>>
>> On 2/24/22 10:43 AM, Jacopo Mondi wrote:
>>> Add the VBLANK control which allows to select the duration of the
>>> frame vertical blankings and allows to control the framerate.
>>>
>>> The VBLANK control also modifies the exposure time range, which cannot
>>> exceed the maximum frame length.
>>>
>>> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
>>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> ---
>>>    drivers/media/i2c/ov5640.c | 52 ++++++++++++++++++++++++++++++++++++++
>>>    1 file changed, 52 insertions(+)
>>>
>>> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
>>> index 5419c7236348..665a8bcebf09 100644
>>> --- a/drivers/media/i2c/ov5640.c
>>> +++ b/drivers/media/i2c/ov5640.c
>>> @@ -36,6 +36,10 @@
>>>    #define OV5640_PIXEL_ARRAY_WIDTH	2592
>>>    #define OV5640_PIXEL_ARRAY_HEIGHT	1944
>>> +/* FIXME: not documented. */
>>> +#define OV5640_MIN_VBLANK	24
>>> +#define OV5640_MAX_VTS		1968
>>
>> Not enough to support 1024x768@15fps (vblank=2607):
>> +#define OV5640_MAX_VTS		3375 /* 1024x768@15fps, vblank=2607 */
> 
> I guess this applies to all modes, as 1024x768 has the same htot and
> vtot as lower resolution modes (just an higher default frame rate as
> it proved to be more stable for high-freq capture in my testing).
> 
> Indeed to slow FPS down either blankings are enlarged or the pixel
> rate is reduced. I reported in the cover letter that to increase the
> frame rate (for example VGA@60Hz) the pixel rate should be increased.
> 
> As the pixel rate is a RO control, we should allow userspace to
> control LINK_FREQ, which is now registered as read-only to do so.
> 
> -------------- From cover letter ----------------------------------------
> 
> To enable higher FPS the LINK_FREQ control should be made writable to increase
> the pixel rate (default for 640x480 is 48MHz)
> 
>    640x480 YUYV 60 FPS (pixel_rate = 96 Mhz)
> 
>          $ yavta -f YUYV -s 640x480 -c100 --skip 7 /dev/video0
>          ...
>          9 (1) [-] any 10 614400 B 57.098649 57.098667 59.995 fps ts mono/EoF
>          10 (2) [-] any 11 614400 B 57.115314 57.115332 60.006 fps ts mono/EoF
> 
> --------------------------------------------------------------------------
> 
> To achive slower FPS, the pixel rate can be reduced. In example, to
> get 1024x768@15FPS let's reduce the pixel clock to 48Mhz in the driver
> (default is 96)
> 
> ---------------------------------------------------------------------------
> 
>          vblank = (10^6/15) * 48 / hblank - height)
>                 = 919
> 
>          # v4l2-ctl -d /dev/v4l-subdev4 -c 0x009e0901=919
>          # v4l2-ctl -l -d /dev/v4l-subdev4
>                ...
>                vertical_blanking 0x009e0901 (int)    : min=24 max=2895 step=1 default=520 value=919
>                ...
>                pixel_rate 0x009f0902 (int64)  : min=48000000 max=168000000 step=1 default=48000000 value=48000000 flags=read-only
>                ...
> 
>          # yavta..
>          0 (0) [-] any 0 1572864 B 197.054072 197.054091 20.519 fps ts mono/EoF
>          1 (1) [-] any 1 1572864 B 197.120665 197.120683 15.017 fps ts mono/EoF
>          2 (2) [-] any 2 1572864 B 197.187260 197.187278 15.016 fps ts mono/EoF
>          3 (3) [-] any 3 1572864 B 197.253854 197.253873 15.016 fps ts mono/EoF
>          4 (0) [-] any 4 1572864 B 197.320449 197.320469 15.016 fps ts mono/EoF
>          5 (1) [-] any 5 1572864 B 197.387044 197.387068 15.016 fps ts mono/EoF
>          6 (2) [-] any 6 1572864 B 197.453636 197.453659 15.017 fps ts mono/EoF
>          7 (3) [-] any 7 1572864 B 197.520232 197.520257 15.016 fps ts mono/EoF
> ---------------------------------------------------------------------------
> 
> Hence I think the real solution would be to make LINK_FREQ
> controllable by userspace to enlarge the number of achievable
> configurations. I thought it was safer to make LINK_FREQ writable on
> top, but can be fast-tracked if desired.
> 
> Ofc enlarging VBLANK max is an option as well, unfortunately I haven't
> found documented anywhere what the max value is, and depending on the
> mode I've seen contradictory results.


My opinion is that we cannot continue this way increasing more and more 
complexity on application side...
As far as I have understood well, LINK_FREQ control has been introduced 
in order that CSI receivers be informed of the frequency of link so 
pixels sampling goes well, what is the point to expose such hardware 
setting to application ?

For this exact point of 15fps, driver can solve it itself by selecting a 
lower link frequency if vblank is not in the admissible range.

Another option is to continue to use frame interval control, and that 
solve also the VGA@60fps.

> 
> Thanks
>     j
> 
>>
>>
>>> +
>>>    #define OV5640_DEFAULT_SLAVE_ID 0x3c
>>>    #define OV5640_LINK_RATE_MAX		490000000U
>>> @@ -321,6 +325,7 @@ struct ov5640_ctrls {
>>>    	struct v4l2_ctrl *pixel_rate;
>>>    	struct v4l2_ctrl *link_freq;
>>>    	struct v4l2_ctrl *hblank;
>>> +	struct v4l2_ctrl *vblank;
>>>    	struct {
>>>    		struct v4l2_ctrl *auto_exp;
>>>    		struct v4l2_ctrl *exposure;
>>> @@ -2697,6 +2702,7 @@ static int ov5640_update_pixel_rate(struct ov5640_dev *sensor)
>>>    	struct v4l2_mbus_framefmt *fmt = &sensor->fmt;
>>>    	enum ov5640_pixel_rate_id pixel_rate_id = mode->pixel_rate;
>>>    	const struct ov5640_timings *timings;
>>> +	s32 exposure_val, exposure_max;
>>>    	unsigned int hblank;
>>>    	unsigned int i = 0;
>>>    	u32 pixel_rate;
>>> @@ -2755,6 +2761,19 @@ static int ov5640_update_pixel_rate(struct ov5640_dev *sensor)
>>>    	__v4l2_ctrl_modify_range(sensor->ctrls.hblank,
>>>    				 hblank, hblank, 1, hblank);
>>> +	__v4l2_ctrl_modify_range(sensor->ctrls.vblank, OV5640_MIN_VBLANK,
>>> +				 OV5640_MAX_VTS - mode->height, 1,
>>> +				 timings->vblank_def);
>>> +	__v4l2_ctrl_s_ctrl(sensor->ctrls.vblank, timings->vblank_def);
>>> +
>>> +	exposure_max = timings->crop.height + timings->vblank_def - 4;
>>> +	exposure_val = clamp_t(s32, sensor->ctrls.exposure->val,
>>> +			       sensor->ctrls.exposure->minimum,
>>> +			       exposure_max);
>>> +	__v4l2_ctrl_modify_range(sensor->ctrls.exposure,
>>> +				 sensor->ctrls.exposure->minimum,
>>> +				 exposure_max, 1, exposure_val);
>>> +
>>
>> +	vblank = timings->vblank_def;
>> +
>> +	if (sensor->current_fr != timings->def_fps) {
>> +		/* Compute the blanking according to the required framerate */
>> +
>> +		int fie_num = sensor->frame_interval.numerator;
>> +		int fie_denom = sensor->frame_interval.denominator;
>> +
>> +		vblank = ((fie_num * pixel_rate / fie_denom) / timings->htot) -
>> +			 mode->height;
>> +	}
>> +
>>   	__v4l2_ctrl_modify_range(sensor->ctrls.vblank, OV5640_MIN_VBLANK,
>>   				 OV5640_MAX_VTS - mode->height, 1,
>> -				 timings->vblank_def);
>> -	__v4l2_ctrl_s_ctrl(sensor->ctrls.vblank, timings->vblank_def);
>> +				 vblank);
>> +	__v4l2_ctrl_s_ctrl(sensor->ctrls.vblank, vblank);
>>
>> -	exposure_max = timings->crop.height + timings->vblank_def - 4;
>> +	exposure_max = timings->crop.height + vblank - 4;
>>   	exposure_val = clamp_t(s32, sensor->ctrls.exposure->val,
>>   			       sensor->ctrls.exposure->minimum,
>>   			       exposure_max);
>>
>>
>>
>> @@ -3606,8 +3636,7 @@ static int ov5640_s_frame_interval(struct v4l2_subdev
>> *sd,
>>   		sensor->current_mode = mode;
>>   		sensor->pending_mode_change = true;
>>
>> -		__v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixel_rate,
>> -					 ov5640_calc_pixel_rate(sensor));
>> +		ov5640_update_pixel_rate(sensor);
>>   	}
>>   out:
>>   	mutex_unlock(&sensor->lock);
>>
>>
>> Added def_fps (default framerate) in order to known when using vblank_def
>> and when computing it from frame interval:
>>
>>
>> @@ -383,6 +383,8 @@ struct ov5640_timings {
>>   	u32 vblank_def;
>>   	/* DVP only; ignored in MIPI mode. */
>>   	u32 max_fps;
>> +	/* CSI-2 only; default fps for default blanking */
>> +	u32 def_fps;
>>   };
>>
>> @@ -719,6 +722,7 @@ static const struct ov5640_mode_info
>> ov5640_mode_data[OV5640_NUM_MODES] = {
>>   			},
>>   			.htot		= 1600,
>>   			.vblank_def	= 878,
>> +			.def_fps	= OV5640_30_FPS
>> [...]
>> @@ -1108,6 +1120,7 @@ static const struct ov5640_mode_info
>> ov5640_mode_data[OV5640_NUM_MODES] = {
>>   			},
>>   			.htot		= 2844,
>>   			.vblank_def	= 24,
>> +			.def_fps	= OV5640_15_FPS
>>   		},
>>
>>
>>>    	return 0;
>>>    }
>>> @@ -3127,6 +3146,15 @@ static int ov5640_set_ctrl_vflip(struct ov5640_dev *sensor, int value)
>>>    			      (BIT(2) | BIT(1)) : 0);
>>>    }
>>> +static int ov5640_set_ctrl_vblank(struct ov5640_dev *sensor, int value)
>>> +{
>>> +	const struct ov5640_mode_info *mode = sensor->current_mode;
>>> +
>>> +	/* Update the VTOT timing register value. */
>>> +	return ov5640_write_reg16(sensor, OV5640_REG_TIMING_VTS,
>>> +				  mode->height + value);
>>> +}
>>> +
>>>    static int ov5640_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
>>>    {
>>>    	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
>>> @@ -3157,10 +3185,25 @@ static int ov5640_s_ctrl(struct v4l2_ctrl *ctrl)
>>>    {
>>>    	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
>>>    	struct ov5640_dev *sensor = to_ov5640_dev(sd);
>>> +	const struct ov5640_mode_info *mode = sensor->current_mode;
>>> +	const struct ov5640_timings *timings;
>>> +	unsigned int exp_max;
>>>    	int ret;
>>>    	/* v4l2_ctrl_lock() locks our own mutex */
>>> +	switch (ctrl->id) {
>>> +	case V4L2_CID_VBLANK:
>>> +		/* Update the exposure range to the newly programmed vblank. */
>>> +		timings = ov5640_timings(sensor, mode);
>>> +		exp_max = mode->height + ctrl->val - 4;
>>> +		__v4l2_ctrl_modify_range(sensor->ctrls.exposure,
>>> +					 sensor->ctrls.exposure->minimum,
>>> +					 exp_max, sensor->ctrls.exposure->step,
>>> +					 timings->vblank_def);
>>> +		break;
>>> +	}
>>> +
>>>    	/*
>>>    	 * If the device is not powered up by the host driver do
>>>    	 * not apply any controls to H/W at this time. Instead
>>> @@ -3200,6 +3243,9 @@ static int ov5640_s_ctrl(struct v4l2_ctrl *ctrl)
>>>    	case V4L2_CID_VFLIP:
>>>    		ret = ov5640_set_ctrl_vflip(sensor, ctrl->val);
>>>    		break;
>>> +	case V4L2_CID_VBLANK:
>>> +		ret = ov5640_set_ctrl_vblank(sensor, ctrl->val);
>>> +		break;
>>>    	default:
>>>    		ret = -EINVAL;
>>>    		break;
>>> @@ -3220,6 +3266,7 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
>>>    	struct ov5640_ctrls *ctrls = &sensor->ctrls;
>>>    	struct v4l2_ctrl_handler *hdl = &ctrls->handler;
>>>    	const struct ov5640_timings *timings;
>>> +	unsigned int max_vblank;
>>>    	unsigned int hblank;
>>>    	int ret;
>>> @@ -3245,6 +3292,11 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
>>>    	ctrls->hblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HBLANK, hblank,
>>>    					  hblank, 1, hblank);
>>> +	max_vblank = OV5640_MAX_VTS - mode->height;
>>> +	ctrls->vblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VBLANK,
>>> +					  OV5640_MIN_VBLANK, max_vblank,
>>> +					  1, timings->vblank_def);
>>> +
>>>    	/* Auto/manual white balance */
>>>    	ctrls->auto_wb = v4l2_ctrl_new_std(hdl, ops,
>>>    					   V4L2_CID_AUTO_WHITE_BALANCE,
>>>
>>
>> Hugues.

Best regards,

Hugues.
