Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9828A1A0089
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2020 00:00:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726277AbgDFWAr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 18:00:47 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:11924 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbgDFWAr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 18:00:47 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e8ba6280000>; Mon, 06 Apr 2020 14:59:04 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 06 Apr 2020 15:00:46 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 06 Apr 2020 15:00:46 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 6 Apr
 2020 22:00:45 +0000
Received: from [10.2.164.193] (172.20.13.39) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 6 Apr 2020
 22:00:44 +0000
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
Message-ID: <fea4f0a1-4a20-34d4-9eda-e4a599eeeffc@nvidia.com>
Date:   Mon, 6 Apr 2020 15:00:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <dd16c560-ba8f-e7df-5dc4-5227e0043196@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1586210344; bh=q7GFnHqZjAtzTcVPeHp4RlPWhzeFozGIhEb3Mm0HjqM=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=QOAyP0PrWhtADDdqD4e3AsyTO8sFWG6Pb1/DQaH0lLQPwAmoEUhFhun0bpPT8h8KN
         /tWMGyNwBY719AQa/vPoyUpVFCjsGHVMr1sK9oSO8FE5R82fEH9p/c89f55dzLqn5H
         4T0kXuD4Tdil2bKlbZjMreEcvBFpGGS3jegRaAO1MkSZjW7nFWHoklQmHbEJKOovf8
         c6RfTptGMNgtv+yt03yBmAJvHXQ8qnqSfSSoaWfqI4j0CT7eZL6cWT342h6vRVQ+/t
         elGVor36c051hh0ZdSXC/1DNSM/N/iUzGq+eyP+moWYt7IQexOtoJjORiz30vFahGg
         DrKTLCR3LYN0w==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/6/20 2:39 PM, Sowjanya Komatineni wrote:
>
> On 4/6/20 2:15 PM, Sowjanya Komatineni wrote:
>>
>> On 4/6/20 2:11 PM, Dmitry Osipenko wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> 07.04.2020 00:02, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>>>>>> Am I understanding correctly that this thread will take 100% CPU,
>>>>>>>>> spinning here, if more than 2 frame-captures queued?
>>>>>>>> on more than 2 frames captures, it breaks thread and on next=20
>>>>>>>> wakeup it
>>>>>>>> continues
>>>>>>> The wait_event() won't wait if condition is true.
>>>>>> condition is checked when waitqueue is woken up
>>>>> https://elixir.bootlin.com/linux/v5.6.2/source/include/linux/wait.h#L=
462=20
>>>>>
>>>> process is put to sleep until the condition evaluates to true or=20
>>>> signal
>>>> is received.
>>>>
>>>> condition is checked each time the waitqueue head is woken up.
>>> This is a wrong assumption in accordance to the code.

process is in sleep until the condition is evaluated and when condition=20
is true wakeup still happens only when wake_up on waitqueue is called

This is the reason for using this to prevent blocking while waiting for=20
the buffers.

>>
>> when every buffer is available as long as we are in streaming, we=20
>> should process it.
>>
>> So if wake up happens when list has buffer, it will be processed but=20
>> at a time we limit processing 2 simultaneous buffer capture starts only.
>>
> Fixing typo.
>
> I meant when ever buffer is available as long as we are in streaming,=20
> we should process it.
>
> So capture thread processes as long as buffers are available from user=20
> space limiting 2 simultaneous trigger of captures and thread will be=20
> in sleep when capture buffers list is empty or no stop thread is=20
> signaled.



