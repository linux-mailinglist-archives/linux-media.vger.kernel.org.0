Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 057BD1B6A83
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2020 02:52:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728397AbgDXAvv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 20:51:51 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:2909 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728156AbgDXAvu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 20:51:50 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ea238190000>; Thu, 23 Apr 2020 17:51:38 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 23 Apr 2020 17:51:50 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 23 Apr 2020 17:51:50 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 24 Apr
 2020 00:51:50 +0000
Received: from [10.2.165.49] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 24 Apr
 2020 00:51:49 +0000
Subject: Re: [RFC PATCH v9 6/9] media: tegra: Add Tegra210 Video input driver
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <helen.koike@collabora.com>
CC:     <sboyd@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1587536339-4030-1-git-send-email-skomatineni@nvidia.com>
 <1587536339-4030-7-git-send-email-skomatineni@nvidia.com>
 <7e473fa9-0409-d868-e818-2e7928a8acca@gmail.com>
 <a83bfc89-35de-85b5-fe5f-71e62456f5e9@nvidia.com>
 <3691c4b5-1ecc-2ad3-23ed-72ef6b8d25fa@nvidia.com>
 <fce6dfbb-0b8d-319b-2d6f-976953a3c36c@gmail.com>
 <a2672be9-93c1-8363-6c0e-6d43c2bd59bc@nvidia.com>
 <492dafac-42aa-3caf-4d32-ba0e434b19c3@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <39402a49-f39f-256c-31e7-afaa25d55664@nvidia.com>
Date:   Thu, 23 Apr 2020 17:51:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <492dafac-42aa-3caf-4d32-ba0e434b19c3@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1587689498; bh=GqevmKFeruTWerk0fVnbYo2UecOfTyPj1DGoVK9JAfM=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=lH4nj+WYYCRcuwprODPNnVi9lgpM+R7mnlqKWtU3Z0FzAJ/FkWZReXMDT6q/7s5Hc
         ctc2GHlC53N70o84nvfNVF0w5+8Rbyg4TJeR9iZ7aqLrcsZaP1VtRgaPETfFgpyG+k
         WZPVz79yFBVUvd3qenZsKTpxUd0Ql6T4/XJ2JZDjVk/4NpbUoXn0VHp498hWQua47z
         rdRWbbQSgz58VZ/gHX7QdyyDBg/Zx3yuwIOLueN9S6YtJjgaP1l9Q0eQHjDRLnd7iO
         f45KQe4oWJiLtwoFDiZRJO8yX0VJH4JicPySCguzTkOzb2GsW5j81Oo5qlrzkOCmKD
         Vw2JnNAoDjmVw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/23/20 5:42 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 24.04.2020 02:50, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 4/23/20 4:25 PM, Dmitry Osipenko wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> 24.04.2020 02:20, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> On 4/23/20 4:19 PM, Sowjanya Komatineni wrote:
>>>>> On 4/23/20 4:16 PM, Dmitry Osipenko wrote:
>>>>>> External email: Use caution opening links or attachments
>>>>>>
>>>>>>
>>>>>> 22.04.2020 09:18, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82=
:
>>>>>>> +static int chan_capture_kthread_start(void *data)
>>>>>>> +{
>>>>>>> +     struct tegra_vi_channel *chan =3D data;
>>>>>>> +     struct tegra_channel_buffer *buf;
>>>>>>> +     int err =3D 0;
>>>>>>> +
>>>>>>> +     set_freezable();
>>>>>>> +
>>>>>>> +     while (1) {
>>>>>>> +             try_to_freeze();
>>>>>>> +
>>>>>>> +             wait_event_interruptible(chan->start_wait,
>>>>>>> + !list_empty(&chan->capture) ||
>>>>>>> +                                      kthread_should_stop());
>>>>>>> +
>>>>>>> +             if (kthread_should_stop())
>>>>>>> +                     break;
>>>>>>> +
>>>>>>> +             /*
>>>>>>> +              * Source is not streaming if error is non-zero.
>>>>>>> +              * So, do not dequeue buffers on capture error.
>>>>>>> +              */
>>>>>>> +             if (err)
>>>>>>> +                     continue;
>>>>>> This will result in an endless loop, I suppose it wasn't the
>>>>>> intention.
>>>>> no it will not. on error we report vb2_queue_error which will do
>>>>> streaming stop request.
>>>>>
>>>>> So thread will be stopped on streaming stop request thru kthread stop
>>>>> signal
>>>> To be clear on error it reports vb2 queue error and waits for stop
>>>> streaming to happen
>>> If thread should exit on error, then it should do it on the actual
>>> error. Otherwise it looks very error-prone.
>> When v4l2 drivers indicate fatal error through vb2_queue_error, queue
>> error flag  is set and wakes up all processes waiting on queue along
>> with polling reporting  EPOLLERR and also reporting error for queuing
>> and dequeuing buffers. Stream stop will surely happen which stops the
>> thread.
> This doesn't explain what is the point of continuing to loop instead of
> exiting immediately on error.

We are using 2 threads and when capture start error happens, we can stop=20
capture_start thread immediately but capture_finish thread will still=20
run for any outstanding buffers.

So, as it makes no diff stopping both threads during stream stop which=20
will definitely happen on error and when we don't dequeue buffers

