Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7B4E1C0286
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2020 18:30:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726609AbgD3Qaa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Apr 2020 12:30:30 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:13064 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgD3Qa2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Apr 2020 12:30:28 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5eaafce10000>; Thu, 30 Apr 2020 09:29:21 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 30 Apr 2020 09:30:28 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 30 Apr 2020 09:30:28 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 30 Apr
 2020 16:30:28 +0000
Received: from [10.2.165.152] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 30 Apr
 2020 16:30:26 +0000
Subject: Re: [RFC PATCH v11 6/9] media: tegra: Add Tegra210 Video input driver
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <helen.koike@collabora.com>
CC:     <sboyd@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1588197606-32124-1-git-send-email-skomatineni@nvidia.com>
 <1588197606-32124-7-git-send-email-skomatineni@nvidia.com>
 <bacc4308-4b95-f566-b80e-096ff96407b5@gmail.com>
 <4da289e6-036f-853b-beb4-379d6462adb0@gmail.com>
 <c6d54885-6f23-f60c-a17b-3481fc4d6adf@gmail.com>
 <b14b9dc5-7ac9-7735-d98d-eebc7e151cba@nvidia.com>
Message-ID: <7d31d24f-f353-7e82-3ff9-cdba8b773d1e@nvidia.com>
Date:   Thu, 30 Apr 2020 09:29:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <b14b9dc5-7ac9-7735-d98d-eebc7e151cba@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1588264161; bh=2DroO8GJPT0AtZeSQK8ueROEdYIu6Ovs1ect3MjQzPE=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=sOWMM3UKIfeFYgOV3uLGzs75tw9iBGuZFODCZwKiHiL0dCOJKwlbBZuiVacayju7e
         27d2YHXn6JgrBPa+b3Hh61DgKBgkUmucxkOTNu8c+vgIAULPzB8dey7Yw/htsnhCCi
         sgpgv5qzEi2Xjxe45K2l7wKPHL30bR76787qy9sYYntYjM1k3MGUtvwlC2oBaqb24e
         T3cqJ8NssY3wetqt+VdP8KOmm25bnSyqK5rGV9hT8NdshtcuZqFpdbsfHCebZ31M2P
         +9bqvOZCh/SYfCppuNEApgaVu0DmUSJyW0MHRm1PjX133UeOdd26rXX75kPw9uNcGz
         6VU8iQUbmqIyA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/30/20 9:04 AM, Sowjanya Komatineni wrote:
>
> On 4/30/20 7:13 AM, Dmitry Osipenko wrote:
>> 30.04.2020 17:02, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> 30.04.2020 16:56, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> 30.04.2020 01:00, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>> +static int chan_capture_kthread_finish(void *data)
>>>>> +{
>>>>> +=C2=A0=C2=A0=C2=A0 struct tegra_vi_channel *chan =3D data;
>>>>> +=C2=A0=C2=A0=C2=A0 struct tegra_channel_buffer *buf;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 set_freezable();
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 while (1) {
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 try_to_freeze();
>>>> I guess it won't be great to freeze in the middle of a capture=20
>>>> process, so:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (list_empty(&chan->done)=
)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 try=
_to_freeze();
>>> And here should be some locking protection in order not race with the
>>> chan_capture_kthread_start because kthread_finish could freeze before
>>> kthread_start.
>> Or maybe both start / finish threads should simply be allowed to freeze
>> only when both capture and done lists are empty.
>>
>> if (list_empty(&chan->capture) &&
>> =C2=A0=C2=A0=C2=A0=C2=A0 list_empty(&chan->done))
>> =C2=A0=C2=A0=C2=A0=C2=A0try_to_freeze();
>
> good to freeze when not in middle of the frame capture but why should=20
> we not allow freeze in between captures?
>
> Other drivers do allow freeze in between frame captures.
>
> I guess we can freeze before dequeue for capture and in finish thread=20
> we can freeze after capture done. This also don't need to check for=20
> list_empty with freeze to allow between frame captures.
>
Also if we add check for both lists empty, freeze is not allowed as long=20
as streaming is going on and in case of continuous streaming freeze will=20
never happen.
