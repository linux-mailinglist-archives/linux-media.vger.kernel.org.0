Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DD6A19FFA7
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 22:56:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbgDFU4e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 16:56:34 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:36192 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726084AbgDFU4e (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 16:56:34 -0400
Received: by mail-lj1-f196.google.com with SMTP id b1so1287781ljp.3;
        Mon, 06 Apr 2020 13:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=m4YEjHOQzSNFd68a9Mm226UNhvqPTovnFAMO2q+cqdA=;
        b=BOkZDwRScSAmZdBwIMqxO7xvW25h1+bgaMCpus/nSP38a+fuh2+1vyqAhnr6+JHejs
         0xeC497nMSL4N3EByOdAQOu0ll0R8nJEHQtl76i+TWEMggAfB6XlaPRzuA5ccoSBc3Ot
         PxPA3hTz5fopYjJTlPJGfCSHZSOr2PtvCGN8BE50gGd1ef5cP760IFyLKQdK1KDZii7k
         Bh1gE0wDBrhmSbEw0AaKsB1h41I/9wgLJxPpbDlDuy3gS6qtjCBbAHKeCR3zOt1ITbhU
         uw2uT1fQdH5UTQZXNTaxF8e4Tmwce3NVRRSCnNO61mlQ8FcbF8otyu6AHzxAhmpKo0Oo
         FzkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=m4YEjHOQzSNFd68a9Mm226UNhvqPTovnFAMO2q+cqdA=;
        b=mfXJuZr5ZP2U5UXGfzqQncDvl/rzlfAWffjz/CuTTJo1pralZJs2srIlvuaUnBaxPy
         EHrCwsa/rrC0f0dfJqJBw+JrhLOu7hfN3jV/ScChJu0J+X5UBha7b0jhZsiCQHxNEX4T
         ewzFFXKkLxNSuYVi80E0c/pWIdYnR++Qszt2lFeDhg+54BWwzy3r6xZYiUK2bZ6mkLIb
         68G5qAas+kl6Csew6d76vWUEc/o2+TO/08NIQeMrqSCVxZPFJLAolgbWgNt4VlKgXVkT
         3d13QmQ3DNGqo/OxDBtnbjaVrXpe6Vv+ABC7/+xekmth5NK7x7p4pIRybv2M/I8deKHW
         JODQ==
X-Gm-Message-State: AGi0Pube9z9KEgDrdlkdQkK3UAVtyPqGmtYuigrMqPhQJjdud1Wdh49M
        AE1vSoZHqlZ+Zurjs5U0nOvmcstT
X-Google-Smtp-Source: APiQypLfBmFvm+GNYEaZbaANGod8VKUywm1iPT1ciwDTXi5y2Ljca8haVWjt4Whmk1t4FiB1RfQaRQ==
X-Received: by 2002:a2e:a310:: with SMTP id l16mr699762lje.255.1586206590575;
        Mon, 06 Apr 2020 13:56:30 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id x17sm10572315ljc.33.2020.04.06.13.56.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2020 13:56:29 -0700 (PDT)
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <12a834ac-52b1-6dc0-7d3a-3e6a1fa85a2a@gmail.com>
Date:   Mon, 6 Apr 2020 23:56:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <08cd31d5-e8b9-4d3a-fb0e-0e4462947d96@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

06.04.2020 23:55, Sowjanya Komatineni пишет:
> 
> On 4/6/20 1:53 PM, Dmitry Osipenko wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> 06.04.2020 23:50, Sowjanya Komatineni пишет:
>>> On 4/6/20 1:45 PM, Dmitry Osipenko wrote:
>>>> External email: Use caution opening links or attachments
>>>>
>>>>
>>>> 04.04.2020 04:25, Sowjanya Komatineni пишет:
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
>>>>> +             /*
>>>>> +              * Frame start and MW_ACK_DONE syncpoint condition
>>>>> FIFOs are
>>>>> +              * of max depth 2. So make sure max 2 capture
>>>>> requests are
>>>>> +              * in process by the hardware at a time.
>>>>> +              */
>>>>> +             while (!(kthread_should_stop() ||
>>>>> list_empty(&chan->capture))) {
>>>>> +                     caps_inflight = chan->capture_reqs -
>>>>> chan->sequence;
>>>>> +                     /*
>>>>> +                      * Source is not streaming if error is non-zero.
>>>>> +                      * So, do not dequeue buffers on capture error
>>>>> or when
>>>>> +                      * syncpoint requests in FIFO are full.
>>>>> +                      */
>>>>> +                     if (err || caps_inflight >= SYNCPT_FIFO_DEPTH)
>>>>> +                             break;
>>>> Am I understanding correctly that this thread will take 100% CPU,
>>>> spinning here, if more than 2 frame-captures queued?
>>> on more than 2 frames captures, it breaks thread and on next wakeup it
>>> continues
>> The wait_event() won't wait if condition is true.
> condition is checked when waitqueue is woken up

https://elixir.bootlin.com/linux/v5.6.2/source/include/linux/wait.h#L462
