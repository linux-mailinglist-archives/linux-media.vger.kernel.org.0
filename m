Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43F6F1A1905
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2020 02:00:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbgDHAAq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Apr 2020 20:00:46 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:1025 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726406AbgDHAAq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Apr 2020 20:00:46 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e8d14200000>; Tue, 07 Apr 2020 17:00:32 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 07 Apr 2020 17:00:45 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 07 Apr 2020 17:00:45 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 8 Apr
 2020 00:00:44 +0000
Received: from [10.2.171.241] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 8 Apr 2020
 00:00:43 +0000
Subject: Re: [RFC PATCH v6 6/9] media: tegra: Add Tegra210 Video input driver
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <helen.koike@collabora.com>
CC:     <sboyd@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
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
 <84ad4e2d-6ac1-e1f4-1c55-5edaae850631@nvidia.com>
 <15a879b3-8fb9-6821-3cdc-104ba583ac12@gmail.com>
 <0c425505-347f-7418-af7e-d121fe0d06dc@nvidia.com>
 <db7c7051-5674-cdb9-0aa4-ee94125b3024@gmail.com>
 <1a31cd60-739f-0660-1c45-31487d2f2128@nvidia.com>
 <603084a5-249a-4fe2-3646-e9335ef9ab43@nvidia.com>
 <7895b9c6-f27d-8939-73d7-67d785e1a8b7@nvidia.com>
Message-ID: <ea60b489-990e-4b15-e215-d93381a1371e@nvidia.com>
Date:   Tue, 7 Apr 2020 17:00:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <7895b9c6-f27d-8939-73d7-67d785e1a8b7@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1586304032; bh=FSo44cZwUySuOimxsjMypd59TtiRcxs9yvJGq9wJ31U=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=eWO+inumv2c6wIMCFx9NG/PtbLJuwiteq8xjriDMNhpbO6r/tQK3XTUz71u9R+vsC
         Nj6NxYmpWlj3xzm+waTTG6jufCyNKXoGc/7AkPJsCzyPVfNJfydpdBOfxaC4TCu38Q
         ceEkIuC777ldHLwG2m/Sczo9EhnoyZrLAzK4+dr1IVc+AZ3b543Ijhfm1EvCBVyMik
         moOsZpCzqRTf3tZsqx7LWSm4dz84esu2nxvj0PAe+g+kktIP7k7GjMt7Ey5udZF9EP
         ckihbT8KTNIWzxEIeARv/u4sy5mYbwDbYBABEeK6mFVawHBY6GPZSWUftA/44B7NL8
         rKqwB094rGP4A==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/7/20 4:59 PM, Sowjanya Komatineni wrote:
>
> On 4/7/20 4:38 PM, Sowjanya Komatineni wrote:
>>
>> On 4/7/20 4:36 PM, Sowjanya Komatineni wrote:
>>>
>>> On 4/7/20 4:12 PM, Dmitry Osipenko wrote:
>>>> External email: Use caution opening links or attachments
>>>>
>>>>
>>>> 08.04.2020 01:22, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>> On 4/7/20 3:08 PM, Dmitry Osipenko wrote:
>>>>>> External email: Use caution opening links or attachments
>>>>>>
>>>>>>
>>>>>> 08.04.2020 00:08, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82=
:
>>>>>> ...
>>>>>>>>> I think you need a semaphore with resource count =3D 2.
>>>>>>>> we hold on to issuing capture if more than 2 buffers are queued=20
>>>>>>>> and it
>>>>>>>> continues only after fifo has min 1 slot empty
>>>>>>> Just want to close on this part of feedback. Hope above=20
>>>>>>> explanation is
>>>>>>> clear regarding triggering/issuing at max 2 frame capture to VI=20
>>>>>>> HW and
>>>>>>> also regarding capture threads where they use=20
>>>>>>> wait_event_interruptible
>>>>>>> to prevent blocking waiting for buffers to be available for=20
>>>>>>> captures.
>>>>>>>
>>>>>>> So no changes related to this part are needed in v7.
>>>>>> =C2=A0 From what I see in the code, you "hold on" by making kthread =
to=20
>>>>>> spin in
>>>>>> a busy-loop while caps_inflight >=3D SYNCPT_FIFO_DEPTH. So some chan=
ge
>>>>>> should be needed to prevent this.
>>>>>>
>>>>>> The wait_event_interruptible seems should be okay.
>>>>> We don't want to prevent that as we already have buffers available=20
>>>>> for
>>>>> capture so as soon as VI HW issuing single shot is done and when=20
>>>>> min 1
>>>>> slot is empty we should continue with issuing for another capture.
>>>>>
>>>>> As long as buffers are available, we should continue to capture and
>>>>> should not hold
>>>>>
>>>> I suppose that taking a shot takes at least few milliseconds, which
>>>> should be unacceptable to waste.
>>> As long as buffers are in queue we have to keep processing each=20
>>> buffer and between buffers obviously we have to wait for previous=20
>>> frames to finish and this why we have separate thread for frame=20
>>> finish where we can have next buffer capture ready and issue while=20
>>> previous frame memory write happens
> Also we specified numbers buffers as 3 to vb2 queue. So this is rare=20
> case but to prevent issuing more than 2 at a time as VI HW is only=20
> double buffered and syncpt fifo max depth is 2 added this to be safer.

To be more clear, when more buffers are enqueued from userspace always=20
capture list will be full and thread will be busy in capture till either=20
error or stop stream request happens.

