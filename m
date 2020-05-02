Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 780E01C27F8
	for <lists+linux-media@lfdr.de>; Sat,  2 May 2020 21:15:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728473AbgEBTPc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 May 2020 15:15:32 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:2759 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728459AbgEBTPb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 2 May 2020 15:15:31 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5eadc6c60000>; Sat, 02 May 2020 12:15:18 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Sat, 02 May 2020 12:15:30 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Sat, 02 May 2020 12:15:30 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 2 May
 2020 19:15:30 +0000
Received: from [10.2.165.119] (172.20.13.39) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 2 May 2020
 19:15:29 +0000
Subject: Re: [RFC PATCH v11 6/9] media: tegra: Add Tegra210 Video input driver
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <helen.koike@collabora.com>
CC:     <sboyd@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1588197606-32124-1-git-send-email-skomatineni@nvidia.com>
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
 <1767e50f-efb7-5e89-22f6-0917821b660d@nvidia.com>
 <235a4cd4-4d4a-04b8-6c65-43a4dba48a0b@nvidia.com>
 <f8103170-7879-8597-3e3c-da9a3b6a40b3@nvidia.com>
 <5d847770-dad9-8f18-67b5-c1ba79084957@nvidia.com>
 <605fc688-7712-cdfd-9d12-5741b984bb68@nvidia.com>
Message-ID: <4022a7a7-2ea0-dc1d-4dbc-29985ca3f315@nvidia.com>
Date:   Sat, 2 May 2020 12:14:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <605fc688-7712-cdfd-9d12-5741b984bb68@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1588446918; bh=6QMensao6Koqw72YIeCXIWAtbzQE5Vm+JRUDIGqB/s4=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=HFXsrD9+R5JCf2YfBrhbuILdK8xp/TyqBzyEFtIsp0sl+fN73aOqF2yKfmiT/NZHk
         wmrXUL4imj5APs6LGbHefqGMmI5jUNzFY/y3Wc3pPX8cBmYcyPpoJjnt+CfAeYE+Nq
         v0+Xgpc3D+Drf+1usjsJW/xnUAMK72nJdiC7YJ/NzzJRvu2xQCa6p7XbCPoSmZAxVV
         gzY7PhIXWx2H+ab/CkAuyyalt2/TUOiKj/xEjZ34qKnjT1rurSqtzfq7H2NTML4ACz
         gAAIVjsJ16hwO1yKskf4scxUBXig41OhEeondbEY7Tsm7u2U26UReI0f5cLmuCHxnD
         dRvQjA98c9Hjg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 5/2/20 10:04 AM, Sowjanya Komatineni wrote:
>
> On 5/2/20 9:55 AM, Sowjanya Komatineni wrote:
>>
>> On 5/2/20 9:14 AM, Sowjanya Komatineni wrote:
>>>
>>> On 5/2/20 9:03 AM, Sowjanya Komatineni wrote:
>>>>
>>>> On 5/2/20 8:38 AM, Sowjanya Komatineni wrote:
>>>>>
>>>>> On 5/2/20 8:16 AM, Dmitry Osipenko wrote:
>>>>>> 02.05.2020 06:55, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82=
:
>>>>>>> On 5/1/20 8:39 PM, Sowjanya Komatineni wrote:
>>>>>>>>
>>>>>>>> On 5/1/20 2:05 PM, Sowjanya Komatineni wrote:
>>>>>>>>>
>>>>>>>>> On 5/1/20 1:58 PM, Sowjanya Komatineni wrote:
>>>>>>>>>>
>>>>>>>>>> On 5/1/20 1:44 PM, Sowjanya Komatineni wrote:
>>>>>>>>>>>
>>>>>>>>>>> On 5/1/20 11:03 AM, Sowjanya Komatineni wrote:
>>>>>>>>>>>>
>>>>>>>>>>>> On 4/30/20 4:33 PM, Sowjanya Komatineni wrote:
>>>>>>>>>>>>>
>>>>>>>>>>>>> On 4/30/20 4:14 PM, Sowjanya Komatineni wrote:
>>>>>>>>>>>>>>>>>>>> And in this case synchronization between start/finish
>>>>>>>>>>>>>>>>>>>> threads should be
>>>>>>>>>>>>>>>>>>>> needed in regards to freezing.
>>>>>>>>>>>>>>>>>>> Was thinking to have counter to track outstanding frame
>>>>>>>>>>>>>>>>>>> w.r.t single shot issue b/w start and finish and=20
>>>>>>>>>>>>>>>>>>> allow to
>>>>>>>>>>>>>>>>>>> freeze only when no outstanding frames in process.
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>> This will make sure freeze will not happen when any=20
>>>>>>>>>>>>>>>>>>> buffers
>>>>>>>>>>>>>>>>>>> are in progress
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>> Note that this could be a wrong assumption, I'm not
>>>>>>>>>>>>>>>>>>>> closely familiar
>>>>>>>>>>>>>>>>>>>> with how freezer works.
>>>>>>>>>>>>>>>>>> kthread_start can unconditionally allow try_to_freeze=20
>>>>>>>>>>>>>>>>>> before
>>>>>>>>>>>>>>>>>> start of frame capture
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> We can compute captures inflight w.r.t single shot=20
>>>>>>>>>>>>>>>>>> issued
>>>>>>>>>>>>>>>>>> during capture start and finished frames by=20
>>>>>>>>>>>>>>>>>> kthread_finish
>>>>>>>>>>>>>>>>>> and allow kthread_finish to freeze only when captures
>>>>>>>>>>>>>>>>>> inflight is 0.
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> This allows freeze to happen b/w frames but not in=20
>>>>>>>>>>>>>>>>>> middle of
>>>>>>>>>>>>>>>>>> frame
>>>>>>>>>>>>>>> will have caps inflight check in v12 to allow freeze finish
>>>>>>>>>>>>>>> thread only when no captures are in progress
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> try_to_freeze() returns thread frozen state and looks=20
>>>>>>>>>>>>>> like we
>>>>>>>>>>>>>> can use this in kthread finish to allow finish thread to=20
>>>>>>>>>>>>>> freeze
>>>>>>>>>>>>>> only when kthread_start is already frozen and no buffers in
>>>>>>>>>>>>>> progress/initiated for capture.
>>>>>>>>>>>>>>
>>>>>>>>>>>>> chan->capture_frozen holds frozen state returned from
>>>>>>>>>>>>> try_to_freeze() in start kthread
>>>>>>>>>>>>>
>>>>>>>>>>>>> chan->capture_reqs increments after every single shot issued.
>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>> static int chan_capture_kthread_finish(void *data)
>>>>>>>>>>>>>
>>>>>>>>>>>>> {
>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 struct tegra_vi_channel *chan =3D da=
ta;
>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 struct tegra_channel_buffer *buf;
>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 int caps_inflight;
>>>>>>>>>>>>>
>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 set_freezable();
>>>>>>>>>>>>>
>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 while (1) {
>>>>>>>>>>>>> wait_event_interruptible(chan->done_wait,
>>>>>>>>>>>>> =C2=A0!list_empty(&chan->done) ||
>>>>>>>>>>>>> =C2=A0kthread_should_stop());
>>>>>>>>>>>>>
>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* dequeue buffer=
s and finish capture */
>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 buf =3D dequeue_b=
uf_done(chan);
>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 while (buf) {
>>>>>>>>>>>>> tegra_channel_capture_done(chan, buf);
>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 buf =3D dequeue_buf_done(chan);
>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 }
>>>>>>>>>>>>>
>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if (kthread_shoul=
d_stop())
>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 break;
>>>>>>>>>>>>>
>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 caps_inflight =3D=
 chan->capture_reqs - chan->sequence;
>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if (chan->capture=
_frozen && !caps_inflight)
>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 try_to_freeze();
>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>>>>>>>>>
>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>>>>>>>>>>> }
>>>>>>>>>>>>
>>>>>>>>>>>> Freezing happens prior to suspend() during suspend entry=20
>>>>>>>>>>>> and when
>>>>>>>>>>>> we implement suspend/resume during suspend we stop=20
>>>>>>>>>>>> streaming where
>>>>>>>>>>>> we stop threads anyway.
>>>>>>>>>>>>
>>>>>>>>>>>> So, was thinking why we need these threads freezable here?
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>> Hi Dmitry,
>>>>>>>>>>>
>>>>>>>>>>> Did some testing and below are latest observation and fix I=20
>>>>>>>>>>> tested.
>>>>>>>>>>>
>>>>>>>>>>> wait_event_interruptible() uses schedule() which blocks the=20
>>>>>>>>>>> freezer.
>>>>>>>>>>> When I do suspend while keeping streaming active in=20
>>>>>>>>>>> background, I
>>>>>>>>>>> see freezing of these threads fail and call trace shows=20
>>>>>>>>>>> __schedule
>>>>>>>>>>> -> __switch_to from these kthreads.
>>>>>>>>>>>
>>>>>>>>>>> wait_event_freezable() uses freezable_schedule() which=20
>>>>>>>>>>> should not
>>>>>>>>>>> block the freezer but we can't use this here as we need=20
>>>>>>>>>>> conditional
>>>>>>>>>>> try_to_freeze().
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> So, doing below sequence works where we set PF_FREEZER_SKIP=20
>>>>>>>>>>> flag
>>>>>>>>>>> thru freezer_not_count() before wait_event which calls=20
>>>>>>>>>>> schedule()
>>>>>>>>>>> and remove PF_FREEZER_SKIP after schedule allows=20
>>>>>>>>>>> try_to_freeze to
>>>>>>>>>>> work and also conditional try_to_freeze below prevents freezing
>>>>>>>>>>> thread in middle of capture.
>>>>>>>>>>>
>>>>>>>>>>> while (1) {
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 freezer_not_count()
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 wait_event_interruptible()
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 freezer_count()
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 ...
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 ...
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 if (chan->capture_frozen && !caps_infl=
ight)
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 try_to_freeze()
>>>>>>>>>>> }
>>>>>>>>>>>
>>>>>>>>>>> Please comment if you agree with above sequence. Will=20
>>>>>>>>>>> include this
>>>>>>>>>>> in v12.
>>>>>>>>>>>
>>>>>>>>> sorry, freezer_count() does try_to_freeze after clearing skip=20
>>>>>>>>> flag.
>>>>>>>>> So, dont think we can use this as we need conditional=20
>>>>>>>>> try_to_freeze.
>>>>>>>>> Please ignore above sequence.
>>>>>>>>>> Or probably we can take closer look on this later when we add
>>>>>>>>>> suspend/resume support as it need more testing as well.
>>>>>>>>>>
>>>>>>>>>> As this is initial series which has TPG only I think we=20
>>>>>>>>>> shouldn't
>>>>>>>>>> get blocked on this now. Series-2 and 3 will be for sensor=20
>>>>>>>>>> support
>>>>>>>>>> and on next series when we add suspend/resume will look into=20
>>>>>>>>>> this.
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>> When freeze activity starts and in case if finish thread=20
>>>>>>>> freezes prior
>>>>>>>> to start thread issuing capture, its the VI hardware writes=20
>>>>>>>> data to
>>>>>>>> the allocated buffer address.
>>>>>>>>
>>>>>>>> finish thread just checks for the event from the hardware and=20
>>>>>>>> we don't
>>>>>>>> handle/process directly on memory in this driver.
>>>>>>>>
>>>>>>>> So even we freeze done thread when single shot is issued frame=20
>>>>>>>> buffer
>>>>>>>> gets updated.
>>>>>>>>
>>>>>>>> In case if capture thread is frozen there will not buffers=20
>>>>>>>> queued to
>>>>>>>> process by finish thread. So, this will not be an issue.
>>>>>>>>
>>>>>>>> So, probably we don't need to do conditional try_to_freeze and=20
>>>>>>>> what we
>>>>>>>> have should work good in this corner case.
>>>>>>>>
>>>>>>> I still need to change wait_event_interruptible() to
>>>>>>> wait_event_freezable() but no need to synchronize finish thread=20
>>>>>>> freeze
>>>>>>> with start thread as even on issuing capture start its vi=20
>>>>>>> hardware that
>>>>>>> does frame buffer update and finish thread just checks for=20
>>>>>>> mw_ack event
>>>>>>> and returns buffer to application.
>>>>>> The problem we are primarily trying to avoid is to have=20
>>>>>> suspending being
>>>>>> done in the middle of IO.
>>>>>>
>>>>>> IIUC, even if system will be suspended in the middle of VI IO, it=20
>>>>>> won't
>>>>>> be fatal. In worst case the buffer capture should fail on resume=20
>>>>>> from
>>>>>> suspend. Could you please try to simulate this potential issue=20
>>>>>> and see
>>>>>> what result will be on suspending in the middle of VI IO?
>>>>>>
>>>>>> We don't want to suspend system / stop streaming in the middle of=20
>>>>>> IO, so
>>>>>> this problem of a proper threads tear-down still exists. It should
>>>>>> become easier to resolve the problem in a case of a proper=20
>>>>>> suspending
>>>>>> callback because the "start" thread could be turned down at any=20
>>>>>> time, so
>>>>>> it should be easier to maintain a proper tear-down order when=20
>>>>>> threads
>>>>>> are fully controlled by the driver, i.e. the "start" thread goes=20
>>>>>> down
>>>>>> first and the "finish" is second, blocking until the capture is=20
>>>>>> completed.
>>>>
>>>> I don't see issue of tear-down threads in case of suspend as we do=20
>>>> stop streaming where thread stop happens on both threads and are=20
>>>> stopped only after processing all outstanding buffers.
>>>>
>>>> Regarding freezing activity during suspend, If done thread freezes=20
>>>> prior to processing buffers for finish, vi hardware is still active=20
>>>> by this time which will update the frame buffer for initiated=20
>>>> capture. Driver is not directly involved in this frame buffer update.
>>>>
>>>> Finish thread only checks for completion to return buffers back to=20
>>>> the application when done.
>>>
>>> when done thread freeze happens after start thread initiated=20
>>> capture, vi hardware continues to update frame buffer for ongoing=20
>>> capture till it hits driver suspend callback. Yes worst case this=20
>>> frame data may not be valid data if invoking of this driver suspend=20
>>> happens immediate after this thread freeze during system suspend.
>>>
>>> But driver will still hold buffers to return which will be returned=20
>>> back on resume when threads are out from frozen state.
>>
>>
>> Also stop stream ioctl request happens during suspend where both=20
>> threads will be stopped properly. done thread stop happens only after=20
>> finishing all outstanding buffers.
>>
>> Stop stream request happens from streaming applications so even=20
>> without driver suspend/resume implementation currently, streaming=20
>> will be stopped prior to system=C2=A0 suspend where both threads will be=
=20
>> stopped properly (after finishing out standing buffers) and will be=20
>> resumed by application on system resume
>>
>> Also tested suspending while streaming with this unconditional=20
>> freeze, I don't see any issue as application stops stream where=20
>> v4l_streamoff gets executed during suspend and on resume streaming=20
>> starts where v4l_streamon happens.
>>
>> So, I don't see any issue with existing implementation of=20
>> unconditional freeze.
>
> To be more clear,
>
> suspend while streaming use case...
>
> - start thread initiating capture
> - done thread frozen (with outstanding buffers in process but vi=20
> hardware still continues to update frame buffer)
> - start thread frozen
>
> application holding video device will issue stream off ioctl
> - stop_streaming does kthread_stop
>
> - threads wake up and start thread breaks and finish thread breaks=20
> after checking outstanding buffers and returning to application
>
> - vi/csi power/clocks off
>
>
> on resume, application starts streaming again where fresh start stream=20
> happens.
>
>>
>>>
>>>>
>>>>
>>>>>> I think yours suggestion about dropping the freezing from the=20
>>>>>> threads
>>>>>> for now and returning back to it later on (once a proper=20
>>>>>> suspend/resume
>>>>>> support will be added) sounds reasonable.
>>>>>>
>>>>>> But if you'd want to keep the freezing, then the easy solution=20
>>>>>> could be
>>>>>> like that:
>>>>>>
>>>>>> =C2=A0=C2=A0 1. "start" thread could freeze at any time
>>>>>> =C2=A0=C2=A0 2. "finish" thread could freeze only when the "start" t=
hread=20
>>>>>> is frozen
>>>>>> and capture isn't in-progress. Use frozen(kthread_start_capture) to
>>>>>> check the freezing state.
>>>>>>
>>>>>> https://elixir.bootlin.com/linux/v5.7-rc3/source/include/linux/freez=
er.h#L25=20
>>>>>>
>>>>>
>>>>> That's exactly what I tried, below is the snippet.
>>>>>
>>>>> But as mentioned I am seeing freezing fail when I=20
>>>>> wait_event_interruptible() in either of the threads.
>>>>>
>>>>> =C2=A0=C2=A0 60.368709] Call trace:
>>>>> [=C2=A0=C2=A0 60.371216] __switch_to+0xec/0x140
>>>>> [=C2=A0=C2=A0 60.374768] __schedule+0x32c/0x668
>>>>> [=C2=A0=C2=A0 60.378315] schedule+0x78/0x118
>>>>> [=C2=A0=C2=A0 60.381606]=C2=A0 chan_capture_kthread_finish+0x244/0x2a=
0 [tegra_video]
>>>>> [=C2=A0=C2=A0 60.387865] kthread+0x124/0x150
>>>>> [=C2=A0=C2=A0 60.391150] ret_from_fork+0x10/0x1c
>>>>>
>>>>> wait_event_interruptible() API uses schedule() which blocks=20
>>>>> freezer while wait_event_freezable APIs uses freezable_schedule()=20
>>>>> which allows to skip freezer during schedule and then clears skip=20
>>>>> and calls try_to_freeze()
>>>>>
>>>>> But we can't use wait_event_freezable() here as we need=20
>>>>> conditional freeze.
>>>>>
>>>>>
>>>>> =C2=A0=C2=A0=C2=A0 while (1) {
>>>>> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 caps_inflight =3D chan->capture=
_reqs - chan->sequence;
>>>>> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if (frozen(chan->kthread_start_=
capture) && !caps_inflight)
>>>>> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 wait_event_f=
reezable(chan->done_wait,
>>>>> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 !list_empty(&chan->done)=
 ||
>>>>> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 kthread_should_stop());
>>>>> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 else
>>>>> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 wait_event_i=
nterruptible(chan->done_wait,
>>>>> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0!list_empty(&chan->done)=
 ||
>>>>> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0kthread_should_stop());
>>>>>
>>>>> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* dequeue buffers and finish c=
apture */
>>>>>
>>>>> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 ...
>>>>>
>>>>> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 ...
>>>>>
>>>>>
>>>>> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if (kthread_should_stop())
>>>>> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 break;
>>>>> =C2=A0=C2=A0=C2=A0 }
>>>>>
>>
Below works if I skip freezer during wait_event_interruptible as we=20
can't use wait_event_freezable when we need conditional try_to_freeze()

But I am not sure if this is allowed to do this explicit PF_FREEZER_SKIP=20
clear.

Also, as explained above I don't even think we need conditional=20
try_to_freeze() as v4l2 ioctl stream off gets called during closing of=20
device node when suspend happens and before stopping threads outstanding=20
buffers are returned properly. So, I don't see any issue with=20
unconditional try_to_freeze()

 =C2=A0=C2=A0=C2=A0 while (1) {

 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* allow to freeze only when no capt=
ures in progress */
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 caps_inflight =3D chan->capture_reqs=
 - chan->sequence;
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if (frozen(chan->kthread_start_captu=
re) && !caps_inflight) {
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 wait_event_freeza=
ble(chan->done_wait,
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 !list_empty(&chan->done) ||
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 kthread_should_stop());
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 } else {
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /*
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0* Skip free=
ze during wait_event_interruptible as
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0* schedule(=
) blocks freezer.
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0*/
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if (freezing(curr=
ent))
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 freezer_do_not_count();

 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 wait_event_interr=
uptible(chan->done_wait,
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0!list_empty(&chan->done) ||
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0kthread_should_stop());
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if (freezing(curr=
ent))
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 current->flags &=3D ~PF_FREEZER_SKIP;
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 }

 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* dequeue buffers and finish captur=
e */

 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 ...

 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 ...


 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if (kthread_should_stop())
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 break;
 =C2=A0=C2=A0=C2=A0 }

