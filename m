Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BE4478F49C
	for <lists+linux-media@lfdr.de>; Thu, 31 Aug 2023 23:31:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235733AbjHaVbF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 31 Aug 2023 17:31:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235570AbjHaVbF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 31 Aug 2023 17:31:05 -0400
X-Greylist: delayed 395 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 31 Aug 2023 14:31:00 PDT
Received: from mx.kolabnow.com (mx.kolabnow.com [212.103.80.154])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2A77107
        for <linux-media@vger.kernel.org>; Thu, 31 Aug 2023 14:31:00 -0700 (PDT)
Received: from localhost (unknown [127.0.0.1])
        by mx.kolabnow.com (Postfix) with ESMTP id 4D92920B3665;
        Thu, 31 Aug 2023 23:24:23 +0200 (CEST)
Authentication-Results: ext-mx-out011.mykolab.com (amavis);
 dkim=pass (4096-bit key) reason="pass (just generated, assumed good)"
 header.d=kolabnow.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
        in-reply-to:from:from:content-language:references:subject
        :subject:mime-version:date:date:message-id:content-type
        :content-type:received:received:received; s=dkim20160331; t=
        1693517061; x=1695331462; bh=lOcHIOssZ+mgOX0i7tnRS8bvYkdiesJXT1g
        9jTT0mH4=; b=oMTSExFkXlgTXKLncobSFgep0aVsuSP8NxpODpFbC/G1y8AaNvV
        n379docpOww5b/O1+HTvI6WCTeKYivMwuw3cS5g30ux+vWvee6OE2RnnByMyjqSR
        ao/d7P/DgxYzx3UBDJMehQ906iyTqnFYTqHkwD4xWjkmOCzLHYNQTigq2btDUthz
        7bn/bZ53WBo850jxFNwdgOBFiNamXb1ET9IpN815UFkDQMkL4wOLZSMeSrES+KFM
        tG+A9/zCfSzcTKpX8XnT0hNTZWTD5ZkddimilFfBhpp5jlroABkQWbyEFDOAFjQY
        EY4UHCJzQ/uT32AUKINXd5EgEkJHTE1q+Jf0B8HXPIBEqTuFfAqmwwqTQs3UT08d
        3BzdJjDRmusWEzvoGlJu6EIkBHS4vsYh+GsljgIWPDiXwiBupBqHVBiv6l8jQ0Qj
        zES96gH6GY9+hHA7pDovGjSDSOaNhKfJ0/5bc7Tv/GC0aZrc6ldTT4pOmFvUOwHB
        RP0pcoftnRDgLosuuAbZ//XIAV8gjSl0gJdFUbZL2MFQTO/zfd2KAisRBkilItXM
        wFiwiP+A0zTOkyml6HrUhn91J8gSJn1o4j4/KGOVgYcndsgNnLNDgPr07mEh9lYF
        OI25SpMLvlJMjriYG0NmkkN6Zq4PbvqKXKyZACwn0zDN+e73jULBea/0=
X-Virus-Scanned: amavis at mykolab.com
X-Spam-Score: -1
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
Received: from mx.kolabnow.com ([127.0.0.1])
 by localhost (ext-mx-out011.mykolab.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id vepXxDx-6QAf; Thu, 31 Aug 2023 23:24:21 +0200 (CEST)
Received: from int-mx009.mykolab.com (unknown [10.9.13.9])
        by mx.kolabnow.com (Postfix) with ESMTPS id E04A820B3664;
        Thu, 31 Aug 2023 23:24:19 +0200 (CEST)
Received: from ext-subm010.mykolab.com (unknown [10.9.6.10])
        by int-mx009.mykolab.com (Postfix) with ESMTPS id 5CA29209CCD5;
        Thu, 31 Aug 2023 23:24:19 +0200 (CEST)
Content-Type: multipart/mixed; boundary="------------OBPNzRreJeyYXmXx7GJZ4heB"
Message-ID: <1d03c5f9-1813-40f0-f280-520e2da38e09@hansg.org>
Date:   Thu, 31 Aug 2023 23:24:17 +0200
MIME-Version: 1.0
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
Content-Language: en-US, nl
From:   Hans de Goede <hans@hansg.org>
In-Reply-To: <d451bbec67358373ca8495544cc0802233108a03.camel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a multi-part message in MIME format.
--------------OBPNzRreJeyYXmXx7GJZ4heB
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Bingbu, Claus,

On 8/21/23 12:07, Claus Stovgaard wrote:
> Bingbu
> 
> On Mon, 2023-08-21 at 08:55 +0200, Claus Stovgaard wrote:
>> Bingbu
>>
>> On Mon, 2023-08-21 at 14:22 +0800, Bingbu Cao wrote:
>>>
>>> Claus,
>>>
>>>
>>> On 8/21/23 11:14 AM, Bingbu Cao wrote:
>>>
>>>
>>> I see that the ivsc driver has not been in master branch. Before
>>> that,
>>> could you try several hack to check whether camera can work on
>>> master?
>>>
>>> https://github.com/bingbucao/linux/commits/ipu_dev
>>>
>>> 7ebff51284d9 media: ov01a10: hack ivsc to make camera can work
>>> 01cc9f3d1b61 i2c: ljca: Call acpi_dev_clear_dependencies()
>>> 92e5d122e105 vsc: Defer firmware loading to avoid long probing time
>>> 5f5d5f0df06b driver: ivsc: add intel ivsc driver
>>> 0f4819dec533 Revert "gpio: Add support for Intel LJCA USB GPIO
>>> driver"
>>
>> Thanks for your quick reply.
>>
>> I was missing understanding of ivsc when I wrote the mail yesterday.
>> Got some basic understanding yesterday after I wrote, and big thanks
>> for confirming it, and also thanks for your ipu_dev branch. Has just
>> cloned it, and is building as I write.
>>
>> Just fyi, I was trying to hack something together yesterday, and got
>> further, but not yet working.
>>
>> My hack was to combine the out-of-tree ivsc drivers and firmware from
>>
>> * https://github.com/intel/ivsc-firmware.git
>> * https://github.com/intel/ivsc-driver.git
>>
>> Though noticed that I need some changes to the sensor driver so was
>> also building all the drivers from ipu6-drivers (with minor changes
>> to
>> get_pages) as out-of-tree modules.
>>
>> * https://github.com/intel/ipu6-drivers.git 
>>
>> Here I used everything beside media/pci/*.ko files. I could see the
>> sensor and got further, but was missing the last.
>>
>> Looking forward to try your branch. Looks much cleaner, and would be
>> nice to get working :)
>>
> 
> I got it to work on Dell XPS 9320.
> With some minor changes compared to your guide in Documentation/admin-
> guide/media/ipu6-isys.rst
> 
> [root@xps-1 ]# uname -a
> Linux xps-1 6.5.0-rc7-g7ebff51284d9 #1 SMP PREEMPT_DYNAMIC Mon Aug 21
> 09:02:20 CEST 2023 x86_64 GNU/Linux
> 
> [root@xps-1 ]# media-ctl -d /dev/media0 -p | tail -n10
> 
> - entity 2149: ov01a10 16-0036 (1 pad, 1 link)
>                type V4L2 subdev subtype Sensor flags 0
>                device node name /dev/v4l-subdev4
>         pad0: Source
>                 [fmt:SBGGR10_1X10/1280x800 field:none colorspace:raw
>                  crop.bounds:(0,0)/1296x816
>                  crop:(8,8)/1280x800]
>                 -> "Intel IPU6 CSI2 2":0 []
> 
> So i2c is 16-0036 - and we use it for setup like your guide.
> 
> export MDEV=/dev/media0
> 
> media-ctl -d $MDEV -l "\"ov01a10 17-0036\":0 -> \"Intel IPU6 CSI2
> 2\":0[1]"
> 
> media-ctl -d $MDEV -V "\"ov01a10 17-0036\":0 [fmt:SBGGR10/1280x800]"
> media-ctl -d $MDEV -V "\"Intel IPU6 CSI2 2\":0 [fmt:SBGGR10/1280x800]"
> media-ctl -d $MDEV -V "\"Intel IPU6 CSI2 2\":1 [fmt:SBGGR10/1280x800]"
> 
> media-ctl -d $MDEV -l "\"ov01a10 17-0036\":0 -> \"Intel IPU6 CSI2
> 2\":0[1]"
> media-ctl -d $MDEV -l "\"Intel IPU6 CSI2 2\":1 ->\"Intel IPU6 ISYS
> Capture 0\":0[5]"
> 
> Though yavta does not work in the way as described in the guide.
> 
> [root@xps-1 ]# yavta --data-prefix -u -c10 -n5 -I -s 1280x800 --
> file=/tmp/frame-#.bin -f SBGGR10 /dev/video0
> Device /dev/video0 opened.
> Device `ipu6' on `PCI:0000:00:05.0' (driver 'isys') supports video,
> capture, with mplanes.
> Video format set: SBGGR10 (30314742) 1280x800 field none, 1 planes: 
>  * Stride 2560, buffer size 2050560
> Video format: SBGGR10 (30314742) 1280x800 field none, 1 planes: 
>  * Stride 2560, buffer size 2050560
> Unable to request buffers: Invalid argument (22).
> 
> 
> So I changed to use v4l2-ctl
> 
> [root@xps-1 ]# v4l2-ctl -d /dev/video0 --set-fmt-video
> width=1280,height=800,pixelformat=BG10 --stream-mmap --stream-count=1 -
> -stream-to=frame.bin
> 
> With this I created raw data in BG10 format, and later used a small
> python script with numpy and opencv to look at the data.
> 
> #!/usr/bin/env python3
> # Demosaicing Bayer Raw image
> 
> import cv2
> import numpy as np
> 
> width = 1280
> height = 800
> 
> with open("frame.bin", "rb") as rawimg:
>     # Read the bayer data
>     data = np.fromfile(rawimg, np.uint16, width * height)
>     bayer = np.reshape(data, (height, width))
> 
>     # Just a offset gain to be able to see something
>     for x in range(0, len(bayer)):
>         for y in range(0, len(bayer[0])):
>             bayer[x, y] = (bayer[x,y] << 8)
> 
>     rgb = cv2.cvtColor(bayer, cv2.COLOR_BayerBGGR2RGB)
> 
>     cv2.imshow('rgb', rgb)
>     cv2.waitKey()
>     cv2.destroyAllWindows()
> 
> 
> Thanks for the help, and now we know what is needed to make it work on
> top of yesterdays rc7


Bingbu, thank you for the series. Claus, thank you for the python
test-script.

I've just given this a test-run on top of a recent checkout
of media-staging/master, so on top of the drivers/media
changes headed for 6.6 .

And with the attached changes + the ov2740 changes from
the github ipu6-drevers repo I got this working on
a lenovo thinkpad x1 yoga with an ov2740 driver.

I've attached the necessary changes to adjust the new ipu6
code for the v4l2-async changes which are queued up for
kernel 6.6 .

Regards,

Hans

--------------OBPNzRreJeyYXmXx7GJZ4heB
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-media-ipu6-Adjust-for-pending-6.6-v4l2-async-API-cha.patch"
Content-Disposition: attachment;
 filename*0="0001-media-ipu6-Adjust-for-pending-6.6-v4l2-async-API-cha.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSAzN2ExOGY3Njg0MzQwYjg2NTViNmYwYzcxMmIxNWI0YmM2OTY2YTNkIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQu
Y29tPgpEYXRlOiBUaHUsIDMxIEF1ZyAyMDIzIDE0OjQ4OjM4ICswMjAwClN1YmplY3Q6IFtQ
QVRDSF0gbWVkaWE6IGlwdTY6IEFkanVzdCBmb3IgKHBlbmRpbmcpIDYuNiB2NGwyLWFzeW5j
IEFQSSBjaGFuZ2VzCgpBZGp1c3QgdGhlIGlwdTYgY29kZSB0byB3b3JrIHdpdGggdGhlIChw
ZW5kaW5nKSA2LjYgdjRsMi1hc3luYyBBUEkgY2hhbmdlcy4KClNpZ25lZC1vZmYtYnk6IEhh
bnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+Ci0tLQogLi4uL21lZGlhL3BjaS9p
bnRlbC9pcHU2L2lwdTYtaXN5cy1tY2QtcGh5LmMgIHwgIDggKy0tCiBkcml2ZXJzL21lZGlh
L3BjaS9pbnRlbC9pcHU2L2lwdTYtaXN5cy5jICAgICAgfCA2NSArKysrKysrKysrKystLS0t
LS0tCiBkcml2ZXJzL21lZGlhL3BjaS9pbnRlbC9pcHU2L2lwdTYtaXN5cy5oICAgICAgfCAg
MiArLQogZHJpdmVycy9tZWRpYS9wY2kvaW50ZWwvaXB1Ni9pcHU2LmMgICAgICAgICAgIHwg
IDUgKy0KIDQgZmlsZXMgY2hhbmdlZCwgNDggaW5zZXJ0aW9ucygrKSwgMzIgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wY2kvaW50ZWwvaXB1Ni9pcHU2LWlz
eXMtbWNkLXBoeS5jIGIvZHJpdmVycy9tZWRpYS9wY2kvaW50ZWwvaXB1Ni9pcHU2LWlzeXMt
bWNkLXBoeS5jCmluZGV4IDIyNmQ2NDdkMWRhMC4uNTYyZThhODMwY2MzIDEwMDY0NAotLS0g
YS9kcml2ZXJzL21lZGlhL3BjaS9pbnRlbC9pcHU2L2lwdTYtaXN5cy1tY2QtcGh5LmMKKysr
IGIvZHJpdmVycy9tZWRpYS9wY2kvaW50ZWwvaXB1Ni9pcHU2LWlzeXMtbWNkLXBoeS5jCkBA
IC01ODMsMTIgKzU4MywxMiBAQCBzdGF0aWMgaW50IGlwdTZfaXN5c19tY2RfcGh5X2NvbW1v
bl9pbml0KHN0cnVjdCBpcHU2X2lzeXMgKmlzeXMpCiAJc3RydWN0IGlwdTZfZGV2aWNlICpp
c3AgPSBhZGV2LT5pc3A7CiAJdm9pZCBfX2lvbWVtICppc3BfYmFzZSA9IGlzcC0+YmFzZTsK
IAlzdHJ1Y3Qgc2Vuc29yX2FzeW5jX3N1YmRldiAqc19hc2Q7Ci0Jc3RydWN0IHY0bDJfYXN5
bmNfc3ViZGV2ICphc2Q7CisJc3RydWN0IHY0bDJfYXN5bmNfY29ubmVjdGlvbiAqYXNkOwog
CXZvaWQgX19pb21lbSAqcGh5X2Jhc2U7CiAJdW5zaWduZWQgaW50IHBoeV9pZDsKIAl1bnNp
Z25lZCBpbnQgaTsKIAotCWxpc3RfZm9yX2VhY2hfZW50cnkoYXNkLCAmaXN5cy0+bm90aWZp
ZXIuYXNkX2xpc3QsIGFzZF9saXN0KSB7CisJbGlzdF9mb3JfZWFjaF9lbnRyeShhc2QsICZp
c3lzLT5ub3RpZmllci5kb25lX2xpc3QsIGFzY19lbnRyeSkgewogCQlzX2FzZCA9IGNvbnRh
aW5lcl9vZihhc2QsIHN0cnVjdCBzZW5zb3JfYXN5bmNfc3ViZGV2LCBhc2QpOwogCQlwaHlf
aWQgPSBzX2FzZC0+Y3NpMi5wb3J0IC8gNDsKIAkJcGh5X2Jhc2UgPSBpc3BfYmFzZSArIElQ
VTZfSVNZU19NQ0RfUEhZX0JBU0UocGh5X2lkKTsKQEAgLTY0MSwxMiArNjQxLDEyIEBAIHN0
YXRpYyBpbnQgaXB1Nl9pc3lzX21jZF9waHlfY29uZmlnKHN0cnVjdCBpcHU2X2lzeXMgKmlz
eXMpCiAJc3RydWN0IGlwdTZfZGV2aWNlICppc3AgPSBhZGV2LT5pc3A7CiAJdm9pZCBfX2lv
bWVtICppc3BfYmFzZSA9IGlzcC0+YmFzZTsKIAlzdHJ1Y3Qgc2Vuc29yX2FzeW5jX3N1YmRl
diAqc19hc2Q7CisJc3RydWN0IHY0bDJfYXN5bmNfY29ubmVjdGlvbiAqYXNkOwogCXN0cnVj
dCBpcHU2X2lzeXNfY3NpMl9jb25maWcgY2ZnOwotCXN0cnVjdCB2NGwyX2FzeW5jX3N1YmRl
diAqYXNkOwogCXVuc2lnbmVkIGludCBpLCBwaHlfcG9ydCwgcGh5X2lkOwogCXZvaWQgX19p
b21lbSAqcGh5X2Jhc2U7CiAKLQlsaXN0X2Zvcl9lYWNoX2VudHJ5KGFzZCwgJmlzeXMtPm5v
dGlmaWVyLmFzZF9saXN0LCBhc2RfbGlzdCkgeworCWxpc3RfZm9yX2VhY2hfZW50cnkoYXNk
LCAmaXN5cy0+bm90aWZpZXIuZG9uZV9saXN0LCBhc2NfZW50cnkpIHsKIAkJc19hc2QgPSBj
b250YWluZXJfb2YoYXNkLCBzdHJ1Y3Qgc2Vuc29yX2FzeW5jX3N1YmRldiwgYXNkKTsKIAkJ
Y2ZnLnBvcnQgPSBzX2FzZC0+Y3NpMi5wb3J0OwogCQljZmcubmxhbmVzID0gc19hc2QtPmNz
aTIubmxhbmVzOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wY2kvaW50ZWwvaXB1Ni9p
cHU2LWlzeXMuYyBiL2RyaXZlcnMvbWVkaWEvcGNpL2ludGVsL2lwdTYvaXB1Ni1pc3lzLmMK
aW5kZXggYzVkYjU4ZjEyYzkzLi5kZjgxZTgxYTEwMjkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
bWVkaWEvcGNpL2ludGVsL2lwdTYvaXB1Ni1pc3lzLmMKKysrIGIvZHJpdmVycy9tZWRpYS9w
Y2kvaW50ZWwvaXB1Ni9pcHU2LWlzeXMuYwpAQCAtNjY0LDcgKzY2NCw3IEBAIHN0YXRpYyBp
bnQgaXN5c19pd2FrZV93YXRlcm1hcmtfY2xlYW51cChzdHJ1Y3QgaXB1Nl9pc3lzICppc3lz
KQogLyogVGhlIC5ib3VuZCgpIG5vdGlmaWVyIGNhbGxiYWNrIHdoZW4gYSBtYXRjaCBpcyBm
b3VuZCAqLwogc3RhdGljIGludCBpc3lzX25vdGlmaWVyX2JvdW5kKHN0cnVjdCB2NGwyX2Fz
eW5jX25vdGlmaWVyICpub3RpZmllciwKIAkJCSAgICAgICBzdHJ1Y3QgdjRsMl9zdWJkZXYg
KnNkLAotCQkJICAgICAgIHN0cnVjdCB2NGwyX2FzeW5jX3N1YmRldiAqYXNkKQorCQkJICAg
ICAgIHN0cnVjdCB2NGwyX2FzeW5jX2Nvbm5lY3Rpb24gKmFzZCkKIHsKIAlzdHJ1Y3QgaXB1
Nl9pc3lzICppc3lzID0KIAkJY29udGFpbmVyX29mKG5vdGlmaWVyLCBzdHJ1Y3QgaXB1Nl9p
c3lzLCBub3RpZmllcik7CkBAIC02OTEsNDQgKzY5MSw1OSBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IHY0bDJfYXN5bmNfbm90aWZpZXJfb3BlcmF0aW9ucyBpc3lzX2FzeW5jX29wcyA9IHsK
IAkuY29tcGxldGUgPSBpc3lzX25vdGlmaWVyX2NvbXBsZXRlLAogfTsKIAotc3RhdGljIGlu
dCBpc3lzX2Z3bm9kZV9wYXJzZShzdHJ1Y3QgZGV2aWNlICpkZXYsCi0JCQkgICAgIHN0cnVj
dCB2NGwyX2Z3bm9kZV9lbmRwb2ludCAqdmVwLAotCQkJICAgICBzdHJ1Y3QgdjRsMl9hc3lu
Y19zdWJkZXYgKmFzZCkKLXsKLQlzdHJ1Y3Qgc2Vuc29yX2FzeW5jX3N1YmRldiAqc19hc2Qg
PQotCQljb250YWluZXJfb2YoYXNkLCBzdHJ1Y3Qgc2Vuc29yX2FzeW5jX3N1YmRldiwgYXNk
KTsKLQotCXNfYXNkLT5jc2kyLnBvcnQgPSB2ZXAtPmJhc2UucG9ydDsKLQlzX2FzZC0+Y3Np
Mi5ubGFuZXMgPSB2ZXAtPmJ1cy5taXBpX2NzaTIubnVtX2RhdGFfbGFuZXM7Ci0KLQlyZXR1
cm4gMDsKLX0KLQogc3RhdGljIGludCBpc3lzX25vdGlmaWVyX2luaXQoc3RydWN0IGlwdTZf
aXN5cyAqaXN5cykKIHsKLQlzaXplX3QgYXNkX3N0cnVjdF9zaXplID0gc2l6ZW9mKHN0cnVj
dCBzZW5zb3JfYXN5bmNfc3ViZGV2KTsKKwljb25zdCBzdHJ1Y3QgaXB1Nl9pc3lzX2ludGVy
bmFsX2NzaTJfcGRhdGEgKmNzaTIgPQorCQkmaXN5cy0+cGRhdGEtPmlwZGF0YS0+Y3NpMjsK
IAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmaXN5cy0+YWRldi0+YXV4ZGV2LmRldjsKLQlzdHJ1
Y3QgaXB1Nl9kZXZpY2UgKmlzcCA9IGlzeXMtPmFkZXYtPmlzcDsKKwl1bnNpZ25lZCBpbnQg
aTsKIAlpbnQgcmV0OwogCi0JdjRsMl9hc3luY19uZl9pbml0KCZpc3lzLT5ub3RpZmllcik7
Ci0JcmV0ID0gdjRsMl9hc3luY19uZl9wYXJzZV9md25vZGVfZW5kcG9pbnRzKCZpc3AtPnBk
ZXYtPmRldiwKLQkJCQkJCSAgICZpc3lzLT5ub3RpZmllciwKLQkJCQkJCSAgIGFzZF9zdHJ1
Y3Rfc2l6ZSwKLQkJCQkJCSAgIGlzeXNfZndub2RlX3BhcnNlKTsKLQlpZiAocmV0IDwgMCkg
ewotCQlkZXZfZXJyKGRldiwgInBhcnNlIGZ3bm9kZSBlbmRwb2ludHMgZmFpbGVkOiAlZFxu
IiwgcmV0KTsKKwl2NGwyX2FzeW5jX25mX2luaXQoJmlzeXMtPm5vdGlmaWVyLCAmaXN5cy0+
djRsMl9kZXYpOworCWZvciAoaSA9IDA7IGkgPCBjc2kyLT5ucG9ydHM7IGkrKykgeworCQlz
dHJ1Y3QgdjRsMl9md25vZGVfZW5kcG9pbnQgdmVwID0geworCQkJLmJ1c190eXBlID0gVjRM
Ml9NQlVTX0NTSTJfRFBIWQorCQl9OworCQlzdHJ1Y3Qgc2Vuc29yX2FzeW5jX3N1YmRldiAq
c19hc2Q7CisJCXN0cnVjdCBmd25vZGVfaGFuZGxlICplcDsKKworCQllcCA9IGZ3bm9kZV9n
cmFwaF9nZXRfZW5kcG9pbnRfYnlfaWQoZGV2X2Z3bm9kZShkZXYtPnBhcmVudCksIGksIDAs
CisJCQkJCQlGV05PREVfR1JBUEhfRU5EUE9JTlRfTkVYVCk7CisJCWlmICghZXApCisJCQlj
b250aW51ZTsKKworCQlyZXQgPSB2NGwyX2Z3bm9kZV9lbmRwb2ludF9wYXJzZShlcCwgJnZl
cCk7CisJCWlmIChyZXQpCisJCQlnb3RvIGVycl9wYXJzZTsKKworCQlzX2FzZCA9IHY0bDJf
YXN5bmNfbmZfYWRkX2Z3bm9kZV9yZW1vdGUoJmlzeXMtPm5vdGlmaWVyLCBlcCwKKwkJCQkJ
CQlzdHJ1Y3QKKwkJCQkJCQlzZW5zb3JfYXN5bmNfc3ViZGV2KTsKKwkJaWYgKElTX0VSUihz
X2FzZCkpIHsKKwkJCXJldCA9IFBUUl9FUlIoc19hc2QpOworCQkJZ290byBlcnJfcGFyc2U7
CisJCX0KKworCQlzX2FzZC0+Y3NpMi5wb3J0ID0gdmVwLmJhc2UucG9ydDsKKwkJc19hc2Qt
PmNzaTIubmxhbmVzID0gdmVwLmJ1cy5taXBpX2NzaTIubnVtX2RhdGFfbGFuZXM7CisKKwkJ
Zndub2RlX2hhbmRsZV9wdXQoZXApOworCisJCWNvbnRpbnVlOworCitlcnJfcGFyc2U6CisJ
CWZ3bm9kZV9oYW5kbGVfcHV0KGVwKTsKIAkJcmV0dXJuIHJldDsKIAl9CiAKLQlpZiAobGlz
dF9lbXB0eSgmaXN5cy0+bm90aWZpZXIuYXNkX2xpc3QpKSB7CisJaWYgKGxpc3RfZW1wdHko
JmlzeXMtPm5vdGlmaWVyLndhaXRpbmdfbGlzdCkpIHsKIAkJLyogaXN5cyBwcm9iZSBjb3Vs
ZCBjb250aW51ZSB3aXRoIGFzeW5jIHN1YmRldnMgbWlzc2luZyAqLwogCQlkZXZfd2Fybihk
ZXYsICJubyBzdWJkZXYgZm91bmQgaW4gZ3JhcGhcbiIpOwogCQlyZXR1cm4gMDsKIAl9CiAK
IAlpc3lzLT5ub3RpZmllci5vcHMgPSAmaXN5c19hc3luY19vcHM7Ci0JcmV0ID0gdjRsMl9h
c3luY19uZl9yZWdpc3RlcigmaXN5cy0+djRsMl9kZXYsICZpc3lzLT5ub3RpZmllcik7CisJ
cmV0ID0gdjRsMl9hc3luY19uZl9yZWdpc3RlcigmaXN5cy0+bm90aWZpZXIpOwogCWlmIChy
ZXQpIHsKIAkJZGV2X2VycihkZXYsICJmYWlsZWQgdG8gcmVnaXN0ZXIgYXN5bmMgbm90aWZp
ZXIgOiAlZFxuIiwgcmV0KTsKIAkJdjRsMl9hc3luY19uZl9jbGVhbnVwKCZpc3lzLT5ub3Rp
Zmllcik7CmRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BjaS9pbnRlbC9pcHU2L2lwdTYt
aXN5cy5oIGIvZHJpdmVycy9tZWRpYS9wY2kvaW50ZWwvaXB1Ni9pcHU2LWlzeXMuaAppbmRl
eCBlZjAxMTU5MTQyOTcuLjVjMjNhZDNlNWRlYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9tZWRp
YS9wY2kvaW50ZWwvaXB1Ni9pcHU2LWlzeXMuaAorKysgYi9kcml2ZXJzL21lZGlhL3BjaS9p
bnRlbC9pcHU2L2lwdTYtaXN5cy5oCkBAIC05NCw3ICs5NCw3IEBAIHN0cnVjdCBpcHU2X2lz
eXNfY3NpMl9jb25maWcgewogfTsKIAogc3RydWN0IHNlbnNvcl9hc3luY19zdWJkZXYgewot
CXN0cnVjdCB2NGwyX2FzeW5jX3N1YmRldiBhc2Q7CisJc3RydWN0IHY0bDJfYXN5bmNfY29u
bmVjdGlvbiBhc2Q7CiAJc3RydWN0IGlwdTZfaXN5c19jc2kyX2NvbmZpZyBjc2kyOwogfTsK
IApkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wY2kvaW50ZWwvaXB1Ni9pcHU2LmMgYi9k
cml2ZXJzL21lZGlhL3BjaS9pbnRlbC9pcHU2L2lwdTYuYwppbmRleCA3ZDVmNDY1YTllNzEu
LjBjNjM4NzNiYWE1YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9tZWRpYS9wY2kvaW50ZWwvaXB1
Ni9pcHU2LmMKKysrIGIvZHJpdmVycy9tZWRpYS9wY2kvaW50ZWwvaXB1Ni9pcHU2LmMKQEAg
LTE0LDYgKzE0LDggQEAKICNpbmNsdWRlIDxsaW51eC9wbV9ydW50aW1lLmg+CiAjaW5jbHVk
ZSA8bGludXgvdGltZXIuaD4KIAorI2luY2x1ZGUgPG1lZGlhL2lwdS1icmlkZ2UuaD4KKwog
I2luY2x1ZGUgImlwdTYuaCIKICNpbmNsdWRlICJpcHU2LWJ1cy5oIgogI2luY2x1ZGUgImlw
dTYtYnV0dHJlc3MuaCIKQEAgLTI0LDcgKzI2LDYgQEAKICNpbmNsdWRlICJpcHU2LXBsYXRm
b3JtLWJ1dHRyZXNzLXJlZ3MuaCIKICNpbmNsdWRlICJpcHU2LXBsYXRmb3JtLWlzeXMtY3Np
Mi1yZWcuaCIKICNpbmNsdWRlICJpcHU2LXBsYXRmb3JtLXJlZ3MuaCIKLSNpbmNsdWRlICIu
Li9pcHUtYnJpZGdlLmgiCiAKICNkZWZpbmUgSVBVNl9QQ0lfQkFSCQkwCiAKQEAgLTQzMCw3
ICs0MzEsNyBAQCBpcHU2X2lzeXNfaW5pdChzdHJ1Y3QgcGNpX2RldiAqcGRldiwgc3RydWN0
IGRldmljZSAqcGFyZW50LAogCQkJcmV0dXJuIEVSUl9QVFIoLUVJTlZBTCk7CiAJCX0KIAot
CQlyZXQgPSBpcHVfYnJpZGdlX2luaXQocGRldik7CisJCXJldCA9IGlwdV9icmlkZ2VfaW5p
dCgmcGRldi0+ZGV2LCBpcHVfYnJpZGdlX3BhcnNlX3NzZGIpOwogCQlpZiAocmV0KSB7CiAJ
CQlkZXZfZXJyX3Byb2JlKCZwZGV2LT5kZXYsIHJldCwKIAkJCQkgICAgICAiSVBVNiBicmlk
Z2UgaW5pdCBmYWlsZWRcbiIpOwotLSAKMi40MS4wCgo=

--------------OBPNzRreJeyYXmXx7GJZ4heB--
