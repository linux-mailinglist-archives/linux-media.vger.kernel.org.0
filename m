Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AA9B443052
	for <lists+linux-media@lfdr.de>; Tue,  2 Nov 2021 15:24:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbhKBO0r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Nov 2021 10:26:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38486 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231576AbhKBO0l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Nov 2021 10:26:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635863046;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1YjJj9IqpDhJ07HE33uojzp5DuJdOMzvHOGPrvOy2QU=;
        b=b9AsSj6i1AcGLKQ2t8BdJ0vCpxnWC0HdlpYBh5pxxWKgBWDtFzzLMvO4Xxp3Dn5ZSfEEa0
        NpSZPzESE3IJ+sQv6LxmfUj0jjFUyuBy8xnLGnXkX0Av9fDqW/FUQPJMp1pdBedcjTHJuU
        3pxZ/bH7AS9W6DoBxOXHSbbsMeZtiQ0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-ZnpbFXPYN8uT4QBxG6fqGw-1; Tue, 02 Nov 2021 10:24:05 -0400
X-MC-Unique: ZnpbFXPYN8uT4QBxG6fqGw-1
Received: by mail-ed1-f71.google.com with SMTP id m8-20020a056402510800b003e29de5badbso3710649edd.18
        for <linux-media@vger.kernel.org>; Tue, 02 Nov 2021 07:24:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1YjJj9IqpDhJ07HE33uojzp5DuJdOMzvHOGPrvOy2QU=;
        b=xRVAD73rf8y5vOEX7bkzEpZfyaviM0XDfcHXozIoht5RO6W5V1wc0cHDW1x6VdE9ro
         qLsJI2Ic/YUYjVp09GHnaS0yBEu+Aw4xquaL4/+b6leUrzRWht6d3SoYxdnA+uSTJlSe
         Bc75f/aa2XMFOBO1Tx7QUH2uq86yFEPppZpQUtIXUQFQpw/XHYH9tc4ktw6QUGBC3WOi
         iqLxWXZ+B1eDFdjg4ImxAWemWmZxN9YX4+r82avbnq/Y6+p+J4xGgXulfORNw7ewEGor
         HQGiwWkUXRDt92lK70JITjOva4DngLy8YKmPJpZJnv6PqMOR4avmq+TVKpvU7nhxpKcQ
         V30A==
X-Gm-Message-State: AOAM530EWNsMxTxdTCC1alMMbFJ79xtb72OMu4XFOV+jii08kGm2cuNc
        PvrhSimC5c4cw9+htsUA20MI4m/S4n2cZg2JkcfqdteG0vY9kQ0v1FJwDSuNm8zXykLWlX41eYT
        I+Q5deBfRFyOTJsUWeyno10E=
X-Received: by 2002:a17:907:7f8b:: with SMTP id qk11mr46491562ejc.313.1635863043780;
        Tue, 02 Nov 2021 07:24:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkmvL1HIl9M3KIUQMmw+yeeX/QNnPDpALyKPCkIFoHEdHZkwzBVyQbxiHQ+ACffR2u+1RHkA==
X-Received: by 2002:a17:907:7f8b:: with SMTP id qk11mr46491524ejc.313.1635863043578;
        Tue, 02 Nov 2021 07:24:03 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id sg17sm3448785ejc.72.2021.11.02.07.24.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Nov 2021 07:24:02 -0700 (PDT)
Message-ID: <8eaeca66-f719-6b5d-bd7c-ccbd15a0b91c@redhat.com>
Date:   Tue, 2 Nov 2021 15:24:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v5 07/11] platform/x86: int3472: Split into 2 drivers
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Len Brown <lenb@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
References: <20211102094907.31271-1-hdegoede@redhat.com>
 <20211102094907.31271-8-hdegoede@redhat.com>
 <CAHp75VePSv8b=oTJXJCL_go9Lody+8JQJyMC6exO-Zw8cPk9og@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VePSv8b=oTJXJCL_go9Lody+8JQJyMC6exO-Zw8cPk9og@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 11/2/21 15:16, Andy Shevchenko wrote:
> On Tue, Nov 2, 2021 at 11:49 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> The intel_skl_int3472.ko module contains 2 separate drivers,
>> the int3472_discrete platform driver and the int3472_tps68470
>> I2C-driver.
>>
>> These 2 drivers contain very little shared code, only
>> skl_int3472_get_acpi_buffer() and skl_int3472_fill_cldb() are
>> shared.
>>
>> Split the module into 2 drivers, linking the little shared code
>> directly into both.
>>
>> This will allow us to add soft-module dependencies for the
>> tps68470 clk, gpio and regulator drivers to the new
>> intel_skl_int3472_tps68470.ko to help with probe ordering issues
>> without causing these modules to get loaded on boards which only
>> use the int3472_discrete platform driver.
>>
>> While at it also rename the .c and .h files to remove the
>> cumbersome intel_skl_int3472_ prefix.
> 
> ...
> 
>> +union acpi_object *skl_int3472_get_acpi_buffer(struct acpi_device *adev, char *id)
>> +{
>> +       struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
>> +       acpi_handle handle = adev->handle;
>> +       union acpi_object *obj;
>> +       acpi_status status;
>> +
>> +       status = acpi_evaluate_object(handle, id, NULL, &buffer);
>> +       if (ACPI_FAILURE(status))
>> +               return ERR_PTR(-ENODEV);
>> +
>> +       obj = buffer.pointer;
>> +       if (!obj)
>> +               return ERR_PTR(-ENODEV);
>> +
>> +       if (obj->type != ACPI_TYPE_BUFFER) {
>> +               acpi_handle_err(handle, "%s object is not an ACPI buffer\n", id);
> 
>> +               kfree(obj);
> 
> I'm wondering if we should use more of the ACPI_FREE() calls as
> opposed to ACPI_ALLOCATE_BUFFER. Ditto for all such cases.

Basically the situation surrounding this is a mess, most code seems to
simply use plain kfree() which I find much more readable, but some
code indeed is using ACPI_FREE(), which I believe is really mostly
meant for internal use by the acpica code.

Eitherway until one of the ACPI maintainers clearly states
that we really should use ACPI_FREE() here I plan to stick with kfree()
because:

1. I find it much more readable.
2. AFAICT ACPI_FREE() is meant for acpica internal use
   (basically it is part of the OS abstraction bits of acpica)

Regards,

Hans

