Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BD8A1A0182
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2020 01:18:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbgDFXSK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 19:18:10 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:43969 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726303AbgDFXSK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 19:18:10 -0400
Received: by mail-lf1-f65.google.com with SMTP id k28so847462lfe.10;
        Mon, 06 Apr 2020 16:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=chS43n5Rzi5QlXuzujx9Up/J1i2zDWrT898t52vhKwM=;
        b=C8El9k9Xe+SkBTrIZmw46NaUoXdx8q2vzZ2qLOwqIC3BIoa2ynJ4xkShtIAVG6Ps65
         5s8USY91DvcarVsY/k9q10+g5qjicoNQuIouYE6p7k5YDKS7nRQOlliAaSdh9nBQlto1
         XUp7gUmvaTF1yetGDRwZZchQzAnHxsUq9xwyb+S59Qjzpa64YZnKZO8IcrN2vtSyvs+r
         BYv/2aQfWTJlUc0MhGoL690I3u5V9KLX1koXfURhFYW1IXMhhdNPt3J9QWC6WEK4vKrJ
         rRug3DMfmCkU9Me3uyNMt6rI1ESrh/TmT+WwAlsYfyNt7+H0X8cWHNe8zu4a6UubeT6i
         O/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=chS43n5Rzi5QlXuzujx9Up/J1i2zDWrT898t52vhKwM=;
        b=BjTeodJ7WBrWZYtkxiw/SqSFexjkdBkiLd1vhbDpenuS2Imn5COVDyDGKU+JrDHj97
         bMc+Ly1v/hrBGjSmHmr6PYw/julEjoOnTi+vnqE2Y+cXFnzN650X668RGHkwWKKe8cJC
         IvIWwbaKjIoBtnaSHB2AurQL1ZXSnI7FM2Whwe6aoPI5BOGf86B3clBoy3JgXop7MSAr
         44ifvgxdhcJrfEVPuu9+I4IDEmUcADQpRaWK8QUxD8ktNQB4Gb02NOwVSUtJTBy9s8CZ
         zCI3Ix/QU2M9OWegv1LmDe0qRFg0RMvYeqG8Jsgm9eks2bwImE6MPAn5vtmQ6UX/tlfd
         KnyA==
X-Gm-Message-State: AGi0PuZMihRM8CskxB+aEpzwm2Kcd1TUurFdhe6zAdN5DKjlRPzfiwhM
        kfIO6QRFsxXdI7irdGR2dc4TtySs
X-Google-Smtp-Source: APiQypKYg7s05Oo6p5B56gIRuzqS4bQjSQVXLZkNJNbdwWw5ASMZsecvKR7JPKWjof/yi0102iCppQ==
X-Received: by 2002:a05:6512:14a:: with SMTP id m10mr10185113lfo.152.1586215086411;
        Mon, 06 Apr 2020 16:18:06 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id d21sm10826594ljc.49.2020.04.06.16.18.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2020 16:18:05 -0700 (PDT)
Subject: Re: [RFC PATCH v6 6/9] media: tegra: Add Tegra210 Video input driver
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc:     sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
 <1585963507-12610-7-git-send-email-skomatineni@nvidia.com>
 <200bb96e-2d07-764f-9e14-55538dc742fd@gmail.com>
 <23bfab09-b464-6e51-9843-06d13000e9b9@nvidia.com>
 <be77b0ef-d605-8357-4180-f40b2886d07a@gmail.com>
 <08cd31d5-e8b9-4d3a-fb0e-0e4462947d96@nvidia.com>
 <12a834ac-52b1-6dc0-7d3a-3e6a1fa85a2a@gmail.com>
 <e3712e7b-b335-b35b-a94f-24eb85122dca@nvidia.com>
 <b1726d33-0d35-9323-a747-407148d0104e@gmail.com>
 <eb80178f-30f4-8f46-51cd-ea3f4914b81d@nvidia.com>
 <dd16c560-ba8f-e7df-5dc4-5227e0043196@nvidia.com>
 <fea4f0a1-4a20-34d4-9eda-e4a599eeeffc@nvidia.com>
 <760d071e-0cbc-b3eb-9231-fb9f9ecb44a6@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <9e317f65-8a02-3b15-cfec-8e0d8374130e@gmail.com>
Date:   Tue, 7 Apr 2020 02:18:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <760d071e-0cbc-b3eb-9231-fb9f9ecb44a6@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

07.04.2020 01:07, Sowjanya Komatineni пишет:
> 
> On 4/6/20 3:00 PM, Sowjanya Komatineni wrote:
>>
>> On 4/6/20 2:39 PM, Sowjanya Komatineni wrote:
>>>
>>> On 4/6/20 2:15 PM, Sowjanya Komatineni wrote:
>>>>
>>>> On 4/6/20 2:11 PM, Dmitry Osipenko wrote:
>>>>> External email: Use caution opening links or attachments
>>>>>
>>>>>
>>>>> 07.04.2020 00:02, Sowjanya Komatineni пишет:
>>>>>>>>>>> Am I understanding correctly that this thread will take 100%
>>>>>>>>>>> CPU,
>>>>>>>>>>> spinning here, if more than 2 frame-captures queued?
>>>>>>>>>> on more than 2 frames captures, it breaks thread and on next
>>>>>>>>>> wakeup it
>>>>>>>>>> continues
>>>>>>>>> The wait_event() won't wait if condition is true.
>>>>>>>> condition is checked when waitqueue is woken up
>>>>>>> https://elixir.bootlin.com/linux/v5.6.2/source/include/linux/wait.h#L462
>>>>>>>
>>>>>> process is put to sleep until the condition evaluates to true or
>>>>>> signal
>>>>>> is received.
>>>>>>
>>>>>> condition is checked each time the waitqueue head is woken up.
>>>>> This is a wrong assumption in accordance to the code.
>>
>> process is in sleep until the condition is evaluated and when
>> condition is true wakeup still happens only when wake_up on waitqueue
>> is called
>>
>> This is the reason for using this to prevent blocking while waiting
>> for the buffers.
> 
> w.r.t capture list update, wakeup happens when wake_up on waitqueue is
> called.
> 
> wakeup also happens on kthread stop signal event.
> 
>>
>>
>>>>
>>>> when every buffer is available as long as we are in streaming, we
>>>> should process it.
>>>>
>>>> So if wake up happens when list has buffer, it will be processed but
>>>> at a time we limit processing 2 simultaneous buffer capture starts
>>>> only.
>>>>
>>> Fixing typo.
>>>
>>> I meant when ever buffer is available as long as we are in streaming,
>>> we should process it.
>>>
>>> So capture thread processes as long as buffers are available from
>>> user space limiting 2 simultaneous trigger of captures and thread
>>> will be in sleep when capture buffers list is empty or no stop thread
>>> is signaled.

IIUC, the waiting won't happen if more than 2 captures are queued and
thread will be spinning until captures are processed.

I think you need a semaphore with resource count = 2.
