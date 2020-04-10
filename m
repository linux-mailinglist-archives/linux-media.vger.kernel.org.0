Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65CCA1A4A10
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2020 20:59:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726703AbgDJS7N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Apr 2020 14:59:13 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:1886 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726582AbgDJS7M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Apr 2020 14:59:12 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e90c1f30000>; Fri, 10 Apr 2020 11:58:59 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 10 Apr 2020 11:59:12 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 10 Apr 2020 11:59:12 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 10 Apr
 2020 18:59:12 +0000
Received: from [10.2.171.241] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 10 Apr
 2020 18:59:10 +0000
Subject: Re: [RFC PATCH v6 6/9] media: tegra: Add Tegra210 Video input driver
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <helen.koike@collabora.com>
CC:     <sboyd@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
 <9e317f65-8a02-3b15-cfec-8e0d8374130e@gmail.com>
 <97b35910-4c93-123a-43a0-eb14476ed0f3@nvidia.com>
 <84ad4e2d-6ac1-e1f4-1c55-5edaae850631@nvidia.com>
 <15a879b3-8fb9-6821-3cdc-104ba583ac12@gmail.com>
 <0c425505-347f-7418-af7e-d121fe0d06dc@nvidia.com>
 <db7c7051-5674-cdb9-0aa4-ee94125b3024@gmail.com>
 <1a31cd60-739f-0660-1c45-31487d2f2128@nvidia.com>
 <603084a5-249a-4fe2-3646-e9335ef9ab43@nvidia.com>
 <7895b9c6-f27d-8939-73d7-67d785e1a8b7@nvidia.com>
 <ea60b489-990e-4b15-e215-d93381a1371e@nvidia.com>
 <b2405c2a-73c0-ad69-ccea-0388caf8045c@gmail.com>
 <15d8b525-67b5-b437-f7fd-89f80cd0d9f6@nvidia.com>
 <a638bb8e-bb50-7aa5-05a0-8de1c6207ba7@nvidia.com>
 <ced73258-6f4b-e970-4ca5-ecdf1808a4c3@nvidia.com>
 <ad646fde-2eed-eeeb-4d85-ec36d6613eb1@nvidia.com>
 <7288cacd-badc-cb01-1f4c-286dd024ca10@gmail.com>
 <77c88717-618f-b366-2b6a-f8b4abaa66cc@nvidia.com>
 <00708f34-cf45-e248-c6b0-c3d2286671ca@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <ab010164-e8ea-89e9-a7e9-d7213841fa90@nvidia.com>
Date:   Fri, 10 Apr 2020 11:59:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <00708f34-cf45-e248-c6b0-c3d2286671ca@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1586545139; bh=ZBW/PUHYOdwTpJyjsheKidgPJTMhxh/TzCO8TSSiZaA=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=RAMPMs2dSQ3C9rlqNgf5QwxdldGUg2vgtt0b6tWvWms2EZWw1T8HxAPd9zbUND9D0
         ozfTpaOQLJUY9v6l3hdIcdz09Fj9gFnUyJi64iz5c9RC1Du/8oLCzdBUAzVZ+AgQnl
         KDE8JGetO1D4czpdTvUiu6f4BEIfh1PqqvfDsdVOrusmaI8R2JJ0/rPvSG+5P7aPNj
         KxxMYkzOZgNaTT86APbzsQ0no8h4mSISzmykM0Q8aTnKoHhNG3JDVlFe0hE7A1Sy+p
         FylfWXg7hcrlNpA+tWYjlefekzhIEFrQHQXMozcM4pUFwaM3ZTT3kVBXLMl8kLh3bI
         FY4TvYl0nLxEw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/10/20 11:47 AM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 09.04.2020 21:28, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 4/9/20 7:50 AM, Dmitry Osipenko wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> 09.04.2020 06:38, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> ...
>>>> Tested with 3 buffers and by checking outstanding buffers in process b=
y
>>>> VI hw and holding to start capture till one outstanding buffer in
>>>> process by HW.
>>>> Also tested with 2 buffers without checking for outstanding buffers.
>>>>
>>>> In both cases, I see same %CPU for the kthreads and is < 1%
>>>>
>>> I don't see where buffers queue max limit is set to 3 in the code, but
>>> should be okay if CPU isn't getting hogged. Looking forward to v7.
>> Sorry, correction I meant to say pre-queued buffers before streaming not
>> num_buffers.
>> vb2 queue min_buffers_needed was set to 3 as part of one of the issue
>> debug in earlier version which actually was irrelevant to that issue and
>> should have been removed. Will remove min_buffers_needed in v7.
>>
>> I added checking for outstanding requests by hardware just to be safer
>> although we may not hit this case of issuing more than 1 outstanding
>> frame capture to VI hardware as capture_frame() waits till it sees frame
>> start event through HW syncpt increment before proceeding for memory
>> write and issuing next frame capture.
>>
>> So issuing frame captures are synchronized with frame start and frame en=
d.
>>
>> Will remove min_buffers_needed and also explicit check for outstanding
>> buffers in v7.
> It's still not clear to me how the "pre-queued buffers" will be limited.
> I'll take another look at the v7.

OK, but I don't understand what you mean by limit on pre-queued buffers.

I was saying vb2 queue has min_buffers_needed which was set to 3 where=20
streaming will start only after 3 buffers got queued up.

Regarding outstanding condition check to make sure no more than 2 syncpt=20
trigger requests are in FIFO I added it to be safe where mostly we may=20
not hit and also I only see capture start thread holding for it during=20
initial frame capture as it issues single shot for 1st 2 buffers capture=20
and holds 3 buffers which is already queued till at least one of those 2=20
issued capture is done to make sure of not triggering syncpt condition=20
when fifo already has 2 pending.

In v7, will remove setting min_buffers_needed and also outstanding=20
syncpt trigger check.
