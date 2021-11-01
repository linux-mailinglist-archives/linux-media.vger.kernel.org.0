Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DC56441DAF
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 17:03:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232478AbhKAQFh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 12:05:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45131 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230517AbhKAQFh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Nov 2021 12:05:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635782583;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=gk5XNKCZbo3Tpz9vz86LjcecgJFzgf9KSoGYskL3Rr0=;
        b=CJC+eVSxVtZsYRujD3fVA0ENsXBToaw7hupXnzm5zJx78XdFkBWe0n2L0O7by6yHcl7I1h
        MrBMfYEcVysN72aQLU6VUSN08I8B7waEdBrwqU4wYjA6PTriA6vE2lu2ykjUYTsXoPv61/
        d9u9Mcj5hi4RICahRyam63FCrw2BRO0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-epkVXib6OGypcAQs2uv_3g-1; Mon, 01 Nov 2021 12:03:02 -0400
X-MC-Unique: epkVXib6OGypcAQs2uv_3g-1
Received: by mail-ed1-f69.google.com with SMTP id h16-20020a05640250d000b003dd8167857aso16039645edb.0
        for <linux-media@vger.kernel.org>; Mon, 01 Nov 2021 09:03:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to;
        bh=gk5XNKCZbo3Tpz9vz86LjcecgJFzgf9KSoGYskL3Rr0=;
        b=6EOEaDK3fNIvujbHBalagln8useb6h/Ruh1K6vAyx7mOYSeHcVg2Be+t2FGZutbWc3
         y3FCpQ+j1PaUxFyJiffcMjGyWFD8MyRvveYi36M0XlkszBVBM/nvdLCFAXSvvDdtr2+3
         jL5/7h1iTnA0z5xyBGlKmRPGjjTGmhVlpnN/rMOVKBI4L7kTL6BJ46tgz57TdRhJfIlu
         PFfOrmzrYgmFqcz1lvS53vwItvFwrYSQs/nDR3lOSAZhhBH207Xmlpxp43xFT9PHUh40
         Y5/9G2ebGFx0dw8tW/k1qV2heAWKZmBTD9Wl4fYRLN6JkIh69DeUV0iioiXIZbqtMhlW
         ozcA==
X-Gm-Message-State: AOAM531qAqSgdCx3PtzUolYS6DrbT1NYbB+90XD/hGbrAY3HYm7ReZDc
        V55sh3zIfcqWzXMQKH2al276tXPBcYjQnOk5CBNAzk+Udt2Oo+EkyTw3+Mjj4Y0yd0OqbzoUQJw
        423/woIk+pbukOt028orGMSU=
X-Received: by 2002:a17:907:6d28:: with SMTP id sa40mr11219016ejc.201.1635782580280;
        Mon, 01 Nov 2021 09:03:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzW6YgrfXBy489RO00ij8GcnwkDlBZ8Lwu1PsoTR+B2WB3pyGxJyVVLD4kgaEhf9zwWSt2Z9g==
X-Received: by 2002:a17:907:6d28:: with SMTP id sa40mr11218981ejc.201.1635782579960;
        Mon, 01 Nov 2021 09:02:59 -0700 (PDT)
Received: from [10.40.1.223] ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id k23sm9096302edv.22.2021.11.01.09.02.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Nov 2021 09:02:59 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------ydTyNLd1yw4W0z7J7a0zsqV0"
Message-ID: <418dc16a-2a03-7604-a8e2-31c5ddfcf436@redhat.com>
Date:   Mon, 1 Nov 2021 17:02:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Fwd: Surface Go VCM type (was: Need to pass
 acpi_enforce_resources=lax on the Surface Go (version1))
Content-Language: en-US
To:     Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kate Hsuan <hpa@redhat.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        libcamera-devel@lists.libcamera.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <e2312277-f967-7d3f-5ce9-fbb197d35fd6@gmail.com>
 <3b61bb2d-1136-cf35-ba7a-724da9642855@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <3b61bb2d-1136-cf35-ba7a-724da9642855@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a multi-part message in MIME format.
--------------ydTyNLd1yw4W0z7J7a0zsqV0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 10/29/21 13:50, Daniel Scally wrote:
> Hi all
> 
> 
> +CC linux-media and libcamera-devel, as it's probably a good time to
> broaden this out. Also Andy because I'm hoping you can help :) The
> background of the discussion is about how we identify and enumerate
> (correctly, I.E. with a type matching the vcm driver's i2c_device_id,
> and there are a few different vcm's in scope which seem encoded in the
> SSDB buffer) which VCM module is linked to a sensor in Intel's IPU3
> centric ACPI tables. The I2C address for the device is just a second
> I2cSerialBusV2 against the sensor's acpi device rather than a separate
> one, which is no awkward. We also need to get firmware created for the
> VCM such that the sensor will link to it via the lens-focus property.
> 
> On 28/10/2021 09:57, Hans de Goede wrote:
>> Hi,
>>
>> On 10/28/21 10:49, Laurent Pinchart wrote:
>>> Hi Hans,
>>>
>>> On Thu, Oct 28, 2021 at 09:51:08AM +0200, Hans de Goede wrote:
>>>> On 10/28/21 09:10, Daniel Scally wrote:
>>>>> On 27/10/2021 15:16, Hans de Goede wrote:
>>>>>> On 10/27/21 12:07, Daniel Scally wrote:
>>>>>>> On 26/10/2021 11:14, Hans de Goede wrote:
>>>>>>>>>> So yesterday I already sorta guessed it would be the DW9714 because of
>>>>>>>>>> the 0x0c address and I tried:
>>>>>>>>>>
>>>>>>>>>> i2ctransfer -y 2 w2@0x0c 0x00 0x00
>>>>>>>>>>
>>>>>>>>>> And the transfer fails, while according to the driver that is a valid
>>>>>>>>>> value. So maybe we are missing a regulator enable? Or its not a DW9714.
>>>>>>>>>>
>>>>>>>>>> Also "i2cdetect -y -r 2" does not see anything at address 0x0c (but some of
>>>>>>>>>> these VCMs seem to be write only...) it does OTOH see an unknown device at
>>>>>>>>>> address 0x21.
>>>>>>>>> Well, when debugging the necessary TPS68470 settings I used a poor man's
>>>>>>>>> i2ctransfer on Windows whilst the camera was running to read the values
>>>>>>>>> that were set for both the PMIC and the camera sensor. Using the same
>>>>>>>>> program I can connect to and read values from a device at 0x0c,
>>>>>>> Just as further testing I dumped the contents of the device at 0x0c,
>>>>>>> which comes back as
>>>>>>>
>>>>>>> f1 1 2 1 61 0 40 60
>>>>>>>
>>>>>>> Byte 0 is given in the driver you linked as the ID field and expected to
>>>>>>> be f1. The driver controls focus by writing to the 3rd and 4th byte
>>>>>>> (with the 4th being the LSB); the only value that seemed to fluctuate
>>>>>>> when running windows and moving my hand in front of the sensor was byte
>>>>>>> 4 and testing it out I wrote values into that byte and the focus
>>>>>>> changes. So the device at 0x0c is definitely the vcm and it sure looks
>>>>>>> like it's the DW9719
>>>>>>>
>>>>>>> The device at 0x21 is only available on Windows when the camera is
>>>>>>> running, I thought it was quite likely that one of the "spare"
>>>>>>> regulators from the TPS68470. One line is called VCM, and sure enough
>>>>>>> it's enabled whilst the world-facing camera is running. I switched to
>>>>>>> linux and started streaming the back camera, then enabled that voltage
>>>>>>> regulator via i2ctransfer:
>>>>>>>
>>>>>>> sudo i2ctransfer 2 w2@0x4d 0x3c 0x6d
>>>>>>>
>>>>>>> sudo i2ctransfer 2 w2@0x4d 0x44 0x01
>>>>>>>
>>>>>>> And now i2cdetect shows the device at 0x0c on bus 2 - so we need more
>>>>>>> jiggery pokey to map that VCM regulator to this new device (once we've
>>>>>>> gotten it enumerated...) and the driver needs to have a tweak to call
>>>>>>> regulator get and do a power on at some point.
>>>>>> Awesome, great job on figuring this out!
>>>>>>
>>>>>> As you know I can spend $dayjob time on this, so I'll take on the job
>>>>>> of creating the i2c-client and hooking up the regulator in some
>>>>>> upstreamable manner.
>>>>> Okedokey cool. I'd probably start at the cio2-bridge, if only because we
>>>>> already have the adev there and the SSDB buffer loaded, so should be
>>>>> easy enough to add an enum for the vcm_type and a call to
>>>>> i2c_acpi_new_device()...bit of a weird place for that though I guess.
>>>> Ah, I was actually thinking about doing this int he int3472 code for
>>>> a number of reasons:
>>>>
>>>> 1. We already have the regulator_init_data there and we will need to
>>>> expand it for this.
>>>>
>>>> 2. It is sorta the central place where we deal with all this glue-stuff
>>> I'm not too sure about that. The INT3472 model the "Intel camera PMIC"
>>> (I don't remember the exact wording, but that's more or less how the
>>> device is described in Windows, and it matches the intent we see in the
>>> DSDT).
>> I agree that the INT3472 models the PMIC, or whatever discrete bits
>> which offer similar functionality.
>>
>>> Given that we already have cio2-bridge, and that it hooks up the
>>> sensor to the CIO2, it seems to me that it would be a better central
>>> place.
>> Ok, I was sorta expecting you to want to keep glue code like this
>> out of drivers/media. But I guess that only applies to putting ACPI
>> specific stuff in sensor drivers; and since the cio2-bridge code is
>> already x86/ACPI specific you are fine with adding ACPI code there?
>>
>> I'm fine with putting the VCM i2c-client instantiation in the
>> cio2-bridge code, that may also make it easier to tie the 2 together
>> at the media-controller level.
> 
> 
> Having looked at this yesterday evening I'm more and more convinced it's
> necessary. I hacked it into the ov8865 driver in the interim (just by
> calling i2c_acpi_new_device() in probe) and then worked on that dw9719
> code you found [1] to turn it into an i2c driver (attached, though still
> needs a bit of work), which will successfully bind to the i2c client
> enumerated by that i2c_acpi_new_device() call. From there though it
> needs a way for the v4l2 subdev to be matched to the sensor's subdev.
> This can happen automatically by way of the lens-focus firmware property
> against the sensor - we currently build those in the cio2-bridge, so
> adding another software node for the VCM and creating a lens-focus
> property for the sensor's software_node with a pointer to the VCM's node
> seems like the best way to do that.

So besides prepping a v5 of my previous series, with update regulator
init-data for the VCM I've also been looking into this, attached are
the results.

Some notes from initial testing:

1. The driver you attached will only successful probe if I insmod
it while streaming video from the sensor. So I think we need another
regulator or the clk for just the VCM too, I will investigate this
later this week.

2. I need some help with all the fwnode link stuff (I'm not very familiar
with this). There seems to be a chicken and egg problem here though,
because the v4l2subdev for the VCM does not register because of async stuff
and if we add it to the "graph" then my idea to enumerate the VCMs
from the SSDB on the complete() callback won't work. But we can do this
on a per sensor basis instead from the cio2_notifier_bound() callback
instead I guess ?

Can someone give me some hints how the fwnode link code should look/work
and how I can get the async registering of the subdev for the VCM to
complete ?

Regards,

Hans




> 
> 
> To throw a spanner in the works though; I noticed this delightful _CRS
> for the OV9734 sensor of a  Surface Laptop 1 earlier:
> 
> 
> Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
> {
>     Name (SBUF, ResourceTemplate ()
>     {
>         I2cSerialBusV2 (0x0036, ControllerInitiated, 0x00061A80,
>             AddressingMode7Bit, "\\_SB.PCI0.I2C2",
>             0x00, ResourceConsumer, , Exclusive,
>             )
>         I2cSerialBusV2 (0x0050, ControllerInitiated, 0x00061A80,
>             AddressingMode7Bit, "\\_SB.PCI0.I2C2",
>             0x00, ResourceConsumer, , Exclusive,
>             )
>         I2cSerialBusV2 (0x0051, ControllerInitiated, 0x00061A80,
>             AddressingMode7Bit, "\\_SB.PCI0.I2C2",
>             0x00, ResourceConsumer, , Exclusive,
>             )
>         I2cSerialBusV2 (0x0052, ControllerInitiated, 0x00061A80,
>             AddressingMode7Bit, "\\_SB.PCI0.I2C2",
>             0x00, ResourceConsumer, , Exclusive,
>             )
>         I2cSerialBusV2 (0x0053, ControllerInitiated, 0x00061A80,
>             AddressingMode7Bit, "\\_SB.PCI0.I2C2",
>             0x00, ResourceConsumer, , Exclusive,
>             )
>     })
>     Return (SBUF) /* \_SB_.PCI0.I2C2.CAMF._CRS.SBUF */
> }

Hmm, we do have i2c_acpi_client_count(adev), so it is easy to use
that and just always use the last resource for the VCM. But that assumes
that is what is going on here and I have no idea.

Regards,

Hans
--------------ydTyNLd1yw4W0z7J7a0zsqV0
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-i2c-acpi-Change-first-param-of-i2c_acpi_new_device-t.patch"
Content-Disposition: attachment;
 filename*0="0001-i2c-acpi-Change-first-param-of-i2c_acpi_new_device-t.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSAwMjA3NWNhMzI0YTIwNzc0ZTQ0NjY2OTZmNTAxYTZlZDMyNjlhMDliIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQu
Y29tPgpEYXRlOiBNb24sIDEgTm92IDIwMjEgMTM6NTk6MjMgKzAxMDAKU3ViamVjdDogW1BB
VENIIG1lZGlhLXN0YWdpbmcgcmVncmVzc2lvbiBmaXggMS8zXSBpMmM6IGFjcGk6IENoYW5n
ZSBmaXJzdAogcGFyYW0gb2YgaTJjX2FjcGlfbmV3X2RldmljZSgpIHRvIGFuIGFjcGlfZGV2
aWNlICoKCkNoYW5nZSB0aGUgZmlyc3QgcGFyYW1ldGVyIG9mIGkyY19hY3BpX25ld19kZXZp
Y2UoKSBmcm9tCmEgc3RydWN0IGRldmljZSAqIHRvIGEgc3RydWN0IGFjcGlfZGV2aWNlICou
CgpUaGlzIGlzIG5lY2Vzc2FyeSBiZWNhdXNlIGluIHNvbWUgY2FzZXMgd2UgbWF5IG9ubHkg
aGF2ZSBhY2Nlc3MKdG8gdGhlIGZ3bm9kZSAvIGFjcGlfZGV2aWNlIGFuZCBub3QgdG8gdGhl
IG1hdGNoaW5nIHBoeXNpY2FsLW5vZGUKc3RydWN0IGRldmljZSAqLgoKU2lnbmVkLW9mZi1i
eTogSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2ky
Yy9pMmMtY29yZS1hY3BpLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDUg
KystLS0KIGRyaXZlcnMvaWlvL2FjY2VsL2JtYzE1MC1hY2NlbC1pMmMuYyAgICAgICAgICAg
ICAgICAgICAgICAgIHwgMiArLQogZHJpdmVycy9paW8vbGlnaHQvY20zMjE4MS5jICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICstCiBkcml2ZXJzL3BsYXRmb3JtL3N1
cmZhY2Uvc3VyZmFjZTNfcG93ZXIuYyAgICAgICAgICAgICAgICAgICB8IDIgKy0KIGRyaXZl
cnMvcGxhdGZvcm0veDg2L2kyYy1tdWx0aS1pbnN0YW50aWF0ZS5jICAgICAgICAgICAgICAg
IHwgMiArLQogLi4uL3BsYXRmb3JtL3g4Ni9pbnRlbC9pbnQzM2ZlL2ludGVsX2NodF9pbnQz
M2ZlX21pY3JvYi5jICAgfCAyICstCiAuLi4vcGxhdGZvcm0veDg2L2ludGVsL2ludDMzZmUv
aW50ZWxfY2h0X2ludDMzZmVfdHlwZWMuYyAgICB8IDYgKysrLS0tCiBpbmNsdWRlL2xpbnV4
L2kyYy5oICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDQgKyst
LQogOCBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9pMmMtY29yZS1hY3BpLmMgYi9kcml2ZXJzL2ky
Yy9pMmMtY29yZS1hY3BpLmMKaW5kZXggNzFlZWU1YmMxN2FiLi4zZWFlNmMyNjRiYjUgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvaTJjL2kyYy1jb3JlLWFjcGkuYworKysgYi9kcml2ZXJzL2ky
Yy9pMmMtY29yZS1hY3BpLmMKQEAgLTQ4MSw3ICs0ODEsNyBAQCBzdHJ1Y3Qgbm90aWZpZXJf
YmxvY2sgaTJjX2FjcGlfbm90aWZpZXIgPSB7CiAKIC8qKgogICogaTJjX2FjcGlfbmV3X2Rl
dmljZSAtIENyZWF0ZSBpMmMtY2xpZW50IGZvciB0aGUgTnRoIEkyY1NlcmlhbEJ1cyByZXNv
dXJjZQotICogQGRldjogICAgIERldmljZSBvd25pbmcgdGhlIEFDUEkgcmVzb3VyY2VzIHRv
IGdldCB0aGUgY2xpZW50IGZyb20KKyAqIEBhZGV2OiAgICBBQ1BJLWRldmljZSBvd25pbmcg
dGhlIEFDUEkgcmVzb3VyY2VzIHRvIGdldCB0aGUgY2xpZW50IGZyb20KICAqIEBpbmRleDog
ICBJbmRleCBvZiBBQ1BJIHJlc291cmNlIHRvIGdldAogICogQGluZm86ICAgIGRlc2NyaWJl
cyB0aGUgSTJDIGRldmljZTsgbm90ZSB0aGlzIGlzIG1vZGlmaWVkIChhZGRyIGdldHMgc2V0
KQogICogQ29udGV4dDogY2FuIHNsZWVwCkBAIC00OTcsMTAgKzQ5Nyw5IEBAIHN0cnVjdCBu
b3RpZmllcl9ibG9jayBpMmNfYWNwaV9ub3RpZmllciA9IHsKICAqIFJldHVybnMgYSBwb2lu
dGVyIHRvIHRoZSBuZXcgaTJjLWNsaWVudCwgb3IgZXJyb3IgcG9pbnRlciBpbiBjYXNlIG9m
IGZhaWx1cmUuCiAgKiBTcGVjaWZpY2FsbHksIC1FUFJPQkVfREVGRVIgaXMgcmV0dXJuZWQg
aWYgdGhlIGFkYXB0ZXIgaXMgbm90IGZvdW5kLgogICovCi1zdHJ1Y3QgaTJjX2NsaWVudCAq
aTJjX2FjcGlfbmV3X2RldmljZShzdHJ1Y3QgZGV2aWNlICpkZXYsIGludCBpbmRleCwKK3N0
cnVjdCBpMmNfY2xpZW50ICppMmNfYWNwaV9uZXdfZGV2aWNlKHN0cnVjdCBhY3BpX2Rldmlj
ZSAqYWRldiwgaW50IGluZGV4LAogCQkJCSAgICAgICBzdHJ1Y3QgaTJjX2JvYXJkX2luZm8g
KmluZm8pCiB7Ci0Jc3RydWN0IGFjcGlfZGV2aWNlICphZGV2ID0gQUNQSV9DT01QQU5JT04o
ZGV2KTsKIAlzdHJ1Y3QgaTJjX2FjcGlfbG9va3VwIGxvb2t1cDsKIAlzdHJ1Y3QgaTJjX2Fk
YXB0ZXIgKmFkYXB0ZXI7CiAJTElTVF9IRUFEKHJlc291cmNlX2xpc3QpOwpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9paW8vYWNjZWwvYm1jMTUwLWFjY2VsLWkyYy5jIGIvZHJpdmVycy9paW8v
YWNjZWwvYm1jMTUwLWFjY2VsLWkyYy5jCmluZGV4IDg4YmQ4YTI1ZjE0Mi4uYzk1N2YzMWFm
ZWY1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2lpby9hY2NlbC9ibWMxNTAtYWNjZWwtaTJjLmMK
KysrIGIvZHJpdmVycy9paW8vYWNjZWwvYm1jMTUwLWFjY2VsLWkyYy5jCkBAIC0xNDksNyAr
MTQ5LDcgQEAgc3RhdGljIHZvaWQgYm1jMTUwX2FjcGlfZHVhbF9hY2NlbF9wcm9iZShzdHJ1
Y3QgaTJjX2NsaWVudCAqY2xpZW50KQogCiAJYm9hcmRfaW5mby5pcnEgPSBhY3BpX2Rldl9n
cGlvX2lycV9nZXQoYWRldiwgMSk7CiAKLQlkYXRhLT5zZWNvbmRfZGV2aWNlID0gaTJjX2Fj
cGlfbmV3X2RldmljZSgmY2xpZW50LT5kZXYsIDEsICZib2FyZF9pbmZvKTsKKwlkYXRhLT5z
ZWNvbmRfZGV2aWNlID0gaTJjX2FjcGlfbmV3X2RldmljZShhZGV2LCAxLCAmYm9hcmRfaW5m
byk7CiAKIAlpZiAoIUlTX0VSUihkYXRhLT5zZWNvbmRfZGV2aWNlKSAmJiBibWMxNTBfYWNw
aV9lbmFibGVfa2V5Ym9hcmQoZGF0YS0+c2Vjb25kX2RldmljZSkpIHsKIAkJSU5JVF9ERUxB
WUVEX1dPUksoJmRhdGEtPnJlc3VtZV93b3JrLCBibWMxNTBfYWNwaV9yZXN1bWVfd29yayk7
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2lpby9saWdodC9jbTMyMTgxLmMgYi9kcml2ZXJzL2lp
by9saWdodC9jbTMyMTgxLmMKaW5kZXggOTc2NDk5NDRmMWRmLi45YWNmZjZmNTBkYjIgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvaWlvL2xpZ2h0L2NtMzIxODEuYworKysgYi9kcml2ZXJzL2lp
by9saWdodC9jbTMyMTgxLmMKQEAgLTQ1NSw3ICs0NTUsNyBAQCBzdGF0aWMgaW50IGNtMzIx
ODFfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCkKIAogCQlpMmNfc21idXNfcmVh
ZF9ieXRlKGNsaWVudCk7CiAKLQkJY2xpZW50ID0gaTJjX2FjcGlfbmV3X2RldmljZShkZXYs
IDEsICZib2FyZF9pbmZvKTsKKwkJY2xpZW50ID0gaTJjX2FjcGlfbmV3X2RldmljZShBQ1BJ
X0NPTVBBTklPTihkZXYpLCAxLCAmYm9hcmRfaW5mbyk7CiAJCWlmIChJU19FUlIoY2xpZW50
KSkKIAkJCXJldHVybiBQVFJfRVJSKGNsaWVudCk7CiAJfQpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9wbGF0Zm9ybS9zdXJmYWNlL3N1cmZhY2UzX3Bvd2VyLmMgYi9kcml2ZXJzL3BsYXRmb3Jt
L3N1cmZhY2Uvc3VyZmFjZTNfcG93ZXIuYwppbmRleCBhYmFjM2VlYzU2NWUuLjNjODljNjky
NmNjMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9wbGF0Zm9ybS9zdXJmYWNlL3N1cmZhY2UzX3Bv
d2VyLmMKKysrIGIvZHJpdmVycy9wbGF0Zm9ybS9zdXJmYWNlL3N1cmZhY2UzX3Bvd2VyLmMK
QEAgLTUxNCw3ICs1MTQsNyBAQCBzdGF0aWMgaW50IG1zaHcwMDExX3Byb2JlKHN0cnVjdCBp
MmNfY2xpZW50ICpjbGllbnQpCiAJbWVtc2V0KCZib2FyZF9pbmZvLCAwLCBzaXplb2YoYm9h
cmRfaW5mbykpOwogCXN0cmxjcHkoYm9hcmRfaW5mby50eXBlLCAiTVNIVzAwMTEtYmF0MCIs
IEkyQ19OQU1FX1NJWkUpOwogCi0JYmF0MCA9IGkyY19hY3BpX25ld19kZXZpY2UoZGV2LCAx
LCAmYm9hcmRfaW5mbyk7CisJYmF0MCA9IGkyY19hY3BpX25ld19kZXZpY2UoQUNQSV9DT01Q
QU5JT04oZGV2KSwgMSwgJmJvYXJkX2luZm8pOwogCWlmIChJU19FUlIoYmF0MCkpCiAJCXJl
dHVybiBQVFJfRVJSKGJhdDApOwogCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BsYXRmb3JtL3g4
Ni9pMmMtbXVsdGktaW5zdGFudGlhdGUuYyBiL2RyaXZlcnMvcGxhdGZvcm0veDg2L2kyYy1t
dWx0aS1pbnN0YW50aWF0ZS5jCmluZGV4IGE1MDE1M2VjZDU2MC4uMmRlNTk1NWVjMDg0IDEw
MDY0NAotLS0gYS9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9pMmMtbXVsdGktaW5zdGFudGlhdGUu
YworKysgYi9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9pMmMtbXVsdGktaW5zdGFudGlhdGUuYwpA
QCAtOTAsNyArOTAsNyBAQCBzdGF0aWMgaW50IGkyY19tdWx0aV9pbnN0X3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJCQlib2FyZF9pbmZvLmlycSA9IDA7CiAJCQli
cmVhazsKIAkJfQotCQltdWx0aS0+Y2xpZW50c1tpXSA9IGkyY19hY3BpX25ld19kZXZpY2Uo
ZGV2LCBpLCAmYm9hcmRfaW5mbyk7CisJCW11bHRpLT5jbGllbnRzW2ldID0gaTJjX2FjcGlf
bmV3X2RldmljZShhZGV2LCBpLCAmYm9hcmRfaW5mbyk7CiAJCWlmIChJU19FUlIobXVsdGkt
PmNsaWVudHNbaV0pKSB7CiAJCQlyZXQgPSBkZXZfZXJyX3Byb2JlKGRldiwgUFRSX0VSUiht
dWx0aS0+Y2xpZW50c1tpXSksCiAJCQkJCSAgICAiRXJyb3IgY3JlYXRpbmcgaTJjLWNsaWVu
dCwgaWR4ICVkXG4iLCBpKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGxhdGZvcm0veDg2L2lu
dGVsL2ludDMzZmUvaW50ZWxfY2h0X2ludDMzZmVfbWljcm9iLmMgYi9kcml2ZXJzL3BsYXRm
b3JtL3g4Ni9pbnRlbC9pbnQzM2ZlL2ludGVsX2NodF9pbnQzM2ZlX21pY3JvYi5jCmluZGV4
IDY3M2Y0MWNkMTRiNS4uMjljNjYxYzcwZjFjIDEwMDY0NAotLS0gYS9kcml2ZXJzL3BsYXRm
b3JtL3g4Ni9pbnRlbC9pbnQzM2ZlL2ludGVsX2NodF9pbnQzM2ZlX21pY3JvYi5jCisrKyBi
L2RyaXZlcnMvcGxhdGZvcm0veDg2L2ludGVsL2ludDMzZmUvaW50ZWxfY2h0X2ludDMzZmVf
bWljcm9iLmMKQEAgLTQ4LDcgKzQ4LDcgQEAgaW50IGNodF9pbnQzM2ZlX21pY3JvYl9wcm9i
ZShzdHJ1Y3QgY2h0X2ludDMzZmVfZGF0YSAqZGF0YSkKIAlzdHJzY3B5KGJvYXJkX2luZm8u
dHlwZSwgImJxMjc1NDIiLCBBUlJBWV9TSVpFKGJvYXJkX2luZm8udHlwZSkpOwogCWJvYXJk
X2luZm8uZGV2X25hbWUgPSAiYnEyNzU0MiI7CiAJYm9hcmRfaW5mby5zd25vZGUgPSAmYnEy
N3h4eF9ub2RlOwotCWRhdGEtPmJhdHRlcnlfZmcgPSBpMmNfYWNwaV9uZXdfZGV2aWNlKGRl
diwgMSwgJmJvYXJkX2luZm8pOworCWRhdGEtPmJhdHRlcnlfZmcgPSBpMmNfYWNwaV9uZXdf
ZGV2aWNlKEFDUElfQ09NUEFOSU9OKGRldiksIDEsICZib2FyZF9pbmZvKTsKIAogCXJldHVy
biBQVFJfRVJSX09SX1pFUk8oZGF0YS0+YmF0dGVyeV9mZyk7CiB9CmRpZmYgLS1naXQgYS9k
cml2ZXJzL3BsYXRmb3JtL3g4Ni9pbnRlbC9pbnQzM2ZlL2ludGVsX2NodF9pbnQzM2ZlX3R5
cGVjLmMgYi9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9pbnRlbC9pbnQzM2ZlL2ludGVsX2NodF9p
bnQzM2ZlX3R5cGVjLmMKaW5kZXggZDU5NTQ0MTY3NDMwLi40ZDlkNTliYTFmMWUgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvcGxhdGZvcm0veDg2L2ludGVsL2ludDMzZmUvaW50ZWxfY2h0X2lu
dDMzZmVfdHlwZWMuYworKysgYi9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9pbnRlbC9pbnQzM2Zl
L2ludGVsX2NodF9pbnQzM2ZlX3R5cGVjLmMKQEAgLTI2Nyw3ICsyNjcsNyBAQCBjaHRfaW50
MzNmZV9yZWdpc3Rlcl9tYXgxNzA0NyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBjaHRf
aW50MzNmZV9kYXRhICpkYXRhKQogCXN0cmxjcHkoYm9hcmRfaW5mby50eXBlLCAibWF4MTcw
NDciLCBJMkNfTkFNRV9TSVpFKTsKIAlib2FyZF9pbmZvLmRldl9uYW1lID0gIm1heDE3MDQ3
IjsKIAlib2FyZF9pbmZvLmZ3bm9kZSA9IGZ3bm9kZTsKLQlkYXRhLT5iYXR0ZXJ5X2ZnID0g
aTJjX2FjcGlfbmV3X2RldmljZShkZXYsIDEsICZib2FyZF9pbmZvKTsKKwlkYXRhLT5iYXR0
ZXJ5X2ZnID0gaTJjX2FjcGlfbmV3X2RldmljZShBQ1BJX0NPTVBBTklPTihkZXYpLCAxLCAm
Ym9hcmRfaW5mbyk7CiAKIAlyZXR1cm4gUFRSX0VSUl9PUl9aRVJPKGRhdGEtPmJhdHRlcnlf
ZmcpOwogfQpAQCAtMzMxLDcgKzMzMSw3IEBAIGludCBjaHRfaW50MzNmZV90eXBlY19wcm9i
ZShzdHJ1Y3QgY2h0X2ludDMzZmVfZGF0YSAqZGF0YSkKIAlib2FyZF9pbmZvLmZ3bm9kZSA9
IGZ3bm9kZTsKIAlib2FyZF9pbmZvLmlycSA9IGZ1c2IzMDJfaXJxOwogCi0JZGF0YS0+ZnVz
YjMwMiA9IGkyY19hY3BpX25ld19kZXZpY2UoZGV2LCAyLCAmYm9hcmRfaW5mbyk7CisJZGF0
YS0+ZnVzYjMwMiA9IGkyY19hY3BpX25ld19kZXZpY2UoQUNQSV9DT01QQU5JT04oZGV2KSwg
MiwgJmJvYXJkX2luZm8pOwogCWlmIChJU19FUlIoZGF0YS0+ZnVzYjMwMikpIHsKIAkJcmV0
ID0gUFRSX0VSUihkYXRhLT5mdXNiMzAyKTsKIAkJZ290byBvdXRfdW5yZWdpc3Rlcl9tYXgx
NzA0NzsKQEAgLTM0OCw3ICszNDgsNyBAQCBpbnQgY2h0X2ludDMzZmVfdHlwZWNfcHJvYmUo
c3RydWN0IGNodF9pbnQzM2ZlX2RhdGEgKmRhdGEpCiAJYm9hcmRfaW5mby5md25vZGUgPSBm
d25vZGU7CiAJc3RybGNweShib2FyZF9pbmZvLnR5cGUsICJwaTN1c2IzMDUzMiIsIEkyQ19O
QU1FX1NJWkUpOwogCi0JZGF0YS0+cGkzdXNiMzA1MzIgPSBpMmNfYWNwaV9uZXdfZGV2aWNl
KGRldiwgMywgJmJvYXJkX2luZm8pOworCWRhdGEtPnBpM3VzYjMwNTMyID0gaTJjX2FjcGlf
bmV3X2RldmljZShBQ1BJX0NPTVBBTklPTihkZXYpLCAzLCAmYm9hcmRfaW5mbyk7CiAJaWYg
KElTX0VSUihkYXRhLT5waTN1c2IzMDUzMikpIHsKIAkJcmV0ID0gUFRSX0VSUihkYXRhLT5w
aTN1c2IzMDUzMik7CiAJCWdvdG8gb3V0X3VucmVnaXN0ZXJfZnVzYjMwMjsKZGlmZiAtLWdp
dCBhL2luY2x1ZGUvbGludXgvaTJjLmggYi9pbmNsdWRlL2xpbnV4L2kyYy5oCmluZGV4IDJj
ZTNlZmJlOTE5OC4uYzExZTVmZGUwYmI3IDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2ky
Yy5oCisrKyBiL2luY2x1ZGUvbGludXgvaTJjLmgKQEAgLTEwMTIsNyArMTAxMiw3IEBAIGJv
b2wgaTJjX2FjcGlfZ2V0X2kyY19yZXNvdXJjZShzdHJ1Y3QgYWNwaV9yZXNvdXJjZSAqYXJl
cywKIAkJCSAgICAgICBzdHJ1Y3QgYWNwaV9yZXNvdXJjZV9pMmNfc2VyaWFsYnVzICoqaTJj
KTsKIGludCBpMmNfYWNwaV9jbGllbnRfY291bnQoc3RydWN0IGFjcGlfZGV2aWNlICphZGV2
KTsKIHUzMiBpMmNfYWNwaV9maW5kX2J1c19zcGVlZChzdHJ1Y3QgZGV2aWNlICpkZXYpOwot
c3RydWN0IGkyY19jbGllbnQgKmkyY19hY3BpX25ld19kZXZpY2Uoc3RydWN0IGRldmljZSAq
ZGV2LCBpbnQgaW5kZXgsCitzdHJ1Y3QgaTJjX2NsaWVudCAqaTJjX2FjcGlfbmV3X2Rldmlj
ZShzdHJ1Y3QgYWNwaV9kZXZpY2UgKmFkZXYsIGludCBpbmRleCwKIAkJCQkgICAgICAgc3Ry
dWN0IGkyY19ib2FyZF9pbmZvICppbmZvKTsKIHN0cnVjdCBpMmNfYWRhcHRlciAqaTJjX2Fj
cGlfZmluZF9hZGFwdGVyX2J5X2hhbmRsZShhY3BpX2hhbmRsZSBoYW5kbGUpOwogI2Vsc2UK
QEAgLTEwMjksNyArMTAyOSw3IEBAIHN0YXRpYyBpbmxpbmUgdTMyIGkyY19hY3BpX2ZpbmRf
YnVzX3NwZWVkKHN0cnVjdCBkZXZpY2UgKmRldikKIHsKIAlyZXR1cm4gMDsKIH0KLXN0YXRp
YyBpbmxpbmUgc3RydWN0IGkyY19jbGllbnQgKmkyY19hY3BpX25ld19kZXZpY2Uoc3RydWN0
IGRldmljZSAqZGV2LAorc3RhdGljIGlubGluZSBzdHJ1Y3QgaTJjX2NsaWVudCAqaTJjX2Fj
cGlfbmV3X2RldmljZShzdHJ1Y3QgYWNwaV9kZXZpY2UgKmFkZXYsCiAJCQkJCWludCBpbmRl
eCwgc3RydWN0IGkyY19ib2FyZF9pbmZvICppbmZvKQogewogCXJldHVybiBFUlJfUFRSKC1F
Tk9ERVYpOwotLSAKMi4zMS4xCgo=
--------------ydTyNLd1yw4W0z7J7a0zsqV0
Content-Type: text/x-patch; charset=UTF-8;
 name="0002-media-ipu3-cio2-Store-cio2_bridge-pointer-in-struct-.patch"
Content-Disposition: attachment;
 filename*0="0002-media-ipu3-cio2-Store-cio2_bridge-pointer-in-struct-.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBkOWIzM2FmNzg3NWRkMzc1MzNjN2JkYWE0ZjliZjkzYjA2YjhlMDQxIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQu
Y29tPgpEYXRlOiBNb24sIDEgTm92IDIwMjEgMTY6MTg6MDggKzAxMDAKU3ViamVjdDogW1BB
VENIIG1lZGlhLXN0YWdpbmcgcmVncmVzc2lvbiBmaXggMi8zXSBtZWRpYTogaXB1My1jaW8y
OiBTdG9yZQogY2lvMl9icmlkZ2UgcG9pbnRlciBpbiBzdHJ1Y3QgY2lvMl9kZXZpY2UKClRo
aXMgaXMgYSBwcmVwYXJhdGlvbiBwYXRjaCBmb3IgYWRkaW5nIHN1cHBvcnQgZm9yIGluc3Rh
bnRpYXRpbmcKaTJjLWNsaWVudHMgZm9yIFZDTXMgZGVzY3JpYmVkIGluIFNTREIgQUNQSSB0
YWJsZXMuCgpTaWduZWQtb2ZmLWJ5OiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQu
Y29tPgotLS0KTm90ZSB0aGVyZSBzZWVtcyB0byBiZSBhIHByZS1leGlzdGluZyBwcm9ibGVt
IHdoZXJlIHRoZXJlIGlzIG5vIHRlYXJkb3duCm9mIHRoZSBicmlkZ2U/IEl0IGxvb2tzIGxp
a2Ugd2UgbmVlZCBhIGNpbzJfYnJpZGdlX2NsZWFudXAoKSBmdW5jdGlvbiwKdG8gYmUgY2Fs
bGVkIGZyb20gY2lvMl9wY2lfcmVtb3ZlKCkgPwotLS0KIGRyaXZlcnMvbWVkaWEvcGNpL2lu
dGVsL2lwdTMvY2lvMi1icmlkZ2UuYyAgICB8IDggKysrKy0tLS0KIGRyaXZlcnMvbWVkaWEv
cGNpL2ludGVsL2lwdTMvaXB1My1jaW8yLW1haW4uYyB8IDYgKysrLS0tCiBkcml2ZXJzL21l
ZGlhL3BjaS9pbnRlbC9pcHUzL2lwdTMtY2lvMi5oICAgICAgfCA5ICsrKysrKystLQogMyBm
aWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbWVkaWEvcGNpL2ludGVsL2lwdTMvY2lvMi1icmlkZ2UuYyBiL2Ry
aXZlcnMvbWVkaWEvcGNpL2ludGVsL2lwdTMvY2lvMi1icmlkZ2UuYwppbmRleCAwYzFjNWQ4
ZDhkZmQuLmQ1ZTE3ZjZmMjdjZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9tZWRpYS9wY2kvaW50
ZWwvaXB1My9jaW8yLWJyaWRnZS5jCisrKyBiL2RyaXZlcnMvbWVkaWEvcGNpL2ludGVsL2lw
dTMvY2lvMi1icmlkZ2UuYwpAQCAtMzA2LDcgKzMwNiw3IEBAIHN0YXRpYyBpbnQgY2lvMl9i
cmlkZ2VfY29ubmVjdF9zZW5zb3JzKHN0cnVjdCBjaW8yX2JyaWRnZSAqYnJpZGdlLAogCXJl
dHVybiByZXQ7CiB9CiAKLWludCBjaW8yX2JyaWRnZV9pbml0KHN0cnVjdCBwY2lfZGV2ICpj
aW8yKQorc3RydWN0IGNpbzJfYnJpZGdlICpjaW8yX2JyaWRnZV9pbml0KHN0cnVjdCBwY2lf
ZGV2ICpjaW8yKQogewogCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZjaW8yLT5kZXY7CiAJc3Ry
dWN0IGZ3bm9kZV9oYW5kbGUgKmZ3bm9kZTsKQEAgLTMxNiw3ICszMTYsNyBAQCBpbnQgY2lv
Ml9icmlkZ2VfaW5pdChzdHJ1Y3QgcGNpX2RldiAqY2lvMikKIAogCWJyaWRnZSA9IGt6YWxs
b2Moc2l6ZW9mKCpicmlkZ2UpLCBHRlBfS0VSTkVMKTsKIAlpZiAoIWJyaWRnZSkKLQkJcmV0
dXJuIC1FTk9NRU07CisJCXJldHVybiBFUlJfUFRSKC1FTk9NRU0pOwogCiAJc3Ryc2NweShi
cmlkZ2UtPmNpbzJfbm9kZV9uYW1lLCBDSU8yX0hJRCwKIAkJc2l6ZW9mKGJyaWRnZS0+Y2lv
Ml9ub2RlX25hbWUpKTsKQEAgLTM1Myw3ICszNTMsNyBAQCBpbnQgY2lvMl9icmlkZ2VfaW5p
dChzdHJ1Y3QgcGNpX2RldiAqY2lvMikKIAogCXNldF9zZWNvbmRhcnlfZndub2RlKGRldiwg
Zndub2RlKTsKIAotCXJldHVybiAwOworCXJldHVybiBicmlkZ2U7CiAKIGVycl91bnJlZ2lz
dGVyX3NlbnNvcnM6CiAJY2lvMl9icmlkZ2VfdW5yZWdpc3Rlcl9zZW5zb3JzKGJyaWRnZSk7
CkBAIC0zNjIsNSArMzYyLDUgQEAgaW50IGNpbzJfYnJpZGdlX2luaXQoc3RydWN0IHBjaV9k
ZXYgKmNpbzIpCiBlcnJfZnJlZV9icmlkZ2U6CiAJa2ZyZWUoYnJpZGdlKTsKIAotCXJldHVy
biByZXQ7CisJcmV0dXJuIEVSUl9QVFIocmV0KTsKIH0KZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bWVkaWEvcGNpL2ludGVsL2lwdTMvaXB1My1jaW8yLW1haW4uYyBiL2RyaXZlcnMvbWVkaWEv
cGNpL2ludGVsL2lwdTMvaXB1My1jaW8yLW1haW4uYwppbmRleCA3NmZkNGU2ZThlNDYuLjUy
MDlmODNjODI0OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9tZWRpYS9wY2kvaW50ZWwvaXB1My9p
cHUzLWNpbzItbWFpbi5jCisrKyBiL2RyaXZlcnMvbWVkaWEvcGNpL2ludGVsL2lwdTMvaXB1
My1jaW8yLW1haW4uYwpAQCAtMTczMCw5ICsxNzMwLDkgQEAgc3RhdGljIGludCBjaW8yX3Bj
aV9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGNpX2RldiwKIAkJCXJldHVybiAtRUlOVkFMOwog
CQl9CiAKLQkJciA9IGNpbzJfYnJpZGdlX2luaXQocGNpX2Rldik7Ci0JCWlmIChyKQotCQkJ
cmV0dXJuIHI7CisJCWNpbzItPmJyaWRnZSA9IGNpbzJfYnJpZGdlX2luaXQocGNpX2Rldik7
CisJCWlmIChJU19FUlIoY2lvMi0+YnJpZGdlKSkKKwkJCXJldHVybiBQVFJfRVJSKGNpbzIt
PmJyaWRnZSk7CiAJfQogCiAJciA9IHBjaW1fZW5hYmxlX2RldmljZShwY2lfZGV2KTsKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGNpL2ludGVsL2lwdTMvaXB1My1jaW8yLmggYi9k
cml2ZXJzL21lZGlhL3BjaS9pbnRlbC9pcHUzL2lwdTMtY2lvMi5oCmluZGV4IDNhMWYzOTRl
MDVhYS4uNjRkN2NhNTAyMTI0IDEwMDY0NAotLS0gYS9kcml2ZXJzL21lZGlhL3BjaS9pbnRl
bC9pcHUzL2lwdTMtY2lvMi5oCisrKyBiL2RyaXZlcnMvbWVkaWEvcGNpL2ludGVsL2lwdTMv
aXB1My1jaW8yLmgKQEAgLTIyLDYgKzIyLDcgQEAKICNpbmNsdWRlIDxtZWRpYS92aWRlb2J1
ZjItdjRsMi5oPgogCiBzdHJ1Y3QgY2lvMl9mYnB0X2VudHJ5OwkJLyogZGVmaW5lZCBoZXJl
LCBhZnRlciB0aGUgZmlyc3QgdXNhZ2UgKi8KK3N0cnVjdCBjaW8yX2JyaWRnZTsKIHN0cnVj
dCBwY2lfZGV2OwogCiAjZGVmaW5lIENJTzJfTkFNRQkJCQkJImlwdTMtY2lvMiIKQEAgLTM4
MSw2ICszODIsNyBAQCBzdHJ1Y3QgY2lvMl9kZXZpY2UgewogCXN0cnVjdCB2NGwyX2Rldmlj
ZSB2NGwyX2RldjsKIAlzdHJ1Y3QgY2lvMl9xdWV1ZSBxdWV1ZVtDSU8yX1FVRVVFU107CiAJ
c3RydWN0IGNpbzJfcXVldWUgKmN1cl9xdWV1ZTsKKwlzdHJ1Y3QgY2lvMl9icmlkZ2UgKmJy
aWRnZTsKIAkvKiBtdXRleCB0byBiZSB1c2VkIGJ5IHZpZGVvX2RldmljZSAqLwogCXN0cnVj
dCBtdXRleCBsb2NrOwogCkBAIC00NjAsOSArNDYyLDEyIEBAIHN0YXRpYyBpbmxpbmUgc3Ry
dWN0IGNpbzJfcXVldWUgKnZiMnFfdG9fY2lvMl9xdWV1ZShzdHJ1Y3QgdmIyX3F1ZXVlICp2
cSkKIH0KIAogI2lmIElTX0VOQUJMRUQoQ09ORklHX0NJTzJfQlJJREdFKQotaW50IGNpbzJf
YnJpZGdlX2luaXQoc3RydWN0IHBjaV9kZXYgKmNpbzIpOworc3RydWN0IGNpbzJfYnJpZGdl
ICpjaW8yX2JyaWRnZV9pbml0KHN0cnVjdCBwY2lfZGV2ICpjaW8yKTsKICNlbHNlCi1zdGF0
aWMgaW5saW5lIGludCBjaW8yX2JyaWRnZV9pbml0KHN0cnVjdCBwY2lfZGV2ICpjaW8yKSB7
IHJldHVybiAwOyB9CitzdGF0aWMgaW5saW5lIHN0cnVjdCBjaW8yX2JyaWRnZSAqY2lvMl9i
cmlkZ2VfaW5pdChzdHJ1Y3QgcGNpX2RldiAqY2lvMikKK3sKKwlyZXR1cm4gTlVMTDsKK30K
ICNlbmRpZgogCiAjZW5kaWYKLS0gCjIuMzEuMQoK
--------------ydTyNLd1yw4W0z7J7a0zsqV0
Content-Type: text/x-patch; charset=UTF-8;
 name="0003-media-ipu3-cio2-Add-support-for-instantiating-i2c-cl.patch"
Content-Disposition: attachment;
 filename*0="0003-media-ipu3-cio2-Add-support-for-instantiating-i2c-cl.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBkMDQzYzdjMWRkNDMxNDRkNDgyNWM3NzgxNzgzMDk5ZDQ0OTRiNzk4IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQu
Y29tPgpEYXRlOiBNb24sIDEgTm92IDIwMjEgMTM6Mzc6MzAgKzAxMDAKU3ViamVjdDogW1BB
VENIIG1lZGlhLXN0YWdpbmcgcmVncmVzc2lvbiBmaXggMy8zXSBtZWRpYTogaXB1My1jaW8y
OiBBZGQKIHN1cHBvcnQgZm9yIGluc3RhbnRpYXRpbmcgaTJjLWNsaWVudCBmb3IgVkNNcwoK
U29tZSBzZW5zb3JzIGNvbWUgd2l0aCBhIHZhcmlhYmxlLWZvY3VzIGxlbnMgd2hlcmUgdGhl
IGxlbnMgZm9jdXMgaXMKY29udHJvbGxlciBieSBhIFZDTSAoVm9pY2UgQ29pbCBNb3Rvciku
IElmIHRoZXJlIGlzIGEgVkNNIGZvciB0aGUKbGVucy1mb2N1cywgYW5kIGlmIHNvIHdoaWNo
IG9uZSwgaXMgZGVzY3JpYmVkIG9uIHRoZSB2Y21fdHlwZSBmaWVsZApvZiB0aGUgQUNQSSBT
U0RCIHRhYmxlLgoKVGhlc2UgVkNNcyBhcmUgYSBzZWNvbmQgSTJDIGRldmljZSBsaXN0ZWQg
YXMgYW4gZXh0cmEgSTJjU2VyaWFsQnVzVjIKcmVzb3VyY2UgaW4gdGhlIHNhbWUgQUNQSSBk
ZXZpY2UgYXMgdGhlIHNlbnNvci4gVGhlIGkyYy1jb3JlLWFjcGkuYwpjb2RlIG9ubHkgaW5z
dGFudGlhdGVzIGFuIGkyYy1jbGllbnQgZm9yIHRoZSBmaXJzdCBJMmNTZXJpYWxCdXNWMgpy
ZXNvdXJjZS4KCkFkZCBzdXBwb3J0IGZvciBpbnN0YW50aWF0aW5nIGFuIGkyYy1jbGllbnQg
Zm9yIHRoZSBWQ00gd2l0aAp0aGUgdHlwZSBvZiB0aGUgaTJjLWNsaWVudCBzZXQgYmFzZWQg
b24gdGhlIFNTREIgdmNtX3R5cGUgZmllbGQuCgpTaWduZWQtb2ZmLWJ5OiBIYW5zIGRlIEdv
ZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPgotLS0KIGRyaXZlcnMvbWVkaWEvcGNpL2ludGVs
L2lwdTMvY2lvMi1icmlkZ2UuYyAgICB8IDUyICsrKysrKysrKysrKysrKysrKysKIGRyaXZl
cnMvbWVkaWEvcGNpL2ludGVsL2lwdTMvY2lvMi1icmlkZ2UuaCAgICB8ICAzICsrCiBkcml2
ZXJzL21lZGlhL3BjaS9pbnRlbC9pcHUzL2lwdTMtY2lvMi1tYWluLmMgfCAxMSArKysrCiBk
cml2ZXJzL21lZGlhL3BjaS9pbnRlbC9pcHUzL2lwdTMtY2lvMi5oICAgICAgfCAgMiArCiA0
IGZpbGVzIGNoYW5nZWQsIDY4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L21lZGlhL3BjaS9pbnRlbC9pcHUzL2NpbzItYnJpZGdlLmMgYi9kcml2ZXJzL21lZGlhL3Bj
aS9pbnRlbC9pcHUzL2NpbzItYnJpZGdlLmMKaW5kZXggZDVlMTdmNmYyN2NmLi5kMzkzMDI0
YzdmNTggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbWVkaWEvcGNpL2ludGVsL2lwdTMvY2lvMi1i
cmlkZ2UuYworKysgYi9kcml2ZXJzL21lZGlhL3BjaS9pbnRlbC9pcHUzL2NpbzItYnJpZGdl
LmMKQEAgLTMsNiArMyw3IEBACiAKICNpbmNsdWRlIDxsaW51eC9hY3BpLmg+CiAjaW5jbHVk
ZSA8bGludXgvZGV2aWNlLmg+CisjaW5jbHVkZSA8bGludXgvaTJjLmg+CiAjaW5jbHVkZSA8
bGludXgvcGNpLmg+CiAjaW5jbHVkZSA8bGludXgvcHJvcGVydHkuaD4KICNpbmNsdWRlIDxt
ZWRpYS92NGwyLWZ3bm9kZS5oPgpAQCAtMjA3LDYgKzIwOCw4IEBAIHN0YXRpYyB2b2lkIGNp
bzJfYnJpZGdlX3VucmVnaXN0ZXJfc2Vuc29ycyhzdHJ1Y3QgY2lvMl9icmlkZ2UgKmJyaWRn
ZSkKIAkJc29mdHdhcmVfbm9kZV91bnJlZ2lzdGVyX25vZGVzKHNlbnNvci0+c3dub2Rlcyk7
CiAJCUFDUElfRlJFRShzZW5zb3ItPnBsZCk7CiAJCWFjcGlfZGV2X3B1dChzZW5zb3ItPmFk
ZXYpOworCQlpZiAoc2Vuc29yLT52Y21faTJjX2NsaWVudCkKKwkJCWkyY191bnJlZ2lzdGVy
X2RldmljZShzZW5zb3ItPnZjbV9pMmNfY2xpZW50KTsKIAl9CiB9CiAKQEAgLTM2NCwzICsz
NjcsNTIgQEAgc3RydWN0IGNpbzJfYnJpZGdlICpjaW8yX2JyaWRnZV9pbml0KHN0cnVjdCBw
Y2lfZGV2ICpjaW8yKQogCiAJcmV0dXJuIEVSUl9QVFIocmV0KTsKIH0KKworc3RhdGljIHZv
aWQgY2lvMl9icmlkZ2VfaW5zdGFudGlhdGVfdmNtX2kyY19jbGllbnQoc3RydWN0IGNpbzJf
c2Vuc29yICpzZW5zb3IpCit7CisJc3RhdGljIGNvbnN0IGNoYXIgKiBjb25zdCB2Y21fdHlw
ZXNbXSA9IHsKKwkJImFkNTgyMyIsCisJCSJkdzk3MTQiLAorCQkiYWQ1ODE2IiwKKwkJImR3
OTcxOSIsCisJCSJkdzk3MTgiLAorCQkiZHc5ODA2YiIsCisJCSJ3djUxN3MiLAorCQkibGM4
OTgxMjJ4YSIsCisJCSJsYzg5ODIxMmF4YiIsCisJfTsKKwlzdHJ1Y3QgaTJjX2JvYXJkX2lu
Zm8gYm9hcmRfaW5mbyA9IHsgfTsKKwljaGFyIG5hbWVbMTZdOworCisJaWYgKCFzZW5zb3It
PnNzZGIudmNtdHlwZSkKKwkJcmV0dXJuOworCisJaWYgKHNlbnNvci0+c3NkYi52Y210eXBl
ID4gQVJSQVlfU0laRSh2Y21fdHlwZXMpKSB7CisJCWRldl93YXJuKCZzZW5zb3ItPmFkZXYt
PmRldiwgIlVua25vd24gVkNNIHR5cGUgJWRcbiIsCisJCQkgc2Vuc29yLT5zc2RiLnZjbXR5
cGUpOworCQlyZXR1cm47CisJfQorCisJc25wcmludGYobmFtZSwgc2l6ZW9mKG5hbWUpLCAi
JXMtVkNNIiwgYWNwaV9kZXZfbmFtZShzZW5zb3ItPmFkZXYpKTsKKwlib2FyZF9pbmZvLmRl
dl9uYW1lID0gbmFtZTsKKwlzdHJzY3B5KGJvYXJkX2luZm8udHlwZSwgdmNtX3R5cGVzW3Nl
bnNvci0+c3NkYi52Y210eXBlIC0gMV0sCisJCUFSUkFZX1NJWkUoYm9hcmRfaW5mby50eXBl
KSk7CisKKwlzZW5zb3ItPnZjbV9pMmNfY2xpZW50ID0gaTJjX2FjcGlfbmV3X2RldmljZShz
ZW5zb3ItPmFkZXYsIDEsICZib2FyZF9pbmZvKTsKKwlpZiAoSVNfRVJSKHNlbnNvci0+dmNt
X2kyY19jbGllbnQpKSB7CisJCWRldl93YXJuKCZzZW5zb3ItPmFkZXYtPmRldiwgIkVycm9y
IGluc3RhbnRpYXRpb24gVkNNIGkyYy1jbGllbnQ6ICVsZFxuIiwKKwkJCSBQVFJfRVJSKHNl
bnNvci0+dmNtX2kyY19jbGllbnQpKTsKKwkJc2Vuc29yLT52Y21faTJjX2NsaWVudCA9IE5V
TEw7CisJfQorfQorCit2b2lkIGNpbzJfYnJpZGdlX2luc3RhbnRpYXRlX3ZjbV9kZXZpY2Vz
KHN0cnVjdCBjaW8yX2JyaWRnZSAqYnJpZGdlKQoreworCXVuc2lnbmVkIGludCBpOworCisJ
aWYgKCFicmlkZ2UpCisJCXJldHVybjsKKworCWZvciAoaSA9IDA7IGkgPCBicmlkZ2UtPm5f
c2Vuc29yczsgaSsrKQorCQljaW8yX2JyaWRnZV9pbnN0YW50aWF0ZV92Y21faTJjX2NsaWVu
dCgmYnJpZGdlLT5zZW5zb3JzW2ldKTsKK30KZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEv
cGNpL2ludGVsL2lwdTMvY2lvMi1icmlkZ2UuaCBiL2RyaXZlcnMvbWVkaWEvcGNpL2ludGVs
L2lwdTMvY2lvMi1icmlkZ2UuaAppbmRleCAyMDJjN2Q0OTRmN2EuLjI3YTYxYTVkNDc5ZSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9tZWRpYS9wY2kvaW50ZWwvaXB1My9jaW8yLWJyaWRnZS5o
CisrKyBiL2RyaXZlcnMvbWVkaWEvcGNpL2ludGVsL2lwdTMvY2lvMi1icmlkZ2UuaApAQCAt
OCw2ICs4LDggQEAKIAogI2luY2x1ZGUgImlwdTMtY2lvMi5oIgogCitzdHJ1Y3QgaTJjX2Ns
aWVudDsKKwogI2RlZmluZSBDSU8yX0hJRAkJCQkiSU5UMzQzRSIKICNkZWZpbmUgQ0lPMl9N
QVhfTEFORVMJCQkJNAogI2RlZmluZSBNQVhfTlVNX0xJTktfRlJFUVMJCQkzCkBAIC0xMDYs
NiArMTA4LDcgQEAgc3RydWN0IGNpbzJfc2Vuc29yX2NvbmZpZyB7CiBzdHJ1Y3QgY2lvMl9z
ZW5zb3IgewogCWNoYXIgbmFtZVtBQ1BJX0lEX0xFTl07CiAJc3RydWN0IGFjcGlfZGV2aWNl
ICphZGV2OworCXN0cnVjdCBpMmNfY2xpZW50ICp2Y21faTJjX2NsaWVudDsKIAogCXN0cnVj
dCBzb2Z0d2FyZV9ub2RlIHN3bm9kZXNbNl07CiAJc3RydWN0IGNpbzJfbm9kZV9uYW1lcyBu
b2RlX25hbWVzOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wY2kvaW50ZWwvaXB1My9p
cHUzLWNpbzItbWFpbi5jIGIvZHJpdmVycy9tZWRpYS9wY2kvaW50ZWwvaXB1My9pcHUzLWNp
bzItbWFpbi5jCmluZGV4IDUyMDlmODNjODI0OC4uM2Y4NGU3YmU2NGE3IDEwMDY0NAotLS0g
YS9kcml2ZXJzL21lZGlhL3BjaS9pbnRlbC9pcHUzL2lwdTMtY2lvMi1tYWluLmMKKysrIGIv
ZHJpdmVycy9tZWRpYS9wY2kvaW50ZWwvaXB1My9pcHUzLWNpbzItbWFpbi5jCkBAIC0xNDQ0
LDYgKzE0NDQsMTcgQEAgc3RhdGljIGludCBjaW8yX25vdGlmaWVyX2NvbXBsZXRlKHN0cnVj
dCB2NGwyX2FzeW5jX25vdGlmaWVyICpub3RpZmllcikKIAkJfQogCX0KIAorCS8qCisJICog
VGhpcyBpcyBkb25lIGhlcmUgYmVjYXVzZSwgb24gc3lzdGVtcyB3aGVyZSB0aGUgVkNNcyBh
cmUgZGVzY3JpYmVkCisJICogaW4gdGhlIFNTREIsIHRoZSByZWd1bGF0b3IgY29ubmVjdGlv
bnMgYXJlIG5vdCBkZXNjcmliZWQgaW4gZmlybXdhcmUuCisJICogVGhpcyBpcyB0YWtlbiBj
YXJlIG9mIGJ5IHBsYXRmb3JtIGNvZGUsIGJ1dCB0aGlzIGNhdXNlcyBwcm9iZS1vcmRlcgor
CSAqIGNoYWxsZW5nZXMuIFRoaXMgYWxzbyBhcHBsaWVzIHRvIHRoZSBzZW5zb3JzIGFuZCB0
aGUgcGxhdGZvcm0gY29kZQorCSAqIHRha2VzIGNhcmUgb2YgZGVsYXlpbmcgdGhlIHByb2Jp
bmcgb2YgdGhlIHNlbnNvcnMgdW50aWwgdGhlCisJICogcmVndWxhdG9yIGNvbm5lY3Rpb24g
aW5mbyBpcyBpbiBwbGFjZS4gU28gdGhlIHNlbnNvcnMgYWxsIGJlaW5nCisJICogaW4gcGxh
Y2UgbWVhbnMgaXQgaXMgbm93IGFsc28gb2sgdG8gcHJvYmUgVkNNcy4KKwkgKi8KKwljaW8y
X2JyaWRnZV9pbnN0YW50aWF0ZV92Y21fZGV2aWNlcyhjaW8yLT5icmlkZ2UpOworCiAJcmV0
dXJuIHY0bDJfZGV2aWNlX3JlZ2lzdGVyX3N1YmRldl9ub2RlcygmY2lvMi0+djRsMl9kZXYp
OwogfQogCmRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BjaS9pbnRlbC9pcHUzL2lwdTMt
Y2lvMi5oIGIvZHJpdmVycy9tZWRpYS9wY2kvaW50ZWwvaXB1My9pcHUzLWNpbzIuaAppbmRl
eCA2NGQ3Y2E1MDIxMjQuLjE5ZmQ2NDYxM2MyZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9tZWRp
YS9wY2kvaW50ZWwvaXB1My9pcHUzLWNpbzIuaAorKysgYi9kcml2ZXJzL21lZGlhL3BjaS9p
bnRlbC9pcHUzL2lwdTMtY2lvMi5oCkBAIC00NjMsMTEgKzQ2MywxMyBAQCBzdGF0aWMgaW5s
aW5lIHN0cnVjdCBjaW8yX3F1ZXVlICp2YjJxX3RvX2NpbzJfcXVldWUoc3RydWN0IHZiMl9x
dWV1ZSAqdnEpCiAKICNpZiBJU19FTkFCTEVEKENPTkZJR19DSU8yX0JSSURHRSkKIHN0cnVj
dCBjaW8yX2JyaWRnZSAqY2lvMl9icmlkZ2VfaW5pdChzdHJ1Y3QgcGNpX2RldiAqY2lvMik7
Cit2b2lkIGNpbzJfYnJpZGdlX2luc3RhbnRpYXRlX3ZjbV9kZXZpY2VzKHN0cnVjdCBjaW8y
X2JyaWRnZSAqYnJpZGdlKTsKICNlbHNlCiBzdGF0aWMgaW5saW5lIHN0cnVjdCBjaW8yX2Jy
aWRnZSAqY2lvMl9icmlkZ2VfaW5pdChzdHJ1Y3QgcGNpX2RldiAqY2lvMikKIHsKIAlyZXR1
cm4gTlVMTDsKIH0KK3N0YXRpYyBpbmxpbmUgdm9pZCBjaW8yX2JyaWRnZV9pbnN0YW50aWF0
ZV92Y21fZGV2aWNlcyhzdHJ1Y3QgY2lvMl9icmlkZ2UgKmIpIHt9CiAjZW5kaWYKIAogI2Vu
ZGlmCi0tIAoyLjMxLjEKCg==
--------------ydTyNLd1yw4W0z7J7a0zsqV0--

