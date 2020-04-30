Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59D331C048E
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2020 20:19:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726509AbgD3STh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Apr 2020 14:19:37 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:8280 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726336AbgD3STh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Apr 2020 14:19:37 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5eab163d0000>; Thu, 30 Apr 2020 11:17:33 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 30 Apr 2020 11:19:37 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 30 Apr 2020 11:19:37 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 30 Apr
 2020 18:19:37 +0000
Received: from [10.2.165.152] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 30 Apr
 2020 18:19:35 +0000
Subject: Re: [RFC PATCH v11 6/9] media: tegra: Add Tegra210 Video input driver
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <helen.koike@collabora.com>
CC:     <sboyd@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1588197606-32124-1-git-send-email-skomatineni@nvidia.com>
 <1588197606-32124-7-git-send-email-skomatineni@nvidia.com>
 <bacc4308-4b95-f566-b80e-096ff96407b5@gmail.com>
 <4da289e6-036f-853b-beb4-379d6462adb0@gmail.com>
 <c6d54885-6f23-f60c-a17b-3481fc4d6adf@gmail.com>
 <b14b9dc5-7ac9-7735-d98d-eebc7e151cba@nvidia.com>
 <7d31d24f-f353-7e82-3ff9-cdba8b773d1e@nvidia.com>
 <06a4a067-8d54-4322-b2a6-14e82eaeda29@nvidia.com>
Message-ID: <47873bbd-cf90-4595-5a99-7e9113327ecc@nvidia.com>
Date:   Thu, 30 Apr 2020 11:18:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <06a4a067-8d54-4322-b2a6-14e82eaeda29@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1588270653; bh=ohRADXuDVSbfuKDemL6KlJp4gvc5xFXfIRWVd+qBixM=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=UIzTRbYXVHksNJe2IzQvFcLxdGJKeeB0UUtI8EJKq8drnM36u+15eSwIsxJcl1lXz
         0z/kJj40OEH6AtwGMs3z48FH096qMn3++VHTU2md0zUDeCkPrjSp6p2OS3yrlzFUCt
         LNskQ6+n3BWKn5xCyKCBjTaHxNWG11GbhrkuaM9PqaGppirx6Lp4sdFwG40+5PHbDM
         Yii6YWdsF6vPA1L0Ijf3TgAoLElFjK65+lT7TPHEuNnqrKGN0TjTy6M6hu37FV+FDH
         jgE4fSIMEYLyRHosvo33XU/RNoZtu52+mqgTdteyTushcfupuK1Yl/I7euGQUkiWa7
         UDifnOjDwwT6w==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/30/20 10:06 AM, Sowjanya Komatineni wrote:
>
> On 4/30/20 9:29 AM, Sowjanya Komatineni wrote:
>>
>> On 4/30/20 9:04 AM, Sowjanya Komatineni wrote:
>>>
>>> On 4/30/20 7:13 AM, Dmitry Osipenko wrote:
>>>> 30.04.2020 17:02, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>> 30.04.2020 16:56, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>>> 30.04.2020 01:00, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82=
:
>>>>>>> +static int chan_capture_kthread_finish(void *data)
>>>>>>> +{
>>>>>>> +=C2=A0=C2=A0=C2=A0 struct tegra_vi_channel *chan =3D data;
>>>>>>> +=C2=A0=C2=A0=C2=A0 struct tegra_channel_buffer *buf;
>>>>>>> +
>>>>>>> +=C2=A0=C2=A0=C2=A0 set_freezable();
>>>>>>> +
>>>>>>> +=C2=A0=C2=A0=C2=A0 while (1) {
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 try_to_freeze();
>>>>>> I guess it won't be great to freeze in the middle of a capture=20
>>>>>> process, so:
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (list_empty(&chan->don=
e))
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 t=
ry_to_freeze();
>>>>> And here should be some locking protection in order not race with the
>>>>> chan_capture_kthread_start because kthread_finish could freeze before
>>>>> kthread_start.
>>>> Or maybe both start / finish threads should simply be allowed to=20
>>>> freeze
>>>> only when both capture and done lists are empty.
>>>>
>>>> if (list_empty(&chan->capture) &&
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 list_empty(&chan->done))
>>>> =C2=A0=C2=A0=C2=A0=C2=A0try_to_freeze();
>>>
>>> good to freeze when not in middle of the frame capture but why=20
>>> should we not allow freeze in between captures?
>>>
>>> Other drivers do allow freeze in between frame captures.
>>>
>>> I guess we can freeze before dequeue for capture and in finish=20
>>> thread we can freeze after capture done. This also don't need to=20
>>> check for list_empty with freeze to allow between frame captures.
>>>
>> Also if we add check for both lists empty, freeze is not allowed as=20
>> long as streaming is going on and in case of continuous streaming=20
>> freeze will never happen.
>
To allow freeze b/w frames (but not in middle of a frame),

for capture_start thread, probably we can do unconditional try_to_freeze()

for capture_finish thread, at end of capture done we can do=20
try_to_freeze() only when done list is empty

> Hi Dmitry,
>
> Will update in v12 to not allow freeze in middle of a frame capture.
>
> Can you please confirm on above if you agree to allow freeze to happen=20
> in b/w frame captures?
>
> Also as most feedback has been received from you by now, appreciate if=20
> you can provide all in this v11 if you have anything else so we will=20
> not have any new changes after v12.
>
> Thanks
>
> Sowjanya
>
