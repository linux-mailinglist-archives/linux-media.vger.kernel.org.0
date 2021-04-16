Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B21C93628B1
	for <lists+linux-media@lfdr.de>; Fri, 16 Apr 2021 21:34:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237158AbhDPTe3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Apr 2021 15:34:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235029AbhDPTe2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Apr 2021 15:34:28 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65EF6C061574;
        Fri, 16 Apr 2021 12:34:03 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id h7so21635397qtx.3;
        Fri, 16 Apr 2021 12:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ETyLeWgC4ldlxgX9gOjNJ7AnWjdh0/ZzmImW1zL5RMI=;
        b=CX2G+YIGIh2yuN8MjkbHjYrLpXn5LJpkHcuCoR5kK8ziPenqrpnPBohfBcbZJV0Y4E
         gbp2BmAjvMQtVcE5Ndki1O6haSyon6RHZ9TuavMRYtLWd8uT73TIa16lrSppTDHlEp6y
         nBciopNar97QzrsbisXtZpTSc2wGNJ3+4Fvc9R0tc0kSAN4vrGfMQZgAUZOphV/9H33V
         A6hY80u0x14Ek2ZdV+4RZ/8k5eI8EGK6J4f9qtZQW9EDGVWIMAFaFl2/bSTvrYi09cb2
         FkmL1Zhw/t7jkXsH1czgX6yP5vZ1uJ4j/tilEVuPdCYJYIntPW+nqeL/li0A5NiYWym3
         DWSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ETyLeWgC4ldlxgX9gOjNJ7AnWjdh0/ZzmImW1zL5RMI=;
        b=Q2yOjiXSYRVfgrT+UVSpG9VuhGxUy0INM800W4GxWDEqYQOEv0FL12HGiuMMX3A9cr
         GVl0/D87EP+QHMMrrMQnYWfff76Z8+XfNrW/dhh4hlsr+ZLT8fkIjNUnhUkGAy4mtdu9
         P3MQ2xPORz0cMpjN+8niw1nbMKkPs9Sboo944laB7dMphHsrZM43669qvBTbiLMXK8mL
         fJwOFWVKglRJwqrJecAKhY76NxChuOAYOJhpLf2rnqbyBJX7M4T7iz3/RbhS1+lpbGwV
         NbMvIG5hJbfhJ4WJyaFEQLUDdevLXpefVkGaIgk9A9hI7aQD4pCYRQMTqFiZ4djsIDGW
         qDQA==
X-Gm-Message-State: AOAM530wa++cqLs5geY8WphUlSv3B/TBvxBZltUh4ZPJf6bHJ+A9nuZb
        I4UTu36QgGrIqml9Pe90H58Xa9oR6fo=
X-Google-Smtp-Source: ABdhPJxk50y+ZCriLsVXKTHn1xmUJk8V3P7VDGQKdrW4uDMW35tXLWJ299pTEwT8ZvdCevie6YDiow==
X-Received: by 2002:a05:622a:46:: with SMTP id y6mr670494qtw.44.1618601642482;
        Fri, 16 Apr 2021 12:34:02 -0700 (PDT)
Received: from ?IPv6:2804:14c:125:811b:fbbc:3360:40c4:fb64? ([2804:14c:125:811b:fbbc:3360:40c4:fb64])
        by smtp.gmail.com with ESMTPSA id o25sm679073qtl.37.2021.04.16.12.34.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Apr 2021 12:34:02 -0700 (PDT)
Subject: Re: [PATCH RFC v3] media: em28xx: Fix race condition between open and
 init function
To:     Shuah Khan <skhan@linuxfoundation.org>, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        kernel test robot <lkp@intel.com>,
        syzbot+b2391895514ed9ef4a8e@syzkaller.appspotmail.com
References: <20210415140724.15398-1-igormtorrente@gmail.com>
 <d254bf85-5185-6b21-afc6-fb00a9278186@linuxfoundation.org>
From:   Igor Torrente <igormtorrente@gmail.com>
Message-ID: <c18180b5-52b9-e787-654c-6967ecb81dce@gmail.com>
Date:   Fri, 16 Apr 2021 16:33:59 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <d254bf85-5185-6b21-afc6-fb00a9278186@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 4/15/21 2:25 PM, Shuah Khan wrote:
> On 4/15/21 8:07 AM, Igor Matheus Andrade Torrente wrote:
>> Fixes a race condition - for lack of a more precise term - between
>> em28xx_v4l2_open and em28xx_v4l2_init, by detaching the v4l2_dev,
>> media_pad and vdev structs from the em28xx_v4l2, and managing the
>> lifetime of those objects more dynamicaly.
>>
>> The race happens when a thread[1] - containing the em28xx_v4l2_init()
>> code - calls the v4l2_mc_create_media_graph(), and it return a error,
>> if a thread[2] - running v4l2_open() - pass the verification point
>> and reaches the em28xx_v4l2_open() before the thread[1] finishes
>> the deregistration of v4l2 subsystem, the thread[1] will free all
>> resources before the em28xx_v4l2_open() can process their things,
>> because the em28xx_v4l2_init() has the dev->lock. And all this lead
>> the thread[2] to cause a user-after-free.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Reported-and-tested-by: 
>> syzbot+b2391895514ed9ef4a8e@syzkaller.appspotmail.com
>> Signed-off-by: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
>> ---
>>
>> V2: Add v4l2_i2c_new_subdev null check
>>      Deal with v4l2 subdevs dependencies
>>
>> V3: Fix link error when compiled as a module
>>
>> ---
>>   drivers/media/usb/em28xx/em28xx-camera.c |   4 +-
>>   drivers/media/usb/em28xx/em28xx-video.c  | 300 +++++++++++++++--------
>>   drivers/media/usb/em28xx/em28xx.h        |   6 +-
>>   3 files changed, 209 insertions(+), 101 deletions(-)
>>
> 
> The changes looks good to me. Have you tried building as a modules and
> running modprobes and rmmods? You can do that without a device.
> 

I tried and everything worked fine.

> thanks,
> -- Shuah
> 

Thanks,
---
Igor Matheus Andrade Torrente
