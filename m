Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A595E362BB7
	for <lists+linux-media@lfdr.de>; Sat, 17 Apr 2021 01:03:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234874AbhDPXDe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Apr 2021 19:03:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234843AbhDPXDc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Apr 2021 19:03:32 -0400
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15D42C061756
        for <linux-media@vger.kernel.org>; Fri, 16 Apr 2021 16:03:07 -0700 (PDT)
Received: by mail-io1-xd31.google.com with SMTP id a11so27136614ioo.0
        for <linux-media@vger.kernel.org>; Fri, 16 Apr 2021 16:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mh7KPhLlx4lKOuec3qu70zVXkFr1yF2gQQ0PQcauUIE=;
        b=UJFGZGUgrqrrouEiWcHMIoZhuhTGc+Ot0YkymlGxKSqKbjNjVbjm4SiG6aWsMaJpta
         GTKzjQdXOagv58okSyt2i6YIPbt23iXeJ0uoDafPSYycAhNuVGEnfN5GPTc22QWZ78w9
         /It3/bnDylnpJbRnLQV+OegtKBc+ea1J2KEAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mh7KPhLlx4lKOuec3qu70zVXkFr1yF2gQQ0PQcauUIE=;
        b=t1Svm5/zdUWHlLa9YOszJUuni8EkVHUzCNMnDK3URo0JFKc2HRk9j9x8/ITejyKEuD
         VHZTX/wFdGp/a3ywUon/6/mY+3eiTGjz5qcg/i1jg1eE7bEqteFR5yrz0UhrXqOp48AP
         /Al61jZGzAZQkYeHmrqUJEtp4DG0NUJDVQ2+haLWVui8LMsMNJbB2ezE5V/Xc9pjkLyE
         jsL6SUr/Byf8qYP97eoiRWqBTvlOk7osRDe6dO9NQQXMK9qjJg3Q7jjj4utx/VwPsUTZ
         8WOEbx7kuwYl6k+OrKNkrtp+ia9/kgxOZEmW/dxVe6la0AYL/GBZIaNtrVO1Rdi2ckx/
         WkCA==
X-Gm-Message-State: AOAM531mHjVkket5eddtUp/luNPCM86F1ZRlQiyirRJpYCMcHMz3pYKJ
        OwxPurW7+JNi/0sNmvv8GqovTA==
X-Google-Smtp-Source: ABdhPJwzleM/3omurgCNaMjlaQDqHjAgQEP4qcU921wdzrTgDfEcZSteDh7nbh3eY3EvlxqnlaFkDQ==
X-Received: by 2002:a02:9389:: with SMTP id z9mr6127773jah.60.1618614186189;
        Fri, 16 Apr 2021 16:03:06 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id f8sm3417150ilr.20.2021.04.16.16.03.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Apr 2021 16:03:05 -0700 (PDT)
Subject: Re: [PATCH RFC v3] media: em28xx: Fix race condition between open and
 init function
To:     Igor Torrente <igormtorrente@gmail.com>, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        kernel test robot <lkp@intel.com>,
        syzbot+b2391895514ed9ef4a8e@syzkaller.appspotmail.com,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20210415140724.15398-1-igormtorrente@gmail.com>
 <d254bf85-5185-6b21-afc6-fb00a9278186@linuxfoundation.org>
 <c18180b5-52b9-e787-654c-6967ecb81dce@gmail.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <49c44747-1f25-11a1-1132-abfe406955b2@linuxfoundation.org>
Date:   Fri, 16 Apr 2021 17:03:05 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <c18180b5-52b9-e787-654c-6967ecb81dce@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 4/16/21 1:33 PM, Igor Torrente wrote:
> 
> 
> On 4/15/21 2:25 PM, Shuah Khan wrote:
>> On 4/15/21 8:07 AM, Igor Matheus Andrade Torrente wrote:
>>> Fixes a race condition - for lack of a more precise term - between
>>> em28xx_v4l2_open and em28xx_v4l2_init, by detaching the v4l2_dev,
>>> media_pad and vdev structs from the em28xx_v4l2, and managing the
>>> lifetime of those objects more dynamicaly.
>>>
>>> The race happens when a thread[1] - containing the em28xx_v4l2_init()
>>> code - calls the v4l2_mc_create_media_graph(), and it return a error,
>>> if a thread[2] - running v4l2_open() - pass the verification point
>>> and reaches the em28xx_v4l2_open() before the thread[1] finishes
>>> the deregistration of v4l2 subsystem, the thread[1] will free all
>>> resources before the em28xx_v4l2_open() can process their things,
>>> because the em28xx_v4l2_init() has the dev->lock. And all this lead
>>> the thread[2] to cause a user-after-free.
>>>
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Reported-and-tested-by: 
>>> syzbot+b2391895514ed9ef4a8e@syzkaller.appspotmail.com
>>> Signed-off-by: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
>>> ---
>>>
>>> V2: Add v4l2_i2c_new_subdev null check
>>>      Deal with v4l2 subdevs dependencies
>>>
>>> V3: Fix link error when compiled as a module
>>>
>>> ---
>>>   drivers/media/usb/em28xx/em28xx-camera.c |   4 +-
>>>   drivers/media/usb/em28xx/em28xx-video.c  | 300 +++++++++++++++--------
>>>   drivers/media/usb/em28xx/em28xx.h        |   6 +-
>>>   3 files changed, 209 insertions(+), 101 deletions(-)
>>>
>>
>> The changes looks good to me. Have you tried building as a modules and
>> running modprobes and rmmods? You can do that without a device.
>>
> 
> I tried and everything worked fine.
> 

Thank you.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah

