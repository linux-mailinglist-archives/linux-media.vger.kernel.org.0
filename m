Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD70D1B6B0B
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2020 04:09:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726240AbgDXCJF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 22:09:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725884AbgDXCJF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 22:09:05 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9159C09B042;
        Thu, 23 Apr 2020 19:09:04 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id a21so5459352ljj.11;
        Thu, 23 Apr 2020 19:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=asdel7Nnwdq8gXb0wfYVTZi0cag88uF9i59tRQsaVzA=;
        b=kWhpw7300uRV64GQ+LZk1RjwjbYN2maIGft1o6R8mtbKIer8m0k92d/hgbcgPMBOi7
         fkrPQN71H3TNtQMdmt9IDsJ3jr5P4PKAwcJKPPj1EWxcdz6RBHdh56Q1tZBVKnQE+VsX
         B5Kvg/E+2x/KUA/tR/t+2JD6ywz8Ylc/SNWa9E64BYzXqUe2vMueKVuIZ+8jxabTgy8G
         5jgwP/2gPv7ny9VHCJpV3vlWsr30AhDcObnQjXpQK7WoKHEZvdocpWPj3Zy3KWyDRd0k
         S38RDjznsPZEihkhBPgJm8B9hArOxcQK1r24EaM08rMUgTKBX6ZpuS+QyGhvCRaz/Y4K
         vuwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=asdel7Nnwdq8gXb0wfYVTZi0cag88uF9i59tRQsaVzA=;
        b=RgWp48/PDFgepbh9auzJ+NNyQhkX3xv7FL+moRUAsiNJRyDQlCVb2L2SoeHbv67iby
         WaONAuVqhVW04whGEv6T7R/F5x/zNShmLe8Hs8JXTHVxlg823NxbGtVMGAisC27sDQqm
         TWOHAfeMqSjxgv65mqzlNXB6ThWRoK3h+5qfzavmCEcdC8v7Hky6XCeOQNK9xZxdQufg
         eT35XbKNKFKXRu+BqJl4dxmLGFNa63Npb415rOo0X3HJ1YdXxspvaP/b1q3pDJxMSDHc
         eK2vtiEDy52O5C6zkjOvn6RiFBtspyHaPcfL1VGfgd6sDtKpV1jCCi8S5+ZkpcS/8s9U
         pYLg==
X-Gm-Message-State: AGi0PubQO95R+5KQE9jDEPsHw/cHQl2OeV3uOdD0qsuMoXfqyBbuEJYC
        bm1o90APsCznQOMkIpJtCaDoUnCt
X-Google-Smtp-Source: APiQypItFHoCX/FTFqbHNozzHeT8UgpiUGk4DWwc/59oGcQxfSMGZ9itJNAWOxIxRtCzgDv+zEmI6g==
X-Received: by 2002:a2e:a313:: with SMTP id l19mr4437612lje.133.1587694142811;
        Thu, 23 Apr 2020 19:09:02 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id l26sm3153517ljc.49.2020.04.23.19.09.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2020 19:09:02 -0700 (PDT)
Subject: Re: [RFC PATCH v9 6/9] media: tegra: Add Tegra210 Video input driver
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc:     sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1587536339-4030-1-git-send-email-skomatineni@nvidia.com>
 <1587536339-4030-7-git-send-email-skomatineni@nvidia.com>
 <7e473fa9-0409-d868-e818-2e7928a8acca@gmail.com>
 <a83bfc89-35de-85b5-fe5f-71e62456f5e9@nvidia.com>
 <3691c4b5-1ecc-2ad3-23ed-72ef6b8d25fa@nvidia.com>
 <fce6dfbb-0b8d-319b-2d6f-976953a3c36c@gmail.com>
 <a2672be9-93c1-8363-6c0e-6d43c2bd59bc@nvidia.com>
 <492dafac-42aa-3caf-4d32-ba0e434b19c3@gmail.com>
 <39402a49-f39f-256c-31e7-afaa25d55664@nvidia.com>
 <8f01724e-95d4-e6d8-9e2d-bce4b8dd0177@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <5ad77b67-0dc6-3c6d-7df3-4c21c68b2b1e@gmail.com>
Date:   Fri, 24 Apr 2020 05:09:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <8f01724e-95d4-e6d8-9e2d-bce4b8dd0177@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

24.04.2020 04:08, Sowjanya Komatineni пишет:
> 
> On 4/23/20 5:51 PM, Sowjanya Komatineni wrote:
>>
>> On 4/23/20 5:42 PM, Dmitry Osipenko wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> 24.04.2020 02:50, Sowjanya Komatineni пишет:
>>>> On 4/23/20 4:25 PM, Dmitry Osipenko wrote:
>>>>> External email: Use caution opening links or attachments
>>>>>
>>>>>
>>>>> 24.04.2020 02:20, Sowjanya Komatineni пишет:
>>>>>> On 4/23/20 4:19 PM, Sowjanya Komatineni wrote:
>>>>>>> On 4/23/20 4:16 PM, Dmitry Osipenko wrote:
>>>>>>>> External email: Use caution opening links or attachments
>>>>>>>>
>>>>>>>>
>>>>>>>> 22.04.2020 09:18, Sowjanya Komatineni пишет:
>>>>>>>>> +static int chan_capture_kthread_start(void *data)
>>>>>>>>> +{
>>>>>>>>> +     struct tegra_vi_channel *chan = data;
>>>>>>>>> +     struct tegra_channel_buffer *buf;
>>>>>>>>> +     int err = 0;
>>>>>>>>> +
>>>>>>>>> +     set_freezable();
>>>>>>>>> +
>>>>>>>>> +     while (1) {
>>>>>>>>> +             try_to_freeze();
>>>>>>>>> +
>>>>>>>>> + wait_event_interruptible(chan->start_wait,
>>>>>>>>> + !list_empty(&chan->capture) ||
>>>>>>>>> + kthread_should_stop());
>>>>>>>>> +
>>>>>>>>> +             if (kthread_should_stop())
>>>>>>>>> +                     break;
>>>>>>>>> +
>>>>>>>>> +             /*
>>>>>>>>> +              * Source is not streaming if error is non-zero.
>>>>>>>>> +              * So, do not dequeue buffers on capture error.
>>>>>>>>> +              */
>>>>>>>>> +             if (err)
>>>>>>>>> +                     continue;
>>>>>>>> This will result in an endless loop, I suppose it wasn't the
>>>>>>>> intention.
>>>>>>> no it will not. on error we report vb2_queue_error which will do
>>>>>>> streaming stop request.
>>>>>>>
>>>>>>> So thread will be stopped on streaming stop request thru kthread
>>>>>>> stop
>>>>>>> signal
>>>>>> To be clear on error it reports vb2 queue error and waits for stop
>>>>>> streaming to happen
>>>>> If thread should exit on error, then it should do it on the actual
>>>>> error. Otherwise it looks very error-prone.
>>>> When v4l2 drivers indicate fatal error through vb2_queue_error, queue
>>>> error flag  is set and wakes up all processes waiting on queue along
>>>> with polling reporting  EPOLLERR and also reporting error for queuing
>>>> and dequeuing buffers. Stream stop will surely happen which stops the
>>>> thread.
>>> This doesn't explain what is the point of continuing to loop instead of
>>> exiting immediately on error.
>>
>> We are using 2 threads and when capture start error happens, we can
>> stop capture_start thread immediately but capture_finish thread will
>> still run for any outstanding buffers.
>>
>> So, as it makes no diff stopping both threads during stream stop which
>> will definitely happen on error and when we don't dequeue buffers
>>
> Also there will be an issue if we break on error immediately during
> stop_streaming -> kthread_stop()
> 
> As stop streaming can happen any time, we do kthread_stop and in case of
> error if we stop thread and on stop streaming kthread_stop might crash
> as kthread_stop can only be called on running thread
> 

This a better explanation, but still it's not good that there could be a
busy loop within the thread.

Should be better to sleep if error is set.

wait_event_interruptible(chan->start_wait,
			(!err && !list_empty(&chan->capture)) ||
			kthread_should_stop());
