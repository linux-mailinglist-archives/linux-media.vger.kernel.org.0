Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E7D6218650
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2020 13:40:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728804AbgGHLki (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jul 2020 07:40:38 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:51393 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728742AbgGHLki (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 8 Jul 2020 07:40:38 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id t8RDje38JJcNHt8RHjo6Ni; Wed, 08 Jul 2020 13:40:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1594208435; bh=W2/v6uRGfi3ngii5s10gfQ8AN3AcrRptmEYgoeT2fEY=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=pwHrkep2HZc78qMJz4kwjNX3VTmJa/pk/hCOQR1JS0Fuvh6AI8PVIBNAHsjcUFGsB
         B/eDGgz46b/iZ9hlsf6YcerHTaUxr5J+BMWjTAclJgQ7oniEqK5KnJuf2QrcI9CPEb
         PiE5I5NHagrHE/4DdEDp5YVkzmvR+N3rKnveiliXJQoyAD/k/k2pKrX3MkNqQA3TFP
         9Jiw4vyOy+6MQ084CUSba8QWEvj7OOqtw4fCxpiEFg0232Y/L9HdrVCbV8L4hc+P39
         sDD9rB6rdNepQdF6ek5OEyyOxv2Fmx02uzRTtoxc33cv40Qb79HID1lQ67kfKQ2ChM
         bx46LI3hGj/bw==
Subject: Re: v4l2-compliance tests for cache flags
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
References: <CAPY8ntAogTZHd7Oh_7L+ghh4_DP9AzZ4DuJ9xChN_EmVbGXb1Q@mail.gmail.com>
 <34df23a8-6ab1-aaba-19f7-5193d18a60b0@xs4all.nl>
 <CAPY8ntAjV7vxpb2qFQVY+EYk3Mb0nBfGovYcAvw+0NMFH0j5PQ@mail.gmail.com>
 <20200708035940.GB571@jagdpanzerIV.localdomain>
 <01fb82b0-a1b6-9cae-b462-46cbe33491ce@xs4all.nl>
 <CAPY8ntCNrwzO0XQg+iFOfft1LzfH9Zmpg6QZXZMyTzd_8iFe9g@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <94158153-3f7e-1127-e761-594ef2f898fa@xs4all.nl>
Date:   Wed, 8 Jul 2020 13:40:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAPY8ntCNrwzO0XQg+iFOfft1LzfH9Zmpg6QZXZMyTzd_8iFe9g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFxjwqcjR4ZosxekAl27KTv/JFFFWncVilLKQTMHJPSPmQsXMegu54nq+RiuPsXeNHAklsp3sLmo0tbh8ngFalYK8y7Fw3+XFnGI/o51F+/U/f9Gelrl
 32820eFCmidbOjJJPrvs/2jwO5Ckw/L3DYnN/qPB+Su2GA4t2cI38mIx1ag2MaQeKzuEDLqtiTrgjbaH0/J0kC5S1cfsq9msP81iPV+/2BnSbLkW0VvRfaur
 fW0YFsGjjMxOTxyk8lffhzm/AAaSRmISflwDHosDQ44iG1Xa6xvrvdNOL4HFzi/U4XWHeruNIOJJeyCp5hRr3A==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 08/07/2020 11:30, Dave Stevenson wrote:
> Hi Sergey & Hans
> 
> On Wed, 8 Jul 2020 at 09:22, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> On 08/07/2020 05:59, Sergey Senozhatsky wrote:
>>> On (20/07/07 15:41), Dave Stevenson wrote:
>>>>> v4l2-compliance tests are in sync with our master and it expects that
>>>>> that kernel is used.
>>>>
>>>> Thanks, I'd never noted that restriction. All previous times I'd used
>>>> v4l2-compliance against any kernel it had performed as expected. This
>>>> is the first change that causes a major failure of tests due to an
>>>> older kernel.
>>>
>>> It depends on Linux UAPI headers, so the restriction is sort of mandated,
>>> but probably not widely recognized the by the distributions, looking at
>>> arch, for instance:
>>> https://git.archlinux.org/svntogit/packages.git/tree/trunk/PKGBUILD?h=packages/v4l-utils
> 
> Except that v4l-utils has a private copy of all the headers in
> https://git.linuxtv.org/v4l-utils.git/tree/include/linux, so it builds
> independently of the distribution's kernel headers.
> 
>>> Adding a Linux version check code can be a bit intrusive. There has been
>>> a whole bunch of changes all over the place, for instance:
>>>
>>> ---
>>>
>>> +++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
>>> @@ -381,8 +381,6 @@ int buffer::check(unsigned type, unsigned memory, unsigned index,
>>>         if (g_flags() & V4L2_BUF_FLAG_BFRAME)
>>>                 frame_types++;
>>>         fail_on_test(frame_types > 1);
>>> -       fail_on_test(g_flags() & (V4L2_BUF_FLAG_NO_CACHE_INVALIDATE |
>>> -                                 V4L2_BUF_FLAG_NO_CACHE_CLEAN));
>>> ---
>>>
>>> So running newer v4l-compliance against the older kernel or older
>>> v4l-compliance against the newer kernel may trigger various failures.
>>
>> It shouldn't. It's (I believe) just the check that those two flags
>> are cleared if cache hints are not supported that should be under a
>> version check.
> 
> Indeed, the only change I need to make for the tests to work is to
> disable the two lines in the else clause:
> 
> --- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> @@ -1272,7 +1272,7 @@ static int setupMmap(struct node *node, cv4l_queue &q)
>                 if (cache_hints) {
>                         fail_on_test(!(flags &
> V4L2_BUF_FLAG_NO_CACHE_INVALIDATE));
>                         fail_on_test(!(flags & V4L2_BUF_FLAG_NO_CACHE_CLEAN));
> -               } else {
> +               } else if (0) {
>                         fail_on_test(flags & V4L2_BUF_FLAG_NO_CACHE_INVALIDATE);
>                         fail_on_test(flags & V4L2_BUF_FLAG_NO_CACHE_CLEAN);
>                 }
> 
> I started looking at kernel_version, but currently it only gets set
> for 2.6.x kernels, and is set to the x.

Try this patch:

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index d0441651..e32b57e3 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -637,6 +637,8 @@ static int testCap(struct node *node)
 		warn("media bus_info '%s' differs from V4L2 bus_info '%s'\n",
 		     node->media_bus_info.c_str(), vcap.bus_info);
 	fail_on_test((vcap.version >> 16) < 3);
+	if (vcap.version >= 0x050900)  // Present from 5.9.0 onwards
+		node->might_support_cache_hints = true;
 	fail_on_test(check_0(vcap.reserved, sizeof(vcap.reserved)));
 	caps = vcap.capabilities;
 	dcaps = vcap.device_caps;
diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compliance/v4l2-compliance.h
index ae10bdf9..38a4ded3 100644
--- a/utils/v4l2-compliance/v4l2-compliance.h
+++ b/utils/v4l2-compliance/v4l2-compliance.h
@@ -146,6 +146,8 @@ struct base_node {
 	__u32 valid_buftype;
 	__u32 valid_memorytype;
 	bool supports_orphaned_bufs;
+	// support for this was introduced in 5.9
+	bool might_support_cache_hints;
 };

 struct node : public base_node, public cv4l_fd {
diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index b0b878c1..cdfbbd34 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -1272,7 +1272,7 @@ static int setupMmap(struct node *node, cv4l_queue &q)
 		if (cache_hints) {
 			fail_on_test(!(flags & V4L2_BUF_FLAG_NO_CACHE_INVALIDATE));
 			fail_on_test(!(flags & V4L2_BUF_FLAG_NO_CACHE_CLEAN));
-		} else {
+		} else if (node->might_support_cache_hints) {
 			fail_on_test(flags & V4L2_BUF_FLAG_NO_CACHE_INVALIDATE);
 			fail_on_test(flags & V4L2_BUF_FLAG_NO_CACHE_CLEAN);
 		}

This will work as well for people who use the media_build system to backport
the media subsystem from our tree to an older kernel.

> 
> Hans, would you be happy with taking the kernel's KERNEL_VERSION macro
> and using it to encode the whole version, eg

Not worth the effort, but if we need more of such checks, then I might change
my mind :-)

<snip>

> diff --git a/utils/v4l2-compliance/v4l2-test-controls.cpp
> b/utils/v4l2-compliance/v4l2-test-controls.cpp
> index d81dddb2..dde661ed 100644
> --- a/utils/v4l2-compliance/v4l2-test-controls.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-controls.cpp
> @@ -411,7 +411,8 @@ int testSimpleControls(struct node *node)
>                         ctrl.value = 0;
>                         // This call will crash on kernels <= 2.6.37
> for control classes due to
>                         // a bug in v4l2-ctrls.c. So skip this on those kernels.
> -                       if (kernel_version < 38 && qctrl.type ==
> V4L2_CTRL_TYPE_CTRL_CLASS)
> +                       if (kernel_version < KERNEL_VERSION(2, 6, 38) &&
> +                           qctrl.type == V4L2_CTRL_TYPE_CTRL_CLASS)
>                                 ret = EACCES;
>                         else
>                                 ret = doioctl(node, VIDIOC_S_CTRL, &ctrl);
> 
> Actually isn't the current test of kernel_version in
> v4l2-test-controls.cpp wrong?
> If running on a 3.x, 4.x, or 5.x kernel then kernel_version will be
> left at 0. 0 < 38, so we fall into the ret = EACESS; clause and skip
> the test.
> Is that what was desired? Presumably the bug in v4l2-ctls.c referenced
> is fixed in all >= 3.x kernels. I obviously don't want to alter the
> behaviour in an incorrect manner here.

Yup, I'm about to commit a patch that removes kernel_version and kills
this workaround in testSimpleControls(). I really don't care about such
old kernels.

Thanks for reporting this, good catch!

Regards,

	Hans

> 
> Cheers
>   Dave
> 

