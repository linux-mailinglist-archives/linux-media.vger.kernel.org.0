Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0C5829467
	for <lists+linux-media@lfdr.de>; Fri, 24 May 2019 11:20:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389841AbfEXJUN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 May 2019 05:20:13 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:42755 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389569AbfEXJUM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 May 2019 05:20:12 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud8.xs4all.net with ESMTPA
        id U6MwhZEbL0YQeU6N0h0wFN; Fri, 24 May 2019 11:20:10 +0200
Subject: Re: media/master v4l2-compliance on vivid: 236 tests, 0 regressions
 (media_v5.1-2-16-gfc8670d1f72b)
To:     Guillaume Tucker <guillaume.tucker@collabora.com>
Cc:     linux-media@vger.kernel.org, kernel-build-reports@lists.linaro.org
References: <5cdc62d6.1c69fb81.31322.a901@mx.google.com>
 <3c4680f6-b51b-5b91-72c9-7c63b3ef3643@xs4all.nl>
 <e9ffd0e8-81c6-466e-f359-37448b284130@collabora.com>
 <bec0bf50-5088-21bb-44fb-32fd581baee0@xs4all.nl>
 <29de6255-4b55-a21a-36a0-5ef1ca36ce83@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <93a38a38-fb86-10aa-291a-1cb9fd86a23c@xs4all.nl>
Date:   Fri, 24 May 2019 11:20:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <29de6255-4b55-a21a-36a0-5ef1ca36ce83@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfPxpYs1H7o8Sa96298QJUrhwbFB10g7QWcHTS34ogPldlJX6F86gnVn1Z6Sn4NUwZFM4UCSWxdpPsJRc0vWxKS2Oxpk6iR5EPjWdJgW6M+J136WFJkti
 NIaVnQ+5by1KmOpOFqShPMbqeQm9k98t6NARTxqVTrizHVSXBUSIVLdHVMjX1J5SdJ1IU3mp8FN3WPo5gabnwwAZo4k3nQYMw44/takyR2nIC6gQ5JogGp7m
 SyMWlZmPZ3Czr5qmEDDSIjIG0nLoJdISmf91+wMRuMk=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/24/19 11:05 AM, Guillaume Tucker wrote:
> On 24/05/2019 09:44, Hans Verkuil wrote:
>> On 5/24/19 10:38 AM, Guillaume Tucker wrote:
>>> Hi Hans,
>>>
>>> On 16/05/2019 07:41, Hans Verkuil wrote:
>>>> Hi Guillaume,
>>>>
>>>> I have a few questions/suggestions:
>>>
>>> Thanks for the feedback!  It's good to start seeing these reports
>>> on the linux-media mailing list.  And sorry for the slow reply, I
>>> was away.
>>>
>>>> On 5/15/19 9:04 PM, kernelci.org bot wrote:
>>>>> media/master v4l2-compliance on vivid: 236 tests, 0 regressions (media_v5.1-2-16-gfc8670d1f72b)
>>>>>
>>>>> Test results summary
>>>>> --------------------
>>>>>
>>>>> V4L2 Compliance on the vivid driver.
>>>>>
>>>>> This test ran "v4l2-compliance -s" from v4l-utils:
>>>>>
>>>>>     https://www.linuxtv.org/wiki/index.php/V4l2-utils
>>>>
>>>> I'd just link directly to the git repo instead of the wiki: https://git.linuxtv.org/v4l-utils.git
>>>
>>> Sure, I thought this had been agreed before but it's easy to
>>> change.
>>>
>>>> You should add the v4l-utils commit that's used to compile v4l2-compliance.
>>>> That's important information to have. I assume that this test always uses the
>>>> latest version of v4l-utils?
>>>
>>> This information is in the detailed results, but the detailed
>>> results are only shown when there are some failures.  So we'll
>>> rework that a bit.
>>>
>>> For example, from the v4l2-compliance-uvc report:
>>>
>>>
>>> Test failures
>>> ------------- 
>>> 1  | rk3399-gru-kevin       | arm64 |  52 total:  43 PASS   9 FAIL   0 SKIP
>>>
>>>   Config:      defconfig
>>>   Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
>>>   Lab Name:    lab-collabora
>>>   Plain log:   https://storage.kernelci.org//media/master/media_v5.1-2-16-gfc8670d1f72b/arm64/defconfig/gcc-8/lab-collabora/v4l2-compliance-uvc-rk3399-gru-kevin.txt
>>>   HTML log:    https://storage.kernelci.org//media/master/media_v5.1-2-16-gfc8670d1f72b/arm64/defconfig/gcc-8/lab-collabora/v4l2-compliance-uvc-rk3399-gru-kevin.html
>>>   Rootfs:      http://storage.kernelci.org/images/rootfs/debian/stretch-v4l2/20190510.0/arm64/rootfs.cpio.gz
>>>   Test Git:    git://linuxtv.org/v4l-utils.git
>>>   Test Commit: 0d61ddede7d340ffa1c75a2882e30c455ef3d8b8
>>>
>>>
>>> The git repo and commit hash here show you which version of
>>> vl4-utils was used.
>>>
>>>
>>> At the moment, the v4l2-compliance is part of a rootfs which gets
>>> updated each time kernelci.org production code gets updated,
>>> which is typically once a week.  This can be improved to have the
>>> rootfs updates independent from the rest, then we could trigger
>>> rebuilds every time v4l-utils changes, but there are a few things
>>> to take into consideration before we can do this safely.
>>
>> I don't think it has to be updated every time v4l-utils changes, at least
>> for now, as long as it is clear which v4l-utils version is used.
>>
>>>
>>>>> See each detailed section in the report below to find out the git URL and
>>>>> particular revision that was used to build the test binaries.
>>>>>
>>>>>
>>>>>   Tree:    media
>>>>>   Branch:  master
>>>>>   Kernel:  media_v5.1-2-16-gfc8670d1f72b
>>>>
>>>> I assume this is the version of the host kernel, right? Perhaps calling this
>>>> "Host Kernel:" would be less ambiguous.
>>>
>>> I have to say I fail to see any ambiguity here: KernelCI is about
>>> testing kernels, and this tells you the kernel revision under
>>> test.  Calling it "host" kernel might actually be confusing when
>>> running with QEMU as people may think it's the version on the
>>> host server running the test.
>>>
>>>>>   URL:     https://git.linuxtv.org/media_tree.git
>>>>>   Commit:  fc8670d1f72b746ff3a5fe441f1fca4c4dba0e6f
>>
>> What confuses me is that the kernel above says: media_v5.1-2-16-gfc8670d1f72b
>> but the commit says fc8670d1f72b746ff3a5fe441f1fca4c4dba0e6f.
>>
>> So the hashes are different, which led me to conclude that one referred to
>> the host kernel and the other to the kernel under test.
>>
>> Where does the string "media_v5.1-2-16-gfc8670d1f72b" come from?
> 
> This is the output of "git describe", except that the slash in
> the tag name was replaced with an underscore (I know that's not
> great, but otherwise it causes some issues with the path on the
> storage server).  The media/v5.2-1 tag has been created since
> then, but if you run this:
> 
> $ git checkout fc8670d1f72b746ff3a5fe441f1fca4c4dba0e6f
> $ git tag -d media/v5.2-1
> $ git describe
> media/v5.1-2-16-gfc8670d1f72b
> 
> and fc8670d1f72b is the beginning of the full hash.

Argh! I totally missed that. And even overlooked that 'g' is not a hex
number :-)

I never use git describe, so I wasn't familiar with the format, hence my
confusion.

So never mind my comment :-)

Regards,

	Hans

> 
>>>>> 1  | qemu                   | arm64 | 118 total: 118 PASS   0 FAIL   0 SKIP
>>>>> 2  | qemu                   | arm   | 118 total: 118 PASS   0 FAIL   0 SKIP  
>>>>
>>>> Even if everything was OK, I think it would still be useful to have a link
>>>> to the full test report.
>>>
>>> Yes, that is essentially the same issue as with the v4l-utils
>>> version as I described above.  The detailed results show a link
>>> to the console output, which isn't just a clean v4l2-compliance
>>> log but it's better than nothing.
>>>
>>> We may also add a feature to publish some files alongside the
>>> parsed test results, and in the case of v4l2-compliance it would
>>> typically be the plain output of the test suite that developers
>>> are familiar with.  It's not a supported feature right now as
>>> only the raw console log is sent from the device to the database.
>>>
>>> Best wishes,
>>> Guillaume
>>>
>>
>> Regards,
>>
>> 	Hans
>>

