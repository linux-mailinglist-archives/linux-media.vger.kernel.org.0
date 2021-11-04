Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 733B4445C9A
	for <lists+linux-media@lfdr.de>; Fri,  5 Nov 2021 00:20:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230379AbhKDXXA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Nov 2021 19:23:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229596AbhKDXW5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Nov 2021 19:22:57 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC50EC061714
        for <linux-media@vger.kernel.org>; Thu,  4 Nov 2021 16:20:18 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id d3so10982768wrh.8
        for <linux-media@vger.kernel.org>; Thu, 04 Nov 2021 16:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=XOQaUgD4zkMFxDHKIDUhxCamHk/vx1cLGyBMvSH2pYU=;
        b=gRhwjpCHOgTvlzzMhUHjcKsCF89AfHgGeA72bYqlWatM9QT4mjsbwtQ1Hphoxhj1/h
         0j4xUJkpZpJR2/icSOdAxJZZY67Daw8TNlXjvZzVLUeVmjlZ6UpX9jkToT5QLCh9PkaF
         sfsCbIeNhq4ph98cqs6iV5zPVC7SdXxDfBkLoA9gi3GxlTWEbS4hRDqdv543F343t3sh
         QEozAWWkG61e6g2btYeOKGqo9vk2+M8G+y5+7vVRvc3n0TvZyeUShevLUnaBQ++aXIqk
         igz8QzBjZLtrwn6O6SUD84vF1bdVKikw4UxgCRUffdKeAPOJ+c3EDdozINwTVXG0vV3U
         ZPDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=XOQaUgD4zkMFxDHKIDUhxCamHk/vx1cLGyBMvSH2pYU=;
        b=79nvK1hc8GZq9LWsVu7m03IQABD2EJEViZ5dZgIil2NyNGT8YAyWBCIjoErfqvC1Ho
         zHjpiTtT5d7OBhn1n7Og4ufVr+IbB5Ceqoyu2wJ+Wu1FHAxszu9WIUNjJkhYE1e58pla
         AiBCmBYVQMzb+QlmLUAlvLSn+e/YR9RmtigaEyrTbQdWhTbY6kKRGaOleOHqQG0kiT91
         nX85LldAAPIsRPflnKw+pa8hxB+Gu4iIGy87DsmZxZEBLIbyg4A0BRBtCCy5rt33ub3k
         /ffJi1kkDNwxx9hS9smWqS0DbhX4ZLHnoZ2m7qyO4E+gFP9PZGRNwTDP3pUuzebT6U1c
         8VvQ==
X-Gm-Message-State: AOAM533l3F2ioITsxEeg8kG42q5AtH7vjmDFZYs9bXBDVpPnM/yZ7AKi
        OXgU/ovwR3nptqY9sTIWnHo=
X-Google-Smtp-Source: ABdhPJxYjjk7ksNM6DZY0QBFw3XrRRXqQDI+uOs5vl/sOyRTzB9b6WFc7OTrb1J0Ji2QuljUwOf5cw==
X-Received: by 2002:a05:6000:1010:: with SMTP id a16mr57017298wrx.155.1636068017335;
        Thu, 04 Nov 2021 16:20:17 -0700 (PDT)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id y10sm8036538wrd.84.2021.11.04.16.20.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Nov 2021 16:20:16 -0700 (PDT)
Subject: Re: Fwd: Surface Go VCM type (was: Need to pass
 acpi_enforce_resources=lax on the Surface Go (version1))
To:     Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kate Hsuan <hpa@redhat.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        libcamera-devel@lists.libcamera.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <e2312277-f967-7d3f-5ce9-fbb197d35fd6@gmail.com>
 <3b61bb2d-1136-cf35-ba7a-724da9642855@gmail.com>
 <418dc16a-2a03-7604-a8e2-31c5ddfcf436@redhat.com>
 <58dabc46-211c-844d-3ed3-fd2411936d6d@gmail.com>
 <8d0470d3-7356-b476-6807-5c8606ee3545@redhat.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <8f2b784d-7b3f-cb66-7186-66454a221188@gmail.com>
Date:   Thu, 4 Nov 2021 23:20:15 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <8d0470d3-7356-b476-6807-5c8606ee3545@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans

On 04/11/2021 14:49, Hans de Goede wrote:
> Hi Daniel,
>
> On 11/2/21 00:43, Daniel Scally wrote:
>> Hi Hans
>>
>> On 01/11/2021 16:02, Hans de Goede wrote:
> <snip>
>
>>>> Having looked at this yesterday evening I'm more and more convinced it's
>>>> necessary. I hacked it into the ov8865 driver in the interim (just by
>>>> calling i2c_acpi_new_device() in probe) and then worked on that dw9719
>>>> code you found [1] to turn it into an i2c driver (attached, though still
>>>> needs a bit of work), which will successfully bind to the i2c client
>>>> enumerated by that i2c_acpi_new_device() call. From there though it
>>>> needs a way for the v4l2 subdev to be matched to the sensor's subdev.
>>>> This can happen automatically by way of the lens-focus firmware property
>>>> against the sensor - we currently build those in the cio2-bridge, so
>>>> adding another software node for the VCM and creating a lens-focus
>>>> property for the sensor's software_node with a pointer to the VCM's node
>>>> seems like the best way to do that.
>>> So besides prepping a v5 of my previous series, with update regulator
>>> init-data for the VCM I've also been looking into this, attached are
>>> the results.
>>>
>>> Some notes from initial testing:
>>>
>>> 1. The driver you attached will only successful probe if I insmod
>>> it while streaming video from the sensor. So I think we need another
>>> regulator or the clk for just the VCM too, I will investigate this
>>> later this week.
>> Oh really, I'll test that too; thanks for the patches. There's a couple
>> of tweaks to the driver anyway, so hopefully be able to get it ironed out.
> Ok, I've figured this out now, with the attached patch (which also
> explains what is going on) as well as an updated tps68470_board_data.c
> with updated regulator_init_data for the VCM (also attached), the driver
> can now successfully talk to the VCM in probe() while we are NOT
> streaming from the ov8865.
>
> Daniel, please feel free to squash this into your original dw9719 patch.
>

Nice thanks - I'll do that.

>
>>> 2. I need some help with all the fwnode link stuff (I'm not very familiar
>>> with this). There seems to be a chicken and egg problem here though,
>>> because the v4l2subdev for the VCM does not register because of async stuff
>>> and if we add it to the "graph" then my idea to enumerate the VCMs
>>> from the SSDB on the complete() callback won't work. But we can do this
>>> on a per sensor basis instead from the cio2_notifier_bound() callback
>>> instead I guess ?
>>
>> I think on top of your work in the cio2-bridge for patch 3 you can do this:
>>
>>
>> 1. Create another software node against the cio2_sensor struct, with the
>> name coming from the vcm_types array
>>
>> 2. Assign that software node to board_info.swnode in
>> cio2_bridge_instantiate_vcm_i2c_client()
>>
>> 3. Add another entry to dev_properties for the sensor, that is named
>> "lens-focus" and contains a reference to the software_node created in #2
>> just like the references to the sensor/cio2 nodes.
>>
>>
>> This way when the sensor driver calls
>> v4l2_async_register_subdev_sensor() it should create a notifier that
>> looks for that VCM client to bind. I think then rather than putting
>> anything in the .bound() / .complete() callbacks, we should modify core
>> to do _something_ when async matching some subdevs. The something would
>> depend on the kind of devices that match, for example with the sensor
>> driver and the ipu3-cio2 driver, there's an entity whos function is
>> MEDIA_ENT_F_VID_IF_BRIDGE matching to an entity whos function is
>> MEDIA_ENT_F_CAM_SENSOR, and it seems to me that every scenario like that
>> is going to result in media pad links being created. Similarly for our
>> sensor that's a device with entity function MEDIA_ENT_F_LENS matching to
>> MEDIA_ENT_F_CAM_SENSOR, and I think that in those cases we can create
>> either an interface link or a new kind of link (maybe
>> "MEDIA_LNK_FL_ANCILLARY_LINK" or something...) between the two to show
>> that they form a single logical unit, which we can then report to libcamera.
>>
>>
>> Hope that makes sense...
> Maybe? I have not looked into this closely yet. I'll continue working on
> this coming Tuesday.
>
> If you feel like tinkering I would not mind if you beat me to it this
> weekend :)   OTOH please enjoy your weekend doing whatever, I can continue
> working on this during office-hours next week.


I'll probably have some time to look at it over the next few days; I'll
let you know how I get on.

>
> Regards,
>
> Hans
