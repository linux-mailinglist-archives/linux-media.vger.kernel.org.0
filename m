Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 160C9C86C9
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 12:56:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728057AbfJBK46 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 06:56:58 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:48681 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726157AbfJBK46 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Oct 2019 06:56:58 -0400
Received: from [IPv6:2001:420:44c1:2577:9d1d:ff1f:dc58:e8af] ([IPv6:2001:420:44c1:2577:9d1d:ff1f:dc58:e8af])
        by smtp-cloud7.xs4all.net with ESMTPA
        id FcJQid4aAjZ8vFcJTihZAL; Wed, 02 Oct 2019 12:56:55 +0200
Subject: Re: Build failed in Jenkins: v4l-utils #43
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
References: <1586568084.1.1570004204603.JavaMail.jenkins@builder.linuxtv.org>
 <6a1df171-bd07-5eef-1917-4171fb3bc359@xs4all.nl>
 <20191002063658.3771c1fa@coco.lan>
 <90907ad0-6fe3-5293-aeeb-44ecdfb840da@xs4all.nl>
 <20191002074106.6fc8c73a@coco.lan>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <65018c99-7fff-b3ff-dabf-77d73a2daba5@xs4all.nl>
Date:   Wed, 2 Oct 2019 12:56:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191002074106.6fc8c73a@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfGEfy9V43NKw97HUCIctSi6OVVxLYXVacL/CokGgDsdzwD04YafRe3ndpNx+j3iJ2Mk7vspolJhe3PjMAGvtpChGvmRmkslN/pThoG29IGqY8vXgGAdQ
 mE+ZWTdtoGa/ktikKBYc2K2q6IqxLxrTfVNZTctkLNrPBQmU+JSF6NVKU3/Ik/th1tWiIndrfkt1EnRkN/BzNYRuCd97ah4OI2OvDDKxXWtEWREFxpFBA/qd
 7Zj+rmy2VVrB4GupU5t2sj0AW8z9E4n22qklPZZgYPtRFFjy4Oy8L8sc3ePsbSeu3KCUzAmNMk0ULCRoKExjWQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/2/19 12:41 PM, Mauro Carvalho Chehab wrote:
> Em Wed, 2 Oct 2019 11:49:20 +0200
> Hans Verkuil <hverkuil@xs4all.nl> escreveu:
> 
>> On 10/2/19 11:36 AM, Mauro Carvalho Chehab wrote:
>>> Em Wed, 2 Oct 2019 10:25:02 +0200
>>> Hans Verkuil <hverkuil@xs4all.nl> escreveu:
>>>   
>>>> Hi Mauro,
>>>>
>>>> On 10/2/19 10:16 AM, Jenkins Builder Robot wrote:  
>>>>> See <https://builder.linuxtv.org/job/v4l-utils/43/display/redirect?page=changes>
>>>>>
>>>>> Changes:
>>>>>
>>>>> [hverkuil-cisco] keytable: add new generated keymaps
>>>>>
>>>>> [hverkuil-cisco] msg2ctl.pl: add newline after log_msg
>>>>>
>>>>> [hverkuil-cisco] cec-follower: drop the hardcoded UI commands list
>>>>>
>>>>> [hverkuil-cisco] cec-ctl/cec-log: use new CEC_OP_UI_CMD defines    
>>>>
>>>> You need to remove utils/cec-follower/cec-log.h.
>>>>
>>>> This file was generated but the generated file is now called cec-log-gen.h.
>>>> A new cec-log.h was also added to utils/common as a companion to cec-log.cpp.
>>>>
>>>> Unfortunately, the old cec-log.h clashes with the new cec-log.h. And since
>>>> the old cec-log.h was generated and so is not part of the git repo it is
>>>> not removed as part of a 'git pull'.
>>>>
>>>> Anyway, just remove utils/cec-follower/cec-log.h and it compiles again.  
>>>
>>> I manually removed the file at the builder and at the slave machines and
>>> asked for a new build. The build now succeeded.
>>>
>>> That's said, we should really avoid disruptive changes like that, fixing
>>> the building system for it to do the right thing, as users of the v4l-utils 
>>> will also face the same issue if they update their git trees.
>>>
>>> At any time, a clean git update with something similar to:
>>>
>>> 	git remote update
>>> 	git fetch origin
>>> 	git reset --hard origin/master
>>> 	./bootstrap.sh
>>> 	./configure
>>> 	make
>>>
>>> should work.
>>>
>>> Regards,
>>> Mauro
>>>   
>>
>> Yes, I discovered it too late. That said, I'm not sure what to do about
>> it since the old generated file is not under the control of git.
>>
>> A 'make distclean' before the 'git fetch' would remove it, but after the
>> update it is just an orphaned file.
>>
>> I've actually added a 'make distclean' in my daily build scripts.
> 
> That's a very bad idea. The builds should check and pinpoint to
> regressions at the building system too.
> 
> If I understand the problem, you're saying that now cec-log.h depends on
> the generated cec-log-gen.h, right?
> 
> If so, this could be easily fixable by adding an explicit dependency
> rule to the Makefile.am, like:
> 
> 	cec-log.h: cec-log-gen.h

No, cec-log.h has nothing to do with cec-log-gen.h.

utils/cec-follower/cec-log.h was a generated file, and badly named.

So this was renamed to cec-log-gen.h.

In addition, a new header utils/common/cec-log.h was added containing
prototypes for utils/common/cec-log.cpp.

So after a git pull you end up with two cec-log.h headers:

utils/common/cec-log.h and the orphaned utils/cec-follower/cec-log.h.

Unfortunately, the orphaned cec-log.h is included instead of the one
in utils/common.

I'm looking at reorganizing the way this works so perhaps this issue
will go away soon.

Regards,

	Hans
