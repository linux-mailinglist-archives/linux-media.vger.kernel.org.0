Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35E641C28A4
	for <lists+linux-media@lfdr.de>; Sun,  3 May 2020 00:47:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728581AbgEBWr0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 May 2020 18:47:26 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:6750 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728545AbgEBWr0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 2 May 2020 18:47:26 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5eadf8710000>; Sat, 02 May 2020 15:47:13 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Sat, 02 May 2020 15:47:25 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Sat, 02 May 2020 15:47:25 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 2 May
 2020 22:47:25 +0000
Received: from [10.2.165.119] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 2 May 2020
 22:47:24 +0000
Subject: Re: [RFC PATCH v11 6/9] media: tegra: Add Tegra210 Video input driver
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <helen.koike@collabora.com>
CC:     <sboyd@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1588197606-32124-1-git-send-email-skomatineni@nvidia.com>
 <289d9c92-383f-3257-de7b-46179724285a@nvidia.com>
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
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <b5f6a4e0-6e97-05ae-f034-b84fc5a1129a@nvidia.com>
Date:   Sat, 2 May 2020 15:46:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <4abf30e0-fed9-ba39-ae38-350789bce99d@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1588459633; bh=CBnFL7uPNS5WM1c2jb/jKo6GeM5vonJcVOmwBiIyxHY=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=aPojyaqaxt+7L2ozKSgR37xcCVX+2zTA1ccSwHPPcrfxHXwMchhOeiKGHmU1VT+PW
         RWOO7wXM3IaMcrWVsjwaFCANTlt3YHnmVrFDiwESt7UVmxnh69qYgiNqPiDDCmNK6C
         UilidCJ/KEFgQHtgke6ft/Frh0q6J2t0j6xFj6Ohbc3W7fuA+rphqUkhPGOuLfAWVJ
         STp+DGQKXP3283i/tOzXv0K7mDp5YGkbdnrxGFKLo/S50ycWPU6OMfkdRLvJNUfv+v
         3sGgaBscrx6iaGYs/XWHMWJxusIDGJiK4d4b8A+RoFA+R87LLGKnFTWmrAEn7AfR8P
         xosrKYoXCjT1Q==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 5/2/20 1:48 PM, Dmitry Osipenko wrote:
> 02.05.2020 19:55, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Also stop stream ioctl request happens during suspend where both threads
>> will be stopped properly. done thread stop happens only after finishing
>> all outstanding buffers.
> Do you mean that V4L core takes care of stopping the streami on suspend
> and re-starting it on resume from suspend?
>
>> Stop stream request happens from streaming applications so even without
>> driver suspend/resume implementation currently, streaming will be
>> stopped prior to system=C2=A0 suspend where both threads will be stopped
>> properly (after finishing out standing buffers) and will be resumed by
>> application on system resume
> All userspace is frozen on suspend. System suspension is transparent for
> userspace applications. I'm not sure what you're meaning here.
>
>> Also tested suspending while streaming with this unconditional freeze, I
>> don't see any issue as application stops stream where v4l_streamoff gets
>> executed during suspend and on resume streaming starts where
>> v4l_streamon happens.
>>
>> So, I don't see any issue with existing implementation of unconditional
>> freeze.
> I don't understand why freezing is needed at all if V4L core takes care
> of stopping the stream on suspend, what is the point? If there is no
> real point, then let's make threads non-freezable and done with that.

video device fops unlocked_ioctl is set to video_ioctl2() in vi driver.

video device fops unlocked_ioctl gets executed with stream off cmd=20
during suspend and stream on cmd during resume which eventually calls=20
v4l_streamoff and v4l_streamon during system suspend/resume.

My understanding to have freezable threads is during system suspend user=20
space applications are frozen prior to kernel freeze and during suspend=20
when opened video character device node gets closed these ioctl gets=20
invoked and stream off during suspend and stream on during resume=20
happens. So probably we still need to use freezable threads to sync with=20
user space application when frozen before really entering suspend.

Will wait for Thierry/Hans comment to correct if my above understanding=20
is wrong and help clarify if we need freezable threads at all in this=20
case...

Note: I see other drivers using freezable threads for capture drivers.


Assuming we use freezable threads, I was saying we don't need=20
conditional try_to_freeze() like you pointed because even if finish=20
thread freeze happens prior to frame capture initiated by start thread,=20
vi hardware will still continue to update this single ongoing buffer and=20
will finish max within 200ms and actually there is no direct processing=20
of this done by finish thread itself except that it returns buffers back=20
when done and in this case it returns back when unfreeze/wake up happens.

So, I don't see any issue of unconditional try_to_freeze() even with=20
freezable threads.

Thanks

Sowjanya


