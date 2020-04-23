Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E68711B6A23
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2020 01:50:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728125AbgDWXuk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 19:50:40 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:1067 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726161AbgDWXuj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 19:50:39 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ea2295a0000>; Thu, 23 Apr 2020 16:48:42 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 23 Apr 2020 16:50:39 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 23 Apr 2020 16:50:39 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 23 Apr
 2020 23:50:39 +0000
Received: from [10.2.165.49] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 23 Apr
 2020 23:50:37 +0000
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
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <a2672be9-93c1-8363-6c0e-6d43c2bd59bc@nvidia.com>
Date:   Thu, 23 Apr 2020 16:50:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <fce6dfbb-0b8d-319b-2d6f-976953a3c36c@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1587685722; bh=1rPMThke2vlH4gt1psqR9lA1CdQR51YkE8ZDvPRLlnU=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=SJmtTMwzED4NoBMwXhvfF9z6v/Yx8Jy0ZfDBdZXvWgm/4B0a0ZcjYh9pacz344iN9
         fHprafFWYh5sDeZs7newdr2iKjovIQ74PV0LzzmcHHH8VdVLX509gXO5yHxkv5+EII
         xw6GiUV3ugiZur1zXenvBjJnKNBNqCrsu0qtL5MVVUGJkzPdGHeOvBFMsjjtn/TLrQ
         GDalrLDyaRkAm7hL1/jZueTefc3W7B0BGzLTTr/RHFCmjx8SBOFaAitpeNvgE0OPP8
         djnRwh83QalbObyCcUkkK/aLkdN4Vt/rC+0oRQWRKX1l3dU/JUv6iKAvmaBVKectd5
         osPaOaGNo6lMg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/23/20 4:25 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 24.04.2020 02:20, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 4/23/20 4:19 PM, Sowjanya Komatineni wrote:
>>> On 4/23/20 4:16 PM, Dmitry Osipenko wrote:
>>>> External email: Use caution opening links or attachments
>>>>
>>>>
>>>> 22.04.2020 09:18, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>> +static int chan_capture_kthread_start(void *data)
>>>>> +{
>>>>> +     struct tegra_vi_channel *chan =3D data;
>>>>> +     struct tegra_channel_buffer *buf;
>>>>> +     int err =3D 0;
>>>>> +
>>>>> +     set_freezable();
>>>>> +
>>>>> +     while (1) {
>>>>> +             try_to_freeze();
>>>>> +
>>>>> +             wait_event_interruptible(chan->start_wait,
>>>>> + !list_empty(&chan->capture) ||
>>>>> +                                      kthread_should_stop());
>>>>> +
>>>>> +             if (kthread_should_stop())
>>>>> +                     break;
>>>>> +
>>>>> +             /*
>>>>> +              * Source is not streaming if error is non-zero.
>>>>> +              * So, do not dequeue buffers on capture error.
>>>>> +              */
>>>>> +             if (err)
>>>>> +                     continue;
>>>> This will result in an endless loop, I suppose it wasn't the intention=
.
>>> no it will not. on error we report vb2_queue_error which will do
>>> streaming stop request.
>>>
>>> So thread will be stopped on streaming stop request thru kthread stop
>>> signal
>> To be clear on error it reports vb2 queue error and waits for stop
>> streaming to happen
> If thread should exit on error, then it should do it on the actual
> error. Otherwise it looks very error-prone.
When v4l2 drivers indicate fatal error through vb2_queue_error, queue=20
error flag=C2=A0 is set and wakes up all processes waiting on queue along=20
with polling reporting=C2=A0 EPOLLERR and also reporting error for queuing=
=20
and dequeuing buffers. Stream stop will surely happen which stops the=20
thread.
