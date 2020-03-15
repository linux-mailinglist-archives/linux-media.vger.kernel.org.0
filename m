Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA6EF186037
	for <lists+linux-media@lfdr.de>; Sun, 15 Mar 2020 23:21:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729284AbgCOWVF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Mar 2020 18:21:05 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:3021 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729213AbgCOWVF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Mar 2020 18:21:05 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e6eaa200000>; Sun, 15 Mar 2020 15:20:16 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Sun, 15 Mar 2020 15:21:04 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Sun, 15 Mar 2020 15:21:04 -0700
Received: from [10.2.175.141] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 15 Mar
 2020 22:21:03 +0000
Subject: Re: [RFC PATCH v4 8/8] arm64: tegra: Add Tegra VI CSI support in
 device tree
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <helen.koike@collabora.com>, <sboyd@kernel.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <1584236766-24819-1-git-send-email-skomatineni@nvidia.com>
 <1584236766-24819-9-git-send-email-skomatineni@nvidia.com>
 <b4bbcc1d-d38c-14c5-7205-2f7657ab8712@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <80805c85-a6b0-62c4-877c-6af3831bce1d@nvidia.com>
Date:   Sun, 15 Mar 2020 15:21:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <b4bbcc1d-d38c-14c5-7205-2f7657ab8712@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1584310816; bh=+e0QisX1Z4jXTDX4Ud8ppSbrPDDTZh9nrZyl/tz1gm0=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=SdjV7v5ZXAJPdwkJv7XrI0jhiPGdHft7NiD4UZhm5/pqMPz24r8XNJp8Yihv0QJAf
         QKU2dskuAFdRY63eiMV4yG6PWEnK5NIiKl08W1PsGE0f3LzkLtUF1VNkDGlEZpBZtM
         Tpc70Jc58zjcsMcAIDyWMPpz1ViDNZSOP8VWfVq6xX1qGJsqykua3J7vHG4u50RLf2
         JpQr/Sd3x3nQHuIPY2jWU90j7Y7utSNQnkEjJGXEssCUYC4OMMD9JxFdyZi7qBpCq9
         rojX94Td42GK0Mj7vykmBBrfqP21yQ7HvEoHLmwhKYodalibnrxOHCSgyUNKo8LK8I
         T/QlxbfzkkzSw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 3/15/20 5:54 AM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 15.03.2020 04:46, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Tegra210 contains VI controller for video input capture from MIPI
>> CSI camera sensors and also supports built-in test pattern generator.
>>
>> CSI ports can be one-to-one mapped to VI channels for capturing from
>> an external sensor or from built-in test pattern generator.
>>
>> This patch adds support for VI and CSI and enables them in Tegra210
>> device tree.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
> Hello Sowjanya,
>
> ...
>> +
>> +                     pd_venc: venc {
>> +                             clocks =3D <&tegra_car TEGRA210_CLK_VI>,
>> +                                      <&tegra_car TEGRA210_CLK_CSI>;
>> +                             resets =3D <&tegra_car 20>,
> What is the clock #20?

Hi Dmitry,

20 is VI_RST not defined in include/dt-bindings/reset/tegra210-car.h

Will add define and will fix to use it.



>> +                                      <&tegra_car TEGRA210_CLK_CSI>,
>> +                                      <&mc TEGRA210_MC_RESET_VI>;
> Does this order means that memory controller will be reset *after*
> resetting the CSI/VI hardware? This is incorrect reset sequence.
>
> The memory controller reset should be kept asserted during of the time
> of the hardware resetting procedure.
>
> The correct sequence should be as follows:
>
> 1. Assert MC
> 2. Reset VI
> 3. Deassert MC
Right, will fix order. Thanks
