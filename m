Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A70A708646
	for <lists+linux-media@lfdr.de>; Thu, 18 May 2023 18:58:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229461AbjERQ6C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 May 2023 12:58:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjERQ6B (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 May 2023 12:58:01 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AB24121
        for <linux-media@vger.kernel.org>; Thu, 18 May 2023 09:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1684429033;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nmcss1d4C5pDA4EBYs9uhUjAfDzF/NxGeW6VIA0akK4=;
        b=eJpRYKIJc5HgQbps/uB1hNA3pNWN3W8DSWe3mdlpgjc9NfhtAYSefLi02qa50OtqEV1Bd5
        n4VCn1yxKpcoqvml0htdShThiD1W9bwN/8ztElQ0BwCG46LgKKYnVXQoaK8luwkIHVFbxh
        5po/zWSzF2QBf9CVbAN1+DKifQnZ7LU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-Ag9UOhYdMK62wbnLTJ_0BA-1; Thu, 18 May 2023 12:57:12 -0400
X-MC-Unique: Ag9UOhYdMK62wbnLTJ_0BA-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-969d75fec7aso315578766b.2
        for <linux-media@vger.kernel.org>; Thu, 18 May 2023 09:57:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684429031; x=1687021031;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nmcss1d4C5pDA4EBYs9uhUjAfDzF/NxGeW6VIA0akK4=;
        b=IdNNQejSujFhZoA5pPwndf6qIKO0G9tUN58VFASihO7hhx0ie7BqfWW7XZbFZYtWOF
         x3Dwa74WRZRfxKb096oMFQ7snpN7071SaUMXP/fpGM9useQcnu+nf/IQSvrVIsl0LxnU
         RslGhcN8S+UYt5umSQueeyES6/q3JJiI31vf+CJt8HnaW0HxXXdeFr8pX1Q4cdaa6Z+3
         HIwIqBoQj9PbCd16qY8a6wOgibWfmzezZAi38bFcYbWbwLw5R+zp8GAcwN4Jxl+xxLNU
         i7ySQGAD46/aqcLOawOP8WJcnvcfGLw3iI90zHbV5kQ1g0UeqzWJxzPY8IYxkhNicKoH
         TJdw==
X-Gm-Message-State: AC+VfDzisW4p1pWxy5FVa4/PJVp0Js9GW5cWZbKRCUvhO/0uOl2NtCVH
        lg0d7vM/TRROLDnmqWD9F5ZXvZVgdQ0Tqk9rTmWmyf9N4ZAMH/hF3/MrwRfwfolexr4HajZE46S
        +fsP5I99cZPD1zDe7UA1CkD0=
X-Received: by 2002:a17:906:4fd6:b0:94e:116:8581 with SMTP id i22-20020a1709064fd600b0094e01168581mr44859481ejw.5.1684429031352;
        Thu, 18 May 2023 09:57:11 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4JU0fvq7vdCXBMDygKUMvpVjOgmCl3HcqCC5pFREVUQeIAaXNqOGPQbKgUvejcUVwmSF0G9g==
X-Received: by 2002:a17:906:4fd6:b0:94e:116:8581 with SMTP id i22-20020a1709064fd600b0094e01168581mr44859458ejw.5.1684429030967;
        Thu, 18 May 2023 09:57:10 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id lj6-20020a170906f9c600b0096b275e19cbsm1188203ejb.115.2023.05.18.09.57.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 May 2023 09:57:10 -0700 (PDT)
Message-ID: <9375a528-8e39-304e-9b60-99ea43e16ec0@redhat.com>
Date:   Thu, 18 May 2023 18:57:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/9] media: v4l: Add v4l2_acpi_parse_sensor_gpios() helper
 function
Content-Language: en-US, nl
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230518153214.194976-1-hdegoede@redhat.com>
 <20230518153214.194976-2-hdegoede@redhat.com>
 <CAHp75Vf6t302XpVKKgm1uyHQ5LsuqSEE+B3AGc1-ODoev77ENA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vf6t302XpVKKgm1uyHQ5LsuqSEE+B3AGc1-ODoev77ENA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 5/18/23 18:36, Andy Shevchenko wrote:
> On Thu, May 18, 2023 at 6:32 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
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
> 
> than
> 
> (not the first time I see the same typo in your commit messages :-)
> 
> 
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
>>
>> There also is a no-op stub provided for non ACPI platforms so that
>> no #ifdef-s are necessary in the driver.
>>
>> Note v4l2_acpi_parse_sensor_gpios() is basically a copy of
>> the atomisp2 v4l2_get_acpi_sensor_info() helper from:
>> drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
>> minus logging the sensor module-name using a second _DSM.
> 
>> v4l2_get_acpi_sensor_info() was already reviewed by Andy,
>> see the Link tag below.
>>
>> (this code duplication is removed in the next patch in this series)
> 
> I believe the above is not needed to be in the commit message, but
> rather in the comments below (after the '---' cutter line).
> 
> ...

<snip>

>> + * Note this code uses the same DSM GUID as the INT3472 discrete.c code
>> + * and there is some overlap, but there are enough differences that it is
>> + * difficult to share the code.
> 
> Can you add the name of the variable in that file, so likely the
> source code indexing tool might add a link?

You mean change the comment something like this:

 * Note this code uses the same DSM GUID as the int3472_gpio_guid in
 * the INT3472 discrete.c code and there is some overlap, but there are
 * enough differences that it is difficult to share the code.

I guess, where int3472_gpio_guid comes from:

drivers/platform/x86/intel/int3472/discrete.c:

static const guid_t int3472_gpio_guid =
        GUID_INIT(0x79234640, 0x9e10, 0x4fea,
                  0xa5, 0xc1, 0xb5, 0xaa, 0x8b, 0x19, 0x75, 0x6f);


?


>> +       devm_acpi_dev_add_driver_gpios(dev, data.map->mapping);
> 
> Won't we print a warning here as well in case of error?

The only way this can fail is with -ENOMEM (we already know dev
has an ACPI companion) and generally speaking the rule is to
not log errors for ENOMEM since when we hit that the kernel
already complains loudly before returning from the alloc call.

> ...
> 
>> +#ifdef CONFIG_ACPI
> 
>> +struct device;
> 
> This should be outside of previous ifdeffery as it's used in a stub.
> 
>> +/**
>> + * v4l2_acpi_parse_sensor_gpios - Parse ACPI info describing sensor GPIOs.
>> + *
> 
> Dunno the style of v4l2, but this line is redundant.
> 
>> + * @dev: Device to parse the ACPI info for
>> + *
>> + * On x86/ACPI platforms the GPIO resources do not provide information
>> + * about which resource maps to which connection-id.
>> + *
>> + * Sensor drivers can call this function to use platform specific methods
>> + * (e.g. the Intel 79234640-9e10-4fea-a5c1-b5aa8b19756f _DSM) to get
>> + * information about the pins and add GPIO mappings to make standard gpiod_get()
>> + * calls work.
>> + *
>> + * The registered mappings use devm managed memory and are automatically free-ed
>> + * on remove() and on probe() failure.
>> + */
> 
> Usually the kernel doc is attached to the function implementation

Thank you for the review!

I agree with all your other points and I'll address them
in the next version.

The kernel doc being here is modeled after newer (less old)
v4l2 APIs like include/media/v4l2-fwnode.h and
include/media/v4l2-async.h which all also have this in the header.

So unless the v4l2 folks want me to change this I'm going to keep
the kernel docs in the header.

(more in general I have seen both header and next to the body
placements for these kernel docs in various places in the kernel)

Regards,

Hans




>> +void v4l2_acpi_parse_sensor_gpios(struct device *dev);
>> +
>> +#else /* ifdef CONFIG_ACPI */
>> +static inline void v4l2_acpi_parse_sensor_gpios(struct device *dev) { return 0; }
>> +#endif /* ifdef CONFIG_ACPI */
> 

