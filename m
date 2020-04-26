Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D895A1B8C63
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2020 06:47:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726154AbgDZErw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Apr 2020 00:47:52 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:2606 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726101AbgDZErv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Apr 2020 00:47:51 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ea512370000>; Sat, 25 Apr 2020 21:46:47 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Sat, 25 Apr 2020 21:47:51 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Sat, 25 Apr 2020 21:47:51 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 26 Apr
 2020 04:47:51 +0000
Received: from [10.2.165.152] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 26 Apr
 2020 04:47:50 +0000
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
 <7dfca778-e402-3a6f-617c-dd8448187a13@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <be48a991-3047-6ee3-8d6f-85979752d86f@nvidia.com>
Date:   Sat, 25 Apr 2020 21:47:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <7dfca778-e402-3a6f-617c-dd8448187a13@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1587876407; bh=z3l1tcjeYuFPwr0HB5ime5w6TuLrDGh3XGz13axlqlw=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=b47eb07wEdaMCCmHRV3IleDYT0PkehOBNIQ0TccZDYPR0tfNVjcq4+FkcjK+LV10G
         nZVBKcIwWhQmiQvghNTYXG8e+9xur/H++Xpty723+qFqM17XzUzZcZy+0dvIz6nPJh
         ifqLAFFzAKtmxUJThz8z1U+jYpGMc4MSIiTW3V3da4ZtpzC7fVMh2uCVDmHonVJRsh
         PtiJ0zsGEM0Siyxm6F3fZONCm9V31QHl3q8hBVYBHgZ7hjOD6QBHf1f8H8pI/VeB3B
         autW3xaGmJPbNFkm+UbvC3IlkimnTm6Z0qi2c2Y4auY3o5Codl6tKJ5NguglmyFVA5
         oxuQYVYMj0nDA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/25/20 9:42 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 26.04.2020 05:10, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> 26.04.2020 04:43, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> ...
>>>> It looks to me that at least all those hardcoded HW format IDs do not
>>>> match the older SoCs.
>>> TPG hard coded formats are supported on prior Tegra.
>>>
>>> Other supported formats are SoC dependent and  part of soc data in the
>>> driver already.
>> But I don't see where that SoC-dependent definition is made in
>> terga210.c. That tegra_image_format enum looks T210-specific, isn't it?
>>
>> ...
>>>> The driver will need to have a bit better separation if it's supposed =
to
>>>> have a common core for all SoCs. Each incompatible VI/CSI hardware
>>>> version should have its own kernel module.
>>> currently other Tegra host1x driver (drm) also does similar. Single
>>> module for all Tegra SoCs.
>> DRM driver has a proper separation of the sub-drivers where sub-driver
>> won't load on unsupported hardware. The tegra-video driver should do the
>> same, i.e. VI and CSI should be individual drivers (and not OPS). There
>> could be a some common core, but for now it's not obvious to me what
>> that core should be, maybe just the video.c.
> Although, you're right that tegra_drm is compiled as a single module.
> That's not good, I'm actually not sure now whether it is possible to
> modularize host1x drivers properly without changing the whole host1x bus.

We already went thru driver structure changes during earlier versions=20
and internal feedbacks.

Not sure of restructuring again now. Also reg wastage of space, tegra=20
specific implementation is not huge also for T186 and later we have=20
RTCPU firmware that driver communicates with and it light weight. Based=20
on internal discussion, no upstream support for prior Tegra210.

So, probably what we have regarding structure is ok except video formats=20
I will move to Tegra210 and change defines to use Tegra210 prefix.


