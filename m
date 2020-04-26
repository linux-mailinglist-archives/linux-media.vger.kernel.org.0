Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 028A11B8A60
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2020 02:42:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726117AbgDZAmE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Apr 2020 20:42:04 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:6880 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbgDZAmE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Apr 2020 20:42:04 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ea4d8640001>; Sat, 25 Apr 2020 17:40:04 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Sat, 25 Apr 2020 17:42:03 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Sat, 25 Apr 2020 17:42:03 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 26 Apr
 2020 00:42:03 +0000
Received: from [10.2.165.152] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 26 Apr
 2020 00:42:02 +0000
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
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <658c4232-94d9-3051-8c93-bff7046cf5f2@nvidia.com>
Date:   Sat, 25 Apr 2020 17:41:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <50fd1016-ca8b-ec5d-e5a8-f257138b152e@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1587861604; bh=S6AJOOTE7QZmVPhFtn+qL83kShT56nLvLvdelSHHRhE=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=J4GeY0SJED0yA64Z30V9I7qmyTLjj1+Rxw5VSfI/kbjhm4jj1958zkuncz1n8Q1Ki
         VXDplP92tSQIhQyUsEf0syH5cN0waQDoy0W8KVqECkc30HwmHTintu12+sn8lTGHXf
         2/wWlsOGV0zSG15b207ZxZ5YzBh1c/pZMg8hzUIHGOoY3wZyM5Ldobxlqa5faiqnbd
         Zs8+63gUIU14DWwW25if4hNgGfUyjXkoaGdvy+X0UVf++oc3RcX5L4QTz8eBm+WbMv
         DkNOFPwzfB8Jt0yoh/RMbwXeRkgR/Tlr2soV3/l+XElEvPJ/+P+SX1tbFof/MyHFCR
         f2VqdCSksperQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/25/20 5:36 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 25.04.2020 12:36, Hans Verkuil =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
>>> The media/tegra/ sounds a bit too generic, the media/tegra-vi/ path
>>> should better reflect the driver, IMO.
>>>
>>> It also should be better to name the compiled kernel module as tegra-vi=
,
>>> IMO.
>>>
>> The driver name and the directory should be in sync, so either tegra-vid=
eo
>> or tegra-vi for both. I have no preference myself, as long as they are t=
he
>> same.
>>
>> This can be done as a follow-up patch.
> Given that this driver isn't going to be reused by older pre-Tegra210
> SoCs, perhaps it will also be worthwhile to name it as tegra210-vi or
> tegra210-video.

Can you explain what do you meant by can't be reused for pre-tegra210 or=20
for tegra186/194?

support for other tegra's can be added to same tegra-video driver.=20
tegra-video host1x driver can be updated to add other tegra's vi and csi=20
compatibles to host1x subdevs and vi and csi driver can be updated to=20
add other tegra soc data and need to add coresponding tegra186/194/xxx.c=20
file with tegra specific prog sequence

