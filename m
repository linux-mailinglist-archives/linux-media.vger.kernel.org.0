Return-Path: <linux-media+bounces-24196-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9D99FEF84
	for <lists+linux-media@lfdr.de>; Tue, 31 Dec 2024 14:11:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37D89188332C
	for <lists+linux-media@lfdr.de>; Tue, 31 Dec 2024 13:11:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4707319D081;
	Tue, 31 Dec 2024 13:11:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D64944E
	for <linux-media@vger.kernel.org>; Tue, 31 Dec 2024 13:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735650661; cv=none; b=r2wVnWcaGmd3ZMD7XqEYBNiNhLvPj5iLiJyjPv/s6Q2QDO7dxj98Lt6opVyd42i1BwGuC6cEyYtZW0FDmS3U+gfRPxr2PLQa2ZSrL7qPckwkmog+bbQSDuECrRdURHkIut3AUCc37zzfGqOF/kCnizsb3Qq4ZF+7bbi+kwElWv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735650661; c=relaxed/simple;
	bh=dUadHPvfY1EDo6rQaRO1cZ+9bk9oqQeBLRFavFp7TAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iDYVgwIxZkgWikHqKGxcKbJwJCAIjBWgTq+VYjdPrUmBZuDaQgqTLttcEpRIt+mZBP0bHYTUKM0h2S7NkOvBZI4VgaeNYL70WuVsZABgHReUYySEl4eernlsOUmocpvvyoWpwujAjFxx1TUabJ5kzbed3ZGfqsJL6r8UyzU2e1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDD5CC4CED2;
	Tue, 31 Dec 2024 13:11:00 +0000 (UTC)
Message-ID: <e6a1d480-ffd6-497f-a0af-91841e87c205@xs4all.nl>
Date: Tue, 31 Dec 2024 14:10:59 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: cec: include linux/debugfs.h and
 linux/seq_file.h where needed
To: Jani Nikula <jani.nikula@intel.com>, linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
References: <20241217100024.1858704-1-jani.nikula@intel.com>
 <871pxpp7d5.fsf@intel.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <871pxpp7d5.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/12/2024 15:34, Jani Nikula wrote:
> On Tue, 17 Dec 2024, Jani Nikula <jani.nikula@intel.com> wrote:
>> Having cec.h include linux/debugfs.h leads to all users of all cec
>> headers include and depend on debugfs.h and its dependencies for no
>> reason. Drop the include from cec.h, and include debugfs.h and
>> seq_file.h where needed.
>>
>> Sort all the modified include lists while at it.
>>
>> Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> Cc: linux-media@vger.kernel.org
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 
> Ping?

I plan to pick it up next week, when I'm back from my Christmas vacation.

Regards,

	Hans

> 
>>
>> ---
>>
>> v2: Rebase, update cec-pin-error-inj.c and cec-gpio.c too
>>
>> Depends on commit ae19ba915eb7 ("drm/i915/display: include
>> media/cec-notifier.h and linux/debugfs.h where needed") in v6.13-rc1
>> ---
>>  drivers/media/cec/core/cec-adap.c              | 5 +++--
>>  drivers/media/cec/core/cec-core.c              | 5 +++--
>>  drivers/media/cec/core/cec-pin-error-inj.c     | 3 ++-
>>  drivers/media/cec/core/cec-pin.c               | 3 ++-
>>  drivers/media/cec/platform/cec-gpio/cec-gpio.c | 7 ++++---
>>  include/media/cec.h                            | 1 -
>>  6 files changed, 14 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
>> index c7d36010c890..ba6828ef540e 100644
>> --- a/drivers/media/cec/core/cec-adap.c
>> +++ b/drivers/media/cec/core/cec-adap.c
>> @@ -7,12 +7,13 @@
>>  
>>  #include <linux/errno.h>
>>  #include <linux/init.h>
>> -#include <linux/module.h>
>>  #include <linux/kernel.h>
>>  #include <linux/kmod.h>
>>  #include <linux/ktime.h>
>> -#include <linux/slab.h>
>>  #include <linux/mm.h>
>> +#include <linux/module.h>
>> +#include <linux/seq_file.h>
>> +#include <linux/slab.h>
>>  #include <linux/string.h>
>>  #include <linux/types.h>
>>  
>> diff --git a/drivers/media/cec/core/cec-core.c b/drivers/media/cec/core/cec-core.c
>> index ca0db8d457b4..e10bd588a586 100644
>> --- a/drivers/media/cec/core/cec-core.c
>> +++ b/drivers/media/cec/core/cec-core.c
>> @@ -5,13 +5,14 @@
>>   * Copyright 2016 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
>>   */
>>  
>> +#include <linux/debugfs.h>
>>  #include <linux/errno.h>
>>  #include <linux/init.h>
>> -#include <linux/module.h>
>>  #include <linux/kernel.h>
>>  #include <linux/kmod.h>
>> -#include <linux/slab.h>
>>  #include <linux/mm.h>
>> +#include <linux/module.h>
>> +#include <linux/slab.h>
>>  #include <linux/string.h>
>>  #include <linux/types.h>
>>  
>> diff --git a/drivers/media/cec/core/cec-pin-error-inj.c b/drivers/media/cec/core/cec-pin-error-inj.c
>> index fc0968b9d40e..6e61a04b8168 100644
>> --- a/drivers/media/cec/core/cec-pin-error-inj.c
>> +++ b/drivers/media/cec/core/cec-pin-error-inj.c
>> @@ -4,8 +4,9 @@
>>   */
>>  
>>  #include <linux/delay.h>
>> -#include <linux/slab.h>
>>  #include <linux/sched/types.h>
>> +#include <linux/seq_file.h>
>> +#include <linux/slab.h>
>>  
>>  #include <media/cec-pin.h>
>>  #include "cec-pin-priv.h"
>> diff --git a/drivers/media/cec/core/cec-pin.c b/drivers/media/cec/core/cec-pin.c
>> index 330d5d5d86ab..a70451d99ebc 100644
>> --- a/drivers/media/cec/core/cec-pin.c
>> +++ b/drivers/media/cec/core/cec-pin.c
>> @@ -4,8 +4,9 @@
>>   */
>>  
>>  #include <linux/delay.h>
>> -#include <linux/slab.h>
>>  #include <linux/sched/types.h>
>> +#include <linux/seq_file.h>
>> +#include <linux/slab.h>
>>  
>>  #include <media/cec-pin.h>
>>  #include "cec-pin-priv.h"
>> diff --git a/drivers/media/cec/platform/cec-gpio/cec-gpio.c b/drivers/media/cec/platform/cec-gpio/cec-gpio.c
>> index cf64e8871fe5..50cdc557c943 100644
>> --- a/drivers/media/cec/platform/cec-gpio/cec-gpio.c
>> +++ b/drivers/media/cec/platform/cec-gpio/cec-gpio.c
>> @@ -3,11 +3,12 @@
>>   * Copyright 2017 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
>>   */
>>  
>> -#include <linux/module.h>
>> -#include <linux/interrupt.h>
>>  #include <linux/delay.h>
>> -#include <linux/platform_device.h>
>>  #include <linux/gpio/consumer.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/seq_file.h>
>>  #include <media/cec-notifier.h>
>>  #include <media/cec-pin.h>
>>  
>> diff --git a/include/media/cec.h b/include/media/cec.h
>> index 16b412b3131b..0c8e86115b6f 100644
>> --- a/include/media/cec.h
>> +++ b/include/media/cec.h
>> @@ -10,7 +10,6 @@
>>  
>>  #include <linux/poll.h>
>>  #include <linux/fs.h>
>> -#include <linux/debugfs.h>
>>  #include <linux/device.h>
>>  #include <linux/cdev.h>
>>  #include <linux/kthread.h>
> 


