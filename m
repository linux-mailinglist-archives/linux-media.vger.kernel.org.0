Return-Path: <linux-media+bounces-10984-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D94838BE318
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 15:10:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 664951F267DB
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 13:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEDF515E1F8;
	Tue,  7 May 2024 13:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EZHBlv72"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A451F15D5C8;
	Tue,  7 May 2024 13:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715087406; cv=none; b=AIuxRhHDe/mJGKLfgtJgcSdx1SwUFKTWsIosenSnKHBZB6sZsJOmBTiWzB+vk4ClMmZLIgocQM+NcueIVdW2lJZNAOI2WZJ0aeAYYti8jSk0aNa4tBLWutn2sBFipvcYceaHaE8RL7KymmEQcKlS2QxuQNorNp7Dgm6UF9nyFBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715087406; c=relaxed/simple;
	bh=91/YT1VOTrFtLiK7baAlJz3Kqo9pUnO/BDQZ2CpxqjU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TvLZd3n6BdEaQzoXFCoBInKJpEx21ujv+YqDWvYw+DsV7lYhOSyQDRjcS6X9Sp5WljHTE08OCrIOBsr5dXpW0e+30hS1TEStpH8dKFrps+53FxyYQ8d0dC2BzeCQYrLkNh+/SJYbzf6hyr8sReQD+vPC9tDcPCVsMB2OHg6QNI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EZHBlv72; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-34e0d8b737eso3181876f8f.1;
        Tue, 07 May 2024 06:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715087403; x=1715692203; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zWhuKkDlnxPJbDbjOht3LPyoadKgxR6Zdq3ESsD59zE=;
        b=EZHBlv72dXIxH3xbLCBJNJvqIX6XCngbh95T9XJ/+EM8+k2f/++9znPexmnWgF2pq2
         IpwdXS6LoIQWWJvn27T+gwRgKuuoj2fC3PR5XLouyl9rYBG4Xu7UkHlZI6vyev9LK0T7
         JAbhbxaeUuuhjau5PfKIdlxwOdfvEsS5yf7aTGDy9aI07BIgZkl2WYGOSWgzxLL+y0/K
         cnT0skHO+pI8fWIYfDG/knyJ0U9L4NkxfhOhxYk8qtf/vkMMdfFCeHdyLre8NjwuUr+i
         WIaa4uKvV0mjpunSb1Ao2Rs8Sq5afgnQG/u68McC9vXNdo4T9/1F7VjNSrBmwJuzOa8E
         SeIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715087403; x=1715692203;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zWhuKkDlnxPJbDbjOht3LPyoadKgxR6Zdq3ESsD59zE=;
        b=bdr6a7BWMX9+4DNeC4SJDMzhw8SKftyEGte0EjbBSP3s4ri+NKWjJiWvwRWa3HcO8P
         BZpeJ/Hid9E3wM1VgNas17c3oWGh7UD3RrluowXbuPVO3ZOGysXtLTywbjO75rj4Ydx9
         6uk0ZPVKCxC4o/t1+57u15SN8rLcp1KrPJaYW14lC94lCgA+3LG2qWFJ0FomqwUWxybX
         nxOrj2HX5jdIdvYQ9GCBjtPaS/QNdzT/7X5AnHd7EO5vJ+IL4pdX9t0dckJ81car07gS
         y62jVRli78XzL1fVqM5/4cknbkSZK9rQmBp7bRTun52wOQaqZMMzoN26MUqWmS4Q+P2g
         8kkA==
X-Forwarded-Encrypted: i=1; AJvYcCV1vKihVep/gJ8BuFnQ60RcuubB0doS+qni66ea2EidgPKBfBzmZyumwalb21KP9uvJ56Q4jsEcPksWqfbA+IWKSfDgx8sRU02U1s8=
X-Gm-Message-State: AOJu0YxG8uxIu6f5QYdiAfSQnA7dQGRVju5RkzsTuJ9aiVcO/d3Y1SsQ
	fnGtyCbP003mrgz3Yv76UicmMNeqzUj4mntZ5JPjKO+/GJm8CvW7
X-Google-Smtp-Source: AGHT+IFVS0ZEkqevW9dP+NzuwvDByGtiCtcnyqB2hI1UWywKm3iKHmcKd7uoqFxyB8I12UOS6k4zcw==
X-Received: by 2002:a05:6000:901:b0:34c:ce6a:96fa with SMTP id ffacd0b85a97d-34f81f39e52mr2553850f8f.34.1715087402694;
        Tue, 07 May 2024 06:10:02 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
        by smtp.gmail.com with ESMTPSA id k8-20020a05600c1c8800b00418a6d62ad0sm23528898wms.34.2024.05.07.06.10.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 May 2024 06:10:02 -0700 (PDT)
Message-ID: <8980975d-87db-4d57-9e23-4fb7fbb62e7d@gmail.com>
Date: Tue, 7 May 2024 15:09:56 +0200
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
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <c2e46020-aaa6-4e06-bf73-f05823f913f0@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 05.05.24 um 16:08 schrieb Tetsuo Handa:
> Since commit a6aa8fca4d79 ("dma-buf/sw-sync: Reduce irqsave/irqrestore from
> known context") by error replaced spin_unlock_irqrestore() with
> spin_unlock_irq() for both sync_debugfs_show() and sync_print_obj() despite
> sync_print_obj() is called from sync_debugfs_show(), lockdep complains
> inconsistent lock state warning.
>
> Use plain spin_{lock,unlock}() for sync_print_obj(), for
> sync_debugfs_show() is already using spin_{lock,unlock}_irq().
>
> Reported-by: syzbot <syzbot+a225ee3df7e7f9372dbe@syzkaller.appspotmail.com>
> Closes: https://syzkaller.appspot.com/bug?extid=a225ee3df7e7f9372dbe
> Fixes: a6aa8fca4d79 ("dma-buf/sw-sync: Reduce irqsave/irqrestore from known context")
> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/dma-buf/sync_debug.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma-buf/sync_debug.c b/drivers/dma-buf/sync_debug.c
> index 101394f16930..237bce21d1e7 100644
> --- a/drivers/dma-buf/sync_debug.c
> +++ b/drivers/dma-buf/sync_debug.c
> @@ -110,12 +110,12 @@ static void sync_print_obj(struct seq_file *s, struct sync_timeline *obj)
>   
>   	seq_printf(s, "%s: %d\n", obj->name, obj->value);
>   
> -	spin_lock_irq(&obj->lock);
> +	spin_lock(&obj->lock); /* Caller already disabled IRQ. */
>   	list_for_each(pos, &obj->pt_list) {
>   		struct sync_pt *pt = container_of(pos, struct sync_pt, link);
>   		sync_print_fence(s, &pt->base, false);
>   	}
> -	spin_unlock_irq(&obj->lock);
> +	spin_unlock(&obj->lock);
>   }
>   
>   static void sync_print_sync_file(struct seq_file *s,


