Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70F0819FFD7
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 23:03:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726676AbgDFVCY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 17:02:24 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:18516 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726303AbgDFVCX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 17:02:23 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e8b98780001>; Mon, 06 Apr 2020 14:00:40 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 06 Apr 2020 14:02:22 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 06 Apr 2020 14:02:22 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 6 Apr
 2020 21:02:22 +0000
Received: from [10.2.164.193] (172.20.13.39) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 6 Apr 2020
 21:02:20 +0000
Subject: Re: [RFC PATCH v6 6/9] media: tegra: Add Tegra210 Video input driver
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <helen.koike@collabora.com>
CC:     <sboyd@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
 <1585963507-12610-7-git-send-email-skomatineni@nvidia.com>
 <200bb96e-2d07-764f-9e14-55538dc742fd@gmail.com>
 <23bfab09-b464-6e51-9843-06d13000e9b9@nvidia.com>
 <be77b0ef-d605-8357-4180-f40b2886d07a@gmail.com>
 <08cd31d5-e8b9-4d3a-fb0e-0e4462947d96@nvidia.com>
 <12a834ac-52b1-6dc0-7d3a-3e6a1fa85a2a@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <e3712e7b-b335-b35b-a94f-24eb85122dca@nvidia.com>
Date:   Mon, 6 Apr 2020 14:02:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <12a834ac-52b1-6dc0-7d3a-3e6a1fa85a2a@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1586206840; bh=LQXwr464PKLkjQc2JsoYa1G97YL2u32MHMj5ekn3DUU=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=GFnoW0ZchKsXuQEVljP/q6rNBTeuZ8TFD7OPOXLXgF2TcIGeMngQG1a4AUrpCeMhT
         MOXkPVGm0YEFAm0e1r5Skb4h5D9840DKi37WZfZUW283MfRbTgBo+9QQvzfbC96LLx
         2BI75bFW44qcXx0A40n1wehEounnWLu2G5K5LGyeR9Cav39zkgSh+XlEEovhCyI4Vh
         qKHc+dLKhbUk2qcl2uhv3q6hgTRdPIb8uU5G5LYDiTv1dlGJ5zNGI17lMyFTF/A2Vf
         yBGlHcErTUa1H+xcOMPhFdahdeaNeAYWUF6jCB/4lJigKpCwaH9ceqTSR/2F7StgZ8
         I/OFZ19xF97iQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/6/20 1:56 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 06.04.2020 23:55, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 4/6/20 1:53 PM, Dmitry Osipenko wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> 06.04.2020 23:50, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> On 4/6/20 1:45 PM, Dmitry Osipenko wrote:
>>>>> External email: Use caution opening links or attachments
>>>>>
>>>>>
>>>>> 04.04.2020 04:25, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>>> +static int chan_capture_kthread_start(void *data)
>>>>>> +{
>>>>>> +     struct tegra_vi_channel *chan =3D data;
>>>>>> +     struct tegra_channel_buffer *buf;
>>>>>> +     int err =3D 0;
>>>>>> +     int caps_inflight;
>>>>>> +
>>>>>> +     set_freezable();
>>>>>> +
>>>>>> +     while (1) {
>>>>>> +             try_to_freeze();
>>>>>> +
>>>>>> +             wait_event_interruptible(chan->start_wait,
>>>>>> +                                      !list_empty(&chan->capture) |=
|
>>>>>> +                                      kthread_should_stop());
>>>>>> +             /*
>>>>>> +              * Frame start and MW_ACK_DONE syncpoint condition
>>>>>> FIFOs are
>>>>>> +              * of max depth 2. So make sure max 2 capture
>>>>>> requests are
>>>>>> +              * in process by the hardware at a time.
>>>>>> +              */
>>>>>> +             while (!(kthread_should_stop() ||
>>>>>> list_empty(&chan->capture))) {
>>>>>> +                     caps_inflight =3D chan->capture_reqs -
>>>>>> chan->sequence;
>>>>>> +                     /*
>>>>>> +                      * Source is not streaming if error is non-zer=
o.
>>>>>> +                      * So, do not dequeue buffers on capture error
>>>>>> or when
>>>>>> +                      * syncpoint requests in FIFO are full.
>>>>>> +                      */
>>>>>> +                     if (err || caps_inflight >=3D SYNCPT_FIFO_DEPT=
H)
>>>>>> +                             break;
>>>>> Am I understanding correctly that this thread will take 100% CPU,
>>>>> spinning here, if more than 2 frame-captures queued?
>>>> on more than 2 frames captures, it breaks thread and on next wakeup it
>>>> continues
>>> The wait_event() won't wait if condition is true.
>> condition is checked when waitqueue is woken up
> https://elixir.bootlin.com/linux/v5.6.2/source/include/linux/wait.h#L462

process is put to sleep until the condition evaluates to true or signal=20
is received.

condition is checked each time the waitqueue head is woken up.

Also capture list may keep on getting updated with buffers from userspace.

but at a time we only limit 2 frames as VI supports double buffering and=20
syncpt fifo's max depth is 2

Any more buffers waiting will be processing on subsequent iterations.

So basically thread run time is depending on buffers getting queued from=20
userspace.

