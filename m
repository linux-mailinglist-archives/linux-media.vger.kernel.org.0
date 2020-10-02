Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD39128112F
	for <lists+linux-media@lfdr.de>; Fri,  2 Oct 2020 13:28:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726176AbgJBL2A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Oct 2020 07:28:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725964AbgJBL2A (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Oct 2020 07:28:00 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E8F5C0613D0
        for <linux-media@vger.kernel.org>; Fri,  2 Oct 2020 04:27:59 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id e11so913443wme.0
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2020 04:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nZaxcsHwMmqRPsyL6ppaPkTXtNppFwnVLVfBNIDn8RA=;
        b=LpZo9hsKVHJ/d3LgWdx2dR41bi0OJrzJHno8HKljIBBcT05uCIqKgnRUpcXxOKr9VT
         ICFFsTreZQX+y6q/d8z0ATkO2MGzW6QgUL4StOUpo6yBckf7mB8MhvZY4elJw9jwSG+i
         f6/hePK8HjwEDDLfAJqV9YSXPsLeYiFGvFGJGGn1aZA0v9zqS24LP00zrA/tlsFFz0Wt
         2ECtUR98SSQFGoOzn5hSyzZ8ZMRUSu5u+U6KW2GhD7R+GrT5x7vJJWihJ7dpJ2XYfH+4
         HAqYIAq4MkV6LNg4/xFfucK5VrSMj7GJO9e10hJWXghygWCam9ykYGd47q6CVC41Pcka
         pJSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nZaxcsHwMmqRPsyL6ppaPkTXtNppFwnVLVfBNIDn8RA=;
        b=jsZwWM0KeDSvR93DGKsiuBd95TllICTPMl3SwOmOrSB7n9JF2ExVCC6j0d6/7C2/ax
         qqjav449QAdG2x9VeLJmLYMVXKL2KoyWLV7TqGoI8bq23gOUK+KlOYbhyQp3O8QfWmHi
         09LRTtocr0UgiiWV/sMYHwRqFIAJ/86gUpuWijU3MiHFeYsiDyObohIiW0fhYNM/D3HQ
         ztZf18AxDRbTYAlJTj6mhDEFxFOphsSa8u3S2FHx29BvaTVyt+js4Yu1pk7WaS4FcfBx
         F4wC4YHL3AMHUNbFbyzL73hjQ3+bC/qeZ8zr+FLjNgbvz2EEeQT9gXTAZQF7j1XMRWH6
         XVFw==
X-Gm-Message-State: AOAM5308MivwVWCT1rmEuo5tStMxt6Yus2W/WUbTk9ZnN9s5DAoZt9lp
        yLyIRdur1vx5S7i8e1vWuYNP5w==
X-Google-Smtp-Source: ABdhPJwzF6SLRHc3X27XrYXf2pJ/zyKCxeMIfZkKvKSF7aEcnbg1geeQMMFSeNwWSBugDYWKmZiGjw==
X-Received: by 2002:a7b:cb8c:: with SMTP id m12mr2497325wmi.12.1601638077797;
        Fri, 02 Oct 2020 04:27:57 -0700 (PDT)
Received: from [192.168.1.7] ([195.24.90.54])
        by smtp.googlemail.com with ESMTPSA id k4sm1522245wrx.51.2020.10.02.04.27.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2020 04:27:57 -0700 (PDT)
Subject: Re: [PATCH] media: venus: core: Drop local dma_parms
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Robin Murphy <robin.murphy@arm.com>
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org
References: <e5384b296a0af099dc502572752df149127b7947.1599167568.git.robin.murphy@arm.com>
 <cdd56444b0d7faf9358370f821a10846@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <a2f96ef5-1e67-7bc7-39e1-448b2196aef1@linaro.org>
Date:   Fri, 2 Oct 2020 14:27:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <cdd56444b0d7faf9358370f821a10846@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 10/2/20 11:06 AM, Sai Prakash Ranjan wrote:
> Hi Robin,
> 
> On 2020-09-04 02:44, Robin Murphy wrote:
>> Since commit 9495b7e92f71 ("driver core: platform: Initialize dma_parms
>> for platform devices"), struct platform_device already provides a
>> dma_parms structure, so we can save allocating another one.
>>
>> Also the DMA segment size is simply a size, not a bitmask.
>>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>> ---
>>  drivers/media/platform/qcom/venus/core.c | 8 +-------
>>  1 file changed, 1 insertion(+), 7 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/venus/core.c
>> b/drivers/media/platform/qcom/venus/core.c
>> index 203c6538044f..2fa9275d75ff 100644
>> --- a/drivers/media/platform/qcom/venus/core.c
>> +++ b/drivers/media/platform/qcom/venus/core.c
>> @@ -226,13 +226,7 @@ static int venus_probe(struct platform_device *pdev)
>>      if (ret)
>>          return ret;
>>
>> -    if (!dev->dma_parms) {
>> -        dev->dma_parms = devm_kzalloc(dev, sizeof(*dev->dma_parms),
>> -                          GFP_KERNEL);
>> -        if (!dev->dma_parms)
>> -            return -ENOMEM;
>> -    }
>> -    dma_set_max_seg_size(dev, DMA_BIT_MASK(32));
>> +    dma_set_max_seg_size(dev, UINT_MAX);
>>
>>      INIT_LIST_HEAD(&core->instances);
>>      mutex_init(&core->lock);
> 
> This reintroduced dma api debug warning which the original commit was
> addressing or rather thought it addressed.
> 
>  DMA-API: qcom-venus aa00000.video-codec: mapping sg segment longer than
> device claims to support [len=4194304] [max=65536]
>  WARNING: CPU: 3 PID: 5365 at kernel/dma/debug.c:1225
> debug_dma_map_sg+0x1ac/0x2c8
>  <...>
>  pstate: 60400009 (nZCv daif +PAN -UAO)
>  pc : debug_dma_map_sg+0x1ac/0x2c8
>  lr : debug_dma_map_sg+0x1ac/0x2c8
>  sp : ffffff8016517850
>  x29: ffffff8016517860 x28: 0000000000010000
>  x27: 00000000ffffffff x26: ffffff80da45eb00
>  x25: ffffffd03c465000 x24: ffffffd03b3c1000
>  x23: ffffff803e262d80 x22: ffffff80d9a0d010
>  x21: 0000000000000001 x20: 0000000000000001
>  x19: 0000000000000001 x18: 00000000ffff0a10
>  x17: ffffffd03b84a000 x16: 0000000000000037
>  x15: ffffffd03a950610 x14: 0000000000000001
>  x13: 0000000000000000 x12: 00000000a3b31442
>  x11: 0000000000000000 x10: dfffffd000000001
>  x9 : f544368f90c5ee00 x8 : f544368f90c5ee00
>  x7 : ffffffd03af5d570 x6 : 0000000000000000
>  x5 : 0000000000000080 x4 : 0000000000000001
>  x3 : ffffffd03a9174b0 x2 : 0000000000000001
>  x1 : 0000000000000008 x0 : 000000000000007a
>  Call trace:
>   debug_dma_map_sg+0x1ac/0x2c8
>   vb2_dma_sg_alloc+0x274/0x2f4 [videobuf2_dma_sg]
>   __vb2_queue_alloc+0x14c/0x3b0 [videobuf2_common]
>   vb2_core_reqbufs+0x234/0x374 [videobuf2_common]
>   vb2_reqbufs+0x4c/0x64 [videobuf2_v4l2]
>   v4l2_m2m_reqbufs+0x50/0x84 [v4l2_mem2mem]
>   v4l2_m2m_ioctl_reqbufs+0x2c/0x38 [v4l2_mem2mem]
>   v4l_reqbufs+0x4c/0x5c
>   __video_do_ioctl+0x2cc/0x3e0
>   video_usercopy+0x3b0/0x910
>   video_ioctl2+0x38/0x48
>   v4l2_ioctl+0x6c/0x80
>   do_video_ioctl+0xb54/0x2708
>   v4l2_compat_ioctl32+0x5c/0xcc
>   __se_compat_sys_ioctl+0x100/0x2064
>   __arm64_compat_sys_ioctl+0x20/0x2c
>   el0_svc_common+0xa8/0x178
>   el0_svc_compat_handler+0x2c/0x40
>   el0_svc_compat+0x8/0x10
> 
> Thanks,
> Sai
> 

Do you have the mentioned above commit when you see this warning ?

-- 
regards,
Stan
