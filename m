Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63BCA23D4E5
	for <lists+linux-media@lfdr.de>; Thu,  6 Aug 2020 02:47:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726807AbgHFArQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Aug 2020 20:47:16 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:15777 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727015AbgHFArE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Aug 2020 20:47:04 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f2b52a40002>; Wed, 05 Aug 2020 17:45:24 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 05 Aug 2020 17:47:04 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 05 Aug 2020 17:47:04 -0700
Received: from [10.2.172.190] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 6 Aug
 2020 00:47:03 +0000
Subject: Re: [PATCH v8 08/10] gpu: host1x: mipi: Keep MIPI clock enabled till
 calibration is done
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>, <gregkh@linuxfoundation.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1596469346-937-1-git-send-email-skomatineni@nvidia.com>
 <1596469346-937-9-git-send-email-skomatineni@nvidia.com>
 <20200805134600.GA3351349@ulmo>
 <103efe31-1abc-54f2-6004-490d7bb1b61a@gmail.com>
 <dcd58ae7-58ed-11d1-0e10-7f522b651b30@gmail.com>
 <addb92e5-7c7a-6fba-117d-c7880b2d4597@nvidia.com>
 <ed80bf2f-213f-286a-59b2-fc85e4181b3d@gmail.com>
 <6eede805-80fd-016f-22f8-b6d25f6587af@nvidia.com>
 <1c12e40e-de7f-0599-a941-82760b4c7668@gmail.com>
 <9ef0b875-e826-43e2-207e-168d2081ff6a@nvidia.com>
 <4689cfe9-e7c4-48bf-217f-3a31b59b8bda@nvidia.com>
 <0e78c5ca-c529-1e98-891d-30351c9aae81@gmail.com>
 <b2098a68-d02f-b406-fc57-56e3ff5d8d1a@nvidia.com>
 <309e3b66-9288-91ef-71b4-be73eacbbd62@nvidia.com>
Message-ID: <fde2431a-0585-ac32-ac25-73e198aaa948@nvidia.com>
Date:   Wed, 5 Aug 2020 17:47:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <309e3b66-9288-91ef-71b4-be73eacbbd62@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596674724; bh=W+vdj5lkhs7ny55rBdX510JqVAhR+kOjhVyEBm78Hmk=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=h+SZNub/K/0fUQlgIJT8+3QIt19B+pkGVSh5sOOLbd2DagdV19viFf3vEjx/peROi
         dbWsauFpwQrSYnu3/qkM5e0n48R42EeTSU+kTPYu7fUpTZ/3QpbaqanFHFr91xosqH
         vox2/yPfI9caFJxshF7REmPb5+Efvcc0SYUKaU4gnjllDDReAwbwfenaX4CzDGes/9
         qMfZObUKFxFyh7n/vsji3Li23r69kXyGjiEZob4w+kQ0EKi3OQnuROzaIAfMreVu0q
         fRWDcO3ZQFPI+PaFQRuPNzeugybDdVcoYdGE2Q6Ujn1op9YpJWtMhtBEAXeG6AfPoB
         BNjnUcg+xpJMA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 8/5/20 11:06 AM, Sowjanya Komatineni wrote:
>
> On 8/5/20 10:46 AM, Sowjanya Komatineni wrote:
>>
>> On 8/5/20 10:34 AM, Dmitry Osipenko wrote:
>>> 05.08.2020 20:29, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> ...
>>>> UART_FST_MIPI_CAL is the clock used for calibration logic which is FSM
>>>> that goes thru sequence codes and when done waits for pads to be in
>>>> LP-11 to apply results.
>>>>
>>>> MIPI_CLK is controller gate clock which is also need to be kept=20
>>>> enabled
>>>> as incase if it sees LP-11 it updates registers so its recommended to
>>>> have this clock enabled.
>>>>
>>>> We can cancel_calibration() in CSI only when csi/sensor stream on=20
>>>> fails
>>>> and in which case there will be no LP-11 so we can unconditionally
>>>> disable MIPI_CLK.
>>>>
>>> There is no guarantee that the fail comes before the LP-11. For=20
>>> example,
>>> some odd camera driver may have a complicated enable sequence which may
>>> fail after enabling the hardware streaming.
>>
>> MIPI_CLK to keep enable is for calibration logic to update results,=20
>> but like I said calibration logic uses UART_FST_MIPI_CAL clock. So=20
>> even in case if fail happens from sensor after having pads in LP-11=20
>> then, calibration logic will still be running but result update will=20
>> not happen with clock disabled. But HW will not stuck as this is=20
>> confirmed from HW designer.
>
> If LP-11 happens from sensor stream (followed by fail) and by that=20
> time if calibration FSM is done and if calibration logic sees LP-11=20
> then results will be applied to pads.
>
> We did start of calibration before CSI stream so by the time we do=20
> sensor stream enable, calibration logic might have done with FSM and=20
> waiting for LP-11
>
> Also if we see any special case, we always can use=20
> finish_calibration() instead of cancel_calibration() as well.
>
> finish_calibration() has extra 250ms wait time polling done bit and we=20
> can ignore its return code during fail pathway.
>
Confirmed from HW designer, calibration FSM to finish takes worst case=20
72uS so by the time it gets to sensor stream it will be done its=20
sequence and will be waiting for DONE bit.

So disabling MIPI CAL clock on sensor stream fails is safe.

>>
>>
>>
