Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 975C21C07C0
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2020 22:21:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727114AbgD3UVM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Apr 2020 16:21:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726377AbgD3UVL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Apr 2020 16:21:11 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E662C035494;
        Thu, 30 Apr 2020 13:21:11 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id f18so674027lja.13;
        Thu, 30 Apr 2020 13:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hNallrmyHiWRjLA+2PQXq4kI/iicsWOXi2ASu8MjjYg=;
        b=f3ZIOPf2IkINkW2rusSM4SPow1WfmR0rKgFEpPTi5Z/lmVORwTJCh1JyuIamwljsa9
         +Iq4G+nk/nNYTMNkD4TWJLXcPEuKwO9YfJaRMb02VA1v6op+7UoU6xMPSCby2nYuslRo
         qmpVu3t27HugLeyXQNaDvgLNO3SZpZSLUvPfzDT5lQIed6evOKNSIjNJK11scvJifQ7z
         QabHii7fnJfn8dLvqO8igOY34etl2IpNl7Ll0VHKC+IaParS7HJtAme1Yzv1R/fpGA5J
         5ae/eiS8WOpbFtHH0oF512sRX83TOhGCK3BOZy02T7Jx9iBxXD3x/BB3P+Y2o/mf4uoV
         5OYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hNallrmyHiWRjLA+2PQXq4kI/iicsWOXi2ASu8MjjYg=;
        b=uoB/JVywNM5dFP2JME6TaptRMbHXSEx0h9vrydTO3xR+Av6TaQjUbjfFlTeAEbZr3/
         h5OYx+LMTRCX26teCZQ5d1JAYIdKFTV0gTaqAWRZTFfK2+MYBb0xu+n24u/Ba4y2FfwP
         UVmGLagt93n+CVZYxcvipsl1O9wVYvv7oYfyA/YQGJ0IJA1sIJikr9CZreyNQQ0EiACb
         c9NdVjJF6DQZLNpIdI7FT0xiU2goxuROpJ5yBtmoMinAV1isZZMg/xc2xTrQYI7uT1QF
         kOvptb51YPlKZScg8IgV5JQsb+/ayXqjrkYYVTeTLpLD7Tor82IrOhUCFSM8+Nxnzdgk
         R/SQ==
X-Gm-Message-State: AGi0PubIO/cbkQiWlrnfDUEH/LRPVR7a7CIRJBaU3bhlKZFFS2y/rdVh
        V/PqweMEOoChTw8MF6phX6wI55Rp
X-Google-Smtp-Source: APiQypKU2oxF6oMqsC+ACBiHDWQd6VRGAGt/G87OyQumekfBPfJ/xHt0A1sHD1WgXJfttkSWtlwnfw==
X-Received: by 2002:a2e:97d3:: with SMTP id m19mr376917ljj.136.1588278069490;
        Thu, 30 Apr 2020 13:21:09 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id s8sm535240lfd.61.2020.04.30.13.21.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2020 13:21:08 -0700 (PDT)
Subject: Re: [RFC PATCH v11 6/9] media: tegra: Add Tegra210 Video input driver
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc:     sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1588197606-32124-1-git-send-email-skomatineni@nvidia.com>
 <1588197606-32124-7-git-send-email-skomatineni@nvidia.com>
 <eadf3a5a-f305-4561-10e1-1b9241b9c5c2@gmail.com>
 <bfd82642-9648-96f1-737d-4b9a869d34a3@nvidia.com>
 <52b98347-4b78-f637-04f4-cc730ad336f3@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <8da0929d-4a58-75b8-381c-511ce66f8d9d@gmail.com>
Date:   Thu, 30 Apr 2020 23:21:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <52b98347-4b78-f637-04f4-cc730ad336f3@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

30.04.2020 23:09, Sowjanya Komatineni пишет:
> 
> On 4/30/20 1:08 PM, Sowjanya Komatineni wrote:
>>
>> On 4/30/20 1:06 PM, Dmitry Osipenko wrote:
>>> 30.04.2020 01:00, Sowjanya Komatineni пишет:
>>>> +static int chan_capture_kthread_start(void *data)
>>>> +{
>>>> +    struct tegra_vi_channel *chan = data;
>>>> +    struct tegra_channel_buffer *buf;
>>>> +    int err = 0;
>>>> +
>>>> +    set_freezable();
>>>> +
>>>> +    while (1) {
>>>> +        try_to_freeze();
>>>> +
>>>> +        /*
>>>> +         * Source is not streaming if error is non-zero.
>>>> +         * So, do not dequeue buffers on error and let the thread
>>>> sleep
>>>> +         * till kthread stop signal is received.
>>>> +         */
>>>> +        wait_event_interruptible(chan->start_wait,
>>>> +                     kthread_should_stop() ||
>>>> +                     (!list_empty(&chan->capture) &&
>>>> +                     !err));
>>> ...
>>>> +static void tegra_channel_buffer_queue(struct vb2_buffer *vb)
>>>> +{
>>>> +    struct tegra_vi_channel *chan = vb2_get_drv_priv(vb->vb2_queue);
>>>> +    struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
>>>> +    struct tegra_channel_buffer *buf = to_tegra_channel_buffer(vbuf);
>>>> +
>>>> +    /* put buffer into the capture queue */
>>>> +    spin_lock(&chan->start_lock);
>>>> +    list_add_tail(&buf->queue, &chan->capture);
>>>> +    spin_unlock(&chan->start_lock);
>>>> +
>>>> +    /* wait up kthread for capture */
>>>> +    wake_up_interruptible(&chan->start_wait);
>>>> +}
>>> The V4L doc says that buffers could be enqueued before streaming is
>>> started. I guess it should be a trouble here, shouldn't it?
>>>
>>> https://elixir.bootlin.com/linux/v5.7-rc3/source/include/media/videobuf2-core.h#L379
>>>
>>
>> what trouble are you referring here?
>>
>> I dont think so as we set min buffers needed as 2 always there will be
>> 2 per-queued buffers.
> typo* pre-queued buffers before streaming start
>>
>> But buffers from this queue will be dequeued only when ready to
>> processes in the capture thread

I see now that the threads won't be running until start_streaming() is
invoked, should be okay then.
