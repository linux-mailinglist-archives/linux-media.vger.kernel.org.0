Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8F341B6A69
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2020 02:42:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728422AbgDXAmJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 20:42:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728151AbgDXAmJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 20:42:09 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E25A2C09B042;
        Thu, 23 Apr 2020 17:42:08 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id k28so6255370lfe.10;
        Thu, 23 Apr 2020 17:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DyHmlDXMQttK3VjJN/3MwiafRpFMXswQBrOrYEEW5UQ=;
        b=kHBPsvyCqZk7ezdnW+N2JTgpfI0XSKgrsHLfoxgLd755UlFHkfcdZVvRxxihyyOIri
         3uOyIphPk8bQuEEO64OBG0aadV4vXhncWxTf7TJSx2C/2O1djFgcT68WxXCTXns8ly2D
         Akf1AjKMIbDnw7Vimi9Hs7ES1PcOwRQD+nRoYTeNEY5q79VOwaPk/we4jaTir/bETImo
         3V/AcPRxN7bY/B6LCOjhu9SeYzeSklBlDk7LANqbfdaIKt6m7Hb/4aUSXw3vKvByV71E
         I9eHSokVPzuvWaLYu16GoAVI/IE8rAFpynnew+DcSpxVi8aUC9cBE9wUgHeE65RtCYzF
         dhDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DyHmlDXMQttK3VjJN/3MwiafRpFMXswQBrOrYEEW5UQ=;
        b=X91hpsVj0iUhp+QFHGq1QFczbee0/ohbWDqIrjqHp705uEz0+8gXb7cD/pGB1eLOHZ
         1eXDwLBQ+Pz9vDhmActlXkWIf4dZ5H1ZxApaSMqBlE5rJmO8eQpZbK1LByHnwpq3fVhp
         DoQh60Ou6MkM/VcDeYeOZJsrMHIlOE5nIXFF8Jv5bgLNsp0T84HoeQ/S3Q0VM/GE7InD
         bQinJSXHnnjBjeJ6m+c5Uz03W0tjxcdyVIeWyThrQILCsrBSLh3wYNMc2pIEz1rutLgV
         vJ8iK2Gu2HhLWPoZmm/eGYRtoVLx+9Yn1oMlqcAXd85wp9EAJwXx0IJclglR6DpAhEzC
         GQrg==
X-Gm-Message-State: AGi0PubHSlUjj4VzNFwDuurDeXqOgvL6/qrAoQ4SQex8nJGJRAHElCP+
        bwWPVWTP6H5EOPPMQv6UL9p6AVfx
X-Google-Smtp-Source: APiQypIiLRkAFnOf9n8UqI20jR6gqwwA6CQwhl7FKMZ3ipS3GDPUeoRf6tx753nOqNRDyJnS6s3sxw==
X-Received: by 2002:ac2:57cc:: with SMTP id k12mr4072217lfo.69.1587688927179;
        Thu, 23 Apr 2020 17:42:07 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id a28sm3138880lfr.4.2020.04.23.17.42.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2020 17:42:06 -0700 (PDT)
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <492dafac-42aa-3caf-4d32-ba0e434b19c3@gmail.com>
Date:   Fri, 24 Apr 2020 03:42:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <a2672be9-93c1-8363-6c0e-6d43c2bd59bc@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

24.04.2020 02:50, Sowjanya Komatineni пишет:
> 
> On 4/23/20 4:25 PM, Dmitry Osipenko wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> 24.04.2020 02:20, Sowjanya Komatineni пишет:
>>> On 4/23/20 4:19 PM, Sowjanya Komatineni wrote:
>>>> On 4/23/20 4:16 PM, Dmitry Osipenko wrote:
>>>>> External email: Use caution opening links or attachments
>>>>>
>>>>>
>>>>> 22.04.2020 09:18, Sowjanya Komatineni пишет:
>>>>>> +static int chan_capture_kthread_start(void *data)
>>>>>> +{
>>>>>> +     struct tegra_vi_channel *chan = data;
>>>>>> +     struct tegra_channel_buffer *buf;
>>>>>> +     int err = 0;
>>>>>> +
>>>>>> +     set_freezable();
>>>>>> +
>>>>>> +     while (1) {
>>>>>> +             try_to_freeze();
>>>>>> +
>>>>>> +             wait_event_interruptible(chan->start_wait,
>>>>>> + !list_empty(&chan->capture) ||
>>>>>> +                                      kthread_should_stop());
>>>>>> +
>>>>>> +             if (kthread_should_stop())
>>>>>> +                     break;
>>>>>> +
>>>>>> +             /*
>>>>>> +              * Source is not streaming if error is non-zero.
>>>>>> +              * So, do not dequeue buffers on capture error.
>>>>>> +              */
>>>>>> +             if (err)
>>>>>> +                     continue;
>>>>> This will result in an endless loop, I suppose it wasn't the
>>>>> intention.
>>>> no it will not. on error we report vb2_queue_error which will do
>>>> streaming stop request.
>>>>
>>>> So thread will be stopped on streaming stop request thru kthread stop
>>>> signal
>>> To be clear on error it reports vb2 queue error and waits for stop
>>> streaming to happen
>> If thread should exit on error, then it should do it on the actual
>> error. Otherwise it looks very error-prone.
> When v4l2 drivers indicate fatal error through vb2_queue_error, queue
> error flag  is set and wakes up all processes waiting on queue along
> with polling reporting  EPOLLERR and also reporting error for queuing
> and dequeuing buffers. Stream stop will surely happen which stops the
> thread.

This doesn't explain what is the point of continuing to loop instead of
exiting immediately on error.
