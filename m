Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99B63709A0E
	for <lists+linux-media@lfdr.de>; Fri, 19 May 2023 16:40:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231250AbjESOkT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 May 2023 10:40:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230414AbjESOkS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 May 2023 10:40:18 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84D5ACE
        for <linux-media@vger.kernel.org>; Fri, 19 May 2023 07:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1684507173;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cFrYUZWO6L2HJAhbZ60ej+T/XDTkBh/yUs2r02Xy1og=;
        b=QTQUUp2RuYWznDOQbzJoXmaXsfHynC7sBGR6FCCRZitfjrM0YeFgoc/Xt/zjd1T1wQTFLL
        C4ZCIWPenr8A9e1Chi8ck7giPOJFjLyOoGUVq5OTEn5Q45yH3oInhia+rmfe91QT84Fzj8
        /c8IcAZsxOrfBD8fz9Rc6uBp/HtlsyE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-56-6G08yGWQPjCrMpcHlEtqtA-1; Fri, 19 May 2023 10:39:32 -0400
X-MC-Unique: 6G08yGWQPjCrMpcHlEtqtA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-96f6fee8123so69188966b.0
        for <linux-media@vger.kernel.org>; Fri, 19 May 2023 07:39:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684507171; x=1687099171;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cFrYUZWO6L2HJAhbZ60ej+T/XDTkBh/yUs2r02Xy1og=;
        b=Aj5uYKA4nPSGnXtaogmPYBmvVyJaY9rydqwj/yqggECBgbmXTYBXADe3iIVXWPS2mv
         2pbaW/x47PO1oDuQZSJUGqQKXSoLSzl6NRfPFAdYjeIKWcnHybhj0NZbgiGM9WjBnXE+
         6JOt0yXLvj+qVtMAq/KezX4P/i6E27unE+LKTQ90kWMpgHqjrPj5XcrrmE68Sx42c0iu
         q89F8pMRtebOMQX0Jq8a2v05tRrxbG457oD08WcC7Qd3R+4dK0+IK/9ZjsI+CJOH5g1T
         Qfixkgi0nmr+5vO/HCXUXNUMGX5/LapP1IsjmbL68wg0ON/5/sDJ6qFMPBgourAQf55h
         YIzw==
X-Gm-Message-State: AC+VfDzeJlJI15s6Za6CmhIR1xl1zGyqBY3/9+4V2LKmSmtcuC/VlEgS
        IjeqACEowhC8QiJM1HRGCAajT+rUNMfyW3LrVxA9FGT7tsWFjDGFuVtKoicm+8uTuXcJ2LlgpCk
        arEILgkKXsFbi7GQ9IP3p1fQ=
X-Received: by 2002:a17:906:794b:b0:965:d7c7:24cc with SMTP id l11-20020a170906794b00b00965d7c724ccmr2116870ejo.23.1684507171049;
        Fri, 19 May 2023 07:39:31 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4tOLwe42HWHjVX++VelFGTpHDv+CzCXcMAkYrotkjZ8+42izFmKClqBIPAW89L8SRthEXSKg==
X-Received: by 2002:a17:906:794b:b0:965:d7c7:24cc with SMTP id l11-20020a170906794b00b00965d7c724ccmr2116845ejo.23.1684507170739;
        Fri, 19 May 2023 07:39:30 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id c17-20020aa7d611000000b004fbdfbb5acesm1753176edr.89.2023.05.19.07.39.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 May 2023 07:39:30 -0700 (PDT)
Message-ID: <e4b40a54-25e0-74d0-eb97-af36d7e78d2e@redhat.com>
Date:   Fri, 19 May 2023 16:39:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/9] media: v4l: Add v4l2_acpi_parse_sensor_gpios() helper
 function
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Dan Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230518153214.194976-1-hdegoede@redhat.com>
 <20230518153214.194976-2-hdegoede@redhat.com>
 <ZGcl7+cKu0/h43YC@kekkonen.localdomain>
 <cb4e56fd-0745-6040-6d93-bd8eb1d23ce1@redhat.com>
 <ZGdWVATARAQlaEjC@kekkonen.localdomain>
 <d230dd21-9c2b-2dc4-0325-6ceb502c3ba0@redhat.com>
 <ZGdohJQSY3GiNLSy@kekkonen.localdomain>
 <1bd06502-d1f5-1ba2-600a-aec6cdf49a27@redhat.com>
 <ZGeBKePUH55wi9dI@kekkonen.localdomain>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZGeBKePUH55wi9dI@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 5/19/23 16:01, Sakari Ailus wrote:
> Hi Hans,
> 
> On Fri, May 19, 2023 at 03:08:02PM +0200, Hans de Goede wrote:
>> Hi Sakari,
>>
>> On 5/19/23 14:16, Sakari Ailus wrote:
>>> Hi Hans,
>>>
>>> On Fri, May 19, 2023 at 01:55:04PM +0200, Hans de Goede wrote:
>>>> Hi Sakari,
>>>>
>>>> On 5/19/23 12:58, Sakari Ailus wrote:
>>>>> Hi Hans,
>>>>>
>>>>> On Fri, May 19, 2023 at 10:55:42AM +0200, Hans de Goede wrote:
>>>>
>>>> <snip>
>>>>
>>>>>>> Although if the number of those drivers would be small, this could be just
>>>>>>> undesirable but still somehow acceptable. And I wouldn't expect new sensors
>>>>>>> to be paired with the IPU2 anymore. How many drivers there would be
>>>>>>> roughly? I think I've seen ten-ish sensor drivers with the atomisp driver.
>>>>>>
>>>>>> About ten-ish drivers sounds right.
>>>>>>
>>>>>>> Isn't it possible to create a device for this purpose and use software
>>>>>>> nodes for the GPIOs? I guess that would be a hack as well and you'd somehow
>>>>>>> have to initialise this via other route than driver probe.
>>>>>>
>>>>>> This creates unsolvable probe-ordering problems. At a minimum we would
>>>>>> need some check inside sensor drivers for them to return -EPROBE_DEFER
>>>>>> until the GPIO mappings are added through some other means. Note that
>>>>>> without the mappings gpiod_get will return -ENOENT, so we cannot just
>>>>>> use its return value.
>>>>>
>>>>> They probably will already need this in order to make sure the atomisp
>>>>> bridge has been initialized.
>>>>
>>>> The instantiation of the sensor i2c_clients and of the atomisp PCI device
>>>> is independent of each other. In my other patch series I'm moving sensor
>>>> registration for atomisp over to the v4l2-async framework like all other
>>>> bridge/ISP drivers use so that atomisp no longer needs special sensor
>>>> drivers.
>>>>
>>>> And AFAIK one of the reasons for having the v4l2-async framework is
>>>> to avoid needing to have a specific probe order between bridge vs
>>>> sensor drivers.
>>>>
>>>>> Could this code live in the atomisp bridge instead?
>>>>
>>>> That does not solve the probe ordering problem the sensor drivers
>>>> need the GPIOs to enable the sensor and they all enable the sensor
>>>> in their probe() to check the hw-id. The sensor's probe() function
>>>> runs without any ordering guarantees vs the ISP/brige's probe()
>>>> function. This is not an issue because at least during probe()
>>>> the sensor drivers don't have any interactions with the bridge
>>>> and any further access to the sensor-drivers is delayed until
>>>> the v4l2-async notifier completion callback has run.
>>>>
>>>> The only way to work around the probe-ordering problem would
>>>> be to delay checking the hw-id until the sensor gets linked
>>>> to the bridge. Which would mean registering an async notifier
>>>> from the sensors to catch binding from the sensor drivers
>>>> and allowing the binding to fail.
>>>>
>>>> Delaying the hw-id check like this would be much more involved
>>>> then the currently proposed solution and will likely cause
>>>> other issues like the wrong driver binding when hw-vendors
>>>> get the ACPI hw-id wrong (this is a known issue with audio-codecs,
>>>> so chances are we will see this with sensors too).
>>>
>>> A simple question: how do you solve the probe ordering issue when it comes
>>> to the atomisp bridge creating the graph endpoints needed by sensor
>>> drivers?
>>>
>>> Or do you assume the sensor drivers will always use some static
>>> configuration?
>>
>> This is all modeled after the IPU3 work done by Dan Scally and
>> ATM the involved sensor drivers assume a static configuration
>> wrt number of lanes + link frequency.
> 
> In general the number of lanes used is dependent on a particular board, and
> in many cases the same sensor is used on different systems with a different
> lane configuration. This might not happen on sensors used with atomisp but
> it probably already happens on those used by the CIO2 (ov8865).
> 
> What the drivers should do and in most cases do is that they check the lane
> configuration is valid for the device.
> 
>>
>> If / when we want to start supporting say both single + dual
>> lane modes (with e.g. reduced framerate for high res in single lane)
>> then AFAICT this will only influence things like e.g. subdev calls
>> to get supported framerates and of course turning on streaming,
>> all of which only ever happen after the async subdev registration
>> of all involved subdevs is complete.
> 
> On sensors the number of lanes is practically never selected dynamically,
> it's simply a property of the board (the CSI-2 receiver and how many wires
> happen to be connected, whichever has fewer lanes).

Right, I understand / agree what I meant is that the driver does not
really need to know the number of connected lanes during probe().

But yes if you want to check the number of lanes is valid in probe()
then you do need to know it.

>> So (again AFAICT) unlike the GPIOs there is no need to need
>> to know the endpoint configuration at probe() time. But since
>> we do want to turn the sensor on to check it is actually there
>> and if it is the type of sensor we expect during probe() we
>> do need the GPIOs beforehand.
> 
> The other, somewhat cleaner in my opinion and clearly more future-proof,
> would be to return -EPROBE_DEFER if there are no endpoints. Which is also
> what the ov8865 driver does already.

Ok that is a good suggestion, which I think should work. I'll give this
a try sometime during the coming days.

Regards,

Hans


