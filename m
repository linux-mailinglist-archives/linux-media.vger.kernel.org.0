Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C13581A0013
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 23:18:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726407AbgDFVSX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 17:18:23 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:2374 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbgDFVSW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 17:18:22 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e8b9c690000>; Mon, 06 Apr 2020 14:17:29 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Mon, 06 Apr 2020 14:18:21 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Mon, 06 Apr 2020 14:18:21 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 6 Apr
 2020 21:18:21 +0000
Received: from [10.2.164.193] (172.20.13.39) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 6 Apr 2020
 21:18:19 +0000
Subject: Re: [RFC PATCH v6 6/9] media: tegra: Add Tegra210 Video input driver
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
 <7361d00d-9cfe-3e4a-6199-524d37d53bd0@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <ae1a90af-12ff-69dd-74c3-89f42a945a5c@nvidia.com>
Date:   Mon, 6 Apr 2020 14:18:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <7361d00d-9cfe-3e4a-6199-524d37d53bd0@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1586207849; bh=8nONXWLFCq3lGgRTBCMj368KMxYIgkUaWWlaHerqj5o=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=XgVvToRn6kgcYslV6XANiWSxG4v2jhzDtr4cUsTHn11cD1GrWlnQrexedArMDcrFi
         k+MWFh/EZtYPBii6Ph5wYVyznw3lf8K9Xe376HYGwwhp4SsPd5u2b7G1vhyrpQL/Ev
         HwhvNMHvNcwLFR3ES2G8CrCIa/xha//0w0pKNtPpcKO7ZNpHHpmxKkXWzZTLEPX3dO
         rEsx1E98/5wbVZuO7a9RPd9XpY5xb2y+Zh1Ke1N9QJ04ERp1rYmhJbBSqTFildaxSQ
         DGLuTN5mrzH9gAeM7LjrVFWGktgA8TzLJY8ZgXp9ky4B0+lgBtHQZF77IX0JV/ni/O
         adndAvNlEophw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/6/20 1:54 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 06.04.2020 23:38, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 4/6/20 1:37 PM, Dmitry Osipenko wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> 06.04.2020 23:20, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> On 4/6/20 1:02 PM, Dmitry Osipenko wrote:
>>>>> External email: Use caution opening links or attachments
>>>>>
>>>>>
>>>>> 04.04.2020 04:25, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>> ...
>>>>>> +static int chan_capture_kthread_start(void *data)
>>>>>> +{
>>>>>> +     struct tegra_vi_channel *chan =3D data;
>>>>>> +     struct tegra_channel_buffer *buf;
>>>>>> +     int err =3D 0;
>>>>>> +     int caps_inflight;
>>>>>> +
>>>>>> +     set_freezable();
>>>>>> +
>>>>>> +     while (1) {
>>>>>> +             try_to_freeze();
>>>>>> +
>>>>>> +             wait_event_interruptible(chan->start_wait,
>>>>>> +                                      !list_empty(&chan->capture) |=
|
>>>>>> +                                      kthread_should_stop());
>>>>> Is it really okay that list_empty() isn't protected with a lock?
>>>>>
>>>>> Why wait_event is "interruptible"?
>>>> To allow it to sleep until wakeup on thread it to avoid constant
>>>> checking for condition even when no buffers are ready, basically to
>>>> prevent blocking.
>>> So the "interrupt" is for getting event about kthread_should_stop(),
>>> correct?
>> also to prevent blocking and to let is sleep and wakeup based on wait
>> queue to evaluate condition to proceed with the task
> This looks suspicious, the comment to wait_event_interruptible() says
> that it will return ERESTARTSYS if signal is recieved..
>
> Does this mean that I can send signal from userspace to wake it up?
>
> The "interruptible" part looks wrong to me.

We are not checking for wait_event_interruptible to handle case when it=20
returns ERESTARTSYS.

So, signals sent from user space are ignore and we check if when wakeup=20
happens if kthread_stop has requested to stop thread.

