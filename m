Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA74E1B8BE6
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2020 06:24:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726131AbgDZEXu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Apr 2020 00:23:50 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:2031 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725979AbgDZEXu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Apr 2020 00:23:50 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ea50c940003>; Sat, 25 Apr 2020 21:22:45 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Sat, 25 Apr 2020 21:23:49 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Sat, 25 Apr 2020 21:23:49 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 26 Apr
 2020 04:23:48 +0000
Received: from [10.2.165.152] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 26 Apr
 2020 04:23:48 +0000
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
 <99a5c82a-bd84-5c80-e6d7-7b6f2858aa78@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <8c4f5e88-b47a-6b5c-b579-1b28be19feb5@nvidia.com>
Date:   Sat, 25 Apr 2020 21:23:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <99a5c82a-bd84-5c80-e6d7-7b6f2858aa78@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1587874965; bh=kYrleJVCmR2hU5ZLnRdh4ugBfBt80Fuh+Z9062SgVHU=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=CkafEwoOfR629GEZLhuqmipmbtJ07vZQz4WCLz0/j5kI7CO9xE58jEiTjhw1DEpZV
         Hw3rBHMD5z99ZZyXuAabu36B1xunnX8egUurwXGz3i7xuVQ6daSsLaPW2vDpM3owWR
         8CcN+3yo4IQjBmBwQffRNmGwllttJwqJ5bniVYU4rGkayZZVS+DeSa7qE5Z5Mxe856
         qqZ2ce1/9Ry840xauirpWjUE2JKayFdIEqV+0A7x4qcHap64k6pn2CDxI7MGoNuLVi
         nbIVQCzB3N4zsH7r6zlRCLZ4Rj1jtpqC3Ckto33I0tZsygIRNIunFK4ywz32JMpsOK
         218ydUM/A6IbA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/25/20 7:19 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 26.04.2020 05:10, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
>>> currently other Tegra host1x driver (drm) also does similar. Single
>>> module for all Tegra SoCs.
>> DRM driver has a proper separation of the sub-drivers where sub-driver
>> won't load on unsupported hardware. The tegra-video driver should do the
>> same, i.e. VI and CSI should be individual drivers (and not OPS). There
>> could be a some common core, but for now it's not obvious to me what
>> that core should be, maybe just the video.c.
> Maybe video.c csi.c vi.c could be moved into a separate module, somewhat
> like a common driver framework. Then the individual CSI/VI drivers will
> use those common helpers.. Just a quick thought.

structure of driver is based on prior feedback.

How about instead of re-structuring whole driver again, probably we can=20
use conditional compatibles and also corresponding tegra210.o in=20
Makefile based on ARCH_TEGRA?

#if defined(CONFIG_ARCH_TEGRA_210_SOC)
 =C2=A0=C2=A0=C2=A0 { .compatible =3D "nvidia,tegra210-vi", .data =3D &tegr=
a210_vi_soc },
#endif


