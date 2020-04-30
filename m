Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41AB11C0706
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2020 21:53:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726816AbgD3TxO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Apr 2020 15:53:14 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:10134 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726436AbgD3TxO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Apr 2020 15:53:14 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5eab2c660003>; Thu, 30 Apr 2020 12:52:06 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 30 Apr 2020 12:53:13 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 30 Apr 2020 12:53:13 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 30 Apr
 2020 19:53:04 +0000
Received: from [10.2.165.152] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 30 Apr
 2020 19:53:03 +0000
Subject: Re: [RFC PATCH v11 6/9] media: tegra: Add Tegra210 Video input driver
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <helen.koike@collabora.com>
CC:     <sboyd@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1588197606-32124-1-git-send-email-skomatineni@nvidia.com>
 <1588197606-32124-7-git-send-email-skomatineni@nvidia.com>
 <34a49a30-71f2-5b24-20a4-7d98ae37cefa@gmail.com>
 <1b23178b-0e5c-c97e-434c-f9cc3c02805b@nvidia.com>
 <ebfb532b-bcd2-f356-49e0-e4d72d0db933@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <9b2b36ad-82cb-bcf6-24d6-3533b51918c8@nvidia.com>
Date:   Thu, 30 Apr 2020 12:51:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <ebfb532b-bcd2-f356-49e0-e4d72d0db933@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1588276326; bh=YGHHf9FqhJUSc/izYrsM7kJipcRMrjm3r41ZO5HxE7U=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=A3x0Mf4xuUyXXBzN+BVHVOzIlC/+1KQzA9+TVaNB6MZFEzC3+TPfBBFd+7IsoZvHi
         EIsASEXuAQTh6ITQDAaPM+fRL+OGqmdHflmV/P0PoL/ade0a5twYh5s4EITIYrTGQG
         WSWzU692tZGgVXd6C6Lr9YXjUnjxnH8gGmIColYdDY/nwJ/MNwo6MMyk6wkTqOAmeK
         BipjTt+MBuPqcbEm+qadPkCj+k6iUP6pviCMfqZ5w4lQbKNwWlGE0dERmKjtZN9uOT
         v1MRDttwZvhCWXd55KZdIlDCTXsjJxRAa1h5NzCxix/6tgVUgaYZ2OY9IwAFu7SJxj
         Ian0977At6n7Q==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/30/20 12:47 PM, Dmitry Osipenko wrote:
> 30.04.2020 22:32, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 4/30/20 6:38 AM, Dmitry Osipenko wrote:
>>> 30.04.2020 01:00, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> +/**
>>>> + * struct tegra_csi_ops - Tegra CSI operations
>>>> + *
>>>> + * @csi_streaming: programs csi hardware to enable or disable
>>>> streaming.
>>>> + * @csi_err_recover: csi hardware block recovery in case of any
>>>> capture errors
>>>> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 due to missing source st=
ream or due to improper csi input
>>>> from
>>>> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the external source.
>>>> + */
>>>> +struct tegra_csi_ops {
>>>> +=C2=A0=C2=A0=C2=A0 int (*csi_streaming)(struct tegra_csi_channel *csi=
_chan, u8
>>>> pg_mode,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 int enable);
>>> What about to split csi_streaming() into csi_start_streaming() /
>>> csi_stop_streaming()?
>>>
>>> This will make tegra_csi_ops to be consistent with the tegra_ve_ops. A
>>> separated start/stop operations are somewhat more natural to have in
>>> general.
>> vi ops is for vb2_ops which has separate start/stop so has seperate
>> start/stop for vi ops.
>>
>> csi is subdev and csi ops is for v4l2_subdev_ops which as s_stream
>> callback only.
>>
>> So, created single stream function for csi to match same as subdev_ops.
> It will be nicer to have separate ops for CSI, regardless of the
> subdev_ops. It should be okay to have a single-combined ops if CSI
> start/stop was trivial, but it's not the case here.
>
> For example, the pm_runtime_put() shouldn't be invoked if stream's
> stopping fails. The stopping can't fail for the current code, but this
> could change in the future.
>
> You could make csi_streaming to return void, telling explicitly that
> this code can't fail. Then the combined OPS should be okay to have.

we don't return anything for stop stream. OK can make it split to=20
explicitly specify no return code during stop stream.

will split this in v12

