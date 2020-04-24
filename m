Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 814201B6B27
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2020 04:12:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726495AbgDXCMP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 22:12:15 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:6922 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726458AbgDXCMK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 22:12:10 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ea24a840000>; Thu, 23 Apr 2020 19:10:12 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 23 Apr 2020 19:12:09 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 23 Apr 2020 19:12:09 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 24 Apr
 2020 02:12:09 +0000
Received: from [10.2.165.49] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 24 Apr
 2020 02:12:08 +0000
Subject: Re: [RFC PATCH v9 6/9] media: tegra: Add Tegra210 Video input driver
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <helen.koike@collabora.com>
CC:     <sboyd@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
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
 <5ad77b67-0dc6-3c6d-7df3-4c21c68b2b1e@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <8c8c0154-f790-f90f-e117-0d3df6823f20@nvidia.com>
Date:   Thu, 23 Apr 2020 19:12:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <5ad77b67-0dc6-3c6d-7df3-4c21c68b2b1e@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1587694212; bh=DqYjVu4skB6ZMteopOkElbiiu4dQEhuGp15nT0L9KSc=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=sBfUpkUAJUDZ/o29H5GkDSLlyWncUu5YW0xy869BbrEl3o7s1ALL9dMg/mlsL0VOx
         b5czOj8+k0PNOp8eUnnyt/a4LgCH0mrXiezgKIwhHVuhqefLp38ttahGGdz3vr2mEM
         5B4JEKFg+LfDDKc/Gi2Vl8Cv5kWStW0fW8LwSpF3joU+6y/YlInqDePFco0fnsKujF
         7zlQP0BCisTyjYbnd1yhJwwBUvZnFl9B6X8Cgt3gWGcg/HSl+4Ks9rOXoAPnKVnUzI
         d19lA5dQfkzS2jLDB/kwN8TY42eGwdGRRWdgGrKi35i48iDt8AmSRLiTe590CtJo/M
         YZjunCL97qgpQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/23/20 7:09 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 24.04.2020 04:08, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 4/23/20 5:51 PM, Sowjanya Komatineni wrote:
>>> On 4/23/20 5:42 PM, Dmitry Osipenko wrote:
>>>> External email: Use caution opening links or attachments
>>>>
>>>>
>>>> 24.04.2020 02:50, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>> On 4/23/20 4:25 PM, Dmitry Osipenko wrote:
>>>>>> External email: Use caution opening links or attachments
>>>>>>
>>>>>>
>>>>>> 24.04.2020 02:20, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82=
:
>>>>>>> On 4/23/20 4:19 PM, Sowjanya Komatineni wrote:
>>>>>>>> On 4/23/20 4:16 PM, Dmitry Osipenko wrote:
>>>>>>>>> External email: Use caution opening links or attachments
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> 22.04.2020 09:18, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=
=82:
>>>>>>>>>> +static int chan_capture_kthread_start(void *data)
>>>>>>>>>> +{
>>>>>>>>>> +     struct tegra_vi_channel *chan =3D data;
>>>>>>>>>> +     struct tegra_channel_buffer *buf;
>>>>>>>>>> +     int err =3D 0;
>>>>>>>>>> +
>>>>>>>>>> +     set_freezable();
>>>>>>>>>> +
>>>>>>>>>> +     while (1) {
>>>>>>>>>> +             try_to_freeze();
>>>>>>>>>> +
>>>>>>>>>> + wait_event_interruptible(chan->start_wait,
>>>>>>>>>> + !list_empty(&chan->capture) ||
>>>>>>>>>> + kthread_should_stop());
>>>>>>>>>> +
>>>>>>>>>> +             if (kthread_should_stop())
>>>>>>>>>> +                     break;
>>>>>>>>>> +
>>>>>>>>>> +             /*
>>>>>>>>>> +              * Source is not streaming if error is non-zero.
>>>>>>>>>> +              * So, do not dequeue buffers on capture error.
>>>>>>>>>> +              */
>>>>>>>>>> +             if (err)
>>>>>>>>>> +                     continue;
>>>>>>>>> This will result in an endless loop, I suppose it wasn't the
>>>>>>>>> intention.
>>>>>>>> no it will not. on error we report vb2_queue_error which will do
>>>>>>>> streaming stop request.
>>>>>>>>
>>>>>>>> So thread will be stopped on streaming stop request thru kthread
>>>>>>>> stop
>>>>>>>> signal
>>>>>>> To be clear on error it reports vb2 queue error and waits for stop
>>>>>>> streaming to happen
>>>>>> If thread should exit on error, then it should do it on the actual
>>>>>> error. Otherwise it looks very error-prone.
>>>>> When v4l2 drivers indicate fatal error through vb2_queue_error, queue
>>>>> error flag  is set and wakes up all processes waiting on queue along
>>>>> with polling reporting  EPOLLERR and also reporting error for queuing
>>>>> and dequeuing buffers. Stream stop will surely happen which stops the
>>>>> thread.
>>>> This doesn't explain what is the point of continuing to loop instead o=
f
>>>> exiting immediately on error.
>>> We are using 2 threads and when capture start error happens, we can
>>> stop capture_start thread immediately but capture_finish thread will
>>> still run for any outstanding buffers.
>>>
>>> So, as it makes no diff stopping both threads during stream stop which
>>> will definitely happen on error and when we don't dequeue buffers
>>>
>> Also there will be an issue if we break on error immediately during
>> stop_streaming -> kthread_stop()
>>
>> As stop streaming can happen any time, we do kthread_stop and in case of
>> error if we stop thread and on stop streaming kthread_stop might crash
>> as kthread_stop can only be called on running thread
>>
> This a better explanation, but still it's not good that there could be a
> busy loop within the thread.
>
> Should be better to sleep if error is set.
>
> wait_event_interruptible(chan->start_wait,
>                          (!err && !list_empty(&chan->capture)) ||
>                          kthread_should_stop());
ok, will add err to wait condition to let it sleep
