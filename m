Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77A587185F6
	for <lists+linux-media@lfdr.de>; Wed, 31 May 2023 17:19:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232042AbjEaPSs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 May 2023 11:18:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234411AbjEaPS3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 May 2023 11:18:29 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B7A4107
        for <linux-media@vger.kernel.org>; Wed, 31 May 2023 08:18:28 -0700 (PDT)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2448C844;
        Wed, 31 May 2023 17:18:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685546285;
        bh=WIFN2B57cTT9zMBNFRYLcg0leQHtFbOknlC/4MLTM3U=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
        b=OEsZHl30OzPzt2MZeiGa9l0bnI4JnTeuN940ohCd7jIMPgUh19yGLhgdFw+zDvzal
         Zl+tdv1Iso9oJXVoako7tkTgcMLL35XjR3fbxSEbfEiqDj75l8dPpuq2qtxGG8qmOU
         VRN3bjGrm7SfZqU58eD6CJMtwpztoqrS6enpB7no=
Message-ID: <e424987d-f7c2-4c08-eacc-67192453a78c@ideasonboard.com>
Date:   Wed, 31 May 2023 16:18:23 +0100
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
From:   Dan Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH 3/3] platform/x86: int3472: Add ov13b10 (09B13) sensor
 module support
In-Reply-To: <745f5335-b849-52da-f3e2-52cb1f4d1bd6@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi both

On 25/05/2023 19:40, Hans de Goede wrote:
> Hi all,
>
> On 5/24/23 05:51, bingbu.cao@intel.com wrote:
>> From: Hao Yao <hao.yao@intel.com>
>>
>> Add a new sensor support in INT3472 driver which module name is '09B13'.
>>
>> Signed-off-by: Hao Yao <hao.yao@intel.com>
>> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
>> ---
>>   drivers/platform/x86/intel/int3472/discrete.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
>> index d5d5c650d6d2..63acb48bf8df 100644
>> --- a/drivers/platform/x86/intel/int3472/discrete.c
>> +++ b/drivers/platform/x86/intel/int3472/discrete.c
>> @@ -60,6 +60,8 @@ static const struct int3472_sensor_config int3472_sensor_configs[] = {
>>   	{ "GEFF150023R", REGULATOR_SUPPLY("avdd", NULL), NULL },
>>   	/* Surface Go 1&2 - OV5693, Front */
>>   	{ "YHCU", REGULATOR_SUPPLY("avdd", NULL), NULL },
>> +	/* OV13B10 */
>> +	{ "09B13", REGULATOR_SUPPLY("vcc", NULL), NULL },
> "vcc" is not really a useful supply name. All the existing sensor drivers in drivers/media/i2c typically check for both "avdd" and "dvdd". Can you verify if this is supplying digital or analog power using the schematics of the laptop ?
>
> And then use one of the standard "avdd" or "dvdd" supply names ?
>
> I would like to try and get rid of this table and sofar all the sensors which have a regulator GPIO are listed as sing it for "avdd" so I was hoping to be able to just always use "avdd".


I agree this is quite unsatisfactory in its current form, but I'm hoping to add the ov7251 in the 
near future; the driver for which uses "vdda" instead, so unfortunately not in line with that.

>
> At least I would like us to come up with some default fallback for the supply-name in case a sensor-module is not listed in this table and "avdd" seems to be the best fallback.


I wonder if it'd be better to simply support regulator_get() calls without a supply name in the 
event that the device only has a single supply associated with it? Then we needn't pick a default at 
all.


>
> Note that if your current sensor driver expects "vcc" that that is not a good reason to go with "vcc" here. It would be better to adjust the sensor driver to use the standard "avdd" and "dvdd" supply names (using the bulk regulator api), like all the other sensor drivers do.
>
> Regards,
>
> Hans
>
