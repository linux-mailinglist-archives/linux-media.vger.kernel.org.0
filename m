Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A63B1C4AC8
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 11:49:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727244AbfJBJt0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 05:49:26 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:47451 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726772AbfJBJtZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Oct 2019 05:49:25 -0400
Received: from [IPv6:2001:420:44c1:2577:9d1d:ff1f:dc58:e8af] ([IPv6:2001:420:44c1:2577:9d1d:ff1f:dc58:e8af])
        by smtp-cloud7.xs4all.net with ESMTPA
        id FbG4icU6njZ8vFbG7ih8uC; Wed, 02 Oct 2019 11:49:24 +0200
Subject: Re: Build failed in Jenkins: v4l-utils #43
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
References: <1586568084.1.1570004204603.JavaMail.jenkins@builder.linuxtv.org>
 <6a1df171-bd07-5eef-1917-4171fb3bc359@xs4all.nl>
 <20191002063658.3771c1fa@coco.lan>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <90907ad0-6fe3-5293-aeeb-44ecdfb840da@xs4all.nl>
Date:   Wed, 2 Oct 2019 11:49:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191002063658.3771c1fa@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKMTsjkVu7uK/lw2mq+WxDda/WVuG6rEF9Roh6ofvoia1MtiwNyPUxZDQhAOaqoRqvGuA55r3JJ0GAGJ3nID9egsXwj7njIdC9RTXHbBeyFuVCLpkYYa
 kN8UtABwgvthVf5U84WTMRen9nDz8vcE1691Su72ik962v5i45u5dzOKk+Iu0BZMJDoDowpsVj1Hogr/sG9U38nlw9AGuST8NbC0+raclS0aUpBFNgthy9rZ
 Tecd+icBsm+4RBA86BJQ9gtM2NsDzdCHGy9k33nEvPm2hqBr1VQXfmIaXrjWUr0KKyoYlToT8uBYdI6ekUwCMA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/2/19 11:36 AM, Mauro Carvalho Chehab wrote:
> Em Wed, 2 Oct 2019 10:25:02 +0200
> Hans Verkuil <hverkuil@xs4all.nl> escreveu:
> 
>> Hi Mauro,
>>
>> On 10/2/19 10:16 AM, Jenkins Builder Robot wrote:
>>> See <https://builder.linuxtv.org/job/v4l-utils/43/display/redirect?page=changes>
>>>
>>> Changes:
>>>
>>> [hverkuil-cisco] keytable: add new generated keymaps
>>>
>>> [hverkuil-cisco] msg2ctl.pl: add newline after log_msg
>>>
>>> [hverkuil-cisco] cec-follower: drop the hardcoded UI commands list
>>>
>>> [hverkuil-cisco] cec-ctl/cec-log: use new CEC_OP_UI_CMD defines  
>>
>> You need to remove utils/cec-follower/cec-log.h.
>>
>> This file was generated but the generated file is now called cec-log-gen.h.
>> A new cec-log.h was also added to utils/common as a companion to cec-log.cpp.
>>
>> Unfortunately, the old cec-log.h clashes with the new cec-log.h. And since
>> the old cec-log.h was generated and so is not part of the git repo it is
>> not removed as part of a 'git pull'.
>>
>> Anyway, just remove utils/cec-follower/cec-log.h and it compiles again.
> 
> I manually removed the file at the builder and at the slave machines and
> asked for a new build. The build now succeeded.
> 
> That's said, we should really avoid disruptive changes like that, fixing
> the building system for it to do the right thing, as users of the v4l-utils 
> will also face the same issue if they update their git trees.
> 
> At any time, a clean git update with something similar to:
> 
> 	git remote update
> 	git fetch origin
> 	git reset --hard origin/master
> 	./bootstrap.sh
> 	./configure
> 	make
> 
> should work.
> 
> Regards,
> Mauro
> 

Yes, I discovered it too late. That said, I'm not sure what to do about
it since the old generated file is not under the control of git.

A 'make distclean' before the 'git fetch' would remove it, but after the
update it is just an orphaned file.

I've actually added a 'make distclean' in my daily build scripts.

Regards,

	Hans
