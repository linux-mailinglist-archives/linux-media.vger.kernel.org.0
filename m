Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A2CA718A3D
	for <lists+linux-media@lfdr.de>; Wed, 31 May 2023 21:35:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbjEaTfD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 May 2023 15:35:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbjEaTfC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 May 2023 15:35:02 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73631126
        for <linux-media@vger.kernel.org>; Wed, 31 May 2023 12:35:00 -0700 (PDT)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8B52E12F;
        Wed, 31 May 2023 21:34:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685561677;
        bh=BNWz6p23AJv10BX5T9a4CiaevVAqQzrqTivUcznb3w0=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
        b=kd7PxZK1fyrIyMccUxIa3+YsY8VL2dEpWQo7OKYI1hNB3WxxAPpRRoJHL26+Cl2xa
         sFryDe8c3i2GFnzhpDWHGTJ1ij9Qsuf0pkYYkM18bYPRn/hs/dbxRbWe0kcGXlmOR+
         BgR3dwcLbbmOwHY/Rq+31V0IygldhJA5XXTYwM/4=
Message-ID: <8183d5d6-8707-1ebb-4c47-49f35483fdc5@ideasonboard.com>
Date:   Wed, 31 May 2023 20:34:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>, bingbu.cao@intel.com,
        djrscally@gmail.com, hao.yao@intel.com
Cc:     markgross@kernel.org, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        bingbu.cao@linux.intel.com
References: <20230524035135.90315-1-bingbu.cao@intel.com>
 <20230524035135.90315-3-bingbu.cao@intel.com>
 <745f5335-b849-52da-f3e2-52cb1f4d1bd6@redhat.com>
 <e424987d-f7c2-4c08-eacc-67192453a78c@ideasonboard.com>
 <7fc1a3fb-d300-de09-1e0d-606971560fc1@redhat.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH 3/3] platform/x86: int3472: Add ov13b10 (09B13) sensor
 module support
In-Reply-To: <7fc1a3fb-d300-de09-1e0d-606971560fc1@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans

On 31/05/2023 16:34, Hans de Goede wrote:
> Hi Dan,
>
> On 5/31/23 17:18, Dan Scally wrote:
>> Hi both
>>
>> On 25/05/2023 19:40, Hans de Goede wrote:
>>> Hi all,
>>>
>>> On 5/24/23 05:51, bingbu.cao@intel.com wrote:
>>>> From: Hao Yao <hao.yao@intel.com>
>>>>
>>>> Add a new sensor support in INT3472 driver which module name is '09B13'.
>>>>
>>>> Signed-off-by: Hao Yao <hao.yao@intel.com>
>>>> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
>>>> ---
>>>>    drivers/platform/x86/intel/int3472/discrete.c | 2 ++
>>>>    1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
>>>> index d5d5c650d6d2..63acb48bf8df 100644
>>>> --- a/drivers/platform/x86/intel/int3472/discrete.c
>>>> +++ b/drivers/platform/x86/intel/int3472/discrete.c
>>>> @@ -60,6 +60,8 @@ static const struct int3472_sensor_config int3472_sensor_configs[] = {
>>>>        { "GEFF150023R", REGULATOR_SUPPLY("avdd", NULL), NULL },
>>>>        /* Surface Go 1&2 - OV5693, Front */
>>>>        { "YHCU", REGULATOR_SUPPLY("avdd", NULL), NULL },
>>>> +    /* OV13B10 */
>>>> +    { "09B13", REGULATOR_SUPPLY("vcc", NULL), NULL },
>>> "vcc" is not really a useful supply name. All the existing sensor drivers in drivers/media/i2c typically check for both "avdd" and "dvdd". Can you verify if this is supplying digital or analog power using the schematics of the laptop ?
>>>
>>> And then use one of the standard "avdd" or "dvdd" supply names ?
>>>
>>> I would like to try and get rid of this table and sofar all the sensors which have a regulator GPIO are listed as sing it for "avdd" so I was hoping to be able to just always use "avdd".
>>
>> I agree this is quite unsatisfactory in its current form, but I'm hoping to add the ov7251 in the near future; the driver for which uses "vdda" instead, so unfortunately not in line with that.
>>
>>> At least I would like us to come up with some default fallback for the supply-name in case a sensor-module is not listed in this table and "avdd" seems to be the best fallback.
>>
>> I wonder if it'd be better to simply support regulator_get() calls without a supply name in the event that the device only has a single supply associated with it? Then we needn't pick a default at all.
> I do not believe that the regulator subsystem maintainers will accept such a change. They really only want to touch regulators with full constraints to avoid frying things and this would very much go against that.


Yes, fair enough.

>
> I think what we need is for the sensor drivers to use standardized supply-names, so pick one of "avdd" or "vdda" and use that everywhere.
>
> This will require some compat code in some of the sensor drivers to try the old supply name if the new standardized supply name fails (easy when using the bulk regulator API, one of the 2 will just become a dummy regulator), but I believe that in the long run this is the best solution.
>
> Like how we also have all the sensor driver standardized on using "powerdown" and "reset" as GPIO con-ids.

I agree that this is ideal long term yes - I'll change the ov7251 to that effect.
>
> Regards,
>
> Hans
>
>
> p.s.
>
> Talking about this I just (minutes ago) finished writing a patch for the mainline ov2680 driver which allows dropping the sensor specific GPIO remapping in the int3472 driver for the ov2680, see the attached patch (compile tested only so far). The problem is not with the int3472 code, but that the original ov2680 driver is asking for a "reset" GPIO while the pin is named "XSHUTDN" in the datasheet.
>
> Dan, the reason why I'm poking at the mainline ov2680 driver now is because I have the atomisp code at a point where it can work with standard v4l2 sensor drivers without any atomisp specific API between the atomisp code and the sensor driver. So I want to get rid of the atomisp-ov2680.ko private driver. This involves porting recent improvements like selection API (cropping) support from
> atomisp-ov2680.c to the standard driver.
>
> I was sorta hoping to also test this on a miix510, but upon checking I saw that the mainline ov2680.c does not yet work on the miix510. Porting my atomisp-ov2680.c changes should get us close to having the standard ov2680.c work on the miix510 (ACPI enumeration, runtime-pm and selection API support will all be added).


That would be nice. The ov2680 on a Miix510 is the sensor I was originally trying to get working, a 
very long time ago. I had a tree that "worked" in that you could stream with it but it was very 
ugly, as I had no idea what I was doing at the time and swiftly got the Surface instead and so moved 
on to that. The references to OV2680 in the CIO2/INT3472 code are hangovers from that early support 
really.

>
> I have recently bought a second hand miix 510. Long story short: Can you give me some quick instructions, or a docs pointer for testing a new sensor with libcamera ?  Or preferably I guess first outside of libcamera just grabbing raw-bayer + some userspace debayer tool for testing and then later on test under libcamera ?


Outside of libcamera is a case of configuring the formats and then grabbing frames from the CIO2's 
devnode, then queuing those frames to the IPU3's input devnode. The easiest way to do it is using 
the ipu3 utils within the libcamera project, which don't actually use the library itself but rather 
just configure with media-ctl and capture with yavta. See [1] and [2] for example. Testing within 
libcamera requires that the driver meet libcamera's requirements [3] which mostly means ensuring it 
has the 5 mandatory controls, plus some targets for the .get_selection() callback - I can't remember 
exactly which ones but I think it's CROP, NATIVE_SIZE, CROP_BOUNDS and CROP_DEFAULT. And I think it 
would also need an entry adding right at [4] to describe the sensor for libcamera. After that the 
cam tool from libcamera should list it with cam -l and capture from it with cam -cN --capture, or 
alternatively qcam would display the stream.


[1] https://git.libcamera.org/libcamera/libcamera.git/tree/utils/ipu3/ipu3-capture.sh

[2] https://git.libcamera.org/libcamera/libcamera.git/tree/utils/ipu3/ipu3-process.sh

[3] https://git.libcamera.org/libcamera/libcamera.git/tree/Documentation/sensor_driver_requirements.rst

[4] 
https://git.libcamera.org/libcamera/libcamera.git/tree/src/libcamera/camera_sensor_properties.cpp#n140

>
>
> More p.s. :
>
> Dan what about: https://patchwork.kernel.org/project/platform-driver-x86/patch/20230311223019.14123-1-dan.scally@ideasonboard.com/ and my remarks on that patch from you ?


That one completely fell off my radar - sorry about that. I can pick it up again in the morning.

>
