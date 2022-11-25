Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25B426388F5
	for <lists+linux-media@lfdr.de>; Fri, 25 Nov 2022 12:42:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230097AbiKYLmZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Nov 2022 06:42:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbiKYLmX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Nov 2022 06:42:23 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D927B1EADA;
        Fri, 25 Nov 2022 03:42:21 -0800 (PST)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 762FA326;
        Fri, 25 Nov 2022 12:42:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669376538;
        bh=RdhskQ7xkD5y/d9LCy4kji5JUkhNwi1kqy8UOxnDi+c=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
        b=Y/7muI5abEz4zczkaYJGyXiXDakWw/p7PzwjJT3slUDzY/qhkgwMAmuM4SZqSoJZm
         QU4hOx/XEEhMmyOL4N0YfpG++Q1xrsfddT7D41escv19cGuAmpWF2cqWm3HMsKMqzL
         bKr+Xg6h/QESkzi3dEsMTcBnFJLI0eRg11pdtu9Q=
Message-ID: <7cb28706-f929-4a5b-9ab9-3e914e7488f0@ideasonboard.com>
Date:   Fri, 25 Nov 2022 11:42:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        platform-driver-x86@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
References: <20221124200007.390901-1-hdegoede@redhat.com>
 <e5d8913c-13ba-3b11-94bc-5d1ee1d736b0@ideasonboard.com>
 <Y4Cf5tLWsBDTndei@pendragon.ideasonboard.com>
 <Y4ChnCHkV9RufccT@smile.fi.intel.com>
 <aa42a60b-fe34-a418-3ada-af55f260592e@ideasonboard.com>
 <8f736a26-9942-4fda-0237-313da5bf9c6b@redhat.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH 0/3] platform/x86: int3472/discrete: Make it work with
 IPU6
In-Reply-To: <8f736a26-9942-4fda-0237-313da5bf9c6b@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi

On 25/11/2022 11:23, Hans de Goede wrote:
> Hi,
>
> On 11/25/22 12:11, Dan Scally wrote:
>> On 25/11/2022 11:06, Andy Shevchenko wrote:
>>> On Fri, Nov 25, 2022 at 12:58:46PM +0200, Laurent Pinchart wrote:
>>>> On Fri, Nov 25, 2022 at 10:17:17AM +0000, Dan Scally wrote:
>>> ...
>>>
>>>> Can the LED framework be used without having the LED exposed to
>>>> userspace ?
>>> I believe the correct question here is "can the states of some leds be
>>> read-only from user perspective" (this way any changes into led subsystems
>>> looks less intrusive, esp. taking into account that subsystem is de facto
>>> unmaintained).
>>>
>> I think the answer to that is yes:
>>
>>
>> https://elixir.bootlin.com/linux/latest/source/drivers/leds/led-class.c#L47
> Interesting, I did not know that. But what is the added value of
> using the LED subsytem then for a simple only on/off LED driven
> by a GPIO?


Well I suppose it depends on the LED. In the flash case the v4l2 
framework disables the sysfs interface for the LED whilst it holds the 
flash subdev open, which should mean that no nefarious program could 
turn off the LED whilst it was running the camera but because the sysfs 
is enabled whilst the v4l2 subdev is closed [1] you could still use that 
LED as a torch outside of camera streaming. That's probably not a 
situation that's likely to occur with a privacy LED given they're likely 
to be much less bright though I suppose, and maybe it's right to treat 
them differently.


[1] 
https://elixir.bootlin.com/linux/latest/source/drivers/media/v4l2-core/v4l2-flash-led-class.c#L632

> One of the challenges with using LED triggers for the privacy led,
> is that we need at least 2 triggers: "camera-front" and "camera-back"
> and then somehow to let what ever code sets the triggers know if
> it is dealing with the front or back sensor.


Yes, that is a problem, my plan was to connect them with fwnode and 
ancillary links, in the same way for example we connected the VCM to the 
cameras. I think that the int3472-discrete driver would have to do that.

>
> Where as with GPIO-s we *bind* them to the sensor i2c_client so if
> we just have the sensor-driver look for an optional GPIO called
> "privacy-led" then we don't have this how to we bind the LED to
> the sensor problem; and if we drop the sysfs interface I fail to
> see the value in using the LED subsystem for GPIO a driven LED.
>
> Also see my other reply for a proposal to be able to share the
> code dealing with this between sensor drivers (and also remove
> some other gpio/clk/regulator boilerplate from sensor drivers).


Yes I certainly find that idea appealing, there is of lot of boilerplate 
that could be reduced with that idea.

>
> Regards,
>
> Hans
>
>
