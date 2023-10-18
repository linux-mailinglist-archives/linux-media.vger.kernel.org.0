Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A38F67CDF80
	for <lists+linux-media@lfdr.de>; Wed, 18 Oct 2023 16:25:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345458AbjJROYh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Oct 2023 10:24:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345703AbjJROYO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Oct 2023 10:24:14 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F9E72D7E
        for <linux-media@vger.kernel.org>; Wed, 18 Oct 2023 07:14:07 -0700 (PDT)
Received: from [192.168.1.110] (unknown [103.251.226.39])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 220952B3;
        Wed, 18 Oct 2023 16:13:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1697638436;
        bh=T6znvjCpdoVhyRNoGfmixwrBosBMSA+xHC0XJbAihYU=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=PuPuCGzJvXlzkqqT36BrZZM2m+xveCuQQHWYiR0kYJcjiD3nsygnk6l6HxtWK5JPD
         i4tBQonNNPtqhZhXqKo8BijS3wQ0lHAVYDIs+kAzH3EnXzmQ9Q2Xh6qMS28PWLP6g2
         apI7onGscOLysonweK0hRVeLyg9z7P7UWZ0H6jHQ=
Message-ID: <a7d946b2-20e4-b0b3-deb9-e72339021797@ideasonboard.com>
Date:   Wed, 18 Oct 2023 19:43:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] media: css: Write LINE_LENGTH_PCK correctly
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
References: <20231018131729.1022521-1-umang.jain@ideasonboard.com>
 <ZS/iK+I6xbXbNUbQ@kekkonen.localdomain>
From:   Umang Jain <umang.jain@ideasonboard.com>
In-Reply-To: <ZS/iK+I6xbXbNUbQ@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On 10/18/23 7:18 PM, Sakari Ailus wrote:
> hi Umang,
>
> On Wed, Oct 18, 2023 at 06:47:29PM +0530, Umang Jain wrote:
>> According to MIPI CCS v1.1 specification, the LINE_LENGTH_PCK
>> units is in VT pixel clocks (Section 8.2.6).
>>
>> To compute how many pixel clocks it takes, simply divide the
>> VT pixel clock frequency by the number of pixels in a single line.
>>
>> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
>> ---
>> Testing:
>>
>> The patch is tested using IMX519 with CCS.
>> This patch makes the frame buffer being filled to the fullest
>> (instead of getting 1/3rd only previously) - without any workarounds.
>> ---
>>   drivers/media/i2c/ccs/ccs-core.c | 8 +++++---
>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
>> index 16de66a37fad..12c75a843dfe 100644
>> --- a/drivers/media/i2c/ccs/ccs-core.c
>> +++ b/drivers/media/i2c/ccs/ccs-core.c
>> @@ -734,9 +734,11 @@ static int ccs_set_ctrl(struct v4l2_ctrl *ctrl)
>>   
>>   		break;
>>   	case V4L2_CID_HBLANK:
>> -		rval = ccs_write(sensor, LINE_LENGTH_PCK,
>> -				 sensor->pixel_array->crop[CCS_PA_PAD_SRC].width
>> -				 + ctrl->val);
>> +		/* LINE_LENGTH_PCK units are in VT pixel clocks. */
>> +		u16 line_length_pck =
>> +			sensor->pll.vt_bk.pix_clk_freq_hz /
>> +			(sensor->pixel_array->crop[CCS_PA_PAD_SRC].width + ctrl->val);
> The time of processing one pixel in the pixel array takes a single VT pixel


I mis-interpreted this, where it got all wrong. I assumed single VT 
pixel clock = no. of pixels processed in one second which is not correct.

I have been pointed out that pixel clock and pixel clock rate (frequency 
I suppose) are different. I thought in terms of "Hz" :-S

So yes if 1 VT pixel clock is duration of  one pixel processing from 
pixel_array, the line_length_pck is correct without this patch.

> clock. This register configures how many you have per line, i.e. analogue
> crop width + horizontal blanking --- which is what the driver does without
> this patch.
>
> I'm still not suggesting the default value for LINE_LENGTH_PCK CCS driver
> programs is correct value for this device. The issue is still almost
> certainly in the related limit register values in the sensor's register
> address space, and that should be addressed by using CCS static data.
>
>> +		rval = ccs_write(sensor, LINE_LENGTH_PCK, line_length_pck);
>>   
>>   		break;
>>   	case V4L2_CID_TEST_PATTERN:

