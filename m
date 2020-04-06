Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF11619FF83
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 22:53:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726352AbgDFUxj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 16:53:39 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:37874 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725957AbgDFUxj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 16:53:39 -0400
Received: by mail-lj1-f194.google.com with SMTP id r24so1274451ljd.4;
        Mon, 06 Apr 2020 13:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NsnlQPkOu0I9hxPUVqMcoqIuvbuxd6yL4BRh38XbG/s=;
        b=exuIaN4CzcXYvGtI8SZcV7mmo8ozQ+K00h75JyOXe9IfkfzMPonwlG0KLd/sPWwt8R
         wNgEmxKMSudk8By3FVl9UliCmuoVHgnZv8QhX079kjEP8G7iPRmZaz92WCzIHqEAx+GG
         gYnRMTKfWVrK5aH5RcYtTLGDj2zUE7gSyi6FBMQ/fsoKcfHE3R+xBbjdW6smHp32nvS6
         +joVAshhF4T0DuruVsNs7dJRe2ICjo1o+CbBI5jo3f8HHpXdzoq6ttrlL4Lvc+DSj7Ku
         mkB/gDKk1Mkn9Imi7iPhbrGszqK/4TMguQ0rgsYiK50RhtX90CqkRvlDCJEm5TQQBLs6
         tL6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NsnlQPkOu0I9hxPUVqMcoqIuvbuxd6yL4BRh38XbG/s=;
        b=d9PFifXLSgjkTJNgnqAzhpi9ARxHcPDOBy/UWGR5HNJIl85qzbRIICmYSz6Px/Jw4V
         Zfob7Emhidys9kwwXGg6QllL2FM0iiE3ZkAmNRLoWqIG/jPp/tsWdo0DvYYHXuLxqCSe
         Py2safoakuP1D1DBef2z/+p44Hz/DCX0hQn6JfVUiaE2w/18fzvgcD7w7EY/RMLWfNhT
         1XbP3cEWoFNx9yiOpqvAfWRsr/HKBhBAqmWCZkieJIqpeKB9cEF9+zv91dGAyhDHKhJo
         02QbsX/+mOD5lTKhyRJTXQz5NYqPNRuXamZZjZb7FeeqpOBNQANiHBsrACvod6uZp9nY
         TZvw==
X-Gm-Message-State: AGi0PuZKFzkoNjUSUT4qygN7nyL8jwpM756HKg1UYpkmPtRDxPLiLdEY
        y7aAbIFlNh4dHDcmnMj3Yxsk7S75
X-Google-Smtp-Source: APiQypIIW2A3Op4dX1iVbdqhE53SXQnj2sIBQ82+haErgaw/x/0k3MIUmPaid6ya7GIAw2ag5DVNzA==
X-Received: by 2002:a2e:868b:: with SMTP id l11mr687737lji.247.1586206414049;
        Mon, 06 Apr 2020 13:53:34 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id n17sm10795873ljc.76.2020.04.06.13.53.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2020 13:53:33 -0700 (PDT)
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <be77b0ef-d605-8357-4180-f40b2886d07a@gmail.com>
Date:   Mon, 6 Apr 2020 23:53:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <23bfab09-b464-6e51-9843-06d13000e9b9@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

06.04.2020 23:50, Sowjanya Komatineni пишет:
> 
> On 4/6/20 1:45 PM, Dmitry Osipenko wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> 04.04.2020 04:25, Sowjanya Komatineni пишет:
>>> +static int chan_capture_kthread_start(void *data)
>>> +{
>>> +     struct tegra_vi_channel *chan = data;
>>> +     struct tegra_channel_buffer *buf;
>>> +     int err = 0;
>>> +     int caps_inflight;
>>> +
>>> +     set_freezable();
>>> +
>>> +     while (1) {
>>> +             try_to_freeze();
>>> +
>>> +             wait_event_interruptible(chan->start_wait,
>>> +                                      !list_empty(&chan->capture) ||
>>> +                                      kthread_should_stop());
>>> +             /*
>>> +              * Frame start and MW_ACK_DONE syncpoint condition
>>> FIFOs are
>>> +              * of max depth 2. So make sure max 2 capture requests are
>>> +              * in process by the hardware at a time.
>>> +              */
>>> +             while (!(kthread_should_stop() ||
>>> list_empty(&chan->capture))) {
>>> +                     caps_inflight = chan->capture_reqs -
>>> chan->sequence;
>>> +                     /*
>>> +                      * Source is not streaming if error is non-zero.
>>> +                      * So, do not dequeue buffers on capture error
>>> or when
>>> +                      * syncpoint requests in FIFO are full.
>>> +                      */
>>> +                     if (err || caps_inflight >= SYNCPT_FIFO_DEPTH)
>>> +                             break;
>> Am I understanding correctly that this thread will take 100% CPU,
>> spinning here, if more than 2 frame-captures queued?
> on more than 2 frames captures, it breaks thread and on next wakeup it
> continues

The wait_event() won't wait if condition is true.
