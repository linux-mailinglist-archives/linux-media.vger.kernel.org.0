Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78E7C1AB208
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 21:52:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441875AbgDOTvw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Apr 2020 15:51:52 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:10177 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406367AbgDOTvk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Apr 2020 15:51:40 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e97655b0000>; Wed, 15 Apr 2020 12:49:47 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Wed, 15 Apr 2020 12:51:37 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Wed, 15 Apr 2020 12:51:37 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 15 Apr
 2020 19:51:36 +0000
Received: from [10.2.171.241] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 15 Apr
 2020 19:51:35 +0000
Subject: Re: [RFC PATCH v7 6/9] media: tegra: Add Tegra210 Video input driver
To:     Dmitry Osipenko <digetx@gmail.com>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <frankc@nvidia.com>, <hverkuil@xs4all.nl>, <sakari.ailus@iki.fi>,
        <helen.koike@collabora.com>, <sboyd@kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <1586919463-30542-1-git-send-email-skomatineni@nvidia.com>
 <1586919463-30542-7-git-send-email-skomatineni@nvidia.com>
 <4118112f-f865-5460-6319-d71271fd78d1@gmail.com>
 <a69a8b34-beea-3ad0-e08e-f7df8b9e7047@nvidia.com>
 <6afa951e-d904-f3c0-053f-82a02fb18979@nvidia.com>
 <b1c78827-13ea-0c94-a575-97b5afc0ede1@nvidia.com>
 <5954a7e1-910e-7f48-56d3-e671b56ead74@nvidia.com>
 <d6a9e07c-474a-a076-8313-32f5f4ca8d64@nvidia.com>
 <786949a9-8507-7723-f29b-b91a216bfd28@nvidia.com>
 <f831408b-bbf4-3047-20e3-5bebfa9fc1ad@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <2ad9352f-cb65-1643-e540-a21f9c570266@nvidia.com>
Date:   Wed, 15 Apr 2020 12:51:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f831408b-bbf4-3047-20e3-5bebfa9fc1ad@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1586980187; bh=YmoGzPhSYhYGSWM5wgpNyYVYjJV4XWVyBHmrFTZns4A=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=EPWOSpRu7TsrjEd/ScsdhZxozGsUk37bS5oPWzI1MM/YA6irJ9u7NeG9BF7JQTPBx
         ZCpQXx/Fu/DvwCEu68r8L6meReI4ZmKxao2VBmu2ndU2q+oCbvg43Tl6WLq0bmTN9n
         WeG6Q3BVdAf/nkpqrKpW/ltQG2XMnpeUDkkn9c0tHPKFeFXXnFogTElu4eaD42zMKH
         zC8gaARqM7sEu5ojCgV49LZ/TntagOM6QBJwnCWTUMxzyEXc8Ngku8EfnvkVV8bMLF
         evNNeubKyN+hTRC6RQAAGihjeYch5ara8kXQbMVxqhtFAvmlT/WTvYiZE4lkhzRCVd
         f+K6faAr3Ca0w==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/15/20 12:21 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 15.04.2020 21:53, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
>>>>>>>> Have you tried to test this driver under KASAN? I suspect that
>>>>>>>> you just
>>>>>>>> masked the problem, instead of fixing it.
>> Tested with kmemleak scan and did not see any memory leaks
> You should get use-after-free and not memleak.
I don't see use-after-free bugs during the testing.

But as mentioned when direct vi/csi client driver unbind happens while=20
video device node is kept opened, vi driver remove will free vi=20
structure memory but actual video device memory which is part of=20
channels remains but list head gets lost when vi structure is freed.

So, when device node is released and executes release callback as list=20
head is lost it can't free allocated channels which is not good.

This happens only with direct host1x client vi/csi driver unbind.

Need to find better place to free host1x client driver data structure to=20
allow direct client driver unbind->bind.

