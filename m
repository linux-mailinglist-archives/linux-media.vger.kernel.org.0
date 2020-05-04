Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 459871C3F1D
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 17:55:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729540AbgEDPz2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 11:55:28 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:14053 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729529AbgEDPz2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 May 2020 11:55:28 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5eb03a700000>; Mon, 04 May 2020 08:53:20 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Mon, 04 May 2020 08:55:28 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Mon, 04 May 2020 08:55:28 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 4 May
 2020 15:55:28 +0000
Received: from [10.2.165.119] (172.20.13.39) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 4 May 2020
 15:55:26 +0000
Subject: Re: [RFC PATCH v11 6/9] media: tegra: Add Tegra210 Video input driver
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <helen.koike@collabora.com>
CC:     <sboyd@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1588197606-32124-1-git-send-email-skomatineni@nvidia.com>
 <1588197606-32124-7-git-send-email-skomatineni@nvidia.com>
 <bacc4308-4b95-f566-b80e-096ff96407b5@gmail.com>
 <4da289e6-036f-853b-beb4-379d6462adb0@gmail.com>
 <c6d54885-6f23-f60c-a17b-3481fc4d6adf@gmail.com>
 <b14b9dc5-7ac9-7735-d98d-eebc7e151cba@nvidia.com>
 <7d31d24f-f353-7e82-3ff9-cdba8b773d1e@nvidia.com>
 <06a4a067-8d54-4322-b2a6-14e82eaeda29@nvidia.com>
 <47873bbd-cf90-4595-5a99-7e9113327ecc@nvidia.com>
 <f6088e0f-4ac7-a6be-3ede-0233dc88ef2c@nvidia.com>
 <71532440-f455-cc24-74f7-9ccad5947099@gmail.com>
 <960d2715-a717-0cc3-df19-ff78dc426535@nvidia.com>
 <23520fa4-4d8f-b083-0ad3-b249339ee032@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <d74df9cd-f256-f215-ae78-3c31d6754641@nvidia.com>
Date:   Mon, 4 May 2020 08:56:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <23520fa4-4d8f-b083-0ad3-b249339ee032@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1588607600; bh=inT5Kwq5fLKQOMa7wX4038NLS0luRlAH5Jiof0DA9jw=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=jXirWH8Ithxt07Hyz/8Cmz31T68tCIVi9k49c/ozfC3zmP7y60GKQgYnKMuvzXvNV
         BMUTO6oZwPJSPgd9hg2FPOpnkNrolhsqUrRtbn150JF3Y4ousGcE+uOSPJjLYNBC+V
         9sm3xil/bKykE5B7YGtFyawSxHB73sNmcD79DiCCGRWL33XIEgd0WWn06Zp6NTUg9c
         OBT0ErCkyVfZM/theiVM/fytmWZ5jy5wDiPxOCfMcj3BjbHIiwVTZnvOM+JwzIlSOv
         In5tYm2v85ZAH/YUvBz2IdT26IMMlbIH783KHOTLlu4tUgXgr91l3ym7QLsJERHDgb
         DDF1eRtrYPMCA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 5/4/20 8:53 AM, Dmitry Osipenko wrote:
> 04.05.2020 17:53, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 4/30/20 12:33 PM, Dmitry Osipenko wrote:
>>>>>> Hi Dmitry,
>>>>>>
>>>>>> Will update in v12 to not allow freeze in middle of a frame capture.
>>>>>>
>>>>>> Can you please confirm on above if you agree to allow freeze to
>>>>>> happen in b/w frame captures?
>>>>>>
>>>>>> Also as most feedback has been received from you by now, appreciate
>>>>>> if you can provide all in this v11 if you have anything else so we
>>>>>> will not have any new changes after v12.
>>> I'll take another look tomorrow / during weekend and let you know.
>> Hi Dmitry,
>>
>> Will send v12 if there is no more feedback. Please let me know.
> Hello Sowjanya,
>
> I don't have any more comments to add, looking forward to v12.
Thanks Dmitry
