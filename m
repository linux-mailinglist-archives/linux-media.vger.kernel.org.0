Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C4F219FF8A
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 22:54:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726272AbgDFUyw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 16:54:52 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:38350 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725957AbgDFUyw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 16:54:52 -0400
Received: by mail-lj1-f196.google.com with SMTP id v16so1274114ljg.5;
        Mon, 06 Apr 2020 13:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=R5SfnXu/x8FFoRcTjF2UjmhUb+2qMIXHdP7N/NN7VV0=;
        b=rYzpHco1uyCTGIezDRHywAPNoUjzLUF7TMnLTK8/CkBMkUM8Zu60RRu/Dq25tAHDzE
         moGH5If25s3beftZWXVk65fcouEzQRk5YiB4TS1GzkKrx2RIg1UpdLeHi5sRFWJVHE4o
         fcFwg/FZfC1B6SdJOPSXhwHTLPwZsg5Y5nD3J2LUswjAg9PYLyoZl5WNNNa0ZJoNqGjF
         /vG5iQCrDDqBQSdbapCa27t0YrFCkz5HbPaFV8cVFWQxvX0bHf/FhJysctHvLF5NRYvH
         CrNKlUYLx7+WTc5JIxevMHq8H8y/yPhB+Wjoen3ffr5+GTcljO+ePQkdJdmh6OLNOl/C
         aY7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=R5SfnXu/x8FFoRcTjF2UjmhUb+2qMIXHdP7N/NN7VV0=;
        b=OfumATGx5aM+QJYni4kTwecHkJ0JNKgzb6mm8d967SHj53HP71IxiV9uMEE4w1MEDE
         rNZANaoyAJFnjVUsa3/tNNT9iW5hcIxvpwko/kLQSPZIbEevGRZRCNf70peiXq2lPFbv
         Zb0B/V8TVrTQF5a0CvDsuCpKuPvQcVyx2JsX3NUO35Rb12bk2bsHj1eWgTqZranUQB0N
         yEh0Yi7+4z1C8oXXejcyFHdoJ0BSzCGJZnLu1vQiMGeIzIgUchXPP+ZXFxhichendiSP
         3PX0yctFZHmdH0f68kk5vHMh2cG2watZoz0LR2R3qSEUxKFvNcpMpAy72CIP54M25Khv
         uQOw==
X-Gm-Message-State: AGi0PuYyoB/thNwetRykCfVAu9ScKce+WXrHQexz+szDw8SaicV0kMLi
        leM6BF37PGQX/M2P450bMlBjXtrz
X-Google-Smtp-Source: APiQypIqzVECFwMC0IDaM+RoNhtNGYYOT7zd4dK47IEOQ9G5Ut28wWRI2cM2rTy4ufa9oe17TbAMGg==
X-Received: by 2002:a05:651c:383:: with SMTP id e3mr648546ljp.271.1586206488388;
        Mon, 06 Apr 2020 13:54:48 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id r21sm11231014ljp.29.2020.04.06.13.54.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2020 13:54:47 -0700 (PDT)
Subject: Re: [RFC PATCH v6 6/9] media: tegra: Add Tegra210 Video input driver
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc:     sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
 <1585963507-12610-7-git-send-email-skomatineni@nvidia.com>
 <782c8c4e-f5c2-d75e-0410-757172dd3090@gmail.com>
 <ac225ff3-8de8-256c-7f81-0225b4153540@nvidia.com>
 <86bbcd55-fa13-5a35-e38b-c23745eafb87@gmail.com>
 <2839b1ee-dedc-d0ee-e484-32729a82a6ea@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7361d00d-9cfe-3e4a-6199-524d37d53bd0@gmail.com>
Date:   Mon, 6 Apr 2020 23:54:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <2839b1ee-dedc-d0ee-e484-32729a82a6ea@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

06.04.2020 23:38, Sowjanya Komatineni пишет:
> 
> On 4/6/20 1:37 PM, Dmitry Osipenko wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> 06.04.2020 23:20, Sowjanya Komatineni пишет:
>>> On 4/6/20 1:02 PM, Dmitry Osipenko wrote:
>>>> External email: Use caution opening links or attachments
>>>>
>>>>
>>>> 04.04.2020 04:25, Sowjanya Komatineni пишет:
>>>> ...
>>>>> +static int chan_capture_kthread_start(void *data)
>>>>> +{
>>>>> +     struct tegra_vi_channel *chan = data;
>>>>> +     struct tegra_channel_buffer *buf;
>>>>> +     int err = 0;
>>>>> +     int caps_inflight;
>>>>> +
>>>>> +     set_freezable();
>>>>> +
>>>>> +     while (1) {
>>>>> +             try_to_freeze();
>>>>> +
>>>>> +             wait_event_interruptible(chan->start_wait,
>>>>> +                                      !list_empty(&chan->capture) ||
>>>>> +                                      kthread_should_stop());
>>>> Is it really okay that list_empty() isn't protected with a lock?
>>>>
>>>> Why wait_event is "interruptible"?
>>> To allow it to sleep until wakeup on thread it to avoid constant
>>> checking for condition even when no buffers are ready, basically to
>>> prevent blocking.
>> So the "interrupt" is for getting event about kthread_should_stop(),
>> correct?
> also to prevent blocking and to let is sleep and wakeup based on wait
> queue to evaluate condition to proceed with the task
>>

This looks suspicious, the comment to wait_event_interruptible() says
that it will return ERESTARTSYS if signal is recieved..

Does this mean that I can send signal from userspace to wake it up?

The "interruptible" part looks wrong to me.
