Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A44581B89FB
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2020 01:28:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726362AbgDYX2H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Apr 2020 19:28:07 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:5569 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726271AbgDYX2H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Apr 2020 19:28:07 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ea4c70f0000>; Sat, 25 Apr 2020 16:26:07 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Sat, 25 Apr 2020 16:28:06 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Sat, 25 Apr 2020 16:28:06 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 25 Apr
 2020 23:28:06 +0000
Received: from [10.2.165.152] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 25 Apr
 2020 23:28:05 +0000
Subject: Re: [RFC PATCH v10 6/9] media: tegra: Add Tegra210 Video input driver
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <helen.koike@collabora.com>
CC:     <sboyd@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1587700513-28449-1-git-send-email-skomatineni@nvidia.com>
 <1587700513-28449-7-git-send-email-skomatineni@nvidia.com>
 <fd5300fd-33af-babe-95d0-9669b66a8c06@gmail.com>
 <2983577f-fec9-f24c-0563-6d1f0e1dd5d8@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <32e30b7f-865b-282e-5e19-e4c8cf217e63@nvidia.com>
Date:   Sat, 25 Apr 2020 16:27:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <2983577f-fec9-f24c-0563-6d1f0e1dd5d8@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1587857167; bh=k0BxiokrF/2M0NnlajINaEcvm90VbfOjizpL77vDiIQ=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=rjwDQdVmVcSpIMmhzEwFsPUPfI9a9YvIVMIafrnk9wNwv6kaiB7sIE7oyz86FkT+L
         bNkl+s19YYd3LwLcz1GH8EMN4WXxStosZY3xi4bdTJ3NnEH5M5fCZDusxOfvFcps9p
         7bJLaoiphQ3TlvM6CTkEpOI2gqLAaExtORs6GC/F/+BoNqbiHVp8zM/95KTw5i4JDy
         7Jxdx7pXu5U+Pl8vtqdfTPqf7hdCaP0tGCn3Zd4DNSgg0TwlnPaqatbV8OARusPwQ/
         DjoURTC+9M27dn4QsYiU1SGEsIO/uxMUcMY+ByU/NqnG7QZj8BihYxrQpr8PcVa9sv
         tauuUmWdr+FbA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/25/20 4:25 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 26.04.2020 02:13, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> 24.04.2020 06:55, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> +static int __maybe_unused vi_runtime_resume(struct device *dev)
>>> +{
>>> +    struct tegra_vi *vi =3D dev_get_drvdata(dev);
>>> +    int ret;
>>> +
>>> +    ret =3D regulator_enable(vi->vdd);
>>> +    if (ret) {
>>> +            dev_err(dev, "failed to enable VDD supply: %d\n", ret);
>>> +            return ret;
>>> +    }
>>> +
>>> +    ret =3D clk_set_rate(vi->clk, vi->soc->vi_max_clk_hz);
>>> +    if (ret) {
>>> +            dev_err(dev, "failed to set vi clock rate: %d\n", ret);
>>> +            goto disable_vdd;
>>> +    }
>> Isn't setting clock rate using assigned-clocks in a device-tree enough?
>> Could you please clarify why this vi_max_clk_hz is needed?
>>
> In that case it should be wrong to set the clock rate in the RPM
> callback because RPM works asynchronously and RPM may not be suspended
> on TGP -> sensor source switch.

Driver will not do TPG and Sensor switch dynamically.

Based on kconfig, it will only do TPG or Sensor and sensor will be=20
default all the time once sensor support is added in next series.

