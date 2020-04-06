Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59F5E19F90C
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 17:41:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729044AbgDFPlc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 11:41:32 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:8227 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726723AbgDFPlb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 11:41:31 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e8b4d450000>; Mon, 06 Apr 2020 08:39:49 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 06 Apr 2020 08:41:30 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 06 Apr 2020 08:41:30 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 6 Apr
 2020 15:41:30 +0000
Received: from [10.2.164.193] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 6 Apr 2020
 15:41:29 +0000
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
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <b7b77258-6309-7ed2-489d-337cf273ba1e@nvidia.com>
Date:   Mon, 6 Apr 2020 08:41:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <40102767-ecdb-e958-66f4-45d11464069c@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1586187589; bh=yaEffBsy3QjkHNhjq0LUVqspbBmXRTztsEwoU5cqhXY=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=UhuyLID18HHRqhwyeddyzNGO/WYE7hdtJAQ4IVcQfKq5mtaUAkjrezIfV6vonRB7S
         FKC03gRUrQHdm3V7EIBaz4Qjm2rlNoVz5je12uwC/KvmylAiNcE0QlOIeGJzzZWFeQ
         T3svN4g6UdJh+XlKVdWxBmx0g+X8KRZsUfykrs3RbLbx/vMtycBhBqFMNvYNMU2FXj
         DA744DeWWukiUhDzilOoyjo+VbIAOB6KBLwseOif4UnIsAwOLmk2KONGuag3lsA7zA
         XCeXJfdOYYY/wmkrK1J3rKQrxAI4jp68X+opCtLPzW2K1KcDhfDK/gsFMZH8FGHYDG
         FUoChbmg8bLHw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/5/20 2:11 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 04.04.2020 04:25, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
>> +static int tegra_vi_tpg_channels_alloc(struct tegra_vi *vi)
>> +{
>> +     struct tegra_vi_channel *chan, *tmp;
>> +     unsigned int port_num;
>> +     unsigned int nchannels =3D vi->soc->vi_max_channels;
>> +     int ret =3D 0;
>> +
>> +     for (port_num =3D 0; port_num < nchannels; port_num++) {
>> +             /*
>> +              * Do not use devm_kzalloc as memory is freed immediately
>> +              * when device instance is unbound but application might s=
till
>> +              * be holding the device node open. Channel memory allocat=
ed
>> +              * with kzalloc is freed during video device release callb=
ack.
>> +              */
>> +             chan =3D kzalloc(sizeof(*chan), GFP_KERNEL);
> Why anyone would want to unbind this driver in practice?
>
> I think it should make more sense to set suppress_bind_attrs=3Dtrue.

 From the previous feedback of patch series, we need to support=20
unbind/bind and looks like this driver should also support to built as a=20
module.

