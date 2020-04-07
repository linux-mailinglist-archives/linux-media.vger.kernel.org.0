Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC99E1A1733
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2020 23:08:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726622AbgDGVIl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Apr 2020 17:08:41 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:12001 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726426AbgDGVIl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Apr 2020 17:08:41 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e8ceba20002>; Tue, 07 Apr 2020 14:07:46 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 07 Apr 2020 14:08:39 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 07 Apr 2020 14:08:39 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 7 Apr
 2020 21:08:39 +0000
Received: from [10.2.171.175] (172.20.13.39) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 7 Apr 2020
 21:08:37 +0000
Subject: Re: [RFC PATCH v6 6/9] media: tegra: Add Tegra210 Video input driver
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
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
 <e3712e7b-b335-b35b-a94f-24eb85122dca@nvidia.com>
 <b1726d33-0d35-9323-a747-407148d0104e@gmail.com>
 <eb80178f-30f4-8f46-51cd-ea3f4914b81d@nvidia.com>
 <dd16c560-ba8f-e7df-5dc4-5227e0043196@nvidia.com>
 <fea4f0a1-4a20-34d4-9eda-e4a599eeeffc@nvidia.com>
 <760d071e-0cbc-b3eb-9231-fb9f9ecb44a6@nvidia.com>
 <9e317f65-8a02-3b15-cfec-8e0d8374130e@gmail.com>
 <97b35910-4c93-123a-43a0-eb14476ed0f3@nvidia.com>
Message-ID: <84ad4e2d-6ac1-e1f4-1c55-5edaae850631@nvidia.com>
Date:   Tue, 7 Apr 2020 14:08:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <97b35910-4c93-123a-43a0-eb14476ed0f3@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1586293666; bh=p0/DWg6pW/GsSUz9X/po1THsEzzlpWiq+7OgvqVf1NM=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=DSq+wk/V3vmE+OZKgrneo9QUGwCD2UhnoTfktGp0A8ZbgG8rvMFFD1PxmZ3QNra9x
         BpkKprgB69xcX2I6V087N4bEiXFF5pUZUvYVZsbDM3Fav0CS8kVt7Atz2Gd8es02Uj
         ymYRt1oWbK36galxrWt0IBJ4BjEP2a5tXdqzhi5sg+ZY71xVP6LtoLDYCObeTrZzf8
         4FbiznmIgevIsI0xYXLA1VHS6VzaceTCVkHhkyP1sDKbrlNH0Rq+v48FDhg2N8ibwP
         9j6sJ9T1wzbOzdwSYrRHsvfzzeNHO1tBE5SaAR2bRlyxlRtSTeHw7ZHp85fBRl3qw4
         yoOjVnObn7/5w==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/6/20 4:48 PM, Sowjanya Komatineni wrote:
>
> On 4/6/20 4:18 PM, Dmitry Osipenko wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> 07.04.2020 01:07, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> On 4/6/20 3:00 PM, Sowjanya Komatineni wrote:
>>>> On 4/6/20 2:39 PM, Sowjanya Komatineni wrote:
>>>>> On 4/6/20 2:15 PM, Sowjanya Komatineni wrote:
>>>>>> On 4/6/20 2:11 PM, Dmitry Osipenko wrote:
>>>>>>> External email: Use caution opening links or attachments
>>>>>>>
>>>>>>>
>>>>>>> 07.04.2020 00:02, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=
=82:
>>>>>>>>>>>>> Am I understanding correctly that this thread will take 100%
>>>>>>>>>>>>> CPU,
>>>>>>>>>>>>> spinning here, if more than 2 frame-captures queued?
>>>>>>>>>>>> on more than 2 frames captures, it breaks thread and on next
>>>>>>>>>>>> wakeup it
>>>>>>>>>>>> continues
>>>>>>>>>>> The wait_event() won't wait if condition is true.
>>>>>>>>>> condition is checked when waitqueue is woken up
>>>>>>>>> https://elixir.bootlin.com/linux/v5.6.2/source/include/linux/wait=
.h#L462=20
>>>>>>>>>
>>>>>>>>>
>>>>>>>> process is put to sleep until the condition evaluates to true or
>>>>>>>> signal
>>>>>>>> is received.
>>>>>>>>
>>>>>>>> condition is checked each time the waitqueue head is woken up.
>>>>>>> This is a wrong assumption in accordance to the code.
>>>> process is in sleep until the condition is evaluated and when
>>>> condition is true wakeup still happens only when wake_up on waitqueue
>>>> is called
>>>>
>>>> This is the reason for using this to prevent blocking while waiting
>>>> for the buffers.
>>> w.r.t capture list update, wakeup happens when wake_up on waitqueue is
>>> called.
>>>
>>> wakeup also happens on kthread stop signal event.
>>>
>>>>
>>>>>> when every buffer is available as long as we are in streaming, we
>>>>>> should process it.
>>>>>>
>>>>>> So if wake up happens when list has buffer, it will be processed but
>>>>>> at a time we limit processing 2 simultaneous buffer capture starts
>>>>>> only.
>>>>>>
>>>>> Fixing typo.
>>>>>
>>>>> I meant when ever buffer is available as long as we are in streaming,
>>>>> we should process it.
>>>>>
>>>>> So capture thread processes as long as buffers are available from
>>>>> user space limiting 2 simultaneous trigger of captures and thread
>>>>> will be in sleep when capture buffers list is empty or no stop thread
>>>>> is signaled.
>> IIUC, the waiting won't happen if more than 2 captures are queued and
>> thread will be spinning until captures are processed.
>>
>> I think you need a semaphore with resource count =3D 2.
> we hold on to issuing capture if more than 2 buffers are queued and it=20
> continues only after fifo has min 1 slot empty


Just want to close on this part of feedback. Hope above explanation is=20
clear regarding triggering/issuing at max 2 frame capture to VI HW and=20
also regarding capture threads where they use wait_event_interruptible=20
to prevent blocking waiting for buffers to be available for captures.

So no changes related to this part are needed in v7.

