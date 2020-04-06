Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C71819FF5C
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 22:43:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726331AbgDFUna (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 16:43:30 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:15309 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbgDFUna (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 16:43:30 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e8b94640001>; Mon, 06 Apr 2020 13:43:16 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 06 Apr 2020 13:43:29 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 06 Apr 2020 13:43:29 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 6 Apr
 2020 20:43:28 +0000
Received: from [10.2.164.193] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 6 Apr 2020
 20:43:27 +0000
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
 <782c8c4e-f5c2-d75e-0410-757172dd3090@gmail.com>
 <ac225ff3-8de8-256c-7f81-0225b4153540@nvidia.com>
 <86bbcd55-fa13-5a35-e38b-c23745eafb87@gmail.com>
 <2839b1ee-dedc-d0ee-e484-32729a82a6ea@nvidia.com>
Message-ID: <b5920aa5-4eed-1620-e29c-98ce85361bd4@nvidia.com>
Date:   Mon, 6 Apr 2020 13:43:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <2839b1ee-dedc-d0ee-e484-32729a82a6ea@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1586205796; bh=YkznWH59lcLo7y1yXj3cDOLOd2zspf+dkvQD+CIezL4=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=UmNv+jqTPyhH2simBK+vvZXdXqfm/xWiLkltAXcG4JXEpNxEYR2NxavpgIPHqQMZv
         19NiAkyHZ9aA77C+BhS9qQYO69z/vgWFS99XBhINbOXzRJS2VCES2+bp7HRNTwaZo1
         dkDA4EO0zyM10Xim2N5d2Bql4kvF0hm6sMgwe+F159/GqCZbIm31IMB1Itp5gsVYFZ
         ZYGUOtIkk3j1ctx5BRw57iLV0MxtCTklUU72LrZmuVxX9HAVTesK1PWcpeKJqHATyl
         BlSBj9qBUko4KJ27luAwx5i9VC0JX8zJJprIuALfXv1LTIfL/boEiSz+QfoqZ64GXb
         7nelxUKiLLeRw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/6/20 1:38 PM, Sowjanya Komatineni wrote:
>
> On 4/6/20 1:37 PM, Dmitry Osipenko wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> 06.04.2020 23:20, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> On 4/6/20 1:02 PM, Dmitry Osipenko wrote:
>>>> External email: Use caution opening links or attachments
>>>>
>>>>
>>>> 04.04.2020 04:25, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> ...
>>>>> +static int chan_capture_kthread_start(void *data)
>>>>> +{
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct tegra_vi_channel *chan =3D data;
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct tegra_channel_buffer *buf;
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 int err =3D 0;
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 int caps_inflight;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 set_freezable();
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 while (1) {
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 try_to_freeze();
>>>>> +
>>>>> + wait_event_interruptible(chan->start_wait,
>>>>> + !list_empty(&chan->capture) ||
>>>>> + kthread_should_stop());
>>>> Is it really okay that list_empty() isn't protected with a lock?

wakeup on thread happens either when buffer is moved to capture list or=20
on stop signaling event.

So in this specific case we may not need to check for lock on capture=20
list as if wakeup happens from start wait queue, then buffer is already=20
moved to capture list by then.

>>>>
>>>> Why wait_event is "interruptible"?
>>> To allow it to sleep until wakeup on thread it to avoid constant
>>> checking for condition even when no buffers are ready, basically to
>>> prevent blocking.
>> So the "interrupt" is for getting event about kthread_should_stop(),
>> correct?
> also to prevent blocking and to let is sleep and wakeup based on wait=20
> queue to evaluate condition to proceed with the task
>>
