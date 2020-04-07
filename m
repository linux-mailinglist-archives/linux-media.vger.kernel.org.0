Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 204081A18B2
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2020 01:38:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726527AbgDGXiL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Apr 2020 19:38:11 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:5899 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726512AbgDGXiL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Apr 2020 19:38:11 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e8d0e7c0000>; Tue, 07 Apr 2020 16:36:28 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 07 Apr 2020 16:38:10 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 07 Apr 2020 16:38:10 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 7 Apr
 2020 23:38:10 +0000
Received: from [10.2.171.175] (172.20.13.39) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 7 Apr 2020
 23:38:08 +0000
Subject: Re: [RFC PATCH v6 6/9] media: tegra: Add Tegra210 Video input driver
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <helen.koike@collabora.com>
CC:     <sboyd@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
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
 <84ad4e2d-6ac1-e1f4-1c55-5edaae850631@nvidia.com>
 <15a879b3-8fb9-6821-3cdc-104ba583ac12@gmail.com>
 <0c425505-347f-7418-af7e-d121fe0d06dc@nvidia.com>
 <db7c7051-5674-cdb9-0aa4-ee94125b3024@gmail.com>
 <1a31cd60-739f-0660-1c45-31487d2f2128@nvidia.com>
Message-ID: <603084a5-249a-4fe2-3646-e9335ef9ab43@nvidia.com>
Date:   Tue, 7 Apr 2020 16:38:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1a31cd60-739f-0660-1c45-31487d2f2128@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1586302588; bh=X8IJFWDnQAbnf1aSpLJmy4TiOpGQ753NFIkPWM15bII=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=G4QUu/SWOKZrVd9ZdM8wMOi4dimJpCxB55TLA8YWXoMwreB64M4HhIW8FjAQyXx4J
         YZzkqbDWP+nkEsL6W03TUKutts/HBpsJyLt1lxAsHRCgEvI1mTpUGpNf8nIwRjqACi
         9Cj2GejpW9ZmcWPZpFc09Al1qRRKcpJ6wfvGX8puwTywyZ+eWYVwSQNsxV/tJHBcJr
         HHzRZykCtlqUMhpH089DpBCia375rPeGkFB0cF0bQCVfBPcu2UBnE1ldAKIWDfUJwb
         1KGSlwap9yygrXYa0BORKSZa2cAbq0L2AY3/T0Foq0IfBibmIlJrG0Ja/a8KBVsPgX
         J7kx9aK/A09lQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/7/20 4:36 PM, Sowjanya Komatineni wrote:
>
> On 4/7/20 4:12 PM, Dmitry Osipenko wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> 08.04.2020 01:22, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> On 4/7/20 3:08 PM, Dmitry Osipenko wrote:
>>>> External email: Use caution opening links or attachments
>>>>
>>>>
>>>> 08.04.2020 00:08, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> ...
>>>>>>> I think you need a semaphore with resource count =3D 2.
>>>>>> we hold on to issuing capture if more than 2 buffers are queued=20
>>>>>> and it
>>>>>> continues only after fifo has min 1 slot empty
>>>>> Just want to close on this part of feedback. Hope above=20
>>>>> explanation is
>>>>> clear regarding triggering/issuing at max 2 frame capture to VI HW=20
>>>>> and
>>>>> also regarding capture threads where they use=20
>>>>> wait_event_interruptible
>>>>> to prevent blocking waiting for buffers to be available for captures.
>>>>>
>>>>> So no changes related to this part are needed in v7.
>>>> =C2=A0 From what I see in the code, you "hold on" by making kthread to=
=20
>>>> spin in
>>>> a busy-loop while caps_inflight >=3D SYNCPT_FIFO_DEPTH. So some change
>>>> should be needed to prevent this.
>>>>
>>>> The wait_event_interruptible seems should be okay.
>>> We don't want to prevent that as we already have buffers available for
>>> capture so as soon as VI HW issuing single shot is done and when min 1
>>> slot is empty we should continue with issuing for another capture.
>>>
>>> As long as buffers are available, we should continue to capture and
>>> should not hold
>>>
>> I suppose that taking a shot takes at least few milliseconds, which
>> should be unacceptable to waste.
> As long as buffers are in queue we have to keep processing each buffer=20
> and between buffers obviously we have to wait for previous frames to=20
> finish and this why we have separate thread for frame finish where we=20
> can have next buffer capture ready and issue while previous frame=20
> memory write happens
