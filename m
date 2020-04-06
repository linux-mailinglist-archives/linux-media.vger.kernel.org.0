Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F65719FAEE
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 19:02:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729380AbgDFRCZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 13:02:25 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:2890 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728902AbgDFRCY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 13:02:24 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e8b60920000>; Mon, 06 Apr 2020 10:02:10 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 06 Apr 2020 10:02:23 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 06 Apr 2020 10:02:23 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 6 Apr
 2020 17:02:23 +0000
Received: from [10.2.164.193] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 6 Apr 2020
 17:02:22 +0000
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
 <38d921a7-5cdf-8d0a-2772-4399dd1a96a0@gmail.com>
 <9b8cf37b-d2ad-9df2-aad8-216c2c954e69@nvidia.com>
 <1a12974a-7cc7-2c3a-3995-076b9956714d@gmail.com>
 <66cc8646-43d3-3fc8-c31d-d0d2efac505f@nvidia.com>
 <f000f6b9-0f05-b2a5-6dad-37b09803711d@gmail.com>
 <fe6a17c1-fae2-a365-4dd6-6d3a25d47d54@nvidia.com>
Message-ID: <9038ce90-ac53-93e7-ce65-57f6ff1e9b30@nvidia.com>
Date:   Mon, 6 Apr 2020 10:02:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <fe6a17c1-fae2-a365-4dd6-6d3a25d47d54@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1586192530; bh=HfFYbZ27Y3G9qeqPpSUfK2Y8xI+FtOmG03YNSGTQO5A=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=YyDSywQDN5DN9997fHeifJqQw45hpq4ld2U+BcVuvYtKOISyV6Od2775CIfD3mZbP
         EIGF+B+xppN6j7RV9i4fnAE8TX5o2xJoqujYSu6KN2CysFT3uOKEB4YXyvAOZ6WjA5
         YehsHQkwJvoBCfvVxyQHHDlYtdXkWtY/Q5cXBWNK7654QMQJRpGS0SEZqcDVrr3lrb
         QK3mILrCBrNAxnZ/qF9oAlZcqUOsoO+GNhaM3uWHGtBiGqV/CfDy/468tBvFgr0yGq
         KyIhhWcxvTmjXTf4EW53HyUNf+1YKhuyyZEd3NeY25/379u8dDRaXRl51bcA+9JWQM
         rGN8RbTyJ3S0g==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/6/20 9:37 AM, Sowjanya Komatineni wrote:
>
> On 4/6/20 9:29 AM, Dmitry Osipenko wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> 06.04.2020 19:12, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> On 4/6/20 9:05 AM, Dmitry Osipenko wrote:
>>>> External email: Use caution opening links or attachments
>>>>
>>>>
>>>> 06.04.2020 18:35, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> ...
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 /* wait for syncpt counter to reach frame=
 start event
>>>>>>> threshold */
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 err =3D host1x_syncpt_wait(chan->frame_st=
art_sp, thresh,
>>>>>>> + TEGRA_VI_SYNCPT_WAIT_TIMEOUT, &value);
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (err) {
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 dev_err(&chan->video.dev,
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "frame start syncpt =
timeout: %d\n", err);
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 /* increment syncpoint counter for timedout events */
>>>>>>> + host1x_syncpt_incr(chan->frame_start_sp);
>>>>>> Why incrementing is done while hardware is still active?
>>>>>>
>>>>>> The sync point's state needs to be completely reset after resetting
>>>>>> hardware. But I don't think that the current upstream host1x driver
>>>>>> supports doing that, it's one of the known-long-standing problems of
>>>>>> the
>>>>>> host1x driver.
>>>>>>
>>>>>> At least the sp->max_val incrementing should be done based on the
>>>>>> actual
>>>>>> syncpoint value and this should be done after resetting hardware.
>>>>> upstream host1x driver don't have API to reset or to equalize max=20
>>>>> value
>>>>> with min/load value.
>>>>>
>>>>> So to synchronize missed event, incrementing HW syncpt counter.
>>>>>
>>>>> This should not impact as we increment this in case of missed events
>>>>> only.
>>>> It's wrong to touch sync point while hardware is active and it's=20
>>>> active
>>>> until being reset.
>>>>
>>>> You should re-check the timeout after hw resetting and manually put=20
>>>> the
>>>> syncpoint counter back into sync only if needed.
>>> There is possibility of timeout to happen any time even during the
>>> capture also and is not related to hw reset.
>>>
>>> Manual synchronization is needed when timeout of any frame events=20
>>> happen
>>> otherwise all subsequence frames will timeout due to mismatch in event
>>> counters.
>> My point is that hardware is stopped only after being reset, until then
>> you should assume that sync point could be incremented by HW at any=20
>> time.
>>
>> And if this happens that HW increments sync point after the timeout,
>> then the sync point counter should become out-of-sync in yours case,
>> IIUC. Because host1x_syncpt_incr() doesn't update the cached counter.
>
> We wait for enough time based on frame rate for syncpt increment to=20
> happen and if it doesn't happen by then definitely its missed event=20
> and we increment HW syncpoint for this timed event.
>
> cached value gets updated during syncpt wait for subsequent event.
>
> syncpt increment happens for all subsequent frame events during video=20
> capture.
>
Just to be clear, syncpt max value increment happens first and syncpt=20
trigger condition is programmed. hw syncpt increment happens based on HW=20
events.

Wait time for HW syncpt to reach threshold is tuned to work for all=20
frame rates. So if increment doesn't happen by then, its definitely=20
missed event.

In case of missed HW event corresponding to syncpt condition, hw syncpt=20
increment does not happen and driver increments it on timeout.

As there is not API to equialize max with min incase of timeout/reset,=20
incrementing HW syncpt for timed out event.

syncpt cached value gets updated during syncpt wait when it loads from=20
HW syncpt.

As syncpt condition is already triggered, without compensating timeout=20
events or leaving syncpt max and hw syncpt in non synchronized state for=20
missed events, subsequent streamings will all timeout even on real events.

