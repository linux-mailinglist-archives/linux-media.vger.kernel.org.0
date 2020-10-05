Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 975E2283330
	for <lists+linux-media@lfdr.de>; Mon,  5 Oct 2020 11:28:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725891AbgJEJ22 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Oct 2020 05:28:28 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:46534 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725914AbgJEJ2Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Oct 2020 05:28:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1601890101; x=1604482101;
        h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=2XTki7Wtt8lKhXhxFExEy330dGcZJJ+yCH2YpWzBwuE=;
        b=NMjcHcfWYUt7rqdCM6uP40JvSMLHHKdGnUl3Ek2wQ2ZHstGbOOL7kiLwJGdzd2PT
        ZPgr6NrYWy5evo2poiCe2+v3tskIiyEJnmiWiCeOv9b600eUI1iT6MixV+tc1Izf
        ZuIzcxoGQfBI2mBY9NOv8d2ETc9pnd2lP6U88Zt/w2A=;
X-AuditID: c39127d2-253ff70000001c25-67-5f7ae735d18a
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id EB.6A.07205.537EA7F5; Mon,  5 Oct 2020 11:28:21 +0200 (CEST)
Received: from [172.16.23.108] ([172.16.23.108])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2020100511282131-551518 ;
          Mon, 5 Oct 2020 11:28:21 +0200 
Subject: Re: [PATCH v2 5/5] media: mt9p031: Fix corrupted frame after
 restarting stream
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dirk Bender <d.bender@phytec.de>
References: <20200930105133.139981-1-s.riedmueller@phytec.de>
 <20200930105133.139981-5-s.riedmueller@phytec.de>
 <20201002000549.GK3722@pendragon.ideasonboard.com>
From:   =?UTF-8?Q?Stefan_Riedm=c3=bcller?= <s.riedmueller@phytec.de>
Message-ID: <3c8853a6-de34-014d-d10a-d6a55083c4bf@phytec.de>
Date:   Mon, 5 Oct 2020 11:28:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201002000549.GK3722@pendragon.ideasonboard.com>
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 05.10.2020 11:28:21,
        Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 05.10.2020 11:28:21,
        Serialize complete at 05.10.2020 11:28:21
X-TNEFEvaluated: 1
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPLMWRmVeSWpSXmKPExsWyRoCBS9f0eVW8wZJeSYvOiUvYLS7vmsNm
        0bNhK6vFsk1/mCw+bfnG5MDqMbtjJqvHplWdbB7zTgZ6fN4kF8ASxWWTkpqTWZZapG+XwJXR
        f2ETW0GbQsWvT8+YGxjXSHYxcnJICJhIXNj6nLWLkYtDSGAbo8TKW3/ZIZzTjBKTFn5i6WLk
        4BAWiJR488gFpEFEwEKid9F0RpAaZoEdjBIb1txihmhYxiixfuVbZpAqNgEnicXnO9hAbF4B
        G4k5B14zgQxiEVCRmH8sD8QUBZq5c4clRIWgxMmZT1hAbE4Be4nHq9aygIyUEGhkknix5is7
        xKVCEqcXnwUbzywgL7H97Rwo20xi3uaHULa4xK0n85kmMArNQjJ3FpKWWUhaZiFpWcDIsopR
        KDczOTu1KDNbryCjsiQ1WS8ldRMjMBIOT1S/tIOxb47HIUYmDsZDjBIczEoivHphFfFCvCmJ
        lVWpRfnxRaU5qcWHGKU5WJTEeTfwloQJCaQnlqRmp6YWpBbBZJk4OKUaGONLgmrydj08Uh7N
        MdVGfxdLz+biVsmb+7y/dDwuEM/+bfnwhFWY/MtbeUenNvyct2CF1DbRohtJxYfTd33J+35g
        zpOH+2N0LrGFZor2zfDXerDxTkNChff07sLTC2M+3JaXP+r8LcudO231Cf055lPZGFx+55/i
        P9fL7Vy/P3xndV3KMmGND0osxRmJhlrMRcWJAMqvSchyAgAA
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 02.10.20 02:05, Laurent Pinchart wrote:
> Hi Stefan,
> 
> Thank you for the patch.
> 
> On Wed, Sep 30, 2020 at 12:51:33PM +0200, Stefan Riedmueller wrote:
>> From: Dirk Bender <d.bender@phytec.de>
>>
>> To prevent corrupted frames after starting and stopping the sensor it's
> 
> s/it's/its/

thanks, I'll fix that.

> 
>> datasheet specifies a specific pause sequence to follow:
>>
>> Stopping:
>> 	Set Pause_Restart Bit -> Set Restart Bit -> Set Chip_Enable Off
>>
>> Restarting:
>> 	Set Chip_Enable On -> Clear Pause_Restart Bit
>>
>> The Restart Bit is cleared automatically and must not be cleared
>> manually as this would cause undefined behavior.
>>
>> Signed-off-by: Dirk Bender <d.bender@phytec.de>
>> Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
>> ---
>> No changes in v2
>> ---
>>   drivers/media/i2c/mt9p031.c | 25 +++++++++++++++++++++++++
>>   1 file changed, 25 insertions(+)
>>
>> diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
>> index d10457361e6c..d59f66e3dcf3 100644
>> --- a/drivers/media/i2c/mt9p031.c
>> +++ b/drivers/media/i2c/mt9p031.c
>> @@ -80,6 +80,8 @@
>>   #define		MT9P031_PIXEL_CLOCK_SHIFT(n)		((n) << 8)
>>   #define		MT9P031_PIXEL_CLOCK_DIVIDE(n)		((n) << 0)
>>   #define MT9P031_FRAME_RESTART				0x0b
>> +#define		MT9P031_FRAME_RESTART_SET		(1 << 0)
>> +#define		MT9P031_FRAME_PAUSE_RESTART_SET		(1 << 1)
> 
> The fields are named Restart and Pause_Restart, I would drop _SET. Could
> you also sort them from MSB to LSB as for the other registers ? Using
> BIT() would be good too, although this could be done as an additional
> patch to convert all the existing macros.

I'll do that. Also I will rename the register to MT9P031_RESTART and the 
bits to MT9P031_FRAME_RESTART and MT9P031_FRAME_PAUSE_RESTART.

> 
>>   #define MT9P031_SHUTTER_DELAY				0x0c
>>   #define MT9P031_RST					0x0d
>>   #define		MT9P031_RST_ENABLE			1
>> @@ -483,9 +485,25 @@ static int mt9p031_set_params(struct mt9p031 *mt9p031)
>>   static int mt9p031_s_stream(struct v4l2_subdev *subdev, int enable)
>>   {
>>   	struct mt9p031 *mt9p031 = to_mt9p031(subdev);
>> +	struct i2c_client *client = v4l2_get_subdevdata(subdev);
>> +	int val;
>>   	int ret;
>>   
>>   	if (!enable) {
>> +		val = mt9p031_read(client, MT9P031_FRAME_RESTART);
> 
> Do you need to read the register ? Can't you write
> MT9P031_FRAME_PAUSE_RESTART_SET and then MT9P031_FRAME_PAUSE_RESTART_SET
> | MT9P031_FRAME_RESTART_SET ? And actually, can't we just write both
> bits in one go, do we need two writes ?

I think you're right we don't necessarily need to read the registers. The 
only other bit is not used by the driver.

But I think we do need two separate writes, at least that is what the 
datasheet states.

So I would drop the read but keep both write, ok?

> 
>> +
>> +		/* enable pause restart */
>> +		val |= MT9P031_FRAME_PAUSE_RESTART_SET;
>> +		ret = mt9p031_write(client, MT9P031_FRAME_RESTART, val);
>> +		if (ret < 0)
>> +			return ret;
>> +
>> +		/* enable restart + keep pause restart set */
>> +		val |= MT9P031_FRAME_RESTART_SET;
>> +		ret = mt9p031_write(client, MT9P031_FRAME_RESTART, val);
>> +		if (ret < 0)
>> +			return ret;
>> +
>>   		/* Stop sensor readout */
>>   		ret = mt9p031_set_output_control(mt9p031,
>>   						 MT9P031_OUTPUT_CONTROL_CEN, 0);
>> @@ -505,6 +523,13 @@ static int mt9p031_s_stream(struct v4l2_subdev *subdev, int enable)
>>   	if (ret < 0)
>>   		return ret;
>>   
>> +	val = mt9p031_read(client, MT9P031_FRAME_RESTART);
>> +	/* disable reset + pause restart */
>> +	val &= ~MT9P031_FRAME_PAUSE_RESTART_SET;
> 
> Same here, I think you can simply write MT9P031_FRAME_PAUSE_RESTART_SET.

I'll drop the read here as well. But I need to make sure, that the Restart 
Bit is not cleared manually here.

Regards,
Stefan

> 
>> +	ret = mt9p031_write(client, MT9P031_FRAME_RESTART, val);
>> +	if (ret < 0)
>> +		return ret;
>> +
>>   	return mt9p031_pll_enable(mt9p031);
>>   }
>>   
> 
