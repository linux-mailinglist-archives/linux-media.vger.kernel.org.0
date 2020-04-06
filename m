Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67ED819FF90
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 22:55:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726417AbgDFUzQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 16:55:16 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:8504 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725957AbgDFUzQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 16:55:16 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e8b96ff0000>; Mon, 06 Apr 2020 13:54:23 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 06 Apr 2020 13:55:15 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 06 Apr 2020 13:55:15 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 6 Apr
 2020 20:55:14 +0000
Received: from [10.2.164.193] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 6 Apr 2020
 20:55:13 +0000
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
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <08cd31d5-e8b9-4d3a-fb0e-0e4462947d96@nvidia.com>
Date:   Mon, 6 Apr 2020 13:55:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <be77b0ef-d605-8357-4180-f40b2886d07a@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1586206463; bh=YnvtQsMn5rdC0Ko/RPVqNGcCUm5QPvKwp6GatKxWssk=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=bW1MmzrBrn4j8HcsWvWtV5uHCW4bom4CIRnjFomFRKi190jhbZndHStaEzv871ylV
         3ejsEaCikv1vLfL6g56f2K9TzmLJE0rLj9h+UvR4DOUHmHfA7o7niL+Wn40MtYRr4h
         FtgxbhOhFRKS0GODfhKUdKeLw2Gmjsn9LXNi1XTfZaDf9mhD6N6OdQKrEfn1RylttA
         ztg42f1fWD5kgEkyBYJ1ctgho7PtR2K/uNt139nxlP/zoIaVwtHhppOMvDhOZU5ZT/
         lc94UJg4RST9A9VqO7kkBevjYn/AhlGky+9PUvIeKdwefGUU3iMABcyCD0hv9ohAIV
         yOH0ZvVuO7CVA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/6/20 1:53 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 06.04.2020 23:50, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 4/6/20 1:45 PM, Dmitry Osipenko wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> 04.04.2020 04:25, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> +static int chan_capture_kthread_start(void *data)
>>>> +{
>>>> +     struct tegra_vi_channel *chan =3D data;
>>>> +     struct tegra_channel_buffer *buf;
>>>> +     int err =3D 0;
>>>> +     int caps_inflight;
>>>> +
>>>> +     set_freezable();
>>>> +
>>>> +     while (1) {
>>>> +             try_to_freeze();
>>>> +
>>>> +             wait_event_interruptible(chan->start_wait,
>>>> +                                      !list_empty(&chan->capture) ||
>>>> +                                      kthread_should_stop());
>>>> +             /*
>>>> +              * Frame start and MW_ACK_DONE syncpoint condition
>>>> FIFOs are
>>>> +              * of max depth 2. So make sure max 2 capture requests a=
re
>>>> +              * in process by the hardware at a time.
>>>> +              */
>>>> +             while (!(kthread_should_stop() ||
>>>> list_empty(&chan->capture))) {
>>>> +                     caps_inflight =3D chan->capture_reqs -
>>>> chan->sequence;
>>>> +                     /*
>>>> +                      * Source is not streaming if error is non-zero.
>>>> +                      * So, do not dequeue buffers on capture error
>>>> or when
>>>> +                      * syncpoint requests in FIFO are full.
>>>> +                      */
>>>> +                     if (err || caps_inflight >=3D SYNCPT_FIFO_DEPTH)
>>>> +                             break;
>>> Am I understanding correctly that this thread will take 100% CPU,
>>> spinning here, if more than 2 frame-captures queued?
>> on more than 2 frames captures, it breaks thread and on next wakeup it
>> continues
> The wait_event() won't wait if condition is true.
condition is checked when waitqueue is woken up
