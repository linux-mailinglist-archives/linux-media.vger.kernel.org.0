Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B9CD1B6AA9
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2020 03:08:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728320AbgDXBIa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 21:08:30 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:4284 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725993AbgDXBIa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 21:08:30 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ea23b980000>; Thu, 23 Apr 2020 18:06:32 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 23 Apr 2020 18:08:29 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 23 Apr 2020 18:08:29 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 24 Apr
 2020 01:08:29 +0000
Received: from [10.2.165.49] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 24 Apr
 2020 01:08:28 +0000
Subject: Re: [RFC PATCH v9 6/9] media: tegra: Add Tegra210 Video input driver
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
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
Message-ID: <8f01724e-95d4-e6d8-9e2d-bce4b8dd0177@nvidia.com>
Date:   Thu, 23 Apr 2020 18:08:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <39402a49-f39f-256c-31e7-afaa25d55664@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1587690392; bh=0VcoRgXJ0ZnT5wCxcL+1oZjS8xuQ825bdiGOnGN6ldI=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=KmrFXbTCpgHZzv0NUHaUfJjgUNF+0du/q8tLCI0Nu3o44g8QCH0DVWNGTie17IZC2
         gajOyou6UNclIWBlJYhCTpwvpEVeibc4EtQ1IZm/Wua+r/qQZGDaZ92KnyUugqbCFB
         qcpzhn0uoMW6fT0FYcVGipG1WoOu8KOhE7QkltxI9wJi3ynkD5SmSNQmhM8uJjgHLv
         dzX+H3rmEHPBTFWf4kiswfWAkx47BpgPH+K+XdcUtvalBwEglpx9sQj2szf8xdfCNw
         J7W4PVy83N1FNXByAPPJI62nUVR5Au9+tFUo1QtUX5Z58WsGiXVIVUryPodVGZ+ZQM
         qsBPB2SEp79AQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/23/20 5:51 PM, Sowjanya Komatineni wrote:
>
> On 4/23/20 5:42 PM, Dmitry Osipenko wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> 24.04.2020 02:50, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> On 4/23/20 4:25 PM, Dmitry Osipenko wrote:
>>>> External email: Use caution opening links or attachments
>>>>
>>>>
>>>> 24.04.2020 02:20, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>> On 4/23/20 4:19 PM, Sowjanya Komatineni wrote:
>>>>>> On 4/23/20 4:16 PM, Dmitry Osipenko wrote:
>>>>>>> External email: Use caution opening links or attachments
>>>>>>>
>>>>>>>
>>>>>>> 22.04.2020 09:18, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=
=82:
>>>>>>>> +static int chan_capture_kthread_start(void *data)
>>>>>>>> +{
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct tegra_vi_channel *chan =3D data;
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct tegra_channel_buffer *buf;
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 int err =3D 0;
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 set_freezable();
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 while (1) {
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 try_to_freeze();
>>>>>>>> +
>>>>>>>> + wait_event_interruptible(chan->start_wait,
>>>>>>>> + !list_empty(&chan->capture) ||
>>>>>>>> + kthread_should_stop());
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 if (kthread_should_stop())
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 /*
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 * Source is not streaming if error is non-zero.
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 * So, do not dequeue buffers on capture error.
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 */
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 if (err)
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 continue;
>>>>>>> This will result in an endless loop, I suppose it wasn't the
>>>>>>> intention.
>>>>>> no it will not. on error we report vb2_queue_error which will do
>>>>>> streaming stop request.
>>>>>>
>>>>>> So thread will be stopped on streaming stop request thru kthread=20
>>>>>> stop
>>>>>> signal
>>>>> To be clear on error it reports vb2 queue error and waits for stop
>>>>> streaming to happen
>>>> If thread should exit on error, then it should do it on the actual
>>>> error. Otherwise it looks very error-prone.
>>> When v4l2 drivers indicate fatal error through vb2_queue_error, queue
>>> error flag=C2=A0 is set and wakes up all processes waiting on queue alo=
ng
>>> with polling reporting=C2=A0 EPOLLERR and also reporting error for queu=
ing
>>> and dequeuing buffers. Stream stop will surely happen which stops the
>>> thread.
>> This doesn't explain what is the point of continuing to loop instead of
>> exiting immediately on error.
>
> We are using 2 threads and when capture start error happens, we can=20
> stop capture_start thread immediately but capture_finish thread will=20
> still run for any outstanding buffers.
>
> So, as it makes no diff stopping both threads during stream stop which=20
> will definitely happen on error and when we don't dequeue buffers
>
Also there will be an issue if we break on error immediately during=20
stop_streaming -> kthread_stop()

As stop streaming can happen any time, we do kthread_stop and in case of=20
error if we stop thread and on stop streaming kthread_stop might crash=20
as kthread_stop can only be called on running thread

