Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40BEA19FF18
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 22:31:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726339AbgDFUa6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 16:30:58 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:3420 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbgDFUa6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 16:30:58 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e8b91740000>; Mon, 06 Apr 2020 13:30:44 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 06 Apr 2020 13:30:57 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 06 Apr 2020 13:30:57 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 6 Apr
 2020 20:30:57 +0000
Received: from [10.2.164.193] (172.20.13.39) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 6 Apr 2020
 20:30:55 +0000
Subject: Re: [RFC PATCH v6 6/9] media: tegra: Add Tegra210 Video input driver
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <helen.koike@collabora.com>
CC:     <sboyd@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
 <1585963507-12610-7-git-send-email-skomatineni@nvidia.com>
 <38d921a7-5cdf-8d0a-2772-4399dd1a96a0@gmail.com>
 <9b8cf37b-d2ad-9df2-aad8-216c2c954e69@nvidia.com>
 <1a12974a-7cc7-2c3a-3995-076b9956714d@gmail.com>
 <66cc8646-43d3-3fc8-c31d-d0d2efac505f@nvidia.com>
 <f000f6b9-0f05-b2a5-6dad-37b09803711d@gmail.com>
 <fe6a17c1-fae2-a365-4dd6-6d3a25d47d54@nvidia.com>
 <9038ce90-ac53-93e7-ce65-57f6ff1e9b30@nvidia.com>
 <abe82fd1-0464-0627-6c97-39c896e53dd0@gmail.com>
 <36b5627a-8639-6244-8620-4f23828e0638@nvidia.com>
 <1c2c921e-daef-ba0f-5d1a-b58aa0b940fb@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <0227d65f-283a-1488-a48c-7bab600eae35@nvidia.com>
Date:   Mon, 6 Apr 2020 13:30:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1c2c921e-daef-ba0f-5d1a-b58aa0b940fb@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1586205044; bh=0vZEk85Vg56RxWijmzQRA6aIsEox1RyZFjAxmqiMRB4=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=ioqBGee5d2qpNf7vj9oa4ged4b+xJySiTDRV3wcYZ6naYvuvRF/WoBP6HSfUp1zIF
         dohT6d+9F8QuQwR76fSQ1HCsLmQFvIF4CVh6Cv237p2nUZV1W7oW8OodQ21LXcDbyg
         7+8VXSne8vS8xvkx4wSfD8FoZVyiZFB9uO/GP0VdwFdp6VZRBO/R6vGz6hiL12XyPA
         S++6tMNGeBu34k7qIWxoV26p4nfI3VcuqJeMgrc7jr2rG0CkelQ63JOcqxfoSr/V5W
         BBmMjQrIQLOZcCXDpZL9f/bC20B5vVdSWxqqfjytz+b6jc6SfUCnL9RUOJyWhWTRI5
         5WU9B7uoRgF8g==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/6/20 1:28 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 06.04.2020 23:05, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ..
>>>> Wait time for HW syncpt to reach threshold is tuned to work for all
>>>> frame rates. So if increment doesn't happen by then, its definitely
>>>> missed event.
>>> This is questionable. Technically, speculating about whether the tuned
>>> value is good for all possible cases is incorrect thing to do.
>>>
>>> Although, I guess in practice it should be good enough for the starter
>>> and could be improved later on, once the host1x driver will be improved=
.
>> By tuned value I meant about 200ms wait timeout for frame event to
>> happen is what we have been using in downstream and with BSP release
>> images which works good for all sensors and bridges we supported so far.
> I don't know anything about the state of today's downstream, but
> downstream of older Tegra SoCs was pretty awful in regards to the host1x
> syncing, unfortunately it was borrowed into the upstream host1x years
> ago and nothing was done about it so far. I'd suggest to be careful
> about it.
200ms timeout we wait for event to happen is the case even with=20
T186/T194 as well and internally it was tuned from lots of testing with=20
various sensors and frame rate computations which is known to work good.
