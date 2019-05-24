Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FC5229344
	for <lists+linux-media@lfdr.de>; Fri, 24 May 2019 10:38:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389300AbfEXIio (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 May 2019 04:38:44 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:43400 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389281AbfEXIin (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 May 2019 04:38:43 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: gtucker)
        with ESMTPSA id 077AC27FB20
Subject: Re: media/master v4l2-compliance on vivid: 236 tests, 0 regressions
 (media_v5.1-2-16-gfc8670d1f72b)
To:     Hans Verkuil <hverkuil@xs4all.nl>
References: <5cdc62d6.1c69fb81.31322.a901@mx.google.com>
 <3c4680f6-b51b-5b91-72c9-7c63b3ef3643@xs4all.nl>
From:   Guillaume Tucker <guillaume.tucker@collabora.com>
Cc:     linux-media@vger.kernel.org, kernel-build-reports@lists.linaro.org
Message-ID: <e9ffd0e8-81c6-466e-f359-37448b284130@collabora.com>
Date:   Fri, 24 May 2019 09:38:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <3c4680f6-b51b-5b91-72c9-7c63b3ef3643@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 16/05/2019 07:41, Hans Verkuil wrote:
> Hi Guillaume,
> 
> I have a few questions/suggestions:

Thanks for the feedback!  It's good to start seeing these reports
on the linux-media mailing list.  And sorry for the slow reply, I
was away.

> On 5/15/19 9:04 PM, kernelci.org bot wrote:
>> media/master v4l2-compliance on vivid: 236 tests, 0 regressions (media_v5.1-2-16-gfc8670d1f72b)
>>
>> Test results summary
>> --------------------
>>
>> V4L2 Compliance on the vivid driver.
>>
>> This test ran "v4l2-compliance -s" from v4l-utils:
>>
>>     https://www.linuxtv.org/wiki/index.php/V4l2-utils
> 
> I'd just link directly to the git repo instead of the wiki: https://git.linuxtv.org/v4l-utils.git

Sure, I thought this had been agreed before but it's easy to
change.

> You should add the v4l-utils commit that's used to compile v4l2-compliance.
> That's important information to have. I assume that this test always uses the
> latest version of v4l-utils?

This information is in the detailed results, but the detailed
results are only shown when there are some failures.  So we'll
rework that a bit.

For example, from the v4l2-compliance-uvc report:


Test failures
------------- 
1  | rk3399-gru-kevin       | arm64 |  52 total:  43 PASS   9 FAIL   0 SKIP

  Config:      defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Lab Name:    lab-collabora
  Plain log:   https://storage.kernelci.org//media/master/media_v5.1-2-16-gfc8670d1f72b/arm64/defconfig/gcc-8/lab-collabora/v4l2-compliance-uvc-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//media/master/media_v5.1-2-16-gfc8670d1f72b/arm64/defconfig/gcc-8/lab-collabora/v4l2-compliance-uvc-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/stretch-v4l2/20190510.0/arm64/rootfs.cpio.gz
  Test Git:    git://linuxtv.org/v4l-utils.git
  Test Commit: 0d61ddede7d340ffa1c75a2882e30c455ef3d8b8


The git repo and commit hash here show you which version of
vl4-utils was used.


At the moment, the v4l2-compliance is part of a rootfs which gets
updated each time kernelci.org production code gets updated,
which is typically once a week.  This can be improved to have the
rootfs updates independent from the rest, then we could trigger
rebuilds every time v4l-utils changes, but there are a few things
to take into consideration before we can do this safely.

>> See each detailed section in the report below to find out the git URL and
>> particular revision that was used to build the test binaries.
>>
>>
>>   Tree:    media
>>   Branch:  master
>>   Kernel:  media_v5.1-2-16-gfc8670d1f72b
> 
> I assume this is the version of the host kernel, right? Perhaps calling this
> "Host Kernel:" would be less ambiguous.

I have to say I fail to see any ambiguity here: KernelCI is about
testing kernels, and this tells you the kernel revision under
test.  Calling it "host" kernel might actually be confusing when
running with QEMU as people may think it's the version on the
host server running the test.

>>   URL:     https://git.linuxtv.org/media_tree.git
>>   Commit:  fc8670d1f72b746ff3a5fe441f1fca4c4dba0e6f
>>
>>
>> 1  | qemu                   | arm64 | 118 total: 118 PASS   0 FAIL   0 SKIP
>> 2  | qemu                   | arm   | 118 total: 118 PASS   0 FAIL   0 SKIP  
> 
> Even if everything was OK, I think it would still be useful to have a link
> to the full test report.

Yes, that is essentially the same issue as with the v4l-utils
version as I described above.  The detailed results show a link
to the console output, which isn't just a clean v4l2-compliance
log but it's better than nothing.

We may also add a feature to publish some files alongside the
parsed test results, and in the case of v4l2-compliance it would
typically be the plain output of the test suite that developers
are familiar with.  It's not a supported feature right now as
only the raw console log is sent from the device to the database.

Best wishes,
Guillaume
