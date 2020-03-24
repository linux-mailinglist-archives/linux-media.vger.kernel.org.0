Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE0F0191BCD
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2020 22:16:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728060AbgCXVQS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Mar 2020 17:16:18 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:6755 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726673AbgCXVQS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Mar 2020 17:16:18 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e7a78930000>; Tue, 24 Mar 2020 14:16:03 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 24 Mar 2020 14:16:17 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 24 Mar 2020 14:16:17 -0700
Received: from [10.2.160.81] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 24 Mar
 2020 21:16:16 +0000
Subject: Re: [RFC PATCH v5 5/9] dt-binding: tegra: Add VI and CSI bindings
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <helen.koike@collabora.com>
CC:     <sboyd@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1584985955-19101-1-git-send-email-skomatineni@nvidia.com>
 <1584985955-19101-6-git-send-email-skomatineni@nvidia.com>
 <2256dc66-f3f9-3400-85e9-0641729b1316@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <b461690f-4e8d-6050-a7cb-fd8148a120de@nvidia.com>
Date:   Tue, 24 Mar 2020 14:16:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <2256dc66-f3f9-3400-85e9-0641729b1316@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1585084564; bh=/PmZVmKwxI7gdmiLP13pL9LDMQHaKdiBL8tBuqunQxk=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=Gs85WCMDANdgZFYdSbJEavGaSKp+kPF/M0PlRlmd3/pJBzLKrO3YnkUJiPmTwhiww
         K+XhXoPawtST0D0lzcXAmIR9zz8/ZnaIcHcPkYJk0/gpIFIagipAsKLue2sUNeZfVK
         kRfJfFLD80GHf8i4iT9RawejrS4CDxExPIXKoYXvbg89pgJyyuBLXOvBupCUMj3IDJ
         IfDNWdSyOy/yNjNrDjh98YilRJs72KQl+NbwiAbgtnMMkySA2lmJoqxcGIsSyqYLSX
         Aw3aCZCmRrpBz4L7bUjS3rPchiZtliQLhudxhczz0BXWEBCcYf3PhWfkPoaWUVCNQB
         knztIXI+vQmSQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 3/24/20 12:20 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 23.03.2020 20:52, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Tegra contains VI controller which can support up to 6 MIPI CSI
>> camera sensors.
>>
>> Each Tegra CSI port from CSI unit can be one-to-one mapper to
>> VI channel and can capture from an external camera sensor or
>> from built-in test pattern generator.
>>
>> This patch adds dt-bindings for Tegra VI and CSI.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>   .../display/tegra/nvidia,tegra20-host1x.txt        | 67 ++++++++++++++=
+++-----
>>   1 file changed, 54 insertions(+), 13 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegr=
a20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,teg=
ra20-host1x.txt
>> index 9999255..9421569 100644
>> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hos=
t1x.txt
>> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hos=
t1x.txt
>> @@ -40,14 +40,25 @@ of the following host1x client modules:
>>
>>     Required properties:
>>     - compatible: "nvidia,tegra<chip>-vi"
>> -  - reg: Physical base address and length of the controller's registers=
.
>> +  - reg: Physical base address and length of the controller registers.
>>     - interrupts: The interrupt outputs from the controller.
>> -  - clocks: Must contain one entry, for the module clock.
>> +  - clocks: Must contain an entry for the module clock "vi"
>>       See ../clocks/clock-bindings.txt for details.
>> -  - resets: Must contain an entry for each entry in reset-names.
>> -    See ../reset/reset.txt for details.
>> -  - reset-names: Must include the following entries:
>> -    - vi
> This should be a wrong change because ARM32 Tegra SoCs do not use power
> domain.

Will update tegra20-host1x.txt to specify power-domains for Tegra210+=20
and to keep reset properties for prior Tegra210.

>> +  - power-domains: Must include venc powergate node as vi is in VE part=
ition.
