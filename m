Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61480579743
	for <lists+linux-media@lfdr.de>; Tue, 19 Jul 2022 12:05:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237552AbiGSKFD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Jul 2022 06:05:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237578AbiGSKEu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Jul 2022 06:04:50 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27DC13DBE5
        for <linux-media@vger.kernel.org>; Tue, 19 Jul 2022 03:04:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C61BFB81A85
        for <linux-media@vger.kernel.org>; Tue, 19 Jul 2022 10:04:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10B9FC341C6;
        Tue, 19 Jul 2022 10:04:06 +0000 (UTC)
Message-ID: <600d543a-7445-3634-dbf7-cf3b01c6a2a4@xs4all.nl>
Date:   Tue, 19 Jul 2022 12:04:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] media: sunxi: sun6i_mipi_csi2.c/sun8i_a83t_mipi_csi2.c:
 clarify error handling
Content-Language: en-US
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
References: <815bc07c-20ef-86ba-1492-54c77afc7a1f@xs4all.nl>
 <YtZ/VmLgnnn2tlAK@aptenodytes>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <YtZ/VmLgnnn2tlAK@aptenodytes>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 7/19/22 11:54, Paul Kocialkowski wrote:
> Hi Hans,
> 
> On Mon 18 Jul 22, 18:08, Hans Verkuil wrote:
>> Both sun6i_mipi_csi2.c and sun8i_a83t_mipi_csi2.c have the same issue:
>> the comment before the ret = 0 assignment is incorrect, drop it and
>> always assign the result of the v4l2_subdev_call(..., 0) to ret.
> 
> Not sure what is incorrect about it. I agree that it's good to return the
> return code of v4l2_subdev_call instead of always 0 on the !on path though.
> 
>> In the disable label check for !on and set ret to 0 in that case.
>>
>> This fixes two smatch warnings:
>>
>> drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c:193 sun6i_mipi_csi2_s_stream() warn: missing error code 'ret'
> 
> I don't think this is legit: the initialization of ret is specifically there
> to avoid an undefined ret there.

I believe so as well, but I need to get rid of the smatch warning.

> 
>> drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c:225 sun8i_a83t_mipi_csi2_s_stream() warn: missing error code 'ret'
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>>  .../media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c | 7 ++++---
>>  .../sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c      | 7 ++++---
>>  2 files changed, 8 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
>> index 31e12f1506cb..a4e3f9a6b2ff 100644
>> --- a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
>> +++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
>> @@ -182,14 +182,13 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
>>  	unsigned int lanes_count =
>>  		csi2_dev->bridge.endpoint.bus.mipi_csi2.num_data_lanes;
>>  	unsigned long pixel_rate;
>> -	/* Initialize to 0 to use both in disable label (ret != 0) and off. */
>> -	int ret = 0;
>> +	int ret;
>>  
>>  	if (!source_subdev)
>>  		return -ENODEV;
>>  
>>  	if (!on) {
>> -		v4l2_subdev_call(source_subdev, video, s_stream, 0);
>> +		ret = v4l2_subdev_call(source_subdev, video, s_stream, 0);
>>  		goto disable;
>>  	}
>>  
>> @@ -281,6 +280,8 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
>>  	return 0;
>>  
>>  disable:
>> +	if (!on)
>> +		ret = 0;
> 
> Then this will always overwrite the ret value from v4l2_subdev_call with the
> !on disable path. Looks like this can be removed.

Returning an error when stopping streaming is kind of pointless, since
what are you going to do with that error?

I assumed that's why the original code did this, and I didn't want to
change the behavior.

If you think it is better to just return the error, then that can be a
patch on top.

BTW, I think it would have been better to have separate streamon and streamoff
ops instead of a single s_stream. Starting streaming would return an int, while
stopping streaming would be a void function. In general when you stop, release,
close, etc. something there is no point in an error code since there is nothing
you can do with it.

Regards,

	Hans

> 
> What do you think?
> 
> Paul
> 
>>  	phy_power_off(dphy);
>>  	sun6i_mipi_csi2_disable(csi2_dev);
>>  
>> diff --git a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
>> index c82ede3ca0ff..d052ee77ef0a 100644
>> --- a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
>> +++ b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
>> @@ -214,14 +214,13 @@ static int sun8i_a83t_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
>>  	unsigned int lanes_count =
>>  		csi2_dev->bridge.endpoint.bus.mipi_csi2.num_data_lanes;
>>  	unsigned long pixel_rate;
>> -	/* Initialize to 0 to use both in disable label (ret != 0) and off. */
>> -	int ret = 0;
>> +	int ret;
>>  
>>  	if (!source_subdev)
>>  		return -ENODEV;
>>  
>>  	if (!on) {
>> -		v4l2_subdev_call(source_subdev, video, s_stream, 0);
>> +		ret = v4l2_subdev_call(source_subdev, video, s_stream, 0);
>>  		goto disable;
>>  	}
>>  
>> @@ -313,6 +312,8 @@ static int sun8i_a83t_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
>>  	return 0;
>>  
>>  disable:
>> +	if (!on)
>> +		ret = 0;
>>  	phy_power_off(dphy);
>>  	sun8i_a83t_mipi_csi2_disable(csi2_dev);
>>  
>> -- 
>> 2.35.1
>>
> 
