Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A16FC790851
	for <lists+linux-media@lfdr.de>; Sat,  2 Sep 2023 16:59:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232503AbjIBOzs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 Sep 2023 10:55:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232495AbjIBOzr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 2 Sep 2023 10:55:47 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08C1B10F3
        for <linux-media@vger.kernel.org>; Sat,  2 Sep 2023 07:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1693666495;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=+exIUWW1jAwDBRXMe02hQSjfTT6uLeSFjsaKA6aJ3uU=;
        b=B1+/wun+WlCVrQk4jGTlewPuJUHwZ3WiZFwTILTZ1I4bJ360KWTlCEBUnqcxsFQG3rwMpC
        W6jFD9dxCBRsK5vj7XCzBTmnAMuPV22EYt4q7/45v2a6F56ZCKaKdyPg4b0OSdS2pZXYTc
        Lf36irIUEneJgOhGWtdJwt8tIgybT7o=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-338-ReLUahoqOFqfoLdNsDdLHw-1; Sat, 02 Sep 2023 10:54:53 -0400
X-MC-Unique: ReLUahoqOFqfoLdNsDdLHw-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-99bebfada8cso3152966b.1
        for <linux-media@vger.kernel.org>; Sat, 02 Sep 2023 07:54:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693666491; x=1694271291;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+exIUWW1jAwDBRXMe02hQSjfTT6uLeSFjsaKA6aJ3uU=;
        b=hWcRN+BVogcWIF2LCV6cZe4gkWPcQpEsuh16S7XjPzzdoNsIvMOHVAn+GafrWBljGP
         +4Yr71I8B+qJhRO8V4brUOc+8UqTRtnGsqv+IcDzkJv4b+nbT4y7dqU993SuU2VlJYrf
         Ivpz+fBYpdViHsk3dm0+JFiuEytiazb9gRAlhTT+toJZS9YVum7Orqwx9D5gqUtXhLRl
         AIjVXvwsCLrjhpMD3eosQIE29DAn6br482zVM1FN63VmMYtrRTenKoq7PYgIfKo4STXY
         ISDmycSgwYFAHkdUNhsUznDOLwKiMstZ5l74ZvOyqAfUh4vQcySXB5CuA82qoaAQbAnY
         iKGw==
X-Gm-Message-State: AOJu0Yxqr9jiwtdUldCalwyNBmOogq76YFy5SFMIXHY1N0tTgmwxIvCF
        epfnhyZLMbHM/pW2ls+2hNQvAh+QkQXLP7UTnQ4onfP0pu+FbMmJP00h0ZUPga/q9SpjnD5g9Ro
        89PqPotkSIWoKflCntTKCfyzLrX9T4wA=
X-Received: by 2002:a17:907:762b:b0:9a1:e8c0:7e30 with SMTP id jy11-20020a170907762b00b009a1e8c07e30mr3654743ejc.7.1693666491634;
        Sat, 02 Sep 2023 07:54:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcEAMOLoeEuBcMC2HsNR2/fAzkzDx1CQINQtDkMmBPKG/ZY6K6m3M1potErLvN/Dz7z9w2Xg==
X-Received: by 2002:a17:907:762b:b0:9a1:e8c0:7e30 with SMTP id jy11-20020a170907762b00b009a1e8c07e30mr3654727ejc.7.1693666491207;
        Sat, 02 Sep 2023 07:54:51 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id q6-20020a170906940600b0098e78ff1a87sm3478248ejx.120.2023.09.02.07.54.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Sep 2023 07:54:49 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------ChS3dYsSpNw06zQKtztEJsu4"
Message-ID: <1d46186b-24a6-3ae9-ccc1-0ada0f068313@redhat.com>
Date:   Sat, 2 Sep 2023 16:54:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 00/15] Intel IPU6 and IPU6 input system drivers
To:     Claus Stovgaard <claus.stovgaard@gmail.com>,
        Bingbu Cao <bingbu.cao@linux.intel.com>, bingbu.cao@intel.com,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com
Cc:     ilpo.jarvinen@linux.intel.com, tfiga@chromium.org,
        senozhatsky@chromium.org, andriy.shevchenko@linux.intel.com,
        hdegoede@redhat.com, tomi.valkeinen@ideasonboard.com,
        tian.shu.qiu@intel.com, hongju.wang@intel.com
References: <20230727071558.1148653-1-bingbu.cao@intel.com>
 <769ebe9f8eb88b2c07eae5910fc7d79c1ff888cb.camel@gmail.com>
 <5fb07c7d-390c-d7ae-c74b-8e03c75f636c@linux.intel.com>
 <0a381077-c07a-ed40-c53e-5e36177bd5f2@linux.intel.com>
 <907f992d4e333f090418f39ebd59bf8ac1fb5e3f.camel@gmail.com>
 <d451bbec67358373ca8495544cc0802233108a03.camel@gmail.com>
 <1d03c5f9-1813-40f0-f280-520e2da38e09@hansg.org>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <1d03c5f9-1813-40f0-f280-520e2da38e09@hansg.org>
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a multi-part message in MIME format.
--------------ChS3dYsSpNw06zQKtztEJsu4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi All,

On 8/31/23 23:24, Hans de Goede wrote:
> Hi Bingbu, Claus,
> 
> On 8/21/23 12:07, Claus Stovgaard wrote:
>> Bingbu
>>
>> On Mon, 2023-08-21 at 08:55 +0200, Claus Stovgaard wrote:
>>> Bingbu
>>>
>>> On Mon, 2023-08-21 at 14:22 +0800, Bingbu Cao wrote:
>>>>
>>>> Claus,
>>>>
>>>>
>>>> On 8/21/23 11:14 AM, Bingbu Cao wrote:
>>>>
>>>>
>>>> I see that the ivsc driver has not been in master branch. Before
>>>> that,
>>>> could you try several hack to check whether camera can work on
>>>> master?
>>>>
>>>> https://github.com/bingbucao/linux/commits/ipu_dev
>>>>
>>>> 7ebff51284d9 media: ov01a10: hack ivsc to make camera can work
>>>> 01cc9f3d1b61 i2c: ljca: Call acpi_dev_clear_dependencies()
>>>> 92e5d122e105 vsc: Defer firmware loading to avoid long probing time
>>>> 5f5d5f0df06b driver: ivsc: add intel ivsc driver
>>>> 0f4819dec533 Revert "gpio: Add support for Intel LJCA USB GPIO
>>>> driver"
>>>
>>> Thanks for your quick reply.
>>>
>>> I was missing understanding of ivsc when I wrote the mail yesterday.
>>> Got some basic understanding yesterday after I wrote, and big thanks
>>> for confirming it, and also thanks for your ipu_dev branch. Has just
>>> cloned it, and is building as I write.
>>>
>>> Just fyi, I was trying to hack something together yesterday, and got
>>> further, but not yet working.
>>>
>>> My hack was to combine the out-of-tree ivsc drivers and firmware from
>>>
>>> * https://github.com/intel/ivsc-firmware.git
>>> * https://github.com/intel/ivsc-driver.git
>>>
>>> Though noticed that I need some changes to the sensor driver so was
>>> also building all the drivers from ipu6-drivers (with minor changes
>>> to
>>> get_pages) as out-of-tree modules.
>>>
>>> * https://github.com/intel/ipu6-drivers.git 
>>>
>>> Here I used everything beside media/pci/*.ko files. I could see the
>>> sensor and got further, but was missing the last.
>>>
>>> Looking forward to try your branch. Looks much cleaner, and would be
>>> nice to get working :)
>>>
>>
>> I got it to work on Dell XPS 9320.
>> With some minor changes compared to your guide in Documentation/admin-
>> guide/media/ipu6-isys.rst
>>
>> [root@xps-1 ]# uname -a
>> Linux xps-1 6.5.0-rc7-g7ebff51284d9 #1 SMP PREEMPT_DYNAMIC Mon Aug 21
>> 09:02:20 CEST 2023 x86_64 GNU/Linux
>>
>> [root@xps-1 ]# media-ctl -d /dev/media0 -p | tail -n10
>>
>> - entity 2149: ov01a10 16-0036 (1 pad, 1 link)
>>                type V4L2 subdev subtype Sensor flags 0
>>                device node name /dev/v4l-subdev4
>>         pad0: Source
>>                 [fmt:SBGGR10_1X10/1280x800 field:none colorspace:raw
>>                  crop.bounds:(0,0)/1296x816
>>                  crop:(8,8)/1280x800]
>>                 -> "Intel IPU6 CSI2 2":0 []
>>
>> So i2c is 16-0036 - and we use it for setup like your guide.
>>
>> export MDEV=/dev/media0
>>
>> media-ctl -d $MDEV -l "\"ov01a10 17-0036\":0 -> \"Intel IPU6 CSI2
>> 2\":0[1]"
>>
>> media-ctl -d $MDEV -V "\"ov01a10 17-0036\":0 [fmt:SBGGR10/1280x800]"
>> media-ctl -d $MDEV -V "\"Intel IPU6 CSI2 2\":0 [fmt:SBGGR10/1280x800]"
>> media-ctl -d $MDEV -V "\"Intel IPU6 CSI2 2\":1 [fmt:SBGGR10/1280x800]"
>>
>> media-ctl -d $MDEV -l "\"ov01a10 17-0036\":0 -> \"Intel IPU6 CSI2
>> 2\":0[1]"
>> media-ctl -d $MDEV -l "\"Intel IPU6 CSI2 2\":1 ->\"Intel IPU6 ISYS
>> Capture 0\":0[5]"
>>
>> Though yavta does not work in the way as described in the guide.
>>
>> [root@xps-1 ]# yavta --data-prefix -u -c10 -n5 -I -s 1280x800 --
>> file=/tmp/frame-#.bin -f SBGGR10 /dev/video0
>> Device /dev/video0 opened.
>> Device `ipu6' on `PCI:0000:00:05.0' (driver 'isys') supports video,
>> capture, with mplanes.
>> Video format set: SBGGR10 (30314742) 1280x800 field none, 1 planes: 
>>  * Stride 2560, buffer size 2050560
>> Video format: SBGGR10 (30314742) 1280x800 field none, 1 planes: 
>>  * Stride 2560, buffer size 2050560
>> Unable to request buffers: Invalid argument (22).
>>
>>
>> So I changed to use v4l2-ctl
>>
>> [root@xps-1 ]# v4l2-ctl -d /dev/video0 --set-fmt-video
>> width=1280,height=800,pixelformat=BG10 --stream-mmap --stream-count=1 -
>> -stream-to=frame.bin
>>
>> With this I created raw data in BG10 format, and later used a small
>> python script with numpy and opencv to look at the data.
>>
>> #!/usr/bin/env python3
>> # Demosaicing Bayer Raw image
>>
>> import cv2
>> import numpy as np
>>
>> width = 1280
>> height = 800
>>
>> with open("frame.bin", "rb") as rawimg:
>>     # Read the bayer data
>>     data = np.fromfile(rawimg, np.uint16, width * height)
>>     bayer = np.reshape(data, (height, width))
>>
>>     # Just a offset gain to be able to see something
>>     for x in range(0, len(bayer)):
>>         for y in range(0, len(bayer[0])):
>>             bayer[x, y] = (bayer[x,y] << 8)
>>
>>     rgb = cv2.cvtColor(bayer, cv2.COLOR_BayerBGGR2RGB)
>>
>>     cv2.imshow('rgb', rgb)
>>     cv2.waitKey()
>>     cv2.destroyAllWindows()
>>
>>
>> Thanks for the help, and now we know what is needed to make it work on
>> top of yesterdays rc7
> 
> 
> Bingbu, thank you for the series. Claus, thank you for the python
> test-script.
> 
> I've just given this a test-run on top of a recent checkout
> of media-staging/master, so on top of the drivers/media
> changes headed for 6.6 .
> 
> And with the attached changes + the ov2740 changes from
> the github ipu6-drevers repo I got this working on
> a lenovo thinkpad x1 yoga with an ov2740 driver.
> 
> I've attached the necessary changes to adjust the new ipu6
> code for the v4l2-async changes which are queued up for
> kernel 6.6 .

Attached is one more patch which fixes an oops when
using lockdep.

With both patches applied this is:

Tested-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


--------------ChS3dYsSpNw06zQKtztEJsu4
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-media-ipu6-bus-Set-pm-domain-later.patch"
Content-Disposition: attachment;
 filename="0001-media-ipu6-bus-Set-pm-domain-later.patch"
Content-Transfer-Encoding: base64

RnJvbSA4MGY4MmJjM2I0NWZjMjBlMTUyYTlhM2RjZWViMDhkNTc3M2U1MGFkIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQu
Y29tPgpEYXRlOiBTYXQsIDIgU2VwIDIwMjMgMTY6MzQ6MDkgKzAyMDAKU3ViamVjdDogW1BB
VENIXSBtZWRpYTogaXB1Ni1idXM6IFNldCBwbS1kb21haW4gbGF0ZXIKCk1vdmUgdGhlIGRl
dl9wbV9kb21haW5fc2V0KCkgY2FsbCB0byBhZnRlciB0aGUgYXV4aWxpYXJ5X2RldmljZV9p
bml0KCkKY2FsbCBzbyB0aGF0IGF1eGRldi0+ZGV2LnBvd2VyLmxvY2sgaGFzIGJlZW4gaW5p
dGlhbGl6ZWQuCgpUaGlzIGZpeGVzIHRoZSBmb2xsb3dpbmcgbG9ja2RlcCB3YXJuaW5nIC8g
YmFja3RyYWNlOgoKWyAgIDYxLjM4MTUzOF0gSU5GTzogdHJ5aW5nIHRvIHJlZ2lzdGVyIG5v
bi1zdGF0aWMga2V5LgpbICAgNjEuMzgxNTQwXSBUaGUgY29kZSBpcyBmaW5lIGJ1dCBuZWVk
cyBsb2NrZGVwIGFubm90YXRpb24sIG9yIG1heWJlClsgICA2MS4zODE1NDFdIHlvdSBkaWRu
J3QgaW5pdGlhbGl6ZSB0aGlzIG9iamVjdCBiZWZvcmUgdXNlPwpbICAgNjEuMzgxNTQyXSB0
dXJuaW5nIG9mZiB0aGUgbG9ja2luZyBjb3JyZWN0bmVzcyB2YWxpZGF0b3IuClsgICA2MS4z
ODE1NDRdIENQVTogOCBQSUQ6IDE4MzcgQ29tbTogKHVkZXYtd29ya2VyKSBUYWludGVkOiBH
ICAgICAgICAgICAgRSAgICAgIDYuNS4wKyAjMjgKWyAgIDYxLjM4MTU0N10gSGFyZHdhcmUg
bmFtZTogTEVOT1ZPIDIxSFFTSVQwMjUvMjFIUVNJVDAyNSwgQklPUyBOM1hFVDM3VyAoMS4x
MiApIDA0LzE4LzIwMjMKWyAgIDYxLjM4MTU0OF0gQ2FsbCBUcmFjZToKWyAgIDYxLjM4MTU1
MF0gIDxUQVNLPgpbICAgNjEuMzgxNTUyXSAgZHVtcF9zdGFja19sdmwrMHg1Ny8weDkwClsg
ICA2MS4zODE1NThdICByZWdpc3Rlcl9sb2NrX2NsYXNzKzB4NDgwLzB4NDkwClsgICA2MS4z
ODE1NjNdICA/IF9fbG9ja19hY3F1aXJlKzB4NDA1LzB4MjE5MApbICAgNjEuMzgxNTY4XSAg
X19sb2NrX2FjcXVpcmUrMHg3Ni8weDIxOTAKWyAgIDYxLjM4MTU3Ml0gIGxvY2tfYWNxdWly
ZSsweGM0LzB4MjkwClsgICA2MS4zODE1NzVdICA/IGRldmljZV9wbV9jaGVja19jYWxsYmFj
a3MrMHgxZC8weDEwMApbICAgNjEuMzgxNTc4XSAgX3Jhd19zcGluX2xvY2tfaXJxc2F2ZSsw
eDQ3LzB4NzAKWyAgIDYxLjM4MTU4MV0gID8gZGV2aWNlX3BtX2NoZWNrX2NhbGxiYWNrcysw
eDFkLzB4MTAwClsgICA2MS4zODE1ODJdICBkZXZpY2VfcG1fY2hlY2tfY2FsbGJhY2tzKzB4
MWQvMHgxMDAKWyAgIDYxLjM4MTU4NV0gIGlwdTZfYnVzX2luaXRpYWxpemVfZGV2aWNlKzB4
ZmEvMHgxNjAgW2ludGVsX2lwdTZdClsgICA2MS4zODE1OTFdICBpcHU2X2NvbmZpZ3VyZV9z
cGMrMHhiZTUvMHgxM2EwIFtpbnRlbF9pcHU2XQo8c25pcD4KClNpZ25lZC1vZmYtYnk6IEhh
bnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9tZWRpYS9w
Y2kvaW50ZWwvaXB1Ni9pcHU2LWJ1cy5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlh
L3BjaS9pbnRlbC9pcHU2L2lwdTYtYnVzLmMgYi9kcml2ZXJzL21lZGlhL3BjaS9pbnRlbC9p
cHU2L2lwdTYtYnVzLmMKaW5kZXggMGU1OGFjY2YwNjU0Li5iYjljYjJjNjdhMWUgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvbWVkaWEvcGNpL2ludGVsL2lwdTYvaXB1Ni1idXMuYworKysgYi9k
cml2ZXJzL21lZGlhL3BjaS9pbnRlbC9pcHU2L2lwdTYtYnVzLmMKQEAgLTExMCw3ICsxMTAs
NiBAQCBpcHU2X2J1c19pbml0aWFsaXplX2RldmljZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwg
c3RydWN0IGRldmljZSAqcGFyZW50LAogCWF1eGRldi0+ZGV2LmRtYV9tYXNrID0gJmFkZXYt
PmRtYV9tYXNrOwogCWF1eGRldi0+ZGV2LmRtYV9wYXJtcyA9IHBkZXYtPmRldi5kbWFfcGFy
bXM7CiAJYXV4ZGV2LT5kZXYuY29oZXJlbnRfZG1hX21hc2sgPSBhZGV2LT5kbWFfbWFzazsK
LQlkZXZfcG1fZG9tYWluX3NldCgmYXV4ZGV2LT5kZXYsICZpcHU2X2J1c19wbV9kb21haW4p
OwogCiAJcmV0ID0gYXV4aWxpYXJ5X2RldmljZV9pbml0KGF1eGRldik7CiAJaWYgKHJldCA8
IDApIHsKQEAgLTEyMCw2ICsxMTksOCBAQCBpcHU2X2J1c19pbml0aWFsaXplX2RldmljZShz
dHJ1Y3QgcGNpX2RldiAqcGRldiwgc3RydWN0IGRldmljZSAqcGFyZW50LAogCQlyZXR1cm4g
RVJSX1BUUihyZXQpOwogCX0KIAorCWRldl9wbV9kb21haW5fc2V0KCZhdXhkZXYtPmRldiwg
JmlwdTZfYnVzX3BtX2RvbWFpbik7CisKIAlwbV9ydW50aW1lX2ZvcmJpZCgmYWRldi0+YXV4
ZGV2LmRldik7CiAJcG1fcnVudGltZV9lbmFibGUoJmFkZXYtPmF1eGRldi5kZXYpOwogCi0t
IAoyLjQxLjAKCg==

--------------ChS3dYsSpNw06zQKtztEJsu4--

