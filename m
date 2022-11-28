Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 146C463AD62
	for <lists+linux-media@lfdr.de>; Mon, 28 Nov 2022 17:13:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232178AbiK1QNE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Nov 2022 11:13:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229850AbiK1QND (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Nov 2022 11:13:03 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D56B6240BE
        for <linux-media@vger.kernel.org>; Mon, 28 Nov 2022 08:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669651920;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=R3QggCtp5P01IPJZr6nB2FiLsZrt0x1fsSxs097foeg=;
        b=DbXharjymsL5KCmoruH3BL4geeTBzlH6hvysDd34nja57xAjEP5CVIhWvHlxAS8huYDh8f
        kCRLf89D6QpjZO6EDOxTckidKwgfTbI8x/TGvlfc6G/bCzkf9GYN9Oz7FjZf7+p3tfeyUK
        yEYv2b8q1wvNMk4F+3m5xHu5CqDHG0s=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-194-YSeFcpjkMua1yax6J0h3IA-1; Mon, 28 Nov 2022 11:11:55 -0500
X-MC-Unique: YSeFcpjkMua1yax6J0h3IA-1
Received: by mail-ej1-f69.google.com with SMTP id xj11-20020a170906db0b00b0077b6ecb23fcso4658409ejb.5
        for <linux-media@vger.kernel.org>; Mon, 28 Nov 2022 08:11:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R3QggCtp5P01IPJZr6nB2FiLsZrt0x1fsSxs097foeg=;
        b=SJxvYeSD/COhVB2/Mzo0IxzmWHUF+PE4PpQfysUZK0h1Hxmzw5nFDR6qb4MR8cy/Ll
         xOGzqQugKV/GO22cFVWsKTRPCBRUqJ2Gri+9YZRNvDKuPzY9wXiFD/gfbmekPLS0wxXs
         rleMoNb6nncyJoOYFnHGT8eYXawhfUFaQLsM32EfnetcxdpDiix+vjQlpqohx5+QXcs0
         Y0rDai0kErdOrkDZ+JWS32GhYIDBBIkMndSrol+sbCyepxVfOVjFyU+vslBwwQxbD/JR
         Z8XiuZqXCh1/NopR3Kgo+tlekAPhYk3EPTmyeSEevHXcyy2AMyVd94Jgf2M3NNTKcVg/
         uz7Q==
X-Gm-Message-State: ANoB5pn9xAfzyFbQ8n92qS4T+9AyYVslk74pTibsHOA1Dt1GJ1WBRWe1
        9/Kh4Op0lwrC4BZRWHUP5rfULICDMnAK7YOJravaM8KnLeJGuOnD+/EK14L6Z9duhSPxSXA843P
        AY46DBiyIk7+jXFLl28qk6jE=
X-Received: by 2002:a17:906:ca2:b0:7b9:eef3:4435 with SMTP id k2-20020a1709060ca200b007b9eef34435mr21844839ejh.696.1669651913979;
        Mon, 28 Nov 2022 08:11:53 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7SH1MoysQD+vLwBbbAaxl7lZ3cTJbTYOyqwHN/LVyAwefqT18nt3/lE2m8AY74P3shT4FLEA==
X-Received: by 2002:a17:906:ca2:b0:7b9:eef3:4435 with SMTP id k2-20020a1709060ca200b007b9eef34435mr21844806ejh.696.1669651913699;
        Mon, 28 Nov 2022 08:11:53 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id x22-20020a1709064bd600b0078d3f96d293sm5163240ejv.30.2022.11.28.08.11.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 08:11:53 -0800 (PST)
Message-ID: <27b71261-ac9b-c103-88af-2ca53477317a@redhat.com>
Date:   Mon, 28 Nov 2022 17:11:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 0/3] platform/x86: int3472/discrete: Make it work with
 IPU6
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Dan Scally <dan.scally@ideasonboard.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        platform-driver-x86@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
References: <20221124200007.390901-1-hdegoede@redhat.com>
 <e5d8913c-13ba-3b11-94bc-5d1ee1d736b0@ideasonboard.com>
 <Y4Cf5tLWsBDTndei@pendragon.ideasonboard.com>
 <636c471d-d7ee-d184-7a9d-fbfd0545059c@redhat.com>
 <Y4DVXT2TlTYkUHEr@pendragon.ideasonboard.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y4DVXT2TlTYkUHEr@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 11/25/22 15:46, Laurent Pinchart wrote:

<snip>

>> There seems to be a bunch of GPIO/clk/regulator boilerplate duplicated
>> in all the sensor drivers. I think a little helper-library  for this might
>> be in order. E.g. Something like this (in the .h file)
> 
> I fully agree that camera sensor helpers would be good to have.
> 
>> struct camera_sensor_pwr_helper {
>> 	// bunch of stuff here, this should be fixed size so that the
>> 	// sensor drivers can embed it into their driver-data struct
>> };
>>
>> int camera_sensor_pwr_helper_init(struct camera_sensor_pwr_helper *helper,
>> 				  const char *supply_names, int supply_count,
>> 				  const char* clk_name.
>> 				  /* other stuff which I'm probably forgetting right now */);
> 
> There are all kind of constraints on the power on/off sequences, I don't
> think we would be able to model this in a generic way without making it
> so complicated that it would outweight the benefits.

I know that for some ICs the power sequence can be quite complicated,
but I think that for most this order should work fine:

0. Force enable/reset GPIOs to disabled / reset-asserted (do this at GPIO request time ?)
1. Enable clk(s)
2. Enable regulators (using the bulk API, with supply-names passed
in by the sensor drivers, 
3. Set enable/reset GPIOs to enabled / reset de-asserted

I guess on some models we may need to swap 1 and 2, there could be
a flag for that.

Anything more complicated should just be coded out in the driver, but
I think just supporting this common pattern will already save us
quite a bit of code duplication.

> What I think could help is moving all camera sensor drivers to runtime
> PM, and having helpers to properly enable runtime PM in probe() in a way
> that works on both ACPI and DT systems, with or without CONFIG_PM
> enabled. It's way more complicated than it sounds.

I agree that we should move to runtime-pm and put the power-sequence
in the suspend/resume callback. This will be necessary for any sensors
used on atomisp2 devices, where there are actually ACPI _PS0 and _PS3
methods and/or ACPI power-resources doing the PM for us.

Note for some reason the current staging atomisp driver does not use this,
likely because it was developed for Android boards with broken ACPI
tables. But after having sampled the ACPI tables of a bunch of atomisp
windows devices I believe this should work fine for those.

Regards,

Hans




> 
>> // turn_on_privacy_led should be false when called from probe(), must be true when
>> // called on stream_on().
>> int camera_sensor_pwr_helper_on(struct camera_sensor_pwr_helper *helper, bool turn_on_privacy_led);
>> int camera_sensor_pwr_helper_off(struct camera_sensor_pwr_helper *helper);
>>
>> // maybe, or make everything devm managed? :
>> int camera_sensor_pwr_helper_exit(struct camera_sensor_pwr_helper *helper);
>>
>> Just is just a really really quick n dirty design. For one I could use
>> suggestions for a better name for the thing :)
>>
>> I think something like this will be helpfull to reduce a whole bunch
>> of boilerplate code related to powering on/off the sensor in all
>> the drivers; and it would give us a central place to drive an
>> (optional) privacy-led GPIO.
>>
>>>>> And likewise (eventually) completely drop the "clken" GPIO this
>>>>> patch series introduces (with some sensors) and instead always model
>>>>> this through the clk-framework.
>>>>>
>>>>> Hans de Goede (3):
>>>>>    platform/x86: int3472/discrete: Refactor GPIO to sensor mapping
>>>>>    platform/x86: int3472/discrete: Get the polarity from the _DSM entry
>>>>>    platform/x86: int3472/discrete: Add support for sensor-drivers which
>>>>>      expect clken + pled GPIOs
>>>>>
>>>>>   drivers/platform/x86/intel/int3472/common.h   |  2 +-
>>>>>   drivers/platform/x86/intel/int3472/discrete.c | 92 ++++++++++++++++---
>>>>>   2 files changed, 78 insertions(+), 16 deletions(-)
> 

