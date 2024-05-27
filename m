Return-Path: <linux-media+bounces-11907-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE7B8CF9AE
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 09:03:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79E7C28157A
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 07:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83BDC17BB6;
	Mon, 27 May 2024 07:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DiIoeJ90"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D12717BA7;
	Mon, 27 May 2024 07:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716793380; cv=none; b=E1F+A4+Uwspux26KdPgZ2a0+DgD1LpksKgZa8eVWlfA4q4Sf/byzomP7k+JqEmbjJ0fugX0gEvPr9AkvdGULRUrw70i48gTLbklUWbt96NY8o1PH3fQDhhFyk5XG6oXVoBHY3yGB8AvRUjgAPVu0TIHSWtBsBUYFp/BgvKNhf/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716793380; c=relaxed/simple;
	bh=BCgQibrhwKD5TsoLszllSZGNYp6Y69BDG+Y5zL9rukc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ii2ZhhKSNVvJ8gJT0rS0ShqHM2KY6dox50aMxtRWWDuadCOBjuewYJcRCh4Bms+ICb24oSNs2Vc/V2lbZcT1lIx1MlaMv+DL0ZPr3CXkkLd6bO+xYuhHMhUIeOy+fXugDpLRU9BCSB23H2snARGz8KYUt3gUylgEUIAqauhWsx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DiIoeJ90; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-354de3c5d00so2405255f8f.1;
        Mon, 27 May 2024 00:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716793378; x=1717398178; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RhTDv/X2MzeaoxY9UlTupOqZ4dzoGfDZJ1jJv+dJqEs=;
        b=DiIoeJ90qi4SMzLoiTSHvjRiryjrcB9WQ4qL2MW/E4yTZ+uPhDpgMtd1DEpxQThtqj
         F/Of/c9/ji6GBDZHQJ19BzKbozaBPZQuhQpbfUkBfwnmS6M1AE095/ykOH48EkzgER57
         PnyXDawNEHT+omyhi0H/wmj2CoJwBf3iEGs9XRAQjR8wN4SlJozPqU+FU6UYchSbMHsL
         BMGHXk2vIi4cDFKgbp3t0bAhFGz92l3bctLW3nB0pme0+JGir5NFk1dCxu39cE6+OuXh
         AJ81DvewKBHDdv/oheoEFdNU8EmLGtvivIvxGu5lZxG+HKKaIkY7HfIdI3+WgjQEC6De
         XYDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716793378; x=1717398178;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RhTDv/X2MzeaoxY9UlTupOqZ4dzoGfDZJ1jJv+dJqEs=;
        b=w/+3ABXYHJRoq31eUzoJnliN6sMexPbCeXw9hzngqMypz6opaSxegYlW0rXou/BJQo
         3V7zgoDJk6NQ2V2mBTfgKCuQ7ZWNzASmgHjf0Mbo5M9bnUiaEJQm2Qth/nvNKWsMwPZF
         SJSkp7BmoQAFnnX9LcO5D3QjDYVOXtUFMvkJTXJRRIObexfy5iE+OiZ5Oz+84gg64Gmg
         /nek1IWTbmGknAW3iecIyXuLIRP4BMCztgoDw979Fz/aui14HPPTb0M98J5DJHOwNPsD
         fw1rat54kVxQTKtL9XffATOz6O+bXo6aBzkm/eGHbfGSbxButYrr4+F4Ye0YTJfvJTlz
         n4kg==
X-Forwarded-Encrypted: i=1; AJvYcCWtORGAoszL2Bs7An8aMwkMgV3/zQxJh4vDfBEndafLjkJQah73PNBVgbij7Zxt3DHgFbAyS/iyJWC6+icfZb0NqcC50IURaco4ZlE=
X-Gm-Message-State: AOJu0Yw7YaAc70yfy/EDnJtRi+mmZbT4J5ypbX2tjD7BAFAxCDOhDVbb
	fLdBnjselN21/8eN0bt7OeGNrAQHxcf9RFVRobFzN2moLMCWu9mR
X-Google-Smtp-Source: AGHT+IFMEQcPgs6+ChlvQyh9qDP2U9NYMEM8C1RNoY8/vGGrII0iOFxxNC1K3BaB2DJMg89FFSCHqA==
X-Received: by 2002:a5d:4d85:0:b0:354:ed11:a20a with SMTP id ffacd0b85a97d-354f75a0adbmr10598776f8f.29.1716793377308;
        Mon, 27 May 2024 00:02:57 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3557a08aba8sm8089705f8f.42.2024.05.27.00.02.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 May 2024 00:02:56 -0700 (PDT)
Message-ID: <0b04b587-77a4-4ac4-8b15-6cde0f0c5f5a@gmail.com>
Date: Mon, 27 May 2024 09:02:54 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linaro-mm-sig] [PATCH] dma-buf/sw-sync: don't enable IRQ from
 sync_print_obj()
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 syzbot <syzbot+a225ee3df7e7f9372dbe@syzkaller.appspotmail.com>,
 syzkaller-bugs@googlegroups.com, Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 Christian Konig <christian.koenig@amd.com>, Sean Paul
 <seanpaul@chromium.org>, Chris Wilson <chris@chris-wilson.co.uk>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org
References: <0000000000000946190610bf7bd5@google.com>
 <c2e46020-aaa6-4e06-bf73-f05823f913f0@I-love.SAKURA.ne.jp>
 <8980975d-87db-4d57-9e23-4fb7fbb62e7d@gmail.com>
 <0204a827-ca88-4cb6-839b-f4a637bcbf71@I-love.SAKURA.ne.jp>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <0204a827-ca88-4cb6-839b-f4a637bcbf71@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 24.05.24 um 15:26 schrieb Tetsuo Handa:
> On 2024/05/07 22:09, Christian König wrote:
>> Am 05.05.24 um 16:08 schrieb Tetsuo Handa:
>>> Since commit a6aa8fca4d79 ("dma-buf/sw-sync: Reduce irqsave/irqrestore from
>>> known context") by error replaced spin_unlock_irqrestore() with
>>> spin_unlock_irq() for both sync_debugfs_show() and sync_print_obj() despite
>>> sync_print_obj() is called from sync_debugfs_show(), lockdep complains
>>> inconsistent lock state warning.
>>>
>>> Use plain spin_{lock,unlock}() for sync_print_obj(), for
>>> sync_debugfs_show() is already using spin_{lock,unlock}_irq().
>>>
>>> Reported-by: syzbot <syzbot+a225ee3df7e7f9372dbe@syzkaller.appspotmail.com>
>>> Closes: https://syzkaller.appspot.com/bug?extid=a225ee3df7e7f9372dbe
>>> Fixes: a6aa8fca4d79 ("dma-buf/sw-sync: Reduce irqsave/irqrestore from known context")
>>> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
> Thank you. Who can take this patch?

I pushed it to drm-misc-fixes.

Thanks,
Christian.

>
>>> ---
>>>    drivers/dma-buf/sync_debug.c | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/dma-buf/sync_debug.c b/drivers/dma-buf/sync_debug.c
>>> index 101394f16930..237bce21d1e7 100644
>>> --- a/drivers/dma-buf/sync_debug.c
>>> +++ b/drivers/dma-buf/sync_debug.c
>>> @@ -110,12 +110,12 @@ static void sync_print_obj(struct seq_file *s, struct sync_timeline *obj)
>>>          seq_printf(s, "%s: %d\n", obj->name, obj->value);
>>>    -    spin_lock_irq(&obj->lock);
>>> +    spin_lock(&obj->lock); /* Caller already disabled IRQ. */
>>>        list_for_each(pos, &obj->pt_list) {
>>>            struct sync_pt *pt = container_of(pos, struct sync_pt, link);
>>>            sync_print_fence(s, &pt->base, false);
>>>        }
>>> -    spin_unlock_irq(&obj->lock);
>>> +    spin_unlock(&obj->lock);
>>>    }
>>>      static void sync_print_sync_file(struct seq_file *s,


