Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F0782B18BB
	for <lists+linux-media@lfdr.de>; Fri, 13 Nov 2020 11:02:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726418AbgKMKCe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Nov 2020 05:02:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726222AbgKMKCd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Nov 2020 05:02:33 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E157C0613D6;
        Fri, 13 Nov 2020 02:02:33 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id p22so7559361wmg.3;
        Fri, 13 Nov 2020 02:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=HmAKJnzLRDGQT9lrEjqyhcR6xxTYalmQb8B6doUQFf4=;
        b=LiJahYM4xd7pAijHr/t505nhNXri8oohrMEaBg0pjZepyb5Ce/9eT33Jv0gy9z9cLd
         wqzNFuQzeUgktFSh88utzZdFXeI0f24ug7MinHjupvPV6Zg1O60rWGCsMF1vg9Rz/whp
         PPTdIH81tRt6YIqbei9IOQpNqdStas5ATHmVBxYz0UzfKSyim81qTLdaSMwuG6emP8tw
         rDbXyW0XRM1Ivm85TRp49tEh7VGXIEYLsz6O0eOiEJ9xqRSVSnIQHNHj26IF3C/HMzmZ
         bLvr3o836TfGVvfTqTrztQTv0Gd/WGYUHzYxQRBctAQyp0dZFNBYLYZHfOptd0zimZEt
         WlRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=HmAKJnzLRDGQT9lrEjqyhcR6xxTYalmQb8B6doUQFf4=;
        b=JIJub+e+MWfeQj+HH27pW4UZF+7UcMo4zo+cWQ7ka16OSQpnCcUoMRS8CBzIrfHjdi
         mh+yumMXJWpfDImPcOemb3l6LiOqH6tqZ6ErvMbFwNW0hNxFXlskKoWK6DgRBsdrqQhu
         sZsSRjaOP484NN11bBvKxgIa6TyJHIBzBf10t+OmpoRVLbCiI6aAmt7Yqz3JnXhq6Imw
         DY6xh9Ond52sU5nqpZPhgjZpSdVCp0lSXMMErI9BI2SlEUJf3xw3cy4mKwhMYfVtzVIW
         wl6E4sR3+uZzFSssjxvlZgmXdVMooUFPTTQ3qDC+O6pYrAQCjuRJgZfKduv9gs4qy5Nf
         AKuw==
X-Gm-Message-State: AOAM533ILeFkPIIaaQuzRaATdQwWQbcapznTd2B5Ua8u/m9S/OFMWjfB
        OrNHznRvrNorhBPaf6RyO8o=
X-Google-Smtp-Source: ABdhPJwVhlJ0m4LfbIbiIkT1M4UL6WL78WAkI/U9538v2GWxhnwckXg5OThECJCTO/95iZ3D++QQ4Q==
X-Received: by 2002:a7b:c841:: with SMTP id c1mr1667969wml.31.1605261752042;
        Fri, 13 Nov 2020 02:02:32 -0800 (PST)
Received: from [192.168.1.211] ([2.31.225.98])
        by smtp.gmail.com with ESMTPSA id c129sm9954778wmd.7.2020.11.13.02.02.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2020 02:02:31 -0800 (PST)
Subject: Re: [RFC PATCH v3 9/9] ipu3-cio2: Add functionality allowing
 software_node connections to sensors on platforms designed for Windows
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        laurent.pinchart+renesas@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rob Herring <robh@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Petr Mladek <pmladek@suse.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Yong Zhi <yong.zhi@intel.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tsuchiya Yuto <kitakar@gmail.com>
References: <20201019225903.14276-1-djrscally@gmail.com>
 <20201019225903.14276-10-djrscally@gmail.com>
 <20201024012411.GT5979@pendragon.ideasonboard.com>
 <d188f8b5-ed3b-f91b-171a-26afeb7d213e@gmail.com>
 <20201024093702.GA3939@pendragon.ideasonboard.com>
 <20201026161050.GQ4077@smile.fi.intel.com>
 <20201029201918.GD15024@pendragon.ideasonboard.com>
 <CAHp75Vc9uYVvhBe3OyCJzCsU0EY9yi62hsxt3pAwppSfjB+jDg@mail.gmail.com>
 <20201029212930.GE15024@pendragon.ideasonboard.com>
 <20201029222215.GI4077@smile.fi.intel.com>
 <20201029225124.GI15024@pendragon.ideasonboard.com>
From:   Dan Scally <djrscally@gmail.com>
Message-ID: <60b36af2-ad57-000b-76e4-379e1b58a3a0@gmail.com>
Date:   Fri, 13 Nov 2020 10:02:30 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201029225124.GI15024@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 29/10/2020 22:51, Laurent Pinchart wrote:
> Hi Andy,
>
> On Fri, Oct 30, 2020 at 12:22:15AM +0200, Andy Shevchenko wrote:
>> On Thu, Oct 29, 2020 at 11:29:30PM +0200, Laurent Pinchart wrote:
>>> On Thu, Oct 29, 2020 at 10:26:56PM +0200, Andy Shevchenko wrote:
>>>> On Thu, Oct 29, 2020 at 10:21 PM Laurent Pinchart wrote:
>>>>> On Mon, Oct 26, 2020 at 06:10:50PM +0200, Andy Shevchenko wrote:
>>>>>> On Sat, Oct 24, 2020 at 12:37:02PM +0300, Laurent Pinchart wrote:
>>>>>>> On Sat, Oct 24, 2020 at 09:50:07AM +0100, Dan Scally wrote:
>>>>>>>> On 24/10/2020 02:24, Laurent Pinchart wrote:
>>>>>>>>> On Mon, Oct 19, 2020 at 11:59:03PM +0100, Daniel Scally wrote:
>>>>>>>>>> +              adev = acpi_dev_get_first_match_dev(supported_devices[i], NULL, -1);
>>>>>>>>> What if there are multiple sensor of the same model ?
>>>>>>>> Hmm, yeah, that would be a bit of a pickle. I guess the newer
>>>>>>>> smartphones have multiple sensors on the back, which I presume are the
>>>>>>>> same model. So that will probably crop up at some point. How about
>>>>>>>> instead I use bus_for_each_dev() and in the applied function check if
>>>>>>>> the _HID is in the supported list?
>>>>>>> Sounds good to me.
>>>>>>>
>>>>>>>>>> +              if (!adev)
>>>>>>>>>> +                      continue;
>>>>>> Please, don't.
>>>>>>
>>>>>> If we have so weird ACPI tables it must be w/a differently. The all, even badly
>>>>>> formed, ACPI tables I have seen so far are using _UID to distinguish instance
>>>>>> of the device (see second parameter to the above function).
>>>>>>
>>>>>> If we meet the very broken table I would like rather to know about, then
>>>>>> silently think ahead what could be best.
>>>>>>
>>>>>> I.o.w. don't change this until we will have a real example of the problematic
>>>>>> firmware.
>>>>> I'm not sure to follow you. Daniel's current code loops over all the
>>>>> supported HID (as stored in the supported_devices table), and then gets
>>>>> the first ACPI device for each of them. If multiple ACPI devices exist
>>>>> with the same HID, we need to handle them all, so enumerating all ACPI
>>>>> devices and checking whether their HID is one we handle seems to be the
>>>>> right option to me.
>>>> Devices with the same HID should be still different by another
>>>> parameter in ACPI. The above mentioned call just uses the rough
>>>> estimation for relaxed conditions. If you expect more than one device
>>>> with the same HID how do you expect to distinguish them? The correct
>>>> way is to use _UID. It may be absent, or set to a value. And this
>>>> value should be unique (as per U letter in UID abbreviation). That
>>>> said, the above is good enough till we find the firmware with the
>>>> above true (several devices with the same HID). Until then the code is
>>>> fine.
>>> I expect those devices with the same _HID to have different _UID values,
>>> yes. On the systems I've seen so far, that assumption is not violated,
>>> and I don't think we need to already plan how we will support systems
>>> where multiple devices would have the same _HID and _UID (within the
>>> same scope). There's no disagreement there.
>>>
>>> My point is that supported_devices stores HID values, and doesn't care
>>> about UID. The code loops over supported_devices, and for each entry,
>>> calls acpi_dev_get_first_match_dev() and process the ACPI devices
>>> returned by that call. We thus process at most one ACPI device per HID,
>>> which isn't right.
>> In this case we probably need something like
>>
>> struct acpi_device *
>> acpi_dev_get_next_match_dev(struct acpi_device *adev,
>> 			    const char *hid, const char *uid, s64 hrv)
>> {
>> 	struct device *start = adev ? &adev->dev : NULL;
>> 	...
>> 	dev = bus_find_device(&acpi_bus_type, start, &match, acpi_dev_match_cb);
>> 	...
>> }
>>
>> in drivers/acpi/utils.c and
>>
>> static inline struct acpi_device *
>> acpi_dev_get_first_match_dev(const char *hid, const char *uid, s64 hrv)
>> {
>> 	return acpi_dev_get_next_match_dev(NULL, hid, uid, hrv);
>> }
>>
>> in include/linux/acpi.h.
>>
>> Then we may add
>>
>> #define for_each_acpi_dev_match(adev, hid, uid, hrv)			\
>> 	for (adev = acpi_dev_get_first_match_dev(hid, uid, hrv);	\
>> 	     adev;							\
>> 	     adev = acpi_dev_get_next_match_dev(adev, hid, uid, hrv))
> What the cio2-bridge code needs is indeed
>
> 	for each hid in supported hids:
> 		for each acpi device that is compatible with hid:
> 			...
>
> which could also be expressed as
>
> 	for each acpi device:
> 		if acpi device hid is in supported hids:
> 			...
>
> I don't mind either option, I'll happily follow the preference of the
> ACPI maintainers.
>
Does this need raising elsewhere then? The original idea of just
bus_for_each_dev(&acpi_bus_type...) I have now tested and it works fine,
but it does mean that I need to export acpi_bus_type (currently that
symbol's not available)...that seems much simpler to me but I'm not sure
whether that's something to avoid, and if so whether Andy's approach is
better.


Thoughts?

