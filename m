Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09B23191BA5
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2020 22:04:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727937AbgCXVEo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Mar 2020 17:04:44 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:8513 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727160AbgCXVEo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Mar 2020 17:04:44 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e7a75de0000>; Tue, 24 Mar 2020 14:04:30 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 24 Mar 2020 14:04:43 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 24 Mar 2020 14:04:43 -0700
Received: from [10.2.160.81] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 24 Mar
 2020 21:04:42 +0000
Subject: Re: [RFC PATCH v5 9/9] arm64: tegra: Add Tegra VI CSI support in
 device tree
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <helen.koike@collabora.com>
CC:     <sboyd@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1584985955-19101-1-git-send-email-skomatineni@nvidia.com>
 <1584985955-19101-10-git-send-email-skomatineni@nvidia.com>
 <672819ea-01d3-2eca-8bb7-84ffd64256d4@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <a218142f-295e-6bd5-b1d7-47d9ab8eba3e@nvidia.com>
Date:   Tue, 24 Mar 2020 14:04:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <672819ea-01d3-2eca-8bb7-84ffd64256d4@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1585083870; bh=Jw74m552tkhq3CDH0HzPuxcv0/HVM2uSanL+YVCFqAI=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=FjmjOIFjIJyyES0zkDgAnNtuUa/HTvrK+JEzJqWCHEncYg+7Wgs2yeM6jtjhMlA4l
         x1rZOhZcpGUc/YUtfxBi7huUy3zHCllGBOT33L5Eogt2fM2CWB9A/qtybX/LZcpO9N
         1lEZ/VahTuu6pWj0rjwX1rZtmFjXSKGQzcGAFvLlK/obRWKFVlX5kx3yVqTu8UB+Ne
         w3AkxsjVT0BXCrV8rUk06VqM/xSZ5MyjgHSQKhqMK3B0JejaVPQdmL73im+sP+Supn
         ghhur0AM6S7e4TowUeh47qGaZbN4WxjTvQ2Lf4K1vvUtnkIE/dqtqEa8HzCMnrTReO
         d8tmkCLuOFnew==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 3/24/20 12:19 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 23.03.2020 20:52, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
>> +                     pd_venc: venc {
>> +                             clocks =3D <&tegra_car TEGRA210_CLK_VI>,
>> +                                      <&tegra_car TEGRA210_CLK_CSI>;
>> +                             resets =3D <&mc TEGRA210_MC_RESET_VI>,
> The MC resetting should be needed only for a hardware hot-resetting. It
> should be wrong to add it to the power domain.
TRM recommends to do MC client hot-reset during VE power gate and ungate.
>
>> +                                      <&tegra_car TEGRA210_RST_VI>,
>> +                                      <&tegra_car TEGRA210_CLK_CSI>;
>> +                             #power-domain-cells =3D <0>;
>> +                     };
>>                };
