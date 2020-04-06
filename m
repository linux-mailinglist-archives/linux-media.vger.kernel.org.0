Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E7A619FEF5
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 22:20:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbgDFUUu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 16:20:50 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:2971 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbgDFUUu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 16:20:50 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e8b8f140000>; Mon, 06 Apr 2020 13:20:36 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 06 Apr 2020 13:20:49 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 06 Apr 2020 13:20:49 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 6 Apr
 2020 20:20:49 +0000
Received: from [10.2.164.193] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 6 Apr 2020
 20:20:47 +0000
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
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <ac225ff3-8de8-256c-7f81-0225b4153540@nvidia.com>
Date:   Mon, 6 Apr 2020 13:20:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <782c8c4e-f5c2-d75e-0410-757172dd3090@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1586204436; bh=vy+n4X0chgwKpRDlpHAxZAkGBrYQIlHbvBPko/Tzrok=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=IqfM3ymnd+/H+wal1TAYhQGJPZInV3wIrHIPXeKetmIino4O1G5BBH2RQqiVaex0A
         rthlqrbz7LMoPeMYv5YpG1nH94OjgA4eYtNXD/01IQhd31am25qx6dG9Bc0Eg/qIlj
         qS21J4yCfTplPhkMPfgoGvuF9AFVb7EFA6R6CpjrVdrRz2ieHsLscBsJBRFi8qvUHd
         a53+qOJX8jl67d/bRan+ThoiP2PTIXLjA1KjMR13OyislWeiFdurTBXk6zIIMnxulW
         F6oZSPO4PYVvLJ7Ofztj3YRpgcqfjnnSCzJLwr9fd3X6aSOy7eJzBr7LhWU4a5kf9f
         C327K+qLhxrSw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/6/20 1:02 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 04.04.2020 04:25, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
>> +static int chan_capture_kthread_start(void *data)
>> +{
>> +     struct tegra_vi_channel *chan =3D data;
>> +     struct tegra_channel_buffer *buf;
>> +     int err =3D 0;
>> +     int caps_inflight;
>> +
>> +     set_freezable();
>> +
>> +     while (1) {
>> +             try_to_freeze();
>> +
>> +             wait_event_interruptible(chan->start_wait,
>> +                                      !list_empty(&chan->capture) ||
>> +                                      kthread_should_stop());
> Is it really okay that list_empty() isn't protected with a lock?
>
> Why wait_event is "interruptible"?

To allow it to sleep until wakeup on thread it to avoid constant=20
checking for condition even when no buffers are ready, basically to=20
prevent blocking.

>
>> +             /*
>> +              * Frame start and MW_ACK_DONE syncpoint condition FIFOs a=
re
>> +              * of max depth 2. So make sure max 2 capture requests are
>> +              * in process by the hardware at a time.
>> +              */
>> +             while (!(kthread_should_stop() || list_empty(&chan->captur=
e))) {
>> +                     caps_inflight =3D chan->capture_reqs - chan->seque=
nce;
>> +                     /*
>> +                      * Source is not streaming if error is non-zero.
>> +                      * So, do not dequeue buffers on capture error or =
when
>> +                      * syncpoint requests in FIFO are full.
>> +                      */
>> +                     if (err || caps_inflight >=3D SYNCPT_FIFO_DEPTH)
>> +                             break;
>> +
>> +                     /* dequeue the buffer and start capture */
>> +                     spin_lock(&chan->start_lock);
>> +                     if (list_empty(&chan->capture))
>> +                             break;
>> +                     buf =3D list_entry(chan->capture.next,
>> +                                      struct tegra_channel_buffer, queu=
e);
> list_first_entry()
>
>> +                     list_del_init(&buf->queue);
>> +                     spin_unlock(&chan->start_lock);
>> +
>> +                     err =3D tegra_channel_capture_frame(chan, buf);
>> +                     if (err)
>> +                             vb2_queue_error(&chan->queue);
>> +             }
>> +
>> +             if (kthread_should_stop())
>> +                     break;
>> +     }
>> +
>> +     return 0;
>> +}
