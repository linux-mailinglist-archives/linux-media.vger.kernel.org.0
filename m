Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 417711C2920
	for <lists+linux-media@lfdr.de>; Sun,  3 May 2020 02:04:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726561AbgECAEE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 May 2020 20:04:04 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:8229 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725798AbgECAEE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 2 May 2020 20:04:04 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5eae0a670000>; Sat, 02 May 2020 17:03:51 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Sat, 02 May 2020 17:04:04 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Sat, 02 May 2020 17:04:04 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 3 May
 2020 00:04:03 +0000
Received: from [10.2.165.119] (172.20.13.39) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 3 May 2020
 00:04:02 +0000
Subject: Re: [RFC PATCH v11 6/9] media: tegra: Add Tegra210 Video input driver
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <helen.koike@collabora.com>
CC:     <sboyd@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1588197606-32124-1-git-send-email-skomatineni@nvidia.com>
 <9aa64f21-7b23-7228-b5eb-d2ff092682ad@nvidia.com>
 <668cc4a0-2c81-0d87-b801-9fbf64e19137@nvidia.com>
 <bf3f654e-b8f8-d560-fc5e-03d73cb7eab0@nvidia.com>
 <525e481b-9137-6fdd-bbf9-3779a5704e6b@nvidia.com>
 <fe7ebad6-0368-b1f0-4f58-648baa5e3f79@nvidia.com>
 <4f095181-2338-3b71-316c-f8bbfc7865cc@nvidia.com>
 <50e872bb-913a-7b47-3264-af6b1cedb0e2@nvidia.com>
 <e17a8a49-be53-465d-f64c-3f4c77391d98@nvidia.com>
 <da5154b4-85f9-3e56-a440-f75debaec3a8@nvidia.com>
 <cbb047ae-97dc-8b9a-a5ba-8e2a5dab3771@nvidia.com>
 <6ae2d00d-7955-d12b-5b56-955ef72ece26@nvidia.com>
 <f9073b28-f1f1-636c-be53-764fb0a531a1@gmail.com>
 <1767e50f-efb7-5e89-22f6-0917821b660d@nvidia.com>
 <235a4cd4-4d4a-04b8-6c65-43a4dba48a0b@nvidia.com>
 <f8103170-7879-8597-3e3c-da9a3b6a40b3@nvidia.com>
 <5d847770-dad9-8f18-67b5-c1ba79084957@nvidia.com>
 <4abf30e0-fed9-ba39-ae38-350789bce99d@gmail.com>
 <b5f6a4e0-6e97-05ae-f034-b84fc5a1129a@nvidia.com>
Message-ID: <b4b479ea-dd34-c78c-5813-46651d1cb4c7@nvidia.com>
Date:   Sat, 2 May 2020 17:03:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <b5f6a4e0-6e97-05ae-f034-b84fc5a1129a@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1588464231; bh=++Dxg5JxRPWKg4KId7LmyKlZfVDjcDi+BgDKH1t3p8Q=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=S/p1ALEUQZp7Kk6QrqsNbGIzR51yYwFOMRpEeurWxeg/m2EMOBW6/nLf/Yko9Ad58
         QclOyi4Dimt98utHWS8HEu5hWhu9UiUdvtZTWOUF9W6Mb8okAeXF8uynS7ppsiw7Qa
         fS7qKECq4P4L4XmzhYAgVWpV53XZhRceN2pz4k7ndIKrZFt3bm+PEUfR0WTrqmEeAQ
         jRGygudUTWIeIvjAKCRvOI5KcayhamnFr/p4VnSbGK8GU/CELCHTBC5repd4XhH94O
         AWo99iJGz5jbQ8COkjBq731QyJ+gsYDgu2a//IWZexkqWF1LX3K7iGBP0atx8xLeQ1
         chQcpNt3SBnOA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 5/2/20 3:46 PM, Sowjanya Komatineni wrote:
>
> On 5/2/20 1:48 PM, Dmitry Osipenko wrote:
>> 02.05.2020 19:55, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> Also stop stream ioctl request happens during suspend where both=20
>>> threads
>>> will be stopped properly. done thread stop happens only after finishing
>>> all outstanding buffers.
>> Do you mean that V4L core takes care of stopping the streami on suspend
>> and re-starting it on resume from suspend?
>>
>>> Stop stream request happens from streaming applications so even without
>>> driver suspend/resume implementation currently, streaming will be
>>> stopped prior to system=C2=A0 suspend where both threads will be stoppe=
d
>>> properly (after finishing out standing buffers) and will be resumed by
>>> application on system resume
>> All userspace is frozen on suspend. System suspension is transparent for
>> userspace applications. I'm not sure what you're meaning here.
>>
>>> Also tested suspending while streaming with this unconditional=20
>>> freeze, I
>>> don't see any issue as application stops stream where v4l_streamoff=20
>>> gets
>>> executed during suspend and on resume streaming starts where
>>> v4l_streamon happens.
>>>
>>> So, I don't see any issue with existing implementation of unconditional
>>> freeze.
>> I don't understand why freezing is needed at all if V4L core takes care
>> of stopping the stream on suspend, what is the point? If there is no
>> real point, then let's make threads non-freezable and done with that.
>
> video device fops unlocked_ioctl is set to video_ioctl2() in vi driver.
>
> video device fops unlocked_ioctl gets executed with stream off cmd=20
> during suspend and stream on cmd during resume which eventually calls=20
> v4l_streamoff and v4l_streamon during system suspend/resume.
>
> My understanding to have freezable threads is during system suspend=20
> user space applications are frozen prior to kernel freeze and during=20
> suspend when opened video character device node gets closed these=20
> ioctl gets invoked and stream off during suspend and stream on during=20
> resume happens. So probably we still need to use freezable threads to=20
> sync with user space application when frozen before really entering=20
> suspend.
>
> Will wait for Thierry/Hans comment to correct if my above=20
> understanding is wrong and help clarify if we need freezable threads=20
> at all in this case...
>
> Note: I see other drivers using freezable threads for capture drivers.

I see only couple of media drivers using freezable threads.

Also, referring to below article probably we don't need freezable threads.

https://lwn.net/Articles/662703/

Probably we can then remove thread as freezable...


>
>
> Assuming we use freezable threads, I was saying we don't need=20
> conditional try_to_freeze() like you pointed because even if finish=20
> thread freeze happens prior to frame capture initiated by start=20
> thread, vi hardware will still continue to update this single ongoing=20
> buffer and will finish max within 200ms and actually there is no=20
> direct processing of this done by finish thread itself except that it=20
> returns buffers back when done and in this case it returns back when=20
> unfreeze/wake up happens.
>
> So, I don't see any issue of unconditional try_to_freeze() even with=20
> freezable threads.
>
> Thanks
>
> Sowjanya
>
>
