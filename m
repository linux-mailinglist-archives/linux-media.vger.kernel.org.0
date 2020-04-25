Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71A641B8A14
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2020 01:44:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726188AbgDYXoY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Apr 2020 19:44:24 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:5866 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726070AbgDYXoX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Apr 2020 19:44:23 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ea4cae00000>; Sat, 25 Apr 2020 16:42:24 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Sat, 25 Apr 2020 16:44:23 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Sat, 25 Apr 2020 16:44:23 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 25 Apr
 2020 23:44:23 +0000
Received: from [10.2.165.152] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 25 Apr
 2020 23:44:21 +0000
Subject: Re: [RFC PATCH v10 6/9] media: tegra: Add Tegra210 Video input driver
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <helen.koike@collabora.com>
CC:     <sboyd@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1587700513-28449-1-git-send-email-skomatineni@nvidia.com>
 <1587700513-28449-7-git-send-email-skomatineni@nvidia.com>
 <3155e0d2-94b0-6e0a-bf35-b3560c201039@gmail.com>
 <fffc09d1-a25f-2d6e-83bd-f7657dd2ff16@nvidia.com>
 <e5602c48-a73e-8e71-188d-6a53ebf8e4a4@gmail.com>
 <f6d62dde-9ab5-7001-0ff4-93ed70cb207f@nvidia.com>
 <6568af00-3d65-4ddb-f003-7a4161d751a0@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <f3a122b9-3600-b1eb-be4f-39be79d979a5@nvidia.com>
Date:   Sat, 25 Apr 2020 16:44:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <6568af00-3d65-4ddb-f003-7a4161d751a0@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1587858144; bh=PiLaNp0bCg78WuOfTnePbhKvbw4eCJtNxZvWa9U+pnU=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=AdwbSH1QFw17nP9MW9B5o3x1LamyxnSbGvN0/w7vkDa/x9uOMnarvSZxFTCBmeFYD
         k6nMwRjbqav+w4LRL3Sy/UXQtsVb5idRSRi9XleV0oKqrd21v8+cAZxwc4buphC6wt
         bHxIcf/OCIzdhhFCN/ynnBAILZoAFNlnROlxoKgjykJerg8SW6qq4Q8yI1QzikKf3a
         unFtMejpr1pGtvxGcnSF0rLKxP2jFE4wi30irOW6HDd9VIAZdbOertvlIqrC/VOR1+
         BGkW4eKz7yBBTCBoTGgHShDahJZ5ZbPxda22PfLvgg9By/Bg7gDpOrHEbZjwi5r8u7
         xJe3ApYVBquIQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/25/20 4:40 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 26.04.2020 01:11, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 4/25/20 3:08 PM, Dmitry Osipenko wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> 25.04.2020 01:00, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> On 4/24/20 8:07 AM, Dmitry Osipenko wrote:
>>>>> External email: Use caution opening links or attachments
>>>>>
>>>>>
>>>>> 24.04.2020 06:55, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>>
>>>>> Is this driver compiled as a single kernel module file?
>>>>>
>>>>>> +MODULE_AUTHOR("Sowjanya Komatineni <skomatineni@nvidia.com>");
>>>>>> +MODULE_DESCRIPTION("NVIDIA Tegra CSI Device Driver");
>>>>>> +MODULE_LICENSE("GPL v2");
>>>>> ...
>>>>>> +MODULE_AUTHOR("Sowjanya Komatineni <skomatineni@nvidia.com>");
>>>>>> +MODULE_DESCRIPTION("NVIDIA Tegra Video Input Device Driver");
>>>>>> +MODULE_LICENSE("GPL v2");
>>>>> I don't think that these macros are needed in that case.
>>>>> The video.c should be enough, isn't it?
>>>> yes these can be removed
>>> It will be nice to factor out the Tegra210-specific VI/CSI OPS into a
>>> separate driver module (say tegra210-vi) to ease supporting of other
>>> Tegra versions. Of course this could be done later on, although I
>>> suppose the amount of hassle could be reduced if it's done from the
>>> start.
>> vi/csi.c are common drivers for all Tegras. All Tegra chip specific
>> related programming for both vi and csi were already moved to Tegra210.c
>> based on prior feedbacks.
> Judging by the code's structure the VI/CSI drivers aren't planned to be
> reused by older pre-Terga210 SoCs, correct?
>
> How much of the T210 code could be reused by T186/194?

vi/csi are common driver where soc structure should be populated for=20
T186/T194

Tegra210.c can't be reused for Tegra186/t194 as programming seq is a=20
whole lot diff

