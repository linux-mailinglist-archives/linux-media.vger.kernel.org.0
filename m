Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F0FD427B58
	for <lists+linux-media@lfdr.de>; Sat,  9 Oct 2021 17:32:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234719AbhJIPeD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Oct 2021 11:34:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38539 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234682AbhJIPeB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 9 Oct 2021 11:34:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1633793524;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Vy5Z3QdUpfqORn2sjpoSvKPS9hNo2meUhZmX+X04/3o=;
        b=VeF7fBaazJ+2Lv2EQryXFnjZhbhM/imTJZVH23wYvbx5l5TXFuo7t8Iarg58lzUdEoq6De
        +zUqjuSzgyMtRiz68+ZjSqybdJO92p/jaK4C2w1aeqK7TRNHzzJxssQ6hUpS/UXlGL+Ujx
        0fcRo6wNC2SzJ/nKzkn96+Gmgp2OuuY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-Xk4qZH6fNeSL-3tbvxYpQA-1; Sat, 09 Oct 2021 11:32:02 -0400
X-MC-Unique: Xk4qZH6fNeSL-3tbvxYpQA-1
Received: by mail-ed1-f71.google.com with SMTP id r11-20020aa7cfcb000000b003d4fbd652b9so9772044edy.14
        for <linux-media@vger.kernel.org>; Sat, 09 Oct 2021 08:32:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Vy5Z3QdUpfqORn2sjpoSvKPS9hNo2meUhZmX+X04/3o=;
        b=PNYtgEaFuq0Hdz9c1AalELQiX0Rdtxq370Klxiom5j18wVA0D7TOIQj4DBDghchnaW
         3+c4UIswmIt0B94YkMjzTgdTLbM2zsVzcu6IqpDcbZOSvYMKeyUBDGMAxSBRNy5G9vhh
         SyKHwyZZrJxgR2w/Q4WwJUC24LPPZC7bcew/vT4x75lMbekJJkYx6smsj5t1vaD9CTa3
         TV3jyrSM3elCdAzdLVj0ND0+kHOOLcb73riFvmBZ5Pn//f44J/wbPMTcBk0ImnPsPYyR
         IUNY3iXmg23pX2pGs++V0Q1XpnyEDeLDCOiu1QLuU8VdZWFfKjLHVfSDuyyE1sb9bC01
         BTNA==
X-Gm-Message-State: AOAM533RfE806ljfazm1wBChnjoD/rnyMt7SkcTeD8BGZSePwsP2I86Y
        7XJMNAHET6ZRgBEjJdYE56cZd3+Cja2lfCMXe6a0XbaDzHQWoiUVEUqkk2U+L6CNPsq/MGnTrJH
        776ZFmpVQreIAbWhYdIyiBjk=
X-Received: by 2002:a17:906:b098:: with SMTP id x24mr12681584ejy.88.1633793521606;
        Sat, 09 Oct 2021 08:32:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyc0aq1v6Cen4pucn+xg+/nXUMviu2iQrLJ+UJsvQU04U/MylIKbJlM/0EapQnMuOm9DIR2Pw==
X-Received: by 2002:a17:906:b098:: with SMTP id x24mr12681565ejy.88.1633793521374;
        Sat, 09 Oct 2021 08:32:01 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id dj8sm1335992edb.53.2021.10.09.08.32.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Oct 2021 08:32:00 -0700 (PDT)
From:   Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 02/12] media: i2c: ov8865: Add an has_unmet_acpi_deps()
 check
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Len Brown <lenb@kernel.org>,
        linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20211008162121.6628-1-hdegoede@redhat.com>
 <20211008162121.6628-3-hdegoede@redhat.com>
 <YWCQ6/AMzP5Nfcyk@pendragon.ideasonboard.com>
 <39a85265-017e-f86d-619b-c1aa6a771a26@redhat.com>
 <YWCUv+gEnfWnpRS6@pendragon.ideasonboard.com>
Message-ID: <ca413a75-f1e5-e322-029f-bb15e4b190ce@redhat.com>
Date:   Sat, 9 Oct 2021 17:31:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YWCUv+gEnfWnpRS6@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 10/8/21 8:58 PM, Laurent Pinchart wrote:
> Hi Hans,
> 
> On Fri, Oct 08, 2021 at 08:48:18PM +0200, Hans de Goede wrote:
>> On 10/8/21 8:41 PM, Laurent Pinchart wrote:
>>> On Fri, Oct 08, 2021 at 06:21:11PM +0200, Hans de Goede wrote:
>>>> The clk and regulator frameworks expect clk/regulator consumer-devices
>>>> to have info about the consumed clks/regulators described in the device's
>>>> fw_node.
>>>>
>>>> To work around cases where this info is not present in the firmware tables,
>>>> which is often the case on x86/ACPI devices, both frameworks allow the
>>>> provider-driver to attach info about consumers to the clks/regulators
>>>> when registering these.
>>>>
>>>> This causes problems with the probe ordering of the ov8865 driver vs the
>>>> drivers for these clks/regulators. Since the lookups are only registered
>>>> when the provider-driver binds, trying to get these clks/regulators before
>>>> then results in a -ENOENT error for clks and a dummy regulator for regs.
>>>>
>>>> On ACPI/x86 where this is a problem, the ov8865 ACPI fw-nodes have a _DEP
>>>> dependency on the INT3472 ACPI fw-node which describes the hardware which
>>>> provides the clks/regulators.
>>>>
>>>> The drivers/platform/x86/intel/int3472/ code dealing with these ACPI
>>>> fw-nodes will call acpi_dev_clear_dependencies() to indicate that this
>>>> _DEP has been "met" when all the clks/regulators have been setup.
>>>>
>>>> Call the has_unmet_acpi_deps() helper to check for unmet _DEPs
>>>> and return -EPROBE_DEFER if this returns true, so that we wait for
>>>> the clk/regulator setup to be done before continuing with probing.
>>>>
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>> ---
>>>>  drivers/media/i2c/ov8865.c | 3 +++
>>>>  1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
>>>> index ce4e0ae2c4d3..fd18d1256f78 100644
>>>> --- a/drivers/media/i2c/ov8865.c
>>>> +++ b/drivers/media/i2c/ov8865.c
>>>> @@ -2978,6 +2978,9 @@ static int ov8865_probe(struct i2c_client *client)
>>>>  	unsigned int i;
>>>>  	int ret;
>>>>  
>>>> +	if (has_unmet_acpi_deps(dev))
>>>> +		return -EPROBE_DEFER;
>>>> +
>>>
>>> We've worked hard to avoid adding ACPI-specific code such as this in
>>> sensor drivers, as it would then spread like crazy, and also open the
>>> door to more ACPI-specific support. I don't want to open this pandora's
>>> box, I'd like to see this handled in another layer (the I2C core could
>>> be a condidate for instance, but bonus points if it can be handled in
>>> the ACPI subsystem itself).
>>
>> The problem is that we do NOT want this check for all i2c devices,
> 
> Any of these sensors can be used on non-ACPI-based platforms, or on
> ACPI-based platforms where integration has been done right. If it causes
> an issue to call this function on those platforms, then this driver
> won't work. If it causes no issue, why can't we call it in the I2C core
> (or somewhere else) ?

This call checks the ACPI-core's count which keep track of all 
dependencies listed in the _DEP method have been marked as
"ready/available" by the driver for the Linux-device for those
dependencies having called acpi_dev_clear_dependencies().

The ACPI core code could delay instantiating devices for ACPI described
devices based on this itself, but it is deliberately not doing this.

This is deliberately not done because the _DEP method
may point to pretty much any random ACPI object and Linux does
not necessarily have a driver for all ACPI objects the driver
points too, which would lead to the devices never getting instantiated.

>> so doing
>> it in any place other then the drivers means having some list of APCI-ids
>> to which to apply this someplace else. And then for every sensor driver
>> which needs this we need to update this list.
>>
>> This is wht I've chosen to just put this check directly in the sensor
>> drivers. It is only 2 lines, it is a no-op on kernels where ACPI
>> is not enabled (without need a #ifdef) and it is a no-op if the
>> sensor i2c-client is not instantiated through APCI even when ACPI
>> support is enabled in the kernel.
>>
>> I understand that you don't want a lot of ACPI specific code inside
>> the drivers, which is why I've come up with this fix which consists
>> of only 2 lines.  My previous attempts (which I never posted)
>> where much worse then this.
> 
> So we only need to take one more step to remove just two lines :-)
> 
> This is all caused by Intel messing up their ACPI design badly. It's too
> late to point and shame, it won't fix the problem, but I don't want this
> to spread through drivers, neither for just those two lines (there are
> dozens of sensors that would need the same treatment), nor for what the
> next steps would be when someone else will want to add ACPI-specific
> code and use this as a precedent. That's why we tried hard with Dan
> Scally to isolate all the necessary quirks in a single place instead of
> spreading them through drivers, which would have been easier to
> implement.

Ok, so I've come up with a way to deal with this in the ACPI code
which does not require sensor-driver code modifications.

What I've done is make the ACPI core honor _DEP dependencies for
a device (instead of mostly ignore them) when one of those _DEPs
is for a device with a HID of INT3472 (the camera PMIC / discrete
clk/regulator ACPI device/node). This way the ACPI core can make
this decision without it having to keep an ever growing list of
sensor HIDs for which it should honor _DEP-s.

I'm about to send out a v2 of this series with this change,
see patch 1 + 2 of the v2 series.

I hope that Rafael is ok with the ACPI changes in there,
we will see...

Regards,

Hans

