Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66A98718675
	for <lists+linux-media@lfdr.de>; Wed, 31 May 2023 17:35:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234757AbjEaPfR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 May 2023 11:35:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234314AbjEaPfI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 May 2023 11:35:08 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED8EB107
        for <linux-media@vger.kernel.org>; Wed, 31 May 2023 08:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685547268;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=OeCTQcTvDRagv/aHqAAXTf/cQhS2cSaLOPqwp96+0xg=;
        b=EWpoR2Z+x6HodoHyQ0J1Hdd1VQUUhWwUl3Z+fHxZVEE41otxP/r3rDarfxcTHCcxgQHt1T
        sbz3UfF4JEy8H1WSnLq1V98x7sPCMY4qyiHhqLaoTQSvYFC5b/PDJvnsX90CRqr8NdNKpt
        qkULcf8qJCO6RYiiibxsGiu2hwLNiA4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-344-ay8DPzqjNHKp8hQYgT-nZw-1; Wed, 31 May 2023 11:34:26 -0400
X-MC-Unique: ay8DPzqjNHKp8hQYgT-nZw-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-94a355cf318so605243766b.2
        for <linux-media@vger.kernel.org>; Wed, 31 May 2023 08:34:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685547265; x=1688139265;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OeCTQcTvDRagv/aHqAAXTf/cQhS2cSaLOPqwp96+0xg=;
        b=hBjNMLVR5itfnkQTgTfne1fZNQ2nvPiMLknbf4B+Lk6HGfimziYd9yOiZZofnuzKhb
         XPpau4AYJJfJmraN38S0QoWaf4LCFIWo5nF1JOD2MEQzNw/Fi3eyRNuIVL2POmmPPYfh
         cJZlwPSWuaqLyixxR6gcxQnwAExdD0g4eBwVm4cUwQnj7efRT9eDEfYRjmobcHq6afMb
         vT6IKVQ4qCF0eBG4DOt4jSahp+2n1mJ63MO9EC0HC2/BWKvuvI2KGSPIjEOvosmhK4Ow
         rMIL74NsOvZBhdsqzzVOBU/wYrtq3T48/7LG7YnLwBX2MtQPtS/olZg90adHDjImZE+v
         b4bw==
X-Gm-Message-State: AC+VfDxDsatfP/tzAKiW9AltSzm9giYjZo95t5Zz17DYs5/KDpiSGfoN
        +7uiMyjzKM6XDde3DxS0nReLSsYbsLxUmB0hM32P536ISyLPqPSyNB7Mp+aV6t2Cu+mLx1bLhVe
        L0LhsOIajVJZVGsDsufyCH70XtbeI+e0=
X-Received: by 2002:a17:906:ef02:b0:973:ff4d:d026 with SMTP id f2-20020a170906ef0200b00973ff4dd026mr5496096ejs.45.1685547265049;
        Wed, 31 May 2023 08:34:25 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4vlOjuHu6BGzCW7QagAhahX3C3Fyzm/QTLJ70qZU9ufL3TFK/8cDKIXWEY8/X9GCeH8AlzLA==
X-Received: by 2002:a17:906:ef02:b0:973:ff4d:d026 with SMTP id f2-20020a170906ef0200b00973ff4dd026mr5496076ejs.45.1685547264691;
        Wed, 31 May 2023 08:34:24 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id t11-20020a170906a10b00b009663115c8f8sm9261948ejy.152.2023.05.31.08.34.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 08:34:24 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------sROHf2SVnuIuwv0m8gjIYFzF"
Message-ID: <7fc1a3fb-d300-de09-1e0d-606971560fc1@redhat.com>
Date:   Wed, 31 May 2023 17:34:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 3/3] platform/x86: int3472: Add ov13b10 (09B13) sensor
 module support
Content-Language: en-US, nl
To:     Dan Scally <dan.scally@ideasonboard.com>, bingbu.cao@intel.com,
        djrscally@gmail.com, hao.yao@intel.com
Cc:     markgross@kernel.org, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        bingbu.cao@linux.intel.com
References: <20230524035135.90315-1-bingbu.cao@intel.com>
 <20230524035135.90315-3-bingbu.cao@intel.com>
 <745f5335-b849-52da-f3e2-52cb1f4d1bd6@redhat.com>
 <e424987d-f7c2-4c08-eacc-67192453a78c@ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <e424987d-f7c2-4c08-eacc-67192453a78c@ideasonboard.com>
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a multi-part message in MIME format.
--------------sROHf2SVnuIuwv0m8gjIYFzF
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Dan,

On 5/31/23 17:18, Dan Scally wrote:
> Hi both
> 
> On 25/05/2023 19:40, Hans de Goede wrote:
>> Hi all,
>>
>> On 5/24/23 05:51, bingbu.cao@intel.com wrote:
>>> From: Hao Yao <hao.yao@intel.com>
>>>
>>> Add a new sensor support in INT3472 driver which module name is '09B13'.
>>>
>>> Signed-off-by: Hao Yao <hao.yao@intel.com>
>>> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
>>> ---
>>>   drivers/platform/x86/intel/int3472/discrete.c | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
>>> index d5d5c650d6d2..63acb48bf8df 100644
>>> --- a/drivers/platform/x86/intel/int3472/discrete.c
>>> +++ b/drivers/platform/x86/intel/int3472/discrete.c
>>> @@ -60,6 +60,8 @@ static const struct int3472_sensor_config int3472_sensor_configs[] = {
>>>       { "GEFF150023R", REGULATOR_SUPPLY("avdd", NULL), NULL },
>>>       /* Surface Go 1&2 - OV5693, Front */
>>>       { "YHCU", REGULATOR_SUPPLY("avdd", NULL), NULL },
>>> +    /* OV13B10 */
>>> +    { "09B13", REGULATOR_SUPPLY("vcc", NULL), NULL },
>> "vcc" is not really a useful supply name. All the existing sensor drivers in drivers/media/i2c typically check for both "avdd" and "dvdd". Can you verify if this is supplying digital or analog power using the schematics of the laptop ?
>>
>> And then use one of the standard "avdd" or "dvdd" supply names ?
>>
>> I would like to try and get rid of this table and sofar all the sensors which have a regulator GPIO are listed as sing it for "avdd" so I was hoping to be able to just always use "avdd".
> 
> 
> I agree this is quite unsatisfactory in its current form, but I'm hoping to add the ov7251 in the near future; the driver for which uses "vdda" instead, so unfortunately not in line with that.
> 
>>
>> At least I would like us to come up with some default fallback for the supply-name in case a sensor-module is not listed in this table and "avdd" seems to be the best fallback.
> 
> 
> I wonder if it'd be better to simply support regulator_get() calls without a supply name in the event that the device only has a single supply associated with it? Then we needn't pick a default at all.

I do not believe that the regulator subsystem maintainers will accept such a change. They really only want to touch regulators with full constraints to avoid frying things and this would very much go against that.

I think what we need is for the sensor drivers to use standardized supply-names, so pick one of "avdd" or "vdda" and use that everywhere.

This will require some compat code in some of the sensor drivers to try the old supply name if the new standardized supply name fails (easy when using the bulk regulator API, one of the 2 will just become a dummy regulator), but I believe that in the long run this is the best solution.

Like how we also have all the sensor driver standardized on using "powerdown" and "reset" as GPIO con-ids.

Regards,

Hans


p.s.

Talking about this I just (minutes ago) finished writing a patch for the mainline ov2680 driver which allows dropping the sensor specific GPIO remapping in the int3472 driver for the ov2680, see the attached patch (compile tested only so far). The problem is not with the int3472 code, but that the original ov2680 driver is asking for a "reset" GPIO while the pin is named "XSHUTDN" in the datasheet.

Dan, the reason why I'm poking at the mainline ov2680 driver now is because I have the atomisp code at a point where it can work with standard v4l2 sensor drivers without any atomisp specific API between the atomisp code and the sensor driver. So I want to get rid of the atomisp-ov2680.ko private driver. This involves porting recent improvements like selection API (cropping) support from 
atomisp-ov2680.c to the standard driver.

I was sorta hoping to also test this on a miix510, but upon checking I saw that the mainline ov2680.c does not yet work on the miix510. Porting my atomisp-ov2680.c changes should get us close to having the standard ov2680.c work on the miix510 (ACPI enumeration, runtime-pm and selection API support will all be added).

I have recently bought a second hand miix 510. Long story short: Can you give me some quick instructions, or a docs pointer for testing a new sensor with libcamera ?  Or preferably I guess first outside of libcamera just grabbing raw-bayer + some userspace debayer tool for testing and then later on test under libcamera ?


More p.s. :

Dan what about: https://patchwork.kernel.org/project/platform-driver-x86/patch/20230311223019.14123-1-dan.scally@ideasonboard.com/ and my remarks on that patch from you ?


--------------sROHf2SVnuIuwv0m8gjIYFzF
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-media-ov2680-Check-for-powerdown-GPIO-con-id-before-.patch"
Content-Disposition: attachment;
 filename*0="0001-media-ov2680-Check-for-powerdown-GPIO-con-id-before-.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBmN2EwNWUyZmIxOWMzYmIzYmI3MDRkNTU0MDc0NjQ2NWNjNTMxMjVkIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQu
Y29tPgpEYXRlOiBXZWQsIDMxIE1heSAyMDIzIDE2OjUzOjM2ICswMjAwClN1YmplY3Q6IFtQ
QVRDSF0gbWVkaWE6IG92MjY4MDogQ2hlY2sgZm9yICJwb3dlcmRvd24iIEdQSU8gY29uLWlk
IGJlZm9yZQogY2hlY2tpbmcgZm9yICJyZXNldCIgR1BJTyBjb24taWQKClRoZSBkYXRhc2hl
ZXQgb2YgdGhlIE9WMjY4MCBsYWJlbHMgdGhlIHNpbmdsZSBHUElPIHRvIHB1dCB0aGUgc2Vu
c29yIGluCnBvd2Vyc2F2aW5nIG1vZGUgYXMgWFNIVVRETiBha2Egc2h1dGRvd24sIF9ub3Rf
IHJlc2V0LgoKVGhpcyBpcyBpbXBvcnRhbnQgYmVjYXVzZSBzb21lIGJvYXJkcyBoYXZlIHN0
YW5kYXJkaXplZCBzZW5zb3IgY29ubmVjdG9ycwp3aGljaCBhbGxvdyBjb25uZWN0aW5nIHZh
cmlvdXMgc2Vuc29yIG1vZHVsZXMuIFRoZXNlIGNvbm5lY3RvcnMgaGF2ZSBib3RoCnJlc2V0
IGFuZCBwb3dlcmRvd24gc2lnbmFscyBhbmQgdGhlIHBvd2VyZG93biBzaWduYWwgaXMgcm91
dGVkIHRvCnRoZSBPVjI2ODAncyBYU0hVVEROIHBpbi4KCk9uIHg4Ni9BQ1BJIG11bHRpcGxl
IEJheSBUcmFpbCwgQ2hlcnJ5IFRyYWlsLCBTa3kgTGFrZSBhbmQgS2FieSBMYWtlIG1vZGVs
cwpoYXZlIGFuIE9WMjY4MCBjb25uZWN0ZWQgdG8gdGhlIElTUDIgLyBJUFUzLiBPbiB0aGVz
ZSBkZXZpY2VzIHRoZSBHUElPUyBhcmUKbm90IGRlc2NyaWJlZCBpbiBEVCBpbnN0ZWFkIHRo
ZSBHUElPcyBhcmUgZGVzY3JpYmVkIHdpdGggYW4gSW50ZWwgc3BlY2lmaWMKRFNNIHdoaWNo
IGxhYmVscyB0aGVtIGFzIGVpdGhlciBwb3dlcmRvd24gb3IgcmVzZXQuIE9mdGVuIHRoaXMg
RFNNIHJldHVybnMKYm90aCByZXNldCBhbmQgcG93ZXJkb3duIHBpbnMgZXZlbiB0aG91Z2gg
dGhlIE9WMjY4MCBoYXMgb25seSAxIHN1Y2ggcGluLgoKRm9yIHRoZSBvdjI2ODAgZHJpdmVy
IHRvIHdvcmsgb24gdGhlc2UgZGV2aWNlcyBpdCBtdXN0IHVzZSB0aGUgR1BJTyB3aXRoCiJw
b3dlcmRvd24iIGFzIGNvbi1pZCwgbWF0Y2hpbmcgdGhlIFhTSFVURE4gbmFtZSBmcm9tIHRo
ZSBkYXRhc2hlZXQuCgpBcyBmb3Igd2h5ICJwb3dlcmRvd24iIHZzIHNheSAic2h1dGRvd24i
IHRoZSBBQ1BJIERTTSAtPiBjb24taWQgbWFwcGluZwpjb2RlIGlzIHNoYXJlZCwgc28gd2Ug
bXVzdCB1c2Ugc3RhbmRhcmRpemVkIG5hbWVzIGFuZCBjdXJyZW50bHkgYWxsIG9mCnRoZSBm
b2xsb3dpbmcgc2Vuc29yIGRyaXZlcnMgYWxyZWFkeSB1c2UgInBvd2VyZG93biI6CmFkdjcx
ODAsIGdjMDMxMCwgaXNsNzk5OHgsIG92MDJhMTAsIG92MjY1OSwgb3Y1NjQwLCBvdjU2NDgs
IG92NTY3MCwKb3Y1NjkzLCBvdjc2NzAsIG92NzcyeCwgb3Y3NzQwLCBvdjg4NTgsIG92ODg2
NSBhbmQgb3Y5NjUwIC4KCldoZXJlIGFzIHRoZSBoaTg0NiBkcml2ZXIgaXMgdGhlIGxvbmVs
eSBzdGFuZG91dCB1c2luZyAic2h1dGRvd24iLgoKVHJ5IHRoZSAicG93ZXJkb3duIiBjb24t
aWQgZmlyc3QgdG8gbWFrZSB0aGluZ3Mgd29yaywgZmFsbGluZyBiYWNrIHRvCiJyZXNldCIg
dG8ga2VlcCBleGlzdGluZyBEVCBzZXR1cHMgd29ya2luZy4KCkNjOiBEYW4gU2NhbGx5IDxk
YW4uc2NhbGx5QGlkZWFzb25ib2FyZC5jb20+ClNpZ25lZC1vZmYtYnk6IEhhbnMgZGUgR29l
ZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9tZWRpYS9pMmMvb3YyNjgw
LmMgfCAyNiArKysrKysrKysrKysrKysrKy0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE3
IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9t
ZWRpYS9pMmMvb3YyNjgwLmMgYi9kcml2ZXJzL21lZGlhL2kyYy9vdjI2ODAuYwppbmRleCBi
NTI4MzA4MmY5NmQuLmU1NTY0ZWY4ZjQ0MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9tZWRpYS9p
MmMvb3YyNjgwLmMKKysrIGIvZHJpdmVycy9tZWRpYS9pMmMvb3YyNjgwLmMKQEAgLTEwNCw3
ICsxMDQsNyBAQCBzdHJ1Y3Qgb3YyNjgwX2RldiB7CiAJdTMyCQkJCXh2Y2xrX2ZyZXE7CiAJ
c3RydWN0IHJlZ3VsYXRvcl9idWxrX2RhdGEJc3VwcGxpZXNbT1YyNjgwX05VTV9TVVBQTElF
U107CiAKLQlzdHJ1Y3QgZ3Bpb19kZXNjCQkqcmVzZXRfZ3BpbzsKKwlzdHJ1Y3QgZ3Bpb19k
ZXNjCQkqcHdkbl9ncGlvOwogCXN0cnVjdCBtdXRleAkJCWxvY2s7IC8qIHByb3RlY3QgbWVt
YmVycyAqLwogCiAJYm9vbAkJCQltb2RlX3BlbmRpbmdfY2hhbmdlczsKQEAgLTE5MiwxOSAr
MTkyLDE5IEBAIHN0YXRpYyBpbmxpbmUgc3RydWN0IHY0bDJfc3ViZGV2ICpjdHJsX3RvX3Nk
KHN0cnVjdCB2NGwyX2N0cmwgKmN0cmwpCiAKIHN0YXRpYyB2b2lkIG92MjY4MF9wb3dlcl91
cChzdHJ1Y3Qgb3YyNjgwX2RldiAqc2Vuc29yKQogewotCWlmICghc2Vuc29yLT5yZXNldF9n
cGlvKQorCWlmICghc2Vuc29yLT5wd2RuX2dwaW8pCiAJCXJldHVybjsKIAotCWdwaW9kX3Nl
dF92YWx1ZShzZW5zb3ItPnJlc2V0X2dwaW8sIDApOworCWdwaW9kX3NldF92YWx1ZShzZW5z
b3ItPnB3ZG5fZ3BpbywgMCk7CiAJdXNsZWVwX3JhbmdlKDUwMDAsIDEwMDAwKTsKIH0KIAog
c3RhdGljIHZvaWQgb3YyNjgwX3Bvd2VyX2Rvd24oc3RydWN0IG92MjY4MF9kZXYgKnNlbnNv
cikKIHsKLQlpZiAoIXNlbnNvci0+cmVzZXRfZ3BpbykKKwlpZiAoIXNlbnNvci0+cHdkbl9n
cGlvKQogCQlyZXR1cm47CiAKLQlncGlvZF9zZXRfdmFsdWUoc2Vuc29yLT5yZXNldF9ncGlv
LCAxKTsKKwlncGlvZF9zZXRfdmFsdWUoc2Vuc29yLT5wd2RuX2dwaW8sIDEpOwogCXVzbGVl
cF9yYW5nZSg1MDAwLCAxMDAwMCk7CiB9CiAKQEAgLTQ0MSw3ICs0NDEsNyBAQCBzdGF0aWMg
aW50IG92MjY4MF9wb3dlcl9vbihzdHJ1Y3Qgb3YyNjgwX2RldiAqc2Vuc29yKQogCQlyZXR1
cm4gcmV0OwogCX0KIAotCWlmICghc2Vuc29yLT5yZXNldF9ncGlvKSB7CisJaWYgKCFzZW5z
b3ItPnB3ZG5fZ3BpbykgewogCQlyZXQgPSBjY2lfd3JpdGUoc2Vuc29yLT5yZWdtYXAsIE9W
MjY4MF9SRUdfU09GVF9SRVNFVCwgMHgwMSwgTlVMTCk7CiAJCWlmIChyZXQgIT0gMCkgewog
CQkJZGV2X2VycihkZXYsICJzZW5zb3Igc29mdCByZXNldCBmYWlsZWRcbiIpOwpAQCAtOTE3
LDkgKzkxNywxNyBAQCBzdGF0aWMgaW50IG92MjY4MF9wYXJzZV9kdChzdHJ1Y3Qgb3YyNjgw
X2RldiAqc2Vuc29yKQogCXN0cnVjdCBkZXZpY2UgKmRldiA9IG92MjY4MF90b19kZXYoc2Vu
c29yKTsKIAlpbnQgcmV0OwogCi0Jc2Vuc29yLT5yZXNldF9ncGlvID0gZGV2bV9ncGlvZF9n
ZXRfb3B0aW9uYWwoZGV2LCAicmVzZXQiLAotCQkJCQkJICAgICBHUElPRF9PVVRfSElHSCk7
Ci0JcmV0ID0gUFRSX0VSUl9PUl9aRVJPKHNlbnNvci0+cmVzZXRfZ3Bpbyk7CisJLyoKKwkg
KiBUaGUgcGluIHdlIHdhbnQgaXMgbmFtZWQgWFNIVVRETiBpbiB0aGUgZGF0YXNoZWV0LiBM
aW51eCBzZW5zb3IKKwkgKiBkcml2ZXJzIGhhdmUgc3RhbmRhcmRpemVkIG9uIHVzaW5nICJw
b3dlcmRvd24iIGFzIGNvbi1pZCBuYW1lCisJICogZm9yIHBvd2VyZG93biBvciBzaHV0ZG93
biBwaW5zLiBPbGRlciBEVEIgZmlsZXMgdXNlICJyZXNldCIsCisJICogc28gZmFsbGJhY2sg
dG8gdGhhdCBpZiB0aGVyZSBpcyBubyAicG93ZXJkb3duIiBwaW4uCisJICovCisJc2Vuc29y
LT5wd2RuX2dwaW8gPSBkZXZtX2dwaW9kX2dldF9vcHRpb25hbChkZXYsICJwb3dlcmRvd24i
LCBHUElPRF9PVVRfSElHSCk7CisJaWYgKCFzZW5zb3ItPnB3ZG5fZ3BpbykKKwkJc2Vuc29y
LT5wd2RuX2dwaW8gPSBkZXZtX2dwaW9kX2dldF9vcHRpb25hbChkZXYsICJyZXNldCIsIEdQ
SU9EX09VVF9ISUdIKTsKKworCXJldCA9IFBUUl9FUlJfT1JfWkVSTyhzZW5zb3ItPnB3ZG5f
Z3Bpbyk7CiAJaWYgKHJldCA8IDApIHsKIAkJZGV2X2RiZyhkZXYsICJlcnJvciB3aGlsZSBn
ZXR0aW5nIHJlc2V0IGdwaW86ICVkXG4iLCByZXQpOwogCQlyZXR1cm4gcmV0OwotLSAKMi40
MC4xCgo=

--------------sROHf2SVnuIuwv0m8gjIYFzF--

