Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41C561B8AAD
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2020 03:08:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726126AbgDZBIq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Apr 2020 21:08:46 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:7411 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbgDZBIq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Apr 2020 21:08:46 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ea4dea60000>; Sat, 25 Apr 2020 18:06:46 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Sat, 25 Apr 2020 18:08:45 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Sat, 25 Apr 2020 18:08:45 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 26 Apr
 2020 01:08:45 +0000
Received: from [10.2.165.152] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 26 Apr
 2020 01:08:44 +0000
Subject: Re: [RFC PATCH v10 6/9] media: tegra: Add Tegra210 Video input driver
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
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
Message-ID: <03426915-25ea-69b4-bc64-f87f3046d33f@nvidia.com>
Date:   Sat, 25 Apr 2020 18:08:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <658c4232-94d9-3051-8c93-bff7046cf5f2@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1587863206; bh=92MRw1LvU1KIc1wN0RoVrY6gmU+4rftF+SanSTPgbKE=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=fWHUgPyUC3inioYVyMaglDD/GVdsNsf480njQsTzQmOnTY+KOz/Q5mDLFC8mgY1om
         vLgWcUpUSq2Yj6aI0/lthGzv2DE5gy3rxc0PA7ErDfN7SxccDH/7r0rk60vnQQzXEm
         yw0W0Sb/lis0JOz1CZbHnC5yyuUWy6cSc+bvBT9Eg6bUmgO6ZKyEZM/4whD6h64dnX
         N6PZOCleVkOTFhpKmPT8KPRMb7KKuF9n8r+BCkDJ6kZ/NhXeRK1qi1ef9G2dnb3w7e
         +LsBeoEiKLzP4DptYuPtdldrFsVVNOntiuRnbQXQR/OlLewDNH9d+1qhcSjjjmceY/
         mi3o0eFNMc9wQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/25/20 5:41 PM, Sowjanya Komatineni wrote:
>
> On 4/25/20 5:36 PM, Dmitry Osipenko wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> 25.04.2020 12:36, Hans Verkuil =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> ...
>>>> The media/tegra/ sounds a bit too generic, the media/tegra-vi/ path
>>>> should better reflect the driver, IMO.
>>>>
>>>> It also should be better to name the compiled kernel module as=20
>>>> tegra-vi,
>>>> IMO.
>>>>
>>> The driver name and the directory should be in sync, so either=20
>>> tegra-video
>>> or tegra-vi for both. I have no preference myself, as long as they=20
>>> are the
>>> same.
>>>
>>> This can be done as a follow-up patch.
>> Given that this driver isn't going to be reused by older pre-Tegra210
>> SoCs, perhaps it will also be worthwhile to name it as tegra210-vi or
>> tegra210-video.
>
> Can you explain what do you meant by can't be reused for pre-tegra210=20
> or for tegra186/194?
>
> support for other tegra's can be added to same tegra-video driver.=20
> tegra-video host1x driver can be updated to add other tegra's vi and=20
> csi compatibles to host1x subdevs and vi and csi driver can be updated=20
> to add other tegra soc data and need to add coresponding=20
> tegra186/194/xxx.c file with tegra specific prog sequence
>
Same tegra-video.ko can be used for all tegra soc as driver supports=20
adding other soc related as well.

Also was thinking instead of renaming media/tegra as media/tegra-vi,=20
probably we can rename as media/tegra-video so it will be inline with=20
module name we already chosen and also mainly we have vi and csi with in=20
that so instead of tegra-vi probably we can use media/tegra-video?

