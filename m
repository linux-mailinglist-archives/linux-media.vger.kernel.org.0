Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27D29249EF2
	for <lists+linux-media@lfdr.de>; Wed, 19 Aug 2020 15:03:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728571AbgHSNDJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Aug 2020 09:03:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728585AbgHSNCC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Aug 2020 09:02:02 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB078C061349
        for <linux-media@vger.kernel.org>; Wed, 19 Aug 2020 06:01:13 -0700 (PDT)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8BE5E29E;
        Wed, 19 Aug 2020 15:01:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1597842060;
        bh=0yMSAKWUDjZWFBXHQ5OFOL7U0hiIkagsuI+5hD9EHQg=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=MU7R+UiuP3Gr8dOVmEc0S1JqEpdR40/lKyt3xmxMT89Qn4AqhKubiF50bw8+xiCLr
         IrkoLWeOVxHjYnRe8quI5iarD9LzlV3XdCzFMJyObRjCBO3GySX9rrKqZikwnVwu4t
         MsN3WY4ECNmDWA0obZ5M2r3rtxZ46aMRZXplPe58=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH] media: i2c: max9286: Depend on GPIOLIB
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20200819002252.16361-1-laurent.pinchart@ideasonboard.com>
 <12f93522-5ca3-7da8-c819-e1f29429e0b6@ideasonboard.com>
 <20200819115853.GD6049@pendragon.ideasonboard.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <afe64357-5f2e-8e8c-77e6-833f84d4610f@ideasonboard.com>
Date:   Wed, 19 Aug 2020 14:00:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200819115853.GD6049@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

+Sakari, +Mauro,

On 19/08/2020 12:58, Laurent Pinchart wrote:
> Hi Kieran,
> 
> On Wed, Aug 19, 2020 at 09:45:32AM +0100, Kieran Bingham wrote:
>> On 19/08/2020 01:22, Laurent Pinchart wrote:
>>> The max9286 driver depends on the GPIO library, list the dependency in
>>> Kconfig.
>>>
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Fixes: 66d8c9d2422d ("media: i2c: Add MAX9286 driver")
>>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>
>> Sakari has already posted a fix for this on the 3rd August at:
>>
>> [PATCH 1/1] max9286: Depend on OF_GPIO
>>
>> https://lore.kernel.org/linux-media/20200803090935.23619-1-sakari.ailus@linux.intel.com/
> 
> Is that on its way upstream ? I've submitted this patch in response to a
> 0day bot report, the more we wait with fixes, the more likely effort
> will be duplicated :-S

I don't know - it's out of my hands ;-)
I've added Sakari and Mauro to this thread.

I was also pinged on this issue on the 13th August, where Randy Dunlap
had encountered the same build error, at the time Sakari mentioned [0]
he'll send a pull-request soon ...

[0]
https://lore.kernel.org/linux-media/20200813215505.GC24582@paasikivi.fi.intel.com/

Is there a way to accelerate the integration of that fix?

--
Kieran

> 
>> However he chose to depend upon OF_GPIO.
>>
>> I think in this instance, his patch is more correct as this particular
>> issue is regarding the setting of the of_node on the GPIO component,
>> which is guarded by CONFIG_OF_GPIO in the headers, thus I believe we can
>> have GPIOLIB && !OF_GPIO, which would still leave compile breakage with
>> your patch.
> 
> You can't have GPIOLIB && !OF_GPIO though, as the driver also depends on
> OF, and OF_GPIO will be automatically selected when GPIOLIB and OF are
> set. I'm fine with Sakari's patch though.
> 
>>> ---
>>>  drivers/media/i2c/Kconfig | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
>>> index 48ae60a2c603..70ba6ca1b912 100644
>>> --- a/drivers/media/i2c/Kconfig
>>> +++ b/drivers/media/i2c/Kconfig
>>> @@ -466,6 +466,7 @@ config VIDEO_VPX3220
>>>  
>>>  config VIDEO_MAX9286
>>>  	tristate "Maxim MAX9286 GMSL deserializer support"
>>> +	depends on GPIOLIB
>>>  	depends on I2C && I2C_MUX
>>>  	depends on OF
>>>  	select V4L2_FWNODE
>>>
>>
> 

