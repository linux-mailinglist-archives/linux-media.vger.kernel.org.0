Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A9CC390565
	for <lists+linux-media@lfdr.de>; Tue, 25 May 2021 17:27:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232569AbhEYP3C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 May 2021 11:29:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231260AbhEYP3B (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 May 2021 11:29:01 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDAA2C061574;
        Tue, 25 May 2021 08:27:28 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id y14so30616658wrm.13;
        Tue, 25 May 2021 08:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=vkFvv3CzrHWV88Bg6LMmfW28f+X/tT4dXGrYj80i8K0=;
        b=Ma7kN/pl4nRYQBlat0fUJFqhzxY8Il5jMgW6M67rG4H96AzSwDMB7vsixt58a4MtHM
         Jtb2WwZ5a+0QvD3PEbqGmghXE6MfPW0vq0qFYycpQjINIVaQ21EGUoO99JMKjM4C9/rX
         dh7UCr6fS8VhE6uzN1OJi6m5a+/bW28OmUrJy9dUagiwxeziIU4CBvWJEJoAr5apnAIp
         NW7Zaf5BzTIOWpAPKyzXV3F6New9/quuEKi7KeUh/iFaU4OJ/WKzUwIi2iCABpeOHl4d
         srdu/KuSBNWFtOX/tF81JsXRNkxba0VV7OlM4pa1iiy9mikmxu/GmZaOqtJ3Rw+D697g
         IYFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=vkFvv3CzrHWV88Bg6LMmfW28f+X/tT4dXGrYj80i8K0=;
        b=QShioG9+oBiRbB+0ERkFYO4d/CK9we2e+C6iVTAWxy0EBDswFKxxn+tKO/NFaOnv2j
         eaD2UkTSb8PiQkjYBxcA8aHrI+6ihIvIhTy/M+D9Y6muRz5c1aW3HLnd2rB/fG4LIbZ8
         BVbOmQiqLoxFTEn3GmXsAD5cCCDefNTkc/DxP+yWlDWfd2TojMMxnwxcEFS+T2MKca4s
         CxJTBHQhvgCvlkgYz5Iwh9d1r6oYA+o9sIzXKEbulfmiQNNw6FIaRQlWSu9l3RyPPzsv
         Tk7tA0W3LwsbrXzLZfJl4IGx38oXaBIKeYcZDZH52/TxpHIlPcSwL6mF1qHynfRSNymW
         tfWA==
X-Gm-Message-State: AOAM5313X39GFMFjMOedE4G0+xRDFOOtwKJjajA4CNFGMs5olf2nnnfS
        C9tR6hYIMjaZDx/w7bPvObPJy5YYs6I=
X-Google-Smtp-Source: ABdhPJxoQwt+Q1anHnE5jDYcuMOOCY9PaaA++i5KJHu8rDqsY8JBovHEjkl3h0rOqGut8VQWukXLbw==
X-Received: by 2002:adf:d20e:: with SMTP id j14mr27182261wrh.270.1621956447461;
        Tue, 25 May 2021 08:27:27 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:d67f:bd9a:6dbf:33b1? ([2a02:908:1252:fb60:d67f:bd9a:6dbf:33b1])
        by smtp.gmail.com with ESMTPSA id d3sm16421430wrs.41.2021.05.25.08.27.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 May 2021 08:27:27 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: remove unreachable code
To:     Alex Deucher <alexdeucher@gmail.com>,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc:     Dave Airlie <airlied@linux.ie>,
        LKML <linux-kernel@vger.kernel.org>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        "Deucher, Alexander" <alexander.deucher@amd.com>,
        Christian Koenig <christian.koenig@amd.com>,
        linux-media <linux-media@vger.kernel.org>
References: <1621853213-55876-1-git-send-email-jiapeng.chong@linux.alibaba.com>
 <CADnq5_N3WkoYHcn8b1-qZ23+t=E9xxV5fV_1Lwqck6x2dUPqmA@mail.gmail.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <950d5d2a-c01f-35d4-0933-04cae2c4984d@gmail.com>
Date:   Tue, 25 May 2021 17:27:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CADnq5_N3WkoYHcn8b1-qZ23+t=E9xxV5fV_1Lwqck6x2dUPqmA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 24.05.21 um 20:48 schrieb Alex Deucher:
> Applied.  Thanks!

Ok, that's unfortunate.

IIRC we added the code because of a different compiler warning.

Christian.

>
> Alex
>
> On Mon, May 24, 2021 at 6:47 AM Jiapeng Chong
> <jiapeng.chong@linux.alibaba.com> wrote:
>> In the function amdgpu_uvd_cs_msg(), every branch in the switch
>> statement will have a return, so the code below the switch statement
>> will not be executed.
>>
>> Eliminate the follow smatch warning:
>>
>> drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:845 amdgpu_uvd_cs_msg() warn:
>> ignoring unreachable code.
>>
>> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
>> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
>> index 82f0542..375b346 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
>> @@ -842,8 +842,6 @@ static int amdgpu_uvd_cs_msg(struct amdgpu_uvd_cs_ctx *ctx,
>>                  DRM_ERROR("Illegal UVD message type (%d)!\n", msg_type);
>>                  return -EINVAL;
>>          }
>> -       BUG();
>> -       return -EINVAL;
>>   }
>>
>>   /**
>> --
>> 1.8.3.1
>>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx

