Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BE3E1AB007
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 19:48:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2411481AbgDORr7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Apr 2020 13:47:59 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:10983 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2411463AbgDORrw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Apr 2020 13:47:52 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e9748bb0000>; Wed, 15 Apr 2020 10:47:39 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Wed, 15 Apr 2020 10:47:52 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Wed, 15 Apr 2020 10:47:52 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 15 Apr
 2020 17:47:52 +0000
Received: from [10.2.171.241] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 15 Apr
 2020 17:47:51 +0000
Subject: Re: [RFC PATCH v7 6/9] media: tegra: Add Tegra210 Video input driver
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <helen.koike@collabora.com>
CC:     <sboyd@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1586919463-30542-1-git-send-email-skomatineni@nvidia.com>
 <1586919463-30542-7-git-send-email-skomatineni@nvidia.com>
 <4118112f-f865-5460-6319-d71271fd78d1@gmail.com>
 <a69a8b34-beea-3ad0-e08e-f7df8b9e7047@nvidia.com>
 <6afa951e-d904-f3c0-053f-82a02fb18979@nvidia.com>
Message-ID: <b1c78827-13ea-0c94-a575-97b5afc0ede1@nvidia.com>
Date:   Wed, 15 Apr 2020 10:47:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <6afa951e-d904-f3c0-053f-82a02fb18979@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1586972859; bh=XpBvxqSOaLK00KhnfApKv+53mQiolPx3hdWSSyk6dPk=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=haLg/+Du/o7GZJdojnWDi4qzLbjggF33ntcXqUYukQxBxsEtQmzcqFjfWEJAeOBIt
         WxbnSxGh6OOvbcOA01X4DR7OQJ9YjdMirQWmbjFsvTMOrl/uCcIK4yMOF8LQiO2R7J
         QpUsi1UObJW0/07a9e4JjLPSh9naG0hczADD+1n4QEl/aTmwMpV0cosOToHbi7jWso
         KHx4NqzkKJpvee05p1tDXMdc11Br7BzkBRCZIP2MZfZF8Jnq8YRmE/Xgxf4suk5snQ
         V9AYUJfNEF/PkhF0BtrCjVUEtSk7HJoMa13OlzNx4XfXKCaDySN4cRR3sDLTmU1PKR
         fF04mqopYTNKQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/15/20 10:21 AM, Sowjanya Komatineni wrote:
>
> On 4/15/20 9:54 AM, Sowjanya Komatineni wrote:
>>
>> On 4/15/20 7:22 AM, Dmitry Osipenko wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> 15.04.2020 05:57, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> +static int tegra_csi_remove(struct platform_device *pdev)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct tegra_csi *csi =3D platform_get_drvda=
ta(pdev);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 int err;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 err =3D host1x_client_unregister(&csi->clien=
t);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (err < 0) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 dev_err(csi->dev,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "failed to unregister h=
ost1x client: %d\n",=20
>>>> err);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return err;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 pm_runtime_disable(csi->dev);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 kfree(csi);
>>> IIRC, the driver removal is invoked on the unbinding. Hence, I'm not
>>> sure how moving away from the resource-managed API helps here. Could=20
>>> you
>>> please explain in a more details?
>>>
>>> Have you tried to test this driver under KASAN? I suspect that you just
>>> masked the problem, instead of fixing it.
>> Using devm_kzalloc for vi/csi structures based on prior feedback=20
>> request to switch to use kzalloc all over this driver.
>>
>> Hi Hans,
>>
>> video devices lifetime is till video device nodes are released. So,=20
>> v4l2 device release callback does the release of tegra channel=20
>> allocation which hold video device.
>>
>> Below are the 3 possible cases of unbind/unload,
>>
>> 1. during tegra-video module unload, if v4l2 device refcnt is not 0=20
>> which is the case when any of video device node handle is kept opened=20
>> then unloading module will not happen and module refcnt is also=20
>> non-zero and unloading tegra-video module reports module in use.
>>
>> 2. during tegra-video driver unbind, tegra-video driver removal will=20
>> do vi/csi clients exit ops which unregisters video device allocated=20
>> memory during release callback of v4l2 device. vi/csi structure=20
>> allocation remains same as vi/csi driver removal will not happen in=20
>> this case.
>>
>>
>> 3. during direct host1x client drivers vi/csi unbind, both=20
>> host1x_clients vi/csi gets unregistered, deletes host1x logical=20
>> device which executes tegra-video driver removal() -> vi/csi exit()=20
>> before vi/csi memory gets freed in vi/csi driver remove().
>>
>> So, any active streaming will stop and video devices are unregistered=20
>> during direct client driver unbind prior to freeing vi/csi memory.
>>
>> Also vi/csi driver remove does explicit free vi/csi as its allocated=20
>> with kzalloc. So not sure how using kzalloc is different to=20
>> devm_kzalloc for vi/csi structure in terms of when vi/csi memory gets=20
>> freed?
>>
>> Except for channel allocation which holds video device and as video=20
>> device life time is beyond tegra-video module unbind->vi exit(),=20
>> looks like we can use devm_kzalloc for vi/csi.
>>
>>
>> Can you please comment if you still think we need to use kzalloc=20
>> rather than devm_kzalloc for vi/csi structure allocation?
>>
>> Thanks
>>
>> Sowjanya
>>
> One more case is when video device node is kept opened with v4l2-ctl=20
> sleep (rather than streaming), where it will keep device node open for=20
> specified time and if direct vi client driver unbind happens then vi=20
> driver remove() will free vi memory before v4l2 device release happens.
>
> But I don't see any crash or errors with this case.
>
> Also if we allow direct client driver unbind, then vi structure memory=20
> lifetime should also be till v4l2 device release happens.
>
> But we can free vi in v4l2 device release callback as in case when=20
> device node is not kept opened, video device release happens immediate=20
> and we cant free vi that early.

typo fix:

But we can't free vi structure memory allocation in v4l2 device release=20
callback as in case when device node is not kept opened, device release=20
happens immediate and we can't free vi structure memory that early.

>
> Hans/Thierry, Can you please comment on this case?
>
> Thanks
>
> Sowjanya
>
