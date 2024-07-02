Return-Path: <linux-media+bounces-14495-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC1A91EEF7
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 08:27:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 360D11F224F9
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 06:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A9FB7CF1F;
	Tue,  2 Jul 2024 06:26:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4479F74047
	for <linux-media@vger.kernel.org>; Tue,  2 Jul 2024 06:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719901614; cv=none; b=b+DAdLUATszMimMIK157uFFeSaTuyrgMkw3D8ppX5KI5dDZnSK30lr1toRilfi8Bckge8cC6BcYbjovbYr2/xxme6MXjFd1d+udZQtKq6jk2gI7x50o9Me9AU0k5LtW8IWvNRwsrtj7NBjddxP7ZgJ7fjUI6m22v2T7pPt0gniI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719901614; c=relaxed/simple;
	bh=CCiibVaRkhhiAklL2RrtpREjH6M4z4+nXy1ZT1l8fFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lRsISCUU9fjgS2N66CQX+yi+Kh0q8zPK1xjc+Fx1LaOoxoJGSzS4fFJVlo+5LIojISjTHfv/7tBoAYTGZISlB2uQBxVytP7kT6FcCZxYm+1ttt6H0n8G03o6bVftqjoBzuXIKpsBuy6ETHE2UP3lPKxYs9J/uEZfLZri6NnmWaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 737A4C116B1;
	Tue,  2 Jul 2024 06:26:53 +0000 (UTC)
Message-ID: <468eb8f6-02a1-4f19-9c14-41113a87b739@xs4all.nl>
Date: Tue, 2 Jul 2024 08:26:51 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [SPAM] [PATCH 4/4] v4l-utils: fix formats under ppc/mips64
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-media@vger.kernel.org
References: <20240630224440.5912-1-rosenp@gmail.com>
 <20240630224440.5912-4-rosenp@gmail.com>
 <59d86208-16bb-4f42-a302-81f015776894@xs4all.nl>
 <CAKxU2N93wfJEusXQnRKWMK+wKxR8E0CPN=FfnSh=chvzXQeJEA@mail.gmail.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <CAKxU2N93wfJEusXQnRKWMK+wKxR8E0CPN=FfnSh=chvzXQeJEA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/07/2024 23:46, Rosen Penev wrote:
> On Mon, Jul 1, 2024 at 2:49 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> On 01/07/2024 00:44, Rosen Penev wrote:
>>> Unlike libc, kernel headers use long long for 64-bit types. The
>>> exception is ppc64 and mips64, unless __SANE_USERSPACE_TYPES__ is
>>> defined.
>>>
>>> Define in compiler.h and include before kernel headers are included so
>>> that wrong __u64 and __s64 definitions to not get used.
>>>
>>> Fixes -Wformat warnings about llu being used instead of lu.
>>>
>>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
>>> ---
>>>  contrib/xc3028-firmware/firmware-tool.c | 2 ++
>>>  include/linux/compiler.h                | 1 +
>>>  utils/cec-compliance/cec-compliance.h   | 2 ++
>>>  utils/cec-ctl/cec-ctl.cpp               | 2 ++
>>>  utils/cec-ctl/cec-ctl.h                 | 2 ++
>>>  utils/cec-ctl/cec-pin.cpp               | 2 ++
>>>  utils/cec-follower/cec-processing.cpp   | 2 ++
>>>  utils/common/v4l2-info.h                | 2 ++
>>>  utils/cx18-ctl/cx18-ctl.c               | 2 ++
>>>  utils/ivtv-ctl/ivtv-ctl.c               | 2 ++
>>>  utils/keytable/keytable.c               | 2 ++
>>>  utils/media-ctl/media-ctl.c             | 2 ++
>>>  utils/v4l2-compliance/v4l2-compliance.h | 2 ++
>>>  utils/v4l2-ctl/v4l2-ctl-common.cpp      | 2 ++
>>>  utils/v4l2-ctl/v4l2-ctl-streaming.cpp   | 2 ++
>>>  utils/v4l2-ctl/v4l2-ctl.cpp             | 2 ++
>>>  utils/v4l2-ctl/v4l2-ctl.h               | 2 ++
>>>  utils/v4l2-dbg/v4l2-dbg.cpp             | 2 ++
>>>  18 files changed, 35 insertions(+)
>>>
>>> diff --git a/contrib/xc3028-firmware/firmware-tool.c b/contrib/xc3028-firmware/firmware-tool.c
>>> index 5dd205e0..6bcb3237 100644
>>> --- a/contrib/xc3028-firmware/firmware-tool.c
>>> +++ b/contrib/xc3028-firmware/firmware-tool.c
>>> @@ -29,6 +29,8 @@
>>>  #include <string.h>
>>>  #include <unistd.h>
>>>
>>> +#include "linux/compiler.h"
>>> +
>>>  #include <asm/byteorder.h>
>>>  #include <asm/types.h>
>>>
>>> diff --git a/include/linux/compiler.h b/include/linux/compiler.h
>>> index 379629be..5a6326f8 100644
>>> --- a/include/linux/compiler.h
>>> +++ b/include/linux/compiler.h
>>> @@ -1,6 +1,7 @@
>>>  #ifndef __linux_compiler_h
>>>  #define __linux_compiler_h
>>>
>>> +#define __SANE_USERSPACE_TYPES__
>>
>> Please add a comment before this define, explaining why it is needed.
>>
>> Basically the same as what you wrote in the commit log.
>>
>> But this is in the wrong header: it should go into include/compiler.h.
>> The linux/compiler.h header was used in just a single test application,
>> and in fact it is no longer needed and has been effectively obsolete for
>> quite a long time. I just removed it from v4l-utils.
> I actually wonder if it would be better to add as a compile flag in meson.

I agree with that. I think I saw other projects do it like that, e.g.:

https://patchwork.yoctoproject.org/project/oe-core/patch/20220313195204.3828846-1-raj.khem@gmail.com/

Regards,

	Hans

>>
>> Regards,
>>
>>         Hans
>>
>>>  #define __user
>>>
>>>  #endif
>>> diff --git a/utils/cec-compliance/cec-compliance.h b/utils/cec-compliance/cec-compliance.h
>>> index aae72842..d5bd1d0a 100644
>>> --- a/utils/cec-compliance/cec-compliance.h
>>> +++ b/utils/cec-compliance/cec-compliance.h
>>> @@ -8,6 +8,8 @@
>>>  #ifndef _CEC_COMPLIANCE_H_
>>>  #define _CEC_COMPLIANCE_H_
>>>
>>> +#include "linux/compiler.h"
>>> +
>>>  #include <linux/cec-funcs.h>
>>>  #include "cec-htng-funcs.h"
>>>
>>> diff --git a/utils/cec-ctl/cec-ctl.cpp b/utils/cec-ctl/cec-ctl.cpp
>>> index fb38320d..a2ffcb2b 100644
>>> --- a/utils/cec-ctl/cec-ctl.cpp
>>> +++ b/utils/cec-ctl/cec-ctl.cpp
>>> @@ -21,6 +21,8 @@
>>>  #include <sys/time.h>
>>>  #include <unistd.h>
>>>
>>> +#include "linux/compiler.h"
>>> +
>>>  #include <linux/cec-funcs.h>
>>>  #include "cec-htng-funcs.h"
>>>  #include "cec-log.h"
>>> diff --git a/utils/cec-ctl/cec-ctl.h b/utils/cec-ctl/cec-ctl.h
>>> index 2c82bedc..e0692c31 100644
>>> --- a/utils/cec-ctl/cec-ctl.h
>>> +++ b/utils/cec-ctl/cec-ctl.h
>>> @@ -6,6 +6,8 @@
>>>  #ifndef _CEC_CTL_H_
>>>  #define _CEC_CTL_H_
>>>
>>> +#include "linux/compiler.h"
>>> +
>>>  #include <cec-info.h>
>>>
>>>  // cec-ctl.cpp
>>> diff --git a/utils/cec-ctl/cec-pin.cpp b/utils/cec-ctl/cec-pin.cpp
>>> index f3500555..0cdc19f7 100644
>>> --- a/utils/cec-ctl/cec-pin.cpp
>>> +++ b/utils/cec-ctl/cec-pin.cpp
>>> @@ -3,6 +3,8 @@
>>>   * Copyright 2017 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
>>>   */
>>>
>>> +#include "linux/compiler.h"
>>> +
>>>  #include <string>
>>>
>>>  #include <linux/cec.h>
>>> diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
>>> index 20c6165c..cc38f143 100644
>>> --- a/utils/cec-follower/cec-processing.cpp
>>> +++ b/utils/cec-follower/cec-processing.cpp
>>> @@ -3,6 +3,8 @@
>>>   * Copyright 2016 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
>>>   */
>>>
>>> +#include "linux/compiler.h"
>>> +
>>>  #include <cerrno>
>>>  #include <cinttypes>
>>>  #include <ctime>
>>> diff --git a/utils/common/v4l2-info.h b/utils/common/v4l2-info.h
>>> index ac227971..eeb7bc6b 100644
>>> --- a/utils/common/v4l2-info.h
>>> +++ b/utils/common/v4l2-info.h
>>> @@ -8,6 +8,8 @@
>>>
>>>  #include <string>
>>>
>>> +#include "linux/compiler.h"
>>> +
>>>  #include <linux/videodev2.h>
>>>  #include <linux/v4l2-subdev.h>
>>>
>>> diff --git a/utils/cx18-ctl/cx18-ctl.c b/utils/cx18-ctl/cx18-ctl.c
>>> index 8586f72d..7c13b1a3 100644
>>> --- a/utils/cx18-ctl/cx18-ctl.c
>>> +++ b/utils/cx18-ctl/cx18-ctl.c
>>> @@ -34,6 +34,8 @@
>>>  #include <sys/time.h>
>>>  #include <math.h>
>>>
>>> +#include "linux/compiler.h"
>>> +
>>>  #include <linux/videodev2.h>
>>>  #include <v4l-getsubopt.h>
>>>
>>> diff --git a/utils/ivtv-ctl/ivtv-ctl.c b/utils/ivtv-ctl/ivtv-ctl.c
>>> index b42b3489..bf36f40b 100644
>>> --- a/utils/ivtv-ctl/ivtv-ctl.c
>>> +++ b/utils/ivtv-ctl/ivtv-ctl.c
>>> @@ -34,6 +34,8 @@
>>>  #include <sys/time.h>
>>>  #include <math.h>
>>>
>>> +#include "linux/compiler.h"
>>> +
>>>  #include <linux/videodev2.h>
>>>  #include <v4l-getsubopt.h>
>>>
>>> diff --git a/utils/keytable/keytable.c b/utils/keytable/keytable.c
>>> index 538f4ef3..ba7c7c4d 100644
>>> --- a/utils/keytable/keytable.c
>>> +++ b/utils/keytable/keytable.c
>>> @@ -12,6 +12,8 @@
>>>     GNU General Public License for more details.
>>>   */
>>>
>>> +#include "linux/compiler.h"
>>> +
>>>  #include <ctype.h>
>>>  #include <errno.h>
>>>  #include <fcntl.h>
>>> diff --git a/utils/media-ctl/media-ctl.c b/utils/media-ctl/media-ctl.c
>>> index 33df0880..f91c1cfa 100644
>>> --- a/utils/media-ctl/media-ctl.c
>>> +++ b/utils/media-ctl/media-ctl.c
>>> @@ -34,6 +34,8 @@
>>>  #include <string.h>
>>>  #include <unistd.h>
>>>
>>> +#include "linux/compiler.h"
>>> +
>>>  #include <linux/media.h>
>>>  #include <linux/types.h>
>>>  #include <linux/v4l2-mediabus.h>
>>> diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compliance/v4l2-compliance.h
>>> index 3517bd07..2c2b2158 100644
>>> --- a/utils/v4l2-compliance/v4l2-compliance.h
>>> +++ b/utils/v4l2-compliance/v4l2-compliance.h
>>> @@ -26,6 +26,8 @@
>>>  #include <string>
>>>  #include <cstdint>
>>>
>>> +#include "linux/compiler.h"
>>> +
>>>  #include <linux/videodev2.h>
>>>  #include <linux/v4l2-subdev.h>
>>>  #include <linux/media.h>
>>> diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
>>> index 1f9cd0fb..ea120eb8 100644
>>> --- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
>>> +++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
>>> @@ -9,6 +9,8 @@
>>>  #include <sys/stat.h>
>>>  #include <sys/sysmacros.h>
>>>
>>> +#include "linux/compiler.h"
>>> +
>>>  #include <linux/media.h>
>>>
>>>  #include "v4l2-ctl.h"
>>> diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
>>> index 13bc057d..7af62ec8 100644
>>> --- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
>>> +++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
>>> @@ -3,6 +3,8 @@
>>>  #include <netdb.h>
>>>  #include <sys/types.h>
>>>
>>> +#include "linux/compiler.h"
>>> +
>>>  #include <linux/media.h>
>>>
>>>  #include "compiler.h"
>>> diff --git a/utils/v4l2-ctl/v4l2-ctl.cpp b/utils/v4l2-ctl/v4l2-ctl.cpp
>>> index a64fa514..d8a6c617 100644
>>> --- a/utils/v4l2-ctl/v4l2-ctl.cpp
>>> +++ b/utils/v4l2-ctl/v4l2-ctl.cpp
>>> @@ -27,6 +27,8 @@
>>>  #include <getopt.h>
>>>  #include <sys/epoll.h>
>>>
>>> +#include "linux/compiler.h"
>>> +
>>>  #include <linux/media.h>
>>>
>>>  #include "v4l2-ctl.h"
>>> diff --git a/utils/v4l2-ctl/v4l2-ctl.h b/utils/v4l2-ctl/v4l2-ctl.h
>>> index a1911e80..fd1bd24a 100644
>>> --- a/utils/v4l2-ctl/v4l2-ctl.h
>>> +++ b/utils/v4l2-ctl/v4l2-ctl.h
>>> @@ -1,6 +1,8 @@
>>>  #ifndef _V4L2_CTL_H
>>>  #define _V4L2_CTL_H
>>>
>>> +#include "linux/compiler.h"
>>> +
>>>  #include <cstdint>
>>>  #include <linux/videodev2.h>
>>>  #include <linux/v4l2-subdev.h>
>>> diff --git a/utils/v4l2-dbg/v4l2-dbg.cpp b/utils/v4l2-dbg/v4l2-dbg.cpp
>>> index bd08b4cf..1b0d278a 100644
>>> --- a/utils/v4l2-dbg/v4l2-dbg.cpp
>>> +++ b/utils/v4l2-dbg/v4l2-dbg.cpp
>>> @@ -31,6 +31,8 @@
>>>  #include <sys/klog.h>
>>>  #endif
>>>
>>> +#include "linux/compiler.h"
>>> +
>>>  #include <linux/videodev2.h>
>>>  #include <v4l-getsubopt.h>
>>>
>>


