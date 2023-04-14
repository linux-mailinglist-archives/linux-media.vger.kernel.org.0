Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D7E36E18E2
	for <lists+linux-media@lfdr.de>; Fri, 14 Apr 2023 02:15:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230057AbjDNAPg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Apr 2023 20:15:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229733AbjDNAPe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Apr 2023 20:15:34 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB8413C30
        for <linux-media@vger.kernel.org>; Thu, 13 Apr 2023 17:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nurfuerspam.de;
        s=s31663417; t=1681431317; i=herdler@nurfuerspam.de;
        bh=j5jgmScSEynRPU7VuClxPiblIkJG5kRTRn4EeY/twis=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=hbhq44OsL9euLaGsksoi8lypaiJnv0Q6cMUvl8EhHYSJuLDMjZhIClFyJvqTD56+4
         d8hCMmExrs/JZZaqlonIaBAzOPBRPiAklIvZK5Ce0NogUqPKpxGSo5aanwX38ZyHnu
         UON6vEW9bUzndM/muI/JJh3VUQVvDrvAzCR+K1btNy1/Dtvhqo0XBNB8LYrw7tsNb3
         g3wUeyunGObNRbL67PSA9PmKL8bpNBJEf5DjubNjFTUdYCSK3+OpHPFYOlYkg4Eplb
         BRggY6gyjFtez9uDdTcdwpN3ISSiWFFecMp17aZMrBUN2/XvXJ+Y33fITsNqvxDGmY
         iD1Y1ogI7Yw2g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([213.232.102.106]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MVN6j-1pxwUE0kqN-00SPdy; Fri, 14
 Apr 2023 02:15:17 +0200
Message-ID: <4e188f3d-29c6-6d2a-4eea-6616f5b5791e@nurfuerspam.de>
Date:   Fri, 14 Apr 2023 02:15:16 +0200
MIME-Version: 1.0
Subject: Re: saa7146: please test the vb2 conversion!
Content-Language: en-US
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, Manu Abraham <abraham.manu@gmail.com>,
        Tomasz Maciej Nowak <tmn505@gmail.com>,
        Corinna Vinschen <vinschen@redhat.com>,
        Soeren Moch <smoch@web.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <c78a2740-1b80-2ea2-dc5c-4ead440ff9ed@nurfuerspam.de>
 <014db0ee-55fe-2966-a531-b8c23e97b402@web.de>
 <d9197b80-335c-ee70-eccc-ad04c026cbc9@xs4all.nl>
 <8fb1799b-5ed1-9d26-54fc-b47abe0c13cf@nurfuerspam.de>
 <df796e6c-c82f-8734-3de6-8446bd0b48ab@web.de>
 <014a6ade-dddb-6c0d-a59a-186e0b0aa3c2@nurfuerspam.de>
 <44cc2154-9224-510d-1f9c-34ae49f01c73@nurfuerspam.de>
 <c735aadc-80cd-9332-6661-638cad63afa2@xs4all.nl>
 <026b1342-2b0f-f61d-ea33-63f3992d1473@nurfuerspam.de>
 <20230208100847.3ec87576@coco.lan>
 <99397771-409b-e487-e429-d5c9feb82209@nurfuerspam.de>
 <016c57b2-8538-c630-b72f-a3c608c33a02@xs4all.nl>
 <6c5433ff-a6c8-10f3-789b-bc231291c642@xs4all.nl>
 <a1059b8f-77ef-3ccc-2ae3-d4846fb8a305@nurfuerspam.de>
 <9dec250e-72b2-3c03-c01d-e211a270a751@nurfuerspam.de>
 <fc0244d7-1edc-d0f9-1777-65521d781d7b@xs4all.nl>
 <60ee8312-fecb-3fc6-6496-95ab894bc7a1@nurfuerspam.de>
 <8fd63839-c876-44ef-7597-8436cf0239ae@xs4all.nl>
 <1bb63685-96d6-057a-8644-844ec99ab5fc@xs4all.nl>
From:   Stefan Herdler <herdler@nurfuerspam.de>
In-Reply-To: <1bb63685-96d6-057a-8644-844ec99ab5fc@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ul2JosG8q0feMwi+z6mjnEUrPFEa5O1CZd64Zk89r73Mka+xoVE
 nn39r/XPJtoe1fqGaC8hwYoEaFhesT04cEeVJeibE+6fsqjDv+s3Qxo/2l9KOKZ8b8JVFmQ
 WXI3Hzv13WOt1r7IFNnqLg0xNW53l+JYDHy3JqmBblY1kcYqJPcXfFrI+9JwFht+eKAtko9
 KgqResrHht72Z6UgX06bg==
UI-OutboundReport: notjunk:1;M01:P0:8V+8xJ8b95E=;z4OFnKiCK+smNzKil8xDWK34nbY
 Tslh3Rrb+5nlkFodefQmqxcdoI/Fh/GPDQ+A4v51tUs7JJH9fcBvY35CcO9aSJMLTJD8k0GVC
 sYWcIGpNrLCiU9IBYXIzlXQQ5h4ySOH9qKc8beEcqIqBjihFWg4906YHsXYYW3WiZDtX1t00G
 mW2qKBuqsbDfe3p5LvyauzVy+4EAzc1iw5CvcOhMzgcqXISNJsqwEHaebO/Ra0M470WfOax2I
 d+Z1v38as8aFQH5XixHektTa+94HYWjTmd+X8tQtrCUQ1nnGfbXlArXQTdtLmZ1+6/KuzYrX4
 M5WLmCNA8QI4fuGLAELCXdtVPD4TC+CvXnFTm4Cc/iRhkvS9H73+yg91S7mDVTnMigONgaW9E
 XZ5TfvZqMMFnuDKj6jya24jUZNiq3AyEvf7uZaNuDYKb18LjlMFEILpqUjTOJ3Pfs+YJyISkt
 qAdDqBXjCnOiwrk70HjOp6UqOrJUlMWcsanN4W+gR+RxNBvAkN3oYi3OVZi5MF/1SGzH8XOHc
 cOyjDijY06mI6zFS3oWX0J1rFDJmK6ZvcWq4x18ymrzvPdXevhP25ngKnsvwHRA6QqcW1CtW8
 4tPuWDQQthrWxQtFUx1a/cB+QK49nUI1yiRCcJ+CFqOppQPleebf2ETOE8n5CCX4ZfoV+pgT1
 MCKKP2xDTCGXk2+QE4hUYUsmxWJ7YI/jnxTiarkEabkOI41LKA+aUUmKSeG1nCfVPzTovbcG1
 9gncnjnCqG/dCFbkkvR+fQDwIJrWJPAcXYSTyarbVWBK/DIoTmRgNx2WBfHxAelUtfymcBE8E
 1Syi8cyknccK9I9aGZKvct99xT7Q9gwrcqjnS1kfc25JKE+8nyY6aIZMcsvH875GuJ+fjx9KE
 /twuuN4lEeZ7OCFL0MznyocJP6mJr7czfXsfrj1Zk7+rYHWKKCV7PkSc6dVMelHGvqs9e0PSK
 c7PzP4kwdaUTUoht+sKe1HfPE7E=
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_ABUSE_SURBL
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/04/23 13:16 Hans Verkuil wrote:
> On 12/04/2023 12:11, Hans Verkuil wrote:
>> On 10/04/2023 00:36, Stefan Herdler wrote:
>>> On 07/04/23 09:04, Hans Verkuil wrote:
>>>> On 07/04/2023 00:43, Stefan Herdler wrote:
>>> [...]
>>>>>
>>>>> VBI output is used to switch the aspect-ratio via WSS.
>>>>> this should be supported by any av7110 card.
>>>>>
>>>>> The software is run a daemon or plugin, so the userspace-facing chan=
ge
>>>>> shouldn't matter.
>>>>>
>>>>> I'll test this as soon as possible.
>>>>>
>>>>>
>>>>>
>>>>>
>>>>> I've done only basic testing so far, but unfortunately it already fa=
iled.
>>>>>
>>>>> The test:
>>>>> Switch to a channel[*] and view the decoded video with tvtime.
>>>>>
>>>>> The resulting picture is corrupted.
>>>>> Almost green with some pink traces at the outlines.
>>>>>
>>>>> It reminds me to YCbCr component-yideo on a RGB-input.
>>>>> Maybe the input-format of saa7146 not set correctly?
>>>>>
>>>>> The OSD is equally affected, but the card seems to run stable.
>>>>
>>>> That's weird. When you are in this state, can you run
>>>> 'v4l2-ctl -V -d /dev/videoX' for the video device that tvtime
>>>> is using? I'll try to test it with tvtime as well next week.
>>>> I have done my tests using qvidcap and qv4l2, and that looked fine.
>>>
>>> I've done some more testing and the result is somehow confusing to me.
>>>
>>> At first I tried qv4l and it shows correct videos with any driver.
>>> And with any pixel format setting I tried.
>>>
>>>
>>> After boot /dev/video0 (there is only this device) starts always with
>>> this settings:
>>> Format Video Capture:
>>>         Width/Height      : 384/288
>>>         Pixel Format      : 'BGR3' (24-bit BGR 8-8-8)
>>>         Field             : Interlaced
>>>         Bytes per Line    : 1152
>>>         Size Image        : 331776
>>>         Colorspace        : SMPTE 170M
>>>         Transfer Function : Default (maps to Rec. 709)
>>>         YCbCr/HSV Encoding: Default (maps to ITU-R 601)
>>>         Quantization      : Default (maps to Full Range)
>>>         Flags             :
>>>
>>>
>>> On the working "old" driver tvtime switches to the following settings:
>>> Format Video Capture:
>>>         Width/Height      : 720/576
>>>         Pixel Format      : 'UYVY' (UYVY 4:2:2)
>>>         Field             : Interlaced
>>>         Bytes per Line    : 1440
>>>         Size Image        : 829440
>>>         Colorspace        : SMPTE 170M
>>>         Transfer Function : Default (maps to Rec. 709)
>>>         YCbCr/HSV Encoding: Default (maps to ITU-R 601)
>>>         Quantization      : Default (maps to Limited Range)
>>>         Flags             :
>>> It seems tvtime needs this 'UYVY' pixel format to work.
>>>
>>>
>>> On the "new" driver, with patches [1], tvtime switches to:
>>> Format Video Capture:
>>>         Width/Height      : 720/576
>>>         Pixel Format      : 'BGR3' (24-bit BGR 8-8-8)
>>>         Field             : Interlaced
>>>         Bytes per Line    : 2160
>>>         Size Image        : 1244160
>>>         Colorspace        : SMPTE 170M
>>>         Transfer Function : Default (maps to Rec. 709)
>>>         YCbCr/HSV Encoding: Default (maps to ITU-R 601)
>>>         Quantization      : Default (maps to Full Range)
>>>         Flags             :
>>> And now it is getting weird:
>>> I can switch to the correct 'UYVY' settings using qv4l.
>>> But tvtime always switches back to 'BGR3'.
>>
>> The cause is "[PATCH 10/17] media: common: saa7146: fall back to V4L2_P=
IX_FMT_BGR24".
>>
>> Can you drop that patch and test again?

Without this patch tvtime is working again.

>>
>> It's really a tvtime bug since drivers are allowed to either reject an =
unsupported
>> pixelformat (the old behavior) or replace it with a supported pixelform=
at (the
>> new behavior). And tvtime only supports the old behavior.
>
> FYI: I posted a patch fixing tvtime:
>
> https://patchwork.linuxtv.org/project/linux-media/patch/a5dff340-ab8a-46=
e0-1f0c-25ceaf9fe5ca@xs4all.nl/
>
> That said, I do plan to drop patch 10/17 from the saa7146 series, since =
it is better
> to keep the old behavior.
>
> Once I get the green light from you, I will make a pull request for this=
 vb2 conversion.
>
> Regards,
>
> 	Hans
>
>>
>>>
>>> Using qv4l while tvtime is running doesn't work and sometimes
>>> causes freezing of both programs (on all drivers).
>>
>> Are you just starting qv4l2 when tvtime is running? Or trying to stream=
?
>> Do you see messages in the kernel log?
Just starting qv4l2 and trying to switch the pixelformat.
I haven't seen any related messages appearing while playing with qv4l2.
>>
>> I couldn't reproduce this. Since tvtime is streaming, qv4l2 shouldn't b=
e able to
>> do anything since all attempts to change something should result in EBU=
SY.
Normally with qv4l2 it just happens nothing.
v4l2-ctl tells something like "device is busy".

I couldn't reproduce the freeze anymore today.
It was never really reproduce able, it only happened twice and
with different drivers. And it was always unexpected.

Today I found messages about an ARM-Crash on that particular day,
which I haven't seen before. They must have been come before or
after the tests.
The driver should recover the decoder, but sometimes it takes
a while until the it notices a crash.
So probably I haven't had connected the provisional cable to my
desktop properly that day, which caused a bad signal. That caused
an ARM-Crash, which caused the driver to freeze for a while.
And I killed applications to early.
At least that is the best explanation I have.




The vbi output is operational too.
I have verified, that the WSS bits change at the analog output.
The old tools are still working with the modified driver.


Regards

Stefan


>>
>> Regards,
>>
>> 	Hans
>>
>>>
>>>
>>> I have also build a new driver just without the patches [2].
>>> It shows the "old" correct behavior.
>>> So I think, the cause of the change must be somewhere in the
>>> patches.
>>>
>>>
>>>
>>> Btw.:
>>> I also tried to open the video device with the usual
>>> media-players, but I had no luck so far (with any driver).
>>>
>>>
>>> Regards
>>>
>>> Stefan
>>>
>>>
>>> [1] git checkout -B saa7146-clean 837736a79a76c9becddf0caf905b27c144a6=
4030
>>> [2] git checkout -B saa7146-clean 2653fad0d8a9625667e9a78133ea9e1245b7=
c40c
>>>
>>>>
>>>> Regards,
>>>>
>>>> 	Hans
>>>>
>>> [...]
>>
>
