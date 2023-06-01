Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2CAF7195D2
	for <lists+linux-media@lfdr.de>; Thu,  1 Jun 2023 10:41:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231298AbjFAIl1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Jun 2023 04:41:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231439AbjFAIlZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Jun 2023 04:41:25 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0889AE7
        for <linux-media@vger.kernel.org>; Thu,  1 Jun 2023 01:41:21 -0700 (PDT)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3435C2B6;
        Thu,  1 Jun 2023 10:40:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685608858;
        bh=obzRpaSxxIVjQRGkp87Yk7i8a+OYfFvNnxZsqEctRQ0=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=t9W8cnWQESTp/1ktKZX96QKYkXkaD5qZ6zRdKh3jsooNcqbeZC+81xTwz1ZtsrPrg
         pHn1s+DhSqNy58k7lLsOOtrguMmulnOY/DQmzrTq2cowRcCITyYWXVIwVv2qLjFHhH
         GnVfUjZPeJM+NmcYlgZ2Qo2jZoyRGMyigOxloXlY=
Message-ID: <7d336b2e-646e-bbde-bfa0-e861394e1e8a@ideasonboard.com>
Date:   Thu, 1 Jun 2023 09:41:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 3/3] platform/x86: int3472: Add ov13b10 (09B13) sensor
 module support
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
 <8183d5d6-8707-1ebb-4c47-49f35483fdc5@ideasonboard.com>
 <88bfdd38-d128-4653-9792-b16bc32f972b@redhat.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <88bfdd38-d128-4653-9792-b16bc32f972b@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Morning Hans

On 01/06/2023 09:33, Hans de Goede wrote:
> Hi Dan,
>
> On 5/31/23 21:34, Dan Scally wrote:
>> Hi Hans
>>
>> On 31/05/2023 16:34, Hans de Goede wrote:
> <snip>
>
>>> I think what we need is for the sensor drivers to use standardized supply-names, so pick one of "avdd" or "vdda" and use that everywhere.
>>>
>>> This will require some compat code in some of the sensor drivers to try the old supply name if the new standardized supply name fails (easy when using the bulk regulator API, one of the 2 will just become a dummy regulator), but I believe that in the long run this is the best solution.
>>>
>>> Like how we also have all the sensor driver standardized on using "powerdown" and "reset" as GPIO con-ids.
>> I agree that this is ideal long term yes - I'll change the ov7251 to that effect.
> Ack.
>
> <snip>
>
>>> I was sorta hoping to also test this on a miix510, but upon checking I saw that the mainline ov2680.c does not yet work on the miix510. Porting my atomisp-ov2680.c changes should get us close to having the standard ov2680.c work on the miix510 (ACPI enumeration, runtime-pm and selection API support will all be added).
>>
>> That would be nice. The ov2680 on a Miix510 is the sensor I was originally trying to get working, a very long time ago. I had a tree that "worked" in that you could stream with it but it was very ugly, as I had no idea what I was doing at the time and swiftly got the Surface instead and so moved on to that. The references to OV2680 in the CIO2/INT3472 code are hangovers from that early support really.
>>
>>> I have recently bought a second hand miix 510. Long story short: Can you give me some quick instructions, or a docs pointer for testing a new sensor with libcamera ?  Or preferably I guess first outside of libcamera just grabbing raw-bayer + some userspace debayer tool for testing and then later on test under libcamera ?
>>
>> Outside of libcamera is a case of configuring the formats and then grabbing frames from the CIO2's devnode, then queuing those frames to the IPU3's input devnode. The easiest way to do it is using the ipu3 utils within the libcamera project, which don't actually use the library itself but rather just configure with media-ctl and capture with yavta. See [1] and [2] for example. Testing within libcamera requires that the driver meet libcamera's requirements [3] which mostly means ensuring it has the 5 mandatory controls, plus some targets for the .get_selection() callback - I can't remember exactly which ones but I think it's CROP, NATIVE_SIZE, CROP_BOUNDS and CROP_DEFAULT. And I think it would also need an entry adding right at [4] to describe the sensor for libcamera. After that the cam tool from libcamera should list it with cam -l and capture from it with cam -cN --capture, or alternatively qcam would display the stream.
>>
>>
>> [1] https://git.libcamera.org/libcamera/libcamera.git/tree/utils/ipu3/ipu3-capture.sh
>>
>> [2] https://git.libcamera.org/libcamera/libcamera.git/tree/utils/ipu3/ipu3-process.sh
>>
>> [3] https://git.libcamera.org/libcamera/libcamera.git/tree/Documentation/sensor_driver_requirements.rst
>>
>> [4] https://git.libcamera.org/libcamera/libcamera.git/tree/src/libcamera/camera_sensor_properties.cpp#n140
> Thank you for the testing instructions. I will give this a try once I have all the recent atomisp
> improvements ported to the main ov2680 driver and I have the main ov2680 driver working with the atomisp.
>
>>> More p.s. :
>>>
>>> Dan what about: https://patchwork.kernel.org/project/platform-driver-x86/patch/20230311223019.14123-1-dan.scally@ideasonboard.com/ and my remarks on that patch from you ?
>>
>> That one completely fell off my radar - sorry about that. I can pick it up again in the morning.
> Note I send a another reply in that thread yesterday with an alternative suggestion for fixing this (I would like to not have to add any GPIO remapping stuff in INT3472 when possible, IMHO the sensor drivers should be patched to use the right con-ids where possible).


Yep, I saw that and agree with it - I'll drop that patch and raise another for the sensor driver.

> Regards,
>
> Hans
>
>
