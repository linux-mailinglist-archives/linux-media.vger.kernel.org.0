Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 987B24423F2
	for <lists+linux-media@lfdr.de>; Tue,  2 Nov 2021 00:26:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230519AbhKAX3B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 19:29:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229684AbhKAX3A (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Nov 2021 19:29:00 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74B94C061714
        for <linux-media@vger.kernel.org>; Mon,  1 Nov 2021 16:26:26 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id a20-20020a1c7f14000000b003231d13ee3cso415871wmd.3
        for <linux-media@vger.kernel.org>; Mon, 01 Nov 2021 16:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=9KdY1mjESmMvVAcwHVOwXELedlsfZ2Tt7d3SBA18Sdg=;
        b=RsEm6xTVEjJb1DNwrWD8gorUw40W+lq/aFI+NT2bBNJ6kzPx+3V6I5Ypvz17SOrOQC
         5x4ottMggFtOeqHdu0Oq5dwqRLUeh7G++Bu+Bgez7x9mqyf9Y1yTV43gxk8iBLbEbX16
         xHNJNUKQgetlJtMHkCTrGnmNfh4oyqVeuqvmcUleJjpME7WB6Nbki3501EuDIj8wTpif
         OZstd+FmMRRY9CIaQKxslbUYFaYvPRAJ8fxf4bLcRpqgR/vL9c6jIOggAYLiV0z/1Zgq
         LFg6316dZe8WDg4FYV6MHTuoLlrFxnpNo75v7NzK5/81Y/ekFNqA/lHg0r+D6k6F/JAX
         3NDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=9KdY1mjESmMvVAcwHVOwXELedlsfZ2Tt7d3SBA18Sdg=;
        b=8F/eZNE229jsnS3DVvSr8ldpwZjgA4W7aNSKNukw273q6E4D0dCms4d6mhL4IXLb+y
         rjDAKsnjvkvzUIU427n9tLy7f/uwoJsRs3dzK3taPTqBtFo9BrGzSo4FfwqhG2UEBuve
         gpiZn9ZdUcUeIoQhYH94AnP+0ukuZEhicRX95QcfxndItwkbRKXsVxohTp0ACsOfvOmE
         Ioti+qp2qwhjbvTRegzjb0NhvXkYmzzlLZO5olLxyzyWy2mNkdBvh3tRnnRyB6txcxXW
         BtG+F1B6h6fRzrGEoGhv+XKNgF/awl9NQkzT5oYGHAKn6MY3Tt3Uw6io4sGivtCdluqs
         S5dQ==
X-Gm-Message-State: AOAM531BupB3hmHi7Cw9U58jz6aC22l7ZBKtlPA5agKT6ZuVWkZqfv+O
        5kznXGHnTcYYPLiTXJMmDzY=
X-Google-Smtp-Source: ABdhPJw1DmrYpGziuqTXCEs7+H/q+7NQvWxHBtKvoUIQxoxtfbD2tT4SaDYGQlBG0+gphF+Qwbdq9A==
X-Received: by 2002:a05:600c:1d01:: with SMTP id l1mr2452308wms.44.1635809185089;
        Mon, 01 Nov 2021 16:26:25 -0700 (PDT)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id h18sm9527237wre.46.2021.11.01.16.26.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Nov 2021 16:26:24 -0700 (PDT)
Subject: Re: Fwd: Surface Go VCM type (was: Need to pass
 acpi_enforce_resources=lax on the Surface Go (version1))
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        libcamera-devel@lists.libcamera.org
References: <e2312277-f967-7d3f-5ce9-fbb197d35fd6@gmail.com>
 <3b61bb2d-1136-cf35-ba7a-724da9642855@gmail.com>
 <YYAN5aygAZ9W5Ev2@smile.fi.intel.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <e8e4b6fe-5377-6661-389b-3c0ce8ecec9c@gmail.com>
Date:   Mon, 1 Nov 2021 23:26:23 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YYAN5aygAZ9W5Ev2@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy

On 01/11/2021 15:55, Andy Shevchenko wrote:
> On Fri, Oct 29, 2021 at 12:50:31PM +0100, Daniel Scally wrote:
>> Hi all
>>
>> +CC linux-media and libcamera-devel, as it's probably a good time to
>> broaden this out. Also Andy because I'm hoping you can help :) The
>> background of the discussion is about how we identify and enumerate
>> (correctly, I.E. with a type matching the vcm driver's i2c_device_id,
>> and there are a few different vcm's in scope which seem encoded in the
>> SSDB buffer) which VCM module is linked to a sensor in Intel's IPU3
>> centric ACPI tables. The I2C address for the device is just a second
>> I2cSerialBusV2 against the sensor's acpi device rather than a separate
>> one, which is no awkward. We also need to get firmware created for the
>> VCM such that the sensor will link to it via the lens-focus property.
>> On 28/10/2021 09:57, Hans de Goede wrote:
> ...
>
>> To throw a spanner in the works though; I noticed this delightful _CRS
>> for the OV9734 sensor of a  Surface Laptop 1 earlier:
>>
>> Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
>> {
>>     Name (SBUF, ResourceTemplate ()
>>     {
>>         I2cSerialBusV2 (0x0036, ControllerInitiated, 0x00061A80,
>>             AddressingMode7Bit, "\\_SB.PCI0.I2C2",
>>             0x00, ResourceConsumer, , Exclusive,
>>             )
>>         I2cSerialBusV2 (0x0050, ControllerInitiated, 0x00061A80,
>>             AddressingMode7Bit, "\\_SB.PCI0.I2C2",
>>             0x00, ResourceConsumer, , Exclusive,
>>             )
>>         I2cSerialBusV2 (0x0051, ControllerInitiated, 0x00061A80,
>>             AddressingMode7Bit, "\\_SB.PCI0.I2C2",
>>             0x00, ResourceConsumer, , Exclusive,
>>             )
>>         I2cSerialBusV2 (0x0052, ControllerInitiated, 0x00061A80,
>>             AddressingMode7Bit, "\\_SB.PCI0.I2C2",
>>             0x00, ResourceConsumer, , Exclusive,
>>             )
>>         I2cSerialBusV2 (0x0053, ControllerInitiated, 0x00061A80,
>>             AddressingMode7Bit, "\\_SB.PCI0.I2C2",
>>             0x00, ResourceConsumer, , Exclusive,
>>             )
>>     })
>>     Return (SBUF) /* \_SB_.PCI0.I2C2.CAMF._CRS.SBUF */
>> }
>>
>> How do we know which one's the VCM when there's more than just two like
>> that? Andy: don't suppose you can shed any light there?
> Seems to me that the order is defined by address and if software engineers are
> not (so) crazy, it shouldn't deviate from device to device.
>
> At least this is stated in the internal documentation.
>
> The order is
>
> 1. Sensor (single addr)
> 2. VCM (single addr)
> 3. EEPROM (addr per page)


Thank you! That's really helpful, much appreciated.

> Interestingly that your list have no VCM in the _CRS defined...
>
> Not sure how to distinguish that if it's not a typo and indeed the case.
> Sounds like DMI quirk :-( again (something like 3-bit flag to define
> which devices are present in the _CRS taking into account the ordering
> requirements).


There's a field in the SSDB buffer against the sensor's acpi device,
with values from 0-4. We found an enumeration online, so we think that
the VCM in the surface go is a DW9719.

