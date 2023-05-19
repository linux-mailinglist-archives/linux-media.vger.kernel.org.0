Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F909709248
	for <lists+linux-media@lfdr.de>; Fri, 19 May 2023 10:56:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231196AbjESI42 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 May 2023 04:56:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229684AbjESI41 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 May 2023 04:56:27 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2224E56
        for <linux-media@vger.kernel.org>; Fri, 19 May 2023 01:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1684486547;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+mCzlRTfczI4uLIRmIlmwD1ya4/iYCwvBsCDTTILQv4=;
        b=fqnpDNIldo1dZ2+eKjKE68mlKzoHeJkTp0t4u86DLbj/PQGdMnhGUDPfFw5lKU+iIxCMI4
        6DPYfK/kHQL++aCLswE/eHnjGSbuuxmMNLI+Pyn2XRXnRVhejPFGWdg6cXR8NJukWl++TW
        TdhyEbl4JpZumK/FWCRzc4NceHb+jQk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-507-flnenxkzPKelOKgklUbVvA-1; Fri, 19 May 2023 04:55:45 -0400
X-MC-Unique: flnenxkzPKelOKgklUbVvA-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-50d88a986afso1786835a12.0
        for <linux-media@vger.kernel.org>; Fri, 19 May 2023 01:55:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684486544; x=1687078544;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+mCzlRTfczI4uLIRmIlmwD1ya4/iYCwvBsCDTTILQv4=;
        b=KM2Ky/rf3z71+HtnNJ0TX4KbD64NggWk2ZZQyURUY42qsuPK/V60PTfSFqKDcNbj1M
         d1egiRN8eDUbmXZcIcIa/49S1FVhWM6/+90iQUzDsktQCabyLvTKvNRPfHZkEpYn0zTp
         CPR5ucwu3Y7Lct5RAylXxVQGVO5bPrKx/zv2PaxHfJqCSzPMMa1XOLZj36jhtWFs/C02
         1wraO4c3Ou06vfKGUL6GDYyqoqWLtDo52DI1fLy6RM0Kweb5M7FuObf1fpfOC2Zvlb0f
         iLb0Gs4D4nlczVFuOaNgEEiEofhImCBQNJP4eQDnYALtXwS2uHXu6kOeXzbz7cVkCGrI
         ku1Q==
X-Gm-Message-State: AC+VfDxaKS+7j6Lc0EVNIlnhpdK/pEobvru/ZV5JrotxMDDi971oqXCg
        L6lUM8oWsM1gwq3Ah2Hvbxy/owOq5ocCvbxTzHAhPGEHjKr1BcDKJ0bevvce8rkVryWeChu+U/T
        BVXG+UT0LyLerw8Jvx54rss0=
X-Received: by 2002:aa7:c0c8:0:b0:504:921b:825 with SMTP id j8-20020aa7c0c8000000b00504921b0825mr701607edp.36.1684486544469;
        Fri, 19 May 2023 01:55:44 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ54Y36/yWlTKLJJKBI368PeDNof9+g51VDVzQP/zS9Ez8W7ZeOiSldqFZDbbcuHDGZ2N+fuDA==
X-Received: by 2002:aa7:c0c8:0:b0:504:921b:825 with SMTP id j8-20020aa7c0c8000000b00504921b0825mr701601edp.36.1684486544188;
        Fri, 19 May 2023 01:55:44 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id u23-20020aa7d897000000b0050bd59fd0efsm1435974edq.49.2023.05.19.01.55.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 May 2023 01:55:43 -0700 (PDT)
Message-ID: <cb4e56fd-0745-6040-6d93-bd8eb1d23ce1@redhat.com>
Date:   Fri, 19 May 2023 10:55:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/9] media: v4l: Add v4l2_acpi_parse_sensor_gpios() helper
 function
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230518153214.194976-1-hdegoede@redhat.com>
 <20230518153214.194976-2-hdegoede@redhat.com>
 <ZGcl7+cKu0/h43YC@kekkonen.localdomain>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZGcl7+cKu0/h43YC@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On 5/19/23 09:31, Sakari Ailus wrote:
> Hi Hans,
> 
> On Thu, May 18, 2023 at 05:32:06PM +0200, Hans de Goede wrote:
>> On x86/ACPI platforms the GPIO resources do not provide information
>> about which GPIO resource maps to which connection-id. So e.g.
>> gpiod_get(devg, "reset") does not work.
>>
>> On devices with an Intel IPU3 or newer ISP there is a special ACPI
>> INT3472 device describing the GPIOs and instantiating of the i2c_client
>> for a sensor is deferred until the INT3472 driver has been bound based
>> on the sensor ACPI device having a _DEP on the INT3472 ACPI device.
>>
>> This allows the INT3472 driver to add the necessary GPIO lookups
>> without needing any special ACPI handling in the sensor driver.
>>
>> Unfortunately this does not work on devices with an atomisp2 ISP,
>> there the _DSM describing the GPIOs is part of the sensor ACPI device
>> itself, rather then being part of a separate ACPI device.
>>
>> IOW there is no separate firmware-node to which we can bind to register
>> the GPIO lookups (and also no way to defer creating the sensor i2c_client).
>>
>> This unfortunately means that all sensor drivers which may be used on
>> BYT or CHT hw need some code to deal with ACPI integration.
>>
>> This patch adds a new v4l2_acpi_parse_sensor_gpios() helper function
>> for this, which does all the necessary work. This minimizes the
>> (unavoidable) change to sensor drivers for ACPI integration to just
>> adding a single line calling this void function to probe().
> 
> I'd rather avoid making changes to sensor drivers due to this hack. At the
> very least it must be labelled so: this has no more to do with ACPI
> standard than that this information happens to be located in an ACPI table.

IMHO this is definitely a problem with a mismatch between how the ACPI spec.
describes GPIOs vs the linux GPIO APIs which are based on the DT model

Almost all drivers which deal with ACPI enumerated devices also have to
deal with this mismatch. Most drivers come with their own acpi_gpio_mapping
table and call devm_acpi_dev_add_driver_gpios() before doing any gpiod_get()
calls because of this. This is in no way unique to sensor drivers.

The only way around this is embedding DT bits inside ACPI and if anything
the embedding DT bits inside ACPI is the hack here.

Anyways whether this is a hack or not is bikeshedding. But your calling
it a hack seems to come from a somewhat devicetree centric view; at least
doing the DT embedding thing is certainly the exception and not the rule
in the ACPI world since most ACPI tables are written for Windows which
does not use the embedded DT bits.

The Intel ISP/IPU sensor GPIO handling is a bit special because instead
of having a simple index -> connection-id mapping it involves a _DSM,
but that part is all abstracted away inside the new helper and actually
avoids the need to have an acpi_gpio_mapping per sensor-driver, which would
be the normal way to deal with this and which would actually mean a lot
more code per driver.

> Although if the number of those drivers would be small, this could be just
> undesirable but still somehow acceptable. And I wouldn't expect new sensors
> to be paired with the IPU2 anymore. How many drivers there would be
> roughly? I think I've seen ten-ish sensor drivers with the atomisp driver.

About ten-ish drivers sounds right.

> Isn't it possible to create a device for this purpose and use software
> nodes for the GPIOs? I guess that would be a hack as well and you'd somehow
> have to initialise this via other route than driver probe.

This creates unsolvable probe-ordering problems. At a minimum we would
need some check inside sensor drivers for them to return -EPROBE_DEFER
until the GPIO mappings are added through some other means. Note that
without the mappings gpiod_get will return -ENOENT, so we cannot just
use its return value.

And if we need some changes anyways just adding the single line call
to the new helper seems both the least invasive and the easiest.

Regards,

Hans


