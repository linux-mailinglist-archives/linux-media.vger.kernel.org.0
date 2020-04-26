Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 986191B8ADF
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2020 03:43:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726101AbgDZBni (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Apr 2020 21:43:38 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:5803 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725931AbgDZBni (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Apr 2020 21:43:38 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ea4e73d0000>; Sat, 25 Apr 2020 18:43:25 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Sat, 25 Apr 2020 18:43:38 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Sat, 25 Apr 2020 18:43:38 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 26 Apr
 2020 01:43:38 +0000
Received: from [10.2.165.152] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 26 Apr
 2020 01:43:36 +0000
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
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <09f20441-fec6-7496-2edc-c69db535e441@nvidia.com>
Date:   Sat, 25 Apr 2020 18:43:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <aabaecc4-3494-0137-7d2b-853304bfa68b@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1587865405; bh=fIaSaG+JMolsYjsCT2iZAB7fnW0LWdosDfY/M747Esc=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=VNtcJaAygaSdM6ObESj0yxBpYZ7JvWDke+X1IU21UvNnQ+0G6Gg5c5GOZbAxGoWZX
         /B5H8ZUkbIA+Cr9bwz2GochyQ3KGz8ZBNqgtJ1pNUDsl2ZcmEUBql6YpukuyE/SVQq
         j164MRTWJEw6SRT9gM+HflJQfL3lER3kgtzydbTx388jdaKkyUJUP+ZME7VpsDOcvY
         TnNKWnR5BDiPH/wkG3O/SRnIlvs++h7qgdmuRnbCz/zrlyvAYYiZXXfSRV3T7FUHiV
         kiVoAyuBWSzj3bkDssTEeaIM7jikXywGKPK7mnsBityTSFh/hoSPkduxjhZIZpgxg6
         Q3Q9v+23xrLJw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/25/20 6:26 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 26.04.2020 04:08, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 4/25/20 5:41 PM, Sowjanya Komatineni wrote:
>>> On 4/25/20 5:36 PM, Dmitry Osipenko wrote:
>>>> External email: Use caution opening links or attachments
>>>>
>>>>
>>>> 25.04.2020 12:36, Hans Verkuil =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> ...
>>>>>> The media/tegra/ sounds a bit too generic, the media/tegra-vi/ path
>>>>>> should better reflect the driver, IMO.
>>>>>>
>>>>>> It also should be better to name the compiled kernel module as
>>>>>> tegra-vi,
>>>>>> IMO.
>>>>>>
>>>>> The driver name and the directory should be in sync, so either
>>>>> tegra-video
>>>>> or tegra-vi for both. I have no preference myself, as long as they
>>>>> are the
>>>>> same.
>>>>>
>>>>> This can be done as a follow-up patch.
>>>> Given that this driver isn't going to be reused by older pre-Tegra210
>>>> SoCs, perhaps it will also be worthwhile to name it as tegra210-vi or
>>>> tegra210-video.
>>> Can you explain what do you meant by can't be reused for pre-tegra210
>>> or for tegra186/194?
> It looks to me that at least all those hardcoded HW format IDs do not
> match the older SoCs.

TPG hard coded formats are supported on prior Tegra.

Other supported formats are SoC dependent and=C2=A0 part of soc data in the=
=20
driver already.

>>> support for other tegra's can be added to same tegra-video driver.
>>> tegra-video host1x driver can be updated to add other tegra's vi and
>>> csi compatibles to host1x subdevs and vi and csi driver can be updated
>>> to add other tegra soc data and need to add coresponding
>>> tegra186/194/xxx.c file with tegra specific prog sequence
>>>
>> Same tegra-video.ko can be used for all tegra soc as driver supports
>> adding other soc related as well.
> Well, I'm still not sure why you would want to have all the unnecessary
> code of a different SoCs shared within the same kernel module, it will
> be quite be a lot wasted space in comparison to a used part of the driver=
.
>
> The driver will need to have a bit better separation if it's supposed to
> have a common core for all SoCs. Each incompatible VI/CSI hardware
> version should have its own kernel module.

currently other Tegra host1x driver (drm) also does similar. Single=20
module for all Tegra SoCs.

With current tegra-video, all the v4l2 related common part of=20
implementation is same for all tegra's and only=20
tegra210.c/tegra186.c/tegra194.c will have corresponding tegra soc=20
specific vi/csi programming sequence.

>> Also was thinking instead of renaming media/tegra as media/tegra-vi,
>> probably we can rename as media/tegra-video so it will be inline with
>> module name we already chosen and also mainly we have vi and csi with in
>> that so instead of tegra-vi probably we can use media/tegra-video?
> The tegra-video should be okay, although the "video" part sounds a bit
> too broad since video could mean a lot of things. I think downstream
> kernel uses (or at least used) the tegra-camera name for the driver,
> perhaps it could be a reasonable variant as well.
prior feedback suggests not to use camera variant instead to use video
