Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABB7E256988
	for <lists+linux-media@lfdr.de>; Sat, 29 Aug 2020 19:53:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728265AbgH2Rxe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Aug 2020 13:53:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728254AbgH2Rxc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Aug 2020 13:53:32 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 746F0C061236
        for <linux-media@vger.kernel.org>; Sat, 29 Aug 2020 10:53:32 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id F17EB299053
Subject: Re: [PATCH v3 07/10] media: staging: rkisp1: rsz: enumerate the
 formats on the src pad according to the capture
To:     Helen Koike <helen.koike@collabora.com>,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com, mchehab@kernel.org,
        tfiga@chromium.org
References: <20200723132014.4597-1-dafna.hirschfeld@collabora.com>
 <20200723132014.4597-8-dafna.hirschfeld@collabora.com>
 <71b4742a-8f47-2709-010f-b2037cfab5fd@collabora.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <1ba8d739-8d18-0284-ab37-c0d73f549ab7@collabora.com>
Date:   Sat, 29 Aug 2020 19:53:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <71b4742a-8f47-2709-010f-b2037cfab5fd@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Am 04.08.20 um 01:50 schrieb Helen Koike:
> Hi Dafna,
> 
> On 7/23/20 10:20 AM, Dafna Hirschfeld wrote:
>> Currently the resizer outputs the same media bus format
>> as the input. This is wrong since the resizer is also used
>> to downscale YUV formats. This patch changes the enumeration
>> of the supported formats. The supported formats on the sink pad
>> should be taken from the isp entity and the supported formats on
>> the source pad should be taken from the capture entity.
>>
>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>> ---
>>   drivers/staging/media/rkisp1/rkisp1-resizer.c | 41 ++++++++++++-------
>>   1 file changed, 26 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
>> index 066d22096a7d..4e87c6f3f732 100644
>> --- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
>> +++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
>> @@ -433,24 +433,35 @@ static int rkisp1_rsz_enum_mbus_code(struct v4l2_subdev *sd,
>>   {
>>   	struct rkisp1_resizer *rsz =
>>   		container_of(sd, struct rkisp1_resizer, sd);
>> -	struct v4l2_subdev_pad_config dummy_cfg;
>> -	u32 pad = code->pad;
>>   	int ret;
>>   
>> -	if (rsz->id == RKISP1_SELFPATH) {
>> -		if (code->index > 0)
>> -			return -EINVAL;
>> -		code->code = MEDIA_BUS_FMT_YUYV8_2X8;
>> -		return 0;
>> +	/* supported mbus codes on the sink pad are the same as isp src pad */
>> +	if (code->pad == RKISP1_RSZ_PAD_SINK) {
>> +		struct v4l2_subdev_pad_config dummy_cfg;
>> +		u32 pad = code->pad;
>> +
>> +		/*
>> +		 * the sp capture doesn't support bayer formats so the sp resizer
>> +		 * supports only yuv422
>> +		 */
>> +		if (rsz->id == RKISP1_SELFPATH) {
>> +			if (code->index > 0)
>> +				return -EINVAL;
>> +			code->code = MEDIA_BUS_FMT_YUYV8_2X8;
>> +			return 0;
>> +		}
>> +		code->pad = RKISP1_ISP_PAD_SOURCE_VIDEO;
>> +		ret = v4l2_subdev_call(&rsz->rkisp1->isp.sd, pad, enum_mbus_code,
>> +				       &dummy_cfg, code);
>> +
>> +		/* restore pad */
>> +		code->pad = pad;
>> +	} else {
>> +		/* supported mbus codes on the src are the same as in the capture */
>> +		struct rkisp1_capture *cap = &rsz->rkisp1->capture_devs[rsz->id];
>> +
>> +		ret = rkisp1_cap_enum_mbus_codes(cap, code);
>>   	}
>> -
>> -	/* supported mbus codes are the same in isp video src pad */
>> -	code->pad = RKISP1_ISP_PAD_SOURCE_VIDEO;
>> -	ret = v4l2_subdev_call(&rsz->rkisp1->isp.sd, pad, enum_mbus_code,
>> -			       &dummy_cfg, code);
>> -
>> -	/* restore pad */
>> -	code->pad = pad;
>>   	return ret;
>>   }
>>   
>>
> 
> I think you can reduce indentation by doing:
> 
> 	/* supported mbus codes on the src are the same as in the capture */
> 	if (code->pad == RKISP1_RSZ_PAD_SRC)
> 		return kisp1_cap_enum_mbus_codes(
> 			&rsz->rkisp1->capture_devs[rsz->id], code);
> 
> 	// ... rest of the code for sink pad without an else statement

I think it will make the code a bit less clear, since one should note that there is a return statement inside the first 'if'
and conclude that the rest is the 'else' case. With 'if-else' it is more clear what code run under which condition.

Thanks,
Dafna

> 
