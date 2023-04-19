Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A0376E74EA
	for <lists+linux-media@lfdr.de>; Wed, 19 Apr 2023 10:22:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232410AbjDSIWI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Apr 2023 04:22:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232452AbjDSIWE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Apr 2023 04:22:04 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 679EDCC2D
        for <linux-media@vger.kernel.org>; Wed, 19 Apr 2023 01:21:53 -0700 (PDT)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 77ABC12F;
        Wed, 19 Apr 2023 10:21:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1681892503;
        bh=EbG/7qzuDuaqXgHZa18hwMKofN+6dzNIctdNVLNhHv8=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=PWKjLCrA/IJ/76oQqlRc8++AUpfZanBJsjylU1RO8u3ajvcp+Y1SUoOsr7x+QAjQ7
         ydDRFvqU5gyvgkYEavv/TYfKqc7HykvZz3A842tSA1rI6plWP35+MqVAdhPNIl42Hm
         /aBjA9pA7t+Hmisd+aY6yYaihCxxrm60CbzRbKig=
Message-ID: <1d85b70c-a896-87b9-62a4-5161d52b1ab0@ideasonboard.com>
Date:   Wed, 19 Apr 2023 11:21:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] media: i2c: add ov01a10 image sensor driver
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@linux.intel.com>
Cc:     Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org
References: <1675941758-21433-1-git-send-email-bingbu.cao@intel.com>
 <Y+TvvbfRSGUNKBCf@kekkonen.localdomain>
 <793aa7a4-0b8b-dc55-2d91-9aa58e6735fd@linux.intel.com>
 <ZDahyjzMD/LvOjlG@kekkonen.localdomain>
 <caac8f63-1506-1e84-87fc-4556c2f7e369@linux.intel.com>
 <ZD+geUBBvqHQ1Ssy@kekkonen.localdomain>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <ZD+geUBBvqHQ1Ssy@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 19/04/2023 11:04, Sakari Ailus wrote:
> Hi Bingbu,
> 
> On Wed, Apr 19, 2023 at 03:44:25PM +0800, Bingbu Cao wrote:
>> Sakari,
>>
>> On 4/12/23 8:19 PM, Sakari Ailus wrote:
>>> Hi Bingbu,
>>>
>>> On Wed, Apr 12, 2023 at 07:40:19PM +0800, Bingbu Cao wrote:
>>>>>> +static int ov01a10_set_format(struct v4l2_subdev *sd,
>>>>>> +			      struct v4l2_subdev_state *sd_state,
>>>>>> +			      struct v4l2_subdev_format *fmt)
>>>>>> +{
>>>>>> +	struct ov01a10 *ov01a10 = to_ov01a10(sd);
>>>>>> +	const struct ov01a10_mode *mode;
>>>>>> +	s32 vblank_def, h_blank;
>>>>>> +
>>>>>> +	mode = v4l2_find_nearest_size(supported_modes,
>>>>>> +				      ARRAY_SIZE(supported_modes), width,
>>>>>> +				      height, fmt->format.width,
>>>>>> +				      fmt->format.height);
>>>>>> +
>>>>>> +	mutex_lock(&ov01a10->mutex);
>>>>>> +	ov01a10_update_pad_format(mode, &fmt->format);
>>>>>
>>>>> Could you switch to the sub-device state? That is now the preferred way to
>>>>> serialise access to e.g. the format.
>>>>>
>>>>> See e.g.
>>>>> <URL:https://git.kernel.org/pub/scm/linux/kernel/git/tomba/linux.git/tree/drivers/media/i2c/ov1063x.c?h=streams/work-v16>.
>>>>>
>>>>> The control handler's mutex doubles as a sub-device state mutex.
>>>>
>>>> Is it fine to use v4l2_subdev_get_fmt()? Or will it be deprecated soon?
>>>
>>> Sure, it's fine to use it.
>>>
>>
>> I tried to use the v4l2_subdev_state_get_stream_format() in set_fmt, but I
>> see that the pad format of camera sensor was missing in media information.
>>
>> - entity 105: ov01a10 3-0036 (1 pad, 1 link)
>>                type V4L2 subdev subtype Sensor flags 0
>>                device node name /dev/v4l-subdev8
>> 	pad0: Source
>> 		-> "Intel IPU6 CSI2 2":0 [ENABLED]
>>
>> And the link validation cannot work as expected, is there something
>> missing? My kernel head is Linux 6.3-rc2.
>>
>> static int ov01a10_set_format(struct v4l2_subdev *sd,
>> 			      struct v4l2_subdev_state *sd_state,
>> 			      struct v4l2_subdev_format *fmt)
>> {
>> ...
>> 	format = v4l2_subdev_state_get_stream_format(sd_state, fmt->pad,
>> 						     fmt->stream);
>> 	if (!format) {
>> 		dev_err(&client->dev, "Failed to get stream format\n");
>> 		return -EINVAL;
>> 	}
>>
>> ...
>> 	ov01a10_update_pad_format(mode, &fmt->format);
>> 	*format = fmt->format;
>>
>> 	return 0;
>> }
> 
> v4l2_subdev_state_get_stream_format() will access streams and I presume you
> won't have any in this case (not even streams support right now as it's a
> sensor driver with a single sub-device).
> 

This perhaps gives a better example on how to migrate to subdev state:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/media/i2c/imx290.c?id=a2514b9a634ac0a2cfbc329822b8fb58ffe23a80

  Tomi

