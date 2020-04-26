Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E57171B8B71
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2020 04:49:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726113AbgDZCtU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Apr 2020 22:49:20 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:9249 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725952AbgDZCtU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Apr 2020 22:49:20 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ea4f6380000>; Sat, 25 Apr 2020 19:47:20 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Sat, 25 Apr 2020 19:49:19 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Sat, 25 Apr 2020 19:49:19 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 26 Apr
 2020 02:49:19 +0000
Received: from [10.2.165.152] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 26 Apr
 2020 02:49:18 +0000
Subject: Re: [RFC PATCH v10 6/9] media: tegra: Add Tegra210 Video input driver
To:     Dmitry Osipenko <digetx@gmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <sakari.ailus@iki.fi>,
        <helen.koike@collabora.com>
CC:     <sboyd@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1587700513-28449-1-git-send-email-skomatineni@nvidia.com>
 <1587700513-28449-7-git-send-email-skomatineni@nvidia.com>
 <6ca93ff9-ca59-544f-767c-4355d01a5c20@gmail.com>
 <62546d1f-eca5-06be-2bc2-e45ccd53830a@xs4all.nl>
 <50fd1016-ca8b-ec5d-e5a8-f257138b152e@gmail.com>
 <658c4232-94d9-3051-8c93-bff7046cf5f2@nvidia.com>
 <03426915-25ea-69b4-bc64-f87f3046d33f@nvidia.com>
 <aabaecc4-3494-0137-7d2b-853304bfa68b@gmail.com>
 <09f20441-fec6-7496-2edc-c69db535e441@nvidia.com>
 <61799fab-858c-8b0d-ba7d-846cd041e044@gmail.com>
 <3a9707b5-b260-6137-f475-fc88d271010f@nvidia.com>
 <a7407ed7-f35e-b3e9-ad26-3e83f0ed462b@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <024fc70f-9a65-3fc4-1387-d0b15f3f74e7@nvidia.com>
Date:   Sat, 25 Apr 2020 19:48:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <a7407ed7-f35e-b3e9-ad26-3e83f0ed462b@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1587869240; bh=7ma9Ne94nzVP84OdxWY4OAMr6LnpzfZrrK0+ZrNYkwU=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=U2815cJ7zAChWBiRw2df4HuvACjujsWdxoECjY/y5ihlz5bEcqgZ1yR84z4daF5nS
         G2kC5uYwALDKO7e2UpPA4WPixn7A8lgQO0IhNc3Bx+GmUkJfprVVwLwLSq0FllVbph
         sCZxqzcCLhYUym+WZEr2FFcy5cZTJofSqMJYK/e0kqrIZHvyUxTE2EyCihrO1T4AEs
         n1q1Hpv2lBSdyBGJMksHlfoGbbPs6DLlQvJbTu9vv7pl50ICVwGaBPCzkbSmbAmDml
         Xlr5VFiJcEFaPDqJ67TvTY2VHRum4zK2YYFGMrH3pXJubWNPGvscCWf7eK11LUNGrp
         amV0QmzdRFr6w==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/25/20 7:38 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 26.04.2020 05:19, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 4/25/20 7:10 PM, Dmitry Osipenko wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> 26.04.2020 04:43, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> ...
>>>>> It looks to me that at least all those hardcoded HW format IDs do not
>>>>> match the older SoCs.
>>>> TPG hard coded formats are supported on prior Tegra.
>>>>
>>>> Other supported formats are SoC dependent and  part of soc data in the
>>>> driver already.
>>> But I don't see where that SoC-dependent definition is made in
>>> terga210.c. That tegra_image_format enum looks T210-specific, isn't it?
>>>
>>> ...
>> Video formats which are SoC variants are made soc specific in driver
>> already tegra_vi_soc structure member video_formats
>>
>> tegra_image_format enum is same for T210 and T186
>>
>> For T194, enums will be diff and will have diff TEGRA194_VIDEO_FORMAT
>> using corresponding Tegra194 video format enums
> But it is also not the same for older SoCs, correct? All the
> T210-specific things should be separated better, unique parts shouldn't
> be kept in the common code.
>
> Hence the tegra_image_format should be renamed to tegra210_image_format
> and moved out to t210.h, since it's not common. But then you'll probably
> need to rename all TEGRA_ defines to TEGRA210_ to make t210.h reusable
> by T186.

We can't make t210.h reusable for t186 as all register defines are diff.

only video format enums are same b/w them so to reuse that for t186 I=20
had that in common.

Regarding defines, will change prefix as Tegra210

>
> Also, in the end it may not worth the effort to share anything at all,
> it could be cleaner to have a bit of duplication. Although, I have no
> idea how T186 code will look like and what other parts of T210 could be
> reused by T186. All this needs to be taken into account in order to
> avoid struggling with the code's reshuffling in the future.

Currently as image formats are same for t210 and t186 I had them in=20
common.h and for t194 where they are diff new enums will be added.

Other tegra210 soc specific only are all part of tegra210.c/h

