Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2001920F1AC
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2020 11:32:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731845AbgF3JcU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jun 2020 05:32:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729193AbgF3JcT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jun 2020 05:32:19 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B06E0C061755
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2020 02:32:19 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 181F92A41FF
Subject: Re: [PATCH 20/25] media: ov5647: Program mode only if it has changed
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dave.stevenson@raspberrypi.org,
        naush@raspberrypi.com, mrodin@de.adit-jv.com,
        hugues.fruchet@st.com, mripard@kernel.org, aford173@gmail.com,
        sudipi@jp.adit-jv.com, andrew_gabbasov@mentor.com,
        erosca@de.adit-jv.com, linux-media@vger.kernel.org,
        libcamera-devel@lists.libcamera.org,
        dafna Hirschfeld <dafna3@gmail.com>
References: <20200623100815.10674-1-jacopo@jmondi.org>
 <20200623165550.45835-1-jacopo@jmondi.org>
 <80139e40-914f-c547-922f-91fe3f611202@collabora.com>
 <20200630074305.soctqoaqirfdnvv2@uno.localdomain>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <e3dfbf68-f81b-3349-b3ad-dd9e5f6a0f5f@collabora.com>
Date:   Tue, 30 Jun 2020 11:32:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200630074305.soctqoaqirfdnvv2@uno.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 30.06.20 09:43, Jacopo Mondi wrote:
> Hi Dafna,
> 
> On Mon, Jun 29, 2020 at 07:48:16PM +0200, Dafna Hirschfeld wrote:
>>
>>
>> On 23.06.20 18:55, Jacopo Mondi wrote:
>>> Store in the driver structure a pointer to the currently applied mode
>>> and program a new one at s_stream(1) time only if it has changed.
>>
>> Hi,
>> I think this can be more readably implemented with a 'is_streaming' boolean
>> field.
> 
> How would you like to use an 'is_streaming' flag to decide if the
> sensor mode has to be updated ?

since 'current_mode' is set to NULL upon `ov5647_stream_off`
and you return from 'ov5647_set_stream' immediately if 'mode == current_mode'
it seem very similar to returning immediately from 'ov5647_set_stream' if the
device is currently streaming.

But actually in this patch it seems to be possible to change the mode
while streaming, if the callbacks are executed:

s_stream(1)
s_fmt
s_stream(1)

which is maybe a bug?

Thanks,
Dafna

> 
> Thanks
>     j
> 
> 
>>
>> Thanks,
>> Dafna
>>
>>>
>>> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
>>> ---
>>>    drivers/media/i2c/ov5647.c | 16 +++++++++++++++-
>>>    1 file changed, 15 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
>>> index 39e320f321bd8..ac114269e1c73 100644
>>> --- a/drivers/media/i2c/ov5647.c
>>> +++ b/drivers/media/i2c/ov5647.c
>>> @@ -96,6 +96,7 @@ struct ov5647 {
>>>    	bool				clock_ncont;
>>>    	struct v4l2_ctrl_handler	ctrls;
>>>    	struct ov5647_mode		*mode;
>>> +	struct ov5647_mode		*current_mode;
>>>    };
>>>    static inline struct ov5647 *to_sensor(struct v4l2_subdev *sd)
>>> @@ -750,9 +751,13 @@ static int ov5647_set_virtual_channel(struct v4l2_subdev *sd, int channel)
>>>    static int ov5647_set_mode(struct v4l2_subdev *sd)
>>>    {
>>>    	struct i2c_client *client = v4l2_get_subdevdata(sd);
>>> +	struct ov5647 *sensor = to_sensor(sd);
>>>    	u8 resetval, rdval;
>>>    	int ret;
>>> +	if (sensor->mode == sensor->current_mode)
>>> +		return 0;
>>> +
>>>    	ret = ov5647_read(sd, OV5647_SW_STANDBY, &rdval);
>>>    	if (ret < 0)
>>>    		return ret;
>>> @@ -778,6 +783,8 @@ static int ov5647_set_mode(struct v4l2_subdev *sd)
>>>    			return ret;
>>>    	}
>>> +	sensor->current_mode = sensor->mode;
>>> +
>>>    	return 0;
>>>    }
>>> @@ -816,6 +823,7 @@ static int ov5647_stream_on(struct v4l2_subdev *sd)
>>>    static int ov5647_stream_off(struct v4l2_subdev *sd)
>>>    {
>>> +	struct ov5647 *sensor = to_sensor(sd);
>>>    	int ret;
>>>    	ret = ov5647_write(sd, OV5647_REG_MIPI_CTRL00, MIPI_CTRL00_CLOCK_LANE_GATE |
>>> @@ -827,7 +835,13 @@ static int ov5647_stream_off(struct v4l2_subdev *sd)
>>>    	if (ret < 0)
>>>    		return ret;
>>> -	return ov5647_write(sd, OV5640_REG_PAD_OUT, 0x01);
>>> +	ret = ov5647_write(sd, OV5640_REG_PAD_OUT, 0x01);
>>> +	if (ret < 0)
>>> +		return ret;
>>> +
>>> +	sensor->current_mode = NULL;
>>> +
>>> +	return 0;
>>>    }
>>>    static int set_sw_standby(struct v4l2_subdev *sd, bool standby)
>>>
