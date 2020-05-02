Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 449A01C269E
	for <lists+linux-media@lfdr.de>; Sat,  2 May 2020 17:39:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728318AbgEBPjQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 May 2020 11:39:16 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:16203 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728222AbgEBPjQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 2 May 2020 11:39:16 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ead94160000>; Sat, 02 May 2020 08:39:02 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Sat, 02 May 2020 08:39:15 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Sat, 02 May 2020 08:39:15 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 2 May
 2020 15:39:14 +0000
Received: from [10.2.165.119] (172.20.13.39) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 2 May 2020
 15:39:13 +0000
Subject: Re: [RFC PATCH v11 6/9] media: tegra: Add Tegra210 Video input driver
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <helen.koike@collabora.com>
CC:     <sboyd@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1588197606-32124-1-git-send-email-skomatineni@nvidia.com>
 <b3238987-5e8a-32f2-7ce7-924e86bc6e9e@nvidia.com>
 <298187f6-2425-4813-1ae1-f256c179623e@nvidia.com>
 <9c942bc9-703e-3bbb-eeab-f37e69dc1ded@nvidia.com>
 <b72b9d5c-7d02-1b58-20f7-30f94e230d58@gmail.com>
 <668d9b65-9590-cc97-41c3-2c1a5cfbbe61@nvidia.com>
 <289d9c92-383f-3257-de7b-46179724285a@nvidia.com>
 <9aa64f21-7b23-7228-b5eb-d2ff092682ad@nvidia.com>
 <668cc4a0-2c81-0d87-b801-9fbf64e19137@nvidia.com>
 <bf3f654e-b8f8-d560-fc5e-03d73cb7eab0@nvidia.com>
 <525e481b-9137-6fdd-bbf9-3779a5704e6b@nvidia.com>
 <fe7ebad6-0368-b1f0-4f58-648baa5e3f79@nvidia.com>
 <4f095181-2338-3b71-316c-f8bbfc7865cc@nvidia.com>
 <50e872bb-913a-7b47-3264-af6b1cedb0e2@nvidia.com>
 <e17a8a49-be53-465d-f64c-3f4c77391d98@nvidia.com>
 <da5154b4-85f9-3e56-a440-f75debaec3a8@nvidia.com>
 <cbb047ae-97dc-8b9a-a5ba-8e2a5dab3771@nvidia.com>
 <6ae2d00d-7955-d12b-5b56-955ef72ece26@nvidia.com>
 <f9073b28-f1f1-636c-be53-764fb0a531a1@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <1767e50f-efb7-5e89-22f6-0917821b660d@nvidia.com>
Date:   Sat, 2 May 2020 08:38:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <f9073b28-f1f1-636c-be53-764fb0a531a1@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1588433942; bh=pxcgxWnOms0JNCGY0beIKmduC/mRp9XnIN7OhVSyJcM=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=aJtvOclBmhT+mJgqzKWTyuTP/Vlpb71oE1FlnnmXlKb+PRftx7g4K6nemwx9b92Pe
         duOdp9JVdinqKnpylIL1SHg12NBo3vta1Lvd1X6ShJ4gc0kxmz/6nN1Kf+klOhF6w/
         twp4HgMJemxtPmcVj9b8qa2LBkS2x29lZB5Hz05/Z6TwySOgOMo2MBCE2eUWVWXE5o
         nLkhVyoxCcLC8of7ZZq2V2vOf+Z9t2ImCVsDcoDcjaxbX54kx5oHJ4wF7nP0uxFD7h
         Wmot91uezjNKk0vPilPFJwa7ZajlwVoYG2vQ/Fsirqr6WPYTUbwhk5Y71rdPrijMQd
         /11ALUebQx0BA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 5/2/20 8:16 AM, Dmitry Osipenko wrote:
> 02.05.2020 06:55, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 5/1/20 8:39 PM, Sowjanya Komatineni wrote:
>>>
>>> On 5/1/20 2:05 PM, Sowjanya Komatineni wrote:
>>>>
>>>> On 5/1/20 1:58 PM, Sowjanya Komatineni wrote:
>>>>>
>>>>> On 5/1/20 1:44 PM, Sowjanya Komatineni wrote:
>>>>>>
>>>>>> On 5/1/20 11:03 AM, Sowjanya Komatineni wrote:
>>>>>>>
>>>>>>> On 4/30/20 4:33 PM, Sowjanya Komatineni wrote:
>>>>>>>>
>>>>>>>> On 4/30/20 4:14 PM, Sowjanya Komatineni wrote:
>>>>>>>>>>>>>>> And in this case synchronization between start/finish
>>>>>>>>>>>>>>> threads should be
>>>>>>>>>>>>>>> needed in regards to freezing.
>>>>>>>>>>>>>> Was thinking to have counter to track outstanding frame
>>>>>>>>>>>>>> w.r.t single shot issue b/w start and finish and allow to
>>>>>>>>>>>>>> freeze only when no outstanding frames in process.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> This will make sure freeze will not happen when any buffers
>>>>>>>>>>>>>> are in progress
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Note that this could be a wrong assumption, I'm not
>>>>>>>>>>>>>>> closely familiar
>>>>>>>>>>>>>>> with how freezer works.
>>>>>>>>>>>>> kthread_start can unconditionally allow try_to_freeze before
>>>>>>>>>>>>> start of frame capture
>>>>>>>>>>>>>
>>>>>>>>>>>>> We can compute captures inflight w.r.t single shot issued
>>>>>>>>>>>>> during capture start and finished frames by kthread_finish
>>>>>>>>>>>>> and allow kthread_finish to freeze only when captures
>>>>>>>>>>>>> inflight is 0.
>>>>>>>>>>>>>
>>>>>>>>>>>>> This allows freeze to happen b/w frames but not in middle of
>>>>>>>>>>>>> frame
>>>>>>>>>> will have caps inflight check in v12 to allow freeze finish
>>>>>>>>>> thread only when no captures are in progress
>>>>>>>>>
>>>>>>>>> try_to_freeze() returns thread frozen state and looks like we
>>>>>>>>> can use this in kthread finish to allow finish thread to freeze
>>>>>>>>> only when kthread_start is already frozen and no buffers in
>>>>>>>>> progress/initiated for capture.
>>>>>>>>>
>>>>>>>> chan->capture_frozen holds frozen state returned from
>>>>>>>> try_to_freeze() in start kthread
>>>>>>>>
>>>>>>>> chan->capture_reqs increments after every single shot issued.
>>>>>>>>
>>>>>>>>
>>>>>>>> static int chan_capture_kthread_finish(void *data)
>>>>>>>>
>>>>>>>> {
>>>>>>>>  =C2=A0=C2=A0=C2=A0 struct tegra_vi_channel *chan =3D data;
>>>>>>>>  =C2=A0=C2=A0=C2=A0 struct tegra_channel_buffer *buf;
>>>>>>>>  =C2=A0=C2=A0=C2=A0 int caps_inflight;
>>>>>>>>
>>>>>>>>  =C2=A0=C2=A0=C2=A0 set_freezable();
>>>>>>>>
>>>>>>>>  =C2=A0=C2=A0=C2=A0 while (1) {
>>>>>>>>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 wait_event_interruptible(ch=
an->done_wait,
>>>>>>>>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0!list_empty(&chan->done) ||
>>>>>>>>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0kthread_should_stop());
>>>>>>>>
>>>>>>>>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* dequeue buffers and fini=
sh capture */
>>>>>>>>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 buf =3D dequeue_buf_done(ch=
an);
>>>>>>>>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 while (buf) {
>>>>>>>>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 tegra_ch=
annel_capture_done(chan, buf);
>>>>>>>>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 buf =3D =
dequeue_buf_done(chan);
>>>>>>>>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 }
>>>>>>>>
>>>>>>>>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if (kthread_should_stop())
>>>>>>>>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 break;
>>>>>>>>
>>>>>>>>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 caps_inflight =3D chan->cap=
ture_reqs - chan->sequence;
>>>>>>>>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if (chan->capture_frozen &&=
 !caps_inflight)
>>>>>>>>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 try_to_f=
reeze();
>>>>>>>>  =C2=A0=C2=A0=C2=A0 }
>>>>>>>>
>>>>>>>>  =C2=A0=C2=A0=C2=A0 return 0;
>>>>>>>> }
>>>>>>>
>>>>>>> Freezing happens prior to suspend() during suspend entry and when
>>>>>>> we implement suspend/resume during suspend we stop streaming where
>>>>>>> we stop threads anyway.
>>>>>>>
>>>>>>> So, was thinking why we need these threads freezable here?
>>>>>>>
>>>>>>>
>>>>>> Hi Dmitry,
>>>>>>
>>>>>> Did some testing and below are latest observation and fix I tested.
>>>>>>
>>>>>> wait_event_interruptible() uses schedule() which blocks the freezer.
>>>>>> When I do suspend while keeping streaming active in background, I
>>>>>> see freezing of these threads fail and call trace shows __schedule
>>>>>> -> __switch_to from these kthreads.
>>>>>>
>>>>>> wait_event_freezable() uses freezable_schedule() which should not
>>>>>> block the freezer but we can't use this here as we need conditional
>>>>>> try_to_freeze().
>>>>>>
>>>>>>
>>>>>> So, doing below sequence works where we set PF_FREEZER_SKIP flag
>>>>>> thru freezer_not_count() before wait_event which calls schedule()
>>>>>> and remove PF_FREEZER_SKIP after schedule allows try_to_freeze to
>>>>>> work and also conditional try_to_freeze below prevents freezing
>>>>>> thread in middle of capture.
>>>>>>
>>>>>> while (1) {
>>>>>>  =C2=A0=C2=A0=C2=A0 freezer_not_count()
>>>>>>  =C2=A0=C2=A0=C2=A0 wait_event_interruptible()
>>>>>>  =C2=A0=C2=A0=C2=A0 freezer_count()
>>>>>>  =C2=A0=C2=A0=C2=A0 ...
>>>>>>  =C2=A0=C2=A0=C2=A0 ...
>>>>>>  =C2=A0=C2=A0=C2=A0 if (chan->capture_frozen && !caps_inflight)
>>>>>>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 try_to_freeze()
>>>>>> }
>>>>>>
>>>>>> Please comment if you agree with above sequence. Will include this
>>>>>> in v12.
>>>>>>
>>>> sorry, freezer_count() does try_to_freeze after clearing skip flag.
>>>> So, dont think we can use this as we need conditional try_to_freeze.
>>>> Please ignore above sequence.
>>>>> Or probably we can take closer look on this later when we add
>>>>> suspend/resume support as it need more testing as well.
>>>>>
>>>>> As this is initial series which has TPG only I think we shouldn't
>>>>> get blocked on this now. Series-2 and 3 will be for sensor support
>>>>> and on next series when we add suspend/resume will look into this.
>>>>>
>>>>>
>>> When freeze activity starts and in case if finish thread freezes prior
>>> to start thread issuing capture, its the VI hardware writes data to
>>> the allocated buffer address.
>>>
>>> finish thread just checks for the event from the hardware and we don't
>>> handle/process directly on memory in this driver.
>>>
>>> So even we freeze done thread when single shot is issued frame buffer
>>> gets updated.
>>>
>>> In case if capture thread is frozen there will not buffers queued to
>>> process by finish thread. So, this will not be an issue.
>>>
>>> So, probably we don't need to do conditional try_to_freeze and what we
>>> have should work good in this corner case.
>>>
>> I still need to change wait_event_interruptible() to
>> wait_event_freezable() but no need to synchronize finish thread freeze
>> with start thread as even on issuing capture start its vi hardware that
>> does frame buffer update and finish thread just checks for mw_ack event
>> and returns buffer to application.
> The problem we are primarily trying to avoid is to have suspending being
> done in the middle of IO.
>
> IIUC, even if system will be suspended in the middle of VI IO, it won't
> be fatal. In worst case the buffer capture should fail on resume from
> suspend. Could you please try to simulate this potential issue and see
> what result will be on suspending in the middle of VI IO?
>
> We don't want to suspend system / stop streaming in the middle of IO, so
> this problem of a proper threads tear-down still exists. It should
> become easier to resolve the problem in a case of a proper suspending
> callback because the "start" thread could be turned down at any time, so
> it should be easier to maintain a proper tear-down order when threads
> are fully controlled by the driver, i.e. the "start" thread goes down
> first and the "finish" is second, blocking until the capture is completed=
.
>
> I think yours suggestion about dropping the freezing from the threads
> for now and returning back to it later on (once a proper suspend/resume
> support will be added) sounds reasonable.
>
> But if you'd want to keep the freezing, then the easy solution could be
> like that:
>
>    1. "start" thread could freeze at any time
>    2. "finish" thread could freeze only when the "start" thread is frozen
> and capture isn't in-progress. Use frozen(kthread_start_capture) to
> check the freezing state.
>
> https://elixir.bootlin.com/linux/v5.7-rc3/source/include/linux/freezer.h#=
L25

That's exactly what I tried, below is the snippet.

But as mentioned I am seeing freezing fail when I=20
wait_event_interruptible() in either of the threads.

 =C2=A0=C2=A0 60.368709] Call trace:
[=C2=A0=C2=A0 60.371216] __switch_to+0xec/0x140
[=C2=A0=C2=A0 60.374768] __schedule+0x32c/0x668
[=C2=A0=C2=A0 60.378315] schedule+0x78/0x118
[=C2=A0=C2=A0 60.381606]=C2=A0 chan_capture_kthread_finish+0x244/0x2a0 [teg=
ra_video]
[=C2=A0=C2=A0 60.387865] kthread+0x124/0x150
[=C2=A0=C2=A0 60.391150] ret_from_fork+0x10/0x1c

wait_event_interruptible() API uses schedule() which blocks freezer=20
while wait_event_freezable APIs uses freezable_schedule() which allows=20
to skip freezer during schedule and then clears skip and calls=20
try_to_freeze()

But we can't use wait_event_freezable() here as we need conditional freeze.


 =C2=A0=C2=A0=C2=A0 while (1) {
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 caps_inflight =3D chan->capture_reqs=
 - chan->sequence;
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if (frozen(chan->kthread_start_captu=
re) && !caps_inflight)
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 wait_event_freeza=
ble(chan->done_wait,
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 !list_empty(&chan->done) ||
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 kthread_should_stop());
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 else
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 wait_event_interr=
uptible(chan->done_wait,
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0!list_empty(&chan->done) ||
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0kthread_should_stop());

 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* dequeue buffers and finish captur=
e */

 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 ...

 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 ...


 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if (kthread_should_stop())
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 break;
 =C2=A0=C2=A0=C2=A0 }

