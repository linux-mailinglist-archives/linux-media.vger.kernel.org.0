Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62A3A63DAA6
	for <lists+linux-media@lfdr.de>; Wed, 30 Nov 2022 17:30:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230159AbiK3Qam (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Nov 2022 11:30:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230160AbiK3Qac (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Nov 2022 11:30:32 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DD6E2B26B
        for <linux-media@vger.kernel.org>; Wed, 30 Nov 2022 08:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669825775;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Y1PU8u2hxhHX+po+T8EOrOjAcOQeKfP7OIdF96OKHDU=;
        b=ExSNVE6tvT2iiyztBExHgevHONr6rdeFIegF52SVOPp+Q+NDxd/VnCK0C5+wGvqBM47nUa
        d8uMlc9wULH9JBDl1HFAzuD229JUw/TGhAtvMZbI2jxvX3JRmFxYr/JnJeWqzE0pvn9zvY
        z5+8wJ1h9fjnTI1gO44/atlYxtc+oK4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-381-xVHlc2VaPjekN0r1V5U9IA-1; Wed, 30 Nov 2022 11:29:33 -0500
X-MC-Unique: xVHlc2VaPjekN0r1V5U9IA-1
Received: by mail-ej1-f70.google.com with SMTP id ds15-20020a170907724f00b007c0abebc958so13343ejc.2
        for <linux-media@vger.kernel.org>; Wed, 30 Nov 2022 08:29:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y1PU8u2hxhHX+po+T8EOrOjAcOQeKfP7OIdF96OKHDU=;
        b=ZNX+zOCbUwaBABCawkhp3YLtwVZ1WVrhww65s6e6PeEBk6OdvUPlI1fdQPHH8xOkaF
         iRQAiKjdPSbj3KvSNdi78GDjetIom2V349KnGKgtXg0UgY4YfoK+unCMYpC1LQJAyRxn
         HtTnnTw2in9ucRLf/CVUsUSMAWtDCo4FDqvmofM0AtHlMolCgZgMsc5wwrpN+aK9P22N
         PpGwBitFWkV962INL28SIopWfSHDHDPvJYJn8bRZPyiWkmWqADKBZWFpphJoflnBfP1A
         hJLdY/X3G0SHjrnDx6pbde6ALh0K2Q/FCxuEQdq+6FaMEcwHccUzo7Y/e4cKbxgk7cUK
         nSXQ==
X-Gm-Message-State: ANoB5pkqzEoc7FnrhaJe28aNU6QaW8xlSHiMUC1ltTO873MDAn8B1lMZ
        TBukYw5gbzc+ZJpihGbGT/hyzroQgx62V02DN+Z/a0ABYP4vH3EpyRmdhGePaBnD1bh3hZKW+Eb
        DaddTxRHRI6fWycQ6nMwjmWY=
X-Received: by 2002:a17:907:c24a:b0:7ac:2e16:bc31 with SMTP id tj10-20020a170907c24a00b007ac2e16bc31mr13148570ejc.242.1669825772605;
        Wed, 30 Nov 2022 08:29:32 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4NynBhLwKJjiZx/eua28kPuRfimcteNpDpW5XitulAlvMAH4oYkzrgcX4xxlFILODzRLYUXQ==
X-Received: by 2002:a17:907:c24a:b0:7ac:2e16:bc31 with SMTP id tj10-20020a170907c24a00b007ac2e16bc31mr13148552ejc.242.1669825772365;
        Wed, 30 Nov 2022 08:29:32 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id ay17-20020a056402203100b00461e4498666sm794605edb.11.2022.11.30.08.29.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 08:29:31 -0800 (PST)
Message-ID: <da97e941-d08a-6c9e-d526-2629668d502c@redhat.com>
Date:   Wed, 30 Nov 2022 17:29:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 1/6] media: ov5693: Add support for a privacy-led GPIO
Content-Language: en-US, nl
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        platform-driver-x86@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        linux-media@vger.kernel.org
References: <20221129231149.697154-1-hdegoede@redhat.com>
 <20221129231149.697154-2-hdegoede@redhat.com>
 <Y4ddgnRbRyUDSPFI@paasikivi.fi.intel.com>
 <ad9d01b6-de08-b54c-d300-cf133df90536@redhat.com>
 <Y4duQpP/GrfFQkwS@paasikivi.fi.intel.com>
 <Y4d0q08KXoUBD+t6@pendragon.ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y4d0q08KXoUBD+t6@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 11/30/22 16:20, Laurent Pinchart wrote:
> On Wed, Nov 30, 2022 at 02:52:50PM +0000, Sakari Ailus wrote:
>> On Wed, Nov 30, 2022 at 02:56:46PM +0100, Hans de Goede wrote:
>>> On 11/30/22 14:41, Sakari Ailus wrote:
>>>> On Wed, Nov 30, 2022 at 12:11:44AM +0100, Hans de Goede wrote:
>>>>> Add support for a privacy-led GPIO.
>>>>>
>>>>> Making the privacy LED to controlable from userspace, as using the LED
>>>>> class subsystem would do, would make it too easy for spy-ware to disable
>>>>> the LED.
>>>>>
>>>>> To avoid this have the sensor driver directly control the LED.
>>>>>
>>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>>> ---
>>>>> Note an additional advantage of directly controlling the GPIO is that
>>>>> GPIOs are tied directly to consumer devices. Where as with a LED class
>>>>> device, there would need to be some mechanism to tie the right LED
>>>>> (e.g front or back) to the right sensor.
>>>>
>>>> Thanks for the patch.
>>>>
>>>> This approach has the drawback that support needs to be added for each
>>>> sensor separately. Any idea how many sensor drivers might need this?
>>>
>>> Quite a few probably. But as discussed here I plan to write a generic
>>> sensor_power helper library since many sensor drivers have a lot of
>>> boilerplate code to get clks + regulators + enable/reset gpios. The plan
>>> is to add support for a "privacy-led" to this library so that all sensors
>>> which use this get support for free.
>>
>> I'm not sure how well this could be generalised. While most sensors do
>> something similar there are subtle differences. If those can be taken into
>> account I guess it should be doable. But would it simplify things or reduce
>> the number of lines of code as a whole?
> 
> While I think we need a camera sensor helper, I also doubt managing the
> power sequence in the helper would help much. The privacy LED, however,
> could be handled there.

From a quick peek most of the sensor drivers I've looked at
(which is only a few) do:

-bulk-enable-regulators
-enable 1 clk
-set bunch of gpios
-sleep a bit

Since this requires to first get all the resources for this, which
needs error checking + reporting and then requires also error
checking the actual enabling + rollback on failure this is quite
a bit of code duplicated against many sensor drivers.

I agree that if a sensor does not fit in this model, that it then
should not use the helper and just open code the sequence but
I believe that for a bunch of sensor drivers with a simple
power-on sequence this can remove a bunch of code duplication.

Anways this is a clear case of the proof is in the tasting of
the pudding. So when I can make some time for this I'll submit
a patch series with the helper + converting a couple of sensors
(those which I can test) and then we can see from there.

>> The privacy LED is separate from sensor, including its power on/off
>> sequences which suggests it could be at least as well be handled
>> separately.
> 
> And if the privacy LED is controllable through a GPIO, I think it should
> be turned on at stream on time, not at power on time. That would allow
> things like reading the OTP data from the sensor without flashing the
> privacy LED.

Agreed.

Regards,

Hans


