Return-Path: <linux-media+bounces-11847-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9EA8CE62E
	for <lists+linux-media@lfdr.de>; Fri, 24 May 2024 15:27:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 392E11F2208A
	for <lists+linux-media@lfdr.de>; Fri, 24 May 2024 13:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D29DF12BF29;
	Fri, 24 May 2024 13:27:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284C36EB4A
	for <linux-media@vger.kernel.org>; Fri, 24 May 2024 13:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716557235; cv=none; b=nwcH0vXIcOGE7yDrHY/bhRwG91GyXz6Ljk2QuN9PHRsymI+V8HY9o5V8Cff/JWtjGFwO3AlSfIYseN5ZHpa5pkH0iaGAcC4Ph/jyne3Fc9jlRRr5G50wy0Cq3r2WPnFDsSNWRK0tNeM92LOpeH47G7M2SWC2ZN+nE30hRO0UnxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716557235; c=relaxed/simple;
	bh=H5tHz0jKPpcZpnZvnj7YDbFMUGOnlmjXfNjc3sqhg0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D680psCl/oG+lqww2Ubcu/90QYLsQXNUeE7Io145/bRVTEeH9D8WyD62evRtasrHMITUzG64H1BRJEqCupmaAaZmEeoRjgof4vqUuNKXNlx92vk//WYspXDDEmpUaI/5by3L0Lrs43Jrurg7INmvv74lJfwc+ozFnr1ua7q0LmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from fsav313.sakura.ne.jp (fsav313.sakura.ne.jp [153.120.85.144])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 44ODQKlS037943;
	Fri, 24 May 2024 22:26:20 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav313.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav313.sakura.ne.jp);
 Fri, 24 May 2024 22:26:20 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav313.sakura.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 44ODQJtV037935
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 24 May 2024 22:26:19 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <0204a827-ca88-4cb6-839b-f4a637bcbf71@I-love.SAKURA.ne.jp>
Date: Fri, 24 May 2024 22:26:20 +0900
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linaro-mm-sig] [PATCH] dma-buf/sw-sync: don't enable IRQ from
 sync_print_obj()
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
        syzbot <syzbot+a225ee3df7e7f9372dbe@syzkaller.appspotmail.com>,
        syzkaller-bugs@googlegroups.com,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        Christian Konig <christian.koenig@amd.com>,
        Sean Paul
 <seanpaul@chromium.org>,
        Chris Wilson <chris@chris-wilson.co.uk>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org
References: <0000000000000946190610bf7bd5@google.com>
 <c2e46020-aaa6-4e06-bf73-f05823f913f0@I-love.SAKURA.ne.jp>
 <8980975d-87db-4d57-9e23-4fb7fbb62e7d@gmail.com>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <8980975d-87db-4d57-9e23-4fb7fbb62e7d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2024/05/07 22:09, Christian König wrote:
> Am 05.05.24 um 16:08 schrieb Tetsuo Handa:
>> Since commit a6aa8fca4d79 ("dma-buf/sw-sync: Reduce irqsave/irqrestore from
>> known context") by error replaced spin_unlock_irqrestore() with
>> spin_unlock_irq() for both sync_debugfs_show() and sync_print_obj() despite
>> sync_print_obj() is called from sync_debugfs_show(), lockdep complains
>> inconsistent lock state warning.
>>
>> Use plain spin_{lock,unlock}() for sync_print_obj(), for
>> sync_debugfs_show() is already using spin_{lock,unlock}_irq().
>>
>> Reported-by: syzbot <syzbot+a225ee3df7e7f9372dbe@syzkaller.appspotmail.com>
>> Closes: https://syzkaller.appspot.com/bug?extid=a225ee3df7e7f9372dbe
>> Fixes: a6aa8fca4d79 ("dma-buf/sw-sync: Reduce irqsave/irqrestore from known context")
>> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> 
> Reviewed-by: Christian König <christian.koenig@amd.com>

Thank you. Who can take this patch?

> 
>> ---
>>   drivers/dma-buf/sync_debug.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/dma-buf/sync_debug.c b/drivers/dma-buf/sync_debug.c
>> index 101394f16930..237bce21d1e7 100644
>> --- a/drivers/dma-buf/sync_debug.c
>> +++ b/drivers/dma-buf/sync_debug.c
>> @@ -110,12 +110,12 @@ static void sync_print_obj(struct seq_file *s, struct sync_timeline *obj)
>>         seq_printf(s, "%s: %d\n", obj->name, obj->value);
>>   -    spin_lock_irq(&obj->lock);
>> +    spin_lock(&obj->lock); /* Caller already disabled IRQ. */
>>       list_for_each(pos, &obj->pt_list) {
>>           struct sync_pt *pt = container_of(pos, struct sync_pt, link);
>>           sync_print_fence(s, &pt->base, false);
>>       }
>> -    spin_unlock_irq(&obj->lock);
>> +    spin_unlock(&obj->lock);
>>   }
>>     static void sync_print_sync_file(struct seq_file *s,
> 


