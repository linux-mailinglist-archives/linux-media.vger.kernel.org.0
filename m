Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6A731A158E
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2020 21:06:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726867AbgDGTGC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Apr 2020 15:06:02 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:14419 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726719AbgDGTGB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Apr 2020 15:06:01 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e8ccf0c0000>; Tue, 07 Apr 2020 12:05:48 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 07 Apr 2020 12:06:01 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 07 Apr 2020 12:06:01 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 7 Apr
 2020 19:06:00 +0000
Received: from [10.2.171.175] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 7 Apr 2020
 19:05:59 +0000
Subject: Re: [RFC PATCH v6 6/9] media: tegra: Add Tegra210 Video input driver
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <helen.koike@collabora.com>
CC:     <sboyd@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
 <1585963507-12610-7-git-send-email-skomatineni@nvidia.com>
 <40102767-ecdb-e958-66f4-45d11464069c@gmail.com>
 <b7b77258-6309-7ed2-489d-337cf273ba1e@nvidia.com>
 <6014fee9-ce97-7ced-f2ba-82176b8b36db@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <55ca95a0-41d9-a071-ab9d-08d26b3f8698@nvidia.com>
Date:   Tue, 7 Apr 2020 12:05:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <6014fee9-ce97-7ced-f2ba-82176b8b36db@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1586286348; bh=7t/2hBzkGE2FuWGhPFMgSIueDjtcOTTLwFTzLicufH0=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=M8VtUxkwY4lt7B0+68GJzxSBImPxb9H/gfjuA+dKsjvSpuoQavo9IR3cdWt2JMBrG
         HKdD1OGl3acnmDWMe9ZPflMVWi9J8wsjbl6+KRBvFhQhUZeMbfWExwhyedr5bWJZvX
         akWNxOPL2ufAyt/bybX4OMkPnA3okeZzehS6b0KfVR0FRJkk8wPXtw6AQ2JUGMvZzu
         h1P8qm+PcfnTL+KvhW/inCEftVsuWkW0xsuhzH4wpmpYQQu+TcAw+HhVOktgMHBFj8
         hKx62HbzhxQu2zL/zVFrabC/J1Suce7z3p6Z1lQ+oOF3C5dZMdRYM/H3/e+Oko7ccq
         K/L2d7j1BudTA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/6/20 9:11 AM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 06.04.2020 18:41, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 4/5/20 2:11 PM, Dmitry Osipenko wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> 04.04.2020 04:25, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> ...
>>>> +static int tegra_vi_tpg_channels_alloc(struct tegra_vi *vi)
>>>> +{
>>>> +     struct tegra_vi_channel *chan, *tmp;
>>>> +     unsigned int port_num;
>>>> +     unsigned int nchannels =3D vi->soc->vi_max_channels;
>>>> +     int ret =3D 0;
>>>> +
>>>> +     for (port_num =3D 0; port_num < nchannels; port_num++) {
>>>> +             /*
>>>> +              * Do not use devm_kzalloc as memory is freed immediatel=
y
>>>> +              * when device instance is unbound but application
>>>> might still
>>>> +              * be holding the device node open. Channel memory
>>>> allocated
>>>> +              * with kzalloc is freed during video device release
>>>> callback.
>>>> +              */
>>>> +             chan =3D kzalloc(sizeof(*chan), GFP_KERNEL);
>>> Why anyone would want to unbind this driver in practice?
>>>
>>> I think it should make more sense to set suppress_bind_attrs=3Dtrue.
>>  From the previous feedback of patch series, we need to support
>> unbind/bind and looks like this driver should also support to built as a
>> module.
> If module unloading is also affected, then perhaps you should use
> get/put_device() to not allow freeing the resources until they're still
> in-use.
>
> I suppose that it should be up to the V4L core to keep the device alive
> while needed, rather than to put the burden to the individual drivers.

Hans/Thierry, Can you please comment on this?

