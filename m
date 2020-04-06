Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C2A719FA38
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 18:37:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729228AbgDFQhh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 12:37:37 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:11100 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728996AbgDFQhh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 12:37:37 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e8b5a6a0000>; Mon, 06 Apr 2020 09:35:54 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 06 Apr 2020 09:37:36 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 06 Apr 2020 09:37:36 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 6 Apr
 2020 16:37:36 +0000
Received: from [10.2.164.193] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 6 Apr 2020
 16:37:34 +0000
Subject: Re: [RFC PATCH v6 6/9] media: tegra: Add Tegra210 Video input driver
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <helen.koike@collabora.com>
CC:     <sboyd@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
 <1585963507-12610-7-git-send-email-skomatineni@nvidia.com>
 <38d921a7-5cdf-8d0a-2772-4399dd1a96a0@gmail.com>
 <9b8cf37b-d2ad-9df2-aad8-216c2c954e69@nvidia.com>
 <1a12974a-7cc7-2c3a-3995-076b9956714d@gmail.com>
 <66cc8646-43d3-3fc8-c31d-d0d2efac505f@nvidia.com>
 <f000f6b9-0f05-b2a5-6dad-37b09803711d@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <fe6a17c1-fae2-a365-4dd6-6d3a25d47d54@nvidia.com>
Date:   Mon, 6 Apr 2020 09:37:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f000f6b9-0f05-b2a5-6dad-37b09803711d@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1586190954; bh=rPSq0eirHRbbp3P7o0ShrYFulLXLt5OnUxaf3rXZFgg=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=fPCoO9GDIW2e0sIi6EidkOUdnkqqK0Vwny+NicAnLg2GfrNQejNlNbxM75to3c/qI
         FiLTrWUQmTmk3areKo8LLLT5dA7bp77Pll9+uGciZCd61RC0o3kmEdh0+YkO7dj3qL
         w5LD3k66gOf7opM4UmSUSpy4nWmvXxRIT/JDdH7xP7ZbUV24l7ss9eMDidz5nTcPvB
         Re8oZ+Bl7OXCQQxl+HSks18vEerUGwe1PVJDhveB0wP3GaPJtH9hiAcn3pvX/NBi4I
         RnwjiW+LllYmRlw0I1eTzyqIJOVrQC+YdtpncAGRVkpoAz662Wq83xGEO0E530smjV
         XQN1rb3Ll1yLg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/6/20 9:29 AM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 06.04.2020 19:12, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 4/6/20 9:05 AM, Dmitry Osipenko wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> 06.04.2020 18:35, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> ...
>>>>>> +     /* wait for syncpt counter to reach frame start event
>>>>>> threshold */
>>>>>> +     err =3D host1x_syncpt_wait(chan->frame_start_sp, thresh,
>>>>>> +                              TEGRA_VI_SYNCPT_WAIT_TIMEOUT, &value)=
;
>>>>>> +     if (err) {
>>>>>> +             dev_err(&chan->video.dev,
>>>>>> +                     "frame start syncpt timeout: %d\n", err);
>>>>>> +             /* increment syncpoint counter for timedout events */
>>>>>> +             host1x_syncpt_incr(chan->frame_start_sp);
>>>>> Why incrementing is done while hardware is still active?
>>>>>
>>>>> The sync point's state needs to be completely reset after resetting
>>>>> hardware. But I don't think that the current upstream host1x driver
>>>>> supports doing that, it's one of the known-long-standing problems of
>>>>> the
>>>>> host1x driver.
>>>>>
>>>>> At least the sp->max_val incrementing should be done based on the
>>>>> actual
>>>>> syncpoint value and this should be done after resetting hardware.
>>>> upstream host1x driver don't have API to reset or to equalize max valu=
e
>>>> with min/load value.
>>>>
>>>> So to synchronize missed event, incrementing HW syncpt counter.
>>>>
>>>> This should not impact as we increment this in case of missed events
>>>> only.
>>> It's wrong to touch sync point while hardware is active and it's active
>>> until being reset.
>>>
>>> You should re-check the timeout after hw resetting and manually put the
>>> syncpoint counter back into sync only if needed.
>> There is possibility of timeout to happen any time even during the
>> capture also and is not related to hw reset.
>>
>> Manual synchronization is needed when timeout of any frame events happen
>> otherwise all subsequence frames will timeout due to mismatch in event
>> counters.
> My point is that hardware is stopped only after being reset, until then
> you should assume that sync point could be incremented by HW at any time.
>
> And if this happens that HW increments sync point after the timeout,
> then the sync point counter should become out-of-sync in yours case,
> IIUC. Because host1x_syncpt_incr() doesn't update the cached counter.

We wait for enough time based on frame rate for syncpt increment to=20
happen and if it doesn't happen by then definitely its missed event and=20
we increment HW syncpoint for this timed event.

cached value gets updated during syncpt wait for subsequent event.

syncpt increment happens for all subsequent frame events during video=20
capture.

