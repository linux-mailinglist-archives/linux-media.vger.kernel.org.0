Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7187B4455AD
	for <lists+linux-media@lfdr.de>; Thu,  4 Nov 2021 15:49:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230420AbhKDOwe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Nov 2021 10:52:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59745 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229920AbhKDOwd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Nov 2021 10:52:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1636037395;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=sMzFcxJrjcUujKTofhoOTmW7rHRL06aKGxPsyli09Ek=;
        b=WVv5+CGVYR73YfD3uFNpZ+lpgbaAN9PqlPiJzH/4L+pAjmc1kKT6yizPVN5caZA6ebtB33
        VUKI+PYWAYvmcQY2Y5BxswxGA94gKNA2hkzh/X0CYQtNo0vnpobyrmu1cgCvhEFngaOmrY
        TPBzH5WzKBEpKqhqitVcJMCASwC56ZI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-65rlQ24mMUmaoqDDg2QdLg-1; Thu, 04 Nov 2021 10:49:51 -0400
X-MC-Unique: 65rlQ24mMUmaoqDDg2QdLg-1
Received: by mail-ed1-f69.google.com with SMTP id w12-20020a056402268c00b003e2ab5a3370so6007139edd.0
        for <linux-media@vger.kernel.org>; Thu, 04 Nov 2021 07:49:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to;
        bh=sMzFcxJrjcUujKTofhoOTmW7rHRL06aKGxPsyli09Ek=;
        b=A0dqDEQlfwPIb6F2L7yaBVsnhM1QSCgzQTpZZBKtEgmU8h3S7k0pxWwGSrgUhmy77e
         Uqg4QHSm4Eycq8x28PC8F1uVMg5udRr7yDbJdBx0GLIoEuDaTWP2ipGvT4BN6gboQ+4s
         2JhRlLaSkxQPbUdEL6nuS0dsGNT16izMi0bvVg5h8lils226URjEdetGBpZOz0o17sdW
         EoUPkJ5WZ6HHSXJigtTH8AN1xvCnZZCcxJF9TxhFzKM89Qqq9+f6v/21jBqq0ANb4Yku
         R9DjGuA65Chxx4UgUtAmGcZk7hxLH+12ge2v+NXir9GnwgqELeJ8+hHElt9HBLNNjrQ3
         5o/w==
X-Gm-Message-State: AOAM5329dH3o6BOQfspuhZH5XsqEATa3BeHYEE+NJyW+1iRSLqay8+SW
        E63Xw8cKRMEBkj9X7EPH8o8qmKcmrVOCHS8PAexQoucI5uMogJ07vLBsv2+us0EZ9NRpPxDIc39
        fhlev86jNvm1xokGzWpkbiGU=
X-Received: by 2002:a17:906:1396:: with SMTP id f22mr21415339ejc.228.1636037390296;
        Thu, 04 Nov 2021 07:49:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrze++uYnVXNFYNdRm+SM5pIVdiYy1NjRRTXim9lZvXiyvy6ut6cU5UGeOWIO+MFmKywNX5A==
X-Received: by 2002:a17:906:1396:: with SMTP id f22mr21415289ejc.228.1636037389878;
        Thu, 04 Nov 2021 07:49:49 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id hq37sm2842678ejc.116.2021.11.04.07.49.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Nov 2021 07:49:49 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------xU8cQ3voysiv0Z2zjroxEWAd"
Message-ID: <8d0470d3-7356-b476-6807-5c8606ee3545@redhat.com>
Date:   Thu, 4 Nov 2021 15:49:48 +0100
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
 <418dc16a-2a03-7604-a8e2-31c5ddfcf436@redhat.com>
 <58dabc46-211c-844d-3ed3-fd2411936d6d@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <58dabc46-211c-844d-3ed3-fd2411936d6d@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a multi-part message in MIME format.
--------------xU8cQ3voysiv0Z2zjroxEWAd
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Daniel,

On 11/2/21 00:43, Daniel Scally wrote:
> Hi Hans
> 
> On 01/11/2021 16:02, Hans de Goede wrote:

<snip>

>>> Having looked at this yesterday evening I'm more and more convinced it's
>>> necessary. I hacked it into the ov8865 driver in the interim (just by
>>> calling i2c_acpi_new_device() in probe) and then worked on that dw9719
>>> code you found [1] to turn it into an i2c driver (attached, though still
>>> needs a bit of work), which will successfully bind to the i2c client
>>> enumerated by that i2c_acpi_new_device() call. From there though it
>>> needs a way for the v4l2 subdev to be matched to the sensor's subdev.
>>> This can happen automatically by way of the lens-focus firmware property
>>> against the sensor - we currently build those in the cio2-bridge, so
>>> adding another software node for the VCM and creating a lens-focus
>>> property for the sensor's software_node with a pointer to the VCM's node
>>> seems like the best way to do that.
>> So besides prepping a v5 of my previous series, with update regulator
>> init-data for the VCM I've also been looking into this, attached are
>> the results.
>>
>> Some notes from initial testing:
>>
>> 1. The driver you attached will only successful probe if I insmod
>> it while streaming video from the sensor. So I think we need another
>> regulator or the clk for just the VCM too, I will investigate this
>> later this week.
> 
> Oh really, I'll test that too; thanks for the patches. There's a couple
> of tweaks to the driver anyway, so hopefully be able to get it ironed out.

Ok, I've figured this out now, with the attached patch (which also
explains what is going on) as well as an updated tps68470_board_data.c
with updated regulator_init_data for the VCM (also attached), the driver
can now successfully talk to the VCM in probe() while we are NOT
streaming from the ov8865.

Daniel, please feel free to squash this into your original dw9719 patch.

<snip>

>> 2. I need some help with all the fwnode link stuff (I'm not very familiar
>> with this). There seems to be a chicken and egg problem here though,
>> because the v4l2subdev for the VCM does not register because of async stuff
>> and if we add it to the "graph" then my idea to enumerate the VCMs
>> from the SSDB on the complete() callback won't work. But we can do this
>> on a per sensor basis instead from the cio2_notifier_bound() callback
>> instead I guess ?
> 
> 
> I think on top of your work in the cio2-bridge for patch 3 you can do this:
> 
> 
> 1. Create another software node against the cio2_sensor struct, with the
> name coming from the vcm_types array
> 
> 2. Assign that software node to board_info.swnode in
> cio2_bridge_instantiate_vcm_i2c_client()
> 
> 3. Add another entry to dev_properties for the sensor, that is named
> "lens-focus" and contains a reference to the software_node created in #2
> just like the references to the sensor/cio2 nodes.
> 
> 
> This way when the sensor driver calls
> v4l2_async_register_subdev_sensor() it should create a notifier that
> looks for that VCM client to bind. I think then rather than putting
> anything in the .bound() / .complete() callbacks, we should modify core
> to do _something_ when async matching some subdevs. The something would
> depend on the kind of devices that match, for example with the sensor
> driver and the ipu3-cio2 driver, there's an entity whos function is
> MEDIA_ENT_F_VID_IF_BRIDGE matching to an entity whos function is
> MEDIA_ENT_F_CAM_SENSOR, and it seems to me that every scenario like that
> is going to result in media pad links being created. Similarly for our
> sensor that's a device with entity function MEDIA_ENT_F_LENS matching to
> MEDIA_ENT_F_CAM_SENSOR, and I think that in those cases we can create
> either an interface link or a new kind of link (maybe
> "MEDIA_LNK_FL_ANCILLARY_LINK" or something...) between the two to show
> that they form a single logical unit, which we can then report to libcamera.
> 
> 
> Hope that makes sense...

Maybe? I have not looked into this closely yet. I'll continue working on
this coming Tuesday.

If you feel like tinkering I would not mind if you beat me to it this
weekend :)   OTOH please enjoy your weekend doing whatever, I can continue
working on this during office-hours next week.

Regards,

Hans

--------------xU8cQ3voysiv0Z2zjroxEWAd
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-media-i2c-dw9719-Add-support-for-VSIO-regulator.patch"
Content-Disposition: attachment;
 filename*0="0001-media-i2c-dw9719-Add-support-for-VSIO-regulator.patch"
Content-Transfer-Encoding: base64

RnJvbSA3Mjc2MGRiNDA3Yjk4ZTAyZDVhZWE1YWQ2YzFhMWY0ZWJkNjY4NzE3IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQu
Y29tPgpEYXRlOiBUaHUsIDQgTm92IDIwMjEgMTU6NDE6MjkgKzAxMDAKU3ViamVjdDogW1BB
VENIXSBtZWRpYTogaTJjOiBkdzk3MTk6IEFkZCBzdXBwb3J0IGZvciBWU0lPIHJlZ3VsYXRv
cgoKVGhlIERXOTcxOSBoYXMgb25seSB0aGUgMSBWREQgdm9sdGFnZSBpbnB1dCwgYnV0IHNv
bWUgUE1JQ3Mgc3VjaCBhcwp0aGUgVFBTNjg0NzAgUE1JQyBoYXZlIEkyQyBwYXNzdGhyb3Vn
aCBjYXBhYmlsaXR5LCB0byBkaXNjb25uZWN0IHRoZQpzZW5zb3IncyBJMkMgcGlucyBmcm9t
IHRoZSBJMkMgYnVzIHdoZW4gdGhlIHNlbnNvcnMgVlNJTyAoU2Vuc29yLUlPKQppcyBvZmYs
IGJlY2F1c2Ugc29tZSBzZW5zb3JzIHRoZW4gc2hvcnQgdGhlc2UgcGlucyB0byBncm91bmQ7
CmFuZCB0aGUgRFc5NzE5IG1pZ2h0IHNpdCBiZWhpbmQgdGhpcyBwYXNzdGhyb3VnaCwgdGhp
cyBpdCBuZWVkcyB0bwplbmFibGUgVlNJTyBhcyB0aGF0IHdpbGwgYWxzbyBlbmFibGUgdGhl
IEkyQyBwYXNzdGhyb3VnaC4KClNpZ25lZC1vZmYtYnk6IEhhbnMgZGUgR29lZGUgPGhkZWdv
ZWRlQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9tZWRpYS9pMmMvZHc5NzE5LmMgfCAyNyAr
KysrKysrKysrKysrKysrKysrLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRp
b25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvaTJj
L2R3OTcxOS5jIGIvZHJpdmVycy9tZWRpYS9pMmMvZHc5NzE5LmMKaW5kZXggOTAyMWNhYTkx
NWEzLi43OGI3MTJmNTcyNmYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbWVkaWEvaTJjL2R3OTcx
OS5jCisrKyBiL2RyaXZlcnMvbWVkaWEvaTJjL2R3OTcxOS5jCkBAIC0yNywxMiArMjcsMTQg
QEAKICNkZWZpbmUgRFc5NzE5X0RFRkFVTFRfVkNNX0ZSRVEJCTB4NjAKICNkZWZpbmUgRFc5
NzE5X0VOQUJMRV9SSU5HSU5HCQkweDAyCiAKKyNkZWZpbmUgTlVNX1JFR1VMQVRPUlMJCQky
CisKICNkZWZpbmUgdG9fZHc5NzE5X2RldmljZSh4KSBjb250YWluZXJfb2YoeCwgc3RydWN0
IGR3OTcxOV9kZXZpY2UsIHNkKQogCiBzdHJ1Y3QgZHc5NzE5X2RldmljZSB7CiAJc3RydWN0
IGRldmljZSAqZGV2OwogCXN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQ7Ci0Jc3RydWN0IHJl
Z3VsYXRvciAqdmRkOworCXN0cnVjdCByZWd1bGF0b3JfYnVsa19kYXRhIHJlZ3VsYXRvcnNb
TlVNX1JFR1VMQVRPUlNdOwogCXN0cnVjdCB2NGwyX3N1YmRldiBzZDsKIAogCXN0cnVjdCBk
dzk3MTlfdjRsMl9jdHJscyB7CkBAIC0xMTUsMTQgKzExNywxNCBAQCBzdGF0aWMgaW50IGR3
OTcxOV9kZXRlY3Qoc3RydWN0IGR3OTcxOV9kZXZpY2UgKmR3OTcxOSkKIAogc3RhdGljIGlu
dCBkdzk3MTlfcG93ZXJfZG93bihzdHJ1Y3QgZHc5NzE5X2RldmljZSAqZHc5NzE5KQogewot
CXJldHVybiByZWd1bGF0b3JfZGlzYWJsZShkdzk3MTktPnZkZCk7CisJcmV0dXJuIHJlZ3Vs
YXRvcl9idWxrX2Rpc2FibGUoTlVNX1JFR1VMQVRPUlMsIGR3OTcxOS0+cmVndWxhdG9ycyk7
CiB9CiAKIHN0YXRpYyBpbnQgZHc5NzE5X3Bvd2VyX3VwKHN0cnVjdCBkdzk3MTlfZGV2aWNl
ICpkdzk3MTkpCiB7CiAJaW50IHJldDsKIAotCXJldCA9IHJlZ3VsYXRvcl9lbmFibGUoZHc5
NzE5LT52ZGQpOworCXJldCA9IHJlZ3VsYXRvcl9idWxrX2VuYWJsZShOVU1fUkVHVUxBVE9S
UywgZHc5NzE5LT5yZWd1bGF0b3JzKTsKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCkBA
IC0yNzYsMTEgKzI3OCwyMCBAQCBzdGF0aWMgaW50IGR3OTcxOV9wcm9iZShzdHJ1Y3QgaTJj
X2NsaWVudCAqY2xpZW50KQogCWR3OTcxOS0+Y2xpZW50ID0gY2xpZW50OwogCWR3OTcxOS0+
ZGV2ID0gJmNsaWVudC0+ZGV2OwogCi0JZHc5NzE5LT52ZGQgPSBkZXZtX3JlZ3VsYXRvcl9n
ZXQoJmNsaWVudC0+ZGV2LCAidmRkIik7Ci0JaWYgKElTX0VSUihkdzk3MTktPnZkZCkpIHsK
LQkJZGV2X2VycigmY2xpZW50LT5kZXYsICJFcnJvciBnZXR0aW5nIHJlZ3VsYXRvclxuIik7
Ci0JCXJldHVybiBQVFJfRVJSKGR3OTcxOS0+dmRkKTsKLQl9CisJZHc5NzE5LT5yZWd1bGF0
b3JzWzBdLnN1cHBseSA9ICJ2ZGQiOworCS8qCisJICogVGhlIERXOTcxOSBoYXMgb25seSB0
aGUgMSBWREQgdm9sdGFnZSBpbnB1dCwgYnV0IHNvbWUgUE1JQ3Mgc3VjaCBhcworCSAqIHRo
ZSBUUFM2ODQ3MCBQTUlDIGhhdmUgSTJDIHBhc3N0aHJvdWdoIGNhcGFiaWxpdHksIHRvIGRp
c2Nvbm5lY3QgdGhlCisJICogc2Vuc29yJ3MgSTJDIHBpbnMgZnJvbSB0aGUgSTJDIGJ1cyB3
aGVuIHRoZSBzZW5zb3JzIFZTSU8gKFNlbnNvci1JTykKKwkgKiBpcyBvZmYsIGJlY2F1c2Ug
c29tZSBzZW5zb3JzIHRoZW4gc2hvcnQgdGhlc2UgcGlucyB0byBncm91bmQ7CisJICogYW5k
IHRoZSBEVzk3MTkgbWlnaHQgc2l0IGJlaGluZCB0aGlzIHBhc3N0aHJvdWdoLCB0aGlzIGl0
IG5lZWRzIHRvCisJICogZW5hYmxlIFZTSU8gYXMgdGhhdCB3aWxsIGFsc28gZW5hYmxlIHRo
ZSBJMkMgcGFzc3Rocm91Z2guCisJICovCisJZHc5NzE5LT5yZWd1bGF0b3JzWzFdLnN1cHBs
eSA9ICJ2c2lvIjsKKworCXJldCA9IGRldm1fcmVndWxhdG9yX2J1bGtfZ2V0KCZjbGllbnQt
PmRldiwgTlVNX1JFR1VMQVRPUlMsIGR3OTcxOS0+cmVndWxhdG9ycyk7CisJaWYgKHJldCkK
KwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoJmNsaWVudC0+ZGV2LCByZXQsICJnZXR0aW5nIHJl
Z3VsYXRvcnNcbiIpOwogCiAJdjRsMl9pMmNfc3ViZGV2X2luaXQoJmR3OTcxOS0+c2QsIGNs
aWVudCwgJmR3OTcxOV9vcHMpOwogCWR3OTcxOS0+c2QuZmxhZ3MgfD0gVjRMMl9TVUJERVZf
RkxfSEFTX0RFVk5PREU7Ci0tIAoyLjMxLjEKCg==
--------------xU8cQ3voysiv0Z2zjroxEWAd
Content-Type: text/x-csrc; charset=UTF-8; name="tps68470_board_data.c"
Content-Disposition: attachment; filename="tps68470_board_data.c"
Content-Transfer-Encoding: base64

Ly8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKLyoKICogVEkgVFBTNjg0NzAg
UE1JQyBwbGF0Zm9ybSBkYXRhIGRlZmluaXRpb24uCiAqCiAqIENvcHlyaWdodCAoYykgMjAy
MSBEYW4gU2NhbGx5IDxkanJzY2FsbHlAZ21haWwuY29tPgogKiBDb3B5cmlnaHQgKGMpIDIw
MjEgUmVkIEhhdCBJbmMuCiAqCiAqIFJlZCBIYXQgYXV0aG9yczoKICogSGFucyBkZSBHb2Vk
ZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4KICovCgojaW5jbHVkZSA8bGludXgvZG1pLmg+CiNp
bmNsdWRlIDxsaW51eC9ncGlvL21hY2hpbmUuaD4KI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3Jt
X2RhdGEvdHBzNjg0NzAuaD4KI2luY2x1ZGUgPGxpbnV4L3JlZ3VsYXRvci9tYWNoaW5lLmg+
CiNpbmNsdWRlICJ0cHM2ODQ3MC5oIgoKc3RhdGljIHN0cnVjdCByZWd1bGF0b3JfY29uc3Vt
ZXJfc3VwcGx5IGludDM0N2FfY29yZV9jb25zdW1lcl9zdXBwbGllc1tdID0gewoJUkVHVUxB
VE9SX1NVUFBMWSgiZHZkZCIsICJpMmMtSU5UMzQ3QTowMCIpLAp9OwoKc3RhdGljIHN0cnVj
dCByZWd1bGF0b3JfY29uc3VtZXJfc3VwcGx5IGludDM0N2FfYW5hX2NvbnN1bWVyX3N1cHBs
aWVzW10gPSB7CglSRUdVTEFUT1JfU1VQUExZKCJhdmRkIiwgImkyYy1JTlQzNDdBOjAwIiks
Cn07CgpzdGF0aWMgc3RydWN0IHJlZ3VsYXRvcl9jb25zdW1lcl9zdXBwbHkgaW50MzQ3YV92
Y21fY29uc3VtZXJfc3VwcGxpZXNbXSA9IHsKCVJFR1VMQVRPUl9TVVBQTFkoInZkZCIsICJp
MmMtSU5UMzQ3QTowMC1WQ00iKSwKfTsKCnN0YXRpYyBzdHJ1Y3QgcmVndWxhdG9yX2NvbnN1
bWVyX3N1cHBseSBpbnQzNDdhX3ZzaW9fY29uc3VtZXJfc3VwcGxpZXNbXSA9IHsKCVJFR1VM
QVRPUl9TVVBQTFkoImRvdmRkIiwgImkyYy1JTlQzNDdBOjAwIiksCglSRUdVTEFUT1JfU1VQ
UExZKCJ2c2lvIiwgImkyYy1JTlQzNDdBOjAwLVZDTSIpLAp9OwoKc3RhdGljIGNvbnN0IHN0
cnVjdCByZWd1bGF0b3JfaW5pdF9kYXRhIHN1cmZhY2VfZ29fdHBzNjg0NzBfY29yZV9yZWdf
aW5pdF9kYXRhID0gewoJLmNvbnN0cmFpbnRzID0gewoJCS5taW5fdVYgPSAxMjAwMDAwLAoJ
CS5tYXhfdVYgPSAxMjAwMDAwLAoJCS5hcHBseV91ViA9IDEsCgkJLnZhbGlkX29wc19tYXNr
ID0gUkVHVUxBVE9SX0NIQU5HRV9TVEFUVVMsCgl9LAoJLm51bV9jb25zdW1lcl9zdXBwbGll
cyA9IEFSUkFZX1NJWkUoaW50MzQ3YV9jb3JlX2NvbnN1bWVyX3N1cHBsaWVzKSwKCS5jb25z
dW1lcl9zdXBwbGllcyA9IGludDM0N2FfY29yZV9jb25zdW1lcl9zdXBwbGllcywKfTsKCnN0
YXRpYyBjb25zdCBzdHJ1Y3QgcmVndWxhdG9yX2luaXRfZGF0YSBzdXJmYWNlX2dvX3RwczY4
NDcwX2FuYV9yZWdfaW5pdF9kYXRhID0gewoJLmNvbnN0cmFpbnRzID0gewoJCS5taW5fdVYg
PSAyODE1MjAwLAoJCS5tYXhfdVYgPSAyODE1MjAwLAoJCS5hcHBseV91ViA9IDEsCgkJLnZh
bGlkX29wc19tYXNrID0gUkVHVUxBVE9SX0NIQU5HRV9TVEFUVVMsCgl9LAoJLm51bV9jb25z
dW1lcl9zdXBwbGllcyA9IEFSUkFZX1NJWkUoaW50MzQ3YV9hbmFfY29uc3VtZXJfc3VwcGxp
ZXMpLAoJLmNvbnN1bWVyX3N1cHBsaWVzID0gaW50MzQ3YV9hbmFfY29uc3VtZXJfc3VwcGxp
ZXMsCn07CgpzdGF0aWMgY29uc3Qgc3RydWN0IHJlZ3VsYXRvcl9pbml0X2RhdGEgc3VyZmFj
ZV9nb190cHM2ODQ3MF92Y21fcmVnX2luaXRfZGF0YSA9IHsKCS5jb25zdHJhaW50cyA9IHsK
CQkubWluX3VWID0gMjgxNTIwMCwKCQkubWF4X3VWID0gMjgxNTIwMCwKCQkuYXBwbHlfdVYg
PSAxLAoJCS52YWxpZF9vcHNfbWFzayA9IFJFR1VMQVRPUl9DSEFOR0VfU1RBVFVTLAoJfSwK
CS5udW1fY29uc3VtZXJfc3VwcGxpZXMgPSBBUlJBWV9TSVpFKGludDM0N2FfdmNtX2NvbnN1
bWVyX3N1cHBsaWVzKSwKCS5jb25zdW1lcl9zdXBwbGllcyA9IGludDM0N2FfdmNtX2NvbnN1
bWVyX3N1cHBsaWVzLAp9OwoKc3RhdGljIGNvbnN0IHN0cnVjdCByZWd1bGF0b3JfaW5pdF9k
YXRhIHN1cmZhY2VfZ29fdHBzNjg0NzBfdnNpb19yZWdfaW5pdF9kYXRhID0gewoJLmNvbnN0
cmFpbnRzID0gewoJCS5taW5fdVYgPSAxODAwNjAwLAoJCS5tYXhfdVYgPSAxODAwNjAwLAoJ
CS5hcHBseV91ViA9IDEsCgkJLnZhbGlkX29wc19tYXNrID0gUkVHVUxBVE9SX0NIQU5HRV9T
VEFUVVMsCgl9LAoJLm51bV9jb25zdW1lcl9zdXBwbGllcyA9IEFSUkFZX1NJWkUoaW50MzQ3
YV92c2lvX2NvbnN1bWVyX3N1cHBsaWVzKSwKCS5jb25zdW1lcl9zdXBwbGllcyA9IGludDM0
N2FfdnNpb19jb25zdW1lcl9zdXBwbGllcywKfTsKCnN0YXRpYyBjb25zdCBzdHJ1Y3QgdHBz
Njg0NzBfcmVndWxhdG9yX3BsYXRmb3JtX2RhdGEgc3VyZmFjZV9nb190cHM2ODQ3MF9wZGF0
YSA9IHsKCS5yZWdfaW5pdF9kYXRhID0gewoJCVtUUFM2ODQ3MF9DT1JFXSA9ICZzdXJmYWNl
X2dvX3RwczY4NDcwX2NvcmVfcmVnX2luaXRfZGF0YSwKCQlbVFBTNjg0NzBfQU5BXSAgPSAm
c3VyZmFjZV9nb190cHM2ODQ3MF9hbmFfcmVnX2luaXRfZGF0YSwKCQlbVFBTNjg0NzBfVkNN
XSAgPSAmc3VyZmFjZV9nb190cHM2ODQ3MF92Y21fcmVnX2luaXRfZGF0YSwKCQlbVFBTNjg0
NzBfVlNJT10gPSAmc3VyZmFjZV9nb190cHM2ODQ3MF92c2lvX3JlZ19pbml0X2RhdGEsCgl9
LAp9OwoKc3RhdGljIHN0cnVjdCBncGlvZF9sb29rdXBfdGFibGUgc3VyZmFjZV9nb190cHM2
ODQ3MF9ncGlvcyA9IHsKCS5kZXZfaWQgPSAiaTJjLUlOVDM0N0E6MDAiLAoJLnRhYmxlID0g
ewoJCUdQSU9fTE9PS1VQKCJ0cHM2ODQ3MC1ncGlvIiwgOSwgInJlc2V0IiwgR1BJT19BQ1RJ
VkVfTE9XKSwKCQlHUElPX0xPT0tVUCgidHBzNjg0NzAtZ3BpbyIsIDcsICJwb3dlcmRvd24i
LCBHUElPX0FDVElWRV9MT1cpCgl9Cn07CgpzdGF0aWMgY29uc3Qgc3RydWN0IGludDM0NzJf
dHBzNjg0NzBfYm9hcmRfZGF0YSBzdXJmYWNlX2dvX3RwczY4NDcwX2JvYXJkX2RhdGEgPSB7
CgkuZGV2X25hbWUgPSAiaTJjLUlOVDM0NzI6MDUiLAoJLnRwczY4NDcwX2dwaW9fbG9va3Vw
X3RhYmxlID0gJnN1cmZhY2VfZ29fdHBzNjg0NzBfZ3Bpb3MsCgkudHBzNjg0NzBfcmVndWxh
dG9yX3BkYXRhID0gJnN1cmZhY2VfZ29fdHBzNjg0NzBfcGRhdGEsCn07CgpzdGF0aWMgY29u
c3Qgc3RydWN0IGRtaV9zeXN0ZW1faWQgaW50MzQ3Ml90cHM2ODQ3MF9ib2FyZF9kYXRhX3Rh
YmxlW10gPSB7Cgl7CgkJLm1hdGNoZXMgPSB7CgkJCURNSV9FWEFDVF9NQVRDSChETUlfU1lT
X1ZFTkRPUiwgIk1pY3Jvc29mdCBDb3Jwb3JhdGlvbiIpLAoJCQlETUlfRVhBQ1RfTUFUQ0go
RE1JX1BST0RVQ1RfTkFNRSwgIlN1cmZhY2UgR28iKSwKCQl9LAoJCS5kcml2ZXJfZGF0YSA9
ICh2b2lkICopJnN1cmZhY2VfZ29fdHBzNjg0NzBfYm9hcmRfZGF0YSwKCX0sCgl7CgkJLm1h
dGNoZXMgPSB7CgkJCURNSV9FWEFDVF9NQVRDSChETUlfU1lTX1ZFTkRPUiwgIk1pY3Jvc29m
dCBDb3Jwb3JhdGlvbiIpLAoJCQlETUlfRVhBQ1RfTUFUQ0goRE1JX1BST0RVQ1RfTkFNRSwg
IlN1cmZhY2UgR28gMiIpLAoJCX0sCgkJLmRyaXZlcl9kYXRhID0gKHZvaWQgKikmc3VyZmFj
ZV9nb190cHM2ODQ3MF9ib2FyZF9kYXRhLAoJfSwKCXsgfQp9OwoKY29uc3Qgc3RydWN0IGlu
dDM0NzJfdHBzNjg0NzBfYm9hcmRfZGF0YSAqaW50MzQ3Ml90cHM2ODQ3MF9nZXRfYm9hcmRf
ZGF0YShjb25zdCBjaGFyICpkZXZfbmFtZSkKewoJY29uc3Qgc3RydWN0IGludDM0NzJfdHBz
Njg0NzBfYm9hcmRfZGF0YSAqYm9hcmRfZGF0YTsKCWNvbnN0IHN0cnVjdCBkbWlfc3lzdGVt
X2lkICptYXRjaDsKCgltYXRjaCA9IGRtaV9maXJzdF9tYXRjaChpbnQzNDcyX3RwczY4NDcw
X2JvYXJkX2RhdGFfdGFibGUpOwoJd2hpbGUgKG1hdGNoKSB7CgkJYm9hcmRfZGF0YSA9IG1h
dGNoLT5kcml2ZXJfZGF0YTsKCQlpZiAoc3RyY21wKGJvYXJkX2RhdGEtPmRldl9uYW1lLCBk
ZXZfbmFtZSkgPT0gMCkKCQkJcmV0dXJuIGJvYXJkX2RhdGE7CgoJCWRtaV9maXJzdF9tYXRj
aCgrK21hdGNoKTsKCX0KCglyZXR1cm4gTlVMTDsKfQo=
--------------xU8cQ3voysiv0Z2zjroxEWAd--

