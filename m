Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03AD71C039F
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2020 19:08:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726666AbgD3RH6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Apr 2020 13:07:58 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:15988 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbgD3RH6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Apr 2020 13:07:58 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5eab05e10000>; Thu, 30 Apr 2020 10:07:45 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 30 Apr 2020 10:07:57 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 30 Apr 2020 10:07:57 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 30 Apr
 2020 17:07:57 +0000
Received: from [10.2.165.152] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 30 Apr
 2020 17:07:56 +0000
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
 <7d31d24f-f353-7e82-3ff9-cdba8b773d1e@nvidia.com>
Message-ID: <06a4a067-8d54-4322-b2a6-14e82eaeda29@nvidia.com>
Date:   Thu, 30 Apr 2020 10:06:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <7d31d24f-f353-7e82-3ff9-cdba8b773d1e@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1588266465; bh=gKejJOxcNXFjey06HQS8SHBbL2xiLFZnrxw6ec+17Pc=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=g1cvV1EjFUY0/YRB8FTfjLGhfHHm+OlcpVnJmROFod9EqiERZm3dQGunHXNaaa8fl
         DF/Dq0Ws62+JbiuUxrlVlJ+20dymwmelZotvcepsenDbGDlHIgUCe54bfLTbMJ+7/l
         IlaPaXafAxEeyizXWpejtN4Pgi79avT6JCrLhoB5qSlKyBg0/RAhGihRt8mAD4uUl2
         uCGe1WOGfa1iHl++TlL24Db/0YvWPtZ0muYKlKPiXBexNGMgvaCL3ZaMv6XQJZwz/H
         7+8GgNF0zRsbMP3iroz+M5ifwNSYV/QV3aBDJt4IaKXfR69KLabjVSiHVTVZEslEEW
         3mwCFW+ABCAAg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/30/20 9:29 AM, Sowjanya Komatineni wrote:
>
> On 4/30/20 9:04 AM, Sowjanya Komatineni wrote:
>>
>> On 4/30/20 7:13 AM, Dmitry Osipenko wrote:
>>> 30.04.2020 17:02, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> 30.04.2020 16:56, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>> 30.04.2020 01:00, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>>> +static int chan_capture_kthread_finish(void *data)
>>>>>> +{
>>>>>> +=C2=A0=C2=A0=C2=A0 struct tegra_vi_channel *chan =3D data;
>>>>>> +=C2=A0=C2=A0=C2=A0 struct tegra_channel_buffer *buf;
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0 set_freezable();
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0 while (1) {
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 try_to_freeze();
>>>>> I guess it won't be great to freeze in the middle of a capture=20
>>>>> process, so:
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (list_empty(&chan->done=
))
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tr=
y_to_freeze();
>>>> And here should be some locking protection in order not race with the
>>>> chan_capture_kthread_start because kthread_finish could freeze before
>>>> kthread_start.
>>> Or maybe both start / finish threads should simply be allowed to freeze
>>> only when both capture and done lists are empty.
>>>
>>> if (list_empty(&chan->capture) &&
>>> =C2=A0=C2=A0=C2=A0=C2=A0 list_empty(&chan->done))
>>> =C2=A0=C2=A0=C2=A0=C2=A0try_to_freeze();
>>
>> good to freeze when not in middle of the frame capture but why should=20
>> we not allow freeze in between captures?
>>
>> Other drivers do allow freeze in between frame captures.
>>
>> I guess we can freeze before dequeue for capture and in finish thread=20
>> we can freeze after capture done. This also don't need to check for=20
>> list_empty with freeze to allow between frame captures.
>>
> Also if we add check for both lists empty, freeze is not allowed as=20
> long as streaming is going on and in case of continuous streaming=20
> freeze will never happen.

Hi Dmitry,

Will update in v12 to not allow freeze in middle of a frame capture.

Can you please confirm on above if you agree to allow freeze to happen=20
in b/w frame captures?

Also as most feedback has been received from you by now, appreciate if=20
you can provide all in this v11 if you have anything else so we will not=20
have any new changes after v12.

Thanks

Sowjanya

