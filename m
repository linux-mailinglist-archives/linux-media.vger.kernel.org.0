Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C19C3D20DA
	for <lists+linux-media@lfdr.de>; Thu, 22 Jul 2021 11:28:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231271AbhGVIra (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Jul 2021 04:47:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230504AbhGVIra (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Jul 2021 04:47:30 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83A52C061575;
        Thu, 22 Jul 2021 02:28:04 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id l7so5165217wrv.7;
        Thu, 22 Jul 2021 02:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=XLvwPVxwh3uPjr5/i+Rh3eq9y11uGtNueSrPtY+YdAQ=;
        b=ON+lbzS3fMryHArG/XyP5b5AcMqId+7dvYMQ50OEXQJT7FL7n6YTj0vO+b59eGQLYw
         PyfVxGkzo8jk/c0vyVwNna0atjVQHuOcbyFXmC9kY/R+HSITp7uLC5ewRgG4puie5fIb
         YsfBCRU8af/jKO+WZRqmwRFH80sYZXb+4xLFe2FCjvs8qksZq8fMl1m1yOANYKXZfe7f
         /DZIxCEsmkY6NGd6co+jHAMAloGodIk0pLrAXCf61qE8yXmJoTKh/sKZ1XlWa2rb5iPG
         XUnBsBMasmuROI/V/vXUohkS0YVCyf80IvSq1Xm0IAQ1GFoi72sxrTNfJKtRjpZPaUsc
         LnDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=XLvwPVxwh3uPjr5/i+Rh3eq9y11uGtNueSrPtY+YdAQ=;
        b=shkGeDII5javyLe46yN55Yn1lCAIPBfxdKp2m+wXoHtEIDSHolZkx8pAKoV+0q8xSB
         pvtDq1g195/4VEucDJg7aIgkFAdU4/ZRs0cq0dmXMxvFSxmI81c8LG/89pDZWnbpX2K4
         rwzPWufk9ELP2KvV9QwpPrcGkb/55W175sVsGeF7C4bjAGhCSpVSNzWIoQztqajgn9kX
         gQlGLCDd7NfCTSURfFN3MZuRaxowv71d4Ijlt+n01pXILPMcH0/Gq2QI5CjRH35+Aduv
         peJu0RdiDKjlWER97/Hvvjvgql+wcBVR6hjOx6YQnisNpMHJ7u19kr/YViW8xUmhItBa
         jqiw==
X-Gm-Message-State: AOAM530PtoSTOBqWJflWMJnIqqvVFn4YKi09qbwsyzQDeSylXuK/S1r+
        5TqpRwYjlj7zx+E2HbuAypqJ7S8SdK8=
X-Google-Smtp-Source: ABdhPJyEcGGH+JNsJ5UL1qrA/2Kbg0TJtGufoUH1n8b14LtUFryFarh3g4lvw3p6yg/2o0VGPpzwZQ==
X-Received: by 2002:adf:d0ce:: with SMTP id z14mr24733425wrh.67.1626946083157;
        Thu, 22 Jul 2021 02:28:03 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:b706:b115:9c6f:aeee? ([2a02:908:1252:fb60:b706:b115:9c6f:aeee])
        by smtp.gmail.com with ESMTPSA id w18sm7412066wrs.44.2021.07.22.02.28.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jul 2021 02:28:02 -0700 (PDT)
Subject: Re: [Linaro-mm-sig] [PATCH] drm/msm: Add fence->wait() op
To:     Rob Clark <robdclark@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, Sean Paul <sean@poorly.run>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
References: <20210720150716.1213775-1-robdclark@gmail.com>
 <60ffb6f3-e932-d9af-3b90-81adf0c15250@gmail.com>
 <CAF6AEGtOW3EjZWo36ij8U1om=gAqvg8CSkJJq2GkyHFGWUH4kQ@mail.gmail.com>
 <CAKMK7uF1=Y6_9znGoWG8GrteXBBRmyW8C3bFE+eJQqOj0A1buA@mail.gmail.com>
 <CAF6AEGsOVPdMkXwU9C+nDfQpPThveJ2A0jbXi43RRkkJKtnz3w@mail.gmail.com>
 <CAKMK7uHMXFqic=9APJrSf6totB8nGZTDe4x8+sv-drmV4Q+4Bg@mail.gmail.com>
 <CAF6AEGsKoucxt4a2pcdQM9+L0+YU-6TcAt8eF=3ur169646Jhw@mail.gmail.com>
 <YPhvein5e8do2AR+@phenom.ffwll.local>
 <113b5858-9020-d1c1-292b-96b7f9cc717a@gmail.com>
 <YPk1izQFR+tRV8js@phenom.ffwll.local>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <9c1e797b-8860-d1f5-e6f2-e06380ec9012@gmail.com>
Date:   Thu, 22 Jul 2021 11:28:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPk1izQFR+tRV8js@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 22.07.21 um 11:08 schrieb Daniel Vetter:
> [SNIP]
>> As far as I know wake_up_state() tries to run the thread on the CPU it was
>> scheduled last, while wait_event_* makes the thread run on the CPU who
>> issues the wake by default.
>>
>> And yes I've also noticed this already and it was one of the reason why I
>> suggested to use a wait_queue instead of the hand wired dma_fence_wait
>> implementation.
> The first versions had used wait_queue, but iirc we had some issues with
> the callbacks and stuff and that was the reasons for hand-rolling. Or
> maybe it was the integration of the lockless fastpath for
> dma_fence_is_signalled().
>
>> [SNIP]
>> Well it would have been nicer if we used the existing infrastructure instead
>> of re-inventing stuff for dma_fence, but that chance is long gone.
>>
>> And you don't need a dma_fence_context base class, but rather just a flag in
>> the dma_fence_ops if you want to change the behavior.
> If there's something broken we should just fix it, not force everyone to
> set a random flag. dma_fence work like special wait_queues, so if we
> differ then we should go back to that.

Wait a second with that, this is not broken. It's just different 
behavior and there are good arguments for both sides.

If a wait is short you can have situations where you want to start the 
thread on the original CPU.
     This is because you can assume that the caches on that CPU are 
still hot and heating up the caches on the local CPU would take longer 
than an inter CPU interrupt.

But if the wait is long it makes more sense to run the thread on the CPU 
where you noticed the wake up event.
     This is because you can assume that the caches are cold anyway and 
starting the thread on the current CPU (most likely from an interrupt 
handler) gives you the absolutely best latency.
     In other words you usually return from the interrupt handler and 
just directly switch to the now running thread.

I'm not sure if all drivers want the same behavior. Rob here seems to 
prefer number 2, but we have used 1 for dma_fence for a rather long time 
now and it could be that some people start to complain when we switch 
unconditionally.

Regards,
Christian.

> -Daniel
>

