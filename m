Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAB5C1B8A48
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2020 02:24:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726125AbgDZAYs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Apr 2020 20:24:48 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:4126 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726070AbgDZAYr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Apr 2020 20:24:47 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ea4d4c20000>; Sat, 25 Apr 2020 17:24:34 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Sat, 25 Apr 2020 17:24:47 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Sat, 25 Apr 2020 17:24:47 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 26 Apr
 2020 00:24:46 +0000
Received: from [10.2.165.152] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 26 Apr
 2020 00:24:45 +0000
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
 <f3a122b9-3600-b1eb-be4f-39be79d979a5@nvidia.com>
 <5a6f61c6-2049-fb61-3a80-e729708b3fb8@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <94d6d159-950a-ee78-05a2-c37fb8fb9873@nvidia.com>
Date:   Sat, 25 Apr 2020 17:24:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <5a6f61c6-2049-fb61-3a80-e729708b3fb8@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1587860674; bh=hb53MB8otx0fgIwAwPT0XxRe4kRtoWZiaHC1vuSyd1Y=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=WwVtLuFRIaUN9TOqgp156qFxIqiROwu+5FBT3XXYfQ96kVxvwcs8LpXTXqIvEKVIY
         iXD/sQFsA0O+TyR8azb0OGo+klXxftPf4XNgBDIovY416GQSeY22rIKN5riJBZ7ZCS
         QJam55oiShxaQyGNF0J2DihQYXCUFxqYEpdwxxdXdV6zPrgB9UQgWiF4HVGf7fwm0R
         373DGsnUj33v7Hz5SeFIZNAAKXXWtcGLflGw67nLgu2XTktIslC4BL9odx/DEmbBuz
         /AplL9HJATkFzMFyF3cJqMyHMs+LcBnKlUXXMRVo6wHLDI6G+Ptw1joI4goLoHewo5
         rLIAoKpbaXSZw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/25/20 5:19 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 26.04.2020 02:44, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
>>> How much of the T210 code could be reused by T186/194?
>> vi/csi are common driver where soc structure should be populated for
>> T186/T194
>>
>> Tegra210.c can't be reused for Tegra186/t194 as programming seq is a
>> whole lot diff
>>
> How are you going to separate Tegra210/186/194 drivers from each other?
> I don't think you'll want to have one "fat" driver that covers all those
> SoCs, won't you?
>
> In the end it should be three modules: tegra210-video.ko
> tegra186-video.ko tegra194-video.ko.
>
> Using a per-SoC OPS doesn't allow you to do that because the "root"
> driver will have to lookup OPS' code symbols of every SoC, and thus, the
> unwanted driver modules will get auto-loaded if you'll try to factor out
> the OPS into a separate driver modules.

tegra-video driver will be common for t210/186/194

we add corresponding compatibles to tegra-video and vi/csi drivers along=20
with that need to add tegra186_vi_soc, tegra194_vi_soc and implement=20
tegra186.c/tegra194.c

tegra-video driver updated for later tegra include updating drivers list=20
and subdevs list to add t186/t194 compatibles



