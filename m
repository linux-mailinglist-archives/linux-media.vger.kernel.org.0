Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AE821A17E9
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2020 00:22:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726494AbgDGWWK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Apr 2020 18:22:10 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:13202 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726438AbgDGWWJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Apr 2020 18:22:09 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e8cfca90000>; Tue, 07 Apr 2020 15:20:25 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 07 Apr 2020 15:22:08 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 07 Apr 2020 15:22:08 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 7 Apr
 2020 22:22:07 +0000
Received: from [10.2.171.175] (172.20.13.39) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 7 Apr 2020
 22:22:06 +0000
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
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <0c425505-347f-7418-af7e-d121fe0d06dc@nvidia.com>
Date:   Tue, 7 Apr 2020 15:22:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <15a879b3-8fb9-6821-3cdc-104ba583ac12@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1586298025; bh=affO1Yr/fVkdDgXtDFDw59Iv7waWtClGoqGLbuDmMvA=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=gQN4aVBFGHGfJTH4B+1M5e3V40VRWaNWZ/4VYh6O83zGBgCCkEPn7tt+e+40JAfW1
         LyY6THdOiL1ww8uD/iOy8wzG4YyNEoYiepsyeHS3cPFJrvmG/hk0wWHEJQKrfU/xVY
         kKlhkNye6bffxcrrQFV3xQ/bIdjKoo5BG4CTP/CirNy9gMgdx2lpwob70+O9RBk5hF
         xHrfDGeBjgLLWYilKcS3QWfJ8gALhtXkFruZyu+210ZEkZAmfQZtORygckCHc6fPx9
         IaCUaNMPEmyknNUyPY8tn3H/mHhuj1EgBiYlZ56GJn7NlTw5AZ8i+xuen6mBQ/1c7e
         EFZIAi3TcTWcw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/7/20 3:08 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 08.04.2020 00:08, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
>>>> I think you need a semaphore with resource count =3D 2.
>>> we hold on to issuing capture if more than 2 buffers are queued and it
>>> continues only after fifo has min 1 slot empty
>>
>> Just want to close on this part of feedback. Hope above explanation is
>> clear regarding triggering/issuing at max 2 frame capture to VI HW and
>> also regarding capture threads where they use wait_event_interruptible
>> to prevent blocking waiting for buffers to be available for captures.
>>
>> So no changes related to this part are needed in v7.
>  From what I see in the code, you "hold on" by making kthread to spin in
> a busy-loop while caps_inflight >=3D SYNCPT_FIFO_DEPTH. So some change
> should be needed to prevent this.
>
> The wait_event_interruptible seems should be okay.

We don't want to prevent that as we already have buffers available for=20
capture so as soon as VI HW issuing single shot is done and when min 1=20
slot is empty we should continue with issuing for another capture.

As long as buffers are available, we should continue to capture and=20
should not hold

