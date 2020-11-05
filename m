Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19BB22A7EFB
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 13:50:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730501AbgKEMu2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 07:50:28 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:37367 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730577AbgKEMu2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Nov 2020 07:50:28 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id aeibkD0GHNanzaeifkoNB7; Thu, 05 Nov 2020 13:50:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1604580625; bh=gLIsuZG8GTY+QYVfWWAesdsXd2UfBf7dmJxTf1nR7WY=;
        h=Subject:From:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=MMWilpbQMpT8oDSacKEBLrQz28T3FlXJgoruPt65sQ4VhboysfAnsPfipuZ8Yog6m
         g9DHQq1Lllu4sRwjPGMWFMs4z5vIBDprulYa67pxnjmBGqjrZuI9ue01Gk7U1eqg2r
         U9EK2yUt0oCXrXaYPbgv4MeEr1/p7F/MDNrhbTr9Wcoss6KWHvxtLR/sk/FSgUSynv
         i+1tQN01i7/UlsdaHPwHnoi1xHxebfJnPfTY0JpdADnx7iJANIy/wXSNipQfbMX0r8
         wYmNMDOwHYTCNwaWj0Fj5RonMjzp3rFTGBX8XHNJdaiymr149uHnyYRZAkUSpx8tQP
         95yGowwp5h4hQ==
Subject: Re: [PATCH v2 100/106] ccs: Add support for analogue gain coefficient
 controls
From:   Hans Verkuil <hverkuil@xs4all.nl>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-91-sakari.ailus@linux.intel.com>
 <074fd0e4-f16c-c2cd-1d30-f55a1993ad36@xs4all.nl>
Message-ID: <de88c362-f0cd-52ba-0628-3bdcd370219c@xs4all.nl>
Date:   Thu, 5 Nov 2020 13:50:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <074fd0e4-f16c-c2cd-1d30-f55a1993ad36@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfIcah9w9auePvrwnkuIyDEUFGU419/Of4EZ/3dZFZCoFtTRA7HEdF9PCOPB8kKK3I7vOHMjqfswmy3x5qDMxFjcHLQqfyPqyRmhVHSF+4D3+iRIBjgWc
 dTbsEE7SGDOyY6tMG3OABvxD5ZdhJL5aElbo8XRJ/ZY9hlP4u89hK3/ifj2BTm1hiCRwYachKHTUASLwAlutyXehOjDhFcOBZ7vVxWPU2MjkXzMpGqG//w7y
 N1aleHvOiuC1GOjU7McGjA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/11/2020 13:46, Hans Verkuil wrote:
> On 07/10/2020 10:45, Sakari Ailus wrote:
>> Add four controls for reading CCS analogue gain coefficients. The
>> values are constants that are device specific.
>>
>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>> ---
>>  drivers/media/i2c/ccs/ccs-core.c | 38 ++++++++++++++++++++++++++++++--
>>  1 file changed, 36 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
>> index d6d6aeceb415..2a507b63bafc 100644
>> --- a/drivers/media/i2c/ccs/ccs-core.c
>> +++ b/drivers/media/i2c/ccs/ccs-core.c
>> @@ -28,6 +28,7 @@
>>  #include <linux/v4l2-mediabus.h>
>>  #include <media/v4l2-fwnode.h>
>>  #include <media/v4l2-device.h>
>> +#include <uapi/linux/ccs.h>
>>  
>>  #include "ccs.h"
>>  
>> @@ -772,14 +773,46 @@ static int ccs_init_controls(struct ccs_sensor *sensor)
>>  	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
>>  	int rval;
>>  
>> -	rval = v4l2_ctrl_handler_init(&sensor->pixel_array->ctrl_handler, 13);
>> +	rval = v4l2_ctrl_handler_init(&sensor->pixel_array->ctrl_handler, 17);
>>  	if (rval)
>>  		return rval;
>>  
>>  	sensor->pixel_array->ctrl_handler.lock = &sensor->mutex;
>>  
>>  	switch (CCS_LIM(sensor, ANALOG_GAIN_CAPABILITY)) {
>> -	case CCS_ANALOG_GAIN_CAPABILITY_GLOBAL:
>> +	case CCS_ANALOG_GAIN_CAPABILITY_GLOBAL: {
>> +		struct {
> 
> Can this be static?

Ah, no. The value is sensor dependent. Sorry, ignore this.

> 
>> +			const char *name;
>> +			u32 id;
>> +			s32 value;
>> +		} const gain_ctrls[] = {
>> +			{ "Analogue Gain m0", V4L2_CID_CCS_ANALOGUE_GAIN_M0,
> 
> Why lower case 'm0/1' and 'c0/1'? It looks odd.
> 
>> +			  CCS_LIM(sensor, ANALOG_GAIN_M0), },
>> +			{ "Analogue Gain c0", V4L2_CID_CCS_ANALOGUE_GAIN_C0,
>> +			  CCS_LIM(sensor, ANALOG_GAIN_C0), },
>> +			{ "Analogue Gain m1", V4L2_CID_CCS_ANALOGUE_GAIN_M1,
>> +			  CCS_LIM(sensor, ANALOG_GAIN_M1), },
>> +			{ "Analogue Gain c1", V4L2_CID_CCS_ANALOGUE_GAIN_C1,
>> +			  CCS_LIM(sensor, ANALOG_GAIN_C1), },
>> +		};
>> +		struct v4l2_ctrl_config ctrl_cfg = {
>> +			.type = V4L2_CTRL_TYPE_INTEGER,
>> +			.ops = &ccs_ctrl_ops,
>> +			.flags = V4L2_CTRL_FLAG_READ_ONLY,
>> +			.step = 1,
>> +		};
> 
> This looks a bit weird. Most drivers just define each control separately in
> a static const struct v4l2_ctrl_config, then add them with v4l2_ctrl_new_custom.
> 
> Now the control definition data is split up in two data structures.
> 
> It's not wrong, it is just non-standard, and a bit harder to review.

Ignore this as well, it's because some values aren't constant.

Regards,

	Hans

> 
>> +		unsigned int i;
>> +
>> +		for (i = 0; i < ARRAY_SIZE(gain_ctrls); i++) {
>> +			ctrl_cfg.name = gain_ctrls[i].name;
>> +			ctrl_cfg.id = gain_ctrls[i].id;
>> +			ctrl_cfg.min = ctrl_cfg.max = ctrl_cfg.def =
>> +				gain_ctrls[i].value;
>> +
>> +			v4l2_ctrl_new_custom(&sensor->pixel_array->ctrl_handler,
>> +					     &ctrl_cfg, NULL);
>> +		}
>> +
>>  		v4l2_ctrl_new_std(&sensor->pixel_array->ctrl_handler,
>>  				  &ccs_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
>>  				  CCS_LIM(sensor, ANALOG_GAIN_CODE_MIN),
>> @@ -788,6 +821,7 @@ static int ccs_init_controls(struct ccs_sensor *sensor)
>>  				      1U),
>>  				  CCS_LIM(sensor, ANALOG_GAIN_CODE_MIN));
>>  	}
>> +	}
>>  
>>  	if (CCS_LIM(sensor, DIGITAL_GAIN_CAPABILITY) ==
>>  	    CCS_DIGITAL_GAIN_CAPABILITY_GLOBAL ||
>>
> 
> Regards,
> 
> 	Hans
> 

