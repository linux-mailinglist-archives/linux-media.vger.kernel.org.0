Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 221DD30BA09
	for <lists+linux-media@lfdr.de>; Tue,  2 Feb 2021 09:36:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232464AbhBBIfh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 03:35:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232253AbhBBIe2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Feb 2021 03:34:28 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1D5BC06174A;
        Tue,  2 Feb 2021 00:33:45 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id f14so4348899ejc.8;
        Tue, 02 Feb 2021 00:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=lgrmCKn7fa8BZQSBnv8N1P+Cvs3u32JT2Mm/OzoKs+0=;
        b=t+fWg0vAwx5ufrwZKcMvat8HOg68VhwiqVfrZQQW4H64LWXOPDnoGUraWGjkq2DLDq
         QLcFd/Lm7Ezl5DlNjLXXzTzdJB0mggMuj+NzctFSz+DpnVh6UswTwClRO3jKh0vLrZm/
         YeD0FWr+o2jYc9nZp8Czk+hbSGzo5mY5gfo55zgUjTmvOVpIXpxOHI7P7vFgkOf4RCmM
         KCMAuM0uwL4X9CLvhfo/pckIfVxsN9QLHiKEGWiEALrdGTEAilbwzpL7+MDp58Y0sjE8
         pmceePGlgiIsoEOhVcaeYOXB4cETjV/RP2aPcHEWDEnySS7P9FT0p8hn9nbDw+EQPvDY
         EEdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:to:cc:references:from
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=lgrmCKn7fa8BZQSBnv8N1P+Cvs3u32JT2Mm/OzoKs+0=;
        b=BSMut05VRi7ve+3HamztdDvyRLEj8ZZgSTdjIWP7A82qyPRaEFusqum7PQqdw6yuxk
         LHKK8xGXxoQTuM1mJ/lC90qQO1GTRbCCMHvubec61r2sHcn+rXoz2YtNKt+6Lp3mJWMZ
         a/eLMySYjRzEdy+lpnUHpL1IGp9XcQQkhurzAzdrgSGz6/DxFQJJNz0GkxbXn3KIq5x5
         XqEY4JgUalKy+vfjb5HzdkPUJDtoeCoBenma1Tz0KLhd+VTGR9RFZoME5sA/QP7tvQNC
         qeKcduPy/a1YkgO1XZC5yT5lcALEJZt+IXHfVA2TZ2T0bxLa+rTBtgMntVtptPFGyILL
         9vTQ==
X-Gm-Message-State: AOAM532R8InkoQwfRieDPjWQiVVNDjlX956l8fwRLr62AXbATyIKi7iM
        XA4WYHm3+Uf8gkyaeNfy/uTCbtNT3To=
X-Google-Smtp-Source: ABdhPJxm7JcawV6X0WgZcSOHtcFQbGQTHlwGpTNi24TTZued12CJDBGns027oBVSU3dhbviuAQ4vxQ==
X-Received: by 2002:a17:906:30cd:: with SMTP id b13mr21330941ejb.336.1612254824483;
        Tue, 02 Feb 2021 00:33:44 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7? ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
        by smtp.gmail.com with ESMTPSA id u23sm9727370edt.87.2021.02.02.00.33.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Feb 2021 00:33:43 -0800 (PST)
Reply-To: christian.koenig@amd.com
Subject: Re: [Linaro-mm-sig] [PATCH 08/29] dma-buf: Avoid comma separated
 statements
To:     lyude@redhat.com,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Joe Perches <joe@perches.com>,
        Jiri Kosina <trivial@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>
Cc:     linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
References: <cover.1598331148.git.joe@perches.com>
 <990bf6f33ccaf73ad56eb4bea8bd2c0db5e90a31.1598331148.git.joe@perches.com>
 <a87b95d11c22d997ebc423bba71cabef15ca0bac.camel@perches.com>
 <4d5891b7-ea87-974e-d260-f78c3af326bc@amd.com>
 <4266568da0437ea605bfb2810ead2b05475bfbb8.camel@redhat.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <ad79432b-9c83-ce5a-f8ca-ec45bb55fb2c@gmail.com>
Date:   Tue, 2 Feb 2021 09:33:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4266568da0437ea605bfb2810ead2b05475bfbb8.camel@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Yeah, known issue.

An NTP server which I don't have access to has gone bananas and 
sometimes spits out invalid time stamps.

Only thing I can do is wait for an admin to take care of this.

Christian.

Am 01.02.21 um 22:54 schrieb Lyude Paul:
> This is entirely unrelated to this thread, but I noticed when going through dri-
> devel that this email is somehow dated two days in the future from now.
>
> On Wed, 2021-02-03 at 14:26 +0100, Christian König wrote:
>> Am 30.01.21 um 19:47 schrieb Joe Perches:
>>> On Mon, 2020-08-24 at 21:56 -0700, Joe Perches wrote:
>>>> Use semicolons and braces.
>>> Ping?
>>>    
>>>> Signed-off-by: Joe Perches <joe@perches.com>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>
>> Do you have commit rights to drm-misc-next?
>>
>>>> ---
>>>>    drivers/dma-buf/st-dma-fence.c | 7 +++++--
>>>>    1 file changed, 5 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/dma-buf/st-dma-fence.c b/drivers/dma-buf/st-dma-
>>>> fence.c
>>>> index e593064341c8..c8a12d7ad71a 100644
>>>> --- a/drivers/dma-buf/st-dma-fence.c
>>>> +++ b/drivers/dma-buf/st-dma-fence.c
>>>> @@ -471,8 +471,11 @@ static int thread_signal_callback(void *arg)
>>>>                          dma_fence_signal(f1);
>>>>    
>>>>
>>>>                  smp_store_mb(cb.seen, false);
>>>> -               if (!f2 || dma_fence_add_callback(f2, &cb.cb,
>>>> simple_callback))
>>>> -                       miss++, cb.seen = true;
>>>> +               if (!f2 ||
>>>> +                   dma_fence_add_callback(f2, &cb.cb, simple_callback)) {
>>>> +                       miss++;
>>>> +                       cb.seen = true;
>>>> +               }
>>>>    
>>>>
>>>>                  if (!t->before)
>>>>                          dma_fence_signal(f1);
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel

